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
  , IdStack
  , IdContext
//, IdCustomTCPServer
//, IdIOHandlerSocket
//, IdTCPConnection
  , IdTCPServer
  , IdIOHandler
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

  // client subscribe event
  TOnMQTTClientSubscribe = procedure(Sender: TMQTTServerClass; ClientID: string; var Accept: boolean; Reason: TMQTTSubscribeReturnCode) of object;

  // client unsubscribe event
  TOnMQTTClientUnsubscribe = procedure(Sender: TMQTTServerClass; ClientID: string; var Accept: boolean; Reason: TMQTTUnsubscribeReturnCode) of object;

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

  TMQTTServerClass = class(TMQTTClass) // *** chande to TMQTTBrokerClass ***
  private
    // fields
    FTCPServer: TIdTCPServer;
    FSessions: TDictionary<string, TMQTTSessionClass>;
    FRetainedMessages: TDictionary<string, TMQTTMessageRec>;

    FOnClientConnect    : TOnMQTTClientConnect;
    FOnClientPingReq    : TOnMQTTClientPingReq;
    FOnClientPublish    : TOnMQTTClientPublish;
    FOnClientSubscribe  : TOnMQTTClientSubscribe;
    FOnClientUnsubscribe: TOnMQTTClientUnsubscribe;
    FOnClientMessage    : TOnMQTTMessage;
    FOnClientDisconnect: TOnMQTTClientDisconnect;
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
    function  SubscribePacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass; out ASubscribePacket: TMQTTSubscribePacketRec): TMQTTSubscribeReturnCode;
    procedure SubAckSend(ASession: TMQTTSessionClass; APacketID: Word; AGrantedQoS: array of TMQTTQOSType);

    // unsubscriberoutines
    function  UnsubscribePacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass; out AUnsubscribePacket: TMQTTUnsubscribePacketRec): TMQTTUnsubscribeReturnCode;
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

  // broker
  FSessions         := TDictionary<string, TMQTTSessionClass>.Create; // store ...
  FRetainedMessages := TDictionary<string, TMQTTMessageRec>.Create;   // store ...
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
  AConnectPacket.ClientIdentifier := APacket.StringRead;

  // will
if AConnectPacket.ConnectFlags.WillFlag then begin
  // willtopic read
  AConnectPacket.WillTopic := APacket.StringRead;

  // willmessage read
  AConnectPacket.WillMessage := APacket.StringRead;
end;

  // username read
if AConnectPacket.ConnectFlags.UsernameFlag then
  AConnectPacket.Username := APacket.StringRead;

  // password read
if AConnectPacket.ConnectFlags.PasswordFlag then
  AConnectPacket.Password := APacket.StringRead;

  // default to accepting connection
  Accept := true;
  Result := conrcCONNECTION_ACCEPTED;
  {$ENDREGION}

  {$REGION 'validate'}
  // validate client ID
  if AConnectPacket.ClientIdentifier.IsEmpty and not AConnectPacket.ConnectFlags.CleanSession then begin
    accept := false;
    Result := conrcIDENTIFIER_REJECTED;
  end;
  {$ENDREGION}

  {$REGION 'postprocess'}
  // fire connection event
  if Assigned(FOnClientConnect) then
    FOnClientConnect(Self, AConnectPacket.ClientIdentifier, accept, Result);

  // exit
  if not accept then
    Exit;

  // create or retrieve session
  if not FSessions.TryGetValue(AConnectPacket.ClientIdentifier, ASession) then begin
    ASession := TMQTTSessionClass.Create(AConnectPacket.ClientIdentifier, AConnectPacket.ConnectFlags.CleanSession);
    FSessions.Add(AConnectPacket.ClientIdentifier, ASession);
  end else
    ASession.LastContactUpdate;
  {$ENDREGION}

  {$REGION 'sendback'}
  {$ENDREGION}

end;

procedure TMQTTServerClass.ConnAckSend(AContext: TIdContext; AReturnCode: TMQTTConnectReturnCode);
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
  // fire pingreq event
  if Assigned(FOnClientPingReq) then
    FOnClientPingReq(Self, ASession.ClientID, accept, Result);
  {$ENDREGION}

  {$REGION 'sendback'}
  {$ENDREGION}

