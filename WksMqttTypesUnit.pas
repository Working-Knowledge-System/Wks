unit WksMqttTypesUnit;

interface

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , System.Math
  , System.Generics.Collections
  ;
{$ENDREGION}

{$REGION 'Type'}
type

  {$REGION 'Protocol'}
  TMQTTLevel = 1..5; // 1 = 1.2  2 = 3.0  3 = 3.1  4 = 3.1.1  5 = 5.0

  TMQTTVersion = (
    mv12             // 1 = 1.2
  , mv30             // 2 = 3.0
  , mv31             // 3 = 3.1
  , mv311            // 4 = 3.1.1
  , mv50             // 5 = 5.0
  );
  {$ENDREGION}

  {$REGION 'QoS'}
  //TMQTTQoS = 0..2;

  TMQTTQoSType = (
    qostAT_MOST_ONCE  = 0 // QoS 0 = fire and forget
  , qostAT_LEAST_ONCE = 1 // QoS 1 = at least once delivery (PUBACK required)
  , qostEXACTLY_ONCE  = 2 // QoS 2 = exactly once delivery (PUBREC, PUBREL, PUBCOMP sequence)
  );
  {$ENDREGION}

  {$REGION 'Subscription'}
  TSubscription = record
    TopicFilter: string;
    QoS: TMQTTQOSType;
  end;
  {$ENDREGION}

  {$REGION 'Message'}
  TMQTTMessageRec = record {TMQTTApplicationMessage}
    DupFlag: boolean;
    QoS: TMQTTQoSType;
    Retain: boolean;
    TopicName: string;
    PacketIdentifier: word;
    ApplicationMessage: TBytes;
  end;

  TMQTTMessageInFlight = class
    PacketID: Word;
    Message: TMQTTMessageRec;
    Timestamp: TDateTime;
    RetryCount: Integer;
  end;

  // basic message event type (used in both client and server)
  TOnMQTTMessage = reference to procedure(const ATopicName: string; const AApplicationMessage: TBytes; AQoSLevel: TMQTTQOSType; ARetain: boolean);
  {$ENDREGION}

  {$REGION 'Session'}
  TMQTTSessionClass = class
  private
    FClientID: string;
    FCleanSession: boolean;
    FSubscriptions: TList<TSubscription>;
    FInFlightQoS1: TObjectDictionary<Word, TMQTTMessageInFlight>;
    FInFlightQoS2: TObjectDictionary<Word, TMQTTMessageInFlight>;
    FMessageQueue: TList<TMQTTMessageRec>;
    FPacketIdNext: word;
    FLastContact: TDateTime;
    FWillMessage: TMQTTMessageRec;
    function PacketIdGenerate: word;
  public
    constructor Create(const AClientID: string; ACleanSession: boolean);
    destructor Destroy; override;

    procedure LastContactUpdate;
    function  SubscriptionAdd(const ATopicFilter: string; AQoS: TMQTTQoSType): boolean;
    procedure SubscriptionRemove(const ATopicFilter: string);
    function  SubscriptionExists(const ATopicFilter: string): boolean;
    procedure MessageQueue(const AMessage: TMQTTMessageRec);
    function  MessageDequeue: TMQTTMessageRec;

    property ClientId: string                                            read FClientId;
    property CleanSession: boolean                                       read FCleanSession;
    property Subscriptions: TList<TSubscription>                         read FSubscriptions;
    property LastContact: TDateTime                                      read FLastContact;
    property WillMessage: TMQTTMessageRec                                read FWillMessage write FWillMessage;
    property InFlightQoS1: TObjectDictionary<Word, TMQTTMessageInFlight> read FInFlightQoS1;
    property InFlightQoS2: TObjectDictionary<Word, TMQTTMessageInFlight> read FInFlightQoS2;
  end;
  {$ENDREGION}

  {$REGION 'Packet'}
{
   -----------------------------------------------------------   -------------   -------------
  |                FIXED HEADER (2..5 bytes)                  | | VAR. HEADER | |  PAY LOAD   |
  |-----------------------------------------------------------| |             | |             |
  |CTRL PACKET|                 REMAINING LEN                 | |  0-N bytes  | |  0-M bytes  |
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

  TMQTTPacketType = (
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

  TMQTTPacketClass = class
  private
    FStream: TMemoryStream;
    function LenGet: integer;
    function AsAsciiGet: string;
    function AsHexGet: string;
    function AsCharGet: string;
    function DumpGet: string; {virtual;}
  public
    constructor Create;
    destructor Destroy; override;

    procedure StreamFromBytes(ABytes: TBytes);
    function  ByteRead: byte;
    procedure ByteWrite(AByte: byte);
    function  WordRead: word;
    procedure WordWrite(AWord: word);
    function  BytesRead(ALength: integer): TBytes;
    procedure BytesWrite(const AData: TBytes);
    function  RemainingLengthRead: integer;
    procedure RemainingLengthWrite(ALength: integer);
    function  StringRead: string;
    function  StringReadLen(ALength: integer): string;
    procedure StringWrite(const AString: string);
    function  MessageRead: TMQTTMessageRec;
    procedure MessageWrite(const AMessage: TMQTTMessageRec);

    property Stream: TMemoryStream read FStream;
    property Len: integer          read LenGet;
    property AsAscii: string       read AsAsciiGet; // asciicode
    property AsHex: string         read AsHexGet;
    property AsChar: string        read AsCharGet;
    property Dump: string          read DumpGet; // return the stream layed out like a hex editor
  end;
  {$ENDREGION}

  {$REGION 'Connect'}
  TMQTTConnectReturnCode = (
    conrcCONNECTION_ACCEPTED      = 0
  , conrcUNACCEPTABLE_PROTOCOL    = 1
  , conrcIDENTIFIER_REJECTED      = 2
  , conrcSERVER_UNAVAILABLE       = 3
  , conrcBAD_USERNAME_OR_PASSWORD = 4
  , conrcNOT_AUTHORIZED           = 5
  );

  TMQTTConnectFlags = packed record
    CleanSession: boolean;
    WillFlag: boolean;
    WillQoS: TMQTTQoSType;
    WillRetain: boolean;
    PasswordFlag: boolean;
    UsernameFlag: boolean;
  public
    procedure FromByte(AByte: byte);
    function  ToByte: byte;
  end;

  TMQTTConnectPacketRec = {class(TMQTTPacketClass)}record
  {private}
    PacketType: TMQTTPacketType;
    RemainingLength: byte;
    ProtocolName: string; // MQTT (fixed)
    ProtocolLevel: byte;  // 4 (3.1.1)
    ConnectFlags: TMQTTConnectFlags;
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
  TMQTTPingreqReturnCode = (
    pingreqrcPINGREQ_ACCEPTED = 0
  );

  TMQTTPingreqPacketRec = record
    PacketType: TMQTTPacketType;
    RemainingLength: byte;
    function  DumpGet: string;
  public
    property Dump: string read DumpGet;
  end;
  {$ENDREGION}

  {$REGION 'Publish'}
  TMQTTPublishReturnCode = (
    publishrcPUBLISH_ACCEPTED = 0
  );

  TMQTTPublishFlags = packed record
    DupFlag: boolean;
    QoSLevel: TMQTTQoSType;
    Retain: boolean;
  public
    procedure FromByte(AByte: byte);
    function  ToByte: byte;
  end;

  TMQTTPublishPacketRec = record
    PacketType: TMQTTPacketType;
    RemainingLength: byte;
    PublishFlags: TMQTTPublishFlags;
    TopicName: string;
    PacketIdentifier: word;
    ApplicationMessage: string;
    function  DumpGet: string;
  public
    property Dump: string read DumpGet;
  end;
  {$ENDREGION}

  {$REGION 'Subscribe'}
  TMQTTSubscribeReturnCode = (
    subscribercSUBSCRIBE_ACCEPTED = 0
  );

  TMQTTSubscribeTopicRec = record
    TopicFilter: string;
    RequestedQoS: TMQTTQoSType;
  end;

  TMQTTSubscribeTopicRecVec = array of TMQTTSubscribeTopicRec;

  TMQTTSubscribePacketRec = record
    PacketType: TMQTTPacketType;
    RemainingLength: byte;
    PacketIdentifier: word;
    SubscribeTopicRecVec: TMQTTSubscribeTopicRecVec;
    function  DumpGet: string;
  public
    property Dump: string read DumpGet;
  end;
  {$ENDREGION}

  {$REGION 'Unsubscribe'}
  TMQTTUnsubscribeReturnCode = (
    unsubscribercUNSUBSCRIBE_ACCEPTED = 0
  );

  TMQTTUnsubscribeTopicRec = record
    TopicFilter: string;
  end;

  TMQTTUnsubscribeTopicRecVec = array of TMQTTUnsubscribeTopicRec;

  TMQTTUnsubscribePacketRec = record
    PacketType: TMQTTPacketType;
    RemainingLength: byte;
    PacketIdentifier: word;
    UnsubscribeTopicRecVec: TMQTTUnsubscribeTopicRecVec;
    function  DumpGet: string;
  public
    property Dump: string read DumpGet;
  end;
  {$ENDREGION}

  {$REGION 'Disconnect'}
  TMQTTDisconnectReturnCode = (
    disconrcDISCONNECTION_ACCEPTED = 0
  , disconrcSERVER_STOPPING        = 1
  , disconrcCLIENT_DISCONNECTED    = 2
  );

  TMQTTDisconnectPacketRec = record
    PacketType: TMQTTPacketType;
    RemainingLength: byte;
    function  DumpGet: string;
  public
    property Dump: string read DumpGet;
  end;
  {$ENDREGION}

  {$REGION 'StreamDecoder'}
  TMQTTStreamDecoder = class
  private
    FBuffer: TBytes;
    //FOffset: Integer;
    //procedure BufferCompact;
  public
    procedure DataAppend(const ABytes: TBytes);
    function  PacketTryExtract(out APacket: TBytes): boolean;
  end;
  {$ENDREGION}

{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    WksMqttUtilsUnit
  ;
{$ENDREGION}

{$REGION 'TMQTTSession'}
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
constructor TMQTTSessionClass.Create(const AClientID: string; ACleanSession: boolean);
begin
  FClientID      := AClientID;
  FCleanSession  := ACleanSession;
  FSubscriptions := TList<TSubscription>.Create;
  FMessageQueue  := TList<TMQTTMessageRec>.Create;
  FInFlightQoS1  := TObjectDictionary<Word, TMQTTMessageInFlight>.Create([doOwnsValues]);
  FInFlightQoS2  := TObjectDictionary<Word, TMQTTMessageInFlight>.Create([doOwnsValues]);
  FPacketIdNext  := 1;
  FLastContact   := Now;
end;

destructor TMQTTSessionClass.Destroy;
begin
  FSubscriptions.Free;
  FMessageQueue.Free;
  FInFlightQoS1.Free;
  FInFlightQoS2.Free;

  inherited;
end;

procedure TMQTTSessionClass.MessageQueue(const AMessage: TMQTTMessageRec);
begin
  // only queue messages with QoS > 0 for persistent sessions
  if not FCleanSession and (AMessage.QoS > qostAT_MOST_ONCE) then
    FMessageQueue.Add(AMessage);
end;

function  TMQTTSessionClass.MessageDequeue: TMQTTMessageRec;
begin
  if FMessageQueue.Count > 0 then begin
    Result := FMessageQueue[0];
    FMessageQueue.Delete(0);
  end else
    raise Exception.Create('No messages in queue');
end;

function  TMQTTSessionClass.SubscriptionExists(const ATopicFilter: string): boolean;
var
  i: integer;
begin
  for i := 0 to FSubscriptions.Count - 1 do
    if SameText(FSubscriptions[i].TopicFilter, ATopicFilter) then
      Exit(true);
  Result := false;
end;

function  TMQTTSessionClass.SubscriptionAdd(const ATopicFilter: string; AQoS: TMQTTQoSType): boolean;
var
  i: integer;
  sub: TSubscription;
begin
  Result := false;

  // if subscription exist update its QoS and exit
  for i := 0 to FSubscriptions.Count - 1 do begin
    if SameText(FSubscriptions[i].TopicFilter, ATopicFilter) then begin
      sub := FSubscriptions[i];
      sub.QoS := AQoS;
      FSubscriptions[i] := sub;
      Exit(true);
    end;
  end;

  // otherwise add a new subscription
  sub.TopicFilter := ATopicFilter;
  sub.QoS := AQoS;
  FSubscriptions.Add(sub);
  Result := true;
end;

procedure TMQTTSessionClass.SubscriptionRemove(const ATopicFilter: string);
var
  i: integer;
begin
  for i := FSubscriptions.Count - 1 downto 0 do
    if SameText(FSubscriptions[i].TopicFilter, ATopicFilter) then
      FSubscriptions.Delete(i);
end;

function  TMQTTSessionClass.PacketIdGenerate: word;
begin
  Result := FPacketIdNext;
  Inc(FPacketIdNext);
  if FPacketIdNext = 0 then
    Inc(FPacketIdNext);
end;

procedure TMQTTSessionClass.LastContactUpdate;
begin
  FLastContact := Now;
end;
{$ENDREGION}

{$REGION 'TMQTTPacketClass'}
constructor TMQTTPacketClass.Create;
begin
  FStream := TMemoryStream.Create;
end;

destructor TMQTTPacketClass.Destroy;
begin
  FStream.Free;

  inherited;
end;

function TMQTTPacketClass.DumpGet: string;
begin
  Result := '<not implemented>';
end;

procedure TMQTTPacketClass.StreamFromBytes(ABytes: TBytes);
begin
  Stream.WriteBuffer(ABytes[0], Length(ABytes));
  Stream.Position := 0;
end;

function  TMQTTPacketClass.ByteRead: byte;
begin
  FStream.Read(Result, SizeOf(Byte));
end;

procedure TMQTTPacketClass.ByteWrite(AByte: byte);
begin
  FStream.Write(AByte, SizeOf(Byte));
end;

function  TMQTTPacketClass.BytesRead(ALength: integer): TBytes;
begin
  // dynamically allocates the result buffer
  SetLength(Result, ALength);
  if ALength > 0 then
    FStream.Read(Result[0], ALength);
end;

procedure TMQTTPacketClass.BytesWrite(const AData: TBytes);
begin
  // efficiently writes byte arrays without copying
  if Length(AData) > 0 then
    FStream.Write(AData[0], Length(AData));
end;

function  TMQTTPacketClass.StringRead: string; // *** DUPLICATE in StrUTF8FromStreamRead ***
var
  len: word;
  bytes: TBytes;
begin
  len := WordRead;
  if len > 0 then begin
    SetLength(bytes, len);
    FStream.Read(bytes[0], len);
    try
      Result := TEncoding.UTF8.GetString(bytes);
    except
      on e: Exception do
        Result := Format('ERROR: %s (%s)', [e.Message,  HexFromBytes(bytes)]);
    end;
  end else
    Result := '';
end;

function  TMQTTPacketClass.StringReadLen(ALength: integer): string;
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

procedure TMQTTPacketClass.StringWrite(const AString: string);
var
  bytes: TBytes;
  len: Word;
begin
  bytes := TEncoding.UTF8.GetBytes(AString);
  len := Length(bytes);
  WordWrite(len);
  if len > 0 then
    FStream.Write(bytes[0], len);
end;

function  TMQTTPacketClass.WordRead: word;
begin
  FStream.Read(Result, SizeOf(Word));
  Result := Swap(Result); // MQTT uses big-endian (network byte order)
end;

procedure TMQTTPacketClass.WordWrite(AWord: word);
begin
  AWord := Swap(AWord); // convert to big-endian
  FStream.Write(AWord, SizeOf(Word));
end;

function  TMQTTPacketClass.RemainingLengthRead: integer;
var
  multiplier: integer;
  digit: byte;
  bytesread: integer;
begin
  Result := 0;
  multiplier := 1;
  bytesread := 0;
  repeat
    if bytesread >= 4 then
      raise Exception.Create('malformed RemainingLength (too many bytes)');

    digit := ByteRead;
    Inc(bytesread);

    Result := Result + (digit and 127) * multiplier;
    multiplier := multiplier * 128;
  until (digit and 128) = 0;
end;

procedure TMQTTPacketClass.RemainingLengthWrite(ALength: integer);
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

function  TMQTTPacketClass.MessageRead: TMQTTMessageRec;
var
  FixedHeader: byte;
  PacketType: TMQTTPacketType;
  QoSByte: byte;
  RemainingLength: integer;
begin
  FStream.Position := 0;
  FixedHeader := ByteRead;
  PacketType := TMQTTPacketType((FixedHeader and $F0) shr 4);

  case PacketType of
    ptPUBLISH: begin
      RemainingLength := RemainingLengthRead;
      Result.TopicName := StringRead;

      // qos read
      QoSByte := (FixedHeader and $06) shr 1;
      Result.QoS := TMQTTQOSType(QoSByte);

      if Result.QoS > qostAT_MOST_ONCE then
        Result.PacketIdentifier := WordRead;

      // payload read
      SetLength(Result.ApplicationMessage, RemainingLength - (FStream.Position - 1));
      if Length(Result.ApplicationMessage) > 0 then
        FStream.Read(Result.ApplicationMessage[0], Length(Result.ApplicationMessage));
    end;

    // Handle other packet types...

    else
      raise Exception.Create('Unsupported packet type in ReadMessage');
  end;
end;

procedure TMQTTPacketClass.MessageWrite(const AMessage: TMQTTMessageRec);
var
  FixedHeader: byte;
  RemainingLength: integer;
  VarHeaderSize: integer;
begin
  FStream.Clear;

  // Fixed Header
  FixedHeader := Byte(ptPUBLISH) shl 4;
  if AMessage.Retain then
    FixedHeader := FixedHeader or $01;
  FixedHeader := FixedHeader or (Byte(AMessage.QoS) shl 1);
  if AMessage.DupFlag then
    FixedHeader := FixedHeader or $08;
  ByteWrite(FixedHeader);

  // remaining length
  VarHeaderSize := 2 + Length(AMessage.TopicName) + IfThen(AMessage.QoS > qostAT_MOST_ONCE, 2, 0);
  RemainingLength := VarHeaderSize + Length(AMessage.ApplicationMessage);
  RemainingLengthWrite(RemainingLength);

  // variable header
  StringWrite(AMessage.TopicName);
  if AMessage.QoS > qostAT_MOST_ONCE then
    WordWrite(AMessage.PacketIdentifier);

  // payload
  if Length(AMessage.ApplicationMessage) > 0 then
    FStream.Write(AMessage.ApplicationMessage[0], Length(AMessage.ApplicationMessage));
end;

function  TMQTTPacketClass.LenGet: integer;
begin
  Result := FStream.Size;
end;

function  TMQTTPacketClass.AsAsciiGet: string;
begin
  Result := AsciiFromStream(FStream);
end;

function  TMQTTPacketClass.AsHexGet: string;
begin
  Result := HexFromStream(FStream);
end;

function  TMQTTPacketClass.AsCharGet: string;
begin
  Result := CharFromStream(FStream);
end;
{$ENDREGION}

{$REGION 'TMQTTConnectFlags'}
procedure TMQTTConnectFlags.FromByte(AByte: byte);
begin
  CleanSession :=              (AByte and $02) <>  0;
  WillFlag     :=              (AByte and $04) <>  0;
  WillQoS      := TMQTTQoSType((AByte and $18) shr 3);
  WillRetain   :=              (AByte and $20) <>  0;
  PasswordFlag :=              (AByte and $40) <>  0;
  UsernameFlag :=              (AByte and $80) <>  0;
end;

function TMQTTConnectFlags.ToByte: byte;
begin
  Result := 0;
end;
{$ENDREGION}

{$REGION 'TMQTTConnectPacket'}
function  TMQTTConnectPacketRec.DumpGet: string;
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

procedure TMQTTConnectPacketRec.LoadFromData(const AData: TBytes);
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
    ConnectFlags.WillQoS      := TMQTTQoSType((flags and $18) shr 3);
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

{$REGION 'TMQTTPingreqPacketRec'}
function TMQTTPingreqPacketRec.DumpGet: string;
begin
  Result        := Format('Packet Type:         %d', [Byte(PacketType)])
  + sLineBreak   + Format('Remaining Length:    %d', [RemainingLength]);
end;
{$ENDREGION}

{$REGION 'TMQTTPublishFlags'}
procedure TMQTTPublishFlags.FromByte(AByte: byte);
begin
  DupFlag      :=              (AByte and $08) <>  0;
  QoSLevel     := TMQTTQoSType((AByte and $06) shr 1);
  Retain       :=              (AByte and $01) <>  0;
end;

function TMQTTPublishFlags.ToByte: byte;
begin
  Result := 0; // 0000 xxxx
end;
{$ENDREGION}

{$REGION 'TMQTTPublishPacketRec'}
function TMQTTPublishPacketRec.DumpGet: string;
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

{$REGION 'TMQTTSubscribePacketRec'}
function TMQTTSubscribePacketRec.DumpGet: string;
begin
  Result        := Format('Packet Type:         %d', [Byte(PacketType)])
  + sLineBreak   + Format('Remaining Length:    %d', [RemainingLength]);
end;
{$ENDREGION}

{$REGION 'TMQTTUnsubscribePacketRec'}
function TMQTTUnsubscribePacketRec.DumpGet: string;
begin
  Result        := Format('Packet Type:         %d', [Byte(PacketType)])
  + sLineBreak   + Format('Remaining Length:    %d', [RemainingLength]);
end;
{$ENDREGION}

{$REGION 'TMQTTDisconnectPacketRec'}
function TMQTTDisconnectPacketRec.DumpGet: string;
begin
  Result        := Format('Packet Type:         %d', [Byte(PacketType)])
  + sLineBreak   + Format('Remaining Length:    %d', [RemainingLength]);
end;
{$ENDREGION}

{$REGION 'TMQTTStreamDecoder'}
//procedure TMQTTStreamDecoder.DataAppend(const ABytes: TBytes);
//var
//  newlen: integer;
//begin
//  newlen := Length(FBuffer) - FOffset + Length(ABytes);
//  SetLength(FBuffer, newlen);
//  Move(FBuffer[FOffset], FBuffer[0], newlen - Length(ABytes));
//  Move(ABytes[0], FBuffer[newlen - Length(ABytes)], Length(ABytes));
//  FOffset := 0;
//end;

//procedure TMQTTStreamDecoder.BufferCompact;
//var
//  validlen: integer;
//begin
//  validlen := Length(FBuffer) - FOffset;
//  if validlen > 0 then
//    Move(FBuffer[FOffset], FBuffer[0], validlen);
//  SetLength(FBuffer, validlen);
//  FOffset := 0;
//end;

//procedure TMQTTStreamDecoder.DataAppend(const ABytes: TBytes);
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

procedure TMQTTStreamDecoder.DataAppend(const ABytes: TBytes);
var
  startlen: integer;
begin
  startlen := Length(FBuffer);
  SetLength(FBuffer, startlen + Length(ABytes));
  Move(ABytes[0], FBuffer[startlen], Length(ABytes));
end;

function TMQTTStreamDecoder.PacketTryExtract(out APacket: TBytes): boolean;
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

    if {FOffset +} TotalLen > Length(FBuffer) then
      Exit;

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

end.
