unit WksJslUnit;

interface

{$REGION 'Help'}
{
  implement JMP JSL scripting execution callilng:
  c:\path\jmp.exe "c:\$\Temp\123_script.jsl"
}
{$ENDREGION}

{$REGION 'Use'}
uses
    System.Classes
  ;
{$ENDREGION}

{$REGION 'Type'}
type

  TJslEngineCls = class
  private
    FRefName    : string;   // i.e. the agent name
    FOutStrings : TStrings; // output
    FLogStrings : TStrings; // report
  //FJmpInstance: TJmp;     // jmp
  public
    constructor Create(IvRefName: string; IvOutStrings, IvLogStrings: TStrings);
    destructor  Destroy; override;
    function  BinaryDir(IvArch: string = 'x64' {| x32}): string;
    function  CodeIsValid(IvScript: string; var IvFbk: string): boolean;
    function  RunFile(const IvFileIn: string; IvFileOut: string = ''{; var IvFbk: string}): boolean; // load and execute a .jsl file
    function  RunCode(const IvCode, IvWorkingDir: string{; var IvFbk: string}): boolean; // execute JSL code
  end;
{$ENDREGION}

{$REGION 'Const'}
const
  JSLJMP_EXE_WITH_OPT_IO = '"%s" %s';
{$ENDREGION}

implementation

{$REGION 'Use'}
uses
    System.SysUtils
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'TJslEngineCls'}
constructor TJslEngineCls.Create(IvRefName: string; IvOutStrings, IvLogStrings: TStrings);
begin
  // init
  FRefName    := IvRefName; if FRefName = '' then FRefName := TNamRec.Rnd;
  FOutStrings := IvOutStrings; // no create? no destroy?
  FLogStrings := IvLogStrings; // no create? no destroy?

  // create JMP instance
  //FJmpInstance ...
end;

destructor TJslEngineCls.Destroy;
begin
  // free JMP instance
//FreeAndNil(FJmpInstance);

  inherited;
end;

function  TJslEngineCls.BinaryDir(IvArch: string): string;
begin
  Result := gini.StrGet('Agent/JslJmpExePath', '', true);
end;

function  TJslEngineCls.CodeIsValid(IvScript: string; var IvFbk: string): boolean;
begin
  Result := IvScript <> ''; // FJmpInstance.Eval(IvScript).Bool;
  if Result then
    IvFbk := 'JSL code is valid (ah! ah! ah!)'
  else
    IvFbk := 'JSL code is not valid (it is empty!)';
end;

function  TJslEngineCls.RunFile(const IvFileIn: string; IvFileOut: string): boolean;
var
  b, c, w, o: string; // bynaryinstallationdir, command, workingdir, output
//exe, cmd, fbk: string;
begin
  // init
  Result := false;
  if IvFileOut.IsEmpty then IvFileOut := ChangeFileExt(IvFileIn, 'Output.txt');
  b := BinaryDir();
  w := {TEMP_PATH} TBynRec.BinaryDir;

//// has errors, warnings, hints
//if not eng.IsValid(con.Text, fbk) then begin
//  FInfoRec.Report.Add('state: FAILED, affected: 0, msg: ' + fbk);
//
//// is ok
//end else begin
//
//end;

  try
    // cmdline
    c := Format(JSLJMP_EXE_WITH_OPT_IO, [b, IvFileIn]);

    // i attempt to create the process, if successful wait for it to end
  //Result := win.WinNewProcess(c, true, true);

    // ii launchandgetoutput
    FLogStrings.Add(Format('Running %s', [IvFileIn]));
    Result := TDosRec.Exec(c, o, w);
    FOutStrings.Add(o);
    FLogStrings.Add('JSL file script executed succesfully');

    Result := true;
  except
    on e: Exception do begin
      FLogStrings.Add(Format('%s', [e.Message]));
      Result := false;
    end;
  end;
{
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
}
end;

function  TJslEngineCls.RunCode(const IvCode, IvWorkingDir: string): boolean;
var
  n, b, w, f, o, c: string; // scriptname, rbinarypath, workingdir, temprscriptfile, output, commandline
  s: TStringList;           // script
//  stl: TStringList;
//  fis: string; // filespec
begin
  // init
  FLogStrings.Add('Running JSL code ...');
  Result := false;

  // init
  n := FRefName;
  b := BinaryDir();
  w := giif.NxD(IvWorkingDir, {TEMP_PATH} TBynRec.BinaryDir);
  f := Format('%s\JslTemp_%s.jsl', [w, n]);

  // exit
  Result := not b.IsEmpty;
  if not Result then begin
    FLogStrings.Add('JMP installation path is empy');
    raise Exception.Create('JMP installation path is empy');
  end;
  // exit
//Result := CodeIsValid(IvCode, IvMsg);
//if not Result then
  //Exit;

  // go
  s := TStringList.Create;
  try
    try
      // savetotmpfile
      s.Text := IvCode;
      s.SaveToFile(f);

      // cmdline
      c := Format(JSLJMP_EXE_WITH_OPT_IO, [b, f]);

      // launchandgetoutput
      FLogStrings.Add(Format('Running %s', [f]));
      Result := TDosRec.Exec(c, o, w);
      FOutStrings.Add(o);
      FLogStrings.Add('JSL code executed succesfully');

      Result := true;
    except
      on e: Exception do begin
        FLogStrings.Add(Format('%s', [e.Message]));
        Result := false;
      end;
    end;
  finally
    DeleteFile(f);
    FreeAndNil(s);
  end;
{
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
}
end;
{$ENDREGION}

end.
