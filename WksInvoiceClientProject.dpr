program WksInvoiceClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksInvoiceClientMainFormUnit in 'WksInvoiceClientMainFormUnit.pas' {InvoiceMainForm},
  WksInvoiceUnit in 'WksInvoiceUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TInvoiceMainForm, InvoiceMainForm);
  Application.Run;
end.
