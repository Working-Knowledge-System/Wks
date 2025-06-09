unit WksMqttServerMainFormUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.StdCtrls
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.ComCtrls
  , Vcl.ExtCtrls
  , Vcl.Imaging.pngimage
  , JvExExtCtrls
  , JvNetscapeSplitter
  , WksMqttBaseMainFormtUnit
  , WksMqttServerUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TMainForm = class(TBaseForm)
    ServerPortLabel: TLabel;
    ServerPortEdit: TEdit;
    ServerStopButton: TButton;
    ServerStartButton: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ServerStartButtonClick(Sender: TObject);
    procedure ServerStopButtonClick(Sender: TObject);
    procedure XxxExitButtonClick(Sender: TObject);
  private
    { Private declarations }
    FMQTTServer: TMQTTServerClass;
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
  Caption := 'WKS MQTT Server';
  ServerStopButton.Enabled := false;

  // ini
  ServerPortEdit.Text := FIni.ReadString('Host', 'Port', '1883');

  // server
  FMQTTServer := TMQTTServerClass.Create(LogRichEdit, RequestHexRichEdit, ResponseHexRichEdit);
//  FMQTTServer.OnClientConnect    := ;
//  FMQTTServer.OnClientDisconnect := ;
//  FMQTTServer.OnClientMessage    := ;
  Log('server created');
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  // ini
  FIni.WriteString('Host', 'Port', ServerPortEdit.Text);

  // server
  if FMQTTServer.IsRunning then
    ServerStopButton.Click;
  FMQTTServer.Free;

  inherited;
end;

procedure TMainForm.XxxExitButtonClick(Sender: TObject);
begin
  // mqttclients disconnect
//if FMQTTServer.HasConnections then
  //...

  // mqttclients disjoin
//if FMQTTServer.IsJoined then
  //FMQTTServer.AllDisjoin

  // server stop
  if FMQTTServer.IsRunning then
    ServerStopButton.Click;

  inherited;
end;
{$ENDREGION}

{$REGION 'Server'}
procedure TMainForm.ServerStartButtonClick(Sender: TObject);
var
  prt: integer;
begin
  inherited;

  // tcpserver and broker start
  try
    prt := StrToIntDef(ServerPortEdit.Text, 1883);
    FMQTTServer.Start(prt);
    ServerStartButton.Enabled := false;
    ServerStopButton.Enabled := true;
  except
    on e: Exception do
      ShowMessage(e.Message);
  end;
end;

procedure TMainForm.ServerStopButtonClick(Sender: TObject);
begin
  inherited;

  // broker and tcpserver stop
  FMQTTServer.Stop;
  ServerStartButton.Enabled := true;
  ServerStopButton.Enabled := false;
end;
{$ENDREGION}

{$REGION 'Zzz'}
{
1. Basic Message Handling

procedure TForm1.ServerOnMessage(const ATopic: string; const APayload: TBytes; AQoS: TMQTTQOSType; ARetain: Boolean);
begin
  Memo1.Lines.Add(Format('Message: Topic=%s, QoS=%d, Payload=%s', [ATopic, Ord(AQoS), TEncoding.UTF8.GetString(APayload)]));
end;

2. Advanced Message Interception

procedure TForm1.ServerOnMessagePublish(Args: TMessagePublishEvent);
begin
  // Log all published messages
  LogMessage(Args.SenderClientIdentifier, Args.Topic, Args.Payload);

  // Reject messages from unauthorized clients
  if not IsClientAuthorized(Args.SenderClientIdentifier, Args.Topic) then begin
    Args.Accept := False;
    Args.Handled := True;
  end;

  // Modify payload for specific topics
  if Args.Topic = 'sensor/data' then begin
    Args.Payload := SanitizeSensorData(Args.Payload);
  end;
end;

3. Authentication Handling

procedure TForm1.ServerOnAuthenticate(Args: TAuthenticationEvent);
begin
  // Custom authentication logic
  Args.Accept := (Args.Username = 'admin') and (Args.Password = 'securepassword');

  if not Args.Accept then
    LogAuthAttempt(Args.Username, 'Failed authentication');
end;
}
{$ENDREGION}

end.
