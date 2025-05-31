unit WksMqttClientUnit;

interface

{$REGION 'Use'}
uses
    System.SysUtils
  , System.Classes
  , Vcl.StdCtrls
  , Vcl.ComCtrls
  , Vcl.ExtCtrls
  , IdTCPClient
  , WksMqttUnit
  , WksMqttTypesUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TMqttClientClass = class(TMqttClass)
  private
    // fields
    FTCPClient: TIdTCPClient;
    FKeepAliveTimer: TTimer;
    FPacketIdCounter: word;

    // tcpipclient events
//    FOnServerJoined: TNotifyEvent;
//    FOnServerDisjoined: TNotifyEvent;

    // broker events
//    FOnConnected: TNotifyEvent{TOnMQTTClientConnect};       // to the broker, not to the tcpip server
//    FOnDisconnected: TNotifyEvent{TOnMQTTClientDisconnect}; // from the broker
//    FOnMessage: TOnMQTTMessage;

    // tcpipclient events handlers
    procedure OnServerJoinedHandler(Sender: TObject);
    procedure OnServerDisjoinedHandler(Sender: TObject);

    // broker events handlers
    procedure OnConnectedHandler(Sender: TObject{AContext: TIdContext});    // to the broker
    procedure OnDisconnectedHandler(Sender: TObject{AContext: TIdContext}); // from the broker

    // keep alive routines
    procedure KeepAliveTimerHandler(Sender: TObject);

    // utils
    function NextPacketIdGet: word;
  public
    constructor Create(ALogLineLabel: TLabel; ALogRichEdit, ARequestHexRichEdit, AResponseHexRichEdit: TRichEdit); override;
    destructor Destroy; override;
    procedure Join(AHost: string; APort: integer);
    procedure Disjoin;
    procedure ConnectPacketSend(IvProtocolLevel, IvQos: byte; AClientId, AWillTopic, AWillMessage, AUsername, APassword: string; IvCleanSession: boolean = true; AKeepAliveSeconds: word = 60);
    procedure DisconnectPacketSend;
    procedure PingReqPacketSend;

    function  IsJoined: boolean;    // tcpclient is connected to tcpserver
    function  IsConnected: boolean; // mqttclient is connected mqttbroker
    property NextPacketId: word read NextPacketIdGet;
  end;
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    WksMqttUtilsUnit
  ;
{$ENDREGION}

{$REGION 'TMqttClientClass'}
constructor TMqttClientClass.Create(ALogLineLabel: TLabel; ALogRichEdit, ARequestHexRichEdit, AResponseHexRichEdit: TRichEdit);
begin
  inherited Create(ALogLineLabel, ALogRichEdit,  ARequestHexRichEdit, AResponseHexRichEdit);

  // tcpclient
  FTCPClient := TIdTCPClient.Create(nil);
  FTCPClient.OnConnected    := OnServerJoinedHandler;
  FTCPClient.OnDisconnected := OnServerDisjoinedHandler;

  // keep alive timer
  FKeepAliveTimer := TTimer.Create(nil);
  FKeepAliveTimer.OnTimer := KeepAliveTimerHandler;

  // other
  FPacketIDCounter := 1; // can go also in the ConnectPacketSend so packets id is tracked at connection level, not here
end;

destructor TMqttClientClass.Destroy;
begin
  // timer
  FKeepAliveTimer.Free;

  // tcpclient
  FTCPClient.Free;

  inherited;
end;

function  TMqttClientClass.IsJoined: boolean;
begin
  Result := FTCPClient.Connected;
end;

function  TMqttClientClass.IsConnected: boolean;
begin
  Result := FTCPClient.Connected;
end;

procedure TMqttClientClass.Join(AHost: string; APort: integer);
begin
  // checks for already running server
  if FTCPClient.Connected then
    raise Exception.Create('client is already joined with the server');

  Log('client joining server...');
  try
    FTCPClient.Host := AHost;
    FTCPClient.Port := APort;
    FTCPClient.Connect; // join the tcpip server, not to the broker
    Log('client joined to server %s:%d', [AHost, APort]);
  except
    on e: Exception do
      Log('client joining failed: %s', [e.Message.Replace(sLineBreak, ' ')]);
  end;
