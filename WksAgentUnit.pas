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
//, FireDAC.Comp.BatchMove.Dataset
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
  TAgentThreadInfoRec = record // *** --> TAgentThreadReportRec ***
    Started  : TDateTime; //
    Ended    : TDateTime; // the finish is not needed
    Success  : boolean  ; //
    Affected : integer  ; // processed items (if the case)
    ElapsedMs: integer  ; // thread lifetime in ms
    Report   : TSbuRec  ; // thread activities *** --> Log ***
    Output   : TSbuRec  ; // script output
    Message : string    ; // 1line log message (ok, error, ...)
  end;

  TAgentThreadProgressRec = record // info of progress steps
    Id         : integer;
    Dt         : TDateTime;
    ReadCount  : integer;
    WriteCount : integer;
    InsertCount: integer;
    UpdateCount: integer;
    DeleteCount: integer;
    CommitCount: integer;
  public
    procedure Init(IvId: integer; IvDt: TDateTime; IvReadCount, IvWriteCount, IvInsertCount, IvUpdateCount, IvDeleteCount, IvCommitCount: integer);
  end;

  TAgentThread = class(TThread)
  private
    FAgentRec      : TAgentRec;           // agent
    FInfoRec       : TAgentThreadInfoRec; // thread whole info report
    FProgressRec   : TAgentThreadProgressRec;   // progress last info
    FWatch         : TStopWatch;          // internal watch
    FRunningId     : integer;             // the id in the runninglistbox
    FPauseRequested: boolean;             // pause the thread
    FAbortRequested: Boolean;             // completely stop the thread and return wit an exception
    FUIUpdate      : TProc<integer, string>;
    FLastSleepCount: int64;               // used if the thread performs in batches and need to sleep between each batch
    FAgentLogFile: TextFile;
    FAgentLogFileSpec: string;
    FAgentLogFileOpened: boolean;
  public
    constructor Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean = true}; IvUIUpdate: TProc<integer, string>);
    destructor Destroy; override;
    procedure Execute; override;
    procedure Feedback(IvString: string); overload;
    procedure Feedback(IvFormat: string; IvVarRecVector: array of TVarRec); overload;
    procedure UIUpdate(IvString: string); overload;
    procedure UIUpdate(IvFormat: string; IvVarRecVector: array of TVarRec); overload;
    procedure PauseRequest;     // from UI thread
    procedure ContinueRequest;  // from UI thread
    procedure AbortRequest;     // from UI thread
    property RunningId: integer             read FRunningId write FRunningId;
    property AgentRec : TAgentRec           read FAgentRec;
    property InfoRec  : TAgentThreadInfoRec read FInfoRec ;
  end;
  {$ENDREGION}

  {$REGION 'TAgentDosThread'}
  TAgentDosThread = class(TAgentThread)
  public
    constructor Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean = true}; IvUIUpdate: TProc<integer, string>);
    destructor Destroy; override;
    procedure Execute; override;
  end;
  {$ENDREGION}

  {$REGION 'TAgentJslThread'}
  TAgentJslThread = class(TAgentThread)
  public
    constructor Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean = true}; IvUIUpdate: TProc<integer, string>);
    destructor Destroy; override;
    procedure Execute; override;
  end;
  {$ENDREGION}

  {$REGION 'TAgentPythonThread'}
  TAgentPythonThread = class(TAgentThread)
  public
    constructor Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean = true}; IvUIUpdate: TProc<integer, string>);
    destructor Destroy; override;
    procedure Execute; override;
  end;
  {$ENDREGION}

  {$REGION 'TAgentSqlThread'}
  TAgentSqlThread = class(TAgentThread)
  public
    constructor Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean = true}; IvUIUpdate: TProc<integer, string>);
    destructor Destroy; override;
    procedure Execute; override;
  end;
  {$ENDREGION}

  {$REGION 'TAgentEtlTableToTableThread'}
  TAgentEtlTableToTableThread = class(TAgentThread) // table to table
  private
    FSourceConn: TFDConnection;
    FTargetConn: TFDConnection;
    FReader: TFDBatchMoveSQLReader;
    FWriter: TFDBatchMoveSQLWriter;
    FMover: TFDBatchMove;
    FBatchDelayMs: integer;
    FMoverMaxErrors: integer;
    FMoverLogFileSpec: string;
  //FCheckpointIniSpec: string;
    procedure SourceConnectionsSetup(IvConnStr: string; IvRowsetSize: integer);
    procedure TargetConnectionsSetup(IvConnStr: string);
    procedure ReaderSetup(IvReadSql: string);
    procedure WriterSetup(IvTargetTable: string);
    procedure MoverSetup(IvOptionCsv, IvMode: string; IvStatisticsInterval, IvCommitCount: integer; IvOnceSetup: boolean);
    procedure MoverOnProgress(ASender: TObject; APhase: TFDBatchMovePhase);
    procedure MoverOnError(ASender: TObject; AException: Exception; var AAction: TFDErrorAction);
    procedure Preprocess(IvTargetDdl, IvTargetTable: string; var IvOptionCsv: string);
  //function  CheckpointLoad: int64;
  //procedure CheckpointSave(IvLastHi: int64);
  //function  SourceQueryMake(const IvLo, IvHi: int64): TFDQuery;
  protected
    procedure Execute; override;
  public
    constructor Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean = true}; IvUIUpdate: TProc<integer, string>); reintroduce;
    destructor Destroy; override;
  end;
  {$ENDREGION}

  {$REGION 'TAgentEtlTableToTextThread'}
  {$ENDREGION}

  {$REGION 'TAgentEtlTextToTableThread'}
  {$ENDREGION}

  {$REGION 'TAgentEtlTableToMongodbThread'}
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
  + sLineBreak + '        "Name"                 : "<Name>"                 -- MSSQL|ORACLE|MONGODB'
  + sLineBreak + '      , "ConnLib"              : "<ConnLib>"              -- ADO|FD, if not defined ADO will be used' // for ETL only FD can be used
  + sLineBreak + '      , "ConnStr"              : "<ConnStr>"              -- if not defined the default System mssql connstr will be used'
//+ sLineBreak + '    --, "ConnTimeoutSec"       : 10                       -- timeout for the connection'
//+ sLineBreak + '    --, "QueryTimeoutSec"      : 30                       -- timeout for the sql query or command'
  + sLineBreak + '    }'
  ;
  AGENT_DATA_TARGET_JSON_TEMPLATE
               = '  , "DataTarget": {'
  + sLineBreak + '        "Name"                 : "<Name>"                 -- MSSQL|ORACLE|MONGODB'
  + sLineBreak + '      , "ConnLib"              : "<ConnLib>"              -- ADO|FD, if not defined ADO will be used' //, for ETL only FD can be used
  + sLineBreak + '      , "ConnStr"              : "<ConnStr>"              -- if not defined the default System mssql connstr will be used'
