program WksMqttBaseProject;

uses
  Vcl.Forms,
  WksMqttBaseMainFormtUnit in 'WksMqttBaseMainFormtUnit.pas' {BaseForm},
  WksMqttTypesUnit in 'WksMqttTypesUnit.pas',
  WksMqttUtilsUnit in 'WksMqttUtilsUnit.pas',
  WksMqttServerUnit in 'WksMqttServerUnit.pas',
  WksMqttClientUnit in 'WksMqttClientUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBaseForm, BaseForm);
  Application.Run;
end.
