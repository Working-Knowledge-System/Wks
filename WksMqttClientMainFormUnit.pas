unit WksMqttClientMainFormUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
  , System.StrUtils
  , System.Variants
  , System.Classes
  , System.UITypes
  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.StdCtrls
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.Imaging.pngimage
  , Vcl.ExtCtrls
  , Vcl.ComCtrls
  , System.SyncObjs//, IdTCPClient, IdGlobal, IdException
  , JvExExtCtrls
  , JvNetscapeSplitter
  , SynEdit
  , SynEditHighlighter
  , SynHighlighterGeneral
  , WksMqttBaseMainFormtUnit
  , WksMqttClientUnit
  , WksMqttTypesUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TMqttClientWorkerThread = class(TThread)
  private
    FIndex: Integer;
    FBarrier: TLightweightEvent;
  protected
    procedure Execute; override;
  public
    constructor Create(AIndex: integer; ABarrier: TLightweightEvent);
  end;

  TMainForm = class(TBaseForm)
    PublishRequestTabSheet: TTabSheet;
    PublishPacketSendButton: TButton;
    ConnectRequestTabSheet: TTabSheet;
    ConnectPacketSendButton: TButton;
    PublishTopicLabel: TLabel;
    PublishMessageLabel: TLabel;
    PublishTopicEdit: TEdit;
    PublishMessageEdit: TEdit;
    ServerTabSheet: TTabSheet;
    ServerHostLabel: TLabel;
    ServerPortLabel: TLabel;
    ServerHostEdit: TEdit;
    ServerPortEdit: TEdit;
    PingRequestTabSheet: TTabSheet;
    PingRequestPacketSendButton: TButton;
    ConnectKeepAliveSecondsLabel: TLabel;
    ConnectKeepAliveSecondsEdit: TEdit;
    ConnectWillTopicEdit: TEdit;
    ConnectWillTopicLabel: TLabel;
    ConnectWillMessageLabel: TLabel;
    ConnectWillMessageEdit: TEdit;
    ConnectWillActiveCheckBox: TCheckBox;
    ConnectCredentialsActiveCheckBox: TCheckBox;
    ConnectPasswordLabel: TLabel;
    ConnectUsernameLabel: TLabel;
    ConnectUsernameEdit: TEdit;
    ConnectPasswordEdit: TEdit;
    ServerJoinButton: TButton;
    ServerDisjoinButton: TButton;
    ConnectObjectIdLabel: TLabel;
    ConnectObjectIdEdit: TEdit;
    MqttTabSheet: TTabSheet;
    MqttProtocolNameLabel: TLabel;
    MqttProtocolLevelLabel: TLabel;
    MqttProtocolNameEdit: TEdit;
    DisconnectPacketSendButton: TButton;
    MqttProtocolLevelComboBox: TComboBox;
    ConnectCleanSessionCheckBox: TCheckBox;
    ConnectWillQosLabel: TLabel;
    ConnectQosComboBox: TComboBox;
    PublishQosLabel: TLabel;
    PublishQosComboBox: TComboBox;
    PublishDupFlagCheckBox: TCheckBox;
    PublishRetainCheckBox: TCheckBox;
    PublishCountLabel: TLabel;
    PublishPauseMsLabel: TLabel;
    PublishCountComboBox: TComboBox;
    PublishPauseMsComboBox: TComboBox;
    SubscribeRequestTabSheet: TTabSheet;
    SubscribePacketSendButton: TButton;
    UnsubscribePacketSendButton: TButton;
    SubscribeTopicFilterListMemo: TMemo;
    SubscribeTopicFilterListLabel: TLabel;
    ConnectObjectKindComboBox: TComboBox;
    ConnectObjectKindLabel: TLabel;
    TestTabSheet: TTabSheet;
    TestCountLabel: TLabel;
    TestPauseMsLabel: TLabel;
    TestCountComboBox: TComboBox;
    TestPauseMsComboBox: TComboBox;
    TestStartButton: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ServerDisjoinButtonClick(Sender: TObject);
    procedure ConnectPacketSendButtonClick(Sender: TObject);
    procedure PublishPacketSendButtonClick(Sender: TObject);
    procedure ServerJoinButtonClick(Sender: TObject);
    procedure PingRequestPacketSendButtonClick(Sender: TObject);
    procedure XxxExitButtonClick(Sender: TObject);
    procedure DisconnectPacketSendButtonClick(Sender: TObject);
    procedure SubscribePacketSendButtonClick(Sender: TObject);
    procedure UnsubscribePacketSendButtonClick(Sender: TObject);
    procedure TestStartButtonClick(Sender: TObject);
  private
    { Private declarations }
    FMqttClient: TMqttClientClass;
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  MainForm: TMainForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