end;

procedure TMQTTServerClass.PingRespSend(ASession: TMQTTSessionClass);
begin

end;

function  TMQTTServerClass.PublishPacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass; out APublishPacket: TMQTTPublishPacketRec): TMQTTPublishReturnCode;
var
  accept: boolean;
  ctrlbyte, flags: byte;
  appmessage: TMQTTMessageRec;
  appmessagelen: integer;
//args: TMessagePublishEvent;
begin

  {$REGION 'decode'}
  // ctrlbyte
  ctrlbyte := APacket.ByteRead;

  // type
  APublishPacket.PacketType := TMQTTPacketType((ctrlbyte and $F0) shr 4);

  // remaininglength read
  APublishPacket.RemainingLength := APacket.RemainingLengthRead;
  appmessagelen := APublishPacket.RemainingLength;

  // publish flags read
  APublishPacket.PublishFlags.FromByte(ctrlbyte and $0F);

  // topic name read
  APublishPacket.TopicName := APacket.StringRead;
  appmessagelen := appmessagelen - 2 - Length(APublishPacket.TopicName);

  // packet identifier read
  if APublishPacket.PublishFlags.QoSLevel in [qostAT_LEAST_ONCE, qostEXACTLY_ONCE] then begin
    APublishPacket.PacketIdentifier := APacket.WordRead;
    appmessagelen := appmessagelen - 2;
  end;

  // application message read
  APublishPacket.ApplicationMessage := APacket.StringReadLen(appmessagelen);

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

  {$REGION 'sendback'}
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
    qostAT_LEAST_ONCE: PubAckSend(ASession, appmessage.PacketIdentifier);
    qostEXACTLY_ONCE : PubRecSend(ASession, appmessage.PacketIdentifier);
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

function  TMQTTServerClass.SubscribePacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass; out ASubscribePacket: TMQTTSubscribePacketRec): TMQTTSubscribeReturnCode;
var
  accept: boolean;
  len: integer;
  topicfilter: string;
  requestedqos: TMQTTQOSType;
begin

  {$REGION 'decode'}
  // type
  ASubscribePacket.PacketType := TMQTTPacketType((APacket.ByteRead and $F0) shr 4);

  // remaininglength read
  ASubscribePacket.RemainingLength := APacket.RemainingLengthRead;

  // packet identifier read
  ASubscribePacket.PacketIdentifier := APacket.WordRead;

  // payload = topicfilters list
  while APacket.Stream.Position < APacket.Stream.Size do begin
    len := Length(ASubscribePacket.SubscribeTopicRecVec);
    SetLength(ASubscribePacket.SubscribeTopicRecVec, len + 1);
    topicfilter := APacket.StringRead;
    ASubscribePacket.SubscribeTopicRecVec[len].TopicFilter  := topicfilter;
    requestedqos := TMQTTQOSType(APacket.ByteRead);
    ASubscribePacket.SubscribeTopicRecVec[len].RequestedQoS := requestedqos;

    //ASession.SubscriptionAdd(topicfilter, requestedqos);
  end;

  // default to accepting disconnection
  accept := true;
  Result := subscribercSUBSCRIBE_ACCEPTED;
  {$ENDREGION}

  {$REGION 'validate'}
  {$ENDREGION}

  {$REGION 'postprocess'}
  // fire subscribe event
  if Assigned(FOnClientSubscribe) then
    FOnClientSubscribe(Self, ASession.ClientID, accept, Result);
  {$ENDREGION}

  {$REGION 'sendback'}
//  SubAckSend(ASession, PacketID, GrantedQoS);
  {$ENDREGION}

end;

procedure TMQTTServerClass.SubAckSend(ASession: TMQTTSessionClass; APacketID: Word; AGrantedQoS: array of TMQTTQOSType);
begin

end;

function  TMQTTServerClass.UnsubscribePacketProcess(ASession: TMQTTSessionClass; APacket: TMQTTPacketClass; out AUnsubscribePacket: TMQTTUnsubscribePacketRec): TMQTTUnsubscribeReturnCode;
var
  accept: boolean;
  len: integer;
  topicfilter: string;