//+ sLineBreak + '    --, "ConnTimeoutSec"       : 10                       -- timeout for the connection'
//+ sLineBreak + '    --, "QueryTimeoutSec"      : 30                       -- timeout for the sql query or command'
//+ sLineBreak + '    --, "MongodbDatabase"      : "<Dba>"                  -- only for mongodb destination database in the format DbaAaa'
//+ sLineBreak + '    --, "MongodbCollection"    : "<Collection>"           -- only for mongodb destination collection in the format ColAaa'
//+ sLineBreak + '    --, "MongodbRecordLayout"  : "{\"FldAaa\":\"%s\", \"FldBbb\":\"%s\", ...}" -- only for mongodb destination document'
  + sLineBreak + '    }'
  ;
  AGENT_ETL_JSON_TEMPLATE
               = '  , "Etl": {'
  + sLineBreak + '        "Type"                 : "TableToTable"              -- use: TableToTable|NA TextToTable|NA TableToText, if not defined TableToTable will be used'
  + sLineBreak + '      , "TargetTable"          : "<Table>"                   -- destination table in the format DbaAaa.dbo.TblBbb'
  + sLineBreak + '      , "BatchDelayMs"         : 10                          -- ms to wait before each batch start'
  + sLineBreak + '      , "RowsetSize"           : 10000                       -- records extracted from the source table in a single operation'
  + sLineBreak + '  --  , "BulkInsertSize"       : 10000                       -- records inserted in bulk into the target table in a single operation'
  + sLineBreak + '      , "StatisticsCountRows"  : 10000                       -- trigger onprogress event every n records'
  + sLineBreak + '      , "CommitCountRows"      : 10000                       -- starttransaction/commit every n records'
  + sLineBreak + '      , "OptionCsv"            : ""                          -- if empty defaults to: poIdentityInsert,poCreateDest,poSkipUnmatchedDestFields,poUseTransactions (more: poClearDest,poClearDestNoUndo)'
//+ sLineBreak + '                               -- poIdentityIn-- poCreateDest,poClearDestNoUndo,poIdentityInsert,poSkipUnmatchedDestFields,poUseTransactionssert"       -- if specified the primarykey matching is enabled'
//+ sLineBreak + '                               -- poClearDest                   deletes the content of the destination table before data movement performing a transactional DELETE (slow, log will explode)'
//+ sLineBreak + '                               -- poClearDestNoUndo             deletes the content of the destination table before data movement performing a non-transactional TRUNCATE (fast, no logging)'
//+ sLineBreak + '                               -- poCreateDest                  creates the destination table if it does not exist before data movement, DDL is required in Note tab'
//+ sLineBreak + '                               -- poSkipUnmatchedDestFields     if specified then unmatched rows will be excluded from movement'
//+ sLineBreak + '                               -- poUseTransactions             if specified then each batch will be surrounded by starttransaction/commit, a batch happens every CommitCount rows'
  + sLineBreak + '      , "Mode"                 : ""                          -- if empty defaults to: dmAlwaysInsert (more: dmAppend,dmAppendUpdate,dmDelete) '
//+ sLineBreak + '                               -- dmAlwaysInsert                insert records from source to destination, matching using primarykey in destination table is no performed, default mode'
//+ sLineBreak + '                               -- dmAppend                      insert records from source to destination when no matching is found, require primarykey in destination'
//+ sLineBreak + '                               -- dmAppendUpdate                insert records from source to destination when no matching is found, update updates records when matching is found, require primarykey in destination'
//+ sLineBreak + '                               -- dmDelete                      delete records in destination when matching is found, require primarykey in destination'
  + sLineBreak + '      , "MoverMaxErrors"       : 0                           -- TFDBatchMove will abort after N errors, if not defined will abort at first error'
  + sLineBreak + '      , "MoverLogFileSpec"     : "C:\Temp\WksMoverLog.txt"   -- if not defined no error logging is performed'
  + sLineBreak + '      , "AgentLogFileSpec"     : "C:\Temp\WksAgentLog.txt"   -- if not defined no error logging is performed'
  + sLineBreak + '    }'
  ;
  AGENT_RUNS_JSON_TEMPLATE
               = '  , "Runs": {'
  + sLineBreak + '        "PkMinId"              : ""                          -- PK minimun value from yourtable (int/bigint included)'     // select min(pkfld)
  + sLineBreak + '      , "PkMaxId"              : ""                          -- PK maximun value from yourtable (int/bigint NOT included)' // select max(pkfld)
//+ sLineBreak + '      , "RowsInMinMaxRange"    : ""                          -- total rows in the [PkMinId..PkMaxId) range'                // estimated with PkMaxId - PkMinId
  + sLineBreak + '      , "RowsPerRun"           : ""                          -- number of rows per single run *** MAX 2147483647 ***'
  + sLineBreak + '    }'
  ;
//AGENT_TIMEFRAME_JSON_TEMPLATE
//             = '  , "": {'
//+ sLineBreak + '    }'
//;
//AGENT_SAVE_JSON_TEMPLATE
//             = '  , "Save": {'
//+ sLineBreak + '        "Active"               : false'
//+ sLineBreak + '      , "ToOutputTab"          : false'
//+ sLineBreak + '      , "ToFile"               : false'
//+ sLineBreak + '      , "Path"                 : "C:\\Temp"'
//+ sLineBreak + '      , "File"                 : "Test.csv"'
//+ sLineBreak + '      , "Type"                 : "Csv" -- Txt, Json, Html'
//+ sLineBreak + '    }'
//;
//AGENT_EMAIL_JSON_TEMPLATE
//             = '  , "Email": {'
//+ sLineBreak + '        "Active"               : false'
//+ sLineBreak + '      , "Priority"             : ""          -- |Info|Success|Warning|Danger|Error'
//+ sLineBreak + '      , "From"                 : "<From>"    -- if empty will use organization email'
//+ sLineBreak + '      , "To"                   : "<To>"'
//+ sLineBreak + '      , "Copy"                 : "<Copy>"'
//+ sLineBreak + '      , "Bc"                   : ""'
//+ sLineBreak + '      , "Subject"              : "<Subject>"'
//+ sLineBreak + '      , "Title"                : "<Title>"'
//+ sLineBreak + '      , "Content"              : "<Content>" -- here variables like $Dataset(0)$ can be used'
//+ sLineBreak + '      , "OrganizationLogoShow" : true'
//+ sLineBreak + '      , "SystemLogoShow"       : true'
//+ sLineBreak + '      , "SaveToDba"            : false'
//+ sLineBreak + '    }'
//;
//AGENT_PARAMS_JSON_TEMPLATE
//             = '  , "Params": {'
//+ sLineBreak + '        "Param0"               : null'
//+ sLineBreak + '      , "Param1"               : false'
//+ sLineBreak + '      , "Param2"               : 123'
//+ sLineBreak + '      , "Param3"               : "abc"'
//+ sLineBreak + '    }'
//;
//AGENT_OPTION_JSON_TEMPLATE
//             = '  , "Option": {'
//+ sLineBreak + '        "LogOn"                : true'
//+ sLineBreak + '      , "ReportOn"             : true'
//+ sLineBreak + '      , "OutputOn"             : true'
//+ sLineBreak + '      , "Verbose"              : false'
//+ sLineBreak + '      , "LogFile"              : "[RvPathCurrent()]\WksAgent[RvAgentId()].txt"'
//+ sLineBreak + '      , "ComInitialize"        : false'
//+ sLineBreak + '      , "GridOn"               : false' // challenge! we need to update a grid in the main thred from a worker thred
//+ sLineBreak + '    }'
//;
//AGENT_RUNAT_JSON_TEMPLATE
//             = '  , "RunAt": {'
//+ sLineBreak + '        "Year"                 : "*|2000,2001|[RvDtYearNow()]"'
//+ sLineBreak + '      , "Quarter"              : "*|1,2,3,4"'
//+ sLineBreak + '      , "Month"                : "*|Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec|1,2,3,4,5,6,7,8,9,10,11,12"'
//+ sLineBreak + '      , "Week"                 : "*|1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53"'
//+ sLineBreak + '      , "WeekMode"             : "*|Iso" -- Iso|Working'
//+ sLineBreak + '      , "Day"                  : "*|Mon,Tue,Wed,Thu,Fri,Sat,Sun|1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31"'
//+ sLineBreak + '      , "Hour"                 : "*|0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23"'
//+ sLineBreak + '      , "Minute"               : "*|0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59"'
//+ sLineBreak + '      , "Second"               : "*|0,10,20,30,40,50"'
//+ sLineBreak + '    }'
//;
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    System.Math
  , System.IniFiles
  , System.DateUtils
  , Winapi.ActiveX // coinitialize
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

