unit WksGridDialogFormUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , System.ImageList
  , System.Actions
  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.ExtCtrls
  , Vcl.StdCtrls
  , Vcl.ComCtrls
  , Vcl.Buttons
  , Vcl.ActnList
  , Vcl.ImgList
  , Data.DB
  , Vcl.Grids
  , Vcl.DBGrids
  , Vcl.ToolWin
  , Datasnap.DBClient
  , Soap.SOAPConn
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TGridDialogForm = class(TForm)
    TopToolBar: TToolBar;
    OkToolButton: TToolButton;
    CancelToolButton: TToolButton;
    MainImageList24: TImageList;
    MainActionList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    LoadAction: TAction;
    SaveAction: TAction;
    ClearAction: TAction;
    TopPanel: TPanel;
    FilterLabel: TLabel;
    FilterEdit: TEdit;
    ValueDBGrid: TDBGrid;
    FilterClearSpeedButton: TSpeedButton;
    SoapConnection1: TSoapConnection;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    HelpSpeedButton: TSpeedButton;
    HelpAction: TAction;
    procedure OkToolButtonClick(Sender: TObject);
    procedure CancelToolButtonClick(Sender: TObject);
    procedure ClearActionExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure HelpActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function  Execute(var IvValue: string; const IvCaption: string): boolean;
  end;
{$ENDREGION}

{$REGION 'Var'}
//var
//  GridDialogForm: TGridDialogForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    WksHelpDialogFormUnit
  ;
{$ENDREGION}

{$REGION 'Execute'}
class function TGridDialogForm.Execute(var IvValue: string; const IvCaption: string): boolean;
begin
  with TGridDialogForm.Create(nil) do
    try
      Caption := IvCaption;
      Result := ShowModal = mrOk;
      if not Result then
        IvValue := ''
      else
        IvValue := GUIDToString(TGUID.NewGuid).Substring(1, 8);
    finally
      Free;
    end;
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TGridDialogForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    CancelAction.Execute // ModalResult := mrCancel
  else if (Key = VK_RETURN) and (ssCtrl in Shift) then // Ctrl+Enter
    OkAction.Execute     // ModalResult := mrOk;
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TGridDialogForm.HelpActionExecute(Sender: TObject);
begin
  THelpDialogForm.Execute('Page', '242');
end;

procedure TGridDialogForm.OkToolButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TGridDialogForm.CancelToolButtonClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TGridDialogForm.ClearActionExecute(Sender: TObject);
begin
  FilterEdit.Clear;
end;
{$ENDREGION}

end.

