library WksIsapiLoaderHelloProject;

uses
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
  Web.Win.ISAPIThreadPool,
  WksIsapiLoaderPatchUnit in 'WksIsapiLoaderPatchUnit.pas',
  WksIsapiLoaderHelloMainWebModuleUnit in 'WksIsapiLoaderHelloMainWebModuleUnit.pas' {MainWebModule: TWebModule};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.CreateForm(TMainWebModule, MainWebModule);
  Application.Run;
end.
