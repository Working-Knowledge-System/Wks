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
  , FireDAC.Stan.Intf
  , FireDAC.Stan.Option
  , FireDAC.Stan.Error
  , FireDAC.Stan.Def
  , FireDAC.Stan.Pool
  , FireDAC.Stan.Async
  , FireDAC.Stan.Param
  , FireDAC.Stan.ExprFuncs
  , FireDAC.UI.Intf
  , FireDAC.VCLUI.Wait
  , FireDAC.Phys.Intf
  , FireDAC.DatS
  , FireDAC.DApt
  , FireDAC.DApt.Intf
  , FireDAC.Moni.Base
  , FireDAC.Comp.DataSet
  , FireDAC.Comp.Client
  , FireDAC.Phys
  , FireDAC.Phys.MSAccDef , FireDAC.Phys.MSAcc
  , FireDAC.Phys.MySQLDef , FireDAC.Phys.MySQL
//, FireDAC.Phys.MSSQLDef , FireDAC.Phys.MSSQL
//, FireDAC.Phys.OracleDef, FireDAC.Phys.Oracle
//, FireDAC.Phys.ODBCDef  , FireDAC.Phys.ODBC  , FireDAC.Phys.ODBCBase
  , FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteWrapper.Stat
  , FireDAC.Comp.BatchMove
  , FireDAC.Comp.BatchMove.SQL
  , FireDAC.Comp.BatchMove.Dataset
  , Superobject
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
    Content      : string ; // script, i.e. sql
    Data         : string ; // json, i.e. datasources
    Note         : string ; // ddl, i.e. etl create table ...
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
    function  FromObjectDs(IvObjectDs: TClientDataSet): boolean;           // load agent using the current record in the given object ds
    function  FromAgentActiveDs(IvAgentActiveDs: TClientDataSet): boolean; // load agent using the current record in the given 'active' agent ds
    function  ToJson: string;
    function  JsonCompiled: string;         // compiled with agent data
    function  JsonCompiledSO: ISuperObject; // also compiled
    function  ContentCompiled: string;      // compiled with agent and json data
  end;
  {$ENDREGION}

  {$REGION 'TAgentThread'}
  PAgentThreadInfoRec = ^TAgentThreadInfoRec; // *** this is the packet saved in the executed agents list ***
  TAgentThreadInfoRec = record // --> TAgentThreadReportRec
    Started  : TDateTime; //
    Ended    : TDateTime; // the finish is not needed
    Success  : boolean  ; //
    Affected : integer  ; // processed items (if the case)
    ElapsedMs: integer  ; // thread lifetime in ms
    Report   : TSbuRec  ; // thread activities *** rename to simple Log ***
    Output   : TSbuRec  ; // script output
    Message  : string   ; // 1line log message (ok, error, ...)
  end;

  TAgentThread = class(TThread)
  private
    FAgentRec      : TAgentRec;           // agent
    FInfoRec       : TAgentThreadInfoRec; // thread info report
    FWatch         : TStopWatch;          // internal watch
    FRunningId     : integer;             // the id in the runninglistbox
    FPauseRequested: boolean;
    FStopRequested : boolean;
    FOnUIUpdate    : TProc<integer, string>;
    FLastProgressDt: TDateTime;
    FLastProgressWrittenRows: int64;
    FLastSleepCount: int64;          // used if the thread performs in batches and need to sleep between each batch
  public
    constructor Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean = true}; IvOnUIUpdate: TProc<integer, string>);
    destructor Destroy; override;
    procedure Execute; override;
    procedure UIUpdate(IvString: string);
    procedure StopRequest;      // from UI thread
    procedure PauseRequest;     // from UI thread
    procedure ContinueRequest;  // from UI thread
    property RunningId: integer             read FRunningId write FRunningId;
    property AgentRec : TAgentRec           read FAgentRec;
    property InfoRec  : TAgentThreadInfoRec read FInfoRec ;
  end;
  {$ENDREGION}

  {$REGION 'TAgentDosThread'}
  TAgentDosThread = class(TAgentThread)
  public
    constructor Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean = true}; IvOnUIUpdate: TProc<integer, string>);
    destructor Destroy; override;
    procedure Execute; override;
  end;
  {$ENDREGION}

  {$REGION 'TAgentJslThread'}
  TAgentJslThread = class(TAgentThread)
  public
    constructor Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean = true}; IvOnUIUpdate: TProc<integer, string>);
    destructor Destroy; override;
    procedure Execute; override;
  end;
  {$ENDREGION}

  {$REGION 'TAgentPythonThread'}
  TAgentPythonThread = class(TAgentThread)
  public
    constructor Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean = true}; IvOnUIUpdate: TProc<integer, string>);
    destructor Destroy; override;
    procedure Execute; override;
  end;
  {$ENDREGION}

  {$REGION 'TAgentSqlThread'}
  TAgentSqlThread = class(TAgentThread)
  public
    constructor Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean = true}; IvOnUIUpdate: TProc<integer, string>);
    destructor Destroy; override;
    procedure Execute; override;
  end;
  {$ENDREGION}

  {$REGION 'TAgentEtlThread'}
  TAgentEtlThread = class(TAgentThread)
//private
  //FSourceFDConnStr: string;
  //FTargetFDConnStr: string;
  public
    constructor Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean = true}; IvOnUIUpdate: TProc<integer, string>);
    destructor Destroy; override;
    procedure Execute; override;
  //property SourceFDConnStr: string read FSourceFDConnStr write FSourceFDConnStr;
  //property TargetFDConnStr: string read FTargetFDConnStr write FTargetFDConnStr;
  end;

  TAgentEtlThread2 = class(TAgentThread)
  private
    FSourceConn: TFDConnection;
    FTargetConn: TFDConnection;
    FReader: TFDBatchMoveSQLReader;
    FWriter: TFDBatchMoveSQLWriter;
    FMover: TFDBatchMove;
    FBatchDelayMs: integer;
    procedure SourceConnectionsSetup(IvConnStr: string; IvRowsetSize: integer);
    procedure TargetConnectionsSetup(IvConnStr: string);
    procedure MoverSetup(IvReadSql, IvTargetTable, IvOptionCsv, IvMode: string; IvStatisticsInterval, IvCommitCount: integer);
    procedure MoverProgress(ASender: TObject; APhase: TFDBatchMovePhase);
    procedure Preprocess(IvTargetDdl, IvTargetTable: string);
  protected
    procedure Execute; override;
  public
    constructor Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean = true}; IvOnUIUpdate: TProc<integer, string>); reintroduce;
    destructor Destroy; override;
  end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Const'}
const
  AGENT_BASE_JSON_TEMPLATE
               = '{'
  + sLineBreak + '    <DataSource>'
  + sLineBreak + '--, <DataTarget>'
  + sLineBreak + '--, <Etl>'
//+ sLineBreak + '--, <TimeFrame>'
//+ sLineBreak + '--, <Save>'
//+ sLineBreak + '--, <Email>'
//+ sLineBreak + '--, <Param>'
//+ sLineBreak + '--, <Option>'
//+ sLineBreak + '--, <RunAt>'
  + sLineBreak + '}'
  ;
  AGENT_DATA_SOURCE_JSON_TEMPLATE
               = '  , "DataSource": {'
  + sLineBreak + '        "Name"                : "<Name>"                 -- MSSQL|ORACLE|MONGODB'
  + sLineBreak + '      , "ConnLib"             : "<ConnLib>"              -- ADO|FD, if not defined ADO will be used' // for ETL only FD can be used
  + sLineBreak + '      , "ConnStr"             : "<ConnStr>"              -- if not defined the default System mssql connstr will be used'
//+ sLineBreak + '    --, "ConnTimeoutSec"      : 10                       -- timeout for the connection'
//+ sLineBreak + '    --, "QueryTimeoutSec"     : 30                       -- timeout for the sql query or command'
  + sLineBreak + '    }'
  ;
  AGENT_DATA_TARGET_JSON_TEMPLATE
               = '  , "DataTarget": {'
  + sLineBreak + '        "Name"                : "<Name>"                 -- MSSQL|ORACLE|MONGODB'
  + sLineBreak + '      , "ConnLib"             : "<ConnLib>"              -- ADO|FD, if not defined ADO will be used' //, for ETL only FD can be used
  + sLineBreak + '      , "ConnStr"             : "<ConnStr>"              -- if not defined the default System mssql connstr will be used'
//+ sLineBreak + '    --, "ConnTimeoutSec"      : 10                       -- timeout for the connection'
//+ sLineBreak + '    --, "QueryTimeoutSec"     : 30                       -- timeout for the sql query or command'
//+ sLineBreak + '    --, "MongodbDatabase"     : "<Dba>"                  -- only for mongodb destination database in the format DbaAaa'
//+ sLineBreak + '    --, "MongodbCollection"   : "<Collection>"           -- only for mongodb destination collection in the format ColAaa'
//+ sLineBreak + '    --, "MongodbRecordLayout" : "{\"FldAaa\":\"%s\", \"FldBbb\":\"%s\", ...}" -- only for mongodb destination document'
  + sLineBreak + '    }'
  ;
  AGENT_ETL_JSON_TEMPLATE
               = '  , "Etl": {'
  + sLineBreak + '        "Type"                : "TableToTable"           -- use: TableToTable|NA TextToTable|NA TableToText, if not defined TableToTable will be used'
  + sLineBreak + '      , "TargetTable"         : "<Table>"                -- destination table in the format DbaAaa.dbo.TblBbb'
  + sLineBreak + '      , "BatchDelayMs"        : 10                       -- ms to wait before each batch start'
  + sLineBreak + '      , "RowsetSize"          : 1000                     -- records extracted from the source table in a single operation'
  + sLineBreak + '      , "BulkInsertSize"      : 1000                     -- records inserted in bulk into the target table in a single operation'
  + sLineBreak + '      , "StatisticsCountRows" : 1000                     -- trigger onprogress event every n records'
  + sLineBreak + '      , "CommitCountRows"     : 1000                     -- starttransaction/commit every n records'
  + sLineBreak + '      , "OptionCsv"           : "poClearDestNoUndo"'