end;

procedure TMqttClientClass.Disjoin;
begin
  Log('client disjoining...');
  try
    FKeepAliveTimer.Enabled := false;
    Log('client keep-alive timer stopped');

    FTCPClient.IOHandler.CloseGracefully;
    Log('client join closed gracefully');

    FTCPClient.Disconnect; // from the tcpip server
    Log('client disjoined from server %s:%d', [FTCPClient.Host, FTCPClient.Port]);
  except
    on e: Exception do
      Log('client disjoining failed: %s', [e.Message.Replace(sLineBreak, ' ')]);
  end;
end;

procedure TMqttClientClass.ConnectPacketSend(IvProtocolLevel, IvQos: byte; AClientId, AWillTopic, AWillMessage, AUsername, APassword: string; IvCleanSession: boolean; AKeepAliveSeconds: word);

  {$REGION 'protocoll'}
{
  Fixed and Variable Header
  -------------------------

   -----------------------   -----------------------------------------------------------------------------------------------------------------------   --------------
  | FIXED HEADER (2 bytes)| | VARIABLE HEADER (10 bytes)                                                                                            | |   PAY LOAD   |
  |-----------------------| |                                                                                                                       | |              |
  |CTRL PACKET| REMAINLEN | |                                                                                                                       | |   0-M bytes  |
  |-----------|-----------| |-----------------------------------------------------------------------------------------------------------------------| |--------------|
  |type | flgs|           | |         strlen        |                  Protocol Name                | prot lev  | connflags |  keepalive every sec  | |              |
  |-----------|-----------| |-----------------------|-----------------------------------------------|-----------|-----------|-----------------------| |              |
  | byte 0    | byte 1    | | byte 5    | byte 6    | byte 7    | byte 8    | byte 9    | byte 10   | byte 11   | byte 12   | byte 13   | byte 14   | |  byte 15...  |
  |-----------|-----------| |-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------------------| |--------------|
  | 0001 0000 |           | | 0000 0000 | 0000 0100 | 0100 1101 | 0101 0001 | 0101 0100 | 0101 0100 | 0000 0100 | 0000 0000 | 0000 0000   0000 0000 | |              |
  |        16 |           | |         0 |         4 |        77 |        81 |        84 |        84 |         4 |         4 |         0          60 | |              |
  |       $10 |           | |       $00 |       $04 |       $4D |       $51 |       $54 |       $54 |       $04 |       $00 |       $00         $3C | |              |
  |         . |           | |         . |         . |         M |         Q |         T |         T |         . |         . |         .           < | |              |
   -----------------------   -----------------------------------------------------------------------------------------------------------------------   --------------


  Connect Flags
  -------------

   ---------------------------------------------------------------------------------------------------------------------
  |         | 7             | 6             | 5             | 4    | 3    | 2           | 1               | 0           | <--bit
  |---------|---------------|---------------|---------------|-------------|-------------|-----------------|-------------|
  | byte 12 |    username   |    password   |    willretain |     willQoS |    willflag |    cleansession |    RESERVED |
  |         | 0  notpresent | 0  notpresent | 0  no         | 00  QoS0    | 0           | 0  no           | 0           |
  |         | 1  present    | 1  present    | 1  yes        | 01  QoS1    | 1           | 1  yes          | 1  PV       |
  |         |               |               |               | 10  QoS2    |             |                 |             |
  |         |               |               |               | 11  PV      |             |                 |             |
   ---------------------------------------------------------------------------------------------------------------------

  PV = protocol violation, broker must disconnect the client, the tcpserver must disjoin the tcpclient

  Keep Alive
  ----------
  The Keep Alive is a time interval measured in seconds, expressed as a 16-bit word
  It is the maximum time interval that is permitted to elapse between the point at which the Client finishes transmitting one Control Packet and the point it starts sending the next.
  It is the responsibility of the Client to ensure that the interval between Control Packets being sent does not exceed the Keep Alive value.
  In the absence of sending any other Control Packets, the Client MUST send a PINGREQ Packet.
  The actual value of the Keep Alive typically is a few minutes
  The maximum value is 18 hours 12 minutes and 15 seconds

  for 60 seconds we have:
   ------------------------------------------
  |         | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 | <--bit
  |---------|---|---|---|---|---|---|---|---|
  | byte 13 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | keep alive msb
  | byte 14 | 0 | 0 | 1 | 1 | 1 | 1 | 0 | 0 | keep alive lsb
   -----------------------------------------

  Payload
  -------
  The payload of the CONNECT Packet contains one or more length-prefixed fields, whose presence is determined by the flags in the variable header.
  These fields, if present, MUST appear in the order: Client Identifier, Will Topic, Will Message, Username, Password

  for example we have:
   ------------------------------------------
  |         | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 | <--bit
  |---------|---|---|---|---|---|---|---|---|
  | byte 15 |   |   |   |   |   |   |   |   | length msb   \
  | byte 16 |   |   |   |   |   |   |   |   | length lsb   |
  | byte 17 |   |   |   |   |   |   |   |   | 'c'          |
  |         |   |   |   |   |   |   |   |   | 'l'          |
  |         |   |   |   |   |   |   |   |   | 'i'          |
  |         |   |   |   |   |   |   |   |   | 'e'           > Client Identifier = 'client-001'
  |         |   |   |   |   |   |   |   |   | 'n'          |
  |         |   |   |   |   |   |   |   |   | 't'          |
  |         |   |   |   |   |   |   |   |   | '-'          |
  |         |   |   |   |   |   |   |   |   | '0'          |
  |         |   |   |   |   |   |   |   |   | '0'          |
  |         |   |   |   |   |   |   |   |   | '1'         /
  | byte 27 |   |   |   |   |   |   |   |   | length msb   \
  | byte 28 |   |   |   |   |   |   |   |   | length lsb   |
  | byte 29 |   |   |   |   |   |   |   |   | '.'           > Will Topic = '...'
  |         |   |   |   |   |   |   |   |   | '.'          |
  |         |   |   |   |   |   |   |   |   | '.'         /
  | byte 32 |   |   |   |   |   |   |   |   | length msb   \
  | byte 33 |   |   |   |   |   |   |   |   | length lsb   |
  | byte 34 |   |   |   |   |   |   |   |   | '.'           > Will Message = '...'
  |         |   |   |   |   |   |   |   |   | '.'          |
  |         |   |   |   |   |   |   |   |   | '.'         /
  | byte 37 |   |   |   |   |   |   |   |   | length msb   \
  | byte 38 |   |   |   |   |   |   |   |   | length lsb   |
  | byte 39 |   |   |   |   |   |   |   |   | '.'           > Username = '...'
  |         |   |   |   |   |   |   |   |   | '.'          |
  |         |   |   |   |   |   |   |   |   | '.'         /
  | byte 42 |   |   |   |   |   |   |   |   | length msb   \
  | byte 43 |   |   |   |   |   |   |   |   | length lsb   |
  | byte 44 |   |   |   |   |   |   |   |   | '.'           > Password = '...'
  |         |   |   |   |   |   |   |   |   | '.'          |
  | byte 46 |   |   |   |   |   |   |   |   | '.'         /
   -----------------------------------------
}
  {$ENDREGION}

  {$REGION 'var'}
