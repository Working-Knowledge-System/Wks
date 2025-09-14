unit WksSqlUnit;

interface

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  ;
{$ENDREGION}

{$REGION 'Type'}
type

  {$REGION 'SqlRec'}
TSqlRec = record
public
  class function  SqlFileRun(const IvFile, IvConnectionStr: string; out IvOutput, IvMsg: string; out IvAffected: integer): boolean; static; // load and execute a .sql file
  class function  SqlCodeRun(const IvCode, IvConnectionStr: string; out IvOutput, IvMsg: string; out IvAffected: integer): boolean; static; // execute sql code fragment
end;
  {$ENDREGION}

{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    System.IOUtils
  , Winapi.ActiveX    // com
  , System.Win.ComObj // com
  , Data.DB
  , Data.Win.ADODB
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'TSqlRec'}
class function TSqlRec.SqlFileRun(const IvFile, IvConnectionStr: string; out IvOutput, IvMsg: string; out IvAffected: integer): boolean;
var
  con: TADOConnection;
  qry: TADOQuery;
begin
  // exit
  if IvConnectionStr.IsEmpty then begin
    IvOutput := '';
    IvMsg := Format('Connection string "%s" is empty, unable to run file "%s"', [IvConnectionStr, IvFile]);
    IvAffected := 0;
    Result := false;
    Exit;
  end;

  // com
  CoInitialize(nil); // CoInitialize initializes the COM library on the current thread, ADO is COM!

  // objs
  con := TADOConnection.Create(nil);
  con.LoginPrompt := false;
  con.ConnectionString := IvConnectionStr;
//con.CommandTimeout := IvConnectionTimeout;
  qry := TADOQuery.Create(nil);
  qry.Connection := con;
//qry.CommandTimeout := IvQueryTimeout;
//sql := TRva.Rv(IvSql);
  qry.SQL.Text := TFile.ReadAllText(IvFile);
  try
    try
      qry.Open;
      TDstRec.DstToCsv(qry, IvOutput);
      IvMsg := 'Ok';
      IvAffected := 0;
      Result := true;
    except
      // ADO specific error handling
      on e: EAdoError do begin
        IvOutput := e.StackTrace;
        IvMsg := e.Message;
        IvAffected := 0;
        Result := false;
      end;
      // generic database error handling
      on e: EDatabaseError do begin
        IvOutput := e.StackTrace;
        IvMsg := e.Message;
        IvAffected := 0;
        Result := false;
      end;
      // other exceptions (non-DB-ADO related)
      on e: Exception do begin
        IvOutput := '';
        IvMsg := e.Message;
        IvAffected := 0;
        Result := false;
      end;
    end;
  finally
    // objs
    qry.Free;
    con.Free;

    // com
    CoUninitialize();
  end;
end;

class function TSqlRec.SqlCodeRun(const IvCode, IvConnectionStr: string; out IvOutput, IvMsg: string; out IvAffected: integer): boolean;
var
  stl: TStringList;
  fis: string; // filespec
begin
  // stringlist
  stl := TStringList.Create;
  try
    // filespec
    fis := TFsyRec.FileTempRnd('.sql');

    // codetofile
    stl.Text := IvCode;
    stl.SaveToFile(fis);

    // filerun
    Result := SqlFileRun(fis, IvConnectionStr, IvOutput, IvMsg, IvAffected);
  finally
    DeleteFile(fis);
    FreeAndNil(stl);
  end;
end;

end.
