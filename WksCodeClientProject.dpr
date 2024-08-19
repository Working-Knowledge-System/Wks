program WksCodeClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksCodeClientMainFormUnit in 'WksCodeClientMainFormUnit.pas' {CodeMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCodeMainForm, CodeMainForm);
  Application.Run;
end.