var
  packet: TMQTTPacketClass;
  remainlen: cardinal;
  connectflags: byte;
  willflag: boolean;
  {$ENDREGION}

begin
  Log('CONNECT packet send...');

  {$REGION 'packet'}
  packet := TMQTTPacketClass.Create;
  try

    {$REGION 'remaininglenght'}
    remainlen :=
      10
    + VarLenFieldLength(AClientID)
    + VarLenFieldLength(AWillTopic)
    + VarLenFieldLength(AWillMessage)
    + VarLenFieldLength(AUsername)
    + VarLenFieldLength(APassword);
    {$ENDREGION}

    {$REGION 'fixedheader'}
    packet.ByteWrite(Byte(ptCONNECT) shl 4); // $10  0001 0000    type is CONNECT = 1, no flags needed
    packet.RemainingLengthWrite(remainlen);  // $00  0000 0000    variable, depends on presence of various parts
    {$ENDREGION}

    {$REGION 'variableheader'}
    // protocol name
    Packet.StringWrite('MQTT');

    // protocol level
    Packet.ByteWrite(IvProtocolLevel{ $04}); // 3.1.1

    // willflag
    willflag := not (AWillTopic.IsEmpty or AWillMessage.IsEmpty);

    // connect flags
                               connectflags :=                 $00; // 0000 0000 \__ bit0 reserved
  //if{IvReservedOn}      then connectflags := connectflags or $01; // 0000 0001 /

    if IvCleanSession     then connectflags := connectflags or $02; // 0000 0010     bit1 clean session
    if willflag           then connectflags := connectflags or $04; // 0000 0100     bit2 willflag

    if IvQos = 1          then connectflags := connectflags or $08; // 0000 1000     bit3 \__ QoS
    if IvQos = 2          then connectflags := connectflags or $10; // 0001 0000     bit4 /

    if {AWillRetain}false then connectflags := connectflags or $20; // 0001 0000     bit5
    if APassword <> ''    then connectflags := connectflags or $40; // 0100 0000     bit6
    if AUsername <> ''    then connectflags := connectflags or $80; // 1000 0000     bit7
    Packet.ByteWrite(connectflags);

    // keep alive
    Packet.WordWrite(AKeepAliveSeconds);
    {$ENDREGION}

    {$REGION 'payload'}
                                  Packet.StringWrite(AClientID);    // clientidentifier
    if willflag then begin
                                  Packet.StringWrite(AWillTopic);   // willtopic
                                  Packet.StringWrite(AWillMessage); // willmessage
    end;
    if not AUsername.IsEmpty then Packet.StringWrite(AUsername);    // username
    if not APassword.IsEmpty then Packet.StringWrite(APassword);    // password
    {$ENDREGION}

    {$REGION 'send'}
    FTCPClient.IOHandler.Write(packet.Stream, 0, true); // true indicates WriteByteCount for the server to read it!
    Log('CONNECT packet sent    (%d bytes)', [packet.Len]);
    Log('                       (%s)'      , [packet.AsAscii]);
    Log('                       (%s)'      , [packet.AsHex]);
    Log('                       (%s)'      , [packet.AsChar]);
