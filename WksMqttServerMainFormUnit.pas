unit WksMqttServerMainFormUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , Winapi.ActiveX
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
  , Vcl.Grids
  , Vcl.DBCtrls
  , Vcl.DBGrids
  , Vcl.Buttons
  , Data.DB
  , Data.Win.ADODB
  , Data.SqlTimSt
  , JvExExtCtrls
  , JvNetscapeSplitter
  , SynEdit
  , SynEditHighlighter
  , SynHighlighterGeneral
  , IdContext
  , WksMqttBaseMainFormtUnit
  , WksMqttTypesUnit
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
    TcpTabSheet: TTabSheet;
    TcpDBGrid: TDBGrid;
    TcpTopPanel: TPanel;
    TcpDBNavigator: TDBNavigator;
    TcpClearButton: TButton;
    MqttADOConnection: TADOConnection;
    TcpADOTable: TADOTable;
    TcpDataSource: TDataSource;
    TcpRefreshButton: TButton;
    TcpCountLabel: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ServerStartButtonClick(Sender: TObject);
    procedure ServerStopButtonClick(Sender: TObject);
    procedure XxxExitButtonClick(Sender: TObject);
    procedure TcpClearButtonClick(Sender: TObject);
    procedure TcpRefreshButtonClick(Sender: TObject);
  private
    { Private declarations }
    FMQTTServer: TMqttServerClass;
    FLogWorker : TMqttLogWorker;
    procedure OnClientJoin(AContext: TIdContext);
    procedure OnClientDisjoin(AContext: TIdContext);
    procedure OnClientData(Sender: TObject);
    function  TcpConnectionNewInsert(AClientIp: string; AStartDateTime: TDateTime): string;
    procedure TcpConnectionEndDateTimeUpdate(AConnectionUId: string);
    procedure TcpDeleteAll;
    procedure TcpRefresh;
    procedure TcpCountLabelRefresh;
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
  ServerPortEdit.Text := FIni.ReadString ('Host'      , 'Port' , '1883');
  RightPanel.Width    := FIni.ReadInteger('RightPanel', 'Width', 280   );

  // server
  FMQTTServer := TMqttServerClass.Create(LogSynEdit.Lines, LogVerboseCheckBox, LogRawAsciiCheckBox, LogRawHexCheckBox, LogRawCharCheckBox);
  FMQTTServer.OnClientJoin       := OnClientJoin;
  FMQTTServer.OnClientDisjoin    := OnClientDisjoin;
  FMQTTServer.OnClientData       := OnClientData;
//FMQTTServer.OnClientConnect    := ;
//FMQTTServer.OnClientDisconnect := ;
//FMQTTServer.OnClientMessage    := ;
  Log('server created');

  // database
  TcpADOTable.Open;

  // gui
  TcpCountLabelRefresh;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  // database
  MqttADOConnection.Close;

  // server
  if FMQTTServer.IsRunning then
    ServerStopButton.Click;
  FMQTTServer.Free;

  // ini
  FIni.WriteString ('Host'      , 'Port' , ServerPortEdit.Text);
  FIni.WriteInteger('RightPanel', 'Width', RightPanel.Width   );

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

  // log thread create and start (before the mqtt tcpserver and broker starts)
  FLogWorker := TMqttLogWorker.Create(MqttADOConnection);
  FLogWorker.Start;

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

  // log thread flush and stop (after the mqtt tcpserver and broker stops)
  if Assigned(FLogWorker) then
    FLogWorker.Free;
end;
{$ENDREGION}

{$REGION 'Tcp'}
procedure TMainForm.TcpCountLabelRefresh;
begin
  TcpCountLabel.Caption := Format('%d record(s)', [TcpADOTable.RecordCount]);
end;

function  TMainForm.TcpConnectionNewInsert(AClientIp: string; AStartDateTime: TDateTime): string;
var
//q: TADOQuery;
  newid: TGUID;
