program WksJsonEditorProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  WksTextEditorFormUnit in 'WksTextEditorFormUnit.pas' {TextEditorForm},
  WksJsonEditorFormUnit in 'WksJsonEditorFormUnit.pas' {JsonEditorForm};

{$R *.res}
{$I Wks000Inc.inc}

begin
  ReportMemoryLeaksOnShutdown := IsDebuggerPresent();
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TJsonEditorForm, JsonEditorForm);
  Application.Run;
end.
