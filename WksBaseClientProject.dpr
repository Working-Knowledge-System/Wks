program WksBaseClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  MidasLib,
  Vcl.Forms,
  Wks000Unit in 'Wks000Unit.pas',
  WksPythonUnit in 'WksPythonUnit.pas',
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksColorDialogFormUnit in 'WksColorDialogFormUnit.pas' {ColorDialogForm},
  WksGenerateDialogFormUnit in 'WksGenerateDialogFormUnit.pas' {GenerateDialogForm},
  WksGridDialogFormUnit in 'WksGridDialogFormUnit.pas' {GridDialogForm},
  WksImageFrameUnit in 'WksImageFrameUnit.pas' {ImageFrame: TFrame},
  WksJsonEditorFormUnit in 'WksJsonEditorFormUnit.pas' {JsonEditorForm},
  WksListDialogFormUnit in 'WksListDialogFormUnit.pas' {ListDialogForm},
  WksLogFrameUnit in 'WksLogFrameUnit.pas' {LogFrame: TFrame},
  WksLoginFormUnit in 'WksLoginFormUnit.pas' {LoginForm},
  WksMemberRoleLevelGradeFormUnit in 'WksMemberRoleLevelGradeFormUnit.pas' {MemberRoleLevelGradeForm},
  WksObjectDialogFormUnit in 'WksObjectDialogFormUnit.pas' {ObjectDialogForm},
  WksPasswordGenFormUnit in 'WksPasswordGenFormUnit.pas' {PasswordGenForm},
  WksPythonEditorFormUnit in 'WksPythonEditorFormUnit.pas' {PythonEditorForm},
  WksReplaceConfirmFormUnit in 'WksReplaceConfirmFormUnit.pas' {ReplaceConfirmForm},
  WksReplaceFormUnit in 'WksReplaceFormUnit.pas' {ReplaceForm},
  WksSearchFormUnit in 'WksSearchFormUnit.pas' {SearchForm},
  WksSpellcheckDialogFormUnit in 'WksSpellcheckDialogFormUnit.pas' {SpellcheckDialogForm},
  WksSqlEditorFormUnit in 'WksSqlEditorFormUnit.pas' {SqlEditorForm},
  WksTextDialogFormUnit in 'WksTextDialogFormUnit.pas' {TextDialogForm},
  WksTextEditorFormUnit in 'WksTextEditorFormUnit.pas' {TextEditorForm},
  WksWordFrameUnit in 'WksWordFrameUnit.pas' {WordFrame: TFrame},
  WksHelpDialogFormUnit in 'WksHelpDialogFormUnit.pas' {HelpDialogForm},
  WksXxxDialogFormUnit in 'WksXxxDialogFormUnit.pas',
  WksBaseDialogFormUnit in 'WksBaseDialogFormUnit.pas' {BaseDialogForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBaseMainForm, BaseMainForm);
  Application.CreateForm(THelpDialogForm, HelpDialogForm);
  Application.Run;
end.