begin

  {$REGION 'decode'}
  // type
  AUnsubscribePacket.PacketType := TMQTTPacketType((APacket.ByteRead and $F0) shr 4);

  // remaininglength read
  AUnsubscribePacket.RemainingLength := APacket.RemainingLengthRead;

  // packet identifier read
  AUnsubscribePacket.PacketIdentifier := APacket.WordRead;

  // payload = topicfilters list
  while APacket.Stream.Position < APacket.Stream.Size do begin
    len := Length(AUnsubscribePacket.UnsubscribeTopicRecVec);
    SetLength(AUnsubscribePacket.UnsubscribeTopicRecVec, len + 1);
    topicfilter := APacket.StringRead;
    AUnsubscribePacket.UnsubscribeTopicRecVec[len].TopicFilter  := topicfilter;

    //ASession.SubscriptionRemove(topicfilter);
  end;

  // default to accepting disconnection
  Accept := true;
  Result := unsubscribercUNSUBSCRIBE_ACCEPTED;
  {$ENDREGION}

  {$REGION 'validate'}
  {$ENDREGION}

  {$REGION 'postprocess'}
  // fire unsubscribe event
  if Assigned(FOnClientUnsubscribe) then
    FOnClientUnsubscribe(Self, ASession.ClientID, accept, Result);
  {$ENDREGION}

  {$REGION 'sendback'}
  {$ENDREGION}

end;

procedure TMQTTServerClass.UnsubAckSend(ASession: TMQTTSessionClass; APacketID: Word);
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

  {$REGION 'sendback'}
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
  bytes, response{, buffer}: TIdBytes;
  packetbytes: TBytes;
  size{, packetnumber}: cardinal;
  ctrlbyte: byte;
  ip: string;
  decoder: TMQTTStreamDecoder;
  packet: TMQTTPacketClass;
  packettype: TMQTTPacketType;
  session: TMQTTSessionClass;
  connectreturncode: TMQTTConnectReturnCode;
  connectpacketrec: TMQTTConnectPacketRec;
  pingreqreturncode: TMQTTPingreqReturnCode;
  pingreqpacketrec: TMQTTPingreqPacketRec;
  publishreturncode: TMQTTPublishReturnCode;
  publishpacketrec: TMQTTPublishPacketRec;
  subscribereturncode: TMQTTSubscribeReturnCode;
  subscribepacketrec: TMQTTSubscribePacketRec;
  unsubscribereturncode: TMQTTUnsubscribeReturnCode;
  unsubscribepacketrec: TMQTTUnsubscribePacketRec;
  disconnectreturncode: TMQTTDisconnectReturnCode;
  disconnectpacketrec: TMQTTDisconnectPacketRec;
  {$ENDREGION}

begin
  decoder := TMQTTStreamDecoder.Create;
  packet := TMQTTPacketClass.Create;
  try
    while AContext.Connection.Connected do begin
      // zip
      io := AContext.Connection.IOHandler{AContext.Connection.Socket};

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

      // clientip
      ip := AContext.Binding.PeerIP;

      // read all in a bytes buffer
      io.InputBuffer.ExtractToBytes(bytes, -1, False, -1); // or: io.ReadBytes(RawBytes, -1, False);

      // addtodecoder
      decoder.DataAppend(TBytes(bytes));

      // packetbypacket
//      packetnumber := 0;
      while Decoder.PacketTryExtract(packetbytes) do begin
        try
          // count
//          Inc(packetnumber);

          // read all in the packet's stream
          packet.Stream.Clear;
          // i
        //size := io.ReadInt32;
        //io.ReadStream(packet.Stream, {-1}size, false);
          // ii
        //packet.StreamFromBytes(TBytes(bytes));
          // iii
          packet.StreamFromBytes(packetbytes);

          // log
          if LogVerbose then
            Log('%s: received %d bytes', [ip, packet.Len]);
          if LogRawAscii then
            Log('%s: (%s)'             , [ip, packet.AsAscii]);
          if LogRawHex then
            Log('%s: (%s)'             , [ip, packet.AsHex]);
          if LogRawChar then
            Log('%s: (%s)'             , [ip, packet.AsChar]);

          // read 1st byte for packettype and flags
          ctrlbyte := packet.ByteRead;
          packet.Stream.Position := 0;

          // type
          packettype := TMQTTPacketType((ctrlbyte and $F0) shr 4);

          // session
          session := SessionGet({AContext}'client001');

          // process the various packets types
          case packettype of

            {$REGION 'RESERVED 0 packet'}
            ptRESERVED   : begin
              if LogVerbose then
                Log('%s: received RESERVED (0) packet', [ip]);
