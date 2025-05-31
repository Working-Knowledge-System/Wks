unit WksMqttServerUnit;

interface

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , System.Generics.Collections
  , Vcl.StdCtrls
  , Vcl.ComCtrls
  , IdGlobal
  , IdException
  , IdContext
  , IdTCPServer
  , IdIOHandler
  , IdIOHandlerSocket
  , WksMqttUnit
  , WksMqttTypesUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  // forward declaration
  TMQTTServerClass = class;

  // client connection event
  TOnMQTTClientConnect = procedure(Sender: TMQTTServerClass; ClientID: string; var Accept: boolean; var ReturnCode: TMQTTConnectReturnCode) of object;

  // client disconnection event
  TOnMQTTClientDisconnect = procedure(Sender: TMQTTServerClass; ClientID: string; var Accept: boolean; Reason: TMQTTDisconnectReturnCode) of object;

  // event argument base class
  TMQTTEventArguments = class
  public
    Handled: boolean;  // set to True to prevent default handling
  end;

  TMQTTClientConnectEvent = class(TMQTTEventArguments)
  public
    ClientID: string;
    Username: string;
    Password: string;
    Accept: boolean;
    ReturnCode: TMQTTConnectReturnCode;
    WillMessage: TMQTTMessage;
    Session: TMQTTSession;
  end;

  TMQTTClientDisconnectEvent = class(TMQTTEventArguments)
  public
    ClientID: string;
    Reason: string;
    Session: TMQTTSession;
  end;

  TMQTTMessagePublishEvent = class(TMQTTEventArguments)
  public
    SenderClientID: string;
    Topic: string;
    Payload: TBytes;
    QoS: TMQTTQOSType;
    Retain: boolean;
    Accept: boolean;
  end;

  TMQTTMessageDeliveryEvent = class(TMQTTEventArguments)
  public
    TargetClientID: string;
    Topic: string;
    Payload: TBytes;
    QoS: TMQTTQOSType;
    Retain: boolean;
    Accept: boolean;
  end;

  TMQTTSubscriptionEvent = class(TMQTTEventArguments)
  public
    ClientID: string;
    TopicFilter: string;
    RequestedQoS: TMQTTQOSType;
    GrantedQoS: TMQTTQOSType;
    Accept: boolean;
  end;

  TMQTTUnsubscriptionEvent = class(TMQTTEventArguments)
  public
    ClientID: string;
    TopicFilter: string;
    Accept: boolean;
  end;

  TMQTTRetainedMessageEvent = class(TMQTTEventArguments)
  public
    Topic: string;
    Payload: TBytes;
    QoS: TMQTTQOSType;
    Retain: boolean;
    Accept: boolean;
  end;

  TMQTTAuthenticationEvent = class(TMQTTEventArguments)
  public
    Username: string;
    Password: string;
    Accept: boolean;
  end;

  TErrorEvent = class(TMQTTEventArguments)
  public
    ErrorCode: integer;
    ErrorMessage: string;
  end;

  TMQTTServerClass = class(TMQTTClass)
  private
    // fields
    FTCPServer: TIdTCPServer;
    FSessions: TDictionary<string, TMQTTSession>;
    FRetainedMessages: TDictionary<string, TMQTTMessage>;
    FOnClientConnect: TOnMQTTClientConnect;
    FOnClientDisconnect: TOnMQTTClientDisconnect;
    FOnClientMessage: TOnMQTTMessage;

    // tcpipserver events
//    FOnClientJoined: TNotifyEvent;
//    FOnClientDisjoined: TNotifyEvent;

    // broker events
