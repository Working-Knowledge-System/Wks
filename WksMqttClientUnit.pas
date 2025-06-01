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
  , IdIOHandler
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
    FKeepAlivePingTimer: TTimer;
    FPacketIdCounter: word;

    // tcpipclient events
//    FOnTcpClientJoined: TNotifyEvent;
//    FOnTcpClientDisjoined: TNotifyEvent;

    // broker events
//    FOnBrokerConnected: TNotifyEvent{TOnMQTTClientConnect};
//    FOnBrokerDisconnected: TNotifyEvent{TOnMQTTClientDisconnect};
    FOnBrokerMessage: TOnMQTTMessage; {FOnBrokerIncomingMessage}

    // tcpipclient events handlers
    procedure OnServerJoinedHandler(Sender: TObject);
    procedure OnServerDisjoinedHandler(Sender: TObject);
    procedure OnServerDataReceivedHandler;

    // broker events handlers
    procedure OnConnectedHandler(Sender: TObject{AContext: TIdContext});    // to the broker
    procedure OnDisconnectedHandler(Sender: TObject{AContext: TIdContext}); // from the broker

    // keep alive routines
    procedure KeepAlivePingTimerHandler(Sender: TObject);

    // message routine
    procedure MessageDo(const ATopic: string; const AApplicationMessage: TBytes; AQoS: TMQTTQOSType; ARetain: boolean);

    // utils
    function  NextPacketIdGet: word;
  public
    constructor Create(ALogRichEdit, ARequestHexRichEdit, AResponseHexRichEdit: TRichEdit); override;
    destructor Destroy; override;
    procedure Join(AHost: string; APort: integer);
    procedure Disjoin;
    procedure ConnectPacketSend(IvProtocolLevel, IvQos: byte; AClientId, AWillTopic, AWillMessage, AUsername, APassword: string; IvCleanSession: boolean = true; AKeepAliveSeconds: word = 60);
    procedure PingReqPacketSend;
    procedure PublishPacketSend(APacketIdentifier, ATopicName, AApplicationMessage: string; AQosLevel: TMQTTQoSType; ADupFlag: boolean; ARetain: boolean);
    procedure DisconnectPacketSend;

    function  IsJoined{TcpClientJoined}: boolean;        // tcpclient is connected to tcpserver
    function  IsConnected{MqttClientConnected}: boolean; // mqttclient is connected mqttbroker

//    property OnBrokerConnected   : TNotifyEvent   read FOnBrokerConnected    write FOnBrokerConnected;
//    property OnBrokerDisconnected: TNotifyEvent   read FOnBrokerDisconnected write FOnBrokerDisconnected;
    property OnBrokerMessage: TOnMQTTMessage read FOnBrokerMessage write FOnBrokerMessage;
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
constructor TMqttClientClass.Create(ALogRichEdit, ARequestHexRichEdit, AResponseHexRichEdit: TRichEdit);
begin
  inherited Create(ALogRichEdit,  ARequestHexRichEdit, AResponseHexRichEdit);

  // tcpclient
  FTCPClient := TIdTCPClient.Create(nil);
  FTCPClient.OnConnected    := OnServerJoinedHandler;
  FTCPClient.OnDisconnected := OnServerDisjoinedHandler;
//FTCPClient.OnExecute      := OnServerDataReceivedHandler;
//FTCPClient.OnIncomingMessage :=

  // keep alive timer
  FKeepAlivePingTimer := TTimer.Create(nil);
  FKeepAlivePingTimer.OnTimer := KeepAlivePingTimerHandler;

  // other
  FPacketIDCounter := 1; // can go also in the ConnectPacketSend so packets id is tracked at connection level, not here
end;

destructor TMqttClientClass.Destroy;
begin
  // timer
  FKeepAlivePingTimer.Free;

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
  Result := FTCPClient.Connected; // *** nop, check if the server has an active connection about ***
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
    FKeepAlivePingTimer.Enabled := false;
    Log('client keep-alive ping timer stopped');

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

  {$REGION 'postprocess'}
  // start the keep-alive timer
  FKeepAlivePingTimer.Interval := AKeepAliveSeconds * 1000;
  FKeepAlivePingTimer.Enabled := true;

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
  remainlen: cardinal;
  {$ENDREGION}

begin
  Log('DISCONNECT packet send...');

  {$REGION 'packet'}
  packet := TMQTTPacketClass.Create;
  try

    {$REGION 'remaininglenght'}
    remainlen := 0;
    {$ENDREGION}

    {$REGION 'fixedheader'}
    packet.ByteWrite(Byte(ptDISCONNECT) shl 4); // $C0  1100 0000    type 14, flags reserved
    packet.RemainingLengthWrite(remainlen);     // $00  0000 0000    no variable header or payload
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

  {$REGION 'postprocess'}
  // close tcpip connection (eventually the gui should be updated)
  //FTCPClient.Disconnect;  *** for now we disconnect the tcpclient manually ***

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

  {$REGION 'var'}
