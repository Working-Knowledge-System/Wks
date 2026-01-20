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
var
  csv: TJvCsvDataSet;
begin
  if OpenDialog.Filename <> '' then
    SaveDialog.Filename := 'AccountTemplate.csv';

  if not SaveDialog.Execute then
    Exit;

  csv := TJvCsvDataSet.Create(nil);

// $ = string
// % = integer
// & = floating
// @ = datetime as YYYY/MM/DD HH:MM:SS
// # = Hex-Ascii Timestamp (A93F38C9) seconds since Jan 1, 1970 GMT
// ^ = Hex-Ascii Timestamp (A93F38CP) corrected to local timezone
// ! = Boolean Field (0 in csv file=false, not 0 = true, blank = NULL)
// ~ = UTF8
  csv.CsvFieldDef := '''
   FldId:%
  ,FldPId:%
  ,FldId8:$
  ,FldOrder:%
  ,FldRev:%
  ,FldRouteIdCsv:$
  ,FldCreated:@
  ,FldUpdated :@
  ,FldExpire:@
  ,FldAuthor:$
  ,FldOwnerCsv:$
  ,FldUpdatedBy:$
  ,FldToOrganization:$
  ,FldToDepartment:$
  ,FldToArea:$
  ,FldToTeam:$
  ,FldToMember:$
  ,FldToJobGradeMin:%
  ,FldObjectKind:$
  ,FldContentKind:$
  ,FldDataKind:$
  ,FldGroup:$
  ,FldState:$
  ,FldTitle:$
  ,FldSubtitle:$
  ,FldDescription:$
  ,FldBgColor:$
  ,FldFgColor:$
  ,FldHidden:!
  ,FldEncrypted:!
  ,FldPersist:!
  ,FldImage:$
  ,FldContentPrev:$
  ,FldContent:$
  ,FldNote:$
  ,FldData:$
  ,FldData1:$
  ,FldData2:$
  ,FldData3:$
  ,FldData4:$
  ,FldObject:$
  ,FldEditorCaret:$
  ,FldEditorFolding:$
  ''';

//  csv.FieldDefs.Add('FldId'             , ftInteger ,   0, false);
//  csv.FieldDefs.Add('FldPId'            , ftInteger ,   0, false);
//  csv.FieldDefs.Add('FldId8'            , ftString  ,   8, false);
//  csv.FieldDefs.Add('FldOrder'          , ftInteger ,   0, false);
//  csv.FieldDefs.Add('FldRev'            , ftInteger ,   0, false);
//  csv.FieldDefs.Add('FldRouteIdCsv'     , ftString  ,  64, false);
//  csv.FieldDefs.Add('FldCreated'        , ftDateTime,   0, false);
//  csv.FieldDefs.Add('FldUpdated '       , ftDateTime,   0, false);
//  csv.FieldDefs.Add('FldExpire'         , ftDateTime,   0, false);
//  csv.FieldDefs.Add('FldAuthor'         , ftString  ,  32, false);
//  csv.FieldDefs.Add('FldOwnerCsv'       , ftString  , 256, false);
//  csv.FieldDefs.Add('FldUpdatedBy'      , ftString  ,  32, false);
//  csv.FieldDefs.Add('FldToOrganization' , ftString  ,  32, false);
//  csv.FieldDefs.Add('FldToDepartment'   , ftString  ,  32, false);
//  csv.FieldDefs.Add('FldToArea'         , ftString  ,  32, false);
//  csv.FieldDefs.Add('FldToTeam'         , ftString  ,  32, false);
//  csv.FieldDefs.Add('FldToMember'       , ftString  ,  32, false);
//  csv.FieldDefs.Add('FldToJobGradeMin'  , ftInteger ,   0, false);
//  csv.FieldDefs.Add('FldObjectKind'     , ftString  ,  16, false);
//  csv.FieldDefs.Add('FldContentKind'    , ftString  ,  16, false);
//  csv.FieldDefs.Add('FldDataKind'       , ftString  ,  16, false);
//  csv.FieldDefs.Add('FldGroup'          , ftString  ,  32, false);
//  csv.FieldDefs.Add('FldState'          , ftString  ,  32, false);
//  csv.FieldDefs.Add('FldTitle'          , ftString  , 256, false);
//  csv.FieldDefs.Add('FldSubtitle'       , ftString  , 256, false);
//  csv.FieldDefs.Add('FldDescription'    , ftString  ,1024, false);
//  csv.FieldDefs.Add('FldBgColor'        , ftString  ,   8, false);
//  csv.FieldDefs.Add('FldFgColor'        , ftString  ,   8, false);
//  csv.FieldDefs.Add('FldHidden'         , ftBoolean ,   0, false);
//  csv.FieldDefs.Add('FldEncrypted'      , ftBoolean ,   0, false);
//  csv.FieldDefs.Add('FldPersist'        , ftBoolean ,   0, false);
//  csv.FieldDefs.Add('FldImage'          , ftStream  ,   0, false);
//  csv.FieldDefs.Add('FldContentPrev'    , ftString  ,8000, false);
//  csv.FieldDefs.Add('FldContent'        , ftString  ,8000, false);
//  csv.FieldDefs.Add('FldNote'           , ftString  ,8000, false);
//  csv.FieldDefs.Add('FldData'           , ftString  ,8000, false);
//  csv.FieldDefs.Add('FldData1'          , ftString  , 256, false);
//  csv.FieldDefs.Add('FldData2'          , ftString  , 256, false);
//  csv.FieldDefs.Add('FldData3'          , ftString  , 256, false);
//  csv.FieldDefs.Add('FldData4'          , ftString  , 256, false);
//  csv.FieldDefs.Add('FldObject'         , ftString  , 256, false);
//  csv.FieldDefs.Add('FldEditorCaret'    , ftString  ,  32, false);
//  csv.FieldDefs.Add('FldEditorFolding'  , ftString  ,8000, false);

  csv.FileName := SaveDialog.Filename;
  csv.LoadsFromFile := false;
  csv.Open;
  csv.First;
  csv.SaveToFile(SaveDialog.Filename);
  csv.Free;

  TMesRec.I('Template CSV file saved to %s', [SaveDialog.Filename]);
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
