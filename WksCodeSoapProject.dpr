library WksCodeSoapProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Winapi.Windows,
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
  Web.Win.ISAPIThreadPool,
  WksCodeSoapMainWebModuleUnit in 'WksCodeSoapMainWebModuleUnit.pas' {CodeMainWebModule: TWebModule},
  WksCodeSoapMainDataModuleUnit in 'WksCodeSoapMainDataModuleUnit.pas' {CodeMainDataModule: TSoapDataModule};

{$R *.res}

{$REGION 'Export'}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$ENDREGION}

begin
  ReportMemoryLeaksOnShutdown := true;
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.CacheConnections := not IsDebuggerPresent(); // default is true, false will create/destroy isapidll with each request, do not use it in prod
  Application.WebModuleClass := WebModuleClass;
  Application.Run;
end.
