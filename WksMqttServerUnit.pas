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

  // client pingreq event
  TOnMQTTClientPingreq = procedure(Sender: TMQTTServerClass; ClientID: string; var Accept: boolean; Reason: TMQTTPingreqReturnCode) of object;

  // client pingreq event
  TOnMQTTClientPublish = procedure(Sender: TMQTTServerClass; ClientID: string; var Accept: boolean; Reason: TMQTTPublishReturnCode) of object;

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
    WillMessage: TMQTTMessageRec;
    Session: TMQTTSessionClass;
  end;

  TMQTTClientDisconnectEvent = class(TMQTTEventArguments)
  public
    ClientID: string;
    Reason: string;
    Session: TMQTTSessionClass;
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
    FSessions: TDictionary<string, TMQTTSessionClass>;
    FRetainedMessages: TDictionary<string, TMQTTMessageRec>;

    FOnClientConnect   : TOnMQTTClientConnect;
    FOnClientDisconnect: TOnMQTTClientDisconnect;
    FOnClientPingReq   : TOnMQTTClientPingReq;
    FOnClientPublish   : TOnMQTTClientPublish;
    FOnClientMessage   : TOnMQTTMessage;
//    FOnSubscribe       : TOnSubscriptionHandler;
//    FOnUnsubscribe     : TOnUnsubscriptionHandler;
//    FOnMessageDeliver  : TOnMessageDeliveryHandler;
//    FOnRetainedMessage : TOnRetainedMessageHandler;
//    FOnAuthenticate    : TOnAuthenticationHandler;
//    FOnError           : TOnErrorHandler;

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
    function  ConnectPacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass; out AConnectPacket: TMQTTConnectPacketRec): TMQTTConnectReturnCode;
    procedure ConnAckSend(AContext: TIdContext; AReturnCode: TMQTTConnectReturnCode);

    // disconnectroutines
    function  DisconnectPacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass; out ADisconnectPacket: TMQTTDisconnectPacketRec): TMQTTDisconnectReturnCode;

    // publishroutines
    function  PublishPacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass; out APublishPacket: TMQTTPublishPacketRec): TMQTTPublishReturnCode;
    procedure PubAckSend(ASession: TMQTTSessionClass; APacketID: Word);
    procedure PubRecSend(ASession: TMQTTSessionClass; APacketID: Word);
    procedure PubRelSend(ASession: TMQTTSessionClass; APacketID: Word);
    procedure PubCompSend(ASession: TMQTTSessionClass; APacketID: Word);

    // subscriberoutines
    procedure SubscribePacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass);
    procedure SubAckSend(ASession: TMQTTSessionClass; APacketID: Word; AGrantedQoS: array of TMQTTQOSType);

    // unsubscriberoutines
    procedure UnsubscribePacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass);
    procedure UnsubAckSend(ASession: TMQTTSessionClass; APacketID: Word);

    // pingroutines
    function  PingReqPacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass; out APingreqPacket: TMQTTPingreqPacketRec): TMQTTPingreqReturnCode;
    procedure PingRespSend(ASession: TMQTTSessionClass);

    // forwardroutines
    procedure ApplicationMessageBroadcast(AMessage: TMQTTMessageRec);

    // topicsroutines
    function  TopicMatchesFilter(ATopicName, ATopicFilter: string): boolean;

    // utils
  //function ClientIdValidate(const AClientId: string): boolean;
  public
    constructor Create(ALogRichEdit, ARequestHexRichEdit, AResponseHexRichEdit: TRichEdit); override;
    destructor Destroy; override;
    procedure Start(APort: Word = 1883);
    procedure Stop;
    function IsRunning: boolean;      // tcpserver is active
    function HasConnections: boolean; // mqttbroker has active mqttclients connections
    function ClientCount: Integer;
    function SessionGet(AClientID: string): TMQTTSessionClass;

    // event properties
    property OnClientConnect: TOnMQTTClientConnect       read FOnClientConnect    write FOnClientConnect;
    property OnClientDisconnect: TOnMQTTClientDisconnect read FOnClientDisconnect write FOnClientDisconnect;
    property OnClientMessage: TOnMQTTMessage             read FOnClientMessage    write FOnClientMessage;
  end;
{$ENDREGION}

