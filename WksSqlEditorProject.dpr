program WksSqlEditorProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  WksTextEditorFormUnit in 'WksTextEditorFormUnit.pas' {TextEditorForm},
  WksSqlEditorFormUnit in 'WksSqlEditorFormUnit.pas' {SqlEditorForm};

{$R *.res}
{$I Wks000Inc.inc}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSqlEditorForm, SqlEditorForm);
  Application.Run;
end.
