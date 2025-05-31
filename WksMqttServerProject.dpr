program WksMqttServerProject;

uses
  Vcl.Forms,
  WksMqttServerMainFormUnit in 'WksMqttServerMainFormUnit.pas' {MainForm},
  WksMqttBaseMainFormtUnit in 'WksMqttBaseMainFormtUnit.pas' {BaseForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
