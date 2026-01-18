program WksPythonEditorProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  WksTextEditorFormUnit in 'WksTextEditorFormUnit.pas' {TextEditorForm},
  WksPythonEditorFormUnit in 'WksPythonEditorFormUnit.pas' {PythonEditorForm};

{$R *.res}
{$I Wks000Inc.inc}

begin
  ReportMemoryLeaksOnShutdown := IsDebuggerPresent();
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPythonEditorForm, PythonEditorForm);
  Application.Run;
end.
