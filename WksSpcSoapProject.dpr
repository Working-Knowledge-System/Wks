library WksSpcSoapProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

{WARNING: WksComUnit must be the last file imported}

uses
  Midaslib,
  Winapi.Windows,
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
  Web.Win.ISAPIThreadPool,
  Wks000Unit in 'Wks000Unit.pas',
  WksSpcSoapMainServiceIntf in 'WksSpcSoapMainServiceIntf.pas',
  WksSpcSoapMainServiceImpl in 'WksSpcSoapMainServiceImpl.pas',
  WksSpcSoapMainWebModuleUnit in 'WksSpcSoapMainWebModuleUnit.pas' {SpcMainWebModule: TWebModule},
  WksSpcSoapMainDataModuleUnit in 'WksSpcSoapMainDataModuleUnit.pas' {SpcMainDataModule: TSoapDataModule},
  WksComUnit in 'WksComUnit.pas';

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  IsMultiThread := true;                                   // default is false (single thread) it should be already present in ...
  CoInitFlags := COINIT_MULTITHREADED;                     // must be called before Application.Initialize. Use multithreaded COM apartment model (important to interacts with COM objects like ADO, Excel, MSXML)
  Application.Initialize;                                  // setsup the internal server environment
//Application.MaxConnections := 5;                         // 32 by default
  NumberOfThreads := Application.MaxConnections;           // must be called after Application.Initialize
  Application.CacheConnections := not IsDebuggerPresent(); // default is true, false will create/destroy isapidll with each request, do not use it in prod
  Application.WebModuleClass := WebModuleClass;
  Application.Run;
end.