{$REGION 'TAgentProgressRec'}
procedure TAgentThreadProgressRec.Init(IvId: integer; IvDt: TDateTime; IvReadCount, IvWriteCount, IvInsertCount, IvUpdateCount, IvDeleteCount, IvCommitCount: integer);
begin
  Id          := IvId         ;
  Dt          := IvDt         ;
  ReadCount   := IvReadCount  ;
  WriteCount  := IvWriteCount ;
  InsertCount := IvInsertCount;
  UpdateCount := IvUpdateCount;
  DeleteCount := IvDeleteCount;
  CommitCount := IvCommitCount;
end;
{$ENDREGION}

{$REGION 'TAgentThread'}
constructor TAgentThread.Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean}; IvUIUpdate: TProc<integer, string>);
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
  FAbortRequested  := false;
  FUIUpdate        := IvUIUpdate;

  // com
//CoInitializeEx(nil, COINIT_MULTITHREADED);

  // output(dbg)
//Feedback('thread(%d) for "%s" begin', [ThreadId, FAgentRec.Agent], true, 0);

  // report(dbg)
//Feedback('output of "%s" begin'     , [FAgentRec.Agent]          , true, 0);
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

procedure TAgentThread.Feedback(IvString: string);
begin
  // to report
  FInfoRec.Report.Add(IvString);

  // to file
  if FAgentLogFileOpened then begin
    Writeln(FAgentLogFile, IvString);
    Flush(FAgentLogFile);
  end;
end;

procedure TAgentThread.Feedback(IvFormat: string; IvVarRecVector: array of TVarRec);
begin
  Feedback(Format(IvFormat, IvVarRecVector));
end;

procedure TAgentThread.UIUpdate(IvString: string);
begin
  if Assigned(FUIUpdate) then
    TThread.Queue(nil,
      procedure
      begin
        FUIUpdate(RunningId, IvString);
      end
    );
end;

procedure TAgentThread.UIUpdate(IvFormat: string; IvVarRecVector: array of TVarRec);
begin
  UIUpdate(Format(IvFormat, IvVarRecVector));
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

procedure TAgentThread.AbortRequest;
begin
  FAbortRequested := true;
  UIUpdate('stopped');
end;

procedure TAgentThread.Execute;
begin
  // *** this is inherited at the end of Execute of each specialized thread ***

  // output(dbg)
//FInfoRec.Output.Add('output of "%s" end'       , [FAgentRec.Agent]          );

  // report(dbg)
//Feedback('thread(%d) terminating'   , [ThreadId]                 );
//Feedback('thread(%d) for "%s" end'  , [ThreadId, FAgentRec.Agent]);

  // info
  FWatch.Stop;
  FInfoRec.ElapsedMs := FWatch.ElapsedMilliseconds;
  FInfoRec.Ended := Now;

  // uiupdate
  UIUpdate('Done in %d ms', [FInfoRec.ElapsedMs]);
  sleep(1000); // wait a little before the message is removed from the RunningListItemBox

  // ancestor
//inherited;

  // *** NOW THE THREAD ENDS AND WE GO TO ONTERMINATE ROUTINE ***
end;
{$ENDREGION}

{$REGION 'TAgentDosThread'}
constructor TAgentDosThread.Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean}; IvUIUpdate: TProc<integer, string>);
begin
  inherited Create(IvAgentRec{, IvCreateSuspended}, IvUIUpdate);
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
    {FInfoRec.Report.Add}Feedback('terminated'{, true, 0});
    UIUpdate('terminated');
    Exit;
  end;

  // naming
  NameThreadForDebugging(FAgentRec.Agent);
  {FInfoRec.Report.Add}Feedback('starting'{, true, 0});
  UIUpdate('starting');

  // data
  jso := FAgentRec.JsonCompiledSO;

  // workingdir
  if not Assigned(jso.O['WorkingDir']) then begin
    wdi := {TEMP_PATH} TBynRec.BinaryDir;
    Feedback('WorkingDir not defined, using: %s', [wdi]);
  end else
    wdi := jso.S['WorkingDir'];

  // force
  if not DirectoryExists(wdi) then begin
    ForceDirectories(wdi);
    Feedback('WorkingDir %s not exist, created', [wdi]);
  end;

  // exec
  con := TStringList.Create;
  try
    // content
    con.Text := FAgentRec.Content;

    // has errors, warnings, hints
    if not TDosRec.IsValid(con.Text, fbk) then begin
      Feedback('FAILED, msg: ' + fbk);

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
          {FInfoRec.Report.Add}Feedback('%d) cmd: %s (executed in %d ms)', [i+1, lin, FWatch.ElapsedMilliseconds]);
          FInfoRec.Output.Add(oup);
        except
          on e: Exception do begin
            {FInfoRec.Report.Add}Feedback(e.Message);
            FInfoRec.Message := e.Message;
          end;
        end;
      end;
      {$ENDREGION}

    end;
  finally
    con.Free;
  end;

  // ancestor then ends
  inherited;
end;
{$ENDREGION}

{$REGION 'TAgentJslThread'}
constructor TAgentJslThread.Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean}; IvUIUpdate: TProc<integer, string>);
begin
  inherited Create(IvAgentRec{, IvCreateSuspended}, IvUIUpdate);
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
    {FInfoRec.Report.Add}Feedback('terminated'{, true, 0});
    UIUpdate('terminated');
    Exit;
  end;

  // naming
  NameThreadForDebugging(FAgentRec.Agent);
  {FInfoRec.Report.Add}Feedback('starting'{, true, 0});
  UIUpdate('starting');

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
    {FInfoRec.Report.Add}Feedback(rep.Text);
    FInfoRec.Affected := aff;
    FInfoRec.Message := msg;
  finally
    eng.Free;
    rep.Free;
    oup.Free;
    con.Free;
  end;

  // ancestor then ends
  inherited;
