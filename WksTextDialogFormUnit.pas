unit WksTextDialogFormUnit;

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
  , Vcl.ActnList
  , Vcl.ImgList
  , Vcl.ToolWin
  , Vcl.Buttons
//, SynEdit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TTextDialogForm = class(TForm)
    MainImageList24: TImageList;
    MainActionList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    LoadAction: TAction;
    SaveAction: TAction;
    ClearAction: TAction;
    TopMainToolBar: TToolBar;
    OkToolButton: TToolButton;
    CancelToolButton: TToolButton;
    LoadToolButton: TToolButton;
    SaveToolButton: TToolButton;
    ClearToolButton: TToolButton;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    ValueMemo: TMemo;
    TopPanel: TPanel;
    HelpSpeedButton: TSpeedButton;
    HelpAction: TAction;
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure LoadActionExecute(Sender: TObject);
    procedure SaveActionExecute(Sender: TObject);
    procedure ClearActionExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure HelpActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute(const IvCaption: string; var IvText: string): boolean;
  end;
{$ENDREGION}

{$REGION 'Var'}
//var
//  TextDialogForm: TTextDialogForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    WksHelpDialogFormUnit
  ;
{$ENDREGION}

{$REGION 'Execute'}
class function TTextDialogForm.Execute(const IvCaption: string; var IvText: string): boolean;
begin
  with TTextDialogForm.Create(nil) do
    try
      Caption := IvCaption;
      ValueMemo.Lines.Text := IvText;

      Result := ShowModal = mrOk; // stop here and an internal loop start then, when ShowModal <> mrNone continue
      if Result then
        IvText := ValueMemo.Lines.Text;
    finally
      Free;
    end;
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TTextDialogForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    CancelAction.Execute // ModalResult := mrCancel
  else if (Key = VK_RETURN) and (ssCtrl in Shift) then // Ctrl+Enter
    OkAction.Execute     // ModalResult := mrOk;
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TTextDialogForm.HelpActionExecute(Sender: TObject);
begin
  THelpDialogForm.Execute('Page', '239');
end;

procedure TTextDialogForm.OkActionExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TTextDialogForm.CancelActionExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TTextDialogForm.ClearActionExecute(Sender: TObject);
begin
  ValueMemo.Clear;
end;

procedure TTextDialogForm.LoadActionExecute(Sender: TObject);
begin
  if not OpenDialog.Execute then
    Exit;

  ValueMemo.Lines.LoadFromFile(OpenDialog.Filename);
end;

procedure TTextDialogForm.SaveActionExecute(Sender: TObject);
begin
  if OpenDialog.Filename <> '' then
    SaveDialog.Filename := OpenDialog.Filename;

  if not SaveDialog.Execute then
    Exit;

  ValueMemo.Lines.SaveToFile(SaveDialog.Filename);
end;
{$ENDREGION}

end.