//    Log();
    {$ENDREGION}

  finally
    packet.Free;
  end;
  {$ENDREGION}

  {$REGION 'post'}
  // start the keep-alive timer
  FKeepAliveTimer.Interval := AKeepAliveSeconds * 1000;
  FKeepAliveTimer.Enabled := true;

  // fire event
//if Assigned(FOnConnected) then
//  FOnConnected(Self);
  {$ENDREGION}

end;

procedure TMqttClientClass.DisconnectPacketSend;

  {$REGION 'protocoll'}
{
  The DISCONNECT packet is the final Control Packet sent from the Client to the Server.
  It indicates that the Client is disconnecting cleanly.

  Fixed Header

      bit  7  6  5  4  3  2  1  0
  --------------------------------
  byte 1   1  1  1  0  0  0  0  0   type 14, flags reserved
  byte 2   0  0  0  0  0  0  0  0   Remaining Length (0)

  The Server MUST validate that reserved flag bits are set to zero and disconnect the Client if they are not zero.

  Variable Header
  The DISCONNECT Packet has no variable header.

  Payload
  The DISCONNECT Packet has no payload.

  Response
  After sending a DISCONNECT packet the Client:
  - MUST close the tcpip connection.
  - MUST NOT send any more Control Packets on that tcpip connection.

  On receipt of DISCONNECT the Server:
  - MUST discard any Will Message associated with the current connection without publishing it.
  - SHOULD close the tcpip connection if the Client has not already done so.

   -----------------------
  | FIXED HEADER (2bytes) |
  |-----------------------|
  |CTRL PACKET| REMAINLEN |
  |-----------|-----------|
  |type | flgs|           |
  |-----------|-----------|
  | byte 0    | byte 1    |
  |-----------|-----------|
  | 1110 0000 | 0000 0000 |
  |       224 |         0 |
  |        E0 |        00 |
  |         à |         . |
   -----------------------
}
  {$ENDREGION}

  {$REGION 'var'}
