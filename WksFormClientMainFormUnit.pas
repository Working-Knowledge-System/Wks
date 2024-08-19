unit WksFormClientMainFormUnit;

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
  TFormMainForm = class(TBaseMainForm)
    FormAction: TActionList;
    FormClientDataSet: TClientDataSet;
    FormDBNavigator: TDBNavigator;
    FormDataSource: TDataSource;
    FormIdDBEdit: TDBEdit;
    FormIdLabel: TLabel;
    FormImageList24: TImageList;
    FormJvScrollMaxBand: TJvScrollMaxBand;
    FormObjectIdDBEdit: TDBEdit;
    FormObjectIdLabel: TLabel;
    FormPIdDBEdit: TDBEdit;
    FormPIdLabel: TLabel;
    FormTabSheet: TTabSheet;
    FormTestAction: TAction;
    FormTestToolButton: TToolButton;
    FormToolBar: TToolBar;
    FormValue1DBEdit: TDBEdit;
    FormValue1Label: TLabel;
    FormValue2DBEdit: TDBEdit;
    FormValue2Label: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClientDataSetAfterDelete(DataSet: TDataSet);
    procedure FormClientDataSetAfterInsert(DataSet: TDataSet);
    procedure FormClientDataSetAfterPost(DataSet: TDataSet);
    procedure FormClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormTestActionExecute(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure PostActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  FormMainForm: TFormMainForm;
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
procedure TFormMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
//FormTestToolButton.Visible := false
  {$ENDREGION}

  {$REGION 'ini'}
//OptionFormSomethingCheckBox.Checked              := gini.BooGet(FObj + '/Something'                 , true );
  {$ENDREGION}

  {$REGION 'property'}
  // kind
//FormKindDBComboBox.Items.Add('');
//for str in TFormRec.FormKindVector do FormKindDBComboBox.Items.Add(str);
  {$ENDREGION}

end;

procedure TFormMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  {$REGION 'ini'}
//gini.BooSet(FObj + '/Something'                 , OptionFormSomethingCheckBox.Checked             );
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFormMainForm.PostActionExecute(Sender: TObject);
begin
  inherited;

  // ... continue from ancestor
  if FormClientDataSet.State = dsEdit then
    FormDBNavigator.BtnClick(nbPost);
end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TFormMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS
  if FormClientDataSet.Locate('FldObjectId', FId, []) then begin
    FormClientDataSet.Delete;
    if FormClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      FormClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'FormActions'}
procedure TFormMainForm.FormTestActionExecute(Sender: TObject);
begin
  inherited;

  TMesRec.NI;
end;
{$ENDREGION}

{$REGION 'FormCds'}
procedure TFormMainForm.FormClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if FormClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    FormClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', ['Object']);
  end;
  {$ENDREGION}

end;

procedure TFormMainForm.FormClientDataSetAfterInsert(DataSet: TDataSet);
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

procedure TFormMainForm.FormClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // applyupdatetoremoteserver
  if FormClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    FormClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TFormMainForm.FormClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'detail'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

end.
