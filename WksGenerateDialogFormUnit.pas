unit WksGenerateDialogFormUnit;

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
  , Vcl.ImgList
  , Vcl.ToolWin
  , Vcl.ActnList
  , Vcl.Buttons
  , Vcl.DBCtrls
  , Vcl.Grids
  , Vcl.DBGrids
  , Data.DB
  , Datasnap.DBClient
  , JvCsvData
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TGenerateDialogForm = class(TForm)
    TopPanel: TPanel;
    TopToolBar: TToolBar;
    OkToolButton: TToolButton;
    MainImageList24: TImageList;
    MainActionList: TActionList;
    LoadAction: TAction;
    SaveAction: TAction;
    ClearAction: TAction;
    ObjectJvCsvDataSet: TJvCsvDataSet;
    ObjectDataSource: TDataSource;
    ObjectDBGrid: TDBGrid;
    GenerateToolButton: TToolButton;
    GenerateAction: TAction;
    LoadToolButton: TToolButton;
    SaveToolButton: TToolButton;
    ClearToolButton: TToolButton;
    ObjectDBNavigator: TDBNavigator;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    LogLabel: TLabel;
    SaveTemplateToolButton: TToolButton;
    SaveTemplateAction: TAction;
    CloseAction: TAction;
    HelpAction: TAction;
    HelpSpeedButton: TSpeedButton;
    OkAction: TAction;
    CloseToolButton: TToolButton;
    procedure GenerateActionExecute(Sender: TObject);
    procedure LoadActionExecute(Sender: TObject);
    procedure SaveActionExecute(Sender: TObject);
    procedure ClearActionExecute(Sender: TObject);
    procedure ObjectDBGridTitleClick(Column: TColumn);
    procedure SaveTemplateActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure HelpActionExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FObj: string;
    FParentId: integer;
    FAffected: integer;
    FObjCds: TClientDataSet;
    FSortAsc: boolean;
  public
    { Public declarations }
    class function  Execute(IvObj: string; IvParentId: integer; IvCds: TClientDataSet; var IvFbk: string; const IvCaption: string): boolean;
  end;
{$ENDREGION}

{$REGION 'Var'}
//var
//  GenerateDialogForm: TGenerateDialogForm;
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
class function TGenerateDialogForm.Execute(IvObj: string; IvParentId: integer; IvCds: TClientDataSet; var IvFbk: string; const IvCaption: string): boolean;
begin
  with TGenerateDialogForm.Create(nil) do
    try
      Caption := IvCaption;
      OpenDialog.FileName := Format('%sGenerate.csv', [IvObj]);
      SaveDialog.FileName := Format('%sGenerate.csv', [IvObj]);
      ObjectJvCsvDataSet.Open;

      FObj := IvObj;
      FParentId := IvParentId;
      FObjCds := IvCds;
      FSortAsc := true;

      Result := ShowModal = mrOk;
      if not Result then
        IvFbk := 'New objects created'
      else
        IvFbk := 'No objects created';
    finally
      Free;
    end;
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TGenerateDialogForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    CloseAction.Execute // ModalResult := mrCancel
  else if (Key = VK_RETURN) and (ssCtrl in Shift) then // Ctrl+Enter
    OkAction.Execute     // ModalResult := mrOk;
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TGenerateDialogForm.HelpActionExecute(Sender: TObject);
begin
  THelpDialogForm.Execute('Page', '839');
end;

procedure TGenerateDialogForm.CloseActionExecute(Sender: TObject);
begin
  if FAffected > 0 then
    ModalResult := mrOk
  else
    ModalResult := mrCancel;
end;

procedure TGenerateDialogForm.ClearActionExecute(Sender: TObject);
begin
  ObjectJvCsvDataSet.DeleteRows(0, ObjectJvCsvDataSet.RecordCount);
end;