//              if Verbose then
//                Dmp(packet.AsChar);
            end;
            {$ENDREGION}

            {$REGION 'CONNECT 1 packet'}
            ptCONNECT    : begin
              if LogVerbose then
                Log('%s: received CONNECT (1) packet', [ip]);
              connectreturncode := ConnectPacketProcess(session, packet, connectpacketrec);
              if LogVerbose then
                Dmp(connectpacketrec.Dump);

              {$REGION 'reply CONNACK 2'}
              SetLength(response, 4);
              response[0] := $20; // 0010 0000   type=2, flags=reseeved
              response[1] := $02; // remaining length
              response[2] := $00; // nosessionpresent=$00, sessionpresentflag=$01
              response[3] := $00; // 0=connectionaccepted, 1=connectionrefusedunacceptableprotocollevel, ...
              io.Write(response);
              if LogVerbose then
                Log('%s: reply    CONNACK (2)', [ip]);
              {$ENDREGION}

            end;

  //          ptCONNACK    : begin
  //            Log('%s: received CONNACK (2) packet', [ip]);
  //          end;
            {$ENDREGION}

            {$REGION 'PUBLISH 3 packet'}
            ptPUBLISH    : begin
              if LogVerbose then
                Log('%s: received PUBLISH (3) packet', [ip]);
              publishreturncode := PublishPacketProcess(session, packet, publishpacketrec);
              if LogVerbose then
                Dmp(publishpacketrec.Dump);

              {$REGION 'reply PUBACK 4'}
              // reply nothing
              if          publishpacketrec.PublishFlags.QoSLevel = qostAT_MOST_ONCE then begin
                // ...

              // reply with a PUBACK packet (server send it only when qos level is 1, at least once delivery)
              end else if publishpacketrec.PublishFlags.QoSLevel = qostAT_LEAST_ONCE then begin
                SetLength(response, 4);
                response[0] := $40;                                   // PUBACK 4
                response[1] := $02;                                   // remaining length (2 bytes)
                response[2] := Hi(publishpacketrec.PacketIdentifier); //
                response[3] := Lo(publishpacketrec.PacketIdentifier); //
                io.Write(response);
                if LogVerbose then
                  Log('%s: reply    PUBACK (4)', [ip]);

              // ...
              end else if publishpacketrec.PublishFlags.QoSLevel = qostEXACTLY_ONCE then begin
                raise Exception.Create('Error, PUBLISH with QoS - 2 not implemented!');
              end;
              {$ENDREGION}

            end;

  //          ptPUBACK     : begin
  //            if LogVerbose then
//                Log('%s: received PUBACK (4) packet', [ip]);
  //          end;

  //          ptPUBREC     : begin
  //            if LogVerbose then
//                Log('%s: received PUBREC (5) packet', [ip]);
  //          end;

  //          ptPUBREL     : begin
  //            if LogVerbose then
//                Log('%s: received PUBREL (6) packet', [ip]);
  //          end;

  //          ptPUBCOMP    : begin
  //            if LogVerbose then