begin
  try
    // id
    CoCreateGuid(newid);
    Result := GUIDToString(newid); // produces format: {XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}
  //  Delete(Result, 1, 1); // remove '{'
  //  Delete(Result, Length(Result), 1); // remove '}'

    // i (no milliseconds)
  //  TcpADOTable.InsertRecord([Result, AStartDateTime, null, AClientIp]);

    // ii
    TcpADOTable.DisableControls;
    TcpADOTable.Append;
    TcpADOTable.FieldByName('FldUid').Value := Result;
    TcpADOTable.FieldByName('FldStartDateTime').Value := AStartDateTime; //FormatDateTime('yyyymmdd hh:nn:ss.zzz', AStartDateTime);  // Full precision
  //TcpADOTable.FieldByName('FldEndDateTime').Clear;
    TcpADOTable.FieldByName('FldClientIp').AsString := AClientIp;
    TcpADOTable.Post;
    TcpADOTable.EnableControls;

    // iii
  (*q := TADOQuery.Create(nil);
    q.Connection := MqttADOConnection;
    try                                                                //, FldEndDateTime , :PEndDateTime
      q.Paramcheck := true;
    //sql := TRva.Rv(IvSql);
      q.SQL.Text  := 'insert into DbaMqtt.dbo.TblTcp (FldStartDateTime, FldClientIp) values (:PStartDateTime, :PClientIp)'
      + sLineBreak + 'select scope_identity() as FldNewUId';
      q.Parameters.ParseSQL(q.SQL.Text, true);
    //q.Parameters.ParamByName('PStartDateTime').DataType := ftDateTime;
      q.Parameters.ParamByName('PStartDateTime').Value    := AStartDateTime ; //FormatDateTime('yyyymmdd hh:nn:ss.zzz', );
    //q.Parameters.ParamByName('PEndDateTime').Value      := null;
      q.Parameters.ParamByName('PClientIp').Value         := AClientIp;
      q.{ExecSQL}Open;
      Result := q.FieldByName('FldNewUId').AsString;
    finally
      q.Free;
    end;*)
  except
    on e: Exception do
      Log(e.Message);
  end;
end;

procedure TMainForm.TcpConnectionEndDateTimeUpdate(AConnectionUId: string);
begin
  TcpADOTable.DisableControls;
  if TcpADOTable.Locate('FldUId', {VarArrayOf([}AConnectionUId{])}, [{loCaseInsensitive,loPartialKey}]) then begin
    TcpADOTable.Edit;
    TcpADOTable.FieldByName('FldEndDateTime').Value := Now();
    TcpADOTable.Post;
  end else
    raise Exception.CreateFmt('tcp connection %s not found.', [AConnectionUId]);
  TcpADOTable.EnableControls;
end;

procedure TMainForm.TcpDeleteAll;
begin
  TcpADOTable.DisableControls;
  try
    TcpADOTable.First;
    while not TcpADOTable.Eof do
      TcpADOTable.Delete;
  finally
    TcpCountLabelRefresh;
    TcpADOTable.EnableControls;
  end;
end;

procedure TMainForm.TcpRefresh;
begin
  TcpADOTable.Close;
  TcpADOTable.Open;
  TcpCountLabelRefresh;
end;

procedure TMainForm.TcpRefreshButtonClick(Sender: TObject);
begin
  inherited;

  TcpRefresh;
end;

procedure TMainForm.TcpClearButtonClick(Sender: TObject);
begin
  inherited;

  TcpDeleteAll;
//TcpRefresh; *** needed only if we delete records dbserver side with some sql like DELETE TblTcp ***
end;
{$ENDREGION}

{$REGION 'Events'}
procedure TMainForm.OnClientJoin(AContext: TIdContext);
var
  clientid: TGUID;
  clientidstr: string;
  sessiondata: TTCPSessionDataClass;
begin
  Log('%s client joined   , tcp info enqueue for asynchronous insertion', [{AContext.Binding.PeerIP}AContext.Connection.Socket.Binding.PeerIP]);

  // id
  CoCreateGuid(clientid);
  clientidstr := GUIDToString(clientid); // produces format: {XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}
//Delete(clientidstr, 1, 1); // remove '{'
//Delete(clientidstr, Length(clientidstr), 1); // remove '}'

  // session
  sessiondata := TTCPSessionDataClass.Create;
  sessiondata.Ip       := {AContext.Binding.PeerIP}AContext.Connection.Socket.Binding.PeerIP;
  sessiondata.UId      := clientidstr;
  sessiondata.Event    := 'Join';
  sessiondata.DateTime := Now;

  // session stored in context (this info might be accessed in the OnExecute or OnDisconnect...)
  AContext.Data := sessiondata;

  // enqueue for asynchronous insertion
  FLogWorker.Enqueue(sessiondata);
end;

procedure TMainForm.OnClientDisjoin(AContext: TIdContext);
var
  sessiondata: TTCPSessionDataClass;
  clientidstr: string;
begin
  Log('%s client disjoined, tcp info enqueue for asynchronous insertion', [{AContext.Binding.PeerIP}AContext.Connection.Socket.Binding.PeerIP]);

  // context
  if Assigned(AContext.Data) and (AContext.Data is TTCPSessionDataClass) then begin
    // access custom info
    sessiondata := TTCPSessionDataClass(AContext.Data);

    // eventchange
    sessiondata.Event    := 'Disjoin';

    // enqueue for asynchronous insertion
    FLogWorker.Enqueue(sessiondata);

    // session memory free
  //sessiondata.Free;

    // context reset
    AContext.Data := nil;
  end;
end;

procedure TMainForm.OnClientData(Sender: TObject);
begin
  Log('insert the new bytes stream that is arrived (tbd)');
end;
{$ENDREGION}

{$REGION 'Zzz'}
{
1. Basic Message Handling

procedure TForm1.ServerOnMessage(const ATopic: string; const APayload: TBytes; AQoS: TMqttQOSType; ARetain: Boolean);
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
