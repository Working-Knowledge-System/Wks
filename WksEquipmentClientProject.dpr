program WksEquipmentClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  MidasLib,
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksEquipmentClientMainFormUnit in 'WksEquipmentClientMainFormUnit.pas' {EquipmentMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TEquipmentMainForm, EquipmentMainForm);
  Application.Run;
end.
