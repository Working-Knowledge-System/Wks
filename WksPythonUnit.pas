unit WksPythonUnit;

interface

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , Vcl.StdCtrls
  , PythonEngine              // gPythonEngine
  , PythonVersions
  , Vcl.PythonGUIInputOutput
  ;
{$ENDREGION}

{$REGION 'Type'}
type

  {$REGION 'PytRec'}
TPytRec = record
public
  class function  PythonVersionInfo(IvPythonVersion: TPythonVersion): string; static;
  class function  PythonComponentsInit(IvOwner: TComponent; var IvPythonEngine: TPythonEngine; var IvPythonGUIInputOutput: TPythonGUIInputOutput; var IvMemo: TCustomMemo; IvOptionPythonVersionItemIndex: integer; var IvFbk: string): boolean; static;
end;
  {$ENDREGION}

{$ENDREGION}

implementation

{$REGION 'TPytRec'}
class function TPytRec.PythonVersionInfo(IvPythonVersion: TPythonVersion): string;
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

class function TPytRec.PythonComponentsInit(IvOwner: TComponent; var IvPythonEngine: TPythonEngine; var IvPythonGUIInputOutput: TPythonGUIInputOutput; var IvMemo: TCustomMemo; IvOptionPythonVersionItemIndex: integer; var IvFbk: string): boolean;
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
{$ENDREGION}

end.