var
  packet: TMQTTPacketClass;
  remainlen: cardinal;
  {$ENDREGION}

begin
  Log('PINGREQ packet send...');

  {$REGION 'packet'}
  packet := TMQTTPacketClass.Create;
  try

    {$REGION 'remaininglenght'}
    remainlen := 0;
    {$ENDREGION}

    {$REGION 'fixedheader'}
    packet.ByteWrite(Byte(ptPINGREQ) shl 4); // $C0  1100 0000    type 12, flags reserved
    packet.RemainingLengthWrite(remainlen);  // $00  0000 0000    no variable header or payload
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

  {$REGION 'postprocess'}
  // none
  {$ENDREGION}

end;

procedure TMqttClientClass.PublishPacketSend(APacketIdentifier, ATopicName, AApplicationMessage: string; AQosLevel: TMQTTQoSType; ADupFlag: boolean; ARetain: boolean);

  {$REGION 'protocoll'}
{
  A PUBLISH Control Packet is sent from a Client to a Server or from Server to a Client to transport an Application Message

  Fixed Header
   ----------------------------------------------------------------------------------------
  |   bit  |    7    |    6    |    5    |    4    |    3    |    2    |    1    |    0    |
  |----------------------------------------------------------------------------------------|
  |        |            packet type (3)            | DUP flg |     QoS level     | Retain  |
  | byte 1 |---------------------------------------|---------|-------------------|---------|
  |        |    0    |    0    |    1    |    1    |    0    |    0    |    0    |    0    |
  |--------|-------------------------------------------------------------------------------|
  |        |                               Remaining Length                      |         |
  | byte 2 |-------------------------------------------------------------------------------|
  |        |    0    |    0    |    0    |    0    |    0    |    0    |    0    |    0    |
   ----------------------------------------------------------------------------------------

  If the DUP flag is set to 0, it indicates that this is the first occasion that the Client or Server has attempted to send this MQTT PUBLISH Packet.
  If the DUP flag is set to 1, it indicates that this might be re-delivery of an earlier attempt to send the Packet.
  The DUP flag MUST be set to 1 by the Client or Server when it attempts to re-deliver a PUBLISH Packet.
  The DUP flag MUST be set to 0 for all QoS 0 messages;

  The value of the DUP flag from an incoming PUBLISH packet is not propagated when the PUBLISH Packet is sent to subscribers by the Server.
  The DUP flag in the outgoing PUBLISH packet is set independently to the incoming PUBLISH packet,
  its value MUST be determined solely by whether the outgoing PUBLISH packet is a retransmission.

  The recipient of a Control Packet that contains the DUP flag set to 1 cannot assume that it has seen an earlier copy of this packet.
  It is important to note that the DUP flag refers to the Control Packet itself and not to the Application Message that it contains.
  When using QoS 1, it is possible for a Client to receive a PUBLISH Packet with DUP flag set to 0 that contains a repetition of an Application Message that it received earlier,
  but with a different Packet Identifier.

  QoS level field indicates the level of assurance for delivery of an Application Message.
  The QoS levels are listed in the table below.

  QoS value   bit 2   bit 1   Description
  --------------------------------------------------
  0           0       0       at most once delivery
  1           0       1       at least once delivery
  2           1       0       exactly once delivery
  -           1       1       reserved – must not be used

  A PUBLISH Packet MUST NOT have both QoS bits set to 1.
  If a Server or Client receives a PUBLISH Packet which has both QoS bits set to 1 it MUST close the Network Connection.

  If the RETAIN flag is set to 1, in a PUBLISH Packet sent by a Client to a Server, the Server MUST store the Application Message and its QoS,
  so that it can be delivered to future subscribers whose subscriptions match its topic name.
  When a new subscription is established, the last retained message, if any, on each matching topic name MUST be sent to the subscriber.
  If the Server receives a QoS 0 message with the RETAIN flag set to 1 it MUST discard any message previously retained for that topic.
  It SHOULD store the new QoS 0 message as the new retained message for that topic, but MAY choose to discard it at any time.
  If this happens there will be no retained message for that topic.

  When sending a PUBLISH Packet to a Client the Server MUST set the RETAIN flag to 1 if a message is sent as a result of a new subscription being made by a Client.
  It MUST set the RETAIN flag to 0 when a PUBLISH Packet is sent to a Client because it matches an established subscription regardless of how the flag was set in the message it received.
  A PUBLISH Packet with a RETAIN flag set to 1 and a payload containing zero bytes will be processed as normal by the Server and sent to Clients with a subscription matching the topic name.
  Additionally any existing retained message with the same topic name MUST be removed and any future subscribers for the topic will not receive a retained message.
  “As normal” means that the RETAIN flag is not set in the message received by existing Clients.
  A zero byte retained message MUST NOT be stored as a retained message on the Server.
  If the RETAIN flag is 0, in a PUBLISH Packet sent by a Client to a Server, the Server MUST NOT store the message and MUST NOT remove or replace any existing retained message.

  Retained messages are useful where publishers send state messages on an irregular basis.
  A new subscriber will receive the most recent state.

  Remaining Length field contains the length of variable header plus the length of the payload.

  Variable Header
   ----------------------------------------------------------------------------------------
  |   bit  |    7    |    6    |    5    |    4    |    3    |    2    |    1    |    0    |
  |----------------------------------------------------------------------------------------|
  |                                       Topic Name                                       | a/b
  |----------------------------------------------------------------------------------------|
  | byte 1 |    0    |    0    |    0    |    0    |    0    |    0    |    0    |    0    | Length MSB (0)
  |--------|-------------------------------------------------------------------------------|
  | byte 2 |    0    |    0    |    0    |    0    |    0    |    0    |    0    |    0    | Length LSB (3)
  |--------|-------------------------------------------------------------------------------|
  | byte 3 |    0    |    0    |    0    |    0    |    0    |    0    |    0    |    0    | "a"  $61
  |--------|-------------------------------------------------------------------------------|
  | byte 4 |    0    |    0    |    0    |    0    |    0    |    0    |    0    |    0    | "/"  $2F
  |--------|-------------------------------------------------------------------------------|
  | byte 5 |    0    |    0    |    0    |    0    |    0    |    0    |    0    |    0    | "b"  $62
  |----------------------------------------------------------------------------------------|
  |                                    Packet Identifier                                   | 10
  |----------------------------------------------------------------------------------------|
  | byte 6 |    0    |    0    |    0    |    0    |    0    |    0    |    0    |    0    | Packet Identifier MSB (0)
  |--------|-------------------------------------------------------------------------------|
  | byte 7 |    0    |    0    |    0    |    0    |    1    |    0    |    1    |    0    | Packet Identifier LSB (3)
   ----------------------------------------------------------------------------------------

  The variable header contains the following fields in the order: Topic Name, Packet Identifier.

  The Topic Name identifies the information channel to which payload data is published.
  The Topic Name MUST be present as the first field in the PUBLISH Packet Variable header.
  It MUST be a UTF-8 encoded string.
  The Topic Name in the PUBLISH Packet MUST NOT contain wildcard characters.
  The Topic Name in a PUBLISH Packet sent by a Server to a subscribing Client MUST match the Subscription’s Topic Filter according to the matching process.
  However, since the Server is permitted to override the Topic Name, it might not be the same as the Topic Name in the original PUBLISH Packet.

  The Packet Identifier field is only present in PUBLISH Packets where the QoS level is 1 or 2.

  Payload
  The Payload contains the Application Message that is being published.
  The content and format of the data is application specific.
  The length of the payload can be calculated by subtracting the length of the variable header from the Remaining Length field that is in the Fixed Header.
  It is valid for a PUBLISH Packet to contain a zero length payload.

  Response
  The receiver of a PUBLISH Packet MUST respond according to the following Table as determined by the QoS in the PUBLISH Packet.

  QoS Level   Expected Publish Packet Response
  --------------------------------------------
  QoS 0       None
  QoS 1       PUBACK Packet
  QoS 2       PUBREC Packet

  Actions
  The Client uses a PUBLISH Packet to send an Application Message to the Server, for distribution to Clients with matching subscriptions.
  The Server uses a PUBLISH Packet to send an Application Message to each Client which has a matching subscription.

  When Clients make subscriptions with Topic Filters that include wildcards, it is possible for a Client’s subscriptions to overlap so that a published message might match multiple filters.
  In this case the Server MUST deliver the message to the Client respecting the maximum QoS of all the matching subscriptions.
  In addition, the Server MAY deliver further copies of the message, one for each additional matching subscription and respecting the subscription’s QoS in each case.

  The action of the recipient when it receives a PUBLISH Packet depends on the QoS level.
  If a Server implementation does not authorize a PUBLISH to be performed by a Client; it has no way of informing that Client.
  It MUST either make a positive acknowledgement, according to the normal QoS rules, or close the Network Connection.
}
  {$ENDREGION}

  {$REGION 'var'}
