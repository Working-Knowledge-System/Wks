unit WksMqttClientUnit;

interface

{$REGION 'Use'}
uses
    System.SysUtils
  , System.Classes
  , Vcl.StdCtrls
  , Vcl.ComCtrls
  , Vcl.ExtCtrls
  , IdGlobal
  , IdException
  , IdStack
  , IdTCPClient
  , IdIOHandler
  , SynEdit
  , WksMqttTypesUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TMqttClientClass = class(TMqttClass)
  private
    // mqttfields
    FTCPClient: TIdTCPClient;
    FKeepAlivePingTimer: TTimer;
    FPacketIdCounter: word;
    FIsConnected: boolean; // set to true if has received the the CONNACK packet

    // wksfields
    FObjectKind: string;
    FObjectId: integer;

    // tcpipclient events
//    FOnTcpClientJoined: TNotifyEvent;
//    FOnTcpClientDisjoined: TNotifyEvent;

    // broker events
//    FBrokerOnConnected: TNotifyEvent{TMQTTClientOnConnect};
//    FBrokerOnDisconnected: TNotifyEvent{TMQTTClientOnDisconnect};
    FBrokerOnMessage: TMQTTOnMessage; {FOnBrokerIncomingMessage}

    // tcpipclient events handlers
    procedure OnServerJoinedHandler(Sender: TObject);
    procedure OnServerDisjoinedHandler(Sender: TObject);
    procedure OnServerDataReceivedHandler; // OnBrokerPacketProcess; *** incoming packets ***

    // broker events handlers
    procedure OnConnectedHandler(Sender: TObject{AContext: TIdContext});    // to the broker
    procedure OnDisconnectedHandler(Sender: TObject{AContext: TIdContext}); // from the broker

    // keep alive routines
    procedure KeepAlivePingTimerHandler(Sender: TObject);

    // utils
    function  NextPacketIdGet: word;
    function  IsJoinedGet: boolean;
    function  ClientIdentifierGet: string;
  public
    constructor Create(ALogStrings: TStrings; ALogVerbose, ALogRawAscii, ALogRawHex, ALogRawChar: TCheckBox); override;
    destructor Destroy; override;
    procedure Join(AHost: string; APort: integer);
    procedure Disjoin;
    procedure ConnectPacketSend(IvProtocolLevel, IvQos: byte; AClientIdentifier, AWillTopic, AWillMessage, AUsername, APassword: string; IvCleanSession: boolean = true; AKeepAliveSeconds: word = 60);
    procedure PublishPacketSend(APacketIdentifier: word; ATopicName, AApplicationMessage: string; AQosLevel: TMqttQoSType = qostAT_MOST_ONCE; ADupFlag: boolean = False; ARetain: boolean = false);
    procedure SubscribePacketSend(APacketIdentifier: word; ASubscribeTopicRecVec: TMqttSubscribeTopicRecVec);
    procedure UnsubscribePacketSend(APacketIdentifier: word; AUnsubscribeTopicRecVec: TMqttUnsubscribeTopicRecVec);
    procedure PingReqPacketSend;
    procedure DisconnectPacketSend;
    procedure KeepAlivePingTimerReset;

//  property BrokerOnConnected   : TNotifyEvent   read FBrokerOnConnected    write FBrokerOnConnected;
//  property BrokerOnDisconnected: TNotifyEvent   read FBrokerOnDisconnected write FBrokerOnDisconnected;
    property BrokerOnMessage     : TMQTTOnMessage read FBrokerOnMessage      write FBrokerOnMessage;

    property ObjectKind          : string         read FObjectKind           write FObjectKind;
    property ObjectId            : integer        read FObjectId             write FObjectId;
    property ClientIdentifier    : string         read ClientIdentifierGet;
    property NextPacketId        : word           read NextPacketIdGet;
    property IsJoined{TcpClientJoined}: boolean   read IsJoinedGet;       // tcpclient is connected to tcpserver
    property IsConnected{MqttClientConnected}: boolean read FIsConnected; // mqttclient is connected to mqttbroker
  end;
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    WksMqttUtilsUnit
  ;
{$ENDREGION}