//    FOnClientConnect: TOnMQTTClientConnect;
//    FOnClientDisconnect: TOnMQTTClientDisconnect;
//    FOnMessage: TOnMQTTMessage;

    // tcpipserver events handlers
    procedure OnClientJoinedHandler(AContext: TIdContext);
    procedure OnClientDisjoinedHandler(AContext: TIdContext);
    procedure OnClientDataReceivedHandler(AContext: TIdContext);

    // broker events handlers
    procedure OnConnectHandler(AContext: TIdContext);
    procedure OnDisconnectHandler(AContext: TIdContext);

    // connectroutines
    function  ConnectPacketProcess(ASession: TMQTTSession; APacket: TMQTTPacketClass; out AConnectPacket: TMQTTConnectPacketRec): TMQTTConnectReturnCode;
    procedure ConnAckSend(AContext: TIdContext; AReturnCode: TMQTTConnectReturnCode);

    // disconnectroutines
    function  DisconnectPacketProcess(ASession: TMQTTSession; APacket: TMQTTPacketClass; out ADisconnectPacket: TMQTTDisconnectPacketRec): TMQTTDisconnectReturnCode;

    // publishroutines
    procedure PublishPacketProcess(ASession: TMQTTSession; APacket: TMQTTPacketClass);
    procedure PubAckSend(ASession: TMQTTSession; APacketID: Word);
    procedure PubRecSend(ASession: TMQTTSession; APacketID: Word);
    procedure PubRelSend(ASession: TMQTTSession; APacketID: Word);
    procedure PubCompSend(ASession: TMQTTSession; APacketID: Word);

    // subscriberoutines
    procedure SubscribePacketProcess(ASession: TMQTTSession; APacket: TMQTTPacketClass);
    procedure SubAckSend(ASession: TMQTTSession; APacketID: Word; AGrantedQoS: array of TMQTTQOSType);

    // unsubscriberoutines
    procedure UnsubscribePacketProcess(ASession: TMQTTSession; APacket: TMQTTPacketClass);
    procedure UnsubAckSend(ASession: TMQTTSession; APacketID: Word);

    // pingroutines
    procedure PingReqPacketProcess(ASession: TMQTTSession);
    procedure PingRespSend(ASession: TMQTTSession);

    // utils
  //function ClientIdValidate(const AClientId: string): boolean;
  public
    constructor Create(ALogLineLabel: TLabel; ALogRichEdit, ARequestHexRichEdit, AResponseHexRichEdit: TRichEdit); override;
    destructor Destroy; override;
    procedure Start(APort: Word = 1883);
    procedure Stop;
    function IsRunning: boolean;      // tcpserver is active
    function HasConnections: boolean; // mqttbroker has active mqttclients connections
    function ClientCount: Integer;
    function SessionGet(AClientID: string): TMQTTSession;

    // event properties
    property OnClientConnect: TOnMQTTClientConnect       read FOnClientConnect    write FOnClientConnect;
    property OnClientDisconnect: TOnMQTTClientDisconnect read FOnClientDisconnect write FOnClientDisconnect;
    property OnClientMessage: TOnMQTTMessage             read FOnClientMessage    write FOnClientMessage;
  end;
{$ENDREGION}

implementation

{$REGION 'TMQTTServerClass'}
constructor TMQTTServerClass.Create(ALogLineLabel: TLabel; ALogRichEdit, ARequestHexRichEdit, AResponseHexRichEdit: TRichEdit);
begin
  inherited Create(ALogLineLabel, ALogRichEdit, ARequestHexRichEdit, AResponseHexRichEdit);

  // tcpserver
  FTCPServer := TIdTCPServer.Create(nil);
  FTCPServer.OnConnect    := OnClientJoinedHandler;
  FTCPServer.OnDisconnect := OnClientDisjoinedHandler;
  FTCPServer.OnExecute    := OnClientDataReceivedHandler;

  // stores
  FSessions := TDictionary<string, TMQTTSession>.Create;
  FRetainedMessages := TDictionary<string, TMQTTMessage>.Create;
end;

destructor TMQTTServerClass.Destroy;
var
  ses: TMQTTSession;
begin
  // stores
  for ses in FSessions.Values do
    ses.Free;
  FSessions.Free;
  FRetainedMessages.Free;

  // tcpserver
  FTCPServer.Free;

  inherited;
end;

procedure TMQTTServerClass.Start(APort: Word);
begin
  // checks for already running server
  if FTCPServer.Active then
    raise Exception.Create('server is already running');

  try
    // configure server
    FTCPServer.DefaultPort       := APort;
    FTCPServer.MaxConnections    := 1000;                  // adjust based on your needs
    FTCPServer.ReuseSocket       := TIdReuseSocket.rsTrue; // allow quick port reuse and restarts
    FTCPServer.TerminateWaitTime := 5000;                  // 5 seconds for graceful termination

    // set socket options for better performance
    with FTCPServer.Bindings.Add do begin
      IP := '0.0.0.0';      // listen on all interfaces
      Port := APort;
      IPVersion := Id_IPv4; // could be Id_IPv6 if needed
    end;

    // start the server
    FTCPServer.Active := true;
    Log('server started on port %d', [FTCPServer.DefaultPort]);

    // initialize server state ensuring clean startup state
    FSessions.Clear;
    FRetainedMessages.Clear;
  except
    // specific handling for common socket binding errors (port is already in use, insufficient permissions (e.g., trying to bind to ports < 1024 on Linux))
    on e: EIdCouldNotBindSocket do
      raise Exception.CreateFmt('could not start server on port %d: %s', [APort, e.Message]);

    // general exception handling
    on e: Exception do
      raise Exception.CreateFmt('server start failed: %s', [e.Message]);
  end;
