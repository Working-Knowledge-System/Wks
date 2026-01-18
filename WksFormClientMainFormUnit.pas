unit WksFormClientMainFormUnit;

interface

{$REGION 'Uses'}
uses
    Winapi.Windows
  , Winapi.Messages
  , Winapi.WebView2
  , Winapi.ActiveX
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
    FormValue1DBEdit: TDBEdit;
    FormValue1Label: TLabel;
    FormValue2DBEdit: TDBEdit;
    FormValue2Label: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure FormClientDataSetAfterDelete(DataSet: TDataSet);
    procedure FormClientDataSetAfterInsert(DataSet: TDataSet);
    procedure FormClientDataSetAfterPost(DataSet: TDataSet);
    procedure FormClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
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
procedure TFormMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  {$REGION 'Object'}
  {$ENDREGION}

  {$REGION 'Detail'}
  if not (FormClientDataSet.State = dsBrowse) then
    FormDBNavigator.BtnClick(nbPost);
  {$ENDREGION}

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

{$REGION 'FormCds'}
procedure TFormMainForm.FormClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if FormClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    FormClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', [FObj]);
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

  {$REGION 'applyupdatetoremoteserver'}
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

  {$REGION 'reconcileerror'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

end.
