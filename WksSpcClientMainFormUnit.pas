unit WksSpcClientMainFormUnit;

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
  TSpcMainForm = class(TBaseMainForm)
    SpcAction: TActionList;
    SpcClientDataSet: TClientDataSet;
    SpcDBNavigator: TDBNavigator;
    SpcDataSource: TDataSource;
    SpcImageList24: TImageList;
    SpcJvScrollMaxBand: TJvScrollMaxBand;
    SpcTabSheet: TTabSheet;
    SpcTestAction: TAction;
    SpcTestToolButton: TToolButton;
    SpcToolBar: TToolBar;
    SpcWksRecordEditCtrl: TWksRecordEditCtrl;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure SpcClientDataSetAfterDelete(DataSet: TDataSet);
    procedure SpcClientDataSetAfterInsert(DataSet: TDataSet);
    procedure SpcClientDataSetAfterPost(DataSet: TDataSet);
    procedure SpcClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure SpcTestActionExecute(Sender: TObject);
    procedure SpcWksRecordEditCtrlDataLoaded(Sender: TObject);
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
  SpcMainForm: TSpcMainForm;
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
procedure TSpcMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
//SpcTestToolButton.Visible := false
  {$ENDREGION}

  {$REGION 'ini'}
//SpcPanel.Width                                  := gini.IntGet(FObj + '/SpcPanelWidth'             , 640  );
//OptionSpcSomethingCheckBox.Checked              := gini.BooGet(FObj + '/Something'                 , true );
  {$ENDREGION}

  {$REGION 'property'}
  // kind
//SpcKindDBComboBox.Items.Add('');
//for str in TSpcRec.SpcKindVector do SpcKindDBComboBox.Items.Add(str);
  {$ENDREGION}

end;

procedure TSpcMainForm.WmFormAfterShow(var Msg: TMessage);
begin
  // code here will be executed after formshow event happened in the baseform
//ShowMessage('WM_AFTER_SHOW message received 2nd !');
end;

procedure TSpcMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  {$REGION 'ini'}
//gini.IntSet(FObj + '/SpcPanelWidth'             , SpcPanel.Width                                 );
//gini.BooSet(FObj + '/Something'                 , OptionSpcSomethingCheckBox.Checked             );
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}

  {$REGION 'Object'}
procedure TSpcMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  {$REGION 'Object'}
  {$ENDREGION}

  {$REGION 'Detail'}
  if not (SpcClientDataSet.State = dsBrowse) then
    SpcDBNavigator.BtnClick(nbPost);
  {$ENDREGION}

end;
  {$ENDREGION}

  {$REGION 'Detail'}
procedure TSpcMainForm.SpcTestActionExecute(Sender: TObject);
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
procedure TSpcMainForm.SpcWksRecordEditCtrlDataLoaded(Sender: TObject);
begin
  inherited;

  SpcJvScrollMaxBand.ExpandedHeight := SpcWksRecordEditCtrl.Top + SpcWksRecordEditCtrl.VertScrollBar.Range + 6;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Cds'}

  {$REGION 'Object'}
procedure TSpcMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS of Spc
  if SpcClientDataSet.Locate('FldObjectId', FId, []) then begin
    SpcClientDataSet.Delete;
    if SpcClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      SpcClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;

  // ... continue from ancestor DELETING ALL CHILDS of Yyy if any
  {$ENDREGION}

end;
  {$ENDREGION}

  {$REGION 'Detail'}
procedure TSpcMainForm.SpcClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  if SpcClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    SpcClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', [FObj]);
  end;
end;

procedure TSpcMainForm.SpcClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId').Value := FId; // automatic
  DataSet.FieldByName('FldLocalId' ).Value := 1;   // tblmax+1           // \
  DataSet.FieldByName('FldLocalPId').Value := 0;   // ?                  //  |-- need to be removed/updated
//DataSet.FieldByName('FldSpc'     ).Value := TNamRec.RndInt('Spc');     // /
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
end;

procedure TSpcMainForm.SpcClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  // applyupdatetoremoteserver
  if SpcClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    SpcClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
end;

procedure TSpcMainForm.SpcClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;
  {$ENDREGION}

{$ENDREGION}

end.