end;

procedure TMQTTServerClass.Stop;
var
  cxt: TIdContext;
  ses: TMQTTSession;
  cxl: TList; // <TIdContext>
  accept: boolean;
begin
  if not FTCPServer.Active then begin
    Log('server already stopped');
    Exit;
  end;

  Log('server stopping...');

  // disconnect all active clients gracefully
  cxl := FTCPServer.Contexts.LockList;
  try
    for cxt in cxl do begin
      ses := cxt.Data as TMQTTSession;
      if Assigned(ses) then begin
        // notify disconnection event
        if Assigned(FOnClientDisconnect) then
          FOnClientDisconnect(Self, ses.ClientId, accept, disconrcSERVER_STOPPING);

        // send DISCONNECT packet if connection is still active
        if cxt.Connection.Connected then begin
          try
            cxt.Connection.IOHandler.Write(Byte(ptDISCONNECT) shl 4);
            cxt.Connection.IOHandler.Write(0); // remaining length = 0
            cxt.Connection.Disconnect;
            Log('client disconnected');
          except
            on e: Exception do
              Log('exception: %s', [e.Message]);
          end;
        end;
      end;
    end;
  finally
    FTCPServer.Contexts.UnlockList;
  end;

  // stop the TCP server
//FTCPServer.StopListening;
  FTCPServer.Active := false;
  Log('server stopped');

  // clear retained messages if clean session is requested
  FRetainedMessages.Clear;
  Log('retained messages cleared');

  // clean up sessions that requested clean session
  for ses in FSessions.Values do begin
    if ses.CleanSession then begin
      FSessions.Remove(ses.ClientId);
      ses.Free;
    end;
  end;
  Log('clients sessions cleared');
end;

function  TMQTTServerClass.ConnectPacketProcess(ASession: TMQTTSession; APacket: TMQTTPacketClass; out AConnectPacket: TMQTTConnectPacketRec): TMQTTConnectReturnCode;
var
//  remaininglength: word;
//  protocolname, clientid, willtopic, willmessage, username, password: string;
//  connflags, protocollevel: byte;
//  cleansession: boolean;
//  keepalive: word;
  accept: boolean;
begin
  // type
  AConnectPacket.PacketType := TMQTTPacketType((APacket.ByteRead and $F0) shr 4);

  // remaininglength read
  AConnectPacket.RemainingLength := APacket.RemainingLengthRead;

  // protocolname read
  AConnectPacket.ProtocolName := APacket.StringRead;

  // protocollevel read
  AConnectPacket.ProtocolLevel := APacket.ByteRead;

  // connflags read
  AConnectPacket.ConnectFlags.FromByte(APacket.ByteRead);

  // keepalive read
  AConnectPacket.KeepAlive := APacket.WordRead;

  // clientidentifier read
  AConnectPacket.ClientID := APacket.StringRead;

  // willtopic read
  AConnectPacket.WillTopic := APacket.StringRead;

  // willmessage read
  AConnectPacket.WillMessage := APacket.StringRead;

  // username read
  AConnectPacket.Username := APacket.StringRead;

  // password read
  AConnectPacket.Password := APacket.StringRead;

  // default to accepting connection
  Accept := true;
  Result := conrcCONNECTION_ACCEPTED;

  // validate client ID
  if AConnectPacket.ClientID.IsEmpty and not AConnectPacket.ConnectFlags.CleanSession then begin
    accept := false;
    Result := conrcIDENTIFIER_REJECTED;
  end;

  // fire connection event
  if Assigned(FOnClientConnect) then
    FOnClientConnect(Self, AConnectPacket.ClientID, accept, Result);

  // exit
  if not accept then
    Exit;

  // create or retrieve session
  if not FSessions.TryGetValue(AConnectPacket.ClientID, ASession) then begin
    ASession := TMQTTSession.Create(AConnectPacket.ClientID, AConnectPacket.ConnectFlags.CleanSession);
    FSessions.Add(AConnectPacket.ClientID, ASession);
  end else
    ASession.LastContactUpdate;
end;

procedure TMQTTServerClass.ConnAckSend(AContext: TIdContext; AReturnCode: TMQTTConnectReturnCode);
begin

end;

function  TMQTTServerClass.DisconnectPacketProcess(ASession: TMQTTSession; APacket: TMQTTPacketClass; out ADisconnectPacket: TMQTTDisconnectPacketRec): TMQTTDisconnectReturnCode;
var
  accept: boolean;
