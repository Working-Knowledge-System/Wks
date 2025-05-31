unit WksAgentUnit;

interface

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , System.Variants
  , System.Diagnostics
  , Data.DB
  , Datasnap.DBClient
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Type'}
type

  {$REGION 'TAgentRec'}
  TAgentRec = record
    Id           : integer;
    Agent        : string ;
    State        : string ;
    ContentKind  : string ;
    Content      : string ;
    Data         : string ;
    RunAtYear    : string ;
    RunAtQuarter : string ;
    RunAtMonth   : string ;
    RunAtWeek    : string ;
    RunAtWeekMode: string ;
    RunAtDay     : string ;
    RunAtHour    : string ;
    RunAtMinute  : string ;
    RunAtSecond  : string ;
    OnSuccess    : string ;
    OnFail       : string ;
    OnEmpty      : string ;
  public
    function  FromObjectDs(IvObjectDs: TClientDataSet): boolean;
    function  FromAgentActiveDs(IvAgentActiveDs: TClientDataSet): boolean;
  end;
  {$ENDREGION}

  {$REGION 'TAgentThread'}
  PAgentThreadInfoRec = ^TAgentThreadInfoRec;
  TAgentThreadInfoRec = record
    Started  : TDateTime; //
    Ended    : TDateTime; //
    Success  : boolean;   //
    Affected : integer;   // processed items (if the case)
    ElapsedMs: integer;   // thread lifetime in ms
    Report   : TSbuRec  ; // thread activities
    Output   : TSbuRec  ; // script output
    Msg      : string   ; // 1line log message (ok, error, ...)
  end;

  TAgentThread = class(TThread)
  private
    FAgentRec : TAgentRec;           // agent
    FInfoRec  : TAgentThreadInfoRec; // thread info
    FWatch    : TStopWatch;          // internal watch
  public
    constructor Create(IvAgentRec: TAgentRec; IvCreateSuspended: boolean = true);
    destructor Destroy; override;
    procedure Execute; override;
    property AgentRec : TAgentRec           read FAgentRec                  ;
    property InfoRec  : TAgentThreadInfoRec read FInfoRec                   ;
  end;
  {$ENDREGION}

  {$REGION 'TAgentJslThread'}
  TAgentJslThread = class(TAgentThread)
  public
    constructor Create(IvAgentRec: TAgentRec; IvCreateSuspended: boolean = true);
    destructor Destroy; override;
    procedure Execute; override;
  end;
  {$ENDREGION}

  {$REGION 'TAgentPythonThread'}
  TAgentPythonThread = class(TAgentThread)
  public
    constructor Create(IvAgentRec: TAgentRec; IvCreateSuspended: boolean = true);
    destructor Destroy; override;
    procedure Execute; override;
  end;
  {$ENDREGION}

  {$REGION 'TAgentSqlThread'}
  TAgentSqlThread = class(TAgentThread)
  public
    constructor Create(IvAgentRec: TAgentRec; IvCreateSuspended: boolean = true);
    destructor Destroy; override;
    procedure Execute; override;
  end;
  {$ENDREGION}

