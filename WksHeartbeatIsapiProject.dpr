library WksHeartbeatIsapiProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
  Web.Win.ISAPIThreadPool,
  WksHeartbeatIsapiMainWebModuleUnit in 'WksHeartbeatIsapiMainWebModuleUnit.pas' {MainWebModule: TWebModule};

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  Application.Run;
end.
