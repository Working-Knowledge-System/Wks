program WksPageClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  MidasLib,
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksPageClientMainFormUnit in 'WksPageClientMainFormUnit.pas' {PageMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPageMainForm, PageMainForm);
  Application.Run;
end.
