program WksTestProject;

uses
  Vcl.Forms,
  WksTestMainFormUnit in 'WksTestMainFormUnit.pas' {TestMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTestMainForm, TestMainForm);
  Application.Run;
end.