{$REGION 'TMqttClientClass'}
constructor TMqttClientClass.Create(ALogStrings: TStrings; ALogVerbose, ALogRawAscii, ALogRawHex, ALogRawChar: TCheckBox);
begin
  inherited Create(ALogStrings, ALogVerbose, ALogRawAscii, ALogRawHex, ALogRawChar);

  // tcpclient
  FTCPClient := TIdTCPClient.Create(nil);
  FTCPClient.OnConnected    := OnServerJoinedHandler;
  FTCPClient.OnDisconnected := OnServerDisjoinedHandler;
//FTCPClient.OnExecute      := OnServerDataReceivedHandler;
//FTCPClient.OnIncomingMessage :=

  // keep alive timer
  FKeepAlivePingTimer := TTimer.Create(nil);
  FKeepAlivePingTimer.Enabled := false;
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

function TMqttClientClass.IsJoinedGet: boolean;
begin
  Result := FTCPClient.Connected;
end;

//function  TMqttClientClass.IsConnected: boolean;
//begin
//  Result := FTCPClient.Connected; // *** nop, check if the server has an active connection about, so if has received the CONNACK packet ***
//end;

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

    FTCPClient.IOHandler.CloseGracefully; // from the tcpip server
    Log('client join closed gracefully');

    FTCPClient.Disconnect; // from the tcpip server
    Log('client disjoined from server %s:%d', [FTCPClient.Host, FTCPClient.Port]);
  except
    on e: Exception do
      Log('client disjoining failed: %s', [e.Message.Replace(sLineBreak, ' ')]);
  end;
end;

function  TMqttClientClass.ClientIdentifierGet: string;
begin
  Result := Format('%s.%d', [FObjectKind, FObjectId]);
end;

procedure TMqttClientClass.ConnectPacketSend(IvProtocolLevel, IvQos: byte; AClientIdentifier, AWillTopic, AWillMessage, AUsername, APassword: string; IvCleanSession: boolean; AKeepAliveSeconds: word);

  {$REGION 'protocoll'}
{
   -----------------------   -----------------------------------------------------------------------------------------------------------------------   --------------
  | FIXED HEADER (2 bytes)| | VARIABLE HEADER (10 bytes)                                                                                            | |   PAY LOAD   |
  |-----------------------| |                                                                                                                       | |              |
  | CTRL BYTE | REMAINLEN | |                                                                                                                       | |   0-M bytes  |
  |-----------|-----------| |-----------------------------------------------------------------------------------------------------------------------| |--------------|
  |type | flgs|           | |         strlen        |                  Protocol Name                | prot lev  | connflags |  keepalive every sec  | |              |
  |-----------|-----------| |-----------------------|-----------------------------------------------|-----------|-----------|-----------------------| |              |
  | byte 0    | byte 1-4  | | byte 5    | byte 6    | byte 7    | byte 8    | byte 9    | byte 10   | byte 11   | byte 12   | byte 13   | byte 14   | |  byte 15...  |
  |-----------|-----------| |-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------------------| |--------------|
  | 0001 0000 | 0000 0000 | | 0000 0000 | 0000 0100 | 0100 1101 | 0101 0001 | 0101 0100 | 0101 0100 | 0000 0100 | 0000 0000 | 0000 0000   0000 0000 | |              |
  |        16 |         0 | |         0 |         4 |        77 |        81 |        84 |        84 |         4 |         4 |         0          60 | |              |
  |       $10 |       $00 | |       $00 |       $04 |       $4D |       $51 |       $54 |       $54 |       $04 |       $00 |       $00         $3C | |              |
  |         . |         . | |         . |         . |         M |         Q |         T |         T |         . |         . |         .           < | |              |
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
  packet: TMqttPacketClass;
  remainlen: cardinal;
  connectflags: byte;
  willflag: boolean;
  {$ENDREGION}

begin
  if LogVerbose.Checked then Log('CONNECT packet send...');

  {$REGION 'packet'}
  packet := TMqttPacketClass.Create;
  try

    {$REGION 'remaininglenght'}
    remainlen :=
      10
    + VarLenFieldLength(AClientIdentifier)
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
                                  Packet.StringWrite(AClientIdentifier); // clientidentifier
    if willflag then begin
                                  Packet.StringWrite(AWillTopic);        // willtopic
                                  Packet.StringWrite(AWillMessage);      // willmessage
    end;
    if not AUsername.IsEmpty then Packet.StringWrite(AUsername);         // username
    if not APassword.IsEmpty then Packet.StringWrite(APassword);         // password
    {$ENDREGION}

    {$REGION 'send'}
    FTCPClient.IOHandler.Write(packet.Stream, 0, not true); // true indicates WriteByteCount for the server to read it!
    if LogVerbose.Checked  then Log('CONNECT packet sent    (%d bytes)', [packet.Len]);
    if LogRawAscii.Checked then Log('                       (%s)'      , [packet.AsAscii]);
    if LogRawHex.Checked   then Log('                       (%s)'      , [packet.AsHex]);
    if LogRawChar.Checked  then Log('                       (%s)'      , [packet.AsChar]);
    {$ENDREGION}

  finally
    packet.Free;
  end;
  {$ENDREGION}

if FIsConnected then begin

  {$REGION 'timer'}
  // start the keep-alive timer
  FKeepAlivePingTimer.Interval := AKeepAliveSeconds * 1000;
  FKeepAlivePingTimer.Enabled := true;
  {$ENDREGION}

  {$REGION 'events'}
  // fire event
//if Assigned(FOnConnected) then
//  FOnConnected(Self);
  {$ENDREGION}

end;

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
  | CTRL BYTE | REMAINLEN |
  |-----------|-----------|
  |type | flgs|           |
  |-----------|-----------|
  | byte 0    | byte 1    |
  |-----------|-----------|
  | 1110 0000 | 0000 0000 |
  |       224 |         0 |
  |        E0 |        00 |
  |         Ã |         . |
   -----------------------
}
  {$ENDREGION}

  {$REGION 'var'}
