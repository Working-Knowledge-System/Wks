unit WksMqttClientMainFormUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
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
  , JvExExtCtrls
  , JvNetscapeSplitter
  , WksMqttBaseMainFormtUnit
  , WksMqttClientUnit
  , WksMqttTypesUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
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
    ConnectClientIdentifierLabel: TLabel;
    ConnectClientIdentifierEdit: TEdit;
    MqttTabSheet: TTabSheet;
    MqttProtocolNameLabel: TLabel;
    MqttProtocolLevelLabel: TLabel;
    MqttProtocolNameEdit: TEdit;
    DisconnectPacketSendButton: TButton;
    MqttProtocolLevelComboBox: TComboBox;
    ConnectCleanSessionCheckBox: TCheckBox;
    ConnectQosLabel: TLabel;
    ConnectQosComboBox: TComboBox;
    PublishQosLabel: TLabel;
    PublishQosComboBox: TComboBox;
    PublishDupFlagCheckBox: TCheckBox;
    PublishRetainCheckBox: TCheckBox;
    PingreqCountComboBox: TComboBox;
    PingreqCountLabel: TLabel;
    Label1: TLabel;
    PingreqPauseMsComboBox: TComboBox;
    PublishCountLabel: TLabel;
    PublishPauseMsLabel: TLabel;
    PublishCountComboBox: TComboBox;
    PublishPauseMsComboBox: TComboBox;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ServerDisjoinButtonClick(Sender: TObject);
    procedure ConnectPacketSendButtonClick(Sender: TObject);
    procedure PublishPacketSendButtonClick(Sender: TObject);
    procedure ServerJoinButtonClick(Sender: TObject);
    procedure PingRequestPacketSendButtonClick(Sender: TObject);
    procedure XxxExitButtonClick(Sender: TObject);
    procedure DisconnectPacketSendButtonClick(Sender: TObject);
  private
    { Private declarations }
    FMqttClient: TMQTTClientClass;
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
  MqttProtocolNameEdit.Text                := FIni.ReadString ('Mqtt'   , 'ProtocolName'     , 'MQTT' {this is fixed}                   );
  MqttProtocolLevelComboBox.ItemIndex      := FIni.ReadInteger('Mqtt'   , 'ProtocolLevel'    , 4 {3.1.1}                                );
  ServerHostEdit.Text                      := FIni.ReadString ('Server' , 'Host'             , 'www.wks.cloud'                          );
  ServerPortEdit.Text                      := FIni.ReadString ('Server' , 'Port'             , '1883'                                   );
  ConnectClientIdentifierEdit.Text         := FIni.ReadString ('Connect', 'ClientIdentifier' , 'client001'                              );
  ConnectQosComboBox.ItemIndex             := FIni.ReadInteger('Connect', 'Qos'              , 0                                        );
  ConnectWillTopicEdit.Text                := FIni.ReadString ('Connect', 'WillTopic'        , 'wks/mqtt/clients/$ClientIdentifier$/wlt');
  ConnectWillMessageEdit.Text              := FIni.ReadString ('Connect', 'WillMessage'      , 'I have done here folks!'                );
  ConnectWillActiveCheckBox.Checked        := FIni.ReadBool   ('Connect', 'WillActive'       , true                                     );
  ConnectUsernameEdit.Text                 := FIni.ReadString ('Connect', 'Username'         , 'username'                               );
  ConnectPasswordEdit.Text                 := FIni.ReadString ('Connect', 'Password'         , 'password'                               );
  ConnectCredentialsActiveCheckBox.Checked := FIni.ReadBool   ('Connect', 'CredentialsActive', true                                     );
  ConnectKeepAliveSecondsEdit.Text         := FIni.ReadString ('Connect', 'KeepAliveSeconds' , '60'                                     );
  ConnectCleanSessionCheckBox.Checked      := FIni.ReadBool   ('Connect', 'CleanSession'     , true                                     );
  PingreqCountComboBox.ItemIndex           := FIni.ReadInteger('Pingreq', 'Count'            , 0                                        );
  PingreqPauseMsComboBox.ItemIndex         := FIni.ReadInteger('Pingreq', 'PauseMs'          , 2                                        );
  PublishTopicEdit.Text                    := FIni.ReadString ('Publish', 'Topic'            , 'wks/mqtt/test/helloworld'               );
  PublishMessageEdit.Text                  := FIni.ReadString ('Publish', 'Message '         , 'hello MQTT!'                            );
  PublishQosComboBox.ItemIndex             := FIni.ReadInteger('Publish', 'Qos'              , 0                                        );
  PublishCountComboBox.ItemIndex           := FIni.ReadInteger('Publish', 'Count'            , 0                                        );
  PublishPauseMsComboBox.ItemIndex         := FIni.ReadInteger('Publish', 'PauseMs'          , 2                                        );

  // client
  FMqttClient := TMQTTClientClass.Create(LogRichEdit, RequestHexRichEdit, ResponseHexRichEdit);
  Log('client created');
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  // ini
  FIni.WriteString ('Mqtt'   , 'ProtocolName'     , MqttProtocolNameEdit.Text               );
  FIni.WriteInteger('Mqtt'   , 'ProtocolLevel'    , MqttProtocolLevelComboBox.ItemIndex     );
  FIni.WriteString ('Server' , 'Host'             , ServerHostEdit.Text                     );
  FIni.WriteString ('Server' , 'Port'             , ServerPortEdit.Text                     );
  FIni.WriteString ('Connect', 'ClientIdentifier' , ConnectClientIdentifierEdit.Text        );
  FIni.WriteInteger('Connect', 'Qos'              , ConnectQosComboBox.ItemIndex            );
  FIni.WriteString ('Connect', 'WillTopic'        , ConnectWillTopicEdit.Text               );
  FIni.WriteString ('Connect', 'WillMessage'      , ConnectWillMessageEdit.Text             );
  FIni.WriteBool   ('Connect', 'WillActive'       , ConnectWillActiveCheckBox.Checked       );
  FIni.WriteString ('Connect', 'Username'         , ConnectUsernameEdit.Text                );
  FIni.WriteString ('Connect', 'Password'         , ConnectPasswordEdit.Text                );
  FIni.WriteBool   ('Connect', 'CredentialsActive', ConnectCredentialsActiveCheckBox.Checked);
  FIni.WriteString ('Connect', 'KeepAliveSeconds ', ConnectKeepAliveSecondsEdit.Text        );
  FIni.WriteBool   ('Connect', 'CleanSession'     , ConnectCleanSessionCheckBox.Checked     );
  FIni.WriteInteger('Pingreq', 'Count'            , PingreqCountComboBox.ItemIndex          );
  FIni.WriteInteger('Pingreq', 'PauseMs'          , PingreqPauseMsComboBox.ItemIndex        );
  FIni.WriteString ('Publish', 'Topic'            , PublishTopicEdit.Text                   );
  FIni.WriteString ('Publish', 'Message'          , PublishMessageEdit.Text                 );
  FIni.WriteInteger('Publish', 'Qos'              , PublishQosComboBox.ItemIndex            );
  FIni.WriteInteger('Publish', 'Count'            , PublishCountComboBox.ItemIndex          );
  FIni.WriteInteger('Publish', 'PauseMs'          , PublishPauseMsComboBox.ItemIndex        );

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

  FMqttClient.ConnectPacketSend(MqttProtocolLevelComboBox.ItemIndex, ConnectQosComboBox.ItemIndex, ConnectClientIdentifierEdit.Text, ConnectWillTopicEdit.Text, ConnectWillMessageEdit.Text, ConnectUsernameEdit.Text, ConnectPasswordEdit.Text, ConnectCleanSessionCheckBox.Checked, StrToIntDef(ConnectKeepAliveSecondsEdit.Text, 60));
end;

procedure TMainForm.DisconnectPacketSendButtonClick(Sender: TObject);
begin
  inherited;

  FMqttClient.DisconnectPacketSend;
end;
{$ENDREGION}

{$REGION 'PingReqPacketSend'}
procedure TMainForm.PingRequestPacketSendButtonClick(Sender: TObject);
var
  i, count, pause: integer;
begin
  inherited;

  count := StrToIntDef(PingreqCountComboBox.Text  , 1);
  pause := StrToIntDef(PingreqPauseMsComboBox.Text, 0);

  if count > 10 then
    if not (MessageDlg(Format('Send %d PINGREQ to the broker?', [count]), mtCustom, [mbYes, mbNo], 0) = mrYes) then
      Exit;

  for i := 1 to count do begin
    FMqttClient.PingReqPacketSend;
    Sleep(pause);
  end;
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
    FMqttClient.PublishPacketSend(10000+i, PublishTopicEdit.Text, msg, TMQTTQosType(PublishQosComboBox.ItemIndex), PublishDupFlagCheckBox.Checked, PublishRetainCheckBox.Checked);
    Sleep(pause);
  end;
end;
{$ENDREGION}

end.
