unit WksBaseDialogFormUnit;

interface

{$REGION 'Help'}
{
  Base form for all XxxDialogForm forms
}
{$ENDREGION}

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , System.Actions
  , System.ImageList
  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.ActnList
  , Vcl.ImgList
  , Vcl.ComCtrls
  , Vcl.ToolWin
  , Vcl.Buttons
  , Vcl.ExtCtrls
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TBaseDialogForm = class(TForm)
    TopMainToolBar: TToolBar;
    OkToolButton: TToolButton;
    CloseToolButton: TToolButton;
    ClearToolButton: TToolButton;
    LoadToolButton: TToolButton;
    SaveToolButton: TToolButton;
    MainImageList24: TImageList;
    MainActionList: TActionList;
    OkAction: TAction;
    CloseAction: TAction;
    LoadAction: TAction;
    SaveAction: TAction;
    ClearAction: TAction;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    RefreshToolButton: TToolButton;
    UpdateToolButton: TToolButton;
    RefreshAction: TAction;
    UpdateAction: TAction;
    TopPanel: TPanel;
    HelpAction: TAction;
    HelpSpeedButton: TSpeedButton;
    AddAction: TAction;
    AddToolButton: TToolButton;
    RemoveAction: TAction;
    RemoveToolButton: TToolButton;
    procedure OkActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure UpdateActionExecute(Sender: TObject);
    procedure ClearActionExecute(Sender: TObject);
    procedure LoadActionExecute(Sender: TObject);
    procedure SaveActionExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure HelpActionExecute(Sender: TObject);
    procedure AddActionExecute(Sender: TObject);
    procedure RemoveActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FObj: string;
    FIdOrPath: string;
  public
    { Public declarations }
    class function  Execute(IvObj: string; IvIdOrPath: string{; var IvContent: string}; const IvViewOnly: boolean = false): boolean;
  end;
{$ENDREGION}

{$REGION 'Var'}
//var
  //BaseDialogForm: TBaseDialogForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

//uses
//  Wks000Unit
//    WksHelpDialogFormUnit
//  ;
{$ENDREGION}

{$REGION 'Execute'}
class function TBaseDialogForm.Execute(IvObj: string; IvIdOrPath: string{; var IvContent: string}; const IvViewOnly: boolean): boolean;
var
  vnt: variant;
begin
  with TBaseDialogForm.Create(nil) do
    try
      // F
      FObj := IvObj;
      FIdOrPath := IvIdOrPath;

      // form
      Caption := Format('Object %s (%s) Dialog Form', [IvObj, IvIdOrPath]);

      // gui
      UpdateAction.Visible := false;
    //ContentSynEdit.Clear;       // loading will be performed by Refresh
    //gsyn.Setup(ContentSynEdit{, IvTabWidth, IvTCodKindEnum, IvFoldingLineShow});

      // load
      RefreshAction.Execute;

      // show
      Result := ShowModal = mrOk; // stop here and an internal loop start then, when ShowModal <> mrNone continue;

      // return
      if not Result then
      //IvContent := ''

      else begin
        // upload
      //vnt := ContentSynEdit.Text;
      //TObjRec.FieldSetRio(FObj, FIdOrPath, 'FldContent', vnt);

        // return also the same uploaded value (but not authoritative)
        //IvContent := ContentSynEdit.Text;
      end;
    finally
      Free;
    end;
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TBaseDialogForm.FormCreate(Sender: TObject);
begin
  CloseAction.Visible   := false;
  RefreshAction.Visible := false;
  AddAction.Visible     := false;
  RemoveAction.Visible  := false;
  UpdateAction.Visible  := false;
  ClearAction.Visible   := false;
  LoadAction.Visible    := false;
  SaveAction.Visible    := false;
end;

procedure TBaseDialogForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    CloseAction.Execute // ModalResult := mrCancel
  else if (Key = VK_RETURN) and (ssCtrl in Shift) then // Ctrl+Enter
    OkAction.Execute     // ModalResult := mrOk;
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TBaseDialogForm.HelpActionExecute(Sender: TObject);
begin
  //THelpDialogForm.Execute('Page', '839');
end;

procedure TBaseDialogForm.OkActionExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TBaseDialogForm.CloseActionExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TBaseDialogForm.ClearActionExecute(Sender: TObject);
begin
//Memo.Clear;
end;

procedure TBaseDialogForm.AddActionExecute(Sender: TObject);
begin
  ;
end;

procedure TBaseDialogForm.RemoveActionExecute(Sender: TObject);
begin
  ;
end;

procedure TBaseDialogForm.RefreshActionExecute(Sender: TObject);
begin
  ShowMessage('Data loaded from server');
end;

procedure TBaseDialogForm.UpdateActionExecute(Sender: TObject);
begin
  ShowMessage('Data saved to server');
end;

procedure TBaseDialogForm.LoadActionExecute(Sender: TObject);
begin
  if not OpenDialog.Execute then
    Exit;

//Memo.Lines.LoadFromFile(OpenDialog.Filename);
end;

procedure TBaseDialogForm.SaveActionExecute(Sender: TObject);
begin
  if OpenDialog.Filename <> '' then
    SaveDialog.Filename := OpenDialog.Filename;

  if not SaveDialog.Execute then
    Exit;

//Memo.Lines.SaveToFile(SaveDialog.Filename);
end;
{$ENDREGION}

end.
