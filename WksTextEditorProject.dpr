program WksTextEditorProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  Wks000Unit in 'Wks000Unit.pas',
  WksLogFrameUnit in 'WksLogFrameUnit.pas' {LogFrame: TFrame},
  WksSpellcheckDialogFormUnit in 'WksSpellcheckDialogFormUnit.pas' {SpellcheckDialogForm},
  WksTextEditorFormUnit in 'WksTextEditorFormUnit.pas' {TextEditorForm};

{$R *.res}
{$I Wks000Inc.inc}

begin
  ReportMemoryLeaksOnShutdown := IsDebuggerPresent();
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTextEditorForm, TextEditorForm);
  Application.Run;
end.