var
  packet: TMQTTPacketClass;
  ctrlbyte, ctrlflags: byte;
  remainlen: cardinal;
  msg: TMQTTMessageRec;
  {$ENDREGION}

begin
  Log('PUBLISH packet send...');

  {$REGION 'packet'}
  packet := TMQTTPacketClass.Create;
  try

    {$REGION 'remaininglenght'}
    remainlen :=
      VarLenFieldLength(ATopicName)
    + VarLenFieldLength(APacketIdentifier)
    + VarLenFieldLength(AApplicationMessage);
    {$ENDREGION}

    {$REGION 'fixedheader'}
    ctrlbyte := Byte(ptPUBLISH) shl 4;                                 // $00  0011 0000
    if ADupFlag                      then ctrlbyte := ctrlbyte or $08; // $00  0000 1000
    if AQosLevel = qostAT_LEAST_ONCE then ctrlbyte := ctrlbyte or $02; // $00  0000 0010
    if AQosLevel = qostEXACTLY_ONCE  then ctrlbyte := ctrlbyte or $04; // $00  0000 0100
    if ARetain                       then ctrlbyte := ctrlbyte or $01; // $00  0000 0001
    packet.ByteWrite(ctrlbyte);                                        // $3.  0011 ....    type 3, flags: dupflag, qoslevel, retain
    packet.RemainingLengthWrite(remainlen);                            // $..  .... ....    it depend
    {$ENDREGION}

    {$REGION 'variableheader'}
    packet.StringWrite(ATopicName);
    packet.StringWrite(APacketIdentifier);
    {$ENDREGION}

    {$REGION 'payload'}
    packet.StringWrite(AApplicationMessage);
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

  {$REGION 'postprocess'}
  // none
  {$ENDREGION}

  {$REGION 'zzz'}
  {
  packet := TMQTTPacketClass.Create;
  try
    // Writing a message
    msg.TopicName                  := ATopicName;
    msg.ApplicationMessage         := TEncoding.UTF8.GetBytes(AApplicationMessage);
    msg.QoS                        := AQosLevel;
    msg.Retain                     := ARetain;
    msg.PacketIdOrClientIdentifier := 1;
    packet.MessageWrite(msg);

    // Reading back
    packet.Stream.Position := 0;
    msg := Packet.MessageRead;
    Log('Received: ' + TEncoding.UTF8.GetString(msg.ApplicationMessage));
  finally
    packet.Free;
  end;
  }
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

