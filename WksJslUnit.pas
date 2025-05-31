unit WksJslUnit;

interface

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  ;
{$ENDREGION}

{$REGION 'Type'}
type

  {$REGION 'JslRec'}
TJslRec = record
public
  class function  JslExePath: string; static;
  class function  JslFileRun(const IvFile: string; out IvOutput, IvMsg: string; out IvAffected: integer): boolean; static; // load and execute a .jsl file
  class function  JslCodeRun(const IvCode: string; out IvOutput, IvMsg: string; out IvAffected: integer): boolean; static; // execute jump-jsl code fragment
end;
  {$ENDREGION}

{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    System.IOUtils
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'TJslRec'}
class function TJslRec.JslExePath: string;
begin
  Result := gini.StrGet('Agent/JmpExePath', '', true);
end;

class function TJslRec.JslFileRun(const IvFile: string; out IvOutput, IvMsg: string; out IvAffected: integer): boolean;
var
  exe, cmd, fbk: string;
begin
  // exe
  exe := JslExePath;
  if not TFsyRec.FileExists(exe, fbk) then begin
    IvOutput := '';
    IvMsg := Format('Jmp Jsl executable "%s" does not exist, unable to run file "%s"', [exe, IvFile]);
    IvAffected := 0;
    Result := false;
    Exit;
  end;

  // command
  cmd := Format('"%s" %s', [exe, IvFile]);

  // winprocess
  try
    IvOutput := TWinRec.WinCmdExecute(cmd);
    IvMsg := 'Ok';
    IvAffected := 0;
    Result := true;
  except
    on e: Exception do begin
      IvOutput := '';
      IvMsg := e.Message;
      IvAffected := 0;
      Result := false;
    end;
  end;
end;

class function TJslRec.JslCodeRun(const IvCode: string; out IvOutput, IvMsg: string; out IvAffected: integer): boolean;
var
  stl: TStringList;
  fis: string; // filespec
begin
  // stringlist
  stl := TStringList.Create;
  try
    // filespec
    fis := TFsyRec.FileTempRnd('.jsl');

    // codetofile
    stl.Text := IvCode;
    stl.SaveToFile(fis);

    // filerun
    Result := JslFileRun(fis, IvOutput, IvMsg, IvAffected);
  finally
    DeleteFile(fis);
    FreeAndNil(stl);
  end;
end;

end.
