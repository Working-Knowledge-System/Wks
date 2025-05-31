program WksAgentClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksAgentClientMainFormUnit in 'WksAgentClientMainFormUnit.pas' {AgentMainForm},
  WksAgentUnit in 'WksAgentUnit.pas',
  WksPythonUnit in 'WksPythonUnit.pas',
  WksSqlUnit in 'WksSqlUnit.pas',
  WksJslUnit in 'WksJslUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAgentMainForm, AgentMainForm);
  Application.Run;
end.
