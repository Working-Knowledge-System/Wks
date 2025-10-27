unit WksIsapiLoaderPassthrough;

interface

uses
    Winapi.Windows
  , Winapi.ISAPI2
  , System.Classes
  , System.SysUtils
  , System.SyncObjs
  , WksIsapiLoaderTimerUnit
  , WksIsapiLoaderUtilsUnit
  , WksIsapiLoaderLogUnit
  ;

type
  TGetExtensionVersion = function(VerInfo: PHSE_VERSION_INFO): BOOL; stdcall;
  THttpExtensionProc   = function(ECB: PEXTENSION_CONTROL_BLOCK): DWORD; stdcall;
  TTerminateExtension  = function(dwFlags: DWORD): BOOL; stdcall;

  TISAPIProcs = record
    Module: HModule;
    GetExtensionVersion: TGetExtensionVersion;
    HttpExtensionProc: THttpExtensionProc;
    TerminateExtension: TTerminateExtension;
  end;

  TISAPIPassthrough = class
  private
    FISAPIProcs: TISAPIProcs;
    FProcsLoaded: boolean;
    FSync: TMultiReadExclusiveWriteSynchronizer;
    FUpdateFile: string;
    FRunFile: string;
    FBackupFile: string;
    FNotifyTimer: TIntervalTimer;
    FErrorLog: TStrings;
    function  GetISAPIProcs: TISAPIProcs;
    procedure LoadProcs;
    procedure UnloadProcs;
    procedure CheckForUpdates;
    procedure NotifyError(StatusCode: DWord; const Msg: string);
  public
    function  GetExtensionVersion(VerInfo: PHSE_VERSION_INFO): BOOL;
    function  HttpExtensionProc(ECB: PEXTENSION_CONTROL_BLOCK): DWORD;
    function  TerminateExtension(dwFlags: DWORD): BOOL;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

const
  RunExt    = '.run';
  BackupExt = '.backup';
  UpdateExt = '.update';

function  UserDomainText: string;
var
  User, DomainName: string;
begin
  SetLength(User, 255);
  SetLength(DomainName, 255);
  GetCurrentUserAndDomain(PChar(User), 255, PChar(DomainName), 255);
  Result:= User + ':' + DomainName;
end;

function  TISAPIPassthrough.GetExtensionVersion(VerInfo: PHSE_VERSION_INFO): BOOL;
begin
  VerInfo^.dwExtensionVersion := 1;
  VerInfo^.lpszExtensionDesc := 'ISAPI Loader by Eggcentric: http://www.eggcentric.com/';
  Result := true;
end;

function  TISAPIPassthrough.HttpExtensionProc(ECB: PEXTENSION_CONTROL_BLOCK): DWORD;
  function  ServerVar(const Name: string): string;
  var
    Buffer: array[0..2047] of char;
    Len: DWord;
  begin
    Len:= 2048;
    ECB^.GetServerVariable(ECB^.ConnID, PAnsiChar(Name), @Buffer[0], Len);
    SetLength(Result, Len-1);
    if Len > 1 then
      Move(Buffer[0], Result[1], Len-1);
  end;
var
  Error: string;
  Bytes: DWord;
  Procs: TISAPIProcs;
  NotifyMsg: string;
begin
  // Next Line: Make compiler happy, says return value could be undefiend
  Result:= HSE_STATUS_ERROR;
  try
    FSync.BeginRead;
    try
      Procs:= GetISAPIProcs;
      if not Assigned(Procs.HttpExtensionProc) then
        raise Exception.Create('HttpExtensionProc not loaded.');

      Result:= Procs.HttpExtensionProc(ECB);

      if ECB^.dwHttpStatusCode <> 200 then
      begin
        NotifyMsg := 'URL: '+ServerVar('SERVER_NAME')+ServerVar('SCRIPT_NAME')+ServerVar('PATH_INFO');

        if Length(ECB^.lpszQueryString) > 0 then
          NotifyMsg := NotifyMsg + '?' + ECB^.lpszQueryString + #13#10
        else
          NotifyMsg := NotifyMsg + #13#10;

        NotifyMsg := NotifyMsg +
          'METHOD: '+ECB^.lpszMethod+#13#10
        + 'SECURE: '+ServerVar('SERVER_PORT_SECURE');


        NotifyError(ECB^.dwHttpStatusCode, NotifyMsg);
      end;
    finally
      FSync.EndRead;
    end;

  except
    on E:Exception do begin
      Result := HSE_STATUS_ERROR;
      Error := E.ClassName + ': "' + E.Message + '"<br>'+UserDomainText;
      NotifyError(500, Error);
      Bytes := Length(Error);
      ECB^.dwHttpStatusCode := 500;
      ECB^.WriteClient(ECB^.ConnID, @Error[1], Bytes, 0);
    end;
  end;
