program WksReportClientProject;

{$R 'Wks000Res.res' 'Wks000Res.rc'}

uses
  Vcl.Forms,
  WksBaseClientMainFormUnit in 'WksBaseClientMainFormUnit.pas' {BaseMainForm},
  WksReportClientMainFormUnit in 'WksReportClientMainFormUnit.pas' {ReportMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TReportMainForm, ReportMainForm);
  Application.Run;
end.
