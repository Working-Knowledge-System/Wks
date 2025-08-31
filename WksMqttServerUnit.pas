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
  , SynEdit
  , WksMqttTypesUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  // forward declaration
  TMqttServerClass = class;

  {$REGION 'tcpip events'}
  TOnClientJoin    = procedure(AContext: TIdContext) of object;
  TOnClientDisjoin = procedure(AContext: TIdContext) of object;
  TOnClientData    = procedure(Sender: TObject) of object;
  {$ENDREGION}

  {$REGION 'broker events'}
  // client connection packet event
  TOnMQTTClientConnect = procedure(Sender: TMqttServerClass; ClientIdentifier: string; var Accept: boolean; var ReturnCode: TMqttConnectReturnCode) of object;

  // client publish packet event
  TOnMQTTClientPublish = procedure(Sender: TMqttServerClass; ClientIdentifier: string; var Accept: boolean; Reason: TMqttPublishReturnCode) of object;

  // client subscribe packet event
  TOnMQTTClientSubscribe = procedure(Sender: TMqttServerClass; ClientIdentifier: string; var Accept: boolean; Reason: TMqttSubscribeReturnCode) of object;

  // client unsubscribe packet event
  TOnMQTTClientUnsubscribe = procedure(Sender: TMqttServerClass; ClientIdentifier: string; var Accept: boolean; Reason: TMqttUnsubscribeReturnCode) of object;

  // client pingreq packet event
  TOnMQTTClientPingreq = procedure(Sender: TMqttServerClass; ClientIdentifier: string; var Accept: boolean; Reason: TMqttPingreqReturnCode) of object;

  // client disconnection packet event
  TOnMQTTClientDisconnect = procedure(Sender: TMqttServerClass; ClientIdentifier: string; var Accept: boolean; Reason: TMqttDisconnectReturnCode) of object;
  {$ENDREGION}

  {$REGION 'broker events handlers arguments'}
  TMqttEventArgs = class // event arguments base class
  public
    Handled: boolean;  // set to true to prevent default handling
  end;

  TMqttClientConnectEventArgs = class(TMqttEventArgs) // message publication event (when a client connect to broker)
  public
    ClientIdentifier: string;
    Username: string;
    Password: string;
    Accept: boolean;
    ReturnCode: TMqttConnectReturnCode;
    WillMessage: TMqttMessageRec;
    Session: TMqttSessionDataClass;
  end;

  TMqttClientPublishEventArgs = class(TMqttEventArgs) // message publication event (when a client publishes)
  public
    SenderClientIdentifier: string;
    Topic: string;
    Payload: TBytes;
    QoS: TMqttQOSType;
    Retain: boolean;
    Accept: boolean;
  end;

  TMqttClientSubscribeEventArgs = class(TMqttEventArgs) // subscribe event ()
  public
    ClientIdentifier: string;
    TopicFilter: string;
    RequestedQoS: TMqttQOSType;
    GrantedQoS: TMqttQOSType;
    Accept: boolean;
  end;

  TMqttClientUnsubscribeEventArgs = class(TMqttEventArgs) // unsubscribe event ()
  public
    ClientIdentifier: string;
    TopicFilter: string;
    Accept: boolean;
  end;

  TMqttClientDisconnectEventArgs = class(TMqttEventArgs) // message publication event (when a client disconnect to broker)
  public
    ClientIdentifier: string;
    Reason: string;
    Session: TMqttSessionDataClass;
  end;

  TMqttMessageDeliveryEvent = class(TMqttEventArgs) // message delivery event (before delivering to a subscriber)
  public
    TargetClientIdentifier: string;
    Topic: string;
    Payload: TBytes;
    QoS: TMqttQOSType;
    Retain: boolean;
    Accept: boolean;
  end;

  TMqttRetainedMessageEvent = class(TMqttEventArgs) // retainedmessage event
  public
    Topic: string;
    Payload: TBytes;
    QoS: TMqttQOSType;
    Retain: boolean;
    Accept: boolean;
  end;

  TMqttAuthenticationEvent = class(TMqttEventArgs) // authentication event
  public
    Username: string;
    Password: string;
    Accept: boolean;
  end;

  TErrorEvent = class(TMqttEventArgs) // error event
  public
    ErrorCode: integer;
    ErrorMessage: string;
  end;
  {$ENDREGION}

  {$REGION 'broker events handlers'}
  TClientConnectHandler     = reference to procedure(Args: TMqttClientConnectEventArgs);
  TClientPublishHandler     = reference to procedure(Args: TMqttClientPublishEventArgs);
  TClientSubscribeHandler   = reference to procedure(Args: TMqttClientSubscribeEventArgs);
  TClientUnsubscribeHandler = reference to procedure(Args: TMqttClientUnsubscribeEventArgs);
  TClientDisconnectHandler  = reference to procedure(Args: TMqttClientDisconnectEventArgs);
  TMessageDeliveryHandler   = reference to procedure(Args: TMqttMessageDeliveryEvent);
  TRetainedMessageHandler   = reference to procedure(Args: TMqttRetainedMessageEvent);
  TAuthenticationHandler    = reference to procedure(Args: TMqttAuthenticationEvent);
  TErrorHandler             = reference to procedure(Args: TErrorEvent);
  {$ENDREGION}

  TMqttServerClass = class(TMqttClass) // *** chande to TMqttBrokerClass ***
  private
    // fields
    FTCPServer       : TIdTCPServer;
    FSessions        : TDictionary<string, TMqttSessionDataClass>;       // sessions with subscriptions
    FRetainedMessages: TDictionary<string, TMqttMessageRec>;

    // tcpipserver events
    FOnClientJoin   : TOnClientJoin;
    FOnClientDisjoin: TOnClientDisjoin;
    FOnClientData   : TOnClientData;

    // broker events
    FOnClientConnect    : TOnMQTTClientConnect;
    FOnClientPingReq    : TOnMQTTClientPingReq;
    FOnClientPublish    : TOnMQTTClientPublish;
    FOnClientSubscribe  : TOnMQTTClientSubscribe;
    FOnClientUnsubscribe: TOnMQTTClientUnsubscribe;
    FOnClientMessage    : TOnMQTTMessage;
    FOnClientDisconnect : TOnMQTTClientDisconnect;