end;
{$ENDREGION}

{$REGION 'TAgentPythonThread'}
constructor TAgentPythonThread.Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean}; IvUIUpdate: TProc<integer, string>);
begin
  inherited Create(IvAgentRec{, IvCreateSuspended}, IvUIUpdate);
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
    {FInfoRec.Report.Add}Feedback('terminated'{, true, 0});
    UIUpdate('terminated');
    Exit;
  end;

  // naming
  NameThreadForDebugging(FAgentRec.Agent);
  {FInfoRec.Report.Add}Feedback('starting'{, true, 0});
  UIUpdate('starting');

  // data
  jso := FAgentRec.JsonCompiledSO;

  // code (compile?)
  cod := FAgentRec.Content;

  // do
  FInfoRec.Success := TPythonRec.PythonCodeRun(cod, oup, msg, aff);
  FInfoRec.Output.Text := oup;
  FInfoRec.Affected := aff;
  FInfoRec.Message := msg;

  // ancestor then ends
  inherited;
end;
{$ENDREGION}

{$REGION 'TAgentSqlThread'}
constructor TAgentSqlThread.Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean}; IvUIUpdate: TProc<integer, string>);
begin
  inherited Create(IvAgentRec{, IvCreateSuspended}, IvUIUpdate);
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
    {FInfoRec.Report.Add}Feedback('terminated'{, true, 0});
    UIUpdate('terminated');
    Exit;
  end;

  // naming
  NameThreadForDebugging(FAgentRec.Agent);
  {FInfoRec.Report.Add}Feedback('starting'{, true, 0});
  UIUpdate('starting');

  // data
  jso := FAgentRec.JsonCompiledSO;

  // datasource
  if not Assigned(jso.O['DataSource']) then begin
    Feedback('Json DataSource block is not present');
    Exit;
  end;

  // connstr
  if Assigned(jso.O['DataSource.ConnStr']) then begin
    cst := jso.S['DataSource.ConnStr'];
    Feedback('use connection string: %s', [cst]);
  end else begin
    cst := DBA_CONNECTION_STR;
    Feedback('DataSource.ConnStr not defined, use default connection string: %s', [cst]);
  end;

  // connlib
  if Assigned(jso.O['DataSource.ConnLib']) then begin
    clb := jso.S['DataSource.ConnLib'];
    Feedback('use connection library: %s', [clb]);
  end else begin
    clb := 'ADO';
    Feedback('DataSource.ConnLib not defined, use default connection library: %s', [clb]);
  end;

  // cmdtimeout
  if Assigned(jso.O['DataSource.TimeoutSec']) then begin
    tos := jso.I['DataSource.TimeoutSec'];
    Feedback('use timeout string: %d s', [tos]);
  end else begin
    tos := DBA_COMMAND_TIMEOUT_SEC;
    Feedback('DataSource.TimeoutSec not defined, use default timeout: %d s', [tos]);
  end;

  // timeframe
  if Assigned(jso.O['TimeFrame']) then begin // maybe use directly the "Params: {}" block to define any other puseful parameters
    Feedback('TimeFrame defined');

    // format
    if giis.Nx(jso.S['TimeFrame.Format']) then begin
      Feedback('TimeFrame.Format is not present');
      Exit;
    end;
    tfm := jso.S['TimeFrame.Format'];

    // begin
    if not TryStrToDateTime(jso.S['TimeFrame.Begin'], taa) then begin
      Feedback('TimeFrame.Begin is not a valid datetime');
      Exit;
    end;
    tas := FormatDateTime(tfm, taa);

    // end
    if not TryStrToDateTime(jso.S['TimeFrame.End'], tzz) then begin
      Feedback('TimeFrame.End is not a valid datetime');
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
    {FInfoRec.Report.Add}Feedback(rep.Text);
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

  // ancestor then ends
  inherited;
end;
{$ENDREGION}

{$REGION 'TAgentEtlTableToTableThread'}
constructor TAgentEtlTableToTableThread.Create(IvAgentRec: TAgentRec{; IvCreateSuspended: boolean}; IvUIUpdate: TProc<integer, string>);
begin
  inherited Create(IvAgentRec{, IvCreateSuspended}, IvUIUpdate);

  // com
  CoInitializeEx(nil, COINIT_MULTITHREADED);

  // checkpoint ini file
//FCheckpointIniSpec := Format('C:\$\Temp\WksAgentClientProject_%d_Etl_Checkpoint.ini', [IvAgentRec.Id]);
end;

destructor TAgentEtlTableToTableThread.Destroy;
begin
  // com
  CoUninitialize;

  // objects
  FMover.Free;
  FWriter.Free;
  FReader.Free;
  FTargetConn.Free;
  FSourceConn.Free;
//FreeAndNil(FMover);
//FreeAndNil(FWriter);
//FreeAndNil(FReader);
//FreeAndNil(FTargetConn);
//FreeAndNil(FSourceConn);

  inherited;
end;

procedure TAgentEtlTableToTableThread.SourceConnectionsSetup(IvConnStr: string; IvRowsetSize: integer);
begin
  FSourceConn := TFDConnection.Create(nil);
//FSourceConn.Params.Clear;
  FSourceConn.LoginPrompt                  := false;
  FSourceConn.ConnectionString             := IvConnStr;
//FSourceConn.FetchOptions.CursorKind      := ckForwardOnly;
//FSourceConn.FetchOptions.Unidirectional  := true;
//FSourceConn.FetchOptions.Mode            := fmOnDemand; // will request RowsetSize rows per fetch (RowsetSize), when it is needed, in streaming

  // options per-thread
  FSourceConn.FetchOptions.RowsetSize      := IvRowsetSize;

//FDPhysOracleDriverLink1.VendorHome       := 'C:\$\Oracle\instantclient64_23_9';
//FDPhysOracleDriverLink1.VendorLib        := 'C:\$\Oracle\instantclient64_23_9\oci.dll';
//FDPhysOracleDriverLink1.OCICompatibility := '19';  // or '21' – not mandatory

  // allow full Oracle NUMBER(38, s) range
//FSourceConn.FormatOptions.MaxBcdPrecision := 38;
//FSourceConn.FormatOptions.MaxBcdScale     := 18;   // or what you need

  // map integer-like NUMBERs to Int64 instead of BCD dtFmtBCD/dtBCD -> dtInt64 is usually safe for PKs, IDs, counters
  // if you have high-precision decimals you REALLY need, map those specific columns with CAST in SQL or to dtDouble instead
//FSourceConn.FormatOptions.OwnMapRules := true;
//FSourceConn.FormatOptions.MapRules.Clear;
//with FSourceConn.FormatOptions.MapRules.Add do begin
//  SourceDataType := dtBCD;
//  TargetDataType := dtInt64;
//end;
//with FSourceConn.FormatOptions.MapRules.Add do begin
//  SourceDataType := dtFmtBCD;
//  TargetDataType := dtInt64;
//end;

  FSourceConn.Connected := true; // will load the OCI from VendorLib
end;

procedure TAgentEtlTableToTableThread.TargetConnectionsSetup(IvConnStr: string);
begin
  FTargetConn := TFDConnection.Create(nil);
