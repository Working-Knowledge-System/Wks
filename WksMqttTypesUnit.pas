unit WksMqttTypesUnit;

interface

{$REGION 'Help'}
{
  CONNECTION FLAGS
  ================
  ...


  TOPICS
  ======

  Topic can be anyting, altough this is the common practice

  - try to use only small leters

  - avoid a Leading Forward Slash
    it introduces an unnecessary topic level with a zero character: /myhome/groundfloor/livingroom

  - avoid Spaces and Special Chars, use only printable ASCII chars (32..196)

  System Topics
  -------------
  Topics that start with a $ symbol are reserved for internal MQTT server statistics exposed to clients as information
  These topics are not included in the subscription when using the multi-level wildcard (#)
  Publishing messages to topics starting with $ is not permitted

  examples:

  $/broker/clients/connected      number of clients currently connected to the MQTT broker

  $/broker/clients/disconnected   number of clients that have disconnected from the MQTT broker

  $/broker/clients/total          total number of clients (connected and disconnected) that have interacted with the MQTT broker

  $/broker/messages/sent          count of messages sent by the MQTT broker

  $/broker/uptime                 duration the MQTT broker has been running (in minutes?)

  Normal Topics
  -------------
  Any string of ASCII chars not starting with / and with / as separators for each level

  example:

  myhome/groundfloor/livingroom/temperature
  myhome/groundfloor/livingroom/humidity
  myhome/groundfloor/livingroom/brightness
  myhome/groundfloor/kitchen/temperature
  myhome/groundfloor/kitchen/humidity
  myhome/groundfloor/kitchen/brightness
  myhome/groundfloor/kitchen/refrigerator/temperature


  NOTES
  =====

  the MQTT protocol specifies that the server is supposed to monitor the client’s keep-alive PINGREQ and disconnect it if it doesn’t send the PINGREQ within that period
  but we can implement the server explicitly and periodically send a PINGREQ to ALL connected clients and expect a PINGRESP in return
  if a client fails to respond the server can register the event and close the connection with that client


  This design provides a solid foundation for a complete MQTT 3.1.1 implementation in Delphi

  Indy TCP server automatically handles connections in separate threads
  The server implementation should handle multiple concurrent clients. Consider thread safety in session management

  Session Management: The server should maintain sessions for clients that connect with CleanSession=False
  Retained Messages: The server should store retained messages and deliver them to new subscribers

  Will Message: The client should support specifying a will message in the CONNECT packet
  Keep Alive: Both client and server should monitor connection activity and disconnect inactive clients.

  WordRead and WordWrite handle network byte order (big-endian) conversion using Swap
  MQTT protocol requires all multi-byte values to be big-endian

  Strings are properly encoded/decoded using UTF-8
  Length prefixes are correctly written as 2-byte values
}
{$ENDREGION}

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , System.Math
  , System.Generics.Collections
  , Vcl.StdCtrls
  , Data.Win.ADODB
//  , SynEdit
//  , SynEditTypes
  ;
{$ENDREGION}

{$REGION 'Type'}
type

  {$REGION 'TcpSession'}
  TTCPSessionDataClass = class
  public
    Ip: string;          // clientip
    UId: string;         // connectionuid
    Event: string;       // Connect, Disconnect
    DateTime: TDateTime; // eventdatetime
  end;
  {$ENDREGION}

  {$REGION 'Mqtt'}
  TMqttClass = class
  protected
    FLogStrings: TStrings;
  //FLogSynEdit: TCustomSynEdit;
    FLogVerbose: TCheckBox;
    FLogRawAscii: TCheckBox;
    FLogRawHex: TCheckBox;
    FLogRawChar: TCheckBox;
  protected
    procedure Log(const AStr: string; AWithTime: boolean = true); overload;
    procedure Log(const AFmt: string; AVarRecVec: array of TVarRec; AWithTime: boolean = true); overload;
    procedure Dmp(const AStr: string);
  public
    constructor Create(ALogStrings: TStrings; ALogVerbose, ALogRawAscii, ALogRawHex, ALogRawChar: TCheckBox){; overload}; virtual;
  //constructor Create(ALogSynEdit: TCustomSynEdit; ALogVerbose, ALogRawAscii, ALogRawHex, ALogRawChar: TCheckBox); overload; virtual;

    property LogVerbose : TCheckBox read FLogVerbose  write FLogVerbose ;
    property LogRawAscii: TCheckBox read FLogRawAscii write FLogRawAscii;
    property LogRawHex  : TCheckBox read FLogRawHex   write FLogRawHex  ;
    property LogRawChar : TCheckBox read FLogRawChar  write FLogRawChar ;
  end;
  {$ENDREGION}

  {$REGION 'Protocol'}
  TMqttVersionLevel = 1..5; // 1 = 1.2  2 = 3.0  3 = 3.1  4 = 3.1.1  5 = 5.0

  TMqttVersion = (
    mv12             // 1 = 1.2
  , mv30             // 2 = 3.0
  , mv31             // 3 = 3.1
  , mv311            // 4 = 3.1.1
  , mv50             // 5 = 5.0
  );
  {$ENDREGION}

  {$REGION 'QoS'}
  //TMqttQoS = 0..2;

  TMqttQoSType = (
    qostAT_MOST_ONCE  = 0 // QoS 0 = fire and forget
  , qostAT_LEAST_ONCE = 1 // QoS 1 = at least once delivery (PUBACK required)
  , qostEXACTLY_ONCE  = 2 // QoS 2 = exactly once delivery (PUBREC, PUBREL, PUBCOMP sequence)
  );
  {$ENDREGION}

  {$REGION 'Message'}
  TMqttMessageRec = record {TMqttApplicationMessage}
    DupFlag: boolean;
    QoS: TMqttQoSType;
    Retain: boolean;
    TopicName: string;
    PacketIdentifier: word;
    ApplicationMessage: TBytes;
  end;

  TMqttMessageInFlight = class
    PacketID: Word;
    Message: TMqttMessageRec;
    Timestamp: TDateTime;
    RetryCount: Integer;
  end;

  // basic message event type (used in both client and server)
  TOnMQTTMessage = reference to procedure(const ATopicName: string; const AApplicationMessage: TBytes; AQoSLevel: TMqttQOSType; ARetain: boolean);
  {$ENDREGION}

  {$REGION 'Packet'}
{
   -----------------------------------------------------------   -------------   -------------
  |                FIXED HEADER (2..5 bytes)                  | | VAR. HEADER | |  PAY LOAD   |
  |-----------------------------------------------------------| |             | |             |
  | CTRL BYTE |                 REMAINING LEN                 | |  0-N bytes  | |  0-M bytes  |
  |-----------|-----------------------------------------------| |<----------->| |<----------->|
  |type | flgs|                                               | |             | |             |
  |-----------|-----------------------------------------------| |             | |             |
  | byte 0    | byte 1    | byte 2    | byte 3    | byte 4    | | byte 5..    | | byte 5+N... |
  |-----------|-----------|-----------|-----------|-----------| |-------------| |-------------|
  | 0000 0000 | 0000 0000 |           |           |           | |             | |             |
  |         0 |         0 |           |           |           | |             | |             |
  |       $00 |       $00 |           |           |           | |             | |             |
  |         . |         . |           |           |           | |             | |             |
   -----------------------------------------------------------   -------------   -------------

   fixed header is always present
   variable header is present in some commands (CONNECT, ...)
   payload is present in some commands (CONNECT, ...)
}

  TMqttPacketType = (
  // Commant                            ControlByte
  //                dec      hex  asc   type + flags  Direction           Description
  // -----------------------------------------------------------------------------------------------------------------------------------------
    ptRESERVED    = 0   //   $00        0000   0000   forbidden           reserved
                        //
  , ptCONNECT     = 1   //   $10        0001   0000   Client -> Broker    client request a connection to broker
  , ptCONNACK     = 2   //   $20  ' '   0010   0000   Broker -> Client    broker reply with a connection acknowledgement
                        //
  , ptPUBLISH     = 3   //   $30   0    0011   0000   Client <-> Broker   client/broker request to publish a message
  , ptPUBACK      = 4   //   $40   @    0100   0000   Broker <-> Client   broker/client reply with a publish acknowledgement
  , ptPUBREC      = 5   //   $50   P    0101   0000   Broker <-> Client   broker/client reply with a publish received (assure delivery part 1)
  , ptPUBREL      = 6   //   $60   `    0110   0000   Broker <-> Client   broker/client reply with a publish released (assure delivery part 2)
  , ptPUBCOMP     = 7   //   $70   p    0111   0000   Broker <-> Client   broker/client reply with a publish complete (assure delivery part 3)
                        //
  , ptSUBSCRIBE   = 8   //   $80        1000   0000   Client -> Broker    client request to subscribe to a topic
  , ptSUBACK      = 9   //   $90        1001   0000   Broker -> Client    broker reply with a subscribe acknowledgement
  , ptUNSUBSCRIBE = 10  //   $A0        1010   0000   Client -> Broker    client request to unsubscribe from a topic
  , ptUNSUBACK    = 11  //   $B0   °    1011   0000          Broker -> Client    broker reply with a unsubscribe acknowledgement
                        //
  , ptPINGREQ     = 12  //   $C0   À    1100   0000   Client -> Broker    client request a ping
  , ptPINGRESP    = 13  //   $D0   Ð    1101   0000   Broker -> Client    broker reply with a pong
                        //
  , ptDISCONNECT  = 14  //   $E0   à    1110   0000   Client -> Broker    client request  to disconnect
                        //
  , ptRESERVED2   = 15  //   $F0   ð    1111   0000   forbidden           reserv
  );

  TMqttPacketClass = class
  private
    FStream: TMemoryStream;
    function  LenGet: integer;
    function  AsAsciiGet: string;
    function  AsHexGet: string;
    function  AsCharGet: string;
    function  DumpGet: string; {virtual;}
  public
    constructor Create;
    destructor Destroy; override;

    procedure StreamFromBytes(ABytes: TBytes);
    function  ByteRead: byte;
    procedure ByteWrite(AByte: byte);
    function  BytesRead(ALength: integer): TBytes;
    procedure BytesWrite(const ABytes: TBytes);
    function  WordRead: word;
    procedure WordWrite(AWord: word);
    function  StringRead: string;
    function  StringReadLen(ALength: integer): string;
    procedure StringWrite(const AString: string);
    function  RemainingLengthRead: integer;
    procedure RemainingLengthWrite(ALength: integer);
    function  MessageRead: TMqttMessageRec;
    procedure MessageWrite(const AMessage: TMqttMessageRec);

    property Stream: TMemoryStream read FStream;
    property Len: integer          read LenGet;
    property AsAscii: string       read AsAsciiGet; // asciicode
    property AsHex: string         read AsHexGet;
    property AsChar: string        read AsCharGet;
    property Dump: string          read DumpGet; // return the stream layed out like a hex editor
  end;
  {$ENDREGION}

  {$REGION 'Connect'}
  TMqttConnectReturnCode = (
    conrcCONNECTION_ACCEPTED      = 0 // Connection Accepted
  , conrcUNACCEPTABLE_PROTOCOL    = 1 // Connection Refused: unacceptable protocol version
  , conrcIDENTIFIER_REJECTED      = 2 // Connection Refused: identifier rejected
  , conrcSERVER_UNAVAILABLE       = 3 // Connection Refused: server unavailable
  , conrcBAD_USERNAME_OR_PASSWORD = 4 // Connection Refused: bad user name or password
  , conrcNOT_AUTHORIZED           = 5 // Connection Refused: not authorised
                                      // 6-255 Reserved for future use
  );

  TMqttConnectFlags = packed record
    CleanSession: boolean;
    WillFlag: boolean;
    WillQoS: TMqttQoSType;
    WillRetain: boolean;
    PasswordFlag: boolean;
    UsernameFlag: boolean;
  public
    procedure FromByte(AByte: byte);
    function  ToByte: byte;
  end;

  TMqttConnectPacketRec = {class(TMqttPacketClass)}record
  {private}
    PacketType: TMqttPacketType;
    RemainingLength: byte;
    ProtocolName: string; // MQTT (fixed)
    ProtocolLevel: byte;  // 4 (3.1.1)
    ConnectFlags: TMqttConnectFlags;
    KeepAlive: word;
    ClientIdentifier: string;
    WillTopic: string;
    WillMessage: string;
    Username: string;
    Password: string;
    function  DumpGet: string; {override;}
  public
    procedure LoadFromData(const AData: TBytes);
    property Dump: string read DumpGet;
  end;
  {$ENDREGION}

  {$REGION 'Pingreq'}
  TMqttPingreqReturnCode = (
    pingreqrcPINGREQ_ACCEPTED = 0
  );

  TMqttPingreqPacketRec = record
    PacketType: TMqttPacketType;
    RemainingLength: byte;
    function  DumpGet: string;
  public
    property Dump: string read DumpGet;
  end;
  {$ENDREGION}

  {$REGION 'Publish'}
  TMqttPublishReturnCode = (
    publishrcPUBLISH_ACCEPTED = 0
  );

  TMqttPublishFlags = packed record
    DupFlag: boolean;
    QoSLevel: TMqttQoSType;
    Retain: boolean;
  public
    procedure FromByte(AByte: byte);
    function  ToByte: byte;
  end;

  TMqttPublishPacketRec = record
    PacketType: TMqttPacketType;
    RemainingLength: byte;
    PublishFlags: TMqttPublishFlags;
    TopicName: string;
    PacketIdentifier: word;
    ApplicationMessage: string;
    function  DumpGet: string;
  public
    property Dump: string read DumpGet;
  end;
  {$ENDREGION}

  {$REGION 'Subscribe'}
  TMqttSubscribeReturnCode = (
    subscribercSUBSCRIBE_ACCEPTED = 0
  );

  TMqttSubscribeTopicRec = record
    TopicFilter: string;
    RequestedQoS: TMqttQoSType;
  end;

  TMqttSubscribeTopicRecVec = array of TMqttSubscribeTopicRec;

  TMqttSubscribePacketRec = record
    PacketType: TMqttPacketType;
    RemainingLength: byte;
    PacketIdentifier: word;
    SubscribeTopicRecVec: TMqttSubscribeTopicRecVec;
    function  DumpGet: string;
  public
    property Dump: string read DumpGet;
  end;
  {$ENDREGION}

  {$REGION 'Unsubscribe'}
  TMqttUnsubscribeReturnCode = (
    unsubscribercUNSUBSCRIBE_ACCEPTED = 0
  );

  TMqttUnsubscribeTopicRec = record
    TopicFilter: string;
  end;

  TMqttUnsubscribeTopicRecVec = array of TMqttUnsubscribeTopicRec;

  TMqttUnsubscribePacketRec = record
    PacketType: TMqttPacketType;
    RemainingLength: byte;
    PacketIdentifier: word;
    UnsubscribeTopicRecVec: TMqttUnsubscribeTopicRecVec;
    function  DumpGet: string;
  public
    property Dump: string read DumpGet;
  end;
  {$ENDREGION}

  {$REGION 'Disconnect'}
  TMqttDisconnectReturnCode = (
    disconrcDISCONNECTION_ACCEPTED = 0
  , disconrcSERVER_STOPPING        = 1
  , disconrcCLIENT_DISCONNECTED    = 2
  );

  TMqttDisconnectPacketRec = record
    PacketType: TMqttPacketType;
    RemainingLength: byte;
    function  DumpGet: string;
  public
    property Dump: string read DumpGet;
  end;
  {$ENDREGION}

  {$REGION 'StreamDecoder'}
  TMqttStreamDecoder = class
  private
    FBuffer: TBytes;
    //FOffset: Integer;
    //procedure BufferCompact;
  public
    procedure DataAppend(const ABytes: TBytes);
    function  PacketTryExtract(out APacket: TBytes): boolean;
  end;
  {$ENDREGION}

  {$REGION 'Session'}
  TMqttSessionDataClass = class
  private
    FClientIp: string;
    FClientIdentifier: string;
    FCleanSession: boolean;
    FSubscriptions: TList<TMqttSubscribeTopicRec>;
    FInFlightQoS1: TObjectDictionary<Word, TMqttMessageInFlight>;
    FInFlightQoS2: TObjectDictionary<Word, TMqttMessageInFlight>;
    FMessageQueue: TList<TMqttMessageRec>;
    FPacketIdNext: word;
    FLastContact: TDateTime;
    FWillMessage: TMqttMessageRec;
    function PacketIdGenerate: word;
  public
    constructor Create(const AClientIdentifier: string; ACleanSession: boolean);
    destructor Destroy; override;

    procedure LastContactUpdate;
    function  SubscriptionAdd(const ATopicFilter: string; AQoS: TMqttQoSType): boolean;
    procedure SubscriptionRemove(const ATopicFilter: string);
    function  SubscriptionExists(const ATopicFilter: string): boolean;
    procedure MessageQueue(const AMessage: TMqttMessageRec);
    function  MessageDequeue: TMqttMessageRec;

    property ClientIdentifier: string                                    read FClientIdentifier;
    property CleanSession: boolean                                       read FCleanSession;
    property Subscriptions: TList<TMqttSubscribeTopicRec>                read FSubscriptions;
    property LastContact: TDateTime                                      read FLastContact;
    property WillMessage: TMqttMessageRec                                read FWillMessage write FWillMessage;
    property InFlightQoS1: TObjectDictionary<Word, TMqttMessageInFlight> read FInFlightQoS1;
    property InFlightQoS2: TObjectDictionary<Word, TMqttMessageInFlight> read FInFlightQoS2;
  end;
  {$ENDREGION}

  {$REGION 'LogWorker'}
  TMqttLogWorker = class(TThread)
  private
    FDataList: TThreadList<TTCPSessionDataClass>;
    FConn: TADOConnection;
    procedure FlushToDb;
  protected
    procedure Execute; override;
  public
    constructor Create(AConn: TADOConnection);
    destructor Destroy; override;
    procedure Enqueue(const ATCPSessionDataClass: TTCPSessionDataClass);
  end;
  {$ENDREGION}

{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    WksMqttUtilsUnit
  ;
{$ENDREGION}

{$REGION 'TMqttClass'}
constructor TMqttClass.Create(ALogStrings: TStrings; ALogVerbose, ALogRawAscii, ALogRawHex, ALogRawChar: TCheckBox);
begin
  FLogStrings  := ALogStrings;
//FLogSynEdit  := ALogSynEdit;
  FLogVerbose  := ALogVerbose;
  FLogRawAscii := ALogRawAscii;
  FLogRawHex   := ALogRawHex;
  FLogRawChar  := ALogRawChar;
end;

procedure TMqttClass.Log(const AStr: string; AWithTime: boolean);
var
  sls: TStringList;
begin
  // exit
  if not Assigned(FLogStrings) then
    Exit;

  // log
  TThread.Synchronize(nil
//TThread.Queue(TThread.CurrentThread
  , procedure
    begin
      FLogStrings.BeginUpdate;
      try
        if AWithTime then
          FLogStrings.Add(FormatDateTime('dd hh:nn:ss zzz : ', Now) + AStr)
        else begin
          sls := TStringList.Create;
          try
            sls.Text := AStr; // this splits the text into lines
            FLogStrings.AddStrings(sls);
          finally
            sls.Free;
          end;
        end;
//        FLogSynEdit.CaretXY := BufferCoord(1, FLogSynEdit.Lines.Count);
//        FLogSynEdit.EnsureCursorPosVisible;
      finally
        FLogStrings.EndUpdate;
      end;
    end
  );
end;

procedure TMqttClass.Log(const AFmt: string; AVarRecVec: array of TVarRec; AWithTime: boolean);
begin
  Log(Format(AFmt, AVarRecVec), AWithTime);
end;

procedure TMqttClass.Dmp(const AStr: string);
begin
  Log(AStr, false);
end;
{$ENDREGION}

{$REGION 'TMqttSession'}
{
  Tracks client-specific state including subscriptions and queued messages
  Manages both QoS 1 and QoS 2 in-flight messages
  Handles client's will message

  Subscription Management:
  Add/remove topic filters with QoS levels
  Checks for existing subscriptions
  Maintains list of active subscriptions

  Message Queueing:
  Stores undelivered messages for disconnected clients (when CleanSession=False)
  Queues messages with QoS > 0 for later delivery

  Packet ID Generation:
  Unique packet ID generation for each client session
  Automatic rollover handling (0 is not a valid packet ID)

  In-Flight Message Tracking:
  Separate dictionaries for QoS 1 and QoS 2 messages
  Tracks retry counts and timestamps for message retransmission

  Connection Monitoring:
  Last contact timestamp for keep-alive management
  Automatic session cleanup based on connection state
}
constructor TMqttSessionDataClass.Create(const AClientIdentifier: string; ACleanSession: boolean);
begin
  FClientIdentifier := AClientIdentifier;
  FCleanSession     := ACleanSession;
  FSubscriptions    := TList<TMqttSubscribeTopicRec>.Create;
  FMessageQueue     := TList<TMqttMessageRec>.Create;
  FInFlightQoS1     := TObjectDictionary<Word, TMqttMessageInFlight>.Create([doOwnsValues]);
  FInFlightQoS2     := TObjectDictionary<Word, TMqttMessageInFlight>.Create([doOwnsValues]);
  FPacketIdNext     := 1;
  FLastContact      := Now;
end;

destructor TMqttSessionDataClass.Destroy;
begin
  FSubscriptions.Free;
  FMessageQueue.Free;
  FInFlightQoS1.Free;
  FInFlightQoS2.Free;

  inherited;
end;

procedure TMqttSessionDataClass.MessageQueue(const AMessage: TMqttMessageRec);
begin
  // only queue messages with QoS > 0 for persistent sessions
  if not FCleanSession and (AMessage.QoS > qostAT_MOST_ONCE) then
    FMessageQueue.Add(AMessage);
end;

function  TMqttSessionDataClass.MessageDequeue: TMqttMessageRec;
begin
  if FMessageQueue.Count > 0 then begin
    Result := FMessageQueue[0];
    FMessageQueue.Delete(0);
  end else
    raise Exception.Create('No messages in queue');
end;

function  TMqttSessionDataClass.SubscriptionExists(const ATopicFilter: string): boolean;
var
  i: integer;
begin
  for i := 0 to FSubscriptions.Count - 1 do
    if SameText(FSubscriptions[i].TopicFilter, ATopicFilter) then
      Exit(true);
  Result := false;
end;

function  TMqttSessionDataClass.SubscriptionAdd(const ATopicFilter: string; AQoS: TMqttQoSType): boolean;
var
  i: integer;
  sub: TMqttSubscribeTopicRec;
begin
  Result := false;

  // if subscription exist update its QoS and exit
  for i := 0 to FSubscriptions.Count - 1 do begin
    if SameText(FSubscriptions[i].TopicFilter, ATopicFilter) then begin
      sub := FSubscriptions[i];
      sub.RequestedQoS := AQoS;
      FSubscriptions[i] := sub;
      Exit(true);
    end;
  end;

  // otherwise add a new subscription
  sub.TopicFilter := ATopicFilter;
  sub.RequestedQoS := AQoS;
  FSubscriptions.Add(sub);
  Result := true;
end;

procedure TMqttSessionDataClass.SubscriptionRemove(const ATopicFilter: string);
var
  i: integer;
begin
  for i := FSubscriptions.Count - 1 downto 0 do
    if SameText(FSubscriptions[i].TopicFilter, ATopicFilter) then
      FSubscriptions.Delete(i);
end;

function  TMqttSessionDataClass.PacketIdGenerate: word;
begin
  Result := FPacketIdNext;
  Inc(FPacketIdNext);
  if FPacketIdNext = 0 then
    Inc(FPacketIdNext);
end;

procedure TMqttSessionDataClass.LastContactUpdate;
begin
  FLastContact := Now;
end;
{$ENDREGION}

{$REGION 'TMqttPacketClass'}
constructor TMqttPacketClass.Create;
begin
  FStream := TMemoryStream.Create;
end;

destructor TMqttPacketClass.Destroy;
begin
  FStream.Free;

  inherited;
end;

function  TMqttPacketClass.DumpGet: string;
begin
  Result := '<not implemented>';
end;

procedure TMqttPacketClass.StreamFromBytes(ABytes: TBytes);
begin
  Stream.WriteBuffer(ABytes[0], Length(ABytes));
  Stream.Position := 0;
end;

function  TMqttPacketClass.ByteRead: byte;
begin
  FStream.Read(Result, SizeOf(Byte));
end;

procedure TMqttPacketClass.ByteWrite(AByte: byte);
begin
  FStream.Write(AByte, SizeOf(Byte));
end;

function  TMqttPacketClass.BytesRead(ALength: integer): TBytes;
begin
  // dynamically allocates the result buffer
  SetLength(Result, ALength);
  if ALength > 0 then
    FStream.Read(Result[0], ALength);
end;

procedure TMqttPacketClass.BytesWrite(const ABytes: TBytes);
begin
  // efficiently writes byte arrays without copying
  if Length(ABytes) > 0 then
    FStream.Write(ABytes[0], Length(ABytes));
end;

function  TMqttPacketClass.WordRead: word;
begin
  FStream.Read(Result, SizeOf(Word));
  Result := Swap(Result); // *** MQTT uses big-endian (network byte order) ***
end;

procedure TMqttPacketClass.WordWrite(AWord: word);
begin
  AWord := Swap(AWord); // *** convert to big-endian ***
  FStream.Write(AWord, SizeOf(Word));
end;

function  TMqttPacketClass.StringRead: string; // *** DUPLICATE in StrUTF8FromStreamRead ***
var
  len: word;
  bytes: TBytes;
begin
  len := WordRead;

  if len > 0 then begin
    bytes := BytesRead(len);
    try
      Result := TEncoding.UTF8.GetString(bytes);
    except
      on e: Exception do
        Result := Format('ERROR: %s (%s)', [e.Message,  HexFromBytes(bytes)]);
    end;
  end else
    Result := '';
end;

function  TMqttPacketClass.StringReadLen(ALength: integer): string;
var
  bytes: TBytes;
begin
  bytes := BytesRead(ALength);
  try
    Result := TEncoding.UTF8.GetString(bytes);
  except
    on e: Exception do
      Result := Format('ERROR: %s (%s)', [e.Message,  HexFromBytes(bytes)]);
  end;
end;

procedure TMqttPacketClass.StringWrite(const AString: string);
var
  len: word;
  bytes: TBytes;
begin
  bytes := TEncoding.UTF8.GetBytes(AString);
  len := Length(bytes);
  WordWrite(len);
  BytesWrite(bytes);
end;

function  TMqttPacketClass.RemainingLengthRead: integer;
var
  digit: byte;
  multiplier, bytesread: integer;
begin
  Result := 0;
  bytesread := 0;
  multiplier := 1;
  repeat
    if bytesread >= 4 then
      raise Exception.Create('malformed RemainingLength (too many bytes)');

    digit := ByteRead;
    Inc(bytesread);

    Result := Result + (digit and 127) * multiplier;
    multiplier := multiplier * 128;
  until (digit and 128) = 0;
end;

procedure TMqttPacketClass.RemainingLengthWrite(ALength: integer);
var
  digit: byte;
begin
  // exit
  if ALength < 0 then
    raise Exception.Create('remaining length cannot be negative');
  if ALength >= Power(2, 28) then
    raise Exception.Create('remaining length is to big');

  // case for zero length
//  if ALength = 0 then begin
//    ByteWrite(0);
//    Exit;
//  end;

  // for non-zero lengths
  repeat
    digit := ALength mod 128;
    ALength := ALength div 128;
    if ALength > 0 then
      digit := digit or $80;
    ByteWrite(digit);
  until ALength = 0;
end;

function  TMqttPacketClass.MessageRead: TMqttMessageRec;
var
  fixedheader: byte;
  remaininglength: integer;
  packettype: TMqttPacketType;
  qosbyte: byte;
begin
  FStream.Position := 0;
  fixedheader := ByteRead;
  packettype := TMqttPacketType((FixedHeader and $F0) shr 4);

  case packettype of
    ptPUBLISH: begin
      // remaininglength
      remaininglength := RemainingLengthRead;

      // topicname
      Result.TopicName := StringRead;

      // qos
      qosbyte := (FixedHeader and $06) shr 1;
      Result.QoS := TMqttQOSType(qosbyte);

      // qos
      if Result.QoS > qostAT_MOST_ONCE then
        Result.PacketIdentifier := WordRead;

      // payload
      SetLength(Result.ApplicationMessage, RemainingLength - (FStream.Position - 1));
      if Length(Result.ApplicationMessage) > 0 then
        FStream.Read(Result.ApplicationMessage[0], Length(Result.ApplicationMessage));
    end;

    // handle other packet types...

    else
      raise Exception.Create('Unsupported packet type in MessageRead');
  end;
end;

procedure TMqttPacketClass.MessageWrite(const AMessage: TMqttMessageRec);
var
  fixedheader: byte;
  remaininglength: integer;
  variableheadersize: integer;
begin
  FStream.Clear;

  // fixedheader
  fixedheader := Byte(ptPUBLISH) shl 4;

  // retainmessage
  if AMessage.Retain then
    fixedheader := fixedheader or $01;

  // qos
  fixedheader := fixedheader or (Byte(AMessage.QoS) shl 1);

  // duplicaredmessage
  if AMessage.DupFlag then
    fixedheader := fixedheader or $08;

  // fixedheaderwrite
  ByteWrite(fixedheader);

  // remaininglength
  variableheadersize := 2 + Length(AMessage.TopicName) + IfThen(AMessage.QoS > qostAT_MOST_ONCE, 2, 0);
  remaininglength := variableheadersize + Length(AMessage.ApplicationMessage);
  RemainingLengthWrite(remaininglength);

  // variableheader
  StringWrite(AMessage.TopicName);
  if AMessage.QoS > qostAT_MOST_ONCE then
    WordWrite(AMessage.PacketIdentifier);

  // payload
  if Length(AMessage.ApplicationMessage) > 0 then
    FStream.Write(AMessage.ApplicationMessage[0], Length(AMessage.ApplicationMessage));
end;

function  TMqttPacketClass.LenGet: integer;
begin
  Result := FStream.Size;
end;

function  TMqttPacketClass.AsAsciiGet: string;
begin
  Result := AsciiFromStream(FStream);
end;

function  TMqttPacketClass.AsHexGet: string;
begin
  Result := HexFromStream(FStream);
end;

function  TMqttPacketClass.AsCharGet: string;
begin
  Result := CharFromStream(FStream);
end;
{$ENDREGION}

{$REGION 'TMqttConnectFlags'}
procedure TMqttConnectFlags.FromByte(AByte: byte);
begin
  CleanSession :=              (AByte and $02) <>  0;
  WillFlag     :=              (AByte and $04) <>  0;
  WillQoS      := TMqttQoSType((AByte and $18) shr 3);
  WillRetain   :=              (AByte and $20) <>  0;
  PasswordFlag :=              (AByte and $40) <>  0;
  UsernameFlag :=              (AByte and $80) <>  0;
end;

function TMqttConnectFlags.ToByte: byte;
begin
  Result := 0;
end;
{$ENDREGION}

{$REGION 'TMqttConnectPacket'}
function  TMqttConnectPacketRec.DumpGet: string;
begin
  Result        := Format('Packet Type:         %d', [Byte(PacketType)])
  + sLineBreak   + Format('Remaining Length:    %d', [RemainingLength])
  + sLineBreak   + Format('Protocol Name:       %s', [ProtocolName])
  + sLineBreak   + Format('Protocol Level:      %d', [ProtocolLevel])
  + sLineBreak   + Format('Client Identifier:   %s', [ClientIdentifier])
  + sLineBreak   + Format('Will Flag:           %s', [BoolToStr(ConnectFlags.WillFlag    , true)])
  + sLineBreak   + Format('Will QoS:            %d', [integer(ConnectFlags.WillQoS)])
  + sLineBreak   + Format('Will Retain:         %s', [BoolToStr(ConnectFlags.WillRetain  , true)])
  + sLineBreak   + Format('Username Flag:       %s', [BoolToStr(ConnectFlags.UsernameFlag, true)])
  + sLineBreak   + Format('Password Flag:       %s', [BoolToStr(ConnectFlags.PasswordFlag, true)])
  + sLineBreak   + Format('Clean Session:       %s', [BoolToStr(ConnectFlags.CleanSession, true)])
  + sLineBreak   + Format('Keep Alive:          %d', [KeepAlive]);
  if ConnectFlags.WillFlag then begin
    Result := Result
    + sLineBreak + Format('Will Topic:          %s', [WillTopic])
    + sLineBreak + Format('Will Message:        %s', [WillMessage]);
  end;
  if ConnectFlags.UsernameFlag then
    Result := Result
    + sLineBreak + Format('Username:            %s', [Username]);
  if ConnectFlags.PasswordFlag then
    Result := Result
    + sLineBreak + Format('Password:            %s', [Password]);
end;

procedure TMqttConnectPacketRec.LoadFromData(const AData: TBytes);
var
  stream: TMemoryStream;
  flags: byte;
begin
  stream := TMemoryStream.Create;
  try
    stream.WriteBuffer(AData[2], Length(AData) - 2);
    stream.Position := 0;

  //PacketType :=;
  //RemainingLength :=;

    ProtocolName := StrFromStreamRead(stream);
    stream.ReadBuffer(ProtocolLevel, 1);
    stream.ReadBuffer(flags, 1);

    ConnectFlags.CleanSession :=              (flags and $02) <>  0;
    ConnectFlags.WillFlag     :=              (flags and $04) <>  0;
    ConnectFlags.WillQoS      := TMqttQoSType((flags and $18) shr 3);
    ConnectFlags.WillRetain   :=              (flags and $20) <>  0;
    ConnectFlags.PasswordFlag :=              (flags and $40) <>  0;
    ConnectFlags.UsernameFlag :=              (flags and $80) <>  0;

    stream.ReadBuffer(KeepAlive, 2);
    KeepAlive := Swap(KeepAlive);

    ClientIdentifier := StrFromStreamRead(stream);

    if ConnectFlags.WillFlag then begin
      WillTopic   := StrFromStreamRead(stream);
      WillMessage := StrFromStreamRead(stream);
    end;

    if ConnectFlags.UsernameFlag then
      Username := StrFromStreamRead(stream);

    if ConnectFlags.PasswordFlag then
      Password := StrFromStreamRead(stream);
  finally
    stream.Free;
  end;
end;
{$ENDREGION}

{$REGION 'TMqttPingreqPacketRec'}
function TMqttPingreqPacketRec.DumpGet: string;
begin
  Result        := Format('Packet Type:         %d', [Byte(PacketType)])
  + sLineBreak   + Format('Remaining Length:    %d', [RemainingLength]);
end;
{$ENDREGION}

{$REGION 'TMqttPublishFlags'}
procedure TMqttPublishFlags.FromByte(AByte: byte);
begin
  DupFlag      :=              (AByte and $08) <>  0;
  QoSLevel     := TMqttQoSType((AByte and $06) shr 1);
  Retain       :=              (AByte and $01) <>  0;
end;

function TMqttPublishFlags.ToByte: byte;
begin
  Result := 0; // 0000 xxxx
end;
{$ENDREGION}

{$REGION 'TMqttPublishPacketRec'}
function TMqttPublishPacketRec.DumpGet: string;
begin
  Result        := Format('Packet Type:         %d', [Byte(PacketType)])
  + sLineBreak   + Format('Remaining Length:    %d', [RemainingLength])
  + sLineBreak   + Format('Dup Flag:            %s', [BoolToStr(PublishFlags.DupFlag, true)])
  + sLineBreak   + Format('QoS Level:           %d', [integer(PublishFlags.QoSLevel)])
  + sLineBreak   + Format('Retain:              %s', [BoolToStr(PublishFlags.Retain, true)])
  + sLineBreak   + Format('Topic Name:          %s', [TopicName])
  + sLineBreak   + Format('Packet Identifier:   %d', [PacketIdentifier])
  + sLineBreak   + Format('Application Message: %s', [ApplicationMessage]);
end;
{$ENDREGION}

{$REGION 'TMqttSubscribePacketRec'}
function TMqttSubscribePacketRec.DumpGet: string;
begin
  Result        := Format('Packet Type:         %d', [Byte(PacketType)])
  + sLineBreak   + Format('Remaining Length:    %d', [RemainingLength]);
end;
{$ENDREGION}

{$REGION 'TMqttUnsubscribePacketRec'}
function TMqttUnsubscribePacketRec.DumpGet: string;
begin
  Result        := Format('Packet Type:         %d', [Byte(PacketType)])
  + sLineBreak   + Format('Remaining Length:    %d', [RemainingLength]);
end;
{$ENDREGION}

{$REGION 'TMqttDisconnectPacketRec'}
function TMqttDisconnectPacketRec.DumpGet: string;
begin
  Result        := Format('Packet Type:         %d', [Byte(PacketType)])
  + sLineBreak   + Format('Remaining Length:    %d', [RemainingLength]);
end;
{$ENDREGION}

{$REGION 'TMqttStreamDecoder'}
//procedure TMqttStreamDecoder.DataAppend(const ABytes: TBytes);
//var
//  newlen: integer;
//begin
//  newlen := Length(FBuffer) - FOffset + Length(ABytes);
//  SetLength(FBuffer, newlen);
//  Move(FBuffer[FOffset], FBuffer[0], newlen - Length(ABytes));
//  Move(ABytes[0], FBuffer[newlen - Length(ABytes)], Length(ABytes));
//  FOffset := 0;
//end;

//procedure TMqttStreamDecoder.BufferCompact;
//var
//  validlen: integer;
//begin
//  validlen := Length(FBuffer) - FOffset;
//  if validlen > 0 then
//    Move(FBuffer[FOffset], FBuffer[0], validlen);
//  SetLength(FBuffer, validlen);
//  FOffset := 0;
//end;

//procedure TMqttStreamDecoder.DataAppend(const ABytes: TBytes);
//var
//  taillen, oldlen, newlen: integer;
//begin
//  BufferCompact;
//
//  taillen := Length(FBuffer) - FOffset;
//  oldlen := Length(ABytes);
//  newlen := TailLen + oldlen;
//
//  SetLength(FBuffer, newlen);
//
//  if taillen > 0 then
//    Move(FBuffer[FOffset], FBuffer[0], taillen);
//
//  Move(ABytes[0], FBuffer[taillen], oldlen);
//  FOffset := 0;
//end;

procedure TMqttStreamDecoder.DataAppend(const ABytes: TBytes);
var
  startlen: integer;
begin
  startlen := Length(FBuffer);
  SetLength(FBuffer, startlen + Length(ABytes));
  Move(ABytes[0], FBuffer[startlen], Length(ABytes));
end;

function TMqttStreamDecoder.PacketTryExtract(out APacket: TBytes): boolean;
var
  i, remlen, multiplier, lenlen, totallen: integer;
  encbyte: byte;
begin
  Result := false;

  if Length(FBuffer) {- FOffset} < 2 then
    Exit;

  i := {FOffset +} 1;
  RemLen := 0;
  Multiplier := 1;
  LenLen := 0;

//  try
    repeat
      if i >= Length(FBuffer) then
        Exit;
      encbyte := FBuffer[i];
      Inc(lenlen);
      Inc(i);
      remlen := remlen + (encbyte and 127) * multiplier;
      multiplier := multiplier * 128;

//      if Multiplier > 128 * 128 * 128 then begin
//        AFbk := 'Malformed Remaining Length in MQTT packet';
//        Exit;
//      end;
    until (encbyte and 128) = 0;

    totallen := 1 + lenlen + remlen;

    if {FOffset +} TotalLen > Length(FBuffer) then begin
//      AFbk := 'Malformed Remaining Length in MQTT packet';
      Exit;
    end;

    SetLength(APacket, totallen);
    Move(FBuffer[{FOffset}0], APacket[0], totallen);
  //  Inc(FOffset, totallen);

    Delete(FBuffer, 0, totallen);

    Result := true;
//  except
//    on e: Exception do begin
//      AFbk := 'Error decoding MQTT packet: ' + e.Message;
//      Exit;
//    end;
//  end;
end;
{$ENDREGION}

{$REGION 'TMqttLogWorker'}
constructor TMqttLogWorker.Create(AConn: TADOConnection);
begin
  inherited Create(true);   // do NOT run immediately, it must be started manually
  FreeOnTerminate := false; // must be free manually after termination

  // init
  FDataList := TThreadList<TTCPSessionDataClass>.Create;
  FConn := AConn;
end;

destructor TMqttLogWorker.Destroy;
begin
  // terminate
  Terminate; // set Terminated := true so ensure exit from while loop and any pending logs are flushed
  WaitFor;

  // list
  FDataList.Free;

  inherited;
end;

procedure TMqttLogWorker.Enqueue(const ATCPSessionDataClass: TTCPSessionDataClass);
begin
  FDataList.Add(ATCPSessionDataClass);
end;

procedure TMqttLogWorker.FlushToDb;
var
  datalist: TList<TTCPSessionDataClass>;
  data: TTCPSessionDataClass;
  query: TADOQuery;
  i: integer;
begin
  datalist := FDataList.LockList;
  try
    if datalist.Count = 0 then
      Exit;

    query := TADOQuery.Create(nil);
    try
      query.Connection := FConn;
    //query.SQL.Text := 'insert into DbaMqtt.dbo.TblTcp (FldIp, FldUId, FldEvent, FldDateTime) values (:PIp, :PUId, :PEvent, :PDateTime)';
      for i := 0 to datalist.Count - 1 do begin
        data := datalist[i];

//        query.Parameters[0].DataType := TDataType.ftString;
//        query.Parameters[0].Value := data.Ip;
//
//        query.Parameters[2].DataType := TDataType.ftDateTime;
//        query.Parameters[2].Value := data.DateTime;
//
//        query.Parameters[0].DataType := TDataType.ftGuid;
//        query.Parameters[1].Value := data.UId;
//
//        query.Parameters[3].DataType := TDataType.ftString;
//        query.Parameters[3].Value := data.Event;


        query.SQL.Text := Format('insert into DbaMqtt.dbo.TblTcp (FldIp, FldUId, FldEvent, FldDateTime) values (''%s'', ''%s'', ''%s'', ''%s'')', [
          data.Ip
        , data.UId
        , data.Event
        , DateTimeToStr(data.DateTime)
        ]);

//        data.Free;

        query.ExecSQL;
      end;
    finally
      query.Free;
      datalist.Clear;
    end;
  finally
    FDataList.UnlockList;
  end;
end;

procedure TMqttLogWorker.Execute;
begin
  inherited;

  // continous flush during running
  while not Terminated do begin // *** must be stopped manually somewhere ***
    Sleep(250);
    FlushToDb;
  end;

  // final flush after termination
  FlushToDb;
end;
{$ENDREGION}

{$REGION 'Zzz'}
(*
  TMqttClass = class
  protected
    procedure LogRequest(const AStr: string); overload;
    procedure LogRequest(const AIdBytes: TIdBytes); overload;
    procedure LogResponse(const AStr: string); overload;
    procedure LogResponse(const AIdBytes: TIdBytes); overload;
    procedure LogWithRequest(const AStr: string; const ARequest: TIdBytes);
    procedure LogWithResponse(const AStr: string; const AResponse: TIdBytes);
    procedure BytAdd(const AByte: byte; var APacket: TIdBytes; var AIndex: integer);
    procedure StrAdd(const AStr: ansistring; var APacket: TIdBytes; var AIndex: integer);
    function  StrRead(AContext: TIdContext): string;
    function  IntEat(var AIdBytes: TIdBytes; ACount: integer; ADefault: integer = 0): integer;
    function  StrEat(var AIdBytes: TIdBytes; ACount: integer; ADefault: string = ''): string;
    function  StrPrintable(const AStr: string): string;
    function  StrDebugable(const AStr: string; IvHex: boolean = true): string; overload;
    function  StrDebugable(const AIdBytes: TIdBytes; IvHex: boolean = true): string; overload;
  end;

implementation

procedure TMqttClass.LogRequest(const AStr: string);
begin
  if Assigned(FLogRequestRichEdit) then begin
    TThread.Synchronize(nil,
      procedure
      begin
        FLogRequestRichEdit.Lines.Add(AStr);
      end
    );
  end;
end;

procedure TMqttClass.LogRequest(const AIdBytes: TIdBytes);
begin
  if Assigned(FLogRequestRichEdit) then begin
    TThread.Synchronize(nil,
      procedure
      begin
        FLogRequestRichEdit.Lines.Add(
        //BytesToStringRaw(AIdBytes)
          StrDebugable(AIdBytes)
        );
      end
    );
  end;
end;

procedure TMqttClass.LogResponse(const AStr: string);
begin
  if Assigned(FLogResponseRichEdit) then begin
    TThread.Synchronize(nil,
      procedure
      begin
        FLogResponseRichEdit.Lines.Add(AStr);
      end
    );
  end;
end;

procedure TMqttClass.LogResponse(const AIdBytes: TIdBytes);
begin
  if Assigned(FLogResponseRichEdit) then begin
    TThread.Synchronize(nil,
      procedure
      begin
        FLogResponseRichEdit.Lines.Add(
        //BytesToStringRaw(AIdBytes)
          StrDebugable(AIdBytes)
        );
      end
    );
  end;
end;

procedure TMqttClass.LogWithRequest(const AStr: string; const ARequest: TIdBytes);
begin
  Log(AStr);
  LogRequest(ARequest);
end;

procedure TMqttClass.LogWithResponse(const AStr: string; const AResponse: TIdBytes);
begin
  Log(AStr);
  LogResponse(AResponse);
end;

function  TMqttClass.StrDebugable(const AStr: string; IvHex: boolean): string;
var
  i: integer;
  b: byte;
  c: char;
begin
  Result := '';

  for i := 1 to Length(AStr) do begin // strings are 1 indexed
    c := AStr[i];
    b := Ord(c);

    if IvHex then begin
      Result := Result + ' ' + IntToHex(b, 2);

    end else begin
      case b of
      32..255: Result := Result + ' ' + c;
      else     Result := Result + ' ' + IntToHex(b, 2); // Format('{%d}', [c])
      end;
    end;
  end;
  Delete(Result, 1, 1);
end;

function  TMqttClass.StrDebugable(const AIdBytes: TIdBytes; IvHex: boolean): string;
var
  i: integer;
  b: byte;
begin
  Result := '';

  for i := 0 to Length(AIdBytes) -1 do begin // array are 0 indexed
    b := AIdBytes[i];

    if IvHex then begin
      Result := Result + ' ' + IntToHex(b, 2);

    end else begin
      case b of
      32..255: Result := Result + ' ' + Chr(b);
      else     Result := Result + ' ' + IntToHex(b, 2); // Format('{%d}', [c])
      end;
    end;
  end;
  Delete(Result, 1, 1);
end;

function  TMqttClass.StrPrintable(const AStr: string): string;
var
  i, len: integer;
  c: char;
begin
  len := Length(AStr);
  if Len = 0 then
    Exit('');

  Result := AStr;
  i := 1;

  while i <= Len do begin
    // a char
    c := AStr[i];

    // 1) preserve tabs (#9), line feeds (#10), and carriage returns (#13)
    if (C = #9) or (C = #10) or (C = #13) then begin // #10#13 is a ctrl-string
      Inc(i);

    // 2) keep ASCII/extended-ASCII (#32..#255) as is
    end else if ((Ord(C) >= 32) and (Ord(C) <= 255)) then begin
      Inc(i);

    // 3) convert other whitespace to an ASCII space
    end else if c.IsWhiteSpace then begin
      Result[i] := '_';
      Inc(i);

    // 4) otherwise, skip it
    end else begin
      Result[i] := '!';
      Inc(i);
      //Delete(Result, i, 1);
      //Dec(len);
    end;
  end;
end;

procedure TMqttClass.BytAdd(const AByte: byte; var APacket: TIdBytes; var AIndex: integer);
begin
  APacket[AIndex] := AByte;
  Inc(AIndex);
end;

procedure TMqttClass.StrAdd(const AStr: ansistring; var APacket: TIdBytes; var AIndex: integer);
var
  len: word;
begin
  len := Length(AStr);
  APacket[AIndex] := Hi(len);
  Inc(AIndex);
  APacket[AIndex] := Lo(len);
  Inc(AIndex);
  Move(AStr[1], APacket[AIndex], len);
  Inc(AIndex, len);
end;

function  TMqttClass.StrRead(AContext: TIdContext): string;
var
  rbu: TIdBytes; // lengthbytes
  stz: word; // strlen
begin
  // 2-bytes read for length
  AContext.Connection.IOHandler.ReadBytes(rbu, 2, false);
  stz := {(rbu[0] shl 8) or} rbu[1];
  // string actual read
  Result := AContext.Connection.IOHandler.ReadString(stz, IndyTextEncoding_UTF8);
end;

function  TMqttClass.IntEat(var AIdBytes: TIdBytes; ACount, ADefault: integer): integer;
var
  {i, }remaining: integer;
begin
  // init
  Result := ADefault;
  if ACount <= 0 then
    Exit;

  // adjust
  if ACount > Length(AIdBytes) then
    ACount := Length(AIdBytes);
  if ACount <= 0 then
    Exit;

  // resultload
       if ACount = 1 then
    Result := AIdBytes[0]
  else if ACount = 2 then
    Result := (AIdBytes[0] shl  8) or AIdBytes[1]
  else if ACount = 3 then
    Result := (AIdBytes[0] shl 16) or (AIdBytes[1] shl  8) or AIdBytes[2]
  else if ACount = 4 then
    Result := (AIdBytes[0] shl 24) or (AIdBytes[1] shl 16) or (AIdBytes[2] shl 8) or AIdBytes[3]
  else
    raise Exception.Create('4 bytes max can be eated');

  // remove extracted bytes from the original array
  Remaining := Length(AIdBytes) - ACount;
  if Remaining > 0 then
    Move(AIdBytes[ACount], AIdBytes[0], Remaining);
  SetLength(AIdBytes, Remaining);
end;

function  TMqttClass.StrEat(var AIdBytes: TIdBytes; ACount: integer; ADefault: string): string;
var
  i, remaining: integer;
begin
  // init
  Result := '';
  if ACount <= 0 then
    Exit;

  // adjust
  if ACount > Length(AIdBytes) then
    ACount := Length(AIdBytes);
  if ACount <= 0 then
    Exit;

  // resultload
  SetLength(Result, ACount);
  for i := 0 to ACount - 1 do
    Result[i + 1] := Char(AIdBytes[i]);

  // remove extracted bytes from the original array
  Remaining := Length(AIdBytes) - ACount;
  if Remaining > 0 then
    Move(AIdBytes[ACount], AIdBytes[0], Remaining);
  SetLength(AIdBytes, Remaining);
end;

procedure BytesSplitAtNullChar(const fullpacket: TIdBytes; var AIdBytesVec: TBytesVec);
var
  i: int64;
  bts: TIdBytes;
begin
  SetLength(AIdBytesVec, 0);
  SetLength(bts, 0);
  for i := Low(fullpacket) to High(fullpacket) do begin
    if (fullpacket[i] <> $0) and (i <= High(fullpacket)) then begin
      SetLength(bts, Length(bts) + 1);
      bts[High(bts)] := fullpacket[i];
    end else begin
      SetLength(bts, Length(bts) + 1);
      bts[High(bts)] := $0;
      SetLength(AIdBytesVec, Length(AIdBytesVec) + 1);
      AIdBytesVec[High(AIdBytesVec)] := bts;
      SetLength(bts, 0);
    end;
  end;
end;
*)
{$ENDREGION}

end.