end;

function  TISAPIPassthrough.TerminateExtension(dwFlags: DWORD): BOOL;
begin
  Result := true;
  try UnloadProcs; except end;
end;

constructor TISAPIPassthrough.Create;
var
  DLLName: string;
begin
  inherited;
  FErrorLog := TStringList.Create;
  FSync := TMultiReadExclusiveWriteSynchronizer.Create;
  DLLName := GetModuleFName;
  FUpdateFile := ChangeFileExt(DLLName, UpdateExt);
  FRunFile := ChangeFileExt(DLLName, RunExt);
  FBackupFile := ChangeFileExt(DLLName, BackupExt);
end;

destructor TISAPIPassthrough.Destroy;
begin
  FNotifyTimer.Free;
  FSync.Free;
  FErrorLog.Free;
  inherited;
end;

function  TISAPIPassthrough.GetISAPIProcs: TISAPIProcs;
begin
  FSync.BeginRead;
  try
    if not FProcsLoaded then  begin
      FSync.BeginWrite;
      try
        // Check again in case 2 threads tried to load at the same time.
        if not FProcsLoaded then
          LoadProcs;
      finally
        FSync.EndWrite;
      end;
    end;
    Result:= FISAPIProcs;
  finally
    FSync.EndRead;
  end;
end;

procedure TISAPIPassthrough.LoadProcs;
var
  DummyStartupParam: HSE_VERSION_INFO;
  P1, P2, P3: Pointer;
