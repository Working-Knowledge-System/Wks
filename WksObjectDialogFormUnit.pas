unit WksObjectDialogFormUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
//  , Winapi.WebView2          // edge webview
//  , Winapi.EdgeUtils         // CreateCoreWebView2EnvironmentWithOptions
  , System.SysUtils
  , System.Variants
  , System.Classes
//  , System.Win.ComObj        // edge webview
  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.Forms
  , Vcl.Dialogs
  , System.Actions
  , Vcl.ActnList
  , System.ImageList
  , Vcl.ImgList
  , Vcl.StdCtrls
  , Vcl.ComCtrls
  , Vcl.ToolWin
  , Vcl.OleCtrls
  , Vcl.ExtCtrls
  , Vcl.Buttons
  , SHDocVw
  , SynEdit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TObjectDialogForm = class(TForm)
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
    MainPageControl: TPageControl;
    ContentTabSheet: TTabSheet;
    ViewTabSheet: TTabSheet;
    ContentSynEdit: TSynEdit;
    ViewWebBrowser: TWebBrowser;
    RefreshToolButton: TToolButton;
    UpdateToolButton: TToolButton;
    RefreshAction: TAction;
    UpdateAction: TAction;
    TopPanel: TPanel;
    HelpAction: TAction;
    HelpSpeedButton: TSpeedButton;
    procedure OkActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure UpdateActionExecute(Sender: TObject);
    procedure ClearActionExecute(Sender: TObject);
    procedure LoadActionExecute(Sender: TObject);
    procedure SaveActionExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure HelpActionExecute(Sender: TObject);
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
  //ObjectDialogForm: TObjectDialogForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    Wks000Unit
  , WksHelpDialogFormUnit
  ;
{$ENDREGION}

{$REGION 'Execute'}
class function TObjectDialogForm.Execute(IvObj: string; IvIdOrPath: string{; var IvContent: string}; const IvViewOnly: boolean): boolean;
var
  vnt: variant;
begin
  with TObjectDialogForm.Create(nil) do
    try
      // F
      FObj := IvObj;
      FIdOrPath := IvIdOrPath;

      // form
      Caption := Format('Object %s (%s) Dialog Form', [IvObj, IvIdOrPath]);

      // gui
      UpdateAction.Visible := false;
      ContentSynEdit.Clear;       // loading will be performed by Refresh
    //gsyn.Setup(ContentSynEdit{, IvTabWidth, IvTCodKindEnum, IvFoldingLineShow});

      // load
      RefreshAction.Execute;

      // show
      Result := ShowModal = mrOk; // stop here and an internal loop start then, when ShowModal <> mrNone continue;
      if not Result then
      //IvContent := ''
      else begin
        // upload
        vnt := ContentSynEdit.Text;
        TObjRec.FieldSetRio(FObj, FIdOrPath, 'FldContent', vnt);

        // return also the same uploaded value (but not authoritative)
        //IvContent := ContentSynEdit.Text;
      end;
    finally
      Free;
    end;
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TObjectDialogForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    CloseAction.Execute // ModalResult := mrCancel
  else if (Key = VK_RETURN) and (ssCtrl in Shift) then // Ctrl+Enter
    OkAction.Execute     // ModalResult := mrOk;
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TObjectDialogForm.HelpActionExecute(Sender: TObject);
begin
  THelpDialogForm.Execute('Page', '226');
end;

procedure TObjectDialogForm.OkActionExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TObjectDialogForm.CloseActionExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TObjectDialogForm.ClearActionExecute(Sender: TObject);
begin
  ContentSynEdit.Clear;
end;

procedure TObjectDialogForm.RefreshActionExecute(Sender: TObject);
var
  obj: TObjRec;
  vnt: variant;
begin
  obj.FieldGetRio(FObj, FIdOrPath, 'FldContent', vnt, null);
  ContentSynEdit.Text := VarToStr(vnt);
end;

procedure TObjectDialogForm.UpdateActionExecute(Sender: TObject);
var
  obj: TObjRec;
  vnt: variant;
begin
  vnt := ContentSynEdit.Text;
  obj.FieldSetRio(FObj, FIdOrPath, 'FldContent', vnt);
  ShowMessage('Data saved to server');
end;

procedure TObjectDialogForm.LoadActionExecute(Sender: TObject);
begin
  if not OpenDialog.Execute then
    Exit;

  ContentSynEdit.Lines.LoadFromFile(OpenDialog.Filename);
end;

procedure TObjectDialogForm.SaveActionExecute(Sender: TObject);
begin
  if OpenDialog.Filename <> '' then
    SaveDialog.Filename := OpenDialog.Filename;

  if not SaveDialog.Execute then
    Exit;

  ContentSynEdit.Lines.SaveToFile(SaveDialog.Filename);
end;
{$ENDREGION}

end.