//uses
//  ;
{$ENDREGION}

{$REGION 'Form'}
procedure TMainForm.FormCreate(Sender: TObject);
begin
  inherited;

  // gui
  Caption := 'WKS MQTT Client';
  TopPageControl.ActivePageIndex := 2;

  // ini
  MqttProtocolNameEdit.Text                := FIni.ReadString ('Mqtt'     , 'ProtocolName'     , 'MQTT' {this is fixed}                   );
  MqttProtocolLevelComboBox.ItemIndex      := FIni.ReadInteger('Mqtt'     , 'ProtocolLevel'    , 4 {3.1.1}                                );
  ServerHostEdit.Text                      := FIni.ReadString ('Server'   , 'Host'             , 'www.wks.cloud'                          );
  ServerPortEdit.Text                      := FIni.ReadString ('Server'   , 'Port'             , '1883'                                   );
  ConnectObjectKindComboBox.ItemIndex      := FIni.ReadInteger('Connect'  , 'ObjectKind'       , 4 {Equipment}                            ); // \__ ClientIdentifier = Equipment.101
  ConnectObjectIdEdit.Text                 := FIni.ReadString ('Connect'  , 'ClientId'         , '101'                                    ); // /
  ConnectQosComboBox.ItemIndex             := FIni.ReadInteger('Connect'  , 'Qos'              , 0                                        );
  ConnectWillTopicEdit.Text                := FIni.ReadString ('Connect'  , 'WillTopic'        , 'wks/mqtt/clients/$ClientIdentifier$/wlt');
  ConnectWillMessageEdit.Text              := FIni.ReadString ('Connect'  , 'WillMessage'      , 'I have done here folks!'                );
  ConnectWillActiveCheckBox.Checked        := FIni.ReadBool   ('Connect'  , 'WillActive'       , true                                     );
  ConnectUsernameEdit.Text                 := FIni.ReadString ('Connect'  , 'Username'         , 'username'                               );
  ConnectPasswordEdit.Text                 := FIni.ReadString ('Connect'  , 'Password'         , 'password'                               );
  ConnectCredentialsActiveCheckBox.Checked := FIni.ReadBool   ('Connect'  , 'CredentialsActive', true                                     );
  ConnectKeepAliveSecondsEdit.Text         := FIni.ReadString ('Connect'  , 'KeepAliveSeconds' , '60'                                     );
  ConnectCleanSessionCheckBox.Checked      := FIni.ReadBool   ('Connect'  , 'CleanSession'     , true                                     );
  PublishTopicEdit.Text                    := FIni.ReadString ('Publish'  , 'Topic'            , 'wks/mqtt/test/helloworld'               );
  PublishMessageEdit.Text                  := FIni.ReadString ('Publish'  , 'Message '         , 'hello MQTT!'                            );
  PublishQosComboBox.ItemIndex             := FIni.ReadInteger('Publish'  , 'Qos'              , 0                                        );
  PublishCountComboBox.ItemIndex           := FIni.ReadInteger('Publish'  , 'Count'            , 0                                        );
  PublishPauseMsComboBox.ItemIndex         := FIni.ReadInteger('Publish'  , 'PauseMs'          , 2                                        );
  SubscribeTopicFilterListMemo.Text        := FIni.ReadString ('Subscribe', 'TopicFilterList'  , 'wks/mqtt/system/*,0'                    ).Replace('|', sLineBreak);

  TestCountComboBox.ItemIndex              := FIni.ReadInteger('Server'   , 'TestCount'        , 0                                        );
  TestPauseMsComboBox.ItemIndex            := FIni.ReadInteger('Server'   , 'TestPauseMs'      , 2                                        );

  // client
  FMqttClient := TMqttClientClass.Create(LogSynEdit.Lines, LogVerboseCheckBox, LogRawAsciiCheckBox, LogRawHexCheckBox, LogRawCharCheckBox);
  Log('client created');
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  // ini
  FIni.WriteString ('Mqtt'     , 'ProtocolName'     , MqttProtocolNameEdit.Text               );
  FIni.WriteInteger('Mqtt'     , 'ProtocolLevel'    , MqttProtocolLevelComboBox.ItemIndex     );
  FIni.WriteString ('Server'   , 'Host'             , ServerHostEdit.Text                     );
  FIni.WriteString ('Server'   , 'Port'             , ServerPortEdit.Text                     );
  FIni.WriteInteger('Connect'  , 'ObjectKind'       , ConnectObjectKindComboBox.ItemIndex     );
  FIni.WriteString ('Connect'  , 'ClientId'         , ConnectObjectIdEdit.Text                );
  FIni.WriteInteger('Connect'  , 'Qos'              , ConnectQosComboBox.ItemIndex            );
  FIni.WriteString ('Connect'  , 'WillTopic'        , ConnectWillTopicEdit.Text               );
  FIni.WriteString ('Connect'  , 'WillMessage'      , ConnectWillMessageEdit.Text             );
  FIni.WriteBool   ('Connect'  , 'WillActive'       , ConnectWillActiveCheckBox.Checked       );
  FIni.WriteString ('Connect'  , 'Username'         , ConnectUsernameEdit.Text                );
  FIni.WriteString ('Connect'  , 'Password'         , ConnectPasswordEdit.Text                );
  FIni.WriteBool   ('Connect'  , 'CredentialsActive', ConnectCredentialsActiveCheckBox.Checked);
  FIni.WriteString ('Connect'  , 'KeepAliveSeconds ', ConnectKeepAliveSecondsEdit.Text        );
  FIni.WriteBool   ('Connect'  , 'CleanSession'     , ConnectCleanSessionCheckBox.Checked     );
  FIni.WriteString ('Publish'  , 'Topic'            , PublishTopicEdit.Text                   );
  FIni.WriteString ('Publish'  , 'Message'          , PublishMessageEdit.Text                 );
  FIni.WriteInteger('Publish'  , 'Qos'              , PublishQosComboBox.ItemIndex            );
  FIni.WriteInteger('Publish'  , 'Count'            , PublishCountComboBox.ItemIndex          );
  FIni.WriteInteger('Publish'  , 'PauseMs'          , PublishPauseMsComboBox.ItemIndex        );
  FIni.WriteString ('Subscribe', 'TopicFilterList'  , string(SubscribeTopicFilterListMemo.Text).Replace(sLineBreak, '|'));

  FIni.WriteInteger('Server'   , 'TestCount'        , TestCountComboBox.ItemIndex             );
  FIni.WriteInteger('Server'   , 'TestPauseMs'      , TestPauseMsComboBox.ItemIndex           );

  // disjoin from tcpserver
  if FMQTTClient.IsJoined then
    ServerDisjoinButton.Click;
  FMqttClient.Free;

  inherited;
