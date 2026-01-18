program WksAllCtrlTestProject;

uses
  Vcl.Forms,
  WksAllCtrlTestFormUnit in 'WksAllCtrlTestFormUnit.pas' {MainForm},
  WksBaseDialogFormUnit in 'WksBaseDialogFormUnit.pas' {BaseDialogForm},
  WksHelpDialogFormUnit in 'WksHelpDialogFormUnit.pas' {HelpDialogForm},
  WksListDialogFormUnit in 'WksListDialogFormUnit.pas' {ListDialogForm},
  WksTextDialogFormUnit in 'WksTextDialogFormUnit.pas' {TextDialogForm},
  WksXxxDialogFormUnit in 'WksXxxDialogFormUnit.pas' {XxxDialogForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(THelpDialogForm, HelpDialogForm);
  Application.Run;
end.