//FSourceConn.Params.Clear;
  FTargetConn.LoginPrompt                       := false;
  FTargetConn.ConnectionString                  := IvConnStr;
//FTargetConn.FetchOptions.CursorKind           := ckForwardOnly;
//FTargetConn.FetchOptions.Unidirectional       := true;
//FTargetConn.FetchOptions.Mode                 := fmOnDemand; // will request RowsetSize rows every fetch, when it is needed

  // options per-thread tuning
//FTargetConn.FetchOptions.RowsetSize           := trz;
//FTargetConn.ResourceOptions.SilentMode        := true;    // useful for bulk etl
//FTargetConn.Params.Values['PacketSize']       := '32767'; // to avoid truncation
//FTargetConn.ResourceOptions.DirectExecute     := True;
//FTargetConn.UpdateOptions.CountUpdatedRecords := False;

  FTargetConn.Connected                         := true;
end;

procedure TAgentEtlTableToTableThread.ReaderSetup(IvReadSql: string);
begin
  // fresh components so counters reset (they are max 2B)
  FreeAndNil(FReader);

  // reader (generates data)
  FReader := TFDBatchMoveSQLReader.Create(nil);
  FReader.Connection := FSourceConn;
  FReader.ReadSQL := IvReadSql;
end;

procedure TAgentEtlTableToTableThread.WriterSetup(IvTargetTable: string);
begin
  // fresh components so counters reset (they are max 2B)
  FreeAndNil(FWriter);

  // writer (generates inserts)
  FWriter := TFDBatchMoveSQLWriter.Create(nil);
  FWriter.Connection := FTargetConn;
  FWriter.TableName  := IvTargetTable;
end;

procedure TAgentEtlTableToTableThread.MoverSetup(IvOptionCsv, IvMode: string; IvStatisticsInterval, IvCommitCount: integer; IvOnceSetup: boolean);
var
  opv: TArray<string>;
//i: integer;
begin
  // fresh components so counters reset (they are max 2B)
  FreeAndNil(FMover);

  // mover
  FMover := TFDBatchMove.Create(nil);
  FMover.Reader := FReader;
  FMover.Writer := FWriter;
  FMover.StatisticsInterval := IvStatisticsInterval; // if greater than zero will trigger the onprogress event
  FMover.CommitCount        := IvCommitCount;        // if greater than zero wraps in a transaction commiting every N rows
  FMover.OnProgress         := MoverOnProgress;      // metrics and sleep procedure
  FMover.OnError            := MoverOnError;         //
  FMover.MaxErrors          := FMoverMaxErrors;      // aborts after 10 errors

  // moverlog
  if not FMoverLogFileSpec.Trim.IsEmpty then begin
    FMover.LogFileName        := FMoverLogFileSpec;  // log here                   default is: 'Data.log'
    FMover.LogFileAction      := laAppend;           // or laCreate, laOverwrite   default is: laNone
  //FMover.LogStream          := nil;                // complex
  end;

  // only once setup
  if IvOnceSetup then begin

    {$REGION 'options'}
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
    {$ENDREGION}

    {$REGION 'mode'}
         if IvMode.Equals('dmAppend') then       // appends records from source to destination, when they have no matching records in destination table (the matching is performed using primary key fields)
      FMover.Mode := dmAppend

    else if IvMode.Equals('dmUpdate') then       // updates records in destination table that matches records in source table
      FMover.Mode := dmUpdate

    else if IvMode.Equals('dmAppendUpdate') then // appends records from source to destination, when they have no matching records in destination table
      FMover.Mode := dmAppendUpdate              // it also updates records in destination table that matches records in source table (the matching is performed using primary key fields)

    else if IvMode.Equals('dmDelete') then       // deletes records in destination that matches records in source table (the matching is performed using primary key fields)
      FMover.Mode := dmDelete

    else                                         // appends the records from the source to the destination. No content matching is performed. default mode
      FMover.Mode := dmAlwaysInsert;
    {$ENDREGION}

    {$REGION 'mapping'}
    if false then begin
      // analyze                                                       // when Analyze is not empty, then the batch move component tries to automatically recognize the
    //FMover.Analyze := [taDelimSep, taFormatSet, taHeader, taFields]; // data source format by calling the GuessFormat method as part of the Execute method call

      // guess
    //FMover.GuessFormat;                                              // this will use [taDelimSep, taHeader, taFields] as a deault

      // mapping-keyfields
    //FMover.Mappings.KeyFields := 'FldSpc;FldStageMetro;FldStepMetro'; // nop, readonly !!!

      // mapping-auto   fix error: [FireDAC][Comp][DM]-608. Undefined source field or expression for destination field
    //FMover.Mappings.AddAll;
    //i := 0;
    //while i < FMover.Mappings.Count do begin
    //  if (FMover.Mappings[i].SourceFieldName = EmptyStr) then
    //    FMover.Mappings.Delete(i)
    //  else
    //    Inc(i);
    //end;

    // mapping-explicit
    //FMover.Mappings.Add('FldSpc=FldSpc');
    //FMover.Mappings.Add('FldStageMetro=FldStageMetro');
    //FMover.Mappings.Add('FldStepMetro=FldStepMetro');
    //FMover.Mappings[i].SourceExpression := FMover.Mappings[i].SourceFieldName;
    end;
    {$ENDREGION}

  end;
end;

procedure TAgentEtlTableToTableThread.MoverOnError(ASender: TObject; AException: Exception; var AAction: TFDErrorAction);
var
  //reader: TFDBatchMoveDataSetReader;
  dst: TFDDataSet; // sourceds
  pkv: variant;
  line: string;
  i: integer;
begin
  // access the current source row via the Reader’s DataSet
  //reader := TFDBatchMoveDataSetReader(FMover.Reader);
  dst  := FReader.FDDataSet;

  // read PK field
  if dst.FindField('WERT_ID') <> nil then
    pkv := dst.FieldByName('ID').Value
  else
    pkv := null;

  // build the "full record" line
  line := Format('ERROR: %s, pk=%s', [AException.Message, VarToStr(pkv)]);
  for i := 0 to dst.FieldCount - 1 do
    line := line + ', ' + dst.Fields[i].FieldName + '=' + dst.Fields[i].AsString;

  // feedback
  Feedback(line);
  Feedback(AException.Message);
  Feedback(AException.StackTrace);

  // decide what to do with this row
//AAction := eaSkip ; // -> skip this bad row and continue
//AAction := eaAbort; // -> abort the batch
  AAction := eaFail ; // -> treat as fatal error
//AAction := eaRetry; // -> try again
end;

procedure TAgentEtlTableToTableThread.MoverOnProgress(ASender: TObject; APhase: TFDBatchMovePhase);
var
  dtp: TDateTime; // datetime prev
  wrp: int64;     // write prev
  rps: double;    // rows per second
  line: string;   a: integer;
