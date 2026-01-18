unit WksEquipmentClientMainFormUnit;

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
  , Vcl.Grids
  , Vcl.DBGrids
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
  , WksRecordEditCtrlUnit
  , WksBaseClientMainFormUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TEquipmentMainForm = class(TBaseMainForm)
    AlarmTabSheet: TTabSheet;
    ChangeTabSheet: TTabSheet;
    CollectionTabSheet: TTabSheet;
    EquipmentAction: TActionList;
    EquipmentClientDataSet: TClientDataSet;
    EquipmentCommercialClientDataSet: TClientDataSet;
    EquipmentCommercialDataSource: TDataSource;
    EquipmentCommercialJvScrollMaxBand: TJvScrollMaxBand;
    EquipmentCommercialWksRecordEditCtrl: TWksRecordEditCtrl;
    EquipmentConfigurationClientDataSet: TClientDataSet;
    EquipmentConfigurationDataSource: TDataSource;
    EquipmentConfigurationJvScrollMaxBand: TJvScrollMaxBand;
    EquipmentConfigurationWksRecordEditCtrl: TWksRecordEditCtrl;
    EquipmentDataSource: TDataSource;
    EquipmentImageList24: TImageList;
    EquipmentJvScrollMaxBand: TJvScrollMaxBand;
    EquipmentProcessClientDataSet: TClientDataSet;
    EquipmentProcessDataSource: TDataSource;
    EquipmentProcessJvScrollMaxBand: TJvScrollMaxBand;
    EquipmentProcessWksRecordEditCtrl: TWksRecordEditCtrl;
    EquipmentTabSheet: TTabSheet;
    EquipmentTestAction: TAction;
    EquipmentTestToolButton: TToolButton;
    EquipmentToolBar: TToolBar;
    EquipmentWksRecordEditCtrl: TWksRecordEditCtrl;
    FailureTabSheet: TTabSheet;
    MaintenanceTabSheet: TTabSheet;
    SpareTabSheet: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure EquipmentClientDataSetAfterDelete(DataSet: TDataSet);
    procedure EquipmentClientDataSetAfterInsert(DataSet: TDataSet);
    procedure EquipmentTestActionExecute(Sender: TObject);
    procedure EquipmentWksRecordEditCtrlDataLoaded(Sender: TObject);
    procedure EquipmentConfigurationWksRecordEditCtrlDataLoaded(Sender: TObject);
    procedure EquipmentProcessWksRecordEditCtrlDataLoaded(Sender: TObject);
    procedure EquipmentCommercialWksRecordEditCtrlDataLoaded(Sender: TObject);
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
  EquipmentMainForm: TEquipmentMainForm;
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
procedure TEquipmentMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
//EquipmentTestToolButton.Visible := false
  {$ENDREGION}

  {$REGION 'ini'}
//OptionEquipmentSomethingCheckBox.Checked              := gini.BooGet(FObj + '/Something'                 , true );
  {$ENDREGION}

  {$REGION 'property'}
  // kind
//EquipmentKindDBComboBox.Items.Add('');
//for str in TEquipmentRec.EquipmentKindVector do EquipmentKindDBComboBox.Items.Add(str);
  {$ENDREGION}

end;

procedure TEquipmentMainForm.WmFormAfterShow(var Msg: TMessage);
begin
  // code here will be executed after formshow event happened in the baseform
//ShowMessage('WM_AFTER_SHOW message received 2nd !');
end;

procedure TEquipmentMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  {$REGION 'ini'}
//gini.BooSet(FObj + '/Something'                 , OptionEquipmentSomethingCheckBox.Checked             );
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}

  {$REGION 'Object'}
procedure TEquipmentMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  {$REGION 'Object'}
  {$ENDREGION}

  {$REGION 'Detail'}
  if not (EquipmentClientDataSet.State = dsBrowse) then
    EquipmentClientDataSet.ApplyUpdates(0);

  if not (EquipmentConfigurationClientDataSet.State = dsBrowse) then
    EquipmentConfigurationClientDataSet.ApplyUpdates(0);

  if not (EquipmentProcessClientDataSet.State = dsBrowse) then
    EquipmentProcessClientDataSet.ApplyUpdates(0);

  if not (EquipmentCommercialClientDataSet.State = dsBrowse) then
    EquipmentCommercialClientDataSet.ApplyUpdates(0);
  {$ENDREGION}

end;
  {$ENDREGION}

  {$REGION 'Detail'}
procedure TEquipmentMainForm.EquipmentTestActionExecute(Sender: TObject);
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
procedure TEquipmentMainForm.EquipmentWksRecordEditCtrlDataLoaded(Sender: TObject);
begin
  inherited;

  EquipmentJvScrollMaxBand.ExpandedHeight := EquipmentWksRecordEditCtrl.Top + EquipmentWksRecordEditCtrl.VertScrollBar.Range + 6;
end;

procedure TEquipmentMainForm.EquipmentCommercialWksRecordEditCtrlDataLoaded(Sender: TObject);
begin
  inherited;

  EquipmentCommercialJvScrollMaxBand.ExpandedHeight := EquipmentCommercialWksRecordEditCtrl.Top + EquipmentCommercialWksRecordEditCtrl.VertScrollBar.Range + 6;
end;

procedure TEquipmentMainForm.EquipmentConfigurationWksRecordEditCtrlDataLoaded(Sender: TObject);
begin
  inherited;

  EquipmentConfigurationJvScrollMaxBand.ExpandedHeight := EquipmentConfigurationWksRecordEditCtrl.Top + EquipmentConfigurationWksRecordEditCtrl.VertScrollBar.Range + 6;
end;

procedure TEquipmentMainForm.EquipmentProcessWksRecordEditCtrlDataLoaded(Sender: TObject);
begin
  inherited;

  EquipmentProcessJvScrollMaxBand.ExpandedHeight := EquipmentProcessWksRecordEditCtrl.Top + EquipmentProcessWksRecordEditCtrl.VertScrollBar.Range + 6;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Cds'}

  {$REGION 'Object'}
procedure TEquipmentMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS of Equipment
  if EquipmentClientDataSet.Locate('FldObjectId', FId, []) then begin
    EquipmentClientDataSet.Delete;
    if EquipmentClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      EquipmentClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;

  // ... continue from ancestor DELETING ALL CHILDS of Yyy if any
  {$ENDREGION}

end;
  {$ENDREGION}

  {$REGION 'Detail'}
procedure TEquipmentMainForm.EquipmentClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if EquipmentClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    EquipmentClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TEquipmentMainForm.EquipmentClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId').Value := FId; // automatic
//DataSet.FieldByName('FldLocalId' ).Value := 1;   // tblmax+1
//DataSet.FieldByName('FldLocalPId').Value := 0;   // ?
  DataSet.FieldByName('FldCode'    ).Value := ObjectDBEdit.Text; // TNamRec.RndInt('CODE')
  DataSet.FieldByName('FldState'   ).Value := 'Active';
//DataSet.FieldByName('FldArea'    ).Value := 'Unknow';
//DataSet.FieldByName('FldBay'     ).Value := 'Unknow';
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
  {$ENDREGION}

end;
  {$ENDREGION}

{$ENDREGION}

end.
