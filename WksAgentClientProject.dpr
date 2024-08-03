program WksAgentClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksAgentClientMainFormUnit in 'WksAgentClientMainFormUnit.pas' {AgentMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAgentMainForm, AgentMainForm);
  Application.Run;
end.
