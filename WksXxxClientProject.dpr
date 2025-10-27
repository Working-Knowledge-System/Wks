program WksXxxClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  MidasLib,
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksXxxClientMainFormUnit in 'WksXxxClientMainFormUnit.pas' {XxxMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TXxxMainForm, XxxMainForm);
  Application.Run;
end.