begin
  // type
  ADisconnectPacket.PacketType := TMQTTPacketType((APacket.ByteRead and $F0) shr 4);

  // remaininglength read
  ADisconnectPacket.RemainingLength := APacket.RemainingLengthRead;

  // default to accepting disconnection
  Accept := true;
  Result := disconrcDISCONNECTION_ACCEPTED;

  // validate something?
  // ...

  // fire disconnection event
  if Assigned(FOnClientDisconnect) then
    FOnClientDisconnect(Self, ASession.ClientID, accept, Result);
end;

procedure TMQTTServerClass.SubscribePacketProcess(ASession: TMQTTSession; APacket: TMQTTPacketClass);
begin

end;

procedure TMQTTServerClass.SubAckSend(ASession: TMQTTSession; APacketID: Word; AGrantedQoS: array of TMQTTQOSType);
begin

end;

procedure TMQTTServerClass.UnsubscribePacketProcess(ASession: TMQTTSession; APacket: TMQTTPacketClass);
begin

end;

procedure TMQTTServerClass.UnsubAckSend(ASession: TMQTTSession; APacketID: Word);
begin

end;

procedure TMQTTServerClass.PublishPacketProcess(ASession: TMQTTSession; APacket: TMQTTPacketClass);
begin

end;

procedure TMQTTServerClass.PubRecSend(ASession: TMQTTSession; APacketID: Word);
begin

end;

procedure TMQTTServerClass.PubRelSend(ASession: TMQTTSession; APacketID: Word);
begin

end;

procedure TMQTTServerClass.PubAckSend(ASession: TMQTTSession; APacketID: Word);
begin

end;

procedure TMQTTServerClass.PubCompSend(ASession: TMQTTSession; APacketID: Word);
begin

end;

procedure TMQTTServerClass.PingReqPacketProcess(ASession: TMQTTSession);
begin

end;

procedure TMQTTServerClass.PingRespSend(ASession: TMQTTSession);
begin

end;

function  TMQTTServerClass.IsRunning: boolean;
begin
  Result := FTCPServer.Active;
end;

function TMQTTServerClass.HasConnections: boolean;
begin
  Result := false; // *** how to determine if there are active mqttclients? ***
end;

function  TMQTTServerClass.ClientCount: integer;
var
  cxl: TList; // contextslist <TIdContext>
begin
  if not IsRunning then
    Exit(0);

  cxl := FTCPServer.Contexts.LockList;
  try
    Result := cxl.Count;
  finally
    FTCPServer.Contexts.UnlockList;
  end;
end;

function  TMQTTServerClass.SessionGet(AClientID: string): TMQTTSession;
begin
  if not FSessions.TryGetValue(AClientID, Result) then
    Result := nil;
end;

  {$REGION 'TCPServerHandlers'}
procedure TMQTTServerClass.OnClientJoinedHandler(AContext: TIdContext);
begin
  Log('client %d joined from: %s', [AContext.Binding.ID, AContext.Binding.PeerIP]);

//Accept := IsClientAllowed(ClientID);
//if not Accept then
//  ReturnCode := rcNOT_AUTHORIZED;
end;

procedure TMQTTServerClass.OnClientDisjoinedHandler(AContext: TIdContext);
begin
  Log('client %d disjoined from: %s reason: %s', [AContext.Binding.ID{ClientId}, AContext.Binding.PeerIP, 'AReason']);
end;

procedure TMQTTServerClass.OnClientDataReceivedHandler(AContext: TIdContext);

  {$REGION 'var'}
var
  io: TIdIOHandler{TIdIOHandlerSocket};
//bytes{, buffer}: TIdBytes;
  ctrlbyte: byte;
  packet: TMQTTPacketClass;
  packetype: TMQTTPacketType;
  size: cardinal;
  session: TMQTTSession;
  connectreturncode: TMQTTConnectReturnCode;
  connectpacketrec: TMQTTConnectPacketRec;
  disconnectreturncode: TMQTTDisconnectReturnCode;
  disconnectpacketrec: TMQTTDisconnectPacketRec;
  {$ENDREGION}

begin
  packet := TMQTTPacketClass.Create;
  try
    while AContext.Connection.Connected do begin
      try
        // zip
        io := AContext.Connection.IOHandler;
      //io := AContext.Connection.Socket;

        // exit
        if io.InputBufferIsEmpty or (not io.Readable) then begin
          io.CheckForDataOnSource(10);
          if io.InputBufferIsEmpty then
            Exit;
        end;

        // read all in a bytes buffer
