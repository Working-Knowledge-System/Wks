unit WksHeartbeatIsapiMainWebModuleUnit;

interface

uses
  System.SysUtils, System.Classes, System.DateUtils, System.IOUtils, System.JSON, Winapi.Windows, Winapi.PsAPI, Web.HTTPApp;

type
  TMainWebModule = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TMainWebModule;
  DllStartTime: TDateTime;
  DllPath: string;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

function  UptimeFormat(IvStartTime: TDateTime): string;
var
  totalseconds: int64;
  days, hours, minutes, seconds: int64;
begin
  totalseconds := SecondsBetween(Now, IvStartTime);
  days := totalseconds div 86400;
  hours := (totalseconds mod 86400) div 3600;
  minutes := (totalseconds mod 3600) div 60;
  seconds := totalseconds mod 60;

  if days > 0 then
    Result := Format('%dd %dh %dm %ds', [days, hours, minutes, seconds])
  else if hours > 0 then
    Result := Format('%dh %dm %ds', [hours, minutes, seconds])
  else if minutes > 0 then
    Result := Format('%dm %ds', [minutes, seconds])
  else
    Result := Format('%ds', [seconds]);
end;

function  ProcessMemoryUsageMb: double;
var
  pmcounter: PROCESS_MEMORY_COUNTERS;
begin
  Result := 0;
  if GetProcessMemoryInfo(GetCurrentProcess, @pmcounter, SizeOf(pmcounter)) then
    Result := pmcounter.WorkingSetSize / 1024 / 1024; // Convert bytes -> MB
end;

function  CpuUsagePercent: Double;
var
  creationtime, exittime, kerneltime, usertime: TFileTime;
  syskernel, sysuser: int64;
begin
  Result := 0;
  if GetProcessTimes(GetCurrentProcess, CreationTime, ExitTime, KernelTime, UserTime) then begin
    syskernel := Int64(KernelTime.dwLowDateTime) or (Int64(KernelTime.dwHighDateTime) shl 32);
    sysuser := Int64(UserTime.dwLowDateTime) or (Int64(UserTime.dwHighDateTime) shl 32);

    // convert 100ns units -> seconds
    Result := ((syskernel + sysuser) / 10000000.0) / (SecondsBetween(Now, DllStartTime) + 0.01) * 100;
  end;
end;

function  Bitness: string;
begin
{$IFDEF WIN64}
  Result := '64-bit';
{$ELSE}
  Result := '32-bit';
{$ENDIF}
end;

function  BuildMode(const IvPath: string): string;
begin
  if IvPath.ToLower.Contains('debug') then
    Result := 'Debug'
  else if IvPath.ToLower.Contains('release') then
    Result := 'Release'
  else
    Result := 'Unknown';
end;

function  DllVersion(const IvFileName: string): string;
var
  handle: dword;
  size: dword;
  buffer: pointer;
  verinfo: pointer;
  versize: uint;
  fixedfileinfo: PVSFixedFileInfo;
begin
  Result := 'Unknown';
  Size := GetFileVersionInfoSize(PChar(IvFileName), handle);
  if Size > 0 then begin
    GetMem(buffer, size);
    try
      if GetFileVersionInfo(PChar(IvFileName), handle, size, buffer) then begin
        if VerQueryValue(buffer, '\', verinfo, versize) then begin
          fixedfileinfo := verinfo;
          Result := Format('%d.%d.%d.%d', [
            HiWord(fixedfileinfo.dwFileVersionMS),
            LoWord(fixedfileinfo.dwFileVersionMS),
            HiWord(fixedfileinfo.dwFileVersionLS),
            LoWord(fixedfileinfo.dwFileVersionLS)
          ]);
        end;
      end;
    finally
      FreeMem(buffer);
    end;
  end;
end;

function  SystemFromDllName(const IvFileName: string): string;
var
  basename: string;
begin
  basename := TPath.GetFileNameWithoutExtension(IvFileName);
  if Length(basename) >= 3 then
    Result := Copy(basename, 1, 3)
  else
    Result := basename; // fallback if name is too short
  Result := Result.ToUpper;
end;

function  DllBuildTimestamp(const IvFileName: string): string;
var
  handle: THandle;
  dosheader: TImageDosHeader;
  ntheaders: TImageNtHeaders;
  filestream: TFileStream;
  timedatestamp: cardinal;
  utctimestamp: TDateTime;
  localtimestamp: TDateTime;
begin
  Result := 'Unknown';
  try
    filestream := TFileStream.Create(IvFileName, fmOpenRead or fmShareDenyNone);
    try
      FileStream.ReadBuffer(dosheader, SizeOf(dosheader));
      FileStream.Position := dosheader._lfanew;
      FileStream.ReadBuffer(ntheaders, SizeOf(ntheaders));
      TimeDateStamp := ntheaders.FileHeader.TimeDateStamp;
      utctimestamp := UnixToDateTime(TimeDateStamp);
      localtimestamp := TTimeZone.Local.ToLocalTime(UnixToDateTime(TimeDateStamp));
      Result := DateTimeToStr(localtimestamp);
    finally
      FileStream.Free;
    end;
  except
    // ignore errors, keep "Unknown"
  end;
end;

procedure TMainWebModule.WebModule1DefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  jsonresponse: TJSONObject;
  servername: array[0..MAX_COMPUTERNAME_LENGTH + 1] of char;
  size: dword;
  iisapppool: string;
begin
  size := MAX_COMPUTERNAME_LENGTH + 1;
  GetComputerName(servername, size);
  iisapppool := GetEnvironmentVariable('APP_POOL_ID');

  jsonresponse := TJSONObject.Create;
  try
    jsonresponse.AddPair('timestamp'     , DateTimeToStr(Now));
    jsonresponse.AddPair('system'        , SystemFromDllName(DllPath));
    jsonresponse.AddPair('server'        , string(servername));
    jsonresponse.AddPair('dll'           , DllPath);
    jsonresponse.AddPair('version'       , DllVersion(DllPath));
    jsonresponse.AddPair('bitness'       , Bitness);
    jsonresponse.AddPair('buildmode'     , BuildMode(DllPath));
    jsonresponse.AddPair('buildtimestamp', DllBuildTimestamp(DllPath)); // UTC or local
    jsonresponse.AddPair('iisapppool'    , iisapppool);
    jsonresponse.AddPair('memorymb'      , TJSONNumber.Create(ProcessMemoryUsageMb));
    jsonresponse.AddPair('cpupercent'    , TJSONNumber.Create(CpuUsagePercent));
    jsonresponse.AddPair('uptimeseconds' , UptimeFormat(DllStartTime));
    jsonresponse.AddPair('status'        , 'ok');

    Response.ContentType := 'application/json';
    Response.StatusCode := 200;
    Response.Content := jsonresponse.ToJSON;
  finally
    jsonresponse.Free;
  end;
end;

initialization
  DllStartTime := Now;
  SetLength(DllPath, MAX_PATH);
  SetLength(DllPath, GetModuleFileName(HInstance, PChar(DllPath), MAX_PATH));
  Delete(DllPath, 1, 4);
  DllPath := StringReplace(DllPath, '\\', '\', [rfReplaceAll]);

end.
