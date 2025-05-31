unit WksInvoiceClientMainFormUnit;

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
  , Vcl.WinXCtrls
  , Vcl.Edge
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
  TInvoiceMainForm = class(TBaseMainForm)
    InvoiceAction: TActionList;
    InvoiceClientDataSet: TClientDataSet;
    InvoiceDBNavigator: TDBNavigator;
    InvoiceDataSource: TDataSource;
    InvoiceIdDBEdit: TDBEdit;
    InvoiceIdLabel: TLabel;
    InvoiceImageList24: TImageList;
    InvoiceJvScrollMaxBand: TJvScrollMaxBand;
    InvoiceObjectIdDBEdit: TDBEdit;
    InvoiceObjectIdLabel: TLabel;
    InvoiceValue1DBEdit: TDBEdit;
    InvoiceValue1Label: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure InvoiceClientDataSetAfterDelete(DataSet: TDataSet);
    procedure InvoiceClientDataSetAfterInsert(DataSet: TDataSet);
    procedure InvoiceClientDataSetAfterPost(DataSet: TDataSet);
    procedure InvoiceClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  InvoiceMainForm: TInvoiceMainForm;
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
procedure TInvoiceMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
  {$ENDREGION}

  {$REGION 'ini'}
//OptionInvoiceSomethingCheckBox.Checked              := gini.BooGet(FObj + '/Something'                 , true );
  {$ENDREGION}

  {$REGION 'property'}
  // kind
//InvoiceKindDBComboBox.Items.Add('');
//for str in TInvoiceRec.InvoiceKindVector do InvoiceKindDBComboBox.Items.Add(str);
  {$ENDREGION}

end;

procedure TInvoiceMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  {$REGION 'ini'}
//gini.BooSet(FObj + '/Something'                 , OptionInvoiceSomethingCheckBox.Checked             );
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TInvoiceMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  // detail
  if InvoiceClientDataSet.State = dsEdit then
    InvoiceDBNavigator.BtnClick(nbPost);
end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TInvoiceMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS
  if InvoiceClientDataSet.Locate('FldObjectId', FId, []) then begin
    InvoiceClientDataSet.Delete;
    if InvoiceClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      InvoiceClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'InvoiceCds'}
procedure TInvoiceMainForm.InvoiceClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if InvoiceClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    InvoiceClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', ['Object']);
  end;
  {$ENDREGION}

end;

procedure TInvoiceMainForm.InvoiceClientDataSetAfterInsert(DataSet: TDataSet);
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

procedure TInvoiceMainForm.InvoiceClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // applyupdatetoremoteserver
  if InvoiceClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    InvoiceClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TInvoiceMainForm.InvoiceClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'detail'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

end.
