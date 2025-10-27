program WksFileClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  MidasLib,
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksFileClientMainFormUnit in 'WksFileClientMainFormUnit.pas' {FileMainForm},
  WksFileSoapMainServiceIntf in 'WksFileSoapMainServiceIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFileMainForm, FileMainForm);
  Application.Run;
end.
