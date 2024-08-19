unit WksPageClientMainFormUnit;

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
  Vcl.ToolWin, JvNetscapeSplitter, JvComponentBase, JvNavigationPane,
  JvDBSpinEdit, JvThreadTimer, Vcl.AppEvnts, JvClock, Vcl.Menus;
{$ENDREGION}

{$REGION 'Type'}
type
  TPageMainForm = class(TBaseMainForm)
    PageAction: TActionList;
    PageAuthenticationNeededDBCheckBox: TDBCheckBox;
    PageBottomSpaceJvDBSpinEdit: TJvDBSpinEdit;
    PageBottomSpaceLabel: TLabel;
    PageCenteredDBCheckBox: TDBCheckBox;
    PageClientDataSet: TClientDataSet;
    PageContainerOnDBCheckBox: TDBCheckBox;
    PageContentFixedDBCheckBox: TDBCheckBox;
    PageCssDBSynEdit: TDBSynEdit;
    PageCssTabSheet: TTabSheet;
    PageDBEdit: TDBEdit;
    PageDBNavigator: TDBNavigator;
    PageDataSource: TDataSource;
    PageFlagsJvScrollMaxBand1: TJvScrollMaxBand;
    PageFooterDBSynEdit: TDBSynEdit;
    PageFooterTabSheet: TTabSheet;
    PageHeadDBSynEdit: TDBSynEdit;
    PageHeadTabSheet: TTabSheet;
    PageHeaderDBSynEdit: TDBSynEdit;
    PageHeaderTabSheet: TTabSheet;
    PageIconDBEdit: TDBEdit;
    PageIconLabel: TLabel;
    PageImageList24: TImageList;
    PageJsDBSynEdit: TDBSynEdit;
    PageJsTabSheet: TTabSheet;
    PageJvScrollMaxBand: TJvScrollMaxBand;
    PageLabel: TLabel;
    PageLeftRightSpaceLabel: TLabel;
    PageLeftSpaceJvDBSpinEdit: TJvDBSpinEdit;
    PageMarginJvScrollMaxBand: TJvScrollMaxBand;
    PageMenuDBEdit: TDBEdit;
    PageMenuLabel: TLabel;
    PageObjectIdDBEdit: TDBEdit;
    PageObjectIdLabel: TLabel;
    PagePopupDBEdit: TDBEdit;
    PagePopupLabel: TLabel;
    PageRightSpaceJvDBSpinEdit: TJvDBSpinEdit;
    PageRightSpaceLabel: TLabel;
    PageSpacesResetLabel: TLabel;
    PageSubtitleShowDBCheckBox: TDBCheckBox;
    PageSystemInfoOffDBCheckBox: TDBCheckBox;
    PageTabSheet: TTabSheet;
    PageTestAction: TAction;
    PageTestToolButton: TToolButton;
    PageTitleShowDBCheckBox: TDBCheckBox;
    PageToolBar: TToolBar;
    PageTopNavOffDBCheckBox: TDBCheckBox;
    PageTopSpaceJvDBSpinEdit: TJvDBSpinEdit;
    PageTopSpaceLabel: TLabel;
    PageJsAfterTabSheet: TTabSheet;
    PageJsAfterLabel: TLabel;
    PageJsAfterDBSynEdit: TDBSynEdit;
    CodeJsTopPanel: TPanel;
    CodeCssTopPanel: TPanel;
    CodeHeadTopPanel: TPanel;
    CodeFooterTopPanel: TPanel;
    CodeHeaderTopPanel: TPanel;
    PageJsLabel: TLabel;
    CodeJsAfterTopPanel: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure PostActionExecute(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure PageClientDataSetAfterDelete(DataSet: TDataSet);
    procedure PageClientDataSetAfterInsert(DataSet: TDataSet);
    procedure PageClientDataSetAfterPost(DataSet: TDataSet);
    procedure PageClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure PageTestActionExecute(Sender: TObject);
    procedure PageHeaderDBSynEditChange(Sender: TObject);
    procedure PageFooterDBSynEditChange(Sender: TObject);
    procedure PageHeadDBSynEditChange(Sender: TObject);
    procedure PageCssDBSynEditChange(Sender: TObject);
    procedure PageJsDBSynEditChange(Sender: TObject);
    procedure PageJsAfterDBSynEditChange(Sender: TObject);
    procedure PageHeaderDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PageFooterDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PageHeadDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PageCssDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PageJsDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PageJsAfterDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OptionFoldingLineShowCheckBoxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SynEditsSetup;
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  PageMainForm: TPageMainForm;
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

{$REGION 'Routine'}
procedure TPageMainForm.SynEditsSetup;
begin
  gsyn.Setup(PageHeaderDBSynEdit , Trunc(OptionTabWidthJvSpinEdit.Value), ckHtml, OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(PageFooterDBSynEdit , Trunc(OptionTabWidthJvSpinEdit.Value), ckHtml, OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(PageHeadDBSynEdit   , Trunc(OptionTabWidthJvSpinEdit.Value), ckHtml, OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(PageCssDBSynEdit    , Trunc(OptionTabWidthJvSpinEdit.Value), ckCss , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(PageJsDBSynEdit     , Trunc(OptionTabWidthJvSpinEdit.Value), ckJs  , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(PageJsAfterDBSynEdit, Trunc(OptionTabWidthJvSpinEdit.Value), ckJs  , OptionFoldingLineShowCheckBox.Checked);
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TPageMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
//PageTestToolButton.Visible := false;
  {$ENDREGION}

  {$REGION 'syn'}
  SynEditsSetup;
  {$ENDREGION}

  {$REGION 'property'}
  // pagekind
//PageKindDBComboBox.Items.Add('');
//for str in TPageRec.PageKindVector do PageKindDBComboBox.Items.Add(str);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Center'}
procedure TPageMainForm.PageHeaderDBSynEditChange(Sender: TObject);
begin
  inherited;

  PageHeaderTabSheet.Caption := ifthen(PageHeaderDBSynEdit.Text.IsEmpty, 'Header', 'Header •');
end;

procedure TPageMainForm.PageHeaderDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // stdshorcutsloop
  gsyn.KeyUp(Sender as TDBSynEdit, ckHtml, Key, Shift);
end;

procedure TPageMainForm.PageFooterDBSynEditChange(Sender: TObject);
begin
  inherited;

  PageFooterTabSheet.Caption := ifthen(PageFooterDBSynEdit.Text.IsEmpty, 'Footer', 'Footer •');
end;

procedure TPageMainForm.PageFooterDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // stdshorcutsloop
  gsyn.KeyUp(Sender as TDBSynEdit, ckHtml, Key, Shift);
end;

procedure TPageMainForm.PageHeadDBSynEditChange(Sender: TObject);
begin
  inherited;

  PageHeadTabSheet.Caption := ifthen(PageHeadDBSynEdit.Text.IsEmpty, ' Head', 'Head •');
end;

procedure TPageMainForm.PageHeadDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // stdshorcutsloop
  gsyn.KeyUp(Sender as TDBSynEdit, ckHtml, Key, Shift);
end;

procedure TPageMainForm.PageCssDBSynEditChange(Sender: TObject);
begin
  inherited;

  PageCssTabSheet.Caption := ifthen(PageCssDBSynEdit.Text.IsEmpty, '   Css', ' Css •');
end;

procedure TPageMainForm.PageCssDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // stdshorcutsloop
  gsyn.KeyUp(Sender as TDBSynEdit, ckCss, Key, Shift);
end;

procedure TPageMainForm.PageJsDBSynEditChange(Sender: TObject);
begin
  inherited;

  PageJsTabSheet.Caption := ifthen(PageJsDBSynEdit.Text.IsEmpty, 'Js Before', 'Js Before •');
end;

procedure TPageMainForm.PageJsDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // stdshorcutsloop
  gsyn.KeyUp(Sender as TDBSynEdit, ckJs, Key, Shift);
end;

procedure TPageMainForm.PageJsAfterDBSynEditChange(Sender: TObject);
begin
  inherited;

  PageJsAfterTabSheet.Caption := ifthen(PageJsAfterDBSynEdit.Text.IsEmpty, 'Js After', 'Js After •');
end;

procedure TPageMainForm.PageJsAfterDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // stdshorcutsloop
  gsyn.KeyUp(Sender as TDBSynEdit, ckJs, Key, Shift);
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TPageMainForm.PostActionExecute(Sender: TObject);
begin
  inherited;

  // ... continue from ancestor
  if PageClientDataSet.State = dsEdit then
    PageDBNavigator.BtnClick(nbPost);
end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TPageMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS
  if PageClientDataSet.Locate('FldObjectId', FId, []) then begin
    PageClientDataSet.Delete;
    if PageClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      PageClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'PageActions'}
procedure TPageMainForm.PageTestActionExecute(Sender: TObject);
begin
  inherited;

  TMesRec.NI;
end;
{$ENDREGION}

{$REGION 'PageCds'}
procedure TPageMainForm.PageClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if PageClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    PageClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', ['Object']);
  end;
  {$ENDREGION}

end;

procedure TPageMainForm.PageClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId').Value := FId; // automatic
  DataSet.FieldByName('FldPage'    ).Value := TNamRec.RndInt('Page');
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
  {$ENDREGION}

end;

procedure TPageMainForm.PageClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // applyupdatetoremoteserver
  if PageClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    PageClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TPageMainForm.PageClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'detail'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Option'}
procedure TPageMainForm.OptionFoldingLineShowCheckBoxClick(Sender: TObject);
begin
  inherited;

  SynEditsSetup;
end;
{$ENDREGION}

end.
