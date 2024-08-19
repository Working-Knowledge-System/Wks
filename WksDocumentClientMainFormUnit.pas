unit WksDocumentClientMainFormUnit;

interface

{$REGION 'Uses'}
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WksBaseClientMainFormUnit, Data.DB,
  Datasnap.DBClient, Soap.SOAPConn, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, SynEdit, SynDBEdit, Vcl.ComCtrls,
  Vcl.StdCtrls, JvExMask, JvSpin, JvExComCtrls, JvDateTimePicker, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, JvExControls, JvScrollMax, JvExExtCtrls,
  JvExtComponent, WksLogFrameUnit, VirtualTrees, DTDBTreeView, DTClientTree,
  Vcl.ToolWin, JvNetscapeSplitter, JvComponentBase, JvThreadTimer, Vcl.AppEvnts,
  JvClock, Vcl.Menus;
{$ENDREGION}

{$REGION 'Type'}
type
  TDocumentMainForm = class(TBaseMainForm)
    DocumentAction: TActionList;
    DocumentClientDataSet: TClientDataSet;
    DocumentDBEdit: TDBEdit;
    DocumentDBNavigator: TDBNavigator;
    DocumentDataSource: TDataSource;
    DocumentIdDBEdit: TDBEdit;
    DocumentIdLabel: TLabel;
    DocumentImageList24: TImageList;
    DocumentJvScrollMaxBand: TJvScrollMaxBand;
    DocumentKindDBComboBox: TDBComboBox;
    DocumentKindLabel: TLabel;
    DocumentLabel: TLabel;
    DocumentObjectIdDBEdit: TDBEdit;
    DocumentObjectIdLabel: TLabel;
    DocumentPIdDBEdit: TDBEdit;
    DocumentPIdLabel: TLabel;
    DocumentTabSheet: TTabSheet;
    DocumentTestAction: TAction;
    DocumentToolBar: TToolBar;
    DocumentTestToolButton: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure PostActionExecute(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure DocumentClientDataSetAfterDelete(DataSet: TDataSet);
    procedure DocumentClientDataSetAfterInsert(DataSet: TDataSet);
    procedure DocumentClientDataSetAfterPost(DataSet: TDataSet);
    procedure DocumentClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure DocumentTestActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  DocumentMainForm: TDocumentMainForm;
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
procedure TDocumentMainForm.FormCreate(Sender: TObject);
var
  str: string;
begin
  inherited;

  {$REGION 'gui'}
//DocumentTestToolButton.Visible := false;
  {$ENDREGION}

  {$REGION 'property'}
  // documentkind
  DocumentKindDBComboBox.Items.Add('');
  for str in TDocRec.DocKindVector do DocumentKindDBComboBox.Items.Add(str);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TDocumentMainForm.PostActionExecute(Sender: TObject);
begin
  inherited;

  // ... continue from ancestor
  if DocumentClientDataSet.State = dsEdit then
    DocumentDBNavigator.BtnClick(nbPost);
end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TDocumentMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS
  if DocumentClientDataSet.Locate('FldObjectId', FId, []) then begin
    DocumentClientDataSet.Delete;
    if DocumentClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      DocumentClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'DocumentActions'}
procedure TDocumentMainForm.DocumentTestActionExecute(Sender: TObject);
begin
  inherited;

  TMesRec.NI;
end;
{$ENDREGION}

{$REGION 'DocumentCds'}
procedure TDocumentMainForm.DocumentClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if DocumentClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    DocumentClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', ['Object']);
  end;
  {$ENDREGION}

end;

procedure TDocumentMainForm.DocumentClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId'  ).Value := FId; // automatic
  DataSet.FieldByName('FldId'        ).Value := 1;
  DataSet.FieldByName('FldPId'       ).Value := 0;
  DataSet.FieldByName('FldDocument'  ).Value := TNamRec.RndInt('Document');
  DataSet.FieldByName('FldObjectKind').Value := 'Document';
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
  {$ENDREGION}

end;

procedure TDocumentMainForm.DocumentClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // applyupdatetoremoteserver
  if DocumentClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    DocumentClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TDocumentMainForm.DocumentClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'detail'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

end.
