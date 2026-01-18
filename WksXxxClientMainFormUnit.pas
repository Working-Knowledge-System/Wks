unit WksXxxClientMainFormUnit;

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
  , JvExComCtrls
  , JvExControls
  , JvExExtCtrls
  , JvExMask
  , JvExtComponent
  , JvNetscapeSplitter
  , JvScrollMax
  , JvSpin
  , JvThreadTimer
  , JvDBDateTimePicker
  , SynDBEdit
  , SynEdit
  , VirtualTrees
  , WksLogFrameUnit
  , WksBaseClientMainFormUnit
  , WksRecordEditCtrlUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TXxxMainForm = class(TBaseMainForm)
    XxxAction: TActionList;
    XxxClientDataSet: TClientDataSet;
    XxxDBNavigator: TDBNavigator;
    XxxDataSource: TDataSource;
    XxxImageList24: TImageList;
    XxxJvScrollMaxBand: TJvScrollMaxBand;
    XxxTabSheet: TTabSheet;
    XxxTestAction: TAction;
    XxxTestToolButton: TToolButton;
    XxxToolBar: TToolBar;
    XxxWksRecordEditCtrl: TWksRecordEditCtrl;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure XxxClientDataSetAfterDelete(DataSet: TDataSet);
    procedure XxxClientDataSetAfterInsert(DataSet: TDataSet);
    procedure XxxClientDataSetAfterPost(DataSet: TDataSet);
    procedure XxxClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure XxxTestActionExecute(Sender: TObject);
    procedure XxxWksRecordEditCtrlDataLoaded(Sender: TObject);
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

procedure TXxxMainForm.WmFormAfterShow(var Msg: TMessage);
begin
  // code here will be executed after formshow event happened in the baseform
//ShowMessage('WM_AFTER_SHOW message received 2nd !');
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

  {$REGION 'Object'}
procedure TXxxMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  {$REGION 'Object'}
  {$ENDREGION}

  {$REGION 'Detail'}
  if not (XxxClientDataSet.State = dsBrowse) then
    XxxDBNavigator.BtnClick(nbPost);
  {$ENDREGION}

end;
  {$ENDREGION}

  {$REGION 'Detail'}
procedure TXxxMainForm.XxxTestActionExecute(Sender: TObject);
begin
  inherited;

  TMesRec.NI;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Property'}

  {$REGION 'Object'}
  {$ENDREGION}

  {$REGION 'Detail'}
procedure TXxxMainForm.XxxWksRecordEditCtrlDataLoaded(Sender: TObject);
begin
  inherited;

  XxxJvScrollMaxBand.ExpandedHeight := XxxWksRecordEditCtrl.Top + XxxWksRecordEditCtrl.VertScrollBar.Range + 6;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Cds'}

  {$REGION 'Object'}
procedure TXxxMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS of Xxx
  if XxxClientDataSet.Locate('FldObjectId', FId, []) then begin
    XxxClientDataSet.Delete;
    if XxxClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      XxxClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;

  // ... continue from ancestor DELETING ALL CHILDS of Yyy if any
  {$ENDREGION}

end;
  {$ENDREGION}

  {$REGION 'Detail'}
procedure TXxxMainForm.XxxClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  if XxxClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    XxxClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', [FObj]);
  end;
end;

procedure TXxxMainForm.XxxClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId').Value := FId; // automatic
  DataSet.FieldByName('FldLocalId' ).Value := 1;   // tblmax+1           // \
  DataSet.FieldByName('FldLocalPId').Value := 0;   // ?                  //  |-- need to be removed/updated
//DataSet.FieldByName('FldXxx'     ).Value := TNamRec.RndInt('Xxx');     // /
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
end;

procedure TXxxMainForm.XxxClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  // applyupdatetoremoteserver
  if XxxClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    XxxClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
end;

procedure TXxxMainForm.XxxClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;
  {$ENDREGION}

{$ENDREGION}

end.
