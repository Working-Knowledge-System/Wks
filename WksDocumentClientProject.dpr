program WksDocumentClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksDocumentClientMainFormUnit in 'WksDocumentClientMainFormUnit.pas' {DocumentMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDocumentMainForm, DocumentMainForm);
  Application.Run;
end.
