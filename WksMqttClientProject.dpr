program WksMqttClientProject;

uses
  Vcl.Forms,
  WksMqttClientMainFormUnit in 'WksMqttClientMainFormUnit.pas' {MainForm},
  WksMqttBaseMainFormtUnit in 'WksMqttBaseMainFormtUnit.pas' {BaseForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TBaseForm, BaseForm);
  Application.Run;
end.
