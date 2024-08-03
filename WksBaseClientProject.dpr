program WksBaseClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  Wks000Unit in 'Wks000Unit.pas',
  WksImageFrameUnit in 'WksImageFrameUnit.pas' {ImageFrame: TFrame},
  WksJsonEditorFormUnit in 'WksJsonEditorFormUnit.pas' {JsonEditorForm},
  WksLogFrameUnit in 'WksLogFrameUnit.pas' {LogFrame: TFrame},
  WksLoginFormUnit in 'WksLoginFormUnit.pas' {LoginForm},
  WksPythonEditorFormUnit in 'WksPythonEditorFormUnit.pas' {PythonEditorForm},
  WksReplaceConfirmFormUnit in 'WksReplaceConfirmFormUnit.pas' {ReplaceConfirmForm},
  WksReplaceFormUnit in 'WksReplaceFormUnit.pas' {ReplaceForm},
  WksSearchFormUnit in 'WksSearchFormUnit.pas' {SearchForm},
  WksSpellcheckFormUnit in 'WksSpellcheckFormUnit.pas' {SpellcheckForm},
  WksTextEditorFormUnit in 'WksTextEditorFormUnit.pas' {TextEditorForm},
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksMemberRoleLevelGradeFormUnit in 'WksMemberRoleLevelGradeFormUnit.pas' {MemberRoleLevelGradeForm},
  WksColorFormUnit in 'WksColorFormUnit.pas' {ColorForm},
  WksSqlEditorFormUnit in 'WksSqlEditorFormUnit.pas' {SqlEditorForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBaseMainForm, BaseMainForm);
  Application.CreateForm(TSqlEditorForm, SqlEditorForm);
  Application.Run;
end.