var
  packet: TMQTTPacketClass;
  {$ENDREGION}

begin
  Log('DISCONNECT packet send...');

  {$REGION 'packet'}
  packet := TMQTTPacketClass.Create;
  try

    {$REGION 'fixedheader'}
    packet.ByteWrite(Byte(ptDISCONNECT) shl 4); // $C0  1100 0000    type 14, flags reserved
    packet.RemainingLengthWrite(0);             // $00  0000 0000    no variable header or payload
    {$ENDREGION}

    {$REGION 'variableheader'}
    // none
    {$ENDREGION}

    {$REGION 'payload'}
    // none
    {$ENDREGION}

    {$REGION 'send'}
    FTCPClient.IOHandler.Write(packet.Stream, 0, true);
    Log('DISCONNECT packet sent (%d bytes)', [packet.Len]);
    Log('                       (%s)'      , [packet.AsAscii]);
    Log('                       (%s)'      , [packet.AsHex]);
    Log('                       (%s)'      , [packet.AsChar]);
    {$ENDREGION}

  finally
    packet.Free;
  end;
  {$ENDREGION}

  {$REGION 'post'}
  // close tcpip connection (eventually the gui should be updated)
  FTCPClient.Disconnect;

  // avoid sending other packets
  // PacketSendingEnabled := false;
  {$ENDREGION}

end;

procedure TMqttClientClass.PingReqPacketSend;

  {$REGION 'protocoll'}
{
   -----------------------
  | FIXED HEADER (2bytes) |
  |-----------------------|
  |CTRL PACKET| REMAINLEN |
  |-----------|-----------|
  |type | flgs|           |
  |-----------|-----------|
  | byte 0    | byte 1    |
  |-----------|-----------|
  | 1100 0000 | 0000 0000 |
  |       192 |         0 |
  |        C0 |        00 |
  |         À |         . |
   -----------------------
}
  {$ENDREGION}

var
  packet: TMQTTPacketClass;
begin
  Log('PINGREQ packet send...');

  {$REGION 'packet'}
  packet := TMQTTPacketClass.Create;
  try

    {$REGION 'fixedheader'}
    packet.ByteWrite(Byte(ptPINGREQ) shl 4); // $C0  0000 1100    type 12, flags reserved
    packet.RemainingLengthWrite(0);          // $00  0000 0000    no variable header or payload
    {$ENDREGION}

    {$REGION 'variableheader'}
    // none
    {$ENDREGION}

    {$REGION 'payload'}
    // none
    {$ENDREGION}

    {$REGION 'send'}
    FTCPClient.IOHandler.Write(packet.Stream, 0, true);
    Log('PINGREQ packet sent    (%d bytes)', [packet.Len]);
    Log('                       (%s)'      , [packet.AsAscii]);
    Log('                       (%s)'      , [packet.AsHex]);
    Log('                       (%s)'      , [packet.AsChar]);
    {$ENDREGION}

  finally
    packet.Free;
  end;
  {$ENDREGION}

  {$REGION 'post'}
  // none
  {$ENDREGION}

end;

  {$REGION 'TCPClientHandlers'}
procedure TMqttClientClass.OnServerJoinedHandler(Sender: TObject);
begin
  Log('client joined to server %s:%d', [FTCPClient.Host, FTCPClient.Port]);
end;

procedure TMqttClientClass.OnServerDisjoinedHandler(Sender: TObject);
begin
  Log('client disjoined from server %s:%d', [FTCPClient.Host, FTCPClient.Port]);
end;
  {$ENDREGION}

  {$REGION 'BrokerHandlers'}
procedure TMqttClientClass.OnConnectedHandler(Sender: TObject);
begin
  Log('client connected to broker %s:%d', [FTCPClient.Host, FTCPClient.Port]);
end;

procedure TMqttClientClass.OnDisconnectedHandler(Sender: TObject);
begin
  Log('client disconnected from broker %s:%d', [FTCPClient.Host, FTCPClient.Port]);
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'KeepAliveTimer'}
procedure TMqttClientClass.KeepAliveTimerHandler(Sender: TObject);
begin