var
  packet: TMqttPacketClass;
  remainlen: cardinal;
  {$ENDREGION}

begin
  if LogVerbose.Checked then Log('DISCONNECT packet send...');

  {$REGION 'packet'}
  packet := TMqttPacketClass.Create;
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
    FTCPClient.IOHandler.Write(packet.Stream, 0, not true);
    if LogVerbose.Checked  then Log('DISCONNECT packet sent (%d bytes)', [packet.Len]);
    if LogRawAscii.Checked then Log('                       (%s)'      , [packet.AsAscii]);
    if LogRawHex.Checked   then Log('                       (%s)'      , [packet.AsHex]);
    if LogRawChar.Checked  then Log('                       (%s)'      , [packet.AsChar]);
    {$ENDREGION}

  finally
    packet.Free;
  end;
  {$ENDREGION}

  {$REGION 'events'}
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
  | CTRL BYTE | REMAINLEN |
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
  packet: TMqttPacketClass;
  remainlen: cardinal;
  {$ENDREGION}

begin
  if LogVerbose.Checked then Log('PINGREQ packet send...');

  {$REGION 'packet'}
  packet := TMqttPacketClass.Create;
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
    FTCPClient.IOHandler.Write(packet.Stream, 0, not true);
    if LogVerbose.Checked  then Log('PINGREQ packet sent    (%d bytes)', [packet.Len]);
    if LogRawAscii.Checked then Log('                       (%s)'      , [packet.AsAscii]);
    if LogRawHex.Checked   then Log('                       (%s)'      , [packet.AsHex]);
    if LogRawChar.Checked  then Log('                       (%s)'      , [packet.AsChar]);
    {$ENDREGION}

  finally
    packet.Free;
  end;
  {$ENDREGION}

  {$REGION 'events'}
  // none
  {$ENDREGION}

end;

procedure TMqttClientClass.PublishPacketSend(APacketIdentifier: word; ATopicName, AApplicationMessage: string; AQosLevel: TMqttQoSType; ADupFlag: boolean; ARetain: boolean);

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
  "As normal" means that the RETAIN flag is not set in the message received by existing Clients.
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
  The Topic Name in a PUBLISH Packet sent by a Server to a subscribing Client MUST match the Subscription's Topic Filter according to the matching process.
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

  When Clients make subscriptions with Topic Filters that include wildcards, it is possible for a Client's subscriptions to overlap so that a published message might match multiple filters.
  In this case the Server MUST deliver the message to the Client respecting the maximum QoS of all the matching subscriptions.
  In addition, the Server MAY deliver further copies of the message, one for each additional matching subscription and respecting the subscription's QoS in each case.

  The action of the recipient when it receives a PUBLISH Packet depends on the QoS level.
  If a Server implementation does not authorize a PUBLISH to be performed by a Client; it has no way of informing that Client.
  It MUST either make a positive acknowledgement, according to the normal QoS rules, or close the Network Connection.
}
  {$ENDREGION}

  {$REGION 'var'}