begin
  // exit
  if APhase <> psProgress then
    Exit;

  {$REGION '*** DANGER ***'}
  if FProgressRec.WriteCount >= 2147400000 then begin

    Feedback('DANGER: FireDAC WriteCount is at %d and soon it will reach the limit of 2147483647 and then a fatal fail', [FProgressRec.WriteCount]);

  end;
  {$ENDREGION}

  {$REGION 'prev progress'}
  dtp := FProgressRec.Dt;
  wrp := FProgressRec.WriteCount;
  {$ENDREGION}

  {$REGION 'this last progress'}
  FProgressRec.Init(
    FProgressRec.Id + 1
  , Now()
  , FMover.ReadCount
  , FMover.WriteCount   // written rows
  , FMover.InsertCount
  , FMover.UpdateCount
  , FMover.DeleteCount
  , FMover.CommitCount
  );

  line := Format('progress:%4d, dt:%s, read:%d, write:%d, insert:%d, update:%d, delete:%d, commit:%d', [
    FProgressRec.Id
  , TDatRec.DatForLog(FProgressRec.Dt)
  , FProgressRec.ReadCount
  , FProgressRec.WriteCount
  , FProgressRec.InsertCount
  , FProgressRec.UpdateCount
  , FProgressRec.DeleteCount
  , FProgressRec.CommitCount
  ]);

  // log
  Feedback(line);

  // perf
  rps := (FProgressRec.WriteCount - wrp) / SecondsBetween(dtp, FProgressRec.Dt);

  // ui
  UIUpdate('progress:%d, write:%d, rows/s:%f', [FProgressRec.Id, FProgressRec.WriteCount, rps]);
  {$ENDREGION}

  {$REGION 'commit surrogate for sleep or stop'}
  // transactioncommitactive?

  // somerowswritten
  if FProgressRec.WriteCount > 0 then begin

    // somecommittsaredone
    if FProgressRec.CommitCount  > 0 then begin

      // sleep, pause or stop at the end of each committed batch (between commits, when WriteCount = 1000, 2000, 3000; ...) keeps connection open
      if FProgressRec.WriteCount mod FProgressRec.CommitCount = 0 then begin

        // sleep
        if (FBatchDelayMs > 0) and (FProgressRec.WriteCount > FLastSleepCount) then begin
          Sleep(FBatchDelayMs);                                  // pause n ms between commits
          FLastSleepCount := FProgressRec.WriteCount;         // remember we already slept for this batch
        end;

        // pause
        while FPauseRequested do
          TThread.Sleep(100);

        // stop
        if FAbortRequested then begin
          Feedback('Agent %s stopped by user', [FAgentRec.Agent]);
          raise EAbort.CreateFmt('Agent %s stopped by user', [FAgentRec.Agent]);  // exits Execute cleanly after a commit
        end;
      end;
    end;
  end;
  {$ENDREGION}

end;

procedure TAgentEtlTableToTableThread.Preprocess(IvTargetDdl, IvTargetTable: string; var IvOptionCsv: string);
var
  sql: string;
begin
  // *** WARNING *** target table create-custom (FD field data-type geussing is unreliable)
  if TCsvRec.CsvHas(IvOptionCsv, 'poCreateDest') then begin
    // disable
    TCsvRec.CsvRemove(IvOptionCsv, 'poCreateDest'); // IvOptionCsv :=

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

  // *** WARNING *** target table clear-custom
  end else if TCsvRec.CsvHas(IvOptionCsv, 'poClearDest') or TCsvRec.CsvHas(IvOptionCsv, 'poClearDestNoUndo') then begin
    // FD disable
    TCsvRec.CsvRemove(IvOptionCsv, 'poClearDest');       // IvOptionCsv :=
    TCsvRec.CsvRemove(IvOptionCsv, 'poClearDestNoUndo'); // IvOptionCsv :=

    // custom
    FTargetConn.ExecSQL(Format('if object_id(''%s'', ''U'') is not null truncate /* or drop*/ table %s;', [IvTargetTable, IvTargetTable])); // FD try to drop also if the table does not exists!
  end;
end;

procedure TAgentEtlTableToTableThread.Execute;

  {$REGION 'var'}
var
  jso: ISuperObject;

  // source
  sna, scs, scl, sqy: string; // name, connstr, connlib, query
  srz, sct, sqt: integer;     // rowsetsize, conntimeout, querytimeout

  // target
  tna, tcs, tcl, tdl: string; // name, connstr, connlib, table, ddl
 {trz,}tct, tqt: integer;     // rowsetsize(not needed), conntimeout, querytimeout

  // etl
  eib: boolean;               // isbatched
  {ety,} ett: string;         // {type *** not yet used ***,} targettable
  ecc, esc{, eiz}: integer;   // commitcountrows, statisticintervalcountrows, {bulkinsertsize (max 2147483647 !) *** not yet clear what it does ***}
  eop, emo: string;           // options, mode

  // run(s)
  ros: boolean;               // oncesetupdo(1st run only)
  rix: int64;                 // index
  rk0, rk9, rzz, rrz: int64;  // pkminid, pkmaxid, rowstotalcount, rowsperrun(span)
  rlo, rhi, rpk: int64;       // runidlow, runidhi, runpkcurrent
  runs, progs: integer;       // runstoperform, progstoperform
  {$ENDREGION}

begin

  {$REGION 'exit'}
  // nop
  if Terminated then begin
    {FInfoRec.Report.Add}Feedback('terminated'{, true, 0});
    UIUpdate('terminated');
    Exit;
  end;
  if FAbortRequested then begin
    {FInfoRec.Report.Add}Feedback('user requested to abort'{, true, 0});
    UIUpdate('user requested to abort');
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'init'}
  // naming
  NameThreadForDebugging(FAgentRec.Agent);
  {FInfoRec.Report.Add}Feedback('starting'{, true, 0});
  UIUpdate('starting');

  // query (source), content compiled with Rv and json members, but not with $SliceBegin$ and $SliceEnd$
  sqy := FAgentRec.ContentCompiled;
  if sqy.Trim.IsEmpty then begin
    Feedback('Agent Content query is empty');
    Exit;
  end;

  // data
  jso := FAgentRec.JsonCompiledSO;
  // datasourcesection
  if not jso.AsObject.Exists('DataSource') then begin
    Feedback('Json DataSource section is not present');
    Exit;
  end;
  // datasourcesection
  if not jso.AsObject.Exists('DataTarget') then begin
    Feedback('Json DataTarget section is not present');
    Exit;
  end;
  // etlsection
  if not jso.AsObject.Exists('Etl') then begin
    Feedback('Json Etl section is not present');
    Exit;
  end;
  // runssection
  if not jso.AsObject.Exists('Runs') then begin
    Feedback('Json Runs section is not present');
    Exit;
  end;

  // note->ddl (target), ddl code to create a table if doesn't exists
  tdl := FAgentRec.Note;
  {$ENDREGION}

  {$REGION 'source'}
  // name
  sna := jso.S['DataSource.Name'];

  // connlib
  if Assigned(jso.O['DataSource.ConnLib']) then begin
    scl := jso.S['DataSource.ConnLib'];
    Feedback('use source connection library: %s', [scl]);
  end else begin
    scl := 'ADO';
    Feedback('Json DataSource.ConnLib not defined, use defaulty: %s', [scl]);
  end;

  // connstr
  if Assigned(jso.O['DataSource.ConnStr']) then begin
    scs := jso.S['DataSource.ConnStr'];
    Feedback('use source connection string: %s', [scs]);
  end;
  if scs.Trim.IsEmpty then begin
    scs := DBA_CONNECTION_STR;
    Feedback('Json DataSource.ConnStr not defined, use default: %s', [scs]);
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
    Feedback('use target connection library: %s', [tcl]);
  end else begin
    tcl := 'ADO';
    Feedback('Json DataTarget.ConnLib not defined, use default: %s', [tcl]);
  end;

  // connstr
  if Assigned(jso.O['DataTarget.ConnStr']) then begin
    tcs := jso.S['DataTarget.ConnStr'];
    Feedback('use target connection string: %s', [tcs]);
  end;
  if tcs.Trim.IsEmpty then begin
    tcs := DBA_CONNECTION_STR;
    Feedback('Json DataTarget.ConnStr not defined, use default: %s', [tcs]);
  end;
  tcs := grva.Rva(tcs);

  // conntimeout
  tct := StrToIntDef(jso.S['DataTarget.ConnTimeoutSec'], 10);

  // querytimeout
  tqt := StrToIntDef(jso.S['DataTarget.QueryTimeoutSec'], 30);
  {$ENDREGION}

  {$REGION 'etl'}