//+ sLineBreak + '                              -- poIdentityInsert"       -- if specified the primarykey matching is enabled'
//+ sLineBreak + '                              -- poClearDest                deletes the content of the destination table before data movement performing a transactional DELETE (slow, log will explode)'
//+ sLineBreak + '                              -- poClearDestNoUndo          deletes the content of the destination table before data movement performing a non-transactional TRUNCATE (fast, no logging)'
//+ sLineBreak + '                              -- poCreateDest               creates the destination table if it does not exist before data movement, DDL is required in Note tab'
//+ sLineBreak + '                              -- poSkipUnmatchedDestFields  if specified then unmatched rows will be excluded from movement'
//+ sLineBreak + '                              -- poUseTransactions          if specified then each batch will be surrounded by starttransaction/commit, a batch happens every CommitCount rows'
//+ sLineBreak + '      , "Mode"                : "dmAlwaysInsert"'
//+ sLineBreak + '                              -- dmAlwaysInsert             insert records from source to destination, matching using primarykey in destination table is no performed, default mode'
//+ sLineBreak + '                              -- dmAppend                   insert records from source to destination when no matching is found, require primarykey in destination'
//+ sLineBreak + '                              -- dmAppendUpdate             insert records from source to destination when no matching is found, update updates records when matching is found, require primarykey in destination'
//+ sLineBreak + '                              -- dmDelete                   delete records in destination when matching is found, require primarykey in destination'
//+ sLineBreak + '      , "DateTimeFormat"      : "yyyy-mm-dd hh:nn:ss"    -- delphi format to obtain --> 2020-01-01 00:00:00'
//+ sLineBreak + '    --, "KeyBegin"            : "1"                      -- range: beginning PK if an integer'
//+ sLineBreak + '    --, "KeyEnd"              : "1000000000"             -- range: ending PK if an integer'
//+ sLineBreak + '    --, "SliceSize"           :  1000000                 -- subraange: number of rows if the PK is an integer (used to calculate $SliceBegin$ and $SliceEnd$)'
//+ sLineBreak + '    --, "KeyBegin"            : "2020-01-01 00:00:00"    -- range: beginning PK if datetime'
//+ sLineBreak + '    --, "KeyEnd"              : "2025-02-01 00:00:00"    -- range: ending PK if datetime'
//+ sLineBreak + '    --, "SliceSize"           : 2592000                  -- subrange: number of seconds (30*24*60*60) if PK is a datetime (used to calculate $SliceBegin$ and $SliceEnd$)'
  + sLineBreak + '    }'
  ;
//AGENT_TIMEFRAME_JSON_TEMPLATE
//             = '  , "": {'
//+ sLineBreak + '    }'
//;
//AGENT_SAVE_JSON_TEMPLATE
//             = '  , "Save": {'
//+ sLineBreak + '        "Active"              : false'
//+ sLineBreak + '      , "ToOutputTab"         : false'
//+ sLineBreak + '      , "ToFile"              : false'
//+ sLineBreak + '      , "Path"                : "C:\\Temp"'
//+ sLineBreak + '      , "File"                : "Test.csv"'
//+ sLineBreak + '      , "Type"                : "Csv" -- Txt, Json, Html'
//+ sLineBreak + '    }'
//;
//AGENT_EMAIL_JSON_TEMPLATE
//             = '  , "Email": {'
//+ sLineBreak + '        "Active"              : false'
//+ sLineBreak + '      , "Priority"            : ""          -- |Info|Success|Warning|Danger|Error'
//+ sLineBreak + '      , "From"                : "<From>"    -- if empty will use organization email'
//+ sLineBreak + '      , "To"                  : "<To>"'
//+ sLineBreak + '      , "Copy"                : "<Copy>"'
//+ sLineBreak + '      , "Bc"                  : ""'
//+ sLineBreak + '      , "Subject"             : "<Subject>"'
//+ sLineBreak + '      , "Title"               : "<Title>"'
//+ sLineBreak + '      , "Content"             : "<Content>" -- here variables like $Dataset(0)$ can be used'
//+ sLineBreak + '      , "OrganizationLogoShow": true'
//+ sLineBreak + '      , "SystemLogoShow"      : true'
//+ sLineBreak + '      , "SaveToDba"           : false'
//+ sLineBreak + '    }'
//;
//AGENT_PARAMS_JSON_TEMPLATE
//             = '  , "Params": {'
//+ sLineBreak + '        "Param0"              : null'
//+ sLineBreak + '      , "Param1"              : false'
//+ sLineBreak + '      , "Param2"              : 123'
//+ sLineBreak + '      , "Param3"              : "abc"'
//+ sLineBreak + '    }'
//;
//AGENT_OPTION_JSON_TEMPLATE
//             = '  , "Option": {'
//+ sLineBreak + '        "LogOn"               : true'
//+ sLineBreak + '      , "ReportOn"            : true'
//+ sLineBreak + '      , "OutputOn"            : true'
//+ sLineBreak + '      , "Verbose"             : false'
//+ sLineBreak + '      , "LogFile"             : "[RvPathCurrent()]\WksAgent[RvAgentId()].txt"'
//+ sLineBreak + '      , "ComInitialize"       : false'
//+ sLineBreak + '      , "GridOn"              : false' // challenge! we need to update a grid in the main thred from a worker thred
//+ sLineBreak + '    }'
//;
//AGENT_RUNAT_JSON_TEMPLATE
//             = '  , "RunAt": {'
//+ sLineBreak + '        "Year"                : "*|2000,2001|[RvDtYearNow()]"'
//+ sLineBreak + '      , "Quarter"             : "*|1,2,3,4"'
//+ sLineBreak + '      , "Month"               : "*|Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec|1,2,3,4,5,6,7,8,9,10,11,12"'
//+ sLineBreak + '      , "Week"                : "*|1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53"'
//+ sLineBreak + '      , "WeekMode"            : "*|Iso" -- Iso|Working'
//+ sLineBreak + '      , "Day"                 : "*|Mon,Tue,Wed,Thu,Fri,Sat,Sun|1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31"'
//+ sLineBreak + '      , "Hour"                : "*|0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23"'
//+ sLineBreak + '      , "Minute"              : "*|0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59"'
//+ sLineBreak + '      , "Second"              : "*|0,10,20,30,40,50"'
//+ sLineBreak + '    }'
//;
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    Winapi.ActiveX // coinitialize
  , WksJslUnit
  , WksPythonUnit
  , WksSqlUnit
//, WksEtlUnit
  ;
{$ENDREGION}

{$REGION 'TAgentRec'}
function  TAgentRec.FromObjectDs(IvObjectDs: TClientDataSet): boolean; // used for a manual start so runat and on data are not needed
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
  Note         := IvObjectDs.FieldByName('FldNote'         ).AsString ;
  // agent data not needed
  // on data not needed
end;

function  TAgentRec.FromAgentActiveDs(IvAgentActiveDs: TClientDataSet): boolean; // used for a automatic start so runat and on data are necessary
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
  Note         := IvAgentActiveDs.FieldByName('FldNote'         ).AsString ;
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

function  TAgentRec.ToJson: string;
var
  x: TSuperRttiContext;
begin
  x := TSuperRttiContext.Create;
  try
    Result := x.AsJson<TAgentRec>(Self).AsJson;
  finally
    FreeAndNil(x);
  end;
end;

function  TAgentRec.JsonCompiled: string;
begin
  Result := TJsoRec.Compiled(Data, ToJson);
end;

function  TAgentRec.JsonCompiledSO: ISuperObject;
begin
  Result := SO(JsonCompiled);
end;

function  TAgentRec.ContentCompiled: string;
begin
  // rv
  Result := TJsoRec.Compiled(Content, JsonCompiled); // replace agent.Json.attr, nel content
  Result := grva.Rva(Result, true, true, false);     // replace general
end;
{$ENDREGION}

{$REGION 'TAgentThread'}
constructor TAgentThread.Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean}; IvOnUIUpdate: TProc<integer, string>);
begin
  inherited Create({IvCreateSuspended}true); // if false the thread start immediately without .Resume

  // init                   // true  if you do not need to free stuff in the thread at the end
  FreeOnTerminate := false; // false if you use a termination method to clean-up stuff at the end, like .OnTerminate := TerminateThreadMethod;

  // setup
  FAgentRec        := IvAgentRec;
  FWatch           := TStopwatch.StartNew;
  FInfoRec.Started := Now;
  FInfoRec.Report.Clr;
  FInfoRec.Output.Clr;
  FPauseRequested  := false;
  FStopRequested   := false;
  FOnUIUpdate      := IvOnUIUpdate;

  // com
//CoInitializeEx(nil, COINIT_MULTITHREADED);

  // output(dbg)
//FInfoRec.Report.Add('thread(%d) for "%s" begin', [ThreadId, FAgentRec.Agent], true, 0);

  // report(dbg)
//FInfoRec.Output.Add('output of "%s" begin'     , [FAgentRec.Agent]          , true, 0);
end;

destructor TAgentThread.Destroy;
begin
  //  *** TOO LATE ***
  // already done in .OnTerminate := TerminateThreadMethod method

  // com
//CoUninitialize;

  // setdown
//FWatch.Stop;
//FElapsedMs := FWatch.ElapsedMilliseconds;

  inherited;
end;

procedure TAgentThread.Execute;
begin
  // output(dbg)
//FInfoRec.Output.Add('output of "%s" end'       , [FAgentRec.Agent]          );

  // report(dbg)
//FInfoRec.Report.Add('thread(%d) terminating'   , [ThreadId]                 );
//FInfoRec.Report.Add('thread(%d) for "%s" end'  , [ThreadId, FAgentRec.Agent]);

  // info
  FWatch.Stop;
  FInfoRec.ElapsedMs := FWatch.ElapsedMilliseconds;
  FInfoRec.Ended := Now;

  // uiupdate
  UIUpdate('Done');
  sleep(1000);

  // ancestor
