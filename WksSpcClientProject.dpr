program WksSpcClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  MidasLib,
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksSpcClientMainFormUnit in 'WksSpcClientMainFormUnit.pas' {SpcMainForm},
  WksSpcSoapMainServiceIntf in 'WksSpcSoapMainServiceIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSpcMainForm, SpcMainForm);
  Application.Run;
end.