end;

procedure TMainForm.XxxExitButtonClick(Sender: TObject);
begin
  // disconnet from mqttbroker
  if FMqttClient.IsConnected then
    FMqttClient.DisconnectPacketSend;

  // disjoin from tcpserver
  if FMqttClient.IsJoined then
    ServerDisjoinButton.Click;

  inherited;
end;
{$ENDREGION}

{$REGION 'Server'}
procedure TMainForm.ServerJoinButtonClick(Sender: TObject);
var
  prt: integer;
begin
  inherited;

  try
    prt := StrToIntDef(ServerPortEdit.Text, 1883);
    FMqttClient.Join(ServerHostEdit.Text, prt);
    ServerJoinButton.Enabled := false;
    ServerDisjoinButton.Enabled := true;
  except
    on e: Exception do
      ShowMessage(e.Message);
  end;
end;

procedure TMainForm.ServerDisjoinButtonClick(Sender: TObject);
begin
  inherited;

  FMqttClient.Disjoin;
  ServerJoinButton.Enabled := true;
  ServerDisjoinButton.Enabled := false;
end;
{$ENDREGION}

{$REGION 'ConnectPacketSend'}
procedure TMainForm.ConnectPacketSendButtonClick(Sender: TObject);
begin
  inherited;

  FMqttClient.ObjectKind := ConnectObjectKindComboBox.Text;
  FMqttClient.ObjectId   := string(ConnectObjectIdEdit.Text).ToInteger;

  FMqttClient.ConnectPacketSend(MqttProtocolLevelComboBox.ItemIndex, ConnectQosComboBox.ItemIndex, FMqttClient.ClientIdentifier, ConnectWillTopicEdit.Text, ConnectWillMessageEdit.Text, ConnectUsernameEdit.Text, ConnectPasswordEdit.Text, ConnectCleanSessionCheckBox.Checked, StrToIntDef(ConnectKeepAliveSecondsEdit.Text, 60));