implementation

{$REGION 'TMQTTServerClass'}
constructor TMQTTServerClass.Create(ALogRichEdit, ARequestHexRichEdit, AResponseHexRichEdit: TRichEdit);
begin
  inherited Create(ALogRichEdit, ARequestHexRichEdit, AResponseHexRichEdit);

  // tcpserver
  FTCPServer := TIdTCPServer.Create(nil);
  FTCPServer.OnConnect    := OnClientJoinedHandler;
  FTCPServer.OnDisconnect := OnClientDisjoinedHandler;
  FTCPServer.OnExecute    := OnClientDataReceivedHandler;

  // stores
  FSessions := TDictionary<string, TMQTTSessionClass>.Create;
  FRetainedMessages := TDictionary<string, TMQTTMessageRec>.Create;
end;

destructor TMQTTServerClass.Destroy;
var
  ses: TMQTTSessionClass;
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
  ses: TMQTTSessionClass;
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
      ses := cxt.Data as TMQTTSessionClass;
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

function  TMQTTServerClass.ConnectPacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass; out AConnectPacket: TMQTTConnectPacketRec): TMQTTConnectReturnCode;
var
  accept: boolean;
begin

  {$REGION 'decode'}
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
  {$ENDREGION}

  {$REGION 'validate'}
  // validate client ID
  if AConnectPacket.ClientID.IsEmpty and not AConnectPacket.ConnectFlags.CleanSession then begin
    accept := false;
    Result := conrcIDENTIFIER_REJECTED;
  end;
  {$ENDREGION}

  {$REGION 'postprocess'}
  // fire connection event
  if Assigned(FOnClientConnect) then
    FOnClientConnect(Self, AConnectPacket.ClientID, accept, Result);

  // exit
  if not accept then
    Exit;

  // create or retrieve session
  if not FSessions.TryGetValue(AConnectPacket.ClientID, ASession) then begin
    ASession := TMQTTSessionClass.Create(AConnectPacket.ClientID, AConnectPacket.ConnectFlags.CleanSession);
    FSessions.Add(AConnectPacket.ClientID, ASession);
  end else
    ASession.LastContactUpdate;
  {$ENDREGION}

end;

procedure TMQTTServerClass.ConnAckSend(AContext: TIdContext; AReturnCode: TMQTTConnectReturnCode);
begin

end;

procedure TMQTTServerClass.SubscribePacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass);
//var
//  topicname: string;
//  qos: TMQTTQOSType;
begin
//  while not APacket.Stream.Eof do begin
//    topicname := APacket.StringRead;
//    qos := TMQTTQOSType(APacket.ByteRead);
//    ASession.SubscriptionAdd(topicname, qos);
//  end;

//  SubAckSend(ASession, PacketID, GrantedQoS);
end;

procedure TMQTTServerClass.SubAckSend(ASession: TMQTTSessionClass; APacketID: Word; AGrantedQoS: array of TMQTTQOSType);
begin

end;

procedure TMQTTServerClass.UnsubscribePacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass);
begin

end;

procedure TMQTTServerClass.UnsubAckSend(ASession: TMQTTSessionClass; APacketID: Word);
begin

end;

function  TMQTTServerClass.PublishPacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass; out APublishPacket: TMQTTPublishPacketRec): TMQTTPublishReturnCode;
var
  accept: boolean;
  ctrlbyte, flags: byte;
  appmessage: TMQTTMessageRec;