var
  packet: TMqttPacketClass;
  ctrlbyte, ctrlflags: byte;
  remainlen: integer;
  msg: TMqttMessageRec;
  {$ENDREGION}

begin
  if LogVerbose.Checked then Log('PUBLISH packet send...');

  {$REGION 'packet'}
  packet := TMqttPacketClass.Create;
  try

    {$REGION 'remaininglenght'}
    remainlen := VarLenFieldLength(ATopicName);
  if (AQosLevel = qostAT_LEAST_ONCE) or (AQosLevel = qostEXACTLY_ONCE) then
    remainlen := remainlen + 2; // apacketidentifier
    remainlen := remainlen + {VarLenField}Length(AApplicationMessage); // *** just the length of the string, no 2bytes prefix for strlen! ***
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
  if (AQosLevel = qostAT_LEAST_ONCE) or (AQosLevel = qostEXACTLY_ONCE) then begin
    packet.ByteWrite(Hi(APacketIdentifier));
    packet.ByteWrite(Lo(APacketIdentifier));
  end;
    {$ENDREGION}

    {$REGION 'payload'}
    packet.BytesWrite(TEncoding.UTF8.GetBytes(AApplicationMessage)); // *** not a variable field, no 2bytes len prefix! ***
    {$ENDREGION}

    {$REGION 'send'}
    FTCPClient.IOHandler.Write(packet.Stream, 0, not true);
    if LogVerbose.Checked  then Log('PINGREQ packet sent    (%d bytes)', [packet.Len]);
    if LogRawAscii.Checked then Log('                       (%s)'      , [packet.AsAscii]);
    if LogRawHex.Checked   then Log('                       (%s)'      , [packet.AsHex]);
    if LogRawChar.Checked  then Log('                       (%s)'      , [packet.AsChar]);
    {$ENDREGION}

  finally
    packet.Free;
  end;
  {$ENDREGION}

  {$REGION 'events'}
  // none
  {$ENDREGION}

  {$REGION 'zzz'}
  {
  packet := TMqttPacketClass.Create;
  try
    // Writing a message
    msg.TopicName          := ATopicName;
    msg.ApplicationMessage := TEncoding.UTF8.GetBytes(AApplicationMessage);
    msg.QoS                := AQosLevel;
    msg.Retain             := ARetain;
    msg.PacketIdentifier   := 1;
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

procedure TMqttClientClass.SubscribePacketSend(APacketIdentifier: word; ASubscribeTopicRecVec: TMqttSubscribeTopicRecVec);

  {$REGION 'protocoll'}
{
   -----------------------   -----------------------   -----------------------------------------------------------------------------------------------------------------------------
  | FIXEDHEADER (2-5bytes)| | VARIABLE HEADER       | |   PAY LOAD                                                                                                                  |
  |-----------------------| | (2 bytes)             | |                                                                                                                             |
  | CTRL BYTE | REMAINLEN | |                       | |   0-M bytes                                                                                                                 |
  |-----------|-----------| |-----------------------| |------------------------------------------------------------------------------------------------------------------------------
  |type | flgs|           | |       packet id       | |        str len        |     topic filter 1    | Req. QoA  |     |        str len        |     topic filter N    | Req. QoA  |
  |-----------|-----------| |-----------------------| |-----------------------|-----------------------|-----------|     |-----------------------|-----------------------|-----------|
  | byte 0    | byte 1-4  | | byte  MSB | byte  LSB | | byte  MSB | byte  LSB | byte  ... | byte  ... | byte      | ... | byte  MSB | byte  LSB | byte  ... | byte  ... | byte      |
  |-----------|-----------| |-----------|-----------| |-----------|-----------|-----------|-----------|-----------|     |-----------|-----------|-----------|-----------|-----------|
  | 1000 0000 | 0000 0000 | | 0000 0000 | 0000 0000 | | 0000 0000 | 0000 0000 | 0000 0000 | 0000 0000 | 0000 00XX |     | 0000 0000 | 0000 0000 | 0000 0000 | 0000 0000 | 0000 00XX |
  |       128 |         0 | |         0 |         0 | |         0 |         0 |         0 |         0 |         0 |     |         0 |         0 |         0 |         0 |         0 |
  |       $80 |       $00 | |       $00 |       $00 | |       $00 |       $00 |       $00 |       $00 |       $00 |     |       $00 |       $00 |       $00 |       $00 |       $00 |
  |         . |         . | |         . |         . | |         . |         . |         . |         . |         . |     |         . |         . |         . |         . |         . |
   -----------------------   -----------------------   -----------------------------------------------------------------------------------------------------------------------------
}
  {$ENDREGION}

  {$REGION 'var'}
var
  packet: TMqttPacketClass;
  remainlen: integer;
  ctrlbyte: byte;
  i: integer;
  {$ENDREGION}

begin
  if LogVerbose.Checked then Log('SUBSCRIBE packet send...');

  {$REGION 'packet'}
  packet := TMqttPacketClass.Create;
  try

    {$REGION 'remaininglenght'}
    remainlen := 1 + 1 + 1 + 1;
    for i := Low(ASubscribeTopicRecVec) to High(ASubscribeTopicRecVec) do
      remainlen := remainlen + VarLenFieldLength(ASubscribeTopicRecVec[i].TopicFilter) + 1;
    {$ENDREGION}

    {$REGION 'fixedheader'}
    ctrlbyte := Byte(ptSUBSCRIBE) shl 4; // $08  1000 0000
    packet.ByteWrite(ctrlbyte);
    packet.RemainingLengthWrite(remainlen);
    {$ENDREGION}

    {$REGION 'variableheader'}
    packet.ByteWrite(Hi(APacketIdentifier));
    packet.ByteWrite(Lo(APacketIdentifier));
    {$ENDREGION}

    {$REGION 'payload'}
    for i := Low(ASubscribeTopicRecVec) to High(ASubscribeTopicRecVec) do begin
      packet.StringWrite(ASubscribeTopicRecVec[i].TopicFilter);
      packet.WordWrite(Ord(ASubscribeTopicRecVec[i].RequestedQoS));
    end;
    {$ENDREGION}

    {$REGION 'send'}
    FTCPClient.IOHandler.Write(packet.Stream, 0, not true);
    if LogVerbose.Checked  then Log('SUBSCRIBE packet sent  (%d bytes)', [packet.Len]);
    if LogRawAscii.Checked then Log('                       (%s)'      , [packet.AsAscii]);
    if LogRawHex.Checked   then Log('                       (%s)'      , [packet.AsHex]);
    if LogRawChar.Checked  then Log('                       (%s)'      , [packet.AsChar]);
    {$ENDREGION}

  finally
    packet.Free;
  end;
  {$ENDREGION}

  {$REGION 'events'}
  // ?
  {$ENDREGION}

end;

procedure TMqttClientClass.UnsubscribePacketSend(APacketIdentifier: word; AUnsubscribeTopicRecVec: TMqttUnsubscribeTopicRecVec);

  {$REGION 'protocoll'}
{
   -----------------------  -----------------------   -----------------------------------------------------------------------------------------------------
  | FIXEDHEADER (2-5bytes)|| VARIABLE HEADER       | |   PAY LOAD                                                                                          |
  |-----------------------|| (2 bytes)             | |                                                                                                     |
  | CTRL BYTE | REMAINLEN ||                       | |   0-M bytes                                                                                         |
  |-----------|-----------||-----------------------| |------------------------------------------------------------------------------------------------------
  |type | flgs|           ||       packet id       | |        str len        |     topic filter 1    |     |        str len        |     topic filter N    |
  |-----------|-----------||-----------------------| |-----------------------|-----------------------|     |-----------------------|-----------------------|
  | byte 0    | byte 1-4  || byte  MSB | byte  LSB | | byte  MSB | byte  LSB | byte  ... | byte  ... | ... | byte  MSB | byte  LSB | byte  ... | byte  ... |
  |-----------|-----------||-----------|-----------| |-----------|-----------|-----------|-----------|     |-----------|-----------|-----------|-----------|
  | 1010 0000 | 0000 0000 || 0000 0000 | 0000 0000 | | 0000 0000 | 0000 0000 | 0000 0000 | 0000 0000 |     | 0000 0000 | 0000 0000 | 0000 0000 | 0000 0000 |
  |       160 |         0 ||         0 |         0 | |         0 |         0 |         0 |         0 |     |         0 |         0 |         0 |         0 |
  |       $A0 |       $00 ||       $00 |       $00 | |       $00 |       $00 |       $00 |       $00 |     |       $00 |       $00 |       $00 |       $00 |
  |         . |         . ||         . |         . | |         . |         . |         . |         . |     |         . |         . |         . |         . |
   -----------------------  -----------------------   -----------------------------------------------------------------------------------------------------
}
  {$ENDREGION}

  {$REGION 'var'}
var
  packet: TMqttPacketClass;
  remainlen: cardinal;
  ctrlbyte: byte;
  i: integer;
  {$ENDREGION}

begin
  if LogVerbose.Checked then Log('UNSUBSCRIBE packet send...');

  {$REGION 'packet'}
  packet := TMqttPacketClass.Create;
  try

    {$REGION 'remaininglenght'}
    remainlen := 1 + 1 {+ 1 + 1};
    for i := Low(AUnsubscribeTopicRecVec) to High(AUnsubscribeTopicRecVec) do
      remainlen := remainlen + VarLenFieldLength(AUnsubscribeTopicRecVec[i].TopicFilter);
    {$ENDREGION}

    {$REGION 'fixedheader'}
    ctrlbyte := Byte(ptUNSUBSCRIBE) shl 4; // $A0  1010 0000
    packet.ByteWrite(ctrlbyte);
    packet.RemainingLengthWrite(remainlen);
    {$ENDREGION}

    {$REGION 'variableheader'}
    packet.ByteWrite(Hi(APacketIdentifier));
    packet.ByteWrite(Lo(APacketIdentifier));
    {$ENDREGION}

    {$REGION 'payload'}
    for i := Low(AUnsubscribeTopicRecVec) to High(AUnsubscribeTopicRecVec) do
      packet.StringWrite(AUnsubscribeTopicRecVec[i].TopicFilter);
    {$ENDREGION}

    {$REGION 'send'}
    FTCPClient.IOHandler.Write(packet.Stream, 0, not true);
    if LogVerbose.Checked  then Log('UNSUBSCRIBE packet sent(%d bytes)', [packet.Len]);
    if LogRawAscii.Checked then Log('                       (%s)'      , [packet.AsAscii]);
    if LogRawHex.Checked   then Log('                       (%s)'      , [packet.AsHex]);
    if LogRawChar.Checked  then Log('                       (%s)'      , [packet.AsChar]);
    {$ENDREGION}

  finally
    packet.Free;
  end;
  {$ENDREGION}

  {$REGION 'events'}
  // ?
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'TCPClientHandlers'}
procedure TMqttClientClass.OnServerJoinedHandler(Sender: TObject);
begin
  //Log('client joined to server %s:%d', [FTCPClient.Host, FTCPClient.Port]);