end;

procedure TMainForm.DisconnectPacketSendButtonClick(Sender: TObject);
begin
  inherited;

  FMqttClient.DisconnectPacketSend;
end;
{$ENDREGION}

{$REGION 'PingReqPacketSend'}
procedure TMainForm.PingRequestPacketSendButtonClick(Sender: TObject);
begin
  inherited;

  FMqttClient.PingReqPacketSend;
end;
{$ENDREGION}

{$REGION 'PublishPacketSend'}
procedure TMainForm.PublishPacketSendButtonClick(Sender: TObject);
var
  i, count, pause: integer;
  msg: string;
begin
  inherited;

  count := StrToIntDef(PublishCountComboBox.Text  , 1);
  pause := StrToIntDef(PublishPauseMsComboBox.Text, 0);

  if count > 10 then
    if not (MessageDlg(Format('Send %d PUBLISH to the broker?', [count]), mtCustom, [mbYes, mbNo], 0) = mrYes) then
      Exit;

  for i := 1 to count do begin
    msg := PublishMessageEdit.Text;
    if msg.Contains('$Counter$') then
      msg := StringReplace(msg, '$Counter$', Format('%5d', [i]), [treplaceFlag.rfReplaceAll]);
    FMqttClient.PublishPacketSend(FMqttClient.NextPacketId, PublishTopicEdit.Text, msg, TMqttQosType(PublishQosComboBox.ItemIndex), PublishDupFlagCheckBox.Checked, PublishRetainCheckBox.Checked);
    Sleep(pause);
  end;
end;
{$ENDREGION}

{$REGION 'SubscribePacketSend'}
procedure TMainForm.SubscribePacketSendButtonClick(Sender: TObject);
var
  row: string;
  i, count: integer;
  rowsvec, tokenvec: TArray<string>;
  subscribevec: TMqttSubscribeTopicRecVec;
begin
  inherited;

  SubscribeTopicFilterListMemo.Text := string(SubscribeTopicFilterListMemo.Text).Trim;
  count := SubscribeTopicFilterListMemo.Lines.Count;
  SetLength(subscribevec, count);
  for i := 0 to count - 1 do begin
    row := SubscribeTopicFilterListMemo.Lines[i];
    if not row.Contains(',') then
      row := row + ',0';
    tokenvec := SplitString(row, ',');
    subscribevec[i].TopicFilter  := tokenvec[0];
    subscribevec[i].RequestedQoS := TMqttQoSType(StrToIntDef(tokenvec[1], 0));
  end;

  FMqttClient.SubscribePacketSend(FMqttClient.NextPacketId, subscribevec);
end;
{$ENDREGION}

