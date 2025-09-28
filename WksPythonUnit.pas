unit WksPythonUnit;

interface

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , Vcl.StdCtrls
  , PythonEngine              // PythonEngine
  , PythonVersions
  , Vcl.PythonGUIInputOutput
  ;
{$ENDREGION}

{$REGION 'Type'}
type

  {$REGION 'PythonRec'}
TPythonRec = record
public
  class function  PythonVersionInfo(IvPythonVersion: TPythonVersion): string; static;
  class function  PythonExePath: string; static;
  class function  PythonComponentsInit(IvOwner: TComponent; var IvPythonEngine: TPythonEngine; var IvPythonGUIInputOutput: TPythonGUIInputOutput; var IvMemo: TCustomMemo; IvOptionPythonVersionItemIndex: integer; var IvFbk: string): boolean; static;
  class function  PythonFileRun(const IvFile: string; out IvOutput, IvMsg: string; out IvAffected: integer): boolean; static; // load and execute a .py file
  class function  PythonCodeRun(const IvCode: string; out IvOutput, IvMsg: string; out IvAffected: integer): boolean; static; // execute python code fragment
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

{$REGION 'TPythonRec'}
class function TPythonRec.PythonVersionInfo(IvPythonVersion: TPythonVersion): string;
begin
    Result      := Format('Python Version         : %s', [IvPythonVersion.Version         ])
    + sLineBreak + Format('Python SysVersion      : %s', [IvPythonVersion.SysVersion      ])
    + sLineBreak + Format('Python DLLPath         : %s', [IvPythonVersion.DLLPath         ])
    + sLineBreak + Format('Python PythonPath      : %s', [IvPythonVersion.PythonPath      ])
    + sLineBreak + Format('Python PythonExecutable: %s', [IvPythonVersion.PythonExecutable])
    + sLineBreak + Format('Python SysArchitecture : %s', [IvPythonVersion.SysArchitecture ])
    + sLineBreak + Format('Python DisplayName     : %s', [IvPythonVersion.DisplayName     ])
    + sLineBreak + Format('Python ApiVersion      : %d', [IvPythonVersion.ApiVersion      ])
end;

class function TPythonRec.PythonExePath: string;
var
  vel: TPythonVersion;
begin
  // versionlast
  if GetLatestRegisteredPythonVersion(vel) then
    Result := vel.PythonExecutable
  else
    Result := ''; // python not installed
end;

class function TPythonRec.PythonComponentsInit(IvOwner: TComponent; var IvPythonEngine: TPythonEngine; var IvPythonGUIInputOutput: TPythonGUIInputOutput; var IvMemo: TCustomMemo; IvOptionPythonVersionItemIndex: integer; var IvFbk: string): boolean;
var
//own: TComponent;
  pvs: TPythonVersions;
  pve: TPythonVersion;
begin
  // pyver
  pvs := GetRegisteredPythonVersions;
  pve := pvs[IvOptionPythonVersionItemIndex];

  try
    // i
//    own := GetPythonEngine.Owner;
//    GetPythonEngine.Free;
//    TPythonEngine.Create(own);
//    pve.AssignTo(GetPythonEngine);
//    IvPythonEngine.LoadDll;
//    if Assigned(IvPythonGUIInputOutput) then
//      GetPythonEngine.IO := IvPythonGUIInputOutput;

    // ii
    if Assigned(IvPythonGUIInputOutput) then
      IvPythonGUIInputOutput.Free;
    IvPythonGUIInputOutput := TPythonGUIInputOutput.Create(IvOwner);
    IvPythonGUIInputOutput.Output := IvMemo;
    IvPythonGUIInputOutput.MaxLines      := 10000;
    IvPythonGUIInputOutput.MaxLineLength := 1024;
  //IvPythonGUIInputOutput.RawOutput     := false; // set on cbclick
  //IvPythonGUIInputOutput.UnicodeIO     := true;
    if Assigned(IvPythonEngine) then
      IvPythonEngine.Free;
    IvPythonEngine := TPythonEngine.Create(IvOwner);
    pve.AssignTo(IvPythonEngine);
    IvPythonEngine.IO := IvPythonGUIInputOutput;
    IvPythonEngine.LoadDll;

    // end
    IvFbk := Format('Python components initialized (engine released and recreated, guiio released and recreated, %s reloaded)', [pve.DLLName]);
    IvFbk  := PythonVersionInfo(pve);
    Result := true;
  except
    on e: EPyException do begin
      IvFbk  := e.Message;
      Result := false;
    end;
  end;
end;

class function TPythonRec.PythonFileRun(const IvFile: string; out IvOutput, IvMsg: string; out IvAffected: integer): boolean;
var
  exe, cmd, fbk: string;
begin
  // exe
  exe := PythonExePath;
  if not TFsyRec.FileExists(exe, fbk) then begin
    IvOutput := '';
    IvMsg := Format('Python executable "%s" does not exist, unable to run file "%s"', [exe, IvFile]);
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

class function TPythonRec.PythonCodeRun(const IvCode: string; out IvOutput, IvMsg: string; out IvAffected: integer): boolean;
var
  stl: TStringList;
  fis: string; // filespec
begin
  // stringlist
  stl := TStringList.Create;
  try
    // filespec
    fis := TFsyRec.FileTempRnd('.py');

    // codetofile
    stl.Text := IvCode;
    stl.SaveToFile(fis);

    // filerun
    Result := PythonFileRun(fis, IvOutput, IvMsg, IvAffected);
  finally
    DeleteFile(fis);
    FreeAndNil(stl);
  end;
end;
{$ENDREGION}

end.