//args: TMessagePublishEvent;
begin

  {$REGION 'decode'}
  // ctrlbyte
  ctrlbyte := APacket.ByteRead;

  // type
  APublishPacket.PacketType := TMQTTPacketType((ctrlbyte and $F0) shr 4);

  // remaininglength read
  APublishPacket.RemainingLength := APacket.RemainingLengthRead;

  // publish flags read
  APublishPacket.PublishFlags.FromByte(ctrlbyte and $0F);

  // topic name read
  APublishPacket.TopicName := APacket.StringRead;

  // client identifier read
  APublishPacket.ClientIdentifier := APacket.StringRead;

  // application message read
  APublishPacket.ApplicationMessage := APacket.StringRead;

  // default to accepting publishing
  Accept := true;
  Result := publishrcPUBLISH_ACCEPTED;
  {$ENDREGION}

  {$REGION 'validate'}
  {$ENDREGION}

  {$REGION 'postprocess'}
  // fire publishing event
  if Assigned(FOnClientPublish) then
    FOnClientPublish(Self, ASession.ClientID, accept, Result);
  {$ENDREGION}

  {$REGION 'zzz'}
  {
  appmessage := APacket.MessageRead;

  // store retained message
  if appmessage.Retain then begin
    if Length(appmessage.ApplicationMessage) > 0 then
      FRetainedMessages.AddOrSetValue(appmessage.TopicName, appmessage)
    else
      FRetainedMessages.Remove(appmessage.TopicName);
  end;

  // forward to subscribers
  ApplicationMessageBroadcast(appmessage);

  // handle QoS acknowledgements
  case appmessage.QoS of
    qostAT_LEAST_ONCE: PubAckSend(ASession, appmessage.PacketIdOrClientIdentifier);
    qostEXACTLY_ONCE : PubRecSend(ASession, appmessage.PacketIdOrClientIdentifier);
  end;
  }
  {$ENDREGION}

  {$REGION 'zzz'}
  {
  args := TMessagePublishEvent.Create;
  try
    args.SenderClientID := ASession.ClientID;
    args.Topic := AMessage.Topic;
    args.Payload := AMessage.Payload;
    args.QoS := AMessage.QoS;
    args.Retain := AMessage.Retain;
    args.Accept := True;

    if Assigned(FOnMessagePublish) then
      FOnMessagePublish(args);

    if args.Accept then
      StoreAndForwardMessage(AMessage);
  finally
    args.Free;
  end;
  }
  {$ENDREGION}

end;

procedure TMQTTServerClass.PubRecSend(ASession: TMQTTSessionClass; APacketID: Word);
begin

end;

procedure TMQTTServerClass.PubRelSend(ASession: TMQTTSessionClass; APacketID: Word);
begin

end;

procedure TMQTTServerClass.PubAckSend(ASession: TMQTTSessionClass; APacketID: Word);
begin

end;

procedure TMQTTServerClass.PubCompSend(ASession: TMQTTSessionClass; APacketID: Word);
begin

end;

function  TMQTTServerClass.PingReqPacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass; out APingreqPacket: TMQTTPingreqPacketRec): TMQTTPingreqReturnCode;
var
  accept: boolean;
begin

  {$REGION 'decode'}
  // type
  APingreqPacket.PacketType := TMQTTPacketType((APacket.ByteRead and $F0) shr 4);

  // remaininglength read
  APingreqPacket.RemainingLength := APacket.RemainingLengthRead;

  // default to accepting disconnection
  Accept := true;
  Result := pingreqrcPINGREQ_ACCEPTED;
  {$ENDREGION}

  {$REGION 'validate'}
  {$ENDREGION}

  {$REGION 'postprocess'}
  // fire disconnection event
  if Assigned(FOnClientPingReq) then
    FOnClientPingReq(Self, ASession.ClientID, accept, Result);
  {$ENDREGION}

end;

procedure TMQTTServerClass.PingRespSend(ASession: TMQTTSessionClass);
begin

end;

function  TMQTTServerClass.DisconnectPacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass; out ADisconnectPacket: TMQTTDisconnectPacketRec): TMQTTDisconnectReturnCode;
var
  accept: boolean;