//  FOnMessageDeliver   : TOnMessageDeliveryHandler;
//  FOnRetainedMessage  : TOnRetainedMessageHandler;
//  FOnAuthenticate     : TOnAuthenticationHandler;
//  FOnError            : TOnErrorHandler;

    // tcpipserver events handlers
    procedure OnClientJoinHandler(AContext: TIdContext);
    procedure OnClientDisjoinHandler(AContext: TIdContext);
    procedure OnClientDataReceiveHandler(AContext: TIdContext);

    // broker events handlers
    procedure OnClientConnectHandler(AContext: TIdContext);
    procedure OnClientDisconnectHandler(AContext: TIdContext);

    // connectroutines
    function  ConnectPacketProcess(ASession: TMqttSessionDataClass; APacket: TMqttPacketClass; out AConnectPacket: TMqttConnectPacketRec): TMqttConnectReturnCode;
    procedure ConnAckSend(AContext: TIdContext; AReturnCode: TMqttConnectReturnCode);

    // publishroutines
    function  PublishPacketProcess(ASession: TMqttSessionDataClass; APacket: TMqttPacketClass; out APublishPacket: TMqttPublishPacketRec): TMqttPublishReturnCode;
    procedure PubAckSend(ASession: TMqttSessionDataClass; APacketID: Word);
    procedure PubRecSend(ASession: TMqttSessionDataClass; APacketID: Word);
    procedure PubRelSend(ASession: TMqttSessionDataClass; APacketID: Word);
    procedure PubCompSend(ASession: TMqttSessionDataClass; APacketID: Word);

    // subscriberoutines
    function  SubscribePacketProcess(ASession: TMqttSessionDataClass; APacket: TMqttPacketClass; out ASubscribePacket: TMqttSubscribePacketRec): TMqttSubscribeReturnCode;
    procedure SubAckSend(ASession: TMqttSessionDataClass; APacketID: Word; AGrantedQoS: array of TMqttQOSType);

    // unsubscriberoutines
    function  UnsubscribePacketProcess(ASession: TMqttSessionDataClass; APacket: TMqttPacketClass; out AUnsubscribePacket: TMqttUnsubscribePacketRec): TMqttUnsubscribeReturnCode;
    procedure UnsubAckSend(ASession: TMqttSessionDataClass; APacketID: Word);

    // pingroutines
    function  PingReqPacketProcess(ASession: TMqttSessionDataClass; APacket: TMqttPacketClass; out APingreqPacket: TMqttPingreqPacketRec): TMqttPingreqReturnCode;
    procedure PingRespSend(ASession: TMqttSessionDataClass);

    // disconnectroutines
    function  DisconnectPacketProcess(ASession: TMqttSessionDataClass; APacket: TMqttPacketClass; out ADisconnectPacket: TMqttDisconnectPacketRec): TMqttDisconnectReturnCode;

    // forwardroutines (delivery to subscribers)
    procedure ApplicationMessageBroadcast(AMessage: TMqttMessageRec);

    // topicsroutines
    function  TopicMatchesFilter(ATopicName, ATopicFilter: string): boolean;

    // utils
  //function ClientIdentifierValidate(const AClientIdentifier: string): boolean;
  public
    constructor Create(ALogStrings: TStrings; ALogVerbose, ALogRawAscii, ALogRawHex, ALogRawChar: TCheckBox); override;
    destructor Destroy; override;
    procedure Start(APort: Word = 1883);
    procedure Stop;
    function IsRunning: boolean;      // tcpserver is active
    function HasConnections: boolean; // mqttbroker has active mqttclients connections
    function ClientCount: Integer;
    function SessionGet(AClientIdentifier: string): TMqttSessionDataClass;

    // tcp event properties
    property OnClientJoin    : TOnClientJoin             read FOnClientJoin       write FOnClientJoin;
    property OnClientDisjoin : TOnClientDisjoin          read FOnClientDisjoin    write FOnClientDisjoin;
    property OnClientData    : TOnClientData             read FOnClientData       write FOnClientData;

    // broker event properties
    property OnClientConnect   : TOnMQTTClientConnect    read FOnClientConnect    write FOnClientConnect;
    property OnClientDisconnect: TOnMQTTClientDisconnect read FOnClientDisconnect write FOnClientDisconnect;
    property OnClientMessage   : TOnMQTTMessage          read FOnClientMessage    write FOnClientMessage;
  end;
{$ENDREGION}

