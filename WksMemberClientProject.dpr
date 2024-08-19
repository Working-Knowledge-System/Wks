program WksMemberClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksMemberClientMainFormUnit in 'WksMemberClientMainFormUnit.pas' {MemberMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMemberMainForm, MemberMainForm);
  Application.Run;
end.