//inherited;
end;

procedure TAgentThread.PauseRequest;
begin
  FPauseRequested := true;
  UIUpdate('paused');
end;

procedure TAgentThread.ContinueRequest;
begin
  FPauseRequested := false;
  UIUpdate('continue');
end;

procedure TAgentThread.StopRequest;
begin
  FStopRequested := true;
  UIUpdate('stopped');
end;

procedure TAgentThread.UIUpdate(IvString: string);
begin
  if Assigned(FOnUIUpdate) then
    TThread.Queue(nil,
      procedure
      begin
        FOnUiUpdate(RunningId, IvString);
      end
    );
end;
{$ENDREGION}

{$REGION 'TAgentDosThread'}
constructor TAgentDosThread.Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean}; IvOnUIUpdate: TProc<integer, string>);
begin
  inherited Create(IvAgentRec{, IvCreateSuspended}, IvOnUIUpdate);
end;

destructor TAgentDosThread.Destroy;
begin

  inherited;
end;

procedure TAgentDosThread.Execute;
var
  jso: ISuperObject;
  oup, msg, wdi, lin, fbk: string; // output, msg1line, workingdir, line
  aff: integer;                    // affected
  con: TStrings;                   // content
  i: integer;
begin
  // nop
  if Terminated then begin
    FInfoRec.Report.Add('terminated', true, 0);
    UIUpdate('terminated');
    Exit;
  end;

  // naming
  NameThreadForDebugging(FAgentRec.Agent);
  FInfoRec.Report.Add('running', true, 0);
  UIUpdate('running');

  // data
  jso := FAgentRec.JsonCompiledSO;

  // workingdir
  if not Assigned(jso.O['WorkingDir']) then begin
    wdi := {TEMP_PATH} TBynRec.BinaryDir;
    FInfoRec.Report.Add('WorkingDir not defined, using: %s', [wdi]);
  end else
    wdi := jso.S['WorkingDir'];

  // force
  if not DirectoryExists(wdi) then begin
    ForceDirectories(wdi);
    FInfoRec.Report.Add('WorkingDir %s not exist, created', [wdi]);
  end;

  // exec
  con := TStringList.Create;
  try
    // content
    con.Text := FAgentRec.Content;

    // has errors, warnings, hints
    if not TDosRec.IsValid(con.Text, fbk) then begin
      FInfoRec.Report.Add('FAILED, msg: ' + fbk);

    // is ok
    end else begin

      {$REGION 'JOB'}
      // line by line
      for i := 0 to con.Count-1 do begin
        FWatch := TStopwatch.StartNew;

        // commandline
        lin := con[i].Trim;
        if lin.IsEmpty then
          Continue;

        // exec
        try
          TDosRec.Exec(lin, oup, wdi);
          FInfoRec.Report.Add('%d) cmd: %s (executed in %d ms)', [i+1, lin, FWatch.ElapsedMilliseconds]);
          FInfoRec.Output.Add(oup);
        except
          on e: Exception do begin
            FInfoRec.Report.Add(e.Message);
            FInfoRec.Message := e.Message;
          end;
        end;
      end;
      {$ENDREGION}

    end;
  finally
    con.Free;
  end;

  // ancestor
  inherited;

  // now the thread ends and we go to OnTerminate routine
end;
{$ENDREGION}

{$REGION 'TAgentJslThread'}
constructor TAgentJslThread.Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean}; IvOnUIUpdate: TProc<integer, string>);
begin
  inherited Create(IvAgentRec{, IvCreateSuspended}, IvOnUIUpdate);
end;

destructor TAgentJslThread.Destroy;
begin

  inherited;
end;

procedure TAgentJslThread.Execute;
var
  jso: ISuperObject;
  msg, fbk: string;        // output
  aff: integer;            // affected
  con, oup, rep: TStrings; // content, output, report
  eng: TJslEngineCls;
begin
  // nop
  if Terminated then begin
    FInfoRec.Report.Add('terminated', true, 0);
    UIUpdate('terminated');
    Exit;
  end;

  // naming
  NameThreadForDebugging(FAgentRec.Agent);
  FInfoRec.Report.Add('running', true, 0);
  UIUpdate('running');

  // data
  jso := FAgentRec.JsonCompiledSO;

  // exec
  con := TStringList.Create;
  rep := TStringList.Create;
  oup := TStringList.Create;
  eng := TJslEngineCls.Create(FAgentRec.Id.ToString, oup, rep);
  try
    // content
    con.Text := FAgentRec.Content;

    // do
    FInfoRec.Success := eng.RunCode(con.Text, {wdi}'');
    FInfoRec.Output.Text := oup.Text;
    FInfoRec.Report.Text := rep.Text;
    FInfoRec.Affected := aff;
    FInfoRec.Message := msg;
  finally
    eng.Free;
    rep.Free;
    oup.Free;
    con.Free;
  end;

  // ancestor
  inherited;

  // now the thread ends and we go to OnTerminate routine
end;
{$ENDREGION}

{$REGION 'TAgentPythonThread'}
constructor TAgentPythonThread.Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean}; IvOnUIUpdate: TProc<integer, string>);
begin
  inherited Create(IvAgentRec{, IvCreateSuspended}, IvOnUIUpdate);
end;

destructor TAgentPythonThread.Destroy;
begin

  inherited;
end;

procedure TAgentPythonThread.Execute;
var
  jso: ISuperObject;
  cod, oup, msg: string; // code, output
  aff: integer;          // affected
begin
  // nop
  if Terminated then begin
    FInfoRec.Report.Add('terminated', true, 0);
    UIUpdate('terminated');
    Exit;
  end;

  // naming
  NameThreadForDebugging(FAgentRec.Agent);
  FInfoRec.Report.Add('running', true, 0);
  UIUpdate('running');

  // data
  jso := FAgentRec.JsonCompiledSO;

  // code (compile?)
  cod := FAgentRec.Content;

  // do
  FInfoRec.Success := TPythonRec.PythonCodeRun(cod, oup, msg, aff);
  FInfoRec.Output.Text := oup;
  FInfoRec.Affected := aff;
  FInfoRec.Message := msg;

  // ancestor
  inherited;

  // now the thread ends and we go to OnTerminate routine
end;
{$ENDREGION}

{$REGION 'TAgentSqlThread'}
constructor TAgentSqlThread.Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean}; IvOnUIUpdate: TProc<integer, string>);
begin
  inherited Create(IvAgentRec{, IvCreateSuspended}, IvOnUIUpdate);
end;

destructor TAgentSqlThread.Destroy;
begin

  inherited;
end;

procedure TAgentSqlThread.Execute;
var
  jso: ISuperObject;
  cod, msg, cst, clb, fbk: string; // code, output, msg1line, connstr, connlib
  aff, tos: integer;               // affected, timeoutsec
  con, oup, rep: TStrings;         // content, output, report
  taa, tzz: TDateTime;             // timeframebegin, end
  tfm, tas, tzs: string;           // timeframeformat, beginformatted, endformatted
  eng: TSqlEngineCls;
begin
  // nop
  if Terminated then begin
    FInfoRec.Report.Add('terminated', true, 0);
    UIUpdate('terminated');
    Exit;
  end;

  // naming
  NameThreadForDebugging(FAgentRec.Agent);
  FInfoRec.Report.Add('running', true, 0);
  UIUpdate('running');

  // data
  jso := FAgentRec.JsonCompiledSO;

  // datasource
  if not Assigned(jso.O['DataSource']) then begin
    FInfoRec.Report.Add('Json DataSource block is not present');
    Exit;
  end;

  // connstr
  if Assigned(jso.O['DataSource.ConnStr']) then begin
    cst := jso.S['DataSource.ConnStr'];
    FInfoRec.Report.Add('use connection string: %s', [cst]);
  end else begin
    cst := DBA_CONNECTION_STR;
    FInfoRec.Report.Add('DataSource.ConnStr not defined, use default connection string: %s', [cst]);
  end;

  // connlib
  if Assigned(jso.O['DataSource.ConnLib']) then begin
    clb := jso.S['DataSource.ConnLib'];
    FInfoRec.Report.Add('use connection library: %s', [clb]);
  end else begin
    clb := 'ADO';
    FInfoRec.Report.Add('DataSource.ConnLib not defined, use default connection library: %s', [clb]);
  end;

  // cmdtimeout
  if Assigned(jso.O['DataSource.TimeoutSec']) then begin
    tos := jso.I['DataSource.TimeoutSec'];
    FInfoRec.Report.Add('use timeout string: %d s', [tos]);
  end else begin
    tos := DBA_COMMAND_TIMEOUT_SEC;
    FInfoRec.Report.Add('DataSource.TimeoutSec not defined, use default timeout: %d s', [tos]);
  end;

  // timeframe
  if Assigned(jso.O['TimeFrame']) then begin // maybe use directly the "Params: {}" block to define any other puseful parameters
    FInfoRec.Report.Add('TimeFrame defined');

    // format
    if giis.Nx(jso.S['TimeFrame.Format']) then begin
      FInfoRec.Report.Add('TimeFrame.Format is not present');
      Exit;
    end;
    tfm := jso.S['TimeFrame.Format'];

    // begin
    if not TryStrToDateTime(jso.S['TimeFrame.Begin'], taa) then begin
      FInfoRec.Report.Add('TimeFrame.Begin is not a valid datetime');
      Exit;
    end;
    tas := FormatDateTime(tfm, taa);

    // end
    if not TryStrToDateTime(jso.S['TimeFrame.End'], tzz) then begin
      FInfoRec.Report.Add('TimeFrame.End is not a valid datetime');
      Exit;
    end;
    tzs := FormatDateTime(tfm, tzz);

    // localcompile
    con.Text := TStrRec.StrReplace(con.Text, '$Begin$', tas);
    con.Text := TStrRec.StrReplace(con.Text, '$End$'  , tzs);
  end;

  // exec
  con := TStringList.Create;
  rep := TStringList.Create;
  oup := TStringList.Create;
  eng := TSqlEngineCls.Create(FAgentRec.Id.ToString, oup, rep);
  try
    // content
    con.Text := FAgentRec.ContentCompiled;

    // exec
    FInfoRec.Success := eng.CodeRun(con.Text, cst, clb, msg, aff, tos{, false, false, jso});
    FInfoRec.Output.Text := oup.Text;
    FInfoRec.Report.Text := rep.Text;
    FInfoRec.Affected := aff;
    FInfoRec.Message := msg;

    {$REGION 'savecodetofile'}
    {
    if jso.B['Save.Active'] then
      SaveDo(jo, con.Text, '');
    }
    {$ENDREGION}

    {$REGION 'email'}
    {
    if jso.B['Email.Active'] then begin
      // replace
      if Assigned(jso.O['Email.Content']) then
        if jso.S['Email.Content'].Contains('$Dataset(0)$') then begin
          dst.ToHtml(que, s0);
          jso.S['Email.Content'] := StringReplace(jso.S['Email.Content'], '$Dataset(0)$', s0, [rfReplaceAll]);
        end;
      // send
      if not EmailDo(jo, fbk) then
        MessageAdd(fbk);
    end;
    }
    {$ENDREGION}

  finally
    eng.Free;
    rep.Free;
    oup.Free;
    con.Free;
  end;

  // ancestor
  inherited;

  // now the thread ends and we go to OnTerminate routine