//// type *** not yet used ***
//if Assigned(jso.O['Etl.Type']) then begin
//  ety := jso.S['Etl.Type'];
//  Feedback('use etl type: %s', [ety]);
//end else begin
//  ety := 'TableToTable';
//  Feedback('Etl.Type not defined, use default: %s', [ety]);
//end;

  // targettable
  if Assigned(jso.O['Etl.TargetTable']) then begin
    ett := jso.S['Etl.TargetTable'];
    Feedback('use target table: %s', [ett]);
  end;
  if ett.Trim.IsEmpty then begin
    Feedback('Json Etl.TargetTable not defined');
    Exit;
  end;

  // batchdelayms (target)
  FBatchDelayMs := StrToIntDef(jso.S['Etl.BatchDelayMs'], 0);  // ms to wait before each batch start (note: jso.S also read fron an integer value!)
  Feedback('use batchdelayms: %d', [FBatchDelayMs]);

  // rowsetsize (source)
  srz := StrToIntDef(jso.S['Etl.RowsetSize'], 10000);          // controls how many rows FireDAC requests from the server per fetch (fmOnDemand) — i.e. how the client reads results from a SELECT
  Feedback('use rowsetsize: %d', [srz]);

  // bulkinsertsize (target)
//eiz := jso.I['Etl.BulkInsertSize'];                          // once the buffer reaches BulkInsertSize than calls the DB driver’s optimized array insert or bulk insert
//if eiz < 10000 then eiz := 10000;                            // buffers that many source rows into memory using a Array DML
//Feedback('use bulkinsertsize: %d', [eiz]);

  // batchstatistics
  esc := StrToIntDef(jso.S['Etl.StatisticsCountRows'], 10000); // triggers OnProgress every N inserts
  Feedback('use batchstatistics: %d', [esc]);

  // commit (target)
  ecc := StrToIntDef(jso.S['Etl.CommitCountRows'], 10000);     // commit every n inserts releasing resources (better if same as bulkinsertsize?)
  Feedback('use commit: %d', [ecc]);

  // options
  eop := jso.S['Etl.OptionCsv'];
  if eop.Trim.IsEmpty then
    eop := 'poIdentityInsert,poCreateDest,poSkipUnmatchedDestFields,poUseTransactions'; // FD default
  Feedback('use options: %s', [eop]);

  // mode
  emo := jso.S['Etl.Mode'];
  if emo.Trim.IsEmpty then
    emo := 'dmAlwaysInsert'; // also fd default (no PK fields is required on the target table)
  //emo := 'dmAppendUpdate'; // this require a PK fields on the target table
  Feedback('use mode: %s', [emo]);

  // movermaxerror
  FMoverMaxErrors        := StrToIntDef(jso.S['Etl.MoverMaxErrors'], 0);
  Feedback('use movermaxerrors: %d'       , [FMoverMaxErrors]);

  // moverlogfile
  FMoverLogFileSpec := jso.S['Etl.MoverLogFileSpec'];
  Feedback('use moverlogfilespec: %s', [FMoverLogFileSpec]);

  // agentlogfile
  FAgentLogFileSpec := jso.S['Etl.AgentLogFileSpec'];
  Feedback('use agentlogfilespec: %s', [FAgentLogFileSpec]);
  {$ENDREGION}

  {$REGION 'runs'}
  // run size (number of rows per run)       (from begin to end if positive, from end to begin if negative)
  //
  //                              begin                 end
  //       1strecord              run[1]             run[1]                lastrecord
  //      |                       |                       |                |
  //  ----O-----------------------X-----------------------X----------------O------X------------------> PK
  //      |                       |                       |                       |
  //      |--------run[0]-------->|                       |                       |
  //      .                       |--------run[1]-------->|                       |
  //      .                                               |--------run[2]-------->|
  //      .                                                                       .
  //      .                                                                       .
  //      205                                                                     4876667849
  //
  //
  //  table data
  //  ---------------------------
  //  pk min id      : 205
  //  pk max id      : 4876667849
  //  rows count     : 4876667849 - 205   approximate value if range is not dense
  //
  //  runs data
  //  ---------------------------
  //  rows per run   : 1000000000
  //
  //  calculated
  //  ---------------------------
  //  number of runs = (rows count) div (rows per run) + 1 = 4660358812 div 1000000000 + 1 = 5
  //

  // PK min id
  rk0 := StrToInt64Def(jso.S['Runs.PkMinId'], -1);
  if not (rk0 >= 0) then begin
    Feedback('PkMinId = %d must be greater or equal to 0', [rk0]);
    Exit;
  end;
  Feedback('use pkminid: %d (included)', [rk0]);

  // PK max id
  rk9 := StrToInt64Def(jso.S['Runs.PkMaxId'], -1);
  if not (rk0 <= rk9) then begin
    Feedback('PkMaxId = %d must be greater or equal to PkMinId = %d', [rk9, rk0]);
    Exit;
  end;
  Feedback('use pkmaxid: %d (NOT included)', [rk9]);

  // rows count in [min,max) range  *** estimate, precise only if range is dense ***
//rzz := RowsInMinMaxStrToInt64Def(jso.S['Runs.RowsInMinMax'], -1);
  rzz := rk9 - rk0;