begin

  {$REGION 'decode'}
  // type
  ADisconnectPacket.PacketType := TMQTTPacketType((APacket.ByteRead and $F0) shr 4);

  // remaininglength read
  ADisconnectPacket.RemainingLength := APacket.RemainingLengthRead;

  // default to accepting disconnection
  Accept := true;
  Result := disconrcDISCONNECTION_ACCEPTED;
  {$ENDREGION}

  {$REGION 'validate'}
  {$ENDREGION}

  {$REGION 'reply'}
  // nothing
  {$ENDREGION}

  {$REGION 'postprocess'}
  // fire disconnection event
  if Assigned(FOnClientDisconnect) then
    FOnClientDisconnect(Self, ASession.ClientID, accept, Result);
  {$ENDREGION}

end;

procedure TMQTTServerClass.ApplicationMessageBroadcast(AMessage: TMQTTMessageRec);
var
  session: TMQTTSessionClass;
  subscription: TSubscription;
begin
  for session in FSessions.Values do begin
    for subscription in Session.Subscriptions do begin
      if TopicMatchesFilter(AMessage.TopicName, subscription.TopicFilter) then begin
        // send message to client with appropriate QoS
//        PublishSend(session, AMessage.TopicName, AMessage.ApplicationMessage, subscription.QoS, False);
      end;
    end;
  end;
end;

function  TMQTTServerClass.TopicMatchesFilter(ATopicName, ATopicFilter: string): boolean;
begin
  Result := false;
end;

function  TMQTTServerClass.IsRunning: boolean;
begin
  Result := FTCPServer.Active;
end;

function  TMQTTServerClass.HasConnections: boolean;
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

function  TMQTTServerClass.SessionGet(AClientID: string): TMQTTSessionClass;
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

procedure TMQTTServerClass.OnClientDataReceivedHandler(AContext: TIdContext); // IncomingPacketProcess

  {$REGION 'var'}
var
  io: TIdIOHandler{TIdIOHandlerSocket};
//bytes{, buffer}: TIdBytes;
  response: TBytes;
  size: cardinal;
  ctrlbyte: byte;
  packet: TMQTTPacketClass;
  packettype: TMQTTPacketType;
  session: TMQTTSessionClass;
  connectreturncode: TMQTTConnectReturnCode;
  connectpacketrec: TMQTTConnectPacketRec;
  pingreqreturncode: TMQTTPingreqReturnCode;
  pingreqpacketrec: TMQTTPingreqPacketRec;
  publishreturncode: TMQTTPublishReturnCode;
  publishpacketrec: TMQTTPublishPacketRec;
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

        // read all in a bytes buffer
//        io.InputBuffer.ExtractToBytes(bytes, -1, False, -1); // or: io.ReadBytes(RawBytes, -1, False);
//        Log('received %d bytes      (%d bytes)', [Length(bytes)]);

        // read 1st byte for packettype andflags
//        ctrlbyte := bytes[0];

        // read all in the packet's stream
        size := io.ReadInt32;
        packet.Stream.Clear;
        io.ReadStream(packet.Stream, {-1}size, false);
        packet.Stream.Position := 0;
        Log('received bytes         (%d bytes)', [packet.Len]);
//        Log('                       (%s)'      , [packet.AsAscii]);
//        Log('                       (%s)'      , [packet.AsHex]);
//        Log('                       (%s)'      , [packet.AsChar]);

        // read 1st byte for packettype andflags
        ctrlbyte := packet.ByteRead;
        packet.Stream.Position := 0;

        // type
        packettype := TMQTTPacketType((ctrlbyte and $F0) shr 4);

        // session
        session := SessionGet({AContext}'client001');

        // process the various packets types
        case packettype of
          ptRESERVED   : begin
            Log('received RESERVED (0) packet');
            Dmp(packet.AsChar);
          end;
          ptCONNECT    : begin
            Log('received CONNECT (1) packet');
            connectreturncode := ConnectPacketProcess(session, packet, connectpacketrec);
            Dmp(connectpacketrec.Dump);
          end;
