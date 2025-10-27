unit WksSqlUnit;

interface

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Type'}
type

  TSqlEngineCls = class
  private
    FRefName    : string;   // i.e. the agent name
    FOutStrings : TStrings; // output
    FRepStrings : TStrings; // report
  public
    constructor Create(IvRefName: string; IvOutStrings, IvRepStrings: TStrings);
    destructor  Destroy; override;
    function  CodeIsValid(IvScript: string; var IvFbk: string): boolean;
    function  CodeRun(const IvCode, IvConnectionStr, IvConnectionLib: string; out IvMsg: string; out IvAffected: integer; IvQueryTimeoutSec: integer = DBA_COMMAND_TIMEOUT_SEC): boolean;
    function  FileRun(const IvFile, IvConnectionStr, IvConnectionLib: string; out IvMsg: string; out IvAffected: integer; IvQueryTimeoutSec: integer = DBA_COMMAND_TIMEOUT_SEC): boolean;
  end;
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    System.IOUtils
  , Winapi.ActiveX    // com
  , System.Win.ComObj // com
  , Data.DB
  , Data.Win.ADODB
  , FireDAC.Comp.BatchMove
  , FireDAC.Comp.BatchMove.DataSet
  , FireDAC.Comp.BatchMove.SQL
  , FireDAC.Comp.Client
  , FireDAC.Comp.DataSet
  , FireDAC.Comp.UI
  , FireDAC.DApt
  , FireDAC.DApt.Intf
  , FireDAC.DatS
  , FireDAC.Phys
  , FireDAC.Phys.Intf
//, FireDAC.Phys.MSSQL
//, FireDAC.Phys.MSSQLDef
//, FireDAC.Phys.MongoDB
//, FireDAC.Phys.MongoDBDataSet
//, FireDAC.Phys.MongoDBDef
//, FireDAC.Phys.MongoDBWrapper
  , FireDAC.Phys.ODBCBase
//, FireDAC.Phys.Oracle
//, FireDAC.Phys.OracleDef
  , FireDAC.Phys.SQLite
  , FireDAC.Phys.SQLiteDef
  , FireDAC.Stan.Async
  , FireDAC.Stan.Def
  , FireDAC.Stan.Error
  , FireDAC.Stan.ExprFuncs
  , FireDAC.Stan.Intf
  , FireDAC.Stan.Option
  , FireDAC.Stan.Param
  , FireDAC.Stan.Pool
  , FireDAC.UI.Intf
  , FireDAC.VCLUI.Wait
  ;
{$ENDREGION}

{$REGION 'TSqlEngineCls'}
constructor TSqlEngineCls.Create(IvRefName: string; IvOutStrings, IvRepStrings: TStrings);
begin
  // init
  FRefName    := IvRefName; if FRefName = '' then FRefName := TNamRec.Rnd;
  FOutStrings := IvOutStrings; // no create? no destroy?
  FRepStrings := IvRepStrings; // no create? no destroy?
end;

destructor TSqlEngineCls.Destroy;
begin

  inherited;
end;

function  TSqlEngineCls.CodeIsValid(IvScript: string; var IvFbk: string): boolean;
begin
  Result := IvScript <> '';
  if Result then
    IvFbk := 'SQL code is valid (ah! ah! ah!)'
  else
    IvFbk := 'SQL code is not valid (it is empty!)';
end;

function  TSqlEngineCls.CodeRun(const IvCode, IvConnectionStr, IvConnectionLib: string; out IvMsg: string; out IvAffected: integer; IvQueryTimeoutSec: integer): boolean;
const
  IvCodeSaveToAFile = false;
var
  fcn: TFDConnection;
  fqu: TFDQuery;
  con: TADOConnection;
  que: TADOQuery;
  stl: TStringList;
  fis: string; // filespec
