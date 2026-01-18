unit WksFileClientMainFormUnit;

interface

{$REGION 'Uses'}
uses
    Winapi.Windows
  , Winapi.Messages
  , Winapi.ActiveX
  , Winapi.WebView2
  , System.Actions
  , System.Classes
  , System.ImageList
  , System.SysUtils
  , System.Variants
  , Vcl.ActnList
  , Vcl.AppEvnts
  , Vcl.Buttons
  , Vcl.ComCtrls
  , Vcl.Controls
  , Vcl.DBCtrls
  , Vcl.Dialogs
  , Vcl.ExtCtrls
  , Vcl.Forms
  , Vcl.Graphics
  , Vcl.ImgList
  , Vcl.Mask
  , Vcl.Menus
  , Vcl.StdCtrls
  , Vcl.ToolWin
  , Vcl.Edge
  , Vcl.WinXCtrls
  , Data.DB
  , Datasnap.DBClient
  , Soap.SOAPConn
  , DTClientTree
  , DTDBTreeView
  , JvClock
  , JvComponentBase
  , JvDateTimePicker
  , JvDBDateTimePicker
  , JvExComCtrls
  , JvExControls
  , JvExExtCtrls
  , JvExMask
  , JvExtComponent
  , JvNetscapeSplitter
  , JvScrollMax
  , JvSpin
  , JvThreadTimer
  , SynDBEdit
  , SynEdit
  , VirtualTrees
  , WksLogFrameUnit
  , WksBaseClientMainFormUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TFileMainForm = class(TBaseMainForm)
    FileAction: TActionList;
    FileDBNavigator: TDBNavigator;
    FileIdDBEdit: TDBEdit;
    FileIdLabel: TLabel;
    FileImageList24: TImageList;
    FileJvScrollMaxBand: TJvScrollMaxBand;
    FileObjectIdDBEdit: TDBEdit;
    FileObjectIdLabel: TLabel;
    FilePIdDBEdit: TDBEdit;
    FilePIdLabel: TLabel;
    FileValue1DBEdit: TDBEdit;
    FileValue1Label: TLabel;
    FileValue2DBEdit: TDBEdit;
    FileValue2Label: TLabel;
    FileDataSource: TDataSource;
    FileClientDataSet: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure FileClientDataSetAfterDelete(DataSet: TDataSet);
    procedure FileClientDataSetAfterInsert(DataSet: TDataSet);
    procedure FileClientDataSetAfterPost(DataSet: TDataSet);
    procedure FileClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
  private
    { Private declarations }
    // winmessages
    procedure WmFormAfterShow(var Msg: TMessage); message WM_AFTER_SHOW; // thiggered also from the baseform
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  FileMainForm: TFileMainForm;
{$ENDREGION}

implementation

{$REGION 'Uses'}
{$R *.dfm}

uses
    System.StrUtils
  , System.DateUtils
  , System.Types
  , Vcl.RecError // reconcileerrors
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Form'}
procedure TFileMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
  {$ENDREGION}

  {$REGION 'ini'}
//OptionFileSomethingCheckBox.Checked              := gini.BooGet(FObj + '/Something'                 , true );
  {$ENDREGION}

  {$REGION 'property'}
  // kind
//FileKindDBComboBox.Items.Add('');
//for str in TFileRec.FileKindVector do FileKindDBComboBox.Items.Add(str);
  {$ENDREGION}

end;

procedure TFileMainForm.WmFormAfterShow(var Msg: TMessage);
begin
  // code here will be executed after formshow event happened in the baseform
//ShowMessage('WM_AFTER_SHOW message received 2nd !');
end;

procedure TFileMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  {$REGION 'ini'}
//gini.BooSet(FObj + '/Something'                 , OptionFileSomethingCheckBox.Checked             );
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFileMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  {$REGION 'Object'}
  {$ENDREGION}

  {$REGION 'Detail'}
  if not (FileClientDataSet.State = dsBrowse) then
    FileDBNavigator.BtnClick(nbPost);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TFileMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS
//  if FileClientDataSet.Locate('FldObjectId', FId, []) then begin
//    FileClientDataSet.Delete;
//    if FileClientDataSet.ApplyUpdates(0) > 0 then
//      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
//    else begin
//      FileClientDataSet.Refresh; // IMPORTAN
//      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
//    end;
//  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'FileCds'}
procedure TFileMainForm.FileClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
//  if FileClientDataSet.ApplyUpdates(0) > 0 then
//    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
//  else begin
//    FileClientDataSet.Refresh; // IMPORTAN
//    LogFrame.Log('%s detail data deleted from remote server', [FObj]);
//  end;
  {$ENDREGION}

end;

procedure TFileMainForm.FileClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId').Value := FId; // automatic
  DataSet.FieldByName('FldId'      ).Value := 1;                         // \
  DataSet.FieldByName('FldPId'     ).Value := 0;                         //  |__ need to be removed/updated
  DataSet.FieldByName('FldValue1'  ).Value := TNamRec.RndInt('Value1');  //  |
  DataSet.FieldByName('FldValue2'  ).Value := TNamRec.RndInt('Value2');  // /
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
  {$ENDREGION}

end;

procedure TFileMainForm.FileClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'applyupdatetoremoteserver'}
//  if FileClientDataSet.ApplyUpdates(0) > 0 then
//    TMesRec.I('Unable to save %s detail to remote server', [FObj])
//  else begin
//    FileClientDataSet.Refresh; // IMPORTAN
//    LogFrame.Log('%s detail data saved to remote server', [FObj]);
//  end;
  {$ENDREGION}

end;

procedure TFileMainForm.FileClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'reconcileerror'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

end.