end;

procedure TMqttClientClass.OnServerDisjoinedHandler(Sender: TObject);
begin
  //Log('client disjoined from server %s:%d', [FTCPClient.Host, FTCPClient.Port]);
end;

procedure TMqttClientClass.OnServerDataReceivedHandler;
var
  decoder: TMqttStreamDecoder;
  packet: TMqttPacketClass;
  io: TIdIOHandler;
  ip: string;
  bytes: TIdBytes;
  packetbytes: TBytes;
  ctrlbyte: byte;
  packettype: TMqttPacketType;

//  size{, packetnumber}: cardinal;
//  appmessage: TMqttMessageRec;
//  fixedheader: byte;
begin
  decoder := TMqttStreamDecoder.Create;
  packet := TMqttPacketClass.Create;
  try
    while FTCPClient.Connected do begin
      // zip
      io := FTCPClient.IOHandler;

      // exit
      if io.InputBufferIsEmpty then begin
        io.CheckForDataOnSource(10);
        if io.InputBufferIsEmpty then
          Exit;
      end;
//        if not io.Readable then begin
//          io.CheckForDataOnSource(10);
//          if io.InputBufferIsEmpty then
//            Exit;
//        end;

      // serverip
      ip := FTCPClient.BoundIP;

      // read all in a bytes buffer
      io.InputBuffer.ExtractToBytes(bytes, -1, False, -1); // or: io.ReadBytes(bytes, -1, False);

      // addtodecoder
      decoder.DataAppend(TBytes(bytes));

      // packetbypacket