end;
{$ENDREGION}

{$REGION 'TAgentEtlThread *** merge to TAgentEtlThread2 ***'}
constructor TAgentEtlThread.Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean}; IvOnUIUpdate: TProc<integer, string>);
begin
  inherited Create(IvAgentRec{, IvCreateSuspended}, IvOnUIUpdate);
end;

destructor TAgentEtlThread.Destroy;
begin

  inherited;
end;

procedure TAgentEtlThread.Execute;

  {$REGION 'var'}
var
//fbk: string;
//swa: TStopwatch;
  jso: ISuperObject;
  tot, sli, aff: uint64;            // totalrowsinrange, slices, affected

  // source
  sna, scs, scl, sqy: string;       // name, connstr, connlib, query
  srz, sct, sqt: integer;           // rowsetsize, conntimeout, querytimeout
  sco: TFDConnection;               // conn

  // target
  tna, tcs, tcl, tdl: string;       // name, connstr, connlib, table, ddl
 {trz,}tct, tqt: integer;           // rowsetsize(not needed), conntimeout, querytimeout
  tco: TFDConnection;               // conn

  // etl
  eib: boolean;                     // isbatched
  ety, ett, edf, ekb, eke: string;  // type, targettable, datetimeformat, pkbegin int/datetime, pkend int/datetime
  esz, ebd, ecc, esc, eiz: integer; // slicesize(rows/seconds), batchdelayms, commitcountrows, statisticintervalcountrows, bulkinsertsize
  edb, ede: TDateTime;              // pkdatetime begin, end
  eop, emo: string;                 // options, mode
  ebb, ebe: string;                 // batch begin, end
  {$ENDREGION}

  {$REGION 'routine'}
procedure FdEtlTextToTable(IvCode: string; IvdelayMs: integer; var IvAffected: uint64);
begin
  IvAffected := 0;
  raise Exception.Create('TextToTable not implemented');
end;

procedure FdEtlTableToText(IvCode: string; IvdelayMs: integer; var IvAffected: uint64);
begin
  IvAffected := 0;
  raise Exception.Create('TableToText not implemented');
end;

procedure FdEtlTableToTable(IvCode: string; IvDelayMs: integer; var IvAffected: uint64);
var

  {$REGION 'var'}
  i: integer;
  swa: TStopwatch;
  bsr: TFDBatchMoveSQLReader;  // reader
  bsw: TFDBatchMoveSQLWriter;  // writer
  bmv: TFDBatchMove;           // mover
  mde, opt, sql, tmp: string;  // mode, optioncsv
  bno, bto, bdu, bin: integer; // batchnumber batchtotal, durationms, batchinserts
  bbe, ben: string;            // batchbegin, batchend
  tcd, tcc: boolean;           // target custom DROP, CREATE
  {$ENDREGION}