implementation

{$REGION 'TMqttServerClass'}
constructor TMqttServerClass.Create(ALogStrings: TStrings; ALogVerbose, ALogRawAscii, ALogRawHex, ALogRawChar: TCheckBox);
begin
  inherited Create(ALogStrings, ALogVerbose, ALogRawAscii, ALogRawHex, ALogRawChar);

  // tcpserver
  FTCPServer := TIdTCPServer.Create(nil);
  FTCPServer.OnConnect    := OnClientJoinHandler;
  FTCPServer.OnDisconnect := OnClientDisjoinHandler;
  FTCPServer.OnExecute    := OnClientDataReceiveHandler;

  // broker
  FSessions         := TDictionary<string, TMqttSessionDataClass>.Create; // store ...
  FRetainedMessages := TDictionary<string, TMqttMessageRec>.Create;   // store ...
end;

destructor TMqttServerClass.Destroy;
var
  session: TMqttSessionDataClass;
begin
  // sessions
  for session in FSessions.Values do
    session.Free;
  FSessions.Free;

  // retainedmessages
  FRetainedMessages.Free;

  // tcpserver
  FTCPServer.Free;

  inherited;
end;

procedure TMqttServerClass.Start(APort: Word);
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

procedure TMqttServerClass.Stop;
var
  cxt: TIdContext;
  ses: TMqttSessionDataClass;
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
      if Assigned(cxt.Data) and (cxt.Data is TMqttSessionDataClass) then begin
        ses := cxt.Data as TMqttSessionDataClass;

        // notify disconnection event
        if Assigned(FOnClientDisconnect) then
          FOnClientDisconnect(Self, ses.ClientIdentifier, accept, disconrcSERVER_STOPPING);

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
      FSessions.Remove(ses.ClientIdentifier);
      ses.Free;
    end;
  end;
  Log('clients sessions cleared');
end;

function  TMqttServerClass.ConnectPacketProcess(ASession: TMqttSessionDataClass; APacket: TMqttPacketClass; out AConnectPacket: TMqttConnectPacketRec): TMqttConnectReturnCode;
var
  accept: boolean;
begin

  {$REGION 'decode'}
  // type
  AConnectPacket.PacketType := TMqttPacketType((APacket.ByteRead and $F0) shr 4);

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

  {$REGION 'events'}
  // fire connection event
  if Assigned(FOnClientConnect) then
    FOnClientConnect(Self, AConnectPacket.ClientIdentifier, accept, Result);
  {$ENDREGION}

  // exit
  if not accept then
    Exit;

  {$REGION 'session'}
  // create or retrieve session
  if not FSessions.TryGetValue(AConnectPacket.ClientIdentifier, ASession) then begin
    ASession := TMqttSessionDataClass.Create(AConnectPacket.ClientIdentifier, AConnectPacket.ConnectFlags.CleanSession);
    FSessions.Add(AConnectPacket.ClientIdentifier, ASession);
  end else
    ASession.LastContactUpdate;
  {$ENDREGION}

  {$REGION 'sendback'}
  {$ENDREGION}

