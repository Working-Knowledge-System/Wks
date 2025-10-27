program WksInvoiceClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  MidasLib,
  Vcl.Forms,
  WksInvoiceUnit in 'WksInvoiceUnit.pas',
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksInvoiceClientMainFormUnit in 'WksInvoiceClientMainFormUnit.pas' {InvoiceMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TInvoiceMainForm, InvoiceMainForm);
  Application.Run;
end.
