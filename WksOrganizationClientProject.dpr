program WksOrganizationClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksOrganizationClientMainFormUnit in 'WksOrganizationClientMainFormUnit.pas' {OrganizationMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TOrganizationMainForm, OrganizationMainForm);
  Application.Run;
end.
