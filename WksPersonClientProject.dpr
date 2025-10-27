program WksPersonClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  MidasLib,
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksPersonClientMainFormUnit in 'WksPersonClientMainFormUnit.pas' {PersonMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPersonMainForm, PersonMainForm);
  Application.Run;
end.
