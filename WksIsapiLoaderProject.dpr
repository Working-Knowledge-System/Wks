library WksIsapiLoaderProject;

{
  Author William Egge
  Company Eggcentric
  WebSite: http://www.eggcentric.com
  email billm@eggcentric.com
  Inception June 24, 2001
  Modified on April 23, 2005
  Version 2.0

  Other products at WebSite
  ISAPI Extension Degugger Host
  ISAPI Filter Degugger Host
}

{$WARN UNIT_PLATFORM OFF}
uses
  Winapi.Windows,
  Winapi.ISAPI2,
  System.SysUtils,
  System.SyncObjs,
  WksIsapiLoaderLogUnit in 'WksIsapiLoaderLogUnit.pas',
  WksIsapiLoaderDirsUnit in 'WksIsapiLoaderDirsUnit.pas',
  WksIsapiLoaderUtilsUnit in 'WksIsapiLoaderUtilsUnit.pas',
  WksIsapiLoaderTimerUnit in 'WksIsapiLoaderTimerUnit.pas',
  WksIsapiLoaderPassthrough in 'WksIsapiLoaderPassthrough.pas',
  WksIsapiLoaderThreadImpersonateUnit in 'WksIsapiLoaderThreadImpersonateUnit.pas';

{$R *.RES}

var
  // created and destroyed in GetExtensionVersion and TerminateExtension
  Loader: TISAPIPassthrough = nil;

// =========================
// ISAPI Interface
// =========================

function  GetExtensionVersion(VerInfo: PHSE_VERSION_INFO): BOOL; stdcall;
begin
  try
    Loader:= TISAPIPassthrough.Create;
    Result:= Loader.GetExtensionVersion(VerInfo);
  except
    try Loader.Free; except end;
    Loader:= nil;
    Result:= False;
  end;
end;

function  HttpExtensionProc(ECB: PEXTENSION_CONTROL_BLOCK): DWORD; stdcall;
begin
  Result:= Loader.HttpExtensionProc(ECB);
end;

function  TerminateExtension(dwFlags: DWORD): BOOL; stdcall;
begin
  Result:= True;
  try
    try Loader.Free; except end;
    Loader:= nil;
  except
    // do not kill IIS on exceptions. (no raise)
  end;
end;

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  {$IFDEF DEBUGLOG}
  with TAppDirectories.Create do
  try
    ForceDirectories(DebugLog);
  finally
    Free;
  end;
  {$ENDIF}
end.
