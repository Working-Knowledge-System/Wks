program WksAgentClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  MidasLib,
  Vcl.Forms,
  WksAgentUnit in 'WksAgentUnit.pas',
  WksPythonUnit in 'WksPythonUnit.pas',
  WksJslUnit in 'WksJslUnit.pas',
  WksSqlUnit in 'WksSqlUnit.pas',
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksAgentClientMainFormUnit in 'WksAgentClientMainFormUnit.pas' {AgentMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAgentMainForm, AgentMainForm);
  Application.Run;
end.