begin
  // def
  IvAffected := 0;

  {$REGION 'exit'}
  Result := not IvCode.IsEmpty;
  if not Result then begin
    IvMsg := 'Code is empty';
    Exit;
  end;

  Result := not IvConnectionStr.IsEmpty;
  if not Result then begin
    IvMsg := 'Connection string is empty';
    Exit;
  end;

  Result := CodeIsValid(IvCode, IvMsg);
  if not Result then
    Exit;
  {$ENDREGION}

  {$REGION 'CodeSaveToAFile'}
  if IvCodeSaveToAFile then begin
    stl := TStringList.Create;
    try
      stl.Text := IvCode;
      fis := TFsyRec.FileTempRnd('.sql');
      stl.SaveToFile(fis);
    finally
      DeleteFile(fis);
      stl.Free;
    end;
  end;
  {$ENDREGION}

  {$REGION 'FD'}
  if IvConnectionLib.Equals('FD') then begin
    // com
    CoInitialize(nil); // CoInitialize initializes the COM library on the current thread, ADO is COM!

    // connection
    fcn := TFDConnection.Create(nil);
    fcn.ConnectionString               := IvConnectionStr;
  //fcn.ResourceOptions.ConnTimeout    := {IvConnectionTimeout} 10;
    fcn.ResourceOptions.CmdExecTimeout := IvQueryTimeoutSec;
    fcn.LoginPrompt := false;

    // query
    fqu := TFDQuery.Create(nil);
    fqu.Connection                     := fcn;
    fqu.ResourceOptions.CmdExecTimeout := IvQueryTimeoutSec * 1000; // *** milliseconds ***
    fqu.ResourceOptions.CmdExecMode    := amAsync;
    fqu.FetchOptions.Mode              := fmAll;
    fqu.SQL.Text                       := IvCode;

    // do
    try
      // try
      try
        // exec
        fqu.Open;
        if fqu.RowsAffected > 0 then
          IvAffected := fqu.RowsAffected // delete or update
        else
          IvAffected := fqu.RecordCount; // select
        IvMsg := 'FD query executed';
        FRepStrings.Add(IvMsg);
        Result := true;

      //TDstRec.DstToCsv(que, IvOutput);
      except
        // FDO specific error handling
        on e: EFDException do begin
          FRepStrings.Add(e.StackTrace);
          IvMsg := e.Message;
          FRepStrings.Add(IvMsg);
          Result := false;
        end;
        // generic database error handling
        on e: EDatabaseError do begin
          FRepStrings.Add(e.StackTrace);
          IvMsg := e.Message;
          FRepStrings.Add(IvMsg);
          Result := false;
        end;
        // other exceptions (non-FD related)
        on e: Exception do begin
          IvMsg := e.Message;
          FRepStrings.Add(IvMsg);
          Result := false;
        end;
      end;
    finally
      fqu.Free;
      fcn.Free;
      CoUninitialize();
    end;
  {$ENDREGION}

  {$REGION 'ADO'}
  end else begin
    // com
    CoInitialize(nil); // CoInitialize initializes the COM library on the current thread, ADO is COM!

    // connection
    con := TADOConnection.Create(nil);
    con.ConnectionString  := IvConnectionStr;
    con.ConnectionTimeout := {IvConnectionTimeout} 10;
    con.CommandTimeout    := IvQueryTimeoutSec; // *** seconds ***
    con.LoginPrompt       := false;

    // query
    que := TADOQuery.Create(nil);
    que.Connection     := con;
    que.CommandTimeout := IvQueryTimeoutSec;
    que.SQL.Text       := IvCode;

    // do
    try
      // try
      try
        // exec
        que.Open;
        if que.RowsAffected > 0 then
          IvAffected := que.RowsAffected // delete or update
        else
          IvAffected := que.RecordCount; // select
        IvMsg := 'ADO query executed';
        FRepStrings.Add(IvMsg);
        Result := true;

      //TDstRec.DstToCsv(que, IvOutput);
      except
        // ADO specific error handling
        on e: EAdoError do begin
          FRepStrings.Add(e.StackTrace);
          IvMsg := e.Message;
          FRepStrings.Add(IvMsg);
          Result := false;
        end;
        // generic database error handling
        on e: EDatabaseError do begin
          FRepStrings.Add(e.StackTrace);
          IvMsg := e.Message;
          FRepStrings.Add(IvMsg);
          Result := false;
        end;
        // other exceptions (non-DB-ADO related)
        on e: Exception do begin
          IvMsg := e.Message;
          FRepStrings.Add(IvMsg);
          Result := false;
        end;
      end;
    finally
      que.Free;
      con.Free;
      CoUninitialize();
    end;
  end;
  {$ENDREGION}

end;

function  TSqlEngineCls.FileRun(const IvFile, IvConnectionStr, IvConnectionLib: string; out IvMsg: string; out IvAffected: integer; IvQueryTimeoutSec: integer = DBA_COMMAND_TIMEOUT_SEC): boolean;
var
  cod: string;
begin
  // code
  cod := TFile.ReadAllText(IvFile);

  // run
  Result := CodeRun(cod, IvConnectionStr, IvConnectionLib, IvMsg, IvAffected, IvQueryTimeoutSec);
end;
{$ENDREGION}

end.