//          ptCONNACK    : begin
//            Log('received CONNACK (2) packet');
//          end;
          ptPUBLISH    : begin
            Log('received PUBLISH (3) packet');
            publishreturncode := PublishPacketProcess(session, packet, publishpacketrec);
            Dmp(publishpacketrec.Dump);
          end;
//          ptPUBACK     : begin
//            Log('received PUBACK (4) packet');
//          end;
//          ptPUBREC     : begin
//            Log('received PUBREC (5) packet');
//          end;
//          ptPUBREL     : begin
//            Log('received PUBREL (6) packet');
//          end;
//          ptPUBCOMP    : begin
//            Log('received PUBCOMP (7) packet');
//          end;
//          ptSUBSCRIBE  : begin
//            Log('received SUBSCRIBE (8) packet');
//          end;
//          ptSUBACK     : begin
//            Log('received SUBACK (9) packet');
//          end;
//          ptUNSUBSCRIBE: begin
//            Log('received UNSUBSCRIBE (10) packet');
//          end;
//          ptUNSUBACK   : begin
//            Log('received UNSUBACK (11) packet');
//          end;
          ptPINGREQ    : begin
//            Log('received PINGREQ (12) packet');
            pingreqreturncode := PingReqPacketProcess(session, packet, pingreqpacketrec);
//            Dmp(pingreqpacketrec.Dump);

            {$REGION 'reply'}
//            SetLength(response, 2);
//            response[0] := $D0;          // = 1101 0000   control packet type (PINGRESP)
//            response[1] := $00;          // = 0000 0000   remaining length (always 0)
//            io.Write(TIdBytes(response));
//            Log('reply    PINGRESP (13)')
            {$ENDREGION}

          end;
//          ptPINGRESP   : begin
//            Log('received PINGRESP (13) packet');
//          end;
          ptDISCONNECT : begin
            Log('received DISCONNECT (14) packet');
            disconnectreturncode := DisconnectPacketProcess(session, packet, disconnectpacketrec);
            Dmp(disconnectpacketrec.Dump);

            // tcpclose ?
            //AContext.Connection.Disconnect;
            //Log('client tcp connection closed');
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
//        AContext.Connection.CheckForGracefulDisconnect;
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
  session: TMQTTSessionClass;
//  args: TClientConnectEvent;
begin
  // cleansession
  cls := true;

  // parse connect packet
  if not FSessions.TryGetValue(cid, session) then begin
    session := TMQTTSessionClass.Create(cid, cls);
    FSessions.Add(cid, session);
  end;

  // handle will message
//  if ConnectFlags.WillFlag then
//    ses.WillMessage := ParseWillMessage(APacket);

  // Send CONNACK

  {$REGION 'zzz'}
  {
  args := TClientConnectEvent.Create;
  try
    // populate arguments from connection request
    args.ClientID := ...;
    args.Username := ...;
    args.Password := ...;
    args.Accept := true; // default to accepting connection

    // trigger event
    if Assigned(FOnClientConnect) then
      FOnClientConnect(args);

    // Handle decision
    if not args.Accept then
      SendConnectionRefused(args.ReturnCode)
    else
      EstablishConnection(args.Session);

  finally
    args.Free;
  end;
  }
  {$ENDREGION}

end;

procedure TMQTTServerClass.OnDisconnectHandler(AContext: TIdContext);
var
  session: TMQTTSessionClass;
  accept: boolean;
begin
  session := AContext.Data as TMQTTSessionClass;
  if Assigned(session) then begin
    if Assigned(FOnClientDisconnect) then
      FOnClientDisconnect(Self, session.ClientId, accept, disconrcCLIENT_DISCONNECTED);

    // handle will message if exists
//    if session.WillMessage.Topic <> '' then
//      PublishPacketProcess(nil, session.WillMessage);
  end;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Zzz'}
(*

*)
{$ENDREGION}

end.
