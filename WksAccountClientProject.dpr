program WksAccountClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksAccountClientMainFormUnit in 'WksAccountClientMainFormUnit.pas' {AccountMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAccountMainForm, AccountMainForm);
  Application.Run;
end.