//      packetnumber := 0;
      while decoder.PacketTryExtract(packetbytes) do begin
        try
          // count
//          Inc(packetnumber);

          // read all in the packet's stream
          packet.Stream.Clear;
          packet.StreamFromBytes(packetbytes);

          // log
          if LogVerbose.Checked  then Log('%s: received %d bytes', [ip, packet.Len]);
          if LogRawAscii.Checked then Log('%s: (%s)'             , [ip, packet.AsAscii]);
          if LogRawHex.Checked   then Log('%s: (%s)'             , [ip, packet.AsHex]);
          if LogRawChar.Checked  then Log('%s: (%s)'             , [ip, packet.AsChar]);

          // read 1st byte for packettype and flags
          ctrlbyte := packet.ByteRead;
          packet.Stream.Position := 0;

          // type
          packettype := TMqttPacketType((ctrlbyte and $F0) shr 4);

          // process the various packets types
          case packettype of

            {$REGION 'CONNACK 1 packet'}
            ptCONNACK: begin
              if LogVerbose.Checked then
                Log('%s: received RESERVED (0) packet', [ip]);
//              if LogVerbose.Checked then
//                Dmp(packet.AsChar);

              // handle connection acknowledgement
              // ...
            end;
            {$ENDREGION}

            {$REGION 'PUBLISH 3 packet'}
            ptPUBLISH: begin
              if LogVerbose.Checked then Log('received PUBLISH (3) packet');

              // handle message from server related to subsciptions