//                Log('%s: received PUBCOMP (7) packet', [ip]);
  //          end;
            {$ENDREGION}

            {$REGION 'SUBSCRIBE 8 packet'}
            ptSUBSCRIBE  : begin
              if LogVerbose then
                Log('%s: received SUBSCRIBE (8) packet', [ip]);
              subscribereturncode := SubscribePacketProcess(session, packet, subscribepacketrec);
              if LogVerbose then
                Dmp(subscribepacketrec.Dump);

              {$REGION 'reply SUBACK 9'}
              SetLength(response, 5);
              response[0] := $90;                                                              // = 1001 0000   control packet type (SUBACK)
              response[1] := $03;                                                              // = 0000 0000   remaining length (always 3)
              response[2] := Hi(subscribepacketrec.PacketIdentifier);                          // MSB
              response[3] := Lo(subscribepacketrec.PacketIdentifier);                          // LSB
              response[4] := integer(subscribepacketrec.SubscribeTopicRecVec[0].RequestedQoS); // requested QoS level

              io.Write(TIdBytes(response));
              if LogVerbose then
                Log('%s: reply    SUBACK (9)', [ip]);
              {$ENDREGION}

            end;

  //          ptSUBACK     : begin
  //            if LogVerbose then
//                Log('%s: received SUBACK (9) packet', [ip]);
  //          end;
            {$ENDREGION}

            {$REGION 'UNSUBSCRIBE 10 packet'}
            ptUNSUBSCRIBE: begin
              if LogVerbose then
                Log('%s: received UNSUBSCRIBE (10) packet', [ip]);
              unsubscribereturncode := UnsubscribePacketProcess(session, packet, unsubscribepacketrec);
              if LogVerbose then
                Dmp(unsubscribepacketrec.Dump);

              {$REGION 'reply UNSUBACK 11'}
              SetLength(response, 4);
              response[0] := $0B;                                                              // = 1011 0000   control packet type (UNSUBACK)
              response[1] := $02;                                                              // = 0000 0010   remaining length (always 2)
              response[2] := Hi(unsubscribepacketrec.PacketIdentifier);                        // MSB
              response[3] := Lo(unsubscribepacketrec.PacketIdentifier);                        // LSB

              io.Write(TIdBytes(response));
              if LogVerbose then
                Log('%s: reply    UNSUBACK (11)', [ip]);
              {$ENDREGION}

            end;

  //          ptUNSUBACK   : begin
  //            if LogVerbose then
//                Log('%s: received UNSUBACK (11) packet', [ip]);
  //          end;
            {$ENDREGION}

            {$REGION 'PINGREQ 12 packet'}
            ptPINGREQ    : begin
              if LogVerbose then
                Log('%s: received PINGREQ (12) packet', [ip]);
              pingreqreturncode := PingReqPacketProcess(session, packet, pingreqpacketrec);
              if LogVerbose then
                Dmp(pingreqpacketrec.Dump);

              {$REGION 'reply PINGRESP 13'}
              SetLength(response, 2);
              response[0] := $D0;          // = 1101 0000   control packet type (PINGRESP)
              response[1] := $00;          // = 0000 0000   remaining length (always 0)
              io.Write(TIdBytes(response));
              if LogVerbose then
                Log('%s: reply    PINGRESP (13)', [ip]);
              {$ENDREGION}

            end;

  //          ptPINGRESP   : begin
  //            if LogVerbose then
//                Log('%s: received PINGRESP (13) packet', [ip]);
  //          end;
            {$ENDREGION}

            {$REGION 'DISCONNECT 14 packet'}
            ptDISCONNECT : begin
              if LogVerbose then
                Log('%s: received DISCONNECT (14) packet', [ip]);
              disconnectreturncode := DisconnectPacketProcess(session, packet, disconnectpacketrec);
              if LogVerbose then
                Dmp(disconnectpacketrec.Dump);

              // tcpconnectionclose
              AContext.Connection.Disconnect;
//              io.Close;
//              io.CloseGracefully;
              //if LogVerbose then
//                Log('%s: client tcp connection closed', [ip]);
            end;
            {$ENDREGION}

            {$REGION 'RESERVED 15 packet'}
            ptRESERVED2  : begin
              if LogVerbose then
                Log('%s: received RESERVED (15) packet', [ip]);
//              if Verbose then
//                Dmp(packet.AsChar);
            end;
            {$ENDREGION}

          else
            Log('%s: received UNKNOWN packet', [ip]);
          end;

          {$REGION 'zzz'}
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
          {$ENDREGION}

        except
          on e: EIdConnClosedGracefully do begin
            Log('%s: Client disconnected gracefully', [ip]);
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
            AContext.Connection.Disconnect;
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