//if not (rzz > 0) then begin
//  Feedback('RowsInMinMax = %d must be greater than 0', [rzz]);
//  Exit;
//end;
  Feedback('use rowsinminmax: %d (estimate value of rows in range if it is not dense)', [rzz]);

  // rowsperrun
  rrz := StrToInt64Def(jso.S['Runs.RowsPerRun'], -1);
  if not (rrz > 0) then begin
    Feedback('RowsPerRun = %d must be greater than 0', [rrz]);
    Exit;
  end;
  Feedback('use rowsperrun: %d', [rrz]);

  // runs
  runs := rzz div rrz + 1;
  Feedback('use %d runs in total', [runs]);
  {$ENDREGION}

  {$REGION 'progresses'}
  // progs
  progs := rzz div ecc + 1;
  Feedback('use %d progs in total', [progs]);
  {$ENDREGION}

  {$REGION 'agentlog'}
  // on/off
  if FAgentLogFileSpec.Trim.IsEmpty then begin
    Feedback('do not use agentlog');
    FAgentLogFileOpened := false;
  end else begin
    try
      AssignFile(FAgentLogFile, FAgentLogFileSpec);
      Rewrite(FAgentLogFile);
      FAgentLogFileOpened := true;
    except
      on e: Exception do begin
        Feedback(e.Message);
        FAgentLogFileOpened := false;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION 'start'}
  Feedback('start: %s', [TDatRec.DatForLog(Now)]);
  {$ENDREGION}

  {$REGION 'go'}
  try
    // init
    FWatch                   := TStopWatch.StartNew;

    // last progress
    FProgressRec.Init(0, Now(), 0, 0, 0, 0, 0, 0);
    FLastSleepCount := 0;
    rix := 0;

    // source
    SourceConnectionsSetup(scs, srz);
    Feedback('use source: %s (request %d rows per fetch)', [sna, srz]); // *** DUPS ***

    // target
    TargetConnectionsSetup(tcs);
    Feedback('use target: %s', [tna]);                                  // *** DUPS ***

    // preprocess
    Preprocess(tdl, ett, eop);

    // lo
  //rlo := CheckpointLoad; // resume from last completed hi or
  //if rlo <= 0 then
      rlo := rk0;          // start from 1st record

    // runs
    ros := true;
    while (rlo <{=} rk9) and (not FAbortRequested) do begin // get in the range [rlo, rhi)
      // run
      Inc(rix);
      Feedback('run: %d, lo: %d, hi: %d', [rix, rlo, rhi]);

      // hi
      rhi := System.Math.Min(rlo + rrz, rk9 {+ 1}); // [Lo, Hi)

      // sql
      sqy := sqy.Replace('$RunLoId$', rlo.ToString, [rfReplaceAll]);
      sqy := sqy.Replace('$RunHiId$', rhi.ToString, [rfReplaceAll]);

      // etl components setup
      ReaderSetup(sqy);
      WriterSetup(ett);
      MoverSetup(eop, emo, esc, ecc, ros);
      ros := false;

      // EXECUTE (runs this chunk only)
      FMover.Execute;

      // run chunk complete -> persist checkpoint and advance
    //CheckpointSave(rhi); // *** BREAKPOINT HERE ***
      rlo := rhi;
    end;
  except

    {$REGION 'handling'}
    // FD specific error handling
    on e: EFDDBEngineException do begin
      Feedback('exception in lo: %d, hi: %d, pk: %d', [rlo, rhi, rpk]);
      Feedback(e.Message);
      Feedback(e.SQL);
    end;
    // generic database error handling
    on e: EDatabaseError do begin
      Feedback('exception in lo: %d, hi: %d, pk: %d', [rlo, rhi, rpk]);
      Feedback(e.Message);
      Feedback(e.StackTrace);
    end;
    // user stop: previous batches are committed, current one not started
    on e: EAbort do begin
      Feedback('exception forced by user in lo: %d, hi: %d, pk: %d', [rlo, rhi, rpk]);
      Feedback(e.Message);
    end;
    // other exceptions (non-FD related)
    on e: Exception do begin
      Feedback('exception in lo: %d, hi: %d, pk: %d', [rlo, rhi, rpk]);
      Feedback(e.Message);

      // queue to UI safely
    //TThread.Queue(nil,
    //  procedure begin
    //  //ShowMessage('Error: ' + e.Message);
    //  //Memo1.Lines.Add(E.Message);
    //  end
    //);

    //raise;
    end;
    {$ENDREGION}

  end;
  {$ENDREGION}

  {$REGION 'end'}
  Feedback('end: %s', [TDatRec.DatForLog(Now)]);

//swa: TStopwatch;
//swa.Stop;
//begin    := 'na';
//end      := 'na';
//duration := swa.ElapsedMilliseconds;
//innserts := FMover.InsertCount;
//ReportAddBatch(ThreadID, 1, 1, bbe, ben, bdu, bin);
//IvAffected := bin;
  {$ENDREGION}

  {$REGION 'save'}
//if jso.B['Save.Active'] then
//SaveDo(jo, {ds}nil, NOT_AVAILABLE_STR); // se ogni job riportasse un ds allora si
  //Feedback(fbk);
  {$ENDREGION}

  {$REGION 'email'}
//if jso.B['Email.Active'] then
//if not EmailDo(jo, fbk) then
  //Feedback(fbk);
  {$ENDREGION}

  // ancestor then ends
  inherited;
end;

  {$REGION 'Zzz'}
//function  TAgentEtlTableToTableThread.CheckpointLoad: int64;
//var
//  ini: TIniFile;
//begin
//  Result := 0;
//
//  if (not FCheckpointIniSpec.IsEmpty) and FileExists(FCheckpointIniSpec) then begin
//    ini := TIniFile.Create(FCheckpointIniSpec);
//    try
//      Result := ini.ReadInt64('Checkpoint', 'LastHi', 0);
//    finally
//      ini.Free;
//    end;
//  end;
//end;

//procedure TAgentEtlTableToTableThread.CheckpointSave(IvLastHi: int64);
//var
//  ini: TIniFile;
//begin
//  if (not FCheckpointIniSpec.IsEmpty) then begin
//    ini := TIniFile.Create(FCheckpointIniSpec);
//    try
//      ini.WriteInt64('Checkpoint', 'LastHi', IvLastHi);
//    finally
//      ini.Free;
//    end;
//  end;
//end;

//function  TAgentEtlTableToTableThread.SourceQueryMake(const IvLo, IvHi: int64): TFDQuery;
//var
//  qry: TFDQuery;
//begin
//  qry := TFDQuery.Create(nil);
//  qry.Connection := FSourceConn;
//
//  // use index on PK for fast range scans. ANSI join-free, simple WHERE.
//  qry.SQL.Text := Format('select * from %s.%s where %s >= :PLo and %s < :PHi', ['FCfg.OraSchema', 'FCfg.OraTable', 'FCfg.PkName', 'FCfg.PkName']);
//
//  qry.ParamByName('PLo').DataType   := ftLargeint;
//  qry.ParamByName('PHi').DataType   := ftLargeint;
//  qry.ParamByName('PLo').AsLargeInt := IvLo;
//  qry.ParamByName('PHi').AsLargeInt := IvHi;
//
//  // fetch blobs if needed:
//  // qry.FetchOptions.Items := Q.FetchOptions.Items + [fiBlobs];
//
//  qry.Open;
//  Result := qry;
//end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'TAgentEtlTableToTextThread'}
{$ENDREGION}

{$REGION 'TAgentEtlTextToTableThread'}
{$ENDREGION}

{$REGION 'TAgentEtlTableToMongodbThread'}

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
  bq := str.Replace(aq, '$RunBegin$', bbo);
  bq := str.Replace(bq, '$RunEnd$'  , beo);
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

end.

