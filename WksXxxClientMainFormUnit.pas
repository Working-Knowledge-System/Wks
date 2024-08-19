unit WksXxxClientMainFormUnit;

interface

{$REGION 'Uses'}
uses
    Winapi.Windows
  , Winapi.Messages
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
  , Data.DB
  , Datasnap.DBClient
  , Soap.SOAPConn
  , DTClientTree
  , DTDBTreeView
  , JvClock
  , JvComponentBase
  , JvDateTimePicker
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
  TXxxMainForm = class(TBaseMainForm)
    XxxAction: TActionList;
    XxxClientDataSet: TClientDataSet;
    XxxDBNavigator: TDBNavigator;
    XxxDataSource: TDataSource;
    XxxIdDBEdit: TDBEdit;
    XxxIdLabel: TLabel;
    XxxImageList24: TImageList;
    XxxJvScrollMaxBand: TJvScrollMaxBand;
    XxxObjectIdDBEdit: TDBEdit;
    XxxObjectIdLabel: TLabel;
    XxxPIdDBEdit: TDBEdit;
    XxxPIdLabel: TLabel;
    XxxTabSheet: TTabSheet;
    XxxTestAction: TAction;
    XxxTestToolButton: TToolButton;
    XxxToolBar: TToolBar;
    XxxValue1DBEdit: TDBEdit;
    XxxValue1Label: TLabel;
    XxxValue2DBEdit: TDBEdit;
    XxxValue2Label: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure PostActionExecute(Sender: TObject);
    procedure XxxClientDataSetAfterDelete(DataSet: TDataSet);
    procedure XxxClientDataSetAfterInsert(DataSet: TDataSet);
    procedure XxxClientDataSetAfterPost(DataSet: TDataSet);
    procedure XxxClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure XxxTestActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  XxxMainForm: TXxxMainForm;
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
procedure TXxxMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
//XxxTestToolButton.Visible := false
  {$ENDREGION}

  {$REGION 'ini'}
//OptionXxxSomethingCheckBox.Checked              := gini.BooGet(FObj + '/Something'                 , true );
  {$ENDREGION}

  {$REGION 'property'}
  // kind
//XxxKindDBComboBox.Items.Add('');
//for str in TXxxRec.XxxKindVector do XxxKindDBComboBox.Items.Add(str);
  {$ENDREGION}

end;

procedure TXxxMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  {$REGION 'ini'}
//gini.BooSet(FObj + '/Something'                 , OptionXxxSomethingCheckBox.Checked             );
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TXxxMainForm.PostActionExecute(Sender: TObject);
begin
  inherited;

  // ... continue from ancestor
  if XxxClientDataSet.State = dsEdit then
    XxxDBNavigator.BtnClick(nbPost);
end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TXxxMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS
  if XxxClientDataSet.Locate('FldObjectId', FId, []) then begin
    XxxClientDataSet.Delete;
    if XxxClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      XxxClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'XxxActions'}
procedure TXxxMainForm.XxxTestActionExecute(Sender: TObject);
begin
  inherited;

  TMesRec.NI;
end;
{$ENDREGION}

{$REGION 'XxxCds'}
procedure TXxxMainForm.XxxClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if XxxClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    XxxClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', ['Object']);
  end;
  {$ENDREGION}

end;

procedure TXxxMainForm.XxxClientDataSetAfterInsert(DataSet: TDataSet);
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

procedure TXxxMainForm.XxxClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // applyupdatetoremoteserver
  if XxxClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    XxxClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TXxxMainForm.XxxClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'detail'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

end.