end;

procedure TMqttServerClass.ConnAckSend(AContext: TIdContext; AReturnCode: TMqttConnectReturnCode);
begin
  ;
end;

function  TMqttServerClass.PublishPacketProcess(ASession: TMqttSessionDataClass; APacket: TMqttPacketClass; out APublishPacket: TMqttPublishPacketRec): TMqttPublishReturnCode;
var
  accept: boolean;
  ctrlbyte, flags: byte;
  appmessage: TMqttMessageRec;
  appmessagelen: integer;
//args: TMessagePublishEvent;
begin

  {$REGION 'zzz'}
//  appmessage := APacket.MessageRead;
  {$ENDREGION}

  {$REGION 'decode'}
  // ctrlbyte
  ctrlbyte := APacket.ByteRead;

  // type
  APublishPacket.PacketType := TMqttPacketType((ctrlbyte and $F0) shr 4);

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

  {$REGION 'events'}
  // fire publishing event
  if Assigned(FOnClientPublish) then
    FOnClientPublish(Self, ASession.ClientIdentifier, accept, Result);
  {$ENDREGION}

  // exit
  if not accept then
    Exit;

  {$REGION 'retainedmessage'}
  // store retained message (only if qos = 1 or 2 ?)
  if APublishPacket.PublishFlags.Retain then begin
    if Length(APublishPacket.ApplicationMessage) > 0 then begin
      appmessage.DupFlag            := APublishPacket.PublishFlags.DupFlag;
      appmessage.QoS                := APublishPacket.PublishFlags.QoSLevel;
      appmessage.Retain             := APublishPacket.PublishFlags.Retain;
      appmessage.TopicName          := APublishPacket.TopicName;
      appmessage.PacketIdentifier   := APublishPacket.PacketIdentifier;
      appmessage.ApplicationMessage := BytesOf(APublishPacket.ApplicationMessage);
      FRetainedMessages.AddOrSetValue(APublishPacket.TopicName, appmessage)
    end else
      FRetainedMessages.Remove(APublishPacket.TopicName);
  end;
  {$ENDREGION}

  {$REGION 'session'}
  // create or retrieve session