procedure TMqttClientClass.OnServerDataReceivedHandler;
var
  io: TIdIOHandler{TIdIOHandlerSocket};
  packet: TMQTTPacketClass;
  size: cardinal;
  ctrlbyte: byte;
  packettype: TMQTTPacketType;
  appmessage: TMQTTMessageRec;
begin
  packet := TMQTTPacketClass.Create;
  try
    // zip
    io := FTCPClient.IOHandler;

    // exit
//    if io.InputBufferIsEmpty or (not io.Readable) then begin
//      io.CheckForDataOnSource(10);
//      if io.InputBufferIsEmpty then
//        Exit;
//    end;

    // read all in the packet's stream
    size := io.ReadInt32;
    io.ReadStream(packet.Stream, {-1}size, false);
    packet.Stream.Position := 0;
    Log('received bytes         (%d bytes)', [packet.Len]);
    Log('                       (%s)'      , [packet.AsAscii]);
    Log('                       (%s)'      , [packet.AsHex]);
    Log('                       (%s)'      , [packet.AsChar]);

    // read 1st byte for packettype andflags
    ctrlbyte := packet.ByteRead;
    packet.Stream.Position := 0;

    // type
    packettype := TMQTTPacketType((ctrlbyte and $F0) shr 4);

    // process the various packets types
    case packettype of
      ptCONNACK: begin
        // handle connection acknowledgement
      end;
      ptPUBLISH: begin
        Log('received PUBLISH (3) packet');

        // handle message from server related to subsciptions
        appmessage := packet.MessageRead;
        MessageDo(appmessage.TopicName, appmessage.ApplicationMessage, appmessage.QoS, appmessage.Retain);

        // send acknowledgements based on QoS
//        case appmessage.QoS of
//          qostAT_LEAST_ONCE: PubAckSend(appmessage.PacketIdOrClientIdentifier);
//          qostEXACTLY_ONCE : PubRecSend(appmessage.PacketIdOrClientIdentifier);
//        end;
      end;

      ptPINGRESP: begin
        Log('received PINGRESP (13) packet');

        // reset ping timer
        FKeepAlivePingTimer.Enabled := false;
        FKeepAlivePingTimer.Enabled := true;
      end;
    end;
  finally
    packet.Free;
  end;
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
procedure TMqttClientClass.KeepAlivePingTimerHandler(Sender: TObject);
begin

end;
{$ENDREGION}

{$REGION 'Message'}
procedure TMqttClientClass.MessageDo(const ATopic: string; const AApplicationMessage: TBytes; AQoS: TMQTTQOSType; ARetain: boolean);
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