end;
{$ENDREGION}

{$REGION 'Utils'}
function TMqttClientClass.NextPacketIdGet: word;
begin
  Result := FPacketIdCounter;
  Inc(FPacketIdCounter);
  if FPacketIDCounter = 0 then
    FPacketIDCounter := 1;
end;
{$ENDREGION}

{$REGION 'Zzz'}
(*
procedure TMqttClientClass.ConnectPacketSend(IvProtocolName, IvProtocolLevel: string; AKeepAliveSeconds: integer);
var
  packet: TIdBytes;
  flags: byte;
  index, rle, rlb: integer; // remaininglength, remaininglengthbytes
begin
  Log('CONNECT request packet...');

  // init
  SetLength(packet, 1024);
  index := 0;

  // control packet 1 CONNECT    type + flags
  BytAdd($10, packet, index);    // --> 0001   0000   (no flags needed)

  // remaining length
  BytAdd($00, packet, index);    // will be updated at the end and can occupy from 1 to 4 bytes, depending on the total length of the variableheader + payload
//BytAdd($00, packet, index);
//BytAdd($00, packet, index);
//BytAdd($00, packet, index);

  // protocol name
  StrAdd(IvProtocolName, packet, index);

  // protocol level (3, 3.1, 5)
  StrAdd(IvProtocolLevel, packet, index);

  // flags (clean session,  will, username, password)
  flags := $02;            // = 0000 0010                         clean session
  if FWillTopic <> '' then
    flags := flags or $04; // = 0000 0010 + 0000 0100 = 0000 0110
  if FUsername <> '' then
    flags := flags or $80; // = 0000 0110 + 1000 0000 = 1000 0110
  if FPassword <> '' then
    flags := flags or $40; // = 1000 0110 + 0100 0000 = 1100 0110
  BytAdd(flags, packet, index);

  // keep alive (MSB, LSB)
  BytAdd($00              , packet, index);
  BytAdd(AKeepAliveSeconds, packet, index);

  // clientid
  StrAdd(AnsiString(FClientId), packet, index);

  // last will and testament
  if FWillTopic <> '' then begin
    StrAdd(AnsiString(FWillTopic), packet, index);
    StrAdd(AnsiString(FWillMessage), packet, index);
  end;

  // username and password
  if FUsername <> '' then
    StrAdd(AnsiString(FUsername), packet, index);
  if FPassword <> '' then
    StrAdd(AnsiString(FPassword), packet, index);

  // remaininglength
  rle := (index - 1) - (1) - (1);    // (totallen) - (ctrlheaderlen) - ()

  // remaininglengthbytes (length of the VARIABLE HEADER plus PAYLOAD) can occupy from 1 to 4 bytes
       if (rle >=       0) and (rle <       128) then rlb := 1  //                      0 bytes < remaininglength <         127 bytes -> stored in 1 byte
  else if (rle >=     128) and (rle <     16383) then rlb := 2  // 2^7  - 1 =         127 bytes < remaininglength <      16,383 bytes -> stored in 2 bytes
  else if (rle >=   16383) and (rle <   2097151) then rlb := 3  // 2^14 - 1 =      16,383 bytes < remaininglength <   2,097,151 bytes -> stored in 3 bytes
  else if (rle >= 2097151) and (rle < 268435455) then rlb := 4  // 2^21 - 1 =   2,097,151 bytes < remaininglength < 268,435,455 bytes -> stored in 4 bytes
  else                                                          // 0000000X 0000000X 0000000X 0000000X   (8th bit of each byte is a continuation bit so only  7, 14, 2, 28 bits can be used for a total of 2^28 = 268,435,456)
    raise Exception.Create('remaining length exceedes, message is to big');

  // 2nd byte but up to 4 might be added and set !!!
  Packet[1] := (index - 1) - (1 + rlb); // (lentotal) - ( + lenremaining)

  // trim
  SetLength(packet, index);

  // send
  FTCPClient.IOHandler.Write(packet);
end;
*)
{$ENDREGION}

end.