procedure TGenerateDialogForm.LoadActionExecute(Sender: TObject);
begin
  if not OpenDialog.Execute then
    Exit;

  ObjectJvCsvDataSet.LoadFromFile(OpenDialog.Filename);
end;

procedure TGenerateDialogForm.SaveActionExecute(Sender: TObject);
begin
  if OpenDialog.Filename <> '' then
    SaveDialog.Filename := OpenDialog.Filename;

  if not SaveDialog.Execute then
    Exit;

  ObjectJvCsvDataSet.SaveToFile(SaveDialog.Filename);

  TMesRec.I('Data saved to file');
end;

procedure TGenerateDialogForm.SaveTemplateActionExecute(Sender: TObject);
begin
  ;
  TMesRec.I('Template CSV file saved to %s');
end;

procedure TGenerateDialogForm.GenerateActionExecute(Sender: TObject);
var
  fbk: string;
  idn: integer;
  bkm: TBookmark;
begin
  if TAskRec.No('Ready to generate %d new objects... Continue?', [ObjectJvCsvDataSet.RecordCount]) then
    Exit;

  Screen.Cursor := crHourGlass;
  FObjCds.DisableControls;
  bkm := FObjCds.GetBookmark;
  try
    FAffected := 0;
    ObjectJvCsvDataSet.First;
    while not ObjectJvCsvDataSet.Eof do begin
      // next
      Inc(FAffected);

      // idnext
      if not TObjRec.IdNextRio(FObj, idn, fbk) then begin // *** this should "lock" the idnext numer on the server untill it is effectively used ***
        FObjCds.Delete; // Abort ?
        TMesRec.W(fbk);
        Exit;
      end;

      if ObjectJvCsvDataSet.FieldByName('FldObject').AsString.Trim.IsEmpty then begin
        ObjectJvCsvDataSet.Next;
        TMesRec.W('Insert %d skipped, Object is empty', [FAffected]);
        Continue;
      end;

      FObjCds.Insert;
      FObjCds.Edit;

      // setup standard
      TObjRec.ObjDstRecordSetup(
        TDataset(FObjCds)
      , idn
      , FParentId
      , FObj
      , null
      , ObjectJvCsvDataSet.FieldByName('FldObject').AsString
      , ObjectJvCsvDataSet.FieldByName('FldTitle').Value
      , null //ObjectJvCsvDataSet.FieldByName('FldSubTitle').Value
      , ObjectJvCsvDataSet.FieldByName('FldDescription').Value
      , ObjectJvCsvDataSet.FieldByName('FldOrder').Value
      );

      // setup specific
      FObjCds.FieldByName('FldData1'           ).Value := ObjectJvCsvDataSet.FieldByName('FldData1').Value;
      FObjCds.FieldByName('FldData2'           ).Value := ObjectJvCsvDataSet.FieldByName('FldData2').Value;
      FObjCds.FieldByName('FldData3'           ).Value := ObjectJvCsvDataSet.FieldByName('FldData3').Value;
      FObjCds.FieldByName('FldData4'           ).Value := ObjectJvCsvDataSet.FieldByName('FldData4').Value;

      FObjCds.Post;
      FObjCds.ApplyUpdates(0);
      LogLabel.Caption := Format('New %s object %d has been created (%d of %d)', [FObj, idn, FAffected, ObjectJvCsvDataSet.RecordCount]);

      Application.ProcessMessages;
      Sleep(200);

      ObjectJvCsvDataSet.Next;
    end;
  finally
    FObjCds.GotoBookmark(bkm);
    FObjCds.EnableControls;
    Screen.Cursor := crDefault;
  end;

  Sleep(500);
  LogLabel.Caption := Format('%d %s object(s) created', [FAffected, FObj]);
end;

procedure TGenerateDialogForm.ObjectDBGridTitleClick(Column: TColumn);
begin
  ObjectJvCsvDataSet.Sort(Column.Field.FieldName, FSortAsc);
  FSortAsc := not FSortAsc;
end;
{$ENDREGION}

end.