begin
  // this does a force load even if not needed.
  // current code should not call this unless needed.
  FSync.BeginWrite;
  try
    // First unload current DLL if loaded;
    // If your DLL misbehaves unloading then we have a problem because
    //   we may not be able to overwrite the old file.
    UnloadProcs;
    // First, is there an update? Yes - Backup run and rename it to run.
    AddToLog('Begin File changing');
    AddToLog('Begin check for update: "%s"', [FUpdateFile]);
    if FileExists(FUpdateFile) then begin
      AddToLog('Update Found');
      AddToLog('Begin Checking for run file. "%s"', [FRunFile]);
      if FileExists(FRunFile) then begin
        AddToLog('Run file found');
        AddToLog('Begin previous backup removal: "%s"', [FBackupFile]);

        if FileExists(FBackupFile) then begin
          AddToLog('Backup found, about to delete...');
          if not DeleteFile(FBackupFile) then
            AddToLog('ERROR deleting file: "%s"', [SysErrorMessage(GetLastError)])
          else
            AddToLog('Backup delete successfull.');
        end else
          AddToLog('Previous backup does not exist');

        AddToLog('End previous backup removal: "%s"', [FBackupFile]);

        AddToLog('Begin rename run to backup: "%s" to "%s"', [FRunFile, FBackupFile]);
        if not RenameFile(FRunFile, FBackupFile) then
          AddToLog('ERROR Renaming file: "%s"', [SysErrorMessage(GetLastError)])
        else
          AddToLog('Rename successfull.');

        AddToLog('End rename run to backup');
      end else
        AddToLog('Run file not found');

      AddToLog('End checking for run file');

      AddToLog('Begin rename update to run: "%s" to "%s"', [FUpdateFile, FRunFile]);
      if not RenameFile(FUpdateFile, FRunFile) then
        AddToLog('ERROR Renaming file: "%s"', [SysErrorMessage(GetLastError)])
      else
        AddToLog('Rename successfull.');

      AddToLog('End rename update to run');
    end else
      AddToLog('Update not found');

    AddToLog('End check for update');
    AddToLog('End File changing');

    AddToLog('Begin load of run file: "%s"', [FRunFile]);

    // now Load the Run name
    if FileExists(FRunFile) then begin
      AddToLog('Run file exists');
      with FISAPIProcs do begin
        AddToLog('loading run module...');
        Module:= LoadLibrary(PChar(FRunFile));
        if Module = 0 then
          AddToLog('Load module failed: "%s"', [SysErrorMessage(GetLastError)])
        else
          AddToLog('Load module successfull');

        AddToLog('Begin isapi function  mapping');
        P1:= GetProcAddress(Module, 'GetExtensionVersion');
        P2:= GetProcAddress(Module, 'HttpExtensionProc');
        P3:= GetProcAddress(Module, 'TerminateExtension');

        GetExtensionVersion:= P1;
        HttpExtensionProc:= P2;
        TerminateExtension:= P3;

        AddToLog('Map addresses: {GetExtensionVersion:%p; HttpExtensionProc:%p; TerminateExtension:%p;}', [P1, P2, P3]);

        AddToLog('End isapi function  mapping');

        if Assigned(GetExtensionVersion) then begin
          AddToLog('Calling GetExtensionVersion...');
          if not GetExtensionVersion(@DummyStartupParam) then begin
            AddToLog('GetExtensionVersion=FALSE');
            AddToLog('Freeing library...');
            if not FreeLibrary(Module) then
              AddToLog('FreeLibrary failed: "%s"', [SysErrorMessage(GetLastError)])
            else
              AddToLog('Free library succeded (ispai is no longer loaded!)');

            Module:= 0;
            GetExtensionVersion:= nil;
            HttpExtensionProc:= nil;
            TerminateExtension:= nil;
          end else begin
            AddToLog('GetExtensionVersion=TRUE');
            FProcsLoaded:= true;
          end;
        end;

        // Start Notify Timer Here so that it will run in the user account of the request. (Assuming this method only gets called on a web request)
        if FNotifyTimer = nil then begin
          //FNotifyTimer:= TNotifyTimer.Create(CheckForUpdates, 10000, False);
          FNotifyTimer:= TIntervalTimer.Create(CheckForUpdates, 'ISAPILoader - Check for update thread.');
          FNotifyTimer.Interval:= 10000;
          FNotifyTimer.Active:= true;
        end;
      end;
    end else
      AddToLog('Run file does not exist');
  finally
    FSync.EndWrite;
  end;
end;

procedure TISAPIPassthrough.UnloadProcs;
begin
  AddToLog('Begin Unload Procs');
  FSync.BeginWrite;
  try
    try
      if Assigned(FISAPIProcs.TerminateExtension) then begin
        AddToLog('Begin Terminate Extension');
        FISAPIProcs.TerminateExtension(HSE_TERM_MUST_UNLOAD);
        AddToLog('End Terminate Extension');
      end;
    except
      on E: Exception do begin
        AddToLog('Error Terminating Extension.  Error="%s:%s"', [E.ClassName, E.Message]);
        // Do not raise, continue and free lib
      end
    end;
    try
      if FISAPIProcs.Module <> 0 then begin
        AddToLog('Begin Free Library');
        FreeLibrary(FISAPIProcs.Module);
        AddToLog('End Free Library');
      end;
    except
      on E: Exception do begin
        AddToLog('Error Freeing library.  Error="%s:%s"', [E.ClassName, E.Message]);
      end
    end;

    // set values to 0 and nil
    FillChar(FISAPIProcs, SizeOf(FISAPIProcs), 0);
    FProcsLoaded:= False;
  finally
    FSync.EndWrite;
  end;
  AddToLog('End Unload Procs');
end;

procedure TISAPIPassthrough.CheckForUpdates;
begin
  if FileExists(FUpdateFile) then
    LoadProcs;
end;

procedure TISAPIPassthrough.NotifyError(StatusCode: DWord; const Msg: string);
begin
  ;
end;

end.