{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    WksJslUnit
  , WksPythonUnit
  , WksSqlUnit
  ;
{$ENDREGION}

{$REGION 'TAgentRec'}
function TAgentRec.FromObjectDs(IvObjectDs: TClientDataSet): boolean;
begin
  // exit
  Result := not IvObjectDs.IsEmpty;
  if not Result then
    Exit;

  // object
  Id           := IvObjectDs.FieldByName('FldId'           ).AsInteger;
  Agent        := IvObjectDs.FieldByName('FldObject'       ).AsString ;
  State        := IvObjectDs.FieldByName('FldState'        ).AsString ;
  ContentKind  := IvObjectDs.FieldByName('FldContentKind'  ).AsString ;
  Content      := IvObjectDs.FieldByName('FldContent'      ).AsString ;
  Data         := IvObjectDs.FieldByName('FldData'         ).AsString ;
end;

function TAgentRec.FromAgentActiveDs(IvAgentActiveDs: TClientDataSet): boolean;
begin
  // exit
  Result := not IvAgentActiveDs.IsEmpty;
  if not Result then
    Exit;

  // object
  Id           := IvAgentActiveDs.FieldByName('FldId'           ).AsInteger;
  Agent        := IvAgentActiveDs.FieldByName('FldObject'       ).AsString ;
  State        := IvAgentActiveDs.FieldByName('FldState'        ).AsString ;
  ContentKind  := IvAgentActiveDs.FieldByName('FldContentKind'  ).AsString ;
  Content      := IvAgentActiveDs.FieldByName('FldContent'      ).AsString ;
  Data         := IvAgentActiveDs.FieldByName('FldData'         ).AsString ;
  // agent
  RunAtYear    := IvAgentActiveDs.FieldByName('FldRunAtYear'    ).AsString ;
  RunAtQuarter := IvAgentActiveDs.FieldByName('FldRunAtQuarter' ).AsString ;
  RunAtMonth   := IvAgentActiveDs.FieldByName('FldRunAtMonth'   ).AsString ;
  RunAtWeek    := IvAgentActiveDs.FieldByName('FldRunAtWeek'    ).AsString ;
  RunAtWeekMode:= IvAgentActiveDs.FieldByName('FldRunAtWeekMode').AsString ;
  RunAtDay     := IvAgentActiveDs.FieldByName('FldRunAtDay'     ).AsString ;
  RunAtHour    := IvAgentActiveDs.FieldByName('FldRunAtHour'    ).AsString ;
  RunAtMinute  := IvAgentActiveDs.FieldByName('FldRunAtMinute'  ).AsString ;
  RunAtSecond  := IvAgentActiveDs.FieldByName('FldRunAtSecond'  ).AsString ;
  // on
  OnSuccess    := IvAgentActiveDs.FieldByName('FldOnSuccess'    ).AsString ;
  OnFail       := IvAgentActiveDs.FieldByName('FldOnFail'       ).AsString ;
  OnEmpty      := IvAgentActiveDs.FieldByName('FldOnEmpty'      ).AsString ;
end;
{$ENDREGION}

{$REGION 'TAgentThread'}
constructor TAgentThread.Create(IvAgentRec: TAgentRec; IvCreateSuspended: boolean);
begin
  inherited Create(IvCreateSuspended);

  // init                  // true  if you do not need to free stuff in the thread at the end
  FreeOnTerminate := true; // false if you use a termination method to clean-up stuff at the end, like .OnTerminate := TerminateThreadMethod;

  // setup
  FAgentRec        := IvAgentRec;
  FWatch           := TStopwatch.StartNew;
  FInfoRec.Started := Now;

  // output(dbg)
//FInfoRec.Report.Add('thread(%d) for "%s" begin', [ThreadId, FAgentRec.Agent], true, 0);

  // report(dbg)
//FInfoRec.Output.Add('output of "%s" begin'     , [FAgentRec.Agent]          , true, 0);
end;

destructor TAgentThread.Destroy;
begin
  //  *** TOO LATE ***

  // setdown
//FWatch.Stop;
//FElapsedMs := FWatch.ElapsedMilliseconds;

  inherited;
end;

procedure TAgentThread.Execute;
begin
//inherited;

  // output(dbg)
//FInfoRec.Output.Add('output of "%s" end'       , [FAgentRec.Agent]          );

  // report(dbg)
//FInfoRec.Report.Add('thread(%d) terminating'   , [ThreadId]                 );
//FInfoRec.Report.Add('thread(%d) for "%s" end'  , [ThreadId, FAgentRec.Agent]);

  // info
  FWatch.Stop;
  FInfoRec.ElapsedMs := FWatch.ElapsedMilliseconds;
  FInfoRec.Ended := Now;
end;
{$ENDREGION}

{$REGION 'TAgentJslThread'}
constructor TAgentJslThread.Create(IvAgentRec: TAgentRec; IvCreateSuspended: boolean);
begin
  inherited Create(IvAgentRec, IvCreateSuspended);
end;

destructor TAgentJslThread.Destroy;
begin

  inherited;
end;

procedure TAgentJslThread.Execute;
var
  cod, oup, msg: string; // code, output
  aff: integer;     // affected
begin
  // nop
  if Terminated then
    Exit;

  // code (compile?)
  cod := FAgentRec.Content;

  // do
  FInfoRec.Success := TJslRec.JslCodeRun(cod, oup, msg, aff);
  FInfoRec.Output.Text := oup;
  FInfoRec.Affected := aff;
  FInfoRec.Msg := msg;


  // finally
  inherited;

  // now we go to OnTerminate routine
end;
{$ENDREGION}

{$REGION 'TAgentPythonThread'}
constructor TAgentPythonThread.Create(IvAgentRec: TAgentRec; IvCreateSuspended: boolean);
begin
  inherited Create(IvAgentRec, IvCreateSuspended);
end;

destructor TAgentPythonThread.Destroy;
begin

  inherited;
end;

procedure TAgentPythonThread.Execute;
var
  cod, oup, msg: string; // code, output
  aff: integer;     // affected
begin
  // nop
  if Terminated then
    Exit;

  // code (compile?)
  cod := FAgentRec.Content;

  // do
  FInfoRec.Success := TPythonRec.PythonCodeRun(cod, oup, msg, aff);
  FInfoRec.Output.Text := oup;
  FInfoRec.Affected := aff;
  FInfoRec.Msg := msg;

  // finally
  inherited;

  // now we go to OnTerminate routine
end;
{$ENDREGION}

{$REGION 'TAgentSqlThread'}
constructor TAgentSqlThread.Create(IvAgentRec: TAgentRec; IvCreateSuspended: boolean);
begin
  inherited Create(IvAgentRec, IvCreateSuspended);
end;

destructor TAgentSqlThread.Destroy;
begin

  inherited;
end;

procedure TAgentSqlThread.Execute;
var
  cod, oup, msg, cst: string; // code, output, msg1line, connstr
  aff: integer;     // affected
begin
  // nop
  if Terminated then
    Exit;

  // code (compile?)
  cod := FAgentRec.Content;

  // connectionstring;
  cst := DBA_CONNECTION_STR;

  // do
  FInfoRec.Success := TSqlRec.SqlCodeRun(cod, cst, oup, msg, aff);
  FInfoRec.Output.Text := oup;
  FInfoRec.Affected := aff;
  FInfoRec.Msg := msg;

  // finally
  inherited;

  // now we go to OnTerminate routine
end;
{$ENDREGION}

end.