//              appmessage := packet.MessageRead;
              // ...

              // send acknowledgements based on qos
      //        case appmessage.QoS of
      //          qostAT_LEAST_ONCE: PubAckSend(appmessage.PacketIdentifier);
      //          qostEXACTLY_ONCE : PubRecSend(appmessage.PacketIdentifier);
      //        end;
            end;
            {$ENDREGION}

            {$REGION 'PINGRESP 13 packet'}
            ptPINGRESP: begin
              if LogVerbose.Checked then Log('received PINGRESP (13) packet');

              // reset ping timer
              KeepAlivePingTimerReset;
            end;
            {$ENDREGION}

          else
            Log('%s: received UNKNOWN packet', [ip]);
          end;

        except
          on e: EIdConnClosedGracefully do begin
            Log('%s: Server disconnected gracefully', [ip]);
          end;
          on e: EIdSocketError do begin
            if e.LastError = 10054 then
              Log('%s: Connection reset by peer', [ip])
            else
              Log('%s: Socket error: %s', [ip, e.Message]);
          end;
          on e: Exception do begin // general error
            Log('%s: %s', [ip, e.Message]);

            // disconnect client
            FTCPClient.Disconnect;
          end;
        end;
      end;

    end;
  finally
    packet.Free;
    decoder.Free;
  end;
end;
{$ENDREGION}

{$REGION 'BrokerHandlers'}
procedure TMqttClientClass.OnConnectedHandler(Sender: TObject);
begin
  if LogVerbose.Checked then
    Log('client connected to broker %s:%d', [FTCPClient.Host, FTCPClient.Port]);
end;

procedure TMqttClientClass.OnDisconnectedHandler(Sender: TObject);
begin
  if LogVerbose.Checked then
    Log('client disconnected from broker %s:%d', [FTCPClient.Host, FTCPClient.Port]);
end;
{$ENDREGION}

{$REGION 'KeepAliveTimer'}
procedure TMqttClientClass.KeepAlivePingTimerHandler(Sender: TObject);
begin
  // send keep alive PINGREQ
  PingReqPacketSend;
end;

procedure TMqttClientClass.KeepAlivePingTimerReset;
begin
  FKeepAlivePingTimer.Enabled := false;
  FKeepAlivePingTimer.Enabled := true;
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

  // clientidentifier
  StrAdd(AnsiString(FClientIdentifier), packet, index);

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
