program WksTaskClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksTaskClientMainFormUnit in 'WksTaskClientMainFormUnit.pas' {TaskMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTaskMainForm, TaskMainForm);
  Application.Run;
end.