//  if not FSessions.TryGetValue(ASession.ClientIdentifier, ASession) then begin
//    ASession := TMqttSessionDataClass.Create(ASession.ClientIdentifier, {APublishPacket.PublishFlags.CleanSession}true);
//    FSessions.Add(ASession.ClientIdentifier, ASession);
//  end else
//    ASession.LastContactUpdate;
  {$ENDREGION}

  {$REGION 'broadcast'}
  // forward to subscribers
  //ApplicationMessageBroadcast(appmessage);
  {$ENDREGION}

  {$REGION 'sendback'}
  {
  // handle qos acknowledgements
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
    args.SenderClientIdentifier := ASession.ClientIdentifier;
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

procedure TMqttServerClass.PubRecSend(ASession: TMqttSessionDataClass; APacketID: Word);
begin
  ;
end;

procedure TMqttServerClass.PubRelSend(ASession: TMqttSessionDataClass; APacketID: Word);
begin
  ;
end;

procedure TMqttServerClass.PubAckSend(ASession: TMqttSessionDataClass; APacketID: Word);
begin
  ;
end;

procedure TMqttServerClass.PubCompSend(ASession: TMqttSessionDataClass; APacketID: Word);
begin
  ;
end;

function  TMqttServerClass.SubscribePacketProcess(ASession: TMqttSessionDataClass; APacket: TMqttPacketClass; out ASubscribePacket: TMqttSubscribePacketRec): TMqttSubscribeReturnCode;
var
  accept: boolean;
  len: integer;
  topicfilter: string;
  requestedqos: TMqttQOSType;
  //session: TMqttSessionDataClass;
begin

  {$REGION 'decode'}
  // type
  ASubscribePacket.PacketType := TMqttPacketType((APacket.ByteRead and $F0) shr 4);

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
    requestedqos := TMqttQOSType(APacket.ByteRead);
    ASubscribePacket.SubscribeTopicRecVec[len].RequestedQoS := requestedqos;

    //ASession.SubscriptionAdd(topicfilter, requestedqos);
  end;

  // default to accepting disconnection
  accept := true;
  Result := subscribercSUBSCRIBE_ACCEPTED;
  {$ENDREGION}

  {$REGION 'validate'}
  {$ENDREGION}

  {$REGION 'sessionsubscription'}
      // store session with subscription
//      if not FSessions.TryGetValue(topicfilter, ASession) then begin
//        ASession.SubscriptionAdd(topicfilter, qostAT_LEAST_ONCE);
//        Log('topicfilter/subscriberslist not found in sessions... added a new empty subscriberslist with new topicfilter %s', [topicfilter]);
//      end;
//    if not subscriberslist.Contains(AContext) then begin
//      subscriberslist.Add(AContext);
//      Log('subscriber not found in subscriberslist... added new subscriber');
//    end;
  {$ENDREGION}

  {$REGION 'events'}
  // fire subscribe event
  if Assigned(FOnClientSubscribe) then
    FOnClientSubscribe(Self, ASession.ClientIdentifier, accept, Result);
  {$ENDREGION}

  {$REGION 'sendback'}
//  SubAckSend(ASession, PacketID, GrantedQoS);
  {$ENDREGION}

end;

procedure TMqttServerClass.SubAckSend(ASession: TMqttSessionDataClass; APacketID: Word; AGrantedQoS: array of TMqttQOSType);
begin
  ;
end;

function  TMqttServerClass.UnsubscribePacketProcess(ASession: TMqttSessionDataClass; APacket: TMqttPacketClass; out AUnsubscribePacket: TMqttUnsubscribePacketRec): TMqttUnsubscribeReturnCode;
var
  accept: boolean;
  len: integer;
  topicfilter: string;
begin

  {$REGION 'decode'}
  // type
  AUnsubscribePacket.PacketType := TMqttPacketType((APacket.ByteRead and $F0) shr 4);

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

  {$REGION 'events'}
  // fire unsubscribe event
  if Assigned(FOnClientUnsubscribe) then
    FOnClientUnsubscribe(Self, ASession.ClientIdentifier, accept, Result);
  {$ENDREGION}

  {$REGION 'sendback'}
  {$ENDREGION}

end;

procedure TMqttServerClass.UnsubAckSend(ASession: TMqttSessionDataClass; APacketID: Word);
begin
  ;
end;

function  TMqttServerClass.PingReqPacketProcess(ASession: TMqttSessionDataClass; APacket: TMqttPacketClass; out APingreqPacket: TMqttPingreqPacketRec): TMqttPingreqReturnCode;
var
  accept: boolean;
begin

  {$REGION 'decode'}
  // type
  APingreqPacket.PacketType := TMqttPacketType((APacket.ByteRead and $F0) shr 4);

  // remaininglength read
  APingreqPacket.RemainingLength := APacket.RemainingLengthRead;

  // default to accepting disconnection
  Accept := true;
  Result := pingreqrcPINGREQ_ACCEPTED;
  {$ENDREGION}

  {$REGION 'validate'}
  {$ENDREGION}

  {$REGION 'events'}
  // fire pingreq event
  if Assigned(FOnClientPingReq) then
    FOnClientPingReq(Self, ASession.ClientIdentifier, accept, Result);
  {$ENDREGION}

  {$REGION 'sendback'}
  {$ENDREGION}

end;

procedure TMqttServerClass.PingRespSend(ASession: TMqttSessionDataClass);
begin
  ;
end;

function  TMqttServerClass.DisconnectPacketProcess(ASession: TMqttSessionDataClass; APacket: TMqttPacketClass; out ADisconnectPacket: TMqttDisconnectPacketRec): TMqttDisconnectReturnCode;
var
  accept: boolean;
begin

  {$REGION 'decode'}
  // type
  ADisconnectPacket.PacketType := TMqttPacketType((APacket.ByteRead and $F0) shr 4);

  // remaininglength read
  ADisconnectPacket.RemainingLength := APacket.RemainingLengthRead;

  // default to accepting disconnection
  Accept := true;
  Result := disconrcDISCONNECTION_ACCEPTED;
  {$ENDREGION}

  {$REGION 'validate'}
  {$ENDREGION}

  // exit
  if not accept then
    Exit;

  if Assigned(ASession) then begin

    {$REGION 'events'}
    // fire disconnection event
    if Assigned(FOnClientDisconnect) then
      FOnClientDisconnect(Self, ASession.ClientIdentifier, accept, Result);
    {$ENDREGION}

    {$REGION 'will'}
    // handle will message if exists
//    if not ASession.WillMessage.TopicName.IsEmpty then
//      PublishPacketProcess(nil, ASession.WillMessage);
    {$ENDREGION}

  end;

  {$REGION 'sendback'}
  // nothing
  {$ENDREGION}

end;

procedure TMqttServerClass.ApplicationMessageBroadcast(AMessage: TMqttMessageRec);
var
  session: TMqttSessionDataClass;
  subscription: TMqttSubscribeTopicRec;
begin
  {
  sessions
    |__session1
    |    |__subscription2.1 (topicfiletr, qos)
    |    |__subscription2.2
    |    |__...
    |
    |__session2
         |__...
  }

  for session in FSessions.Values do begin
    for subscription in session.Subscriptions do begin
      if TopicMatchesFilter(AMessage.TopicName, subscription.TopicFilter) then begin
        // delivery sending a message to subscriber client with appropriate QoS
//        PublishSend(session, AMessage.TopicName, AMessage.ApplicationMessage, subscription.QoS, False);
      end;
    end;
  end;
end;

function  TMqttServerClass.TopicMatchesFilter(ATopicName, ATopicFilter: string): boolean;
begin
  Result := false;
end;

function  TMqttServerClass.IsRunning: boolean;
begin
  Result := FTCPServer.Active;
end;

function  TMqttServerClass.HasConnections: boolean;
begin
  Result := false; // *** how to determine if there are active mqttclients? ***
end;

function  TMqttServerClass.ClientCount: integer;
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

function  TMqttServerClass.SessionGet(AClientIdentifier: string): TMqttSessionDataClass;
begin
  if not FSessions.TryGetValue(AClientIdentifier, Result) then
    Result := nil;
end;
{$ENDREGION}

{$REGION 'TCPServerHandlers'}
procedure TMqttServerClass.OnClientJoinHandler(AContext: TIdContext);
begin
  //Log('client %d joined from: %s', [AContext.Binding.ID, AContext.Binding.PeerIP]);

  // trigger (invike) the event if it’s assigned
  if Assigned(FOnClientJoin) then
    FOnClientJoin(AContext);

//Accept := IsClientAllowed(ClientIdentifier);
//if not Accept then
//  ReturnCode := rcNOT_AUTHORIZED;
end;

procedure TMqttServerClass.OnClientDisjoinHandler(AContext: TIdContext);
begin
  //Log('client %d disjoined from: %s reason: %s', [AContext.Binding.ID{ClientIdentifier}, AContext.Binding.PeerIP, 'AReason']);

  // trigger (invike) the event if it’s assigned
  if Assigned(FOnClientDisjoin) then
    FOnClientDisjoin(AContext);
end;

procedure TMqttServerClass.OnClientDataReceiveHandler(AContext: TIdContext); // IncomingPacketProcess

  {$REGION 'var'}
var
  io: TIdIOHandler{TIdIOHandlerSocket};
  bytes, response{, buffer}: TIdBytes;
  packetbytes: TBytes;
  size: cardinal;
  ctrlbyte: byte;
  ip: string;
  decoder: TMqttStreamDecoder;
  packet: TMqttPacketClass;
  packettype: TMqttPacketType;
  session: TMqttSessionDataClass;
  connectreturncode: TMqttConnectReturnCode;
  connectpacketrec: TMqttConnectPacketRec;
  pingreqreturncode: TMqttPingreqReturnCode;
  pingreqpacketrec: TMqttPingreqPacketRec;
  publishreturncode: TMqttPublishReturnCode;
  publishpacketrec: TMqttPublishPacketRec;
  subscribereturncode: TMqttSubscribeReturnCode;
  subscribepacketrec: TMqttSubscribePacketRec;
  unsubscribereturncode: TMqttUnsubscribeReturnCode;
  unsubscribepacketrec: TMqttUnsubscribePacketRec;
  disconnectreturncode: TMqttDisconnectReturnCode;
  disconnectpacketrec: TMqttDisconnectPacketRec;
  {$ENDREGION}

begin
  decoder := TMqttStreamDecoder.Create;
  packet := TMqttPacketClass.Create;
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
//          if io.InputBufferIsEmpty then begin
//            Log('nodata');
//            Sleep(10);
//            Exit;
//          end;
//        end;

      // clientip
      ip := AContext.Binding.PeerIP;

      // read all in a bytes buffer
      io.InputBuffer.ExtractToBytes(bytes, -1, False, -1); // or: io.ReadBytes(RawBytes, -1, False);

      // addtodecoder
      decoder.DataAppend(TBytes(bytes));

      // packetbypacket
      while decoder.PacketTryExtract(packetbytes) do begin
        try
          // read all in the packet's stream
          packet.Stream.Clear;
        //size := io.ReadInt32;
        //io.ReadStream(packet.Stream, {-1}size, false);
          packet.StreamFromBytes({TBytes(bytes)}packetbytes);

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

          // session
          session := SessionGet({AContext}'client001');

          // process the various packets types
          case packettype of

            {$REGION 'RESERVED 0 packet'}
            ptRESERVED   : begin
              if LogVerbose.Checked then
                Log('%s: received RESERVED (0) packet', [ip]);
              if LogVerbose.Checked then
                Dmp(packet.AsChar);

              // doing nothing, do not repy
            end;
            {$ENDREGION}

            {$REGION 'CONNECT 1 packet'}
            ptCONNECT    : begin
              if LogVerbose.Checked then
                Log('%s: received CONNECT (1) packet', [ip]);
              connectreturncode := ConnectPacketProcess(session, packet, connectpacketrec);
              if LogVerbose.Checked then
                Dmp(connectpacketrec.Dump);

              {$REGION 'reply CONNACK 2'}
              SetLength(response, 4);
              response[0] := $20; // 0010 0000   type=2, flags=reseeved
              response[1] := $02; // remaining length
              response[2] := $00; // nosessionpresent=$00, sessionpresentflag=$01
              response[3] := $00; // 0=connectionaccepted, 1=connectionrefusedunacceptableprotocollevel, ...
              io.Write(response);
              if LogVerbose.Checked then
                Log('%s: reply    CONNACK (2)', [ip]);
              {$ENDREGION}

            end;

  //          ptCONNACK    : begin
  //            if LogVerbose.Checked then
  //              Log('%s: received CONNACK (2) packet', [ip]);
  //          end;
            {$ENDREGION}

            {$REGION 'PUBLISH 3 packet'}
            ptPUBLISH    : begin
              if LogVerbose.Checked then
                Log('%s: received PUBLISH (3) packet', [ip]);
              publishreturncode := PublishPacketProcess(session, packet, publishpacketrec);
              if LogVerbose.Checked then
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
                if LogVerbose.Checked then
                  Log('%s: reply    PUBACK (4)', [ip]);

              // ...
              end else if publishpacketrec.PublishFlags.QoSLevel = qostEXACTLY_ONCE then begin
                raise Exception.Create('Error, PUBLISH with QoS - 2 not implemented!');
              end;
              {$ENDREGION}

            end;

  //          ptPUBACK     : begin
  //            if LogVerbose.Checked then
//                Log('%s: received PUBACK (4) packet', [ip]);
  //          end;

  //          ptPUBREC     : begin
  //            if LogVerbose.Checked then
//                Log('%s: received PUBREC (5) packet', [ip]);
  //          end;

  //          ptPUBREL     : begin
  //            if LogVerbose.Checked then
//                Log('%s: received PUBREL (6) packet', [ip]);
  //          end;

  //          ptPUBCOMP    : begin
  //            if LogVerbose.Checked then
//                Log('%s: received PUBCOMP (7) packet', [ip]);
  //          end;
            {$ENDREGION}

            {$REGION 'SUBSCRIBE 8 packet'}
            ptSUBSCRIBE  : begin
              if LogVerbose.Checked then
                Log('%s: received SUBSCRIBE (8) packet', [ip]);
              subscribereturncode := SubscribePacketProcess(session, packet, subscribepacketrec);
              if LogVerbose.Checked then
                Dmp(subscribepacketrec.Dump);

              {$REGION 'reply SUBACK 9'}
              SetLength(response, 5);
              response[0] := $90;                                                              // = 1001 0000   control packet type (SUBACK)
              response[1] := $03;                                                              // = 0000 0000   remaining length (always 3)
              response[2] := Hi(subscribepacketrec.PacketIdentifier);                          // MSB
              response[3] := Lo(subscribepacketrec.PacketIdentifier);                          // LSB
              response[4] := integer(subscribepacketrec.SubscribeTopicRecVec[0].RequestedQoS); // requested QoS level

              io.Write(TIdBytes(response));
              if LogVerbose.Checked then
                Log('%s: reply    SUBACK (9)', [ip]);
              {$ENDREGION}

            end;

  //          ptSUBACK     : begin
  //            if LogVerbose.Checked then
//                Log('%s: received SUBACK (9) packet', [ip]);
  //          end;
            {$ENDREGION}

            {$REGION 'UNSUBSCRIBE 10 packet'}
            ptUNSUBSCRIBE: begin
              if LogVerbose.Checked then
                Log('%s: received UNSUBSCRIBE (10) packet', [ip]);
              unsubscribereturncode := UnsubscribePacketProcess(session, packet, unsubscribepacketrec);
              if LogVerbose.Checked then
                Dmp(unsubscribepacketrec.Dump);

              {$REGION 'reply UNSUBACK 11'}
              SetLength(response, 4);
              response[0] := $0B;                                                              // = 1011 0000   control packet type (UNSUBACK)
              response[1] := $02;                                                              // = 0000 0010   remaining length (always 2)
              response[2] := Hi(unsubscribepacketrec.PacketIdentifier);                        // MSB
              response[3] := Lo(unsubscribepacketrec.PacketIdentifier);                        // LSB

              io.Write(TIdBytes(response));
              if LogVerbose.Checked then
                Log('%s: reply    UNSUBACK (11)', [ip]);
              {$ENDREGION}

            end;

  //          ptUNSUBACK   : begin
  //            if LogVerbose.Checked then
//                Log('%s: received UNSUBACK (11) packet', [ip]);
  //          end;
            {$ENDREGION}

            {$REGION 'PINGREQ 12 packet'}
            ptPINGREQ    : begin
              if LogVerbose.Checked then
                Log('%s: received PINGREQ (12) packet', [ip]);
              pingreqreturncode := PingReqPacketProcess(session, packet, pingreqpacketrec);
              if LogVerbose.Checked then
                Dmp(pingreqpacketrec.Dump);

              {$REGION 'reply PINGRESP 13'}
              SetLength(response, 2);
              response[0] := $D0;          // = 1101 0000   control packet type (PINGRESP)
              response[1] := $00;          // = 0000 0000   remaining length (always 0)
              io.Write(TIdBytes(response));
              if LogVerbose.Checked then
                Log('%s: reply    PINGRESP (13)', [ip]);
              {$ENDREGION}

            end;

  //          ptPINGRESP   : begin
  //            if LogVerbose.Checked then
//                Log('%s: received PINGRESP (13) packet', [ip]);
  //          end;
            {$ENDREGION}

            {$REGION 'DISCONNECT 14 packet'}
            ptDISCONNECT : begin
              if LogVerbose.Checked then
                Log('%s: received DISCONNECT (14) packet', [ip]);
              disconnectreturncode := DisconnectPacketProcess(session, packet, disconnectpacketrec);
              if LogVerbose.Checked then
                Dmp(disconnectpacketrec.Dump);

              // tcpconnectionclose
              AContext.Connection.Disconnect;
//              io.Close;
//              io.CloseGracefully;
              //if LogVerbose.Checked then
//                Log('%s: client tcp connection closed', [ip]);

              // just disconnect client, do not repy
            end;
            {$ENDREGION}

            {$REGION 'RESERVED 15 packet'}
            ptRESERVED2  : begin
              if LogVerbose.Checked then
                Log('%s: received RESERVED (15) packet', [ip]);
              if LogVerbose.Checked then
                Dmp(packet.AsChar);

              // doing nothing, do not repy
            end;
            {$ENDREGION}

          else
            Log('%s: received UNKNOWN packet', [ip]);

            // doing nothing, do not repy
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

          {$REGION 'exceptions'}
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
          {$ENDREGION}

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
procedure TMqttServerClass.OnClientConnectHandler(AContext: TIdContext);
var
  cid: string;  // clientidentifier
  cls: boolean; // cleansession
  session: TMqttSessionDataClass;
//  args: TClientConnectEvent;
begin
  // cleansession
  cls := true;

  // parse connect packet
  if not FSessions.TryGetValue(cid, session) then begin
    session := TMqttSessionDataClass.Create(cid, cls);
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
    args.ClientIdentifier := ...;
    args.Username         := ...;
    args.Password         := ...;
    args.Accept           := true; // default to accepting connection

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

procedure TMqttServerClass.OnClientDisconnectHandler(AContext: TIdContext);
var
  session: TMqttSessionDataClass;
  accept: boolean;
begin
  session := AContext.Data as TMqttSessionDataClass;
  if Assigned(session) then begin
    if Assigned(FOnClientDisconnect) then
      FOnClientDisconnect(Self, session.ClientIdentifier, accept, disconrcCLIENT_DISCONNECTED);

    // handle will message if exists
//    if session.WillMessage.Topic <> '' then
//      PublishPacketProcess(nil, session.WillMessage);
  end;
end;
{$ENDREGION}

end.
