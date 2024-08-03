program WksSystemClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksSystemClientMainFormUnit in 'WksSystemClientMainFormUnit.pas' {SystemMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSystemMainForm, SystemMainForm);
  Application.Run;
end.