{$REGION 'UnsubscribePacketSend'}
procedure TMainForm.UnsubscribePacketSendButtonClick(Sender: TObject);
var
  i, count: integer;
  row: string;
  unsubscribevec: TMqttUnsubscribeTopicRecVec;
begin
  inherited;

  SubscribeTopicFilterListMemo.Text := string(SubscribeTopicFilterListMemo.Text).Trim;
  count := SubscribeTopicFilterListMemo.Lines.Count;
  SetLength(unsubscribevec, count);
  for i := 0 to count - 1 do begin
    row := SubscribeTopicFilterListMemo.Lines[i];
    unsubscribevec[i].TopicFilter := row.Remove(row.IndexOf(','));
  end;

  FMqttClient.UnsubscribePacketSend(FMqttClient.NextPacketId, unsubscribevec);
end;
{$ENDREGION}

{$REGION 'TMqttClientWorkerThread'}
constructor TMqttClientWorkerThread.Create(AIndex: integer; ABarrier: TLightweightEvent);
begin
  inherited Create(false);  // run immediately
  FreeOnTerminate := false; // must be free manually after termination using a metod connected to .OnTerminate

  FIndex := AIndex;
  FBarrier := ABarrier;
end;

procedure TMqttClientWorkerThread.Execute;
var
  mqttclient: TMqttClientClass;
  host: string;
  prt{, i}: integer;
begin
  inherited;

  mqttclient := TMqttClientClass.Create(MainForm.LogSynEdit.Lines, MainForm.LogVerboseCheckBox, MainForm.LogRawAsciiCheckBox, MainForm.LogRawHexCheckBox, MainForm.LogRawCharCheckBox);
  try
    // init
    host := 'www.wks.cloud';
    prt := 1883;

    // tcp join
    mqttclient.ClientIdentifier; // := Format('MqttClientTest_%d', [FIndex]);
    mqttclient.Join(host, prt);

    // mqtt connect
    // ...

    // pingreq packet(s) send
    if true then
    //for i := 1 to 10 begin
      mqttclient.PingReqPacketSend;
      //Sleep(pause);
    //end;

    // sync point for concurrent disconnect
    FBarrier.WaitFor;

    // simulate short work
    Sleep(1000);

    // mqtt disconnect
    // ...

    // tcp disjoin
    mqttclient.Disjoin;
  except
    on e: Exception do
      Writeln(Format('[worker %d] Error: %s', [FIndex, e.Message]));
  end;
  mqttclient.Free;
end;
{$ENDREGION}

{$REGION 'Test'}
procedure TMainForm.TestStartButtonClick(Sender: TObject);
var
  i, count, pause: integer;
  barrier: TLightweightEvent;
  workers: array of TMqttClientWorkerThread;
begin
  inherited;

  // init
  count := StrToIntDef(TestCountComboBox.Text  , 1);
  pause := StrToIntDef(TestPauseMsComboBox.Text, 0);

  // exit
  if count > 1 then
    if not (MessageDlg(Format('Repeat %d tests with parallel workers threads?', [count]), mtCustom, [mbYes, mbNo], 0) = mrYes) then
      Exit;

  // equalizer
  barrier := TLightweightEvent.Create;

  // tests
  Log('Starting %d test clients workers for jon/disjoin...', [count]);
  try
    // create
    for i := 0 to count - 1 do begin
      Log('Create a MQTT Client worker thread %d', [i]);
      SetLength(workers, Length(workers) + 1);
      workers[i] := TMqttClientWorkerThread.Create(i, barrier);
    //workers[i].FreeOnTerminate := false;
    end;

    // Let them all connect before releasing
    Sleep(500); // give all threads time to reach barrier

    // release all at once
    barrier.SetEvent;

    // wait for all to finish
    Sleep(3000);

    // free
    for i := 0 to count - 1 do begin
      workers[i].WaitFor;
      workers[i].Free;
    end;
  finally
    barrier.Free;
  end;
  Log('All %d test clients workers finished', [count]);
end;
{$ENDREGION}

end.
