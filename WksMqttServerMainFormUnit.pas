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
    PortLabel: TLabel;
    PortEdit: TEdit;
    StopButton: TButton;
    StartButton: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
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
  StopButton.Enabled := false;

  // ini
  PortEdit.Text := FIni.ReadString('Host', 'Port', '1883');

  // server
  FMQTTServer := TMQTTServerClass.Create(LogLineLabel, LogRichEdit, RequestHexRichEdit, ResponseHexRichEdit);
  Log('server created');
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  // ini
  FIni.WriteString('Host', 'Port', PortEdit.Text);

  // server
  if FMQTTServer.IsRunning then
    StopButton.Click;
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
    StopButton.Click;

  inherited;
end;
{$ENDREGION}

{$REGION 'Server'}
procedure TMainForm.StartButtonClick(Sender: TObject);
var
  prt: integer;
begin
  inherited;

  try
    prt := StrToIntDef(PortEdit.Text, 1883);
    FMQTTServer.Start(prt);
    StartButton.Enabled := false;
    StopButton.Enabled := true;
  except
    on e: Exception do
      ShowMessage(e.Message);
  end;
end;

procedure TMainForm.StopButtonClick(Sender: TObject);
begin
  inherited;

  FMQTTServer.Stop;
  StartButton.Enabled := true;
  StopButton.Enabled := false;
end;
{$ENDREGION}

end.
