unit WksAllCtrlTestFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, JvExControls, JvScrollMax, JvExExtCtrls, 
  JvExtComponent, WksRecordEditCtrlUnit, WksHelpDialogFormUnit;

type
  TMainForm = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ConnectButton: TButton;
    DisconnectButton: TButton;
    Memo1: TMemo;
    Panel1: TPanel;
    Splitter1: TSplitter;
    WksRecordEditCtrl1: TWksRecordEditCtrl;
    DBNavigator1: TDBNavigator;
    JvScrollMax1: TJvScrollMax;
    JvScrollMaxBand1: TJvScrollMaxBand;
    HelpSpeedButton: TSpeedButton;
    procedure ConnectButtonClick(Sender: TObject);
    procedure DisconnectButtonClick(Sender: TObject);
    procedure WksRecordEditCtrl1DataLoaded(Sender: TObject);
    procedure HelpSpeedButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.ConnectButtonClick(Sender: TObject);
begin
  ADOTable1.Open;
end;

procedure TMainForm.DisconnectButtonClick(Sender: TObject);
begin
  ADOConnection1.Close;
end;

procedure TMainForm.HelpSpeedButtonClick(Sender: TObject);
begin
  if HelpDialogForm.Visible then
    HelpDialogForm.Hide
  else
    HelpDialogForm.Show;
end;

procedure TMainForm.WksRecordEditCtrl1DataLoaded(Sender: TObject);
begin
  JvScrollMax1.Bands[0].ExpandedHeight := WksRecordEditCtrl1.Top + WksRecordEditCtrl1.VertScrollBar.Range + 6;
end;

end.
