program WksTextEditorProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  Wks000Unit in 'Wks000Unit.pas',
  WksLogFrameUnit in 'WksLogFrameUnit.pas' {LogFrame: TFrame},
  WksSpellcheckFormUnit in 'WksSpellcheckFormUnit.pas' {SpellcheckForm},
  WksTextEditorFormUnit in 'WksTextEditorFormUnit.pas' {TextEditorForm};

{$R *.res}
{$I Wks000Inc.inc}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTextEditorForm, TextEditorForm);
  Application.Run;
end.