//        io.InputBuffer.ExtractToBytes(bytes, -1, False, -1); // or: io.ReadBytes(RawBytes, -1, False);
//        Log('received %d bytes      (%d bytes)', [Length(bytes)]);

        // read 1st byte for packettype andflags
//        ctrlbyte := bytes[0];

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
        packetype := TMQTTPacketType((ctrlbyte and $F0) shr 4);

        // session
        session := SessionGet({AContext}'client001');

        // process the various packets types
        case packetype of
          ptRESERVED   : begin
            Log('received RESERVED (0) packet');
          end;
          ptCONNECT    : begin
            Log('received CONNECT (1) packet');
            connectreturncode := ConnectPacketProcess(session, packet, connectpacketrec);
            Dmp(connectpacketrec.Dump);
          end;
          ptCONNACK    : begin
            Log('received CONNACK (2) packet');
          end;
          ptPUBLISH    : begin
            Log('received PUBLISH (3) packet');
            PublishPacketProcess(session, packet);
          end;
          ptPUBACK     : begin
            Log('received PUBACK (4) packet');
          end;
          ptPUBREC     : begin
            Log('received PUBREC (5) packet');
          end;
          ptPUBREL     : begin
            Log('received PUBREL (6) packet');
          end;
          ptPUBCOMP    : begin
            Log('received PUBCOMP (7) packet');
          end;
          ptSUBSCRIBE  : begin
            Log('received SUBSCRIBE (8) packet');
            SubscribePacketProcess(session, packet);
          end;
          ptSUBACK     : begin
            Log('received SUBACK (9) packet');
          end;
          ptUNSUBSCRIBE: begin
            Log('received UNSUBSCRIBE (10) packet');
          end;
          ptUNSUBACK   : begin
            Log('received UNSUBACK (11) packet');
          end;
          ptPINGREQ    : begin
            Log('received PINGREQ (12) packet');
            PingReqPacketProcess(session);
          end;
          ptPINGRESP   : begin
            Log('received PINGRESP (13) packet');
          end;
          ptDISCONNECT : begin
            Log('received DISCONNECT (14) packet');
            disconnectreturncode := DisconnectPacketProcess(session, packet, disconnectpacketrec);
            Dmp(disconnectpacketrec.Dump);
          end;
          ptRESERVED2  : begin
            Log('received RESERVED (15) packet');
          end;
        else
                         Log('received UNKNOWN packet');
        end;


        // bufferload
      //SetLength(buffer, Length(bytes));
      //Move(bytes[0], buffer[1], Length(bytes));

        // do stuff with buffer
      //BytesToRaw(bytes, buffer[1], Length(bytes));

        // bho
        AContext.Connection.CheckForGracefulDisconnect;
    //  calls ReadFromStack() with a timeout of 1 millis (which calls CheckForDisconnect() internally),
    //  and is responsible for setting the ClosedGracefully property as needed
    //  CheckForDisconnect() closes the underlying socket and IOHandler than triggers
    //  the OnDisconnect event only if the ClosedGracefully property is set to true,
    //  meaning the otherside of the connection closed the connection on its end
      except
        on e: Exception do begin
          Log(e.Message);
          AContext.Connection.Disconnect;
        end;
      end;
    end;
  finally
    packet.Free;
  end;
end;
  {$ENDREGION}

  {$REGION 'BrokerHandlers'}
procedure TMQTTServerClass.OnConnectHandler(AContext: TIdContext);
var
  cid: string;  // clientid
  cls: boolean; // cleansession
  ses: TMQTTSession;
begin
  // cleansession
  cls := true;

  // parse connect packet
  if not FSessions.TryGetValue(cid, ses) then begin
    ses := TMQTTSession.Create(cid, cls);
    FSessions.Add(cid, ses);
  end;

  // handle will message
//  if ConnectFlags.WillFlag then
//    ses.WillMessage := ParseWillMessage(APacket);

  // Send CONNACK
end;

procedure TMQTTServerClass.OnDisconnectHandler(AContext: TIdContext);
var
  ses: TMQTTSession;
  accept: boolean;
begin
  ses := AContext.Data as TMQTTSession;
  if Assigned(ses) then begin
    if Assigned(FOnClientDisconnect) then
      FOnClientDisconnect(Self, ses.ClientId, accept, disconrcCLIENT_DISCONNECTED);

    // handle will message if exists
//    if ses.WillMessage.Topic <> '' then
//      PublishPacketProcess(nil, ses.WillMessage);
  end;
end;
  {$ENDREGION}

{$ENDREGION}

end.