begin
  // zip
  sql := IvCode; // should arrive with $SliceBegin$ and $SliceEnd$ already replaced

  {$REGION 'objs'}
  bsr := TFDBatchMoveSQLReader.Create(nil);
  bsw := TFDBatchMoveSQLWriter.Create(nil);
  bmv := TFDBatchMove.Create(nil);
  {$ENDREGION}

  try

    {$REGION 'sourcereader'}
    bsr.Connection := sco;
    bsr.ReadSQL    := sql;
  //sco.Connected  := true; // should be already done
    {$ENDREGION}

    {$REGION 'targetwriter'}
    bsw.Connection := tco;
    bsw.TableName  := ett;
  //tco.Connected  := true; // should be already done
    {$ENDREGION}

    {$REGION 'batchmover'}
    // options
    if eop.Contains('poClearDestNoUndo'        ) then
      bmv.Options := bmv.Options + [poClearDestNoUndo]              // deletes the content of the destination table before data movement, performing a non-transactional fast operation like SQL TRUNCATE command (DO NOT USE IF BATCHED/SLICED)
    else if eop.Contains('poClearDest'         ) then
      bmv.Options := bmv.Options + [poClearDest];                   // deletes the content of the destination table before data movement, performing a transactional operation like SQL DELETE command (DO NOT USE IF BATCHED/SLICED, DO TO USE AT ALL: delete must be done in batches!!!)

    if eop.Contains('poIdentityInsert'         ) then
      bmv.Options := bmv.Options + [poIdentityInsert]               // when destination table has an identity columns, enabled for inserts/updates'
    {else
      bmv.Options := bmv.Options - [poIdentityInsert]};

    if eop.Contains('poCreateDest'             ) then
      bmv.Options := bmv.Options + [poCreateDest];                  // creates the destination table before data movement, if it does not exist, FireDAC will use the data reader provided for field definitions

    {$IF CompilerVersion > 31} // compiler above Delphi 10.1 Berlin
    if eop.Contains('poSkipUnmatchedDestFields') then
      bmv.Options := bmv.Options + [poSkipUnmatchedDestFields];     // ?

    if eop.Contains('poUseTransactions'        ) then
      bmv.Options := bmv.Options + [poUseTransactions];             // ?
    {$ENDIF}

    // clear-custom (FD try to drop alsi if the table does not exists!)
    if (poClearDest in bmv.Options) or (poClearDestNoUndo in bmv.Options) then begin
      // FD disable
      bmv.Options := bmv.Options - [poClearDestNoUndo];
      bmv.Options := bmv.Options - [poClearDest];

      // custom
      tco.ExecSQL(Format('if object_id(''%s'', ''U'') is not null truncate table %s;', [ett, ett]));
    //tco.ExecSQL(Format('if object_id(''%s'', ''U'') is not null drop table %s;'    , [ett, ett]));
    end;

    // create-custom (FD field data-type geussing is unreliable)
    if poCreateDest in bmv.Options then begin
      // FD disable
      bmv.Options := bmv.Options - [poCreateDest];

      // custom
      if tdl.Trim.IsEmpty then
        raise Exception.Create('Unable to create the table on the target database, DDL script (in the Note tab) is empty')
      else begin
        tmp         := 'if object_id(''' + ett + ''', ''U'') is null begin'
        + sLineBreak + tdl
        + sLineBreak + 'end;';
        tco.ExecSQL(tmp);
      end;
    end;

    // mode
    if      emo = 'dmAppend'       then bmv.Mode := dmAppend        // appends the records from the source to the destination, when the records have no matching records in the destination table. The matching is performed using primary key fields
    else if emo = 'dmUpdate'       then bmv.Mode := dmUpdate        // updates records in the destination table that matches records in the source table
    else if emo = 'dmAppendUpdate' then bmv.Mode := dmAppendUpdate  // appends the records from the source to the destination, when the records have no matching records in the destination table. It also updates records in the destination table that matches records in the source table. The matching is performed using primary key fields
    else if emo = 'dmDelete'       then bmv.Mode := dmDelete        // deletes records in the destination that matches records in the source table. The matching is performed using primary key fields
    else                                bmv.Mode := dmAlwaysInsert; // appends the records from the source to the destination. No content matching is performed. default mode

    // other
    bmv.Reader             := bsr;
    bmv.Writer             := bsw;

    // onprogress
    bmv.StatisticsInterval := esc; // if greater than zero will trigger the onprogress event
  //bmv.OnProgress := procedure();

    // commit
    bmv.CommitCount        := ecc; // if greater than zero will wrap in a transaction
    {$ENDREGION}

    {$REGION 'analyze&mapping'}
    // analyze
  //bmv.Analyze := [taDelimSep, taFormatSet, taHeader, taFields]; // when Analyze is not empty, then the batch move component tries to automatically recognize the data source format by calling the GuessFormat method as part of the Execute method call
    bmv.GuessFormat;                                              // this will use [taDelimSep, taHeader, taFields] as a deault

    // mapping-keyfields
  //bmv.Mappings.KeyFields := 'FldSpc;FldStageMetro;FldStepMetro'; // nop, readonly !!!

    // mapping-auto   fix error: [FireDAC][Comp][DM]-608. Undefined source field or expression for destination field
    bmv.Mappings.AddAll;
    i := 0;
    while i < bmv.Mappings.Count do begin
      if (bmv.Mappings[i].SourceFieldName = EmptyStr) then
        bmv.Mappings.Delete(i)
      else
        Inc(i);
    end;

  // mapping-explicit
  //bmv.Mappings.Add('FldSpc=FldSpc');
  //bmv.Mappings.Add('FldStageMetro=FldStageMetro');
  //bmv.Mappings.Add('FldStepMetro=FldStepMetro');
  //bmv.Mappings[i].SourceExpression := bmv.Mappings[i].SourceFieldName;
    {$ENDREGION}

    {$REGION 'do'}
    try
      // exec
      bmv.Execute;
    except
      on e: EFDDBEngineException do begin
        FInfoRec.Report.Add(e.Message);
        FInfoRec.Report.Add(e.SQL);
      end;
    end;
    {$ENDREGION}

    {$REGION 'report'}
//    swa.Stop;
//    bno := 1;
//    bto := 1;
//    bbe := 'na';
//    ben := 'na';
//    bdu := swa.ElapsedMilliseconds;
//    bin := bmv.InsertCount;
//    ReportAddBatch(ThreadID, bno, bto, bbe, ben, bdu, bin);
//
//    IvAffected := bin;
//    FInfoRec.Report.Add('');
    {$ENDREGION}

  finally

    {$REGION 'free'}
    bmv.Free;
    bsw.Free;
    bsr.Free;
    {$ENDREGION}

  end;
end;
  {$ENDREGION}

begin

  {$REGION 'init'}
  // nop
  if Terminated then begin
    FInfoRec.Report.Add('terminated', true, 0);
    UIUpdate('terminated');
    Exit;
  end;

  // naming
  NameThreadForDebugging(FAgentRec.Agent);
  FInfoRec.Report.Add('running', true, 0);
  UIUpdate('running');

  // data
  jso := FAgentRec.JsonCompiledSO;

  // query (source), content compiled with Rv and json members, but not with $SliceBegin$ and $SliceEnd$
  sqy := FAgentRec.ContentCompiled;

  // ddl (target), ddl code to create a table if doesn't exists
  tdl := FAgentRec.Note;
  {$ENDREGION}

  {$REGION 'exit'}
  // query
  if sqy.Trim.IsEmpty then begin
    FInfoRec.Report.Add('Agent Content query is empty');
    Exit;
  end;

  // datasourcesection
  if not jso.AsObject.Exists('DataSource') then begin
    FInfoRec.Report.Add('Json DataSource section is not present');
    Exit;
  end;

  // datasourcesection
  if not jso.AsObject.Exists('DataTarget') then begin
    FInfoRec.Report.Add('Json DataTarget section is not present');
    Exit;
  end;

  // etlsection
  if not jso.AsObject.Exists('Etl') then begin
    FInfoRec.Report.Add('Json Etl section is not present');
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'source'}
  // name
  sna := jso.S['DataSource.Name'];

  // connstr
  if Assigned(jso.O['DataSource.ConnStr']) then begin
    scs := jso.S['DataSource.ConnStr'];
    FInfoRec.Report.Add('use source connection string: %s', [scs]);
  end;
  if scs.Trim.IsEmpty then begin
    scs := DBA_CONNECTION_STR;
    FInfoRec.Report.Add('Json DataSource.ConnStr not defined, use default: %s', [scs]);
  end;
  scs := grva.Rva(scs);

  // connlib
  if Assigned(jso.O['DataSource.ConnLib']) then begin
    scl := jso.S['DataSource.ConnLib'];
    FInfoRec.Report.Add('use source connection library: %s', [scl]);
  end else begin
    scl := 'ADO';
    FInfoRec.Report.Add('Json DataSource.ConnLib not defined, use defaulty: %s', [scl]);
  end;

  // rowsetsize
  srz := StrToIntDef(jso.S['DataSource.RowsetSize'], 10000); // controls how many rows FireDAC requests from the server per fetch (fmOnDemand) — i.e. how the client reads results from a SELECT

  // conntimeout
  sct := StrToIntDef(jso.S['DataSource.ConnTimeoutSec'], 10);

  // querytimeout
  sqt := StrToIntDef(jso.S['DataSource.QueryTimeoutSec'], 30);
  {$ENDREGION}

  {$REGION 'target'}
  // name
  tna := jso.S['DataTarget.Name'];

  // connstr
  if Assigned(jso.O['DataTarget.ConnStr']) then begin
    tcs := jso.S['DataTarget.ConnStr'];
    FInfoRec.Report.Add('use target connection string: %s', [tcs]);
  end;
  if tcs.Trim.IsEmpty then begin
    tcs := DBA_CONNECTION_STR;
    FInfoRec.Report.Add('Json DataTarget.ConnStr not defined, use default: %s', [tcs]);
  end;
  tcs := grva.Rva(tcs);

  // connlib
  if Assigned(jso.O['DataTarget.ConnLib']) then begin
    tcl := jso.S['DataTarget.ConnLib'];
    FInfoRec.Report.Add('use target connection library: %s', [tcl]);
  end else begin
    tcl := 'ADO';
    FInfoRec.Report.Add('Json DataTarget.ConnLib not defined, use default: %s', [tcl]);
  end;

  // rowsetsize
//trz := StrToIntDef(jso.S['DataTarget.RowsetSize'], 10000); // not in scope ETL operations

  // conntimeout
  tct := StrToIntDef(jso.S['DataTarget.ConnTimeoutSec'], 10);

  // querytimeout
  tqt := StrToIntDef(jso.S['DataTarget.QueryTimeoutSec'], 30);
  {$ENDREGION}

  {$REGION 'etl'}
  // type
  if Assigned(jso.O['Etl.Type']) then begin
    ety := jso.S['Etl.Type'];
    FInfoRec.Report.Add('use etl type: %s', [ety]);
  end else begin
    ety := 'TableToTable';
    FInfoRec.Report.Add('Etl.Type not defined, use default: %s', [ety]);
  end;

  // targettable
  if Assigned(jso.O['Etl.TargetTable']) then begin
    ett := jso.S['Etl.TargetTable'];
    FInfoRec.Report.Add('use target table: %s', [ett]);
  end;
  if ett.Trim.IsEmpty then begin
    FInfoRec.Report.Add('Json Etl.TargetTable not defined');
    Exit;
  end;

  // datetimeformat
  if Assigned(jso.O['Etl.DateTimeFormat']) then begin
    edf := jso.S['Etl.DateTimeFormat'];
    FInfoRec.Report.Add('use datetime format: %s', [edf]);
  end;
  if edf.Trim.IsEmpty then begin
    edf := 'yyyy-mm-dd hh:nn:ss';
    FInfoRec.Report.Add('Json Etl.DateTimeFormat not defined, use default: %s', [edf]);
  end;

  // PK begin integer/datetime
  if Assigned(jso.O['Etl.KeyBegin']) then begin
    ekb := jso.S['Etl.KeyBegin'];
    FInfoRec.Report.Add('use KeyBegin: %s', [ekb]);
  end;
  if ekb.Trim.IsEmpty then begin
    FInfoRec.Report.Add('Json Etl.KeyBegin not defined');
  //Exit;
  end;
  //if TryStrToDateTime(ekb, edb) then
    //edb := FormatDateTime(edf, ekb);
    //FInfoRec.Report.Add('use KeyBegin is a datetime');

  // PK end integer/datetime
  if Assigned(jso.O['Etl.KeyEnd']) then begin
    eke := jso.S['Etl.KeyEnd'];
    FInfoRec.Report.Add('use KeyEnd: %s', [eke]);
  end;
  if eke.Trim.IsEmpty then begin
    FInfoRec.Report.Add('Json Etl.KeyEnd not defined');
  //Exit;
  end;
  //if not TryStrToDateTime(eke, ede) then begin
    //ede := FormatDateTime(edf, eke);
    //FInfoRec.Report.Add('use KeyEnd is a datetime');

  // slicesize (rows/seconds of each slice/range from begin to end if positive else from end to begin if negative)
  //
  //  1strecord          Slice[i]Begin    slice    Slice[i]End             lastrecord    now
  //   Begin                         |  subrange   |                              |       |     End
  // ----|-------------*-------------*-------------*-------------*-------------*-------------*---|----> Key range
  //           [0]           [1]     |-----[i]---->                    [n]
  //
  if Assigned(jso.O['Etl.SliceSize']) then begin
    esz := jso.I['Etl.SliceSize'];
    FInfoRec.Report.Add('use SliceSize (rows/seconds): %d', [esz]);
  end;
  if esz = 0 then begin
    FInfoRec.Report.Add('Json Etl.SliceSize not defined or zero, please use a negative/positive number of rows/seconds (if negative the execution of batches start from the bigger PK going backwards)');
  //Exit;
  end;

  // batchdelayms (ms to wait before each batch start)
  ebd := StrToIntDef(jso.S['Etl.BatchDelayMs'], 0);

  // bulkinsertsize
  eiz := jso.I['Etl.BulkInsertSize']; // once the buffer reaches BulkInsertSize than calls the DB driver’s optimized array insert or bulk insert
//if eiz < 10000 then eiz := 10000;   // buffers that many source rows into memory using a Array DML

  // batchcommit every n inserts
  ecc := StrToIntDef(jso.S['Etl.CommitCountRows'], 10000); // better if same as bulkinsertsize?  after each batch commit releases resources

  // batchstatistics every n inserts
  esc := StrToIntDef(jso.S['Etl.StatisticsCountRows'], 10000); // triggers OnProgress every 10000 rows

  // options
  eop := jso.S['Etl.OptionCsv'];
  if eop.Trim.IsEmpty then
    eop := giif.Str(FAgentRec.Note.Trim.IsEmpty, '', 'poIdentityInsert');

  // mode
  emo := jso.S['Etl.Mode'];
  if emo.Trim.IsEmpty then
  //emo := 'dmAlwaysInsert'; // also fd default but no PK fields matching is performed
    emo := 'dmAppendUpdate'; // this require a PK fields on the target table
  {$ENDREGION}

  {$REGION 'analysis'}
  // sliced?
  eib := Assigned(jso.O['Etl.KeyBegin'])
     and Assigned(jso.O['Etl.KeyEnd'])
     and Assigned(jso.O['Etl.SliceSize'])
     and sqy.Contains('$SliceBegin$')
     and sqy.Contains('$SliceEnd$');

  // multinuns (sliced)
  if not eib then
    FInfoRec.Report.Add('Agent etl will be executed in a single run')

  // singlerun
  else begin
    FInfoRec.Report.Add('Agent etl will be executed in multiple batched runs');
    // total
    tot := eke.ToInteger - (ekb.ToInteger - 1);               // 1.000.000.000 - (1 - 1) = 1.000.000.000

    // slices(runs)
    sli := tot div esz;                                       // 1.000.000.000 / 1.000.000 = 1.000

    // migrationplan
    FInfoRec.Report.Add('range       : %s - %s', [ekb, eke]); // 1 .. 1.000.000.000
    FInfoRec.Report.Add('rows        : %d'     , [tot]);      // 1.000.000.000
    FInfoRec.Report.Add('slicesize   : %d'     , [esz]);      // 1.000.000
    FInfoRec.Report.Add('slices(runs): %d'     , [sli]);      // 1.000

    // bigint
    ebb := '1';
    ebe := '1000';

    // datetime
    ebb := '1/1/2000';
    ebe := '1/1/2001';

    sqy := sqy.Replace('$SliceBegin$', ebb, [rfReplaceAll]);
    sqy := sqy.Replace('$SliceEnd$'  , ebe, [rfReplaceAll]);
 end;
  {$ENDREGION}

  {$REGION 'source obj'}
  sco := TFDConnection.Create(nil);
  sco.ConnectionString            := scs;
  sco.FetchOptions.CursorKind     := ckForwardOnly;
  sco.FetchOptions.Unidirectional := true;
  sco.FetchOptions.Mode           := fmOnDemand; // will request RowsetSize rows per fetch (RowsetSize), when it is needed
  sco.FetchOptions.RowsetSize     := srz;
  sco.Connected                   := true;
  FInfoRec.Report.Add('SOURCE: %s connected (request %d rows per fetch)', [sna, srz]);
  {$ENDREGION}

  {$REGION 'target obj'}
  tco := TFDConnection.Create(nil);
  tco.ConnectionString            := tcs;
  tco.FetchOptions.CursorKind     := ckForwardOnly;
  tco.FetchOptions.Unidirectional := true;
//tco.FetchOptions.Mode           := fmOnDemand; // will request RowsetSize rows every fetch, when it is needed
//tco.FetchOptions.RowsetSize     := trz;
//tco.ResourceOptions..SilentMode  := true; // ?
  tco.Connected                   := true;
  FInfoRec.Report.Add('TARGET: %s connected (target table %s, bulkinsertsize: %d)', [tna, ett, eiz]);
  {$ENDREGION}

  {$REGION 'try'}
  // initialize COM for this thread CoInitialize initializes the COM library on the current thread
  CoInitializeEx(nil, COINIT_MULTITHREADED);

  try
    // sql is invalid
    if not TSqlRec.IsValid(sqy) then begin
      FInfoRec.Report.Add('query is invalid');

    // sql is ok
    end else begin

      {$REGION 'EXECUTE'}
      try

        {$REGION 'JOB'}
        aff := 0;
             if ety = 'TableToTable' then FdEtlTableToTable(sqy, ebd, aff)
        else if ety = 'TableToText'  then FdEtlTableToText (sqy, ebd, aff)
        else if ety = 'TextToTable'  then FdEtlTextToTable (sqy, ebd, aff)
        else                              FInfoRec.Report.Add('Unable to execute agent %s, unknown etl type, use: TableToTable, TextToTable ot TableToText', [FAgentRec.Agent]);
        {$ENDREGION}

        {$REGION 'Output'}
        {$ENDREGION}

        {$REGION 'Save'}
      //if jso.B['Save.Active'] then
        //SaveDo(jo, {ds}nil, NOT_AVAILABLE_STR); // se ogni job riportasse un ds allora si
        {$ENDREGION}

        {$REGION 'Email'}
      //if jso.B['Email.Active'] then
        //if not EmailDo(jo, fbk) then
          //FInfoRec.Report.Add(fbk);
        {$ENDREGION}

      except

        {$REGION 'Done'}
        on e: Exception do
          FInfoRec.Report.Add(e.Message);
        {$ENDREGION}

      end;
      {$ENDREGION}

    end;

  finally

    {$REGION 'Free'}
    tco.Free;
    sco.Free;
    CoUninitialize;
    {$ENDREGION}

  end;
  {$ENDREGION}

  // ancestor
  inherited;

  // now the thread ends and we go to OnTerminate routine
end;

  {$REGION 'Zzz'}
(*
procedure TAgentFDETLThread.Execute;

  {$REGION 'Var'}
var
//w: TStopwatch;
  s, n, k: string; // spare, name
  ok: boolean;
  j1, j2: string; // jsonrecordlayout, compiled
  s1, s2: string; // sourcecs, targetcs
  c1, c2: TFDConnection; // sourceconn, targetconn
  aq, bq: string ; // agentcontentsql, batchsriptcompiled
  fb, fe, bb, be: TDateTime; // framebegin, frameend, batchbegin, batchend
  bi, bt, bz, ba, ix: integer; // batchi batchtotal, batchsize, batchaffectedrecords, insertmax
  bbo, beo: string; // batchbeginora, batchendora
  bw: single; // batchdurationsec
  iz, az: integer; // insertcount, affectedcount
  {$ENDREGION}

  {$REGION 'MongoJob'}
procedure MongoJob;

  {$REGION 'Var'}
var
  i: integer;
  fq: TFDQuery;
  mc: TMongoConnection;
  me: TMongoEnv;
  ml: TMongoCollection;
  md: TMongoDocument;
  {$ENDREGION}

begin

  {$REGION 'Watch'}
  w.Reset;
  w.Start;
  {$ENDREGION}

  {$REGION 'BoundsStr}
  bbo := FormatDateTime(jo.S['TimeFrame.Format'], bb);
  beo := FormatDateTime(jo.S['TimeFrame.Format'], be);
  {$ENDREGION}

  {$REGION 'Sql'}
  bq := str.Replace(aq, '$SlicehBegin$', bbo);
  bq := str.Replace(bq, '$SliceEnd$'  , beo);
  if jo.B['Log.Verbose'] then
    ReportStr(bq);
  {$ENDREGION}

  {$REGION 'ObjectsMongoConn+Env'}
  // aqueryforsource
  fq := TFDQuery.Create(nil);
  // theconntomongo
  mc := TMongoConnection(c2.CliObj); // c2.ResourceOptions.
//mc.WriteConcern.Level.Default;
  // themenv
  me := mc.Env;
  // thecoll
  ml := mc[jo.S['DataTarget.Database']][jo.S['DataTarget.Collection']];
//ml.ReadPreference.Mode.Primary;
//ml.WriteConcern.Level.Unacknowledged;
//ml.WriteConcern.Journal := false;
//ml.WriteConcern.Majority := 0;
  // ajdoc
  md := me.NewDoc;
  {$ENDREGION}

  {$REGION 'TryMongoConn+EnvInsert'}
  try
    // querysource
    fq.Connection := c1;
    if {jo.AsObject.Exists('DataSource.TimeoutSec')} jso.PathExist('DataSource.TimeoutSec', jo) then
      fq.ResourceOptions.CmdExecTimeout := jo.I['DataSource.TimeoutSec'] * 1000
    else
      fq.ResourceOptions.CmdExecTimeout := DBA_COMMAND_TIMEOUT_SEC * 1000;
    fq.FetchOptions.Unidirectional := true; // no chache, no out of memory
    fq.FetchOptions.Mode := fmAll;
    fq.SQL.Add(bq);
    fq.Open;
    az := fq.RecordCount;
    ba := ba + az;

    // loop
    if not fq.IsEmpty then begin

      // reclayout
      j1 := jo.S['DataTarget.RecordLayout'];

      // reportpre
      ReportBatch(ThreadID, bi, bt, bbo, beo, az, bw);

      iz := 0;
      ml.BeginBulk(false);
      while not fq.Eof do begin
        try
          // plainrecord
          if j1 = '' then
            j2 := DsRecordToJson(fq)

          // recordwithlayout
          else begin
            j2 := j1;
            for i := 0 to fq.FieldCount-1 do begin
              s := dst.FieldValueToJsonValue(fq.Fields[i]); //s := LeftStr(s, Length(s));
              j2 := StringReplace(j2, '%s', s, [rfIgnoreCase]);
            end;
          end;

          // thedoc
          md.AsJSON := j2;

          // insert
          ml.Insert(md);
          Inc(iz);

          // post
          if (iz mod ix) = 0 then begin
            ml.EndBulk;
            ml.BeginBulk(false);
          end;

        except
          on e: Exception do begin
            ReportE(e);
//            ReportDone(false, 0, e.Message + ' (bulk insert cancelled)', '');
//            ml.CancelBulk;
          end;
        end;

        // next
        fq.Next;
      end;
      if ml.IsBulk then
        ml.EndBulk;
    end;

  finally
    md.Free;
  //ml.Free;
    fq.Free;
  //me.Free;
  //mc.Free;
  end;
  {$ENDREGION}

  {$REGION 'Kpi'}
  w.Stop;
  {$ENDREGION}

  {$REGION 'ReportPost'}
//ReportBatch(ThreadID, bi, bt, bbo, beo, az, bw);
  {$ENDREGION}

  {$REGION 'Sleep'}
  Sleep(jo.I['TimeFrame.BatchRestMs']);
  {$ENDREGION}

end;
  {$ENDREGION}

begin

    {$REGION 'Go'}
    try
      // init
    //w := TStopwatch.Create;

      // batchmax
      ix := jo.I['DataTarget.BulkSize'];
      if ix < 1000 then
        ix := 1000;

      if s2.Contains('DriverID=Mssql') then begin

        {$REGION 'MsSqlJob'}
        ReportStr('MsSql job with single batch begin');
        bi := 1;
        bt := 1;
        bz := 0;
        bb := Now;
        be := bb;
        MsSqlJob;
        ReportStr('MsSql job with single batch end');
        {$ENDREGION}

      end else if s2.Contains('DriverID=Mongo') then begin

        {$REGION 'MongoJob'}
        if (fb = fe) or (bz = 0) then begin

          {$REGION 'singlebatch'}
          bb := Now;
          be := bb;
          ReportAdd('Mongo ETL single batch begin');
          MongoJob;
          ReportAdd('Mongo ETL single batch end');
          ReportDone(true, ba, Format('%d loops', [bi-1], TFormatSettings.Create));
          {$ENDREGION}

        end else begin

          {$REGION 'jobwithmultiplebatches'}
          bi := 1;
          bt := dat.MinBetween(fb, fe) div Abs(bz) + 1;
          ReportAdd('Mongo ETL with multiple time-sliced batches begin');
          if bz > 0 then begin // bz = 0 is considered at beginning

            {$REGION '+'}
            //                        fb      bb--2-->be                      fe
            // +1stbounds       ------|-------.-------.-------.-------.-------|---->
            //                        bb--1-->be                      bb--N-->be
            bb := fb;
            be := dat.MinuteInc(bb, bz);

            // +loop
            while bb < fe do begin

              MongoJob;

              {$REGION 'Next'}
              Inc(bi);
              bb := be;
              be := dat.MinuteInc(bb, bz);
              if be > fe then // adjust last batch
                be := fe;
              {$ENDREGION}

            end;
            {$ENDREGION}

          end else begin

            {$REGION '-'}
            //                        fb                      bb--2-->be      fe
            // -1stbounds       ------|-------.-------.-------.-------.-------|---->
            //                        bb--N-->be                      bb--1-->be
            be := fe;
            bb := dat.MinuteInc(be, bz);

            // +loop
            while be > fb do begin

              MongoJob;

              {$REGION 'Next'}
              Inc(bi);
              be := bb;
              bb := dat.MinuteInc(be, bz);
              if bb < fb then
                bb := fb;
              {$ENDREGION}

            end;
            {$ENDREGION}

          end;
          ReportAdd('Mongo ETL with multiple time-sliced batches end');
          {$ENDREGION}

        end;
        {$ENDREGION}

      end else begin

        ReportAddFmt('Unable to perform etl %s, DataTarget.ConnStr have to contain "DriverID=Mssql" or "DriverID=Mongo"', [Name]);

      end;
    finally
      c1.Free;
      c2.Free;
    end;
    {$ENDREGION}

    ReportDone(true, ba, Format('%d loops', [bi-1], TFormatSettings.Create), '');
end;
*)
  {$ENDREGION}

{$ENDREGION}

{$REGION 'TAgentEtlThread2'}
constructor TAgentEtlThread2.Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean}; IvOnUIUpdate: TProc<integer, string>);
begin
  inherited Create(IvAgentRec{, IvCreateSuspended}, IvOnUIUpdate);
end;

destructor TAgentEtlThread2.Destroy;
begin
  FSourceConn.Free;
  FTargetConn.Free;
  FReader.Free;
  FWriter.Free;
  FMover.Free;

  inherited;
end;

procedure TAgentEtlThread2.SourceConnectionsSetup(IvConnStr: string; IvRowsetSize: integer);
begin
  FSourceConn := TFDConnection.Create(nil);
//FSourceConn.Params.Clear;
  FSourceConn.LoginPrompt                 := false;
  FSourceConn.ConnectionString            := IvConnStr;
//FSourceConn.FetchOptions.CursorKind     := ckForwardOnly;
//FSourceConn.FetchOptions.Unidirectional := true;
//FSourceConn.FetchOptions.Mode           := fmOnDemand; // will request RowsetSize rows per fetch (RowsetSize), when it is needed

  // options per-thread tuning
  FSourceConn.FetchOptions.RowsetSize     := IvRowsetSize;

//FDPhysOracleDriverLink1.VendorHome := 'C:\$\Oracle\instantclient64_23_9';
//FDPhysOracleDriverLink1.VendorLib  := 'C:\$\Oracle\instantclient64_23_9\oci.dll';
//FDPhysOracleDriverLink1.OCICompatibility := '19';  // or '21' – not mandatory

  FSourceConn.Connected                   := true; // will load the OCI from VendorLib
end;

procedure TAgentEtlThread2.TargetConnectionsSetup(IvConnStr: string);
begin
  FTargetConn := TFDConnection.Create(nil);
//FSourceConn.Params.Clear;
  FTargetConn.LoginPrompt                 := false;
  FTargetConn.ConnectionString            := IvConnStr;
//FTargetConn.FetchOptions.CursorKind     := ckForwardOnly;
//FTargetConn.FetchOptions.Unidirectional := true;
//FTargetConn.FetchOptions.Mode           := fmOnDemand; // will request RowsetSize rows every fetch, when it is needed

  // options per-thread tuning
//FTargetConn.FetchOptions.RowsetSize     := trz;
//FTargetConn.ResourceOptions.SilentMode  := true;    // useful for bulk etl
//FTargetConn.Params.Values['PacketSize'] := '32767'; // to avoid truncation
//FTargetConn.ResourceOptions.DirectExecute := True;
//FTargetConn.UpdateOptions.CountUpdatedRecords := False;

  FTargetConn.Connected                   := true;
end;

procedure TAgentEtlThread2.MoverSetup(IvReadSql, IvTargetTable, IvOptionCsv, IvMode: string; IvStatisticsInterval, IvCommitCount: integer);
var
  opv: TArray<string>;
begin
  // reader
  FReader := TFDBatchMoveSQLReader.Create(nil);
  FReader.Connection := FSourceConn;
  FReader.ReadSQL := IvReadSql;

  // writer (generates inserts)
  FWriter := TFDBatchMoveSQLWriter.Create(nil);
  FWriter.Connection := FTargetConn;
  FWriter.TableName  := IvTargetTable;

  // mover
  FMover := TFDBatchMove.Create(nil);
  FMover.Reader := FReader;
  FMover.Writer := FWriter;
  FMover.StatisticsInterval := IvStatisticsInterval; // if greater than zero will trigger the onprogress event
  FMover.CommitCount        := IvCommitCount;        // if greater than zero commit every N rows wrap in a transaction
  FMover.OnProgress         := MoverProgress;        // metrics and sleep

  // options
  opv := TVecRec.VecFromStr(IvOptionCsv);

  FMover.Options := [];

  if TVecRec.VecHas('poCreateDest', opv) then
    FMover.Options := FMover.Options + [poCreateDest];              // creates the destination table before data movement, if it does not exist, FireDAC will use the data reader provided for field definitions

  if TVecRec.VecHas('poClearDest', opv) then                        // *** DO NOT USE IF BATCHED/SLICED OR FOR BIG TABLES delete must be done in batches!!! *** (we will not implement batched/sliced!)
    FMover.Options := FMover.Options + [poClearDest];               // deletes the content of the destination table before data movement, performing a transactional operation like SQL DELETE

  if TVecRec.VecHas('poClearDestNoUndo', opv) then                  // *** DO NOT USE IF BATCHED/SLICED ***
    FMover.Options := FMover.Options + [poClearDestNoUndo];         // deletes the content of the destination table before data movement, performing a non-transactional fast operation like SQL TRUNCATE

  if TVecRec.VecHas('poIdentityInsert', opv) then
    FMover.Options := FMover.Options + [poIdentityInsert];          // when destination table has an identity columns, enabled for inserts/updates

  if TVecRec.VecHas('poSkipUnmatchedDestFields', opv) then
    FMover.Options := FMover.Options + [poSkipUnmatchedDestFields]; // ?

  if TVecRec.VecHas('poUseTransactions', opv) then
    FMover.Options := FMover.Options + [poUseTransactions];         // ?

  // mode
       if IvMode.Equals('dmAppend') then
    FMover.Mode := dmAppend
  else if IvMode.Equals('dmUpdate') then
    FMover.Mode := dmUpdate
  else if IvMode.Equals('dmAppendUpdate') then
    FMover.Mode := dmAppendUpdate
  else if IvMode.Equals('dmDelete') then
    FMover.Mode := dmDelete
  else
    FMover.Mode := dmAlwaysInsert;
end;

procedure TAgentEtlThread2.MoverProgress(ASender: TObject; APhase: TFDBatchMovePhase);
var
  rez, wrz, inz, upz, dez, coz: int64; // rowspertransaction
begin
  // exit
  if APhase <> psProgress then
    Exit;

  // counters
  rez := FMover.ReadCount;
  wrz := FMover.WriteCount;
  inz := FMover.InsertCount;
  upz := FMover.UpdateCount;
  dez := FMover.DeleteCount;
  coz := FMover.CommitCount;

  // metrics

  // remember
  FLastProgressDt   := Now();
  FLastProgressWrittenRows := wrz;

  {$REGION 'commit surrogate for sleep or stop'}
  // transactioncommitactive?

  // somerowswritten
  if wrz > 0 then begin

    // somecommittsaredone
    if coz > 0 then begin

      // sleep, pause or stop at the end of each committed batch (between commits, when WriteCount = 1000, 2000, 3000; ...) keeps connection open
      if wrz mod coz = 0 then begin

        // sleep
        if (FBatchDelayMs > 0) and (wrz > FLastSleepCount) then begin
          Sleep(FBatchDelayMs);           // pause n ms between commits
          FLastSleepCount := wrz;         // remember we already slept for this batch
        end;

        // pause
        while FPauseRequested do
          TThread.Sleep(100);

        // stop
        if FStopRequested then
          raise EAbort.CreateFmt('Thread %s stopped by user', [FAgentRec.Agent])  // exits Execute cleanly after a commit
      end;
    end;
  end;
  {$ENDREGION}

end;

procedure TAgentEtlThread2.Preprocess(IvTargetDdl, IvTargetTable: string);
var
  sql: string;
begin
  // create-custom (FD field data-type geussing is unreliable)
  if poCreateDest in FMover.Options then begin
    // disable
    FMover.Options := FMover.Options - [poCreateDest];

    // noddl
    if IvTargetDdl.Trim.IsEmpty then
      raise Exception.Create('Unable to create the table on the target database, DDL script in the Note tab is empty')

    else if FTargetConn.ExecSQL('if object_id(''' + IvTargetTable + ''', ''U'') is null select 0 else select 1') = 1 then
      raise Exception.Create('Unable to create the table on the target database, table already exist')

    else begin
      sql         := 'if object_id(''' + IvTargetTable + ''', ''U'') is null begin'
      + sLineBreak + IvTargetDdl
      + sLineBreak + 'end;';
      FTargetConn.ExecSQL(sql);
    end;
  end;

  // clear-custom
  if (poClearDest in FMover.Options) or (poClearDestNoUndo in FMover.Options) then begin
    // FD disable
    FMover.Options := FMover.Options - [poClearDestNoUndo];
    FMover.Options := FMover.Options - [poClearDest];

    // custom
    FTargetConn.ExecSQL(Format('if object_id(''%s'', ''U'') is not null truncate /*drop*/ table %s;', [IvTargetTable, IvTargetTable])); // FD try to drop also if the table does not exists!
  end;
end;

procedure TAgentEtlThread2.Execute;

  {$REGION 'var'}
var
  jso: ISuperObject;

  // source
  sna, scs, scl, sqy: string;         // name, connstr, connlib, query
  srz, sct, sqt: integer;             // rowsetsize, conntimeout, querytimeout

  // target
  tna, tcs, tcl, tdl: string;         // name, connstr, connlib, table, ddl
 {trz,}tct, tqt: integer;             // rowsetsize(not needed), conntimeout, querytimeout

  // etl
  eib: boolean;                       // isbatched
  ety, ett, edf, ekb, eke: string;    // type, targettable, datetimeformat, pkbegin int/datetime, pkend int/datetime
  esz{, ebd}, ecc, esc, eiz: integer; // slicesize(rows/seconds), batchdelayms, commitcountrows, statisticintervalcountrows, bulkinsertsize
  edb, ede: TDateTime;                // pkdatetime begin, end
  eop, emo: string;                   // options, mode
  ebb, ebe: string;                   // batch begin, end
  {$ENDREGION}

begin

  {$REGION 'exit'}
  // nop
  if Terminated then begin
    FInfoRec.Report.Add('terminated', true, 0);
    UIUpdate('terminated');
    Exit;
  end;
  if FStopRequested then begin
    FInfoRec.Report.Add('user requested stop', true, 0);
    UIUpdate('user requested stop');
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'init'}
  // naming
  NameThreadForDebugging(FAgentRec.Agent);
  FInfoRec.Report.Add('running', true, 0);
  UIUpdate('running');

  // data
  jso := FAgentRec.JsonCompiledSO;

  // query (source), content compiled with Rv and json members, but not with $SliceBegin$ and $SliceEnd$
  sqy := FAgentRec.ContentCompiled;

  // ddl (target), ddl code to create a table if doesn't exists
  tdl := FAgentRec.Note;
  {$ENDREGION}

  {$REGION 'exit'}
  // query
  if sqy.Trim.IsEmpty then begin
    FInfoRec.Report.Add('Agent Content query is empty');
    Exit;
  end;

  // datasourcesection
  if not jso.AsObject.Exists('DataSource') then begin
    FInfoRec.Report.Add('Json DataSource section is not present');
    Exit;
  end;

  // datasourcesection
  if not jso.AsObject.Exists('DataTarget') then begin
    FInfoRec.Report.Add('Json DataTarget section is not present');
    Exit;
  end;

  // etlsection
  if not jso.AsObject.Exists('Etl') then begin
    FInfoRec.Report.Add('Json Etl section is not present');
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'source'}
  // name
  sna := jso.S['DataSource.Name'];

  // connlib
  if Assigned(jso.O['DataSource.ConnLib']) then begin
    scl := jso.S['DataSource.ConnLib'];
    FInfoRec.Report.Add('use source connection library: %s', [scl]);
  end else begin
    scl := 'ADO';
    FInfoRec.Report.Add('Json DataSource.ConnLib not defined, use defaulty: %s', [scl]);
  end;

  // connstr
  if Assigned(jso.O['DataSource.ConnStr']) then begin
    scs := jso.S['DataSource.ConnStr'];
    FInfoRec.Report.Add('use source connection string: %s', [scs]);
  end;
  if scs.Trim.IsEmpty then begin
    scs := DBA_CONNECTION_STR;
    FInfoRec.Report.Add('Json DataSource.ConnStr not defined, use default: %s', [scs]);
  end;
  scs := grva.Rva(scs);

  // conntimeout
  sct := StrToIntDef(jso.S['DataSource.ConnTimeoutSec'], 10);

  // querytimeout
  sqt := StrToIntDef(jso.S['DataSource.QueryTimeoutSec'], 30);
  {$ENDREGION}

  {$REGION 'target'}
  // name
  tna := jso.S['DataTarget.Name'];

  // connlib
  if Assigned(jso.O['DataTarget.ConnLib']) then begin
    tcl := jso.S['DataTarget.ConnLib'];
    FInfoRec.Report.Add('use target connection library: %s', [tcl]);
  end else begin
    tcl := 'ADO';
    FInfoRec.Report.Add('Json DataTarget.ConnLib not defined, use default: %s', [tcl]);
  end;

  // connstr
  if Assigned(jso.O['DataTarget.ConnStr']) then begin
    tcs := jso.S['DataTarget.ConnStr'];
    FInfoRec.Report.Add('use target connection string: %s', [tcs]);
  end;
  if tcs.Trim.IsEmpty then begin
    tcs := DBA_CONNECTION_STR;
    FInfoRec.Report.Add('Json DataTarget.ConnStr not defined, use default: %s', [tcs]);
  end;
  tcs := grva.Rva(tcs);

  // conntimeout
  tct := StrToIntDef(jso.S['DataTarget.ConnTimeoutSec'], 10);

  // querytimeout
  tqt := StrToIntDef(jso.S['DataTarget.QueryTimeoutSec'], 30);
  {$ENDREGION}

  {$REGION 'etl'}
  // type
  if Assigned(jso.O['Etl.Type']) then begin
    ety := jso.S['Etl.Type'];
    FInfoRec.Report.Add('use etl type: %s', [ety]);
  end else begin
    ety := 'TableToTable';
    FInfoRec.Report.Add('Etl.Type not defined, use default: %s', [ety]);
  end;

  // targettable
  if Assigned(jso.O['Etl.TargetTable']) then begin
    ett := jso.S['Etl.TargetTable'];
    FInfoRec.Report.Add('use target table: %s', [ett]);
  end;
  if ett.Trim.IsEmpty then begin
    FInfoRec.Report.Add('Json Etl.TargetTable not defined');
    Exit;
  end;

  // batchdelayms (target, ms to wait before each batch start)
  FBatchDelayMs := StrToIntDef(jso.S['Etl.BatchDelayMs'], 0);

  // rowsetsize (source)
  srz := StrToIntDef(jso.S['DataSource.RowsetSize'], 10000); // controls how many rows FireDAC requests from the server per fetch (fmOnDemand) — i.e. how the client reads results from a SELECT

  // bulkinsertsize (target)
  eiz := jso.I['Etl.BulkInsertSize']; // once the buffer reaches BulkInsertSize than calls the DB driver’s optimized array insert or bulk insert

  // batchstatistics
  esc := StrToIntDef(jso.S['Etl.StatisticsCountRows'], 10000); // every n inserts triggers OnProgress every 10000 rows

  // commit (target)
  ecc := StrToIntDef(jso.S['Etl.CommitCountRows'], 10000); // better if same as bulkinsertsize?  after every n inserts commit releasing resources

  // options
  eop := jso.S['Etl.OptionCsv'];
  if eop.Trim.IsEmpty then
    eop := giif.Str(FAgentRec.Note.Trim.IsEmpty, '', 'poIdentityInsert');

  // mode
  emo := jso.S['Etl.Mode'];
  if emo.Trim.IsEmpty then
    emo := 'dmAlwaysInsert'; // also fd default
  {$ENDREGION}

  {$REGION 'go'}
  try
    // source
    SourceConnectionsSetup(scs, srz);
    FInfoRec.Report.Add('SOURCE: %s connected (request %d rows per fetch)', [sna, srz]);

    // target
    TargetConnectionsSetup(tcs);
    FInfoRec.Report.Add('TARGET: %s connected', [tna]);

    // mover
    MoverSetup(sqy, ett, eop, emo, esc, ecc);

    // preprocess
    Preprocess(tdl, ett);

    // init
    FWatch                   := TStopWatch.StartNew;
    FLastProgressDt          := Now();
    FLastProgressWrittenRows := 0;
    FLastSleepCount          := 0;

    // exec
    FMover.Execute;
  except
    // FD specific error handling
    on e: EFDDBEngineException do begin
      FInfoRec.Report.Add(e.Message);
      FInfoRec.Report.Add(e.SQL);
    end;
    // generic database error handling
    on e: EDatabaseError do begin
      FInfoRec.Report.Add(e.Message);
      FInfoRec.Report.Add(e.StackTrace);
    end;
    on e: EAbort do begin
      // user stop: previous batches are committed, current one not started
      FInfoRec.Report.Add(e.Message);
    end;
    // other exceptions (non-FD related)
    on e: Exception do begin
      FInfoRec.Report.Add(e.Message);

      // queue to UI safely
      UIUpdate(e.Message);
    //TThread.Queue(nil,
    //  procedure begin
    //  //ShowMessage('Error: ' + e.Message);
    //  //Memo1.Lines.Add(E.Message);
    //  end
    //);

    //raise;
    end;
  end;
  {$ENDREGION}

  // ancestor
  inherited;

  // now the thread ends and we go to OnTerminate routine
end;
{$ENDREGION}

{$REGION 'Xxx'}
{$ENDREGION}

end.
