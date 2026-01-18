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
  JvDBSpinEdit, JvThreadTimer, Vcl.AppEvnts, JvClock, Vcl.Menus,
  Winapi.WebView2, Winapi.ActiveX, Vcl.Edge, Vcl.WinXCtrls, JvDBDateTimePicker;
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
    PageTitleShowDBCheckBox: TDBCheckBox;
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
    PageImageShowDBCheckBox: TDBCheckBox;
    PageClassDBEdit: TDBEdit;
    PageClassLabel: TLabel;
    PageStyleLabel: TLabel;
    PageStyleDBEdit: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure PageClientDataSetAfterDelete(DataSet: TDataSet);
    procedure PageClientDataSetAfterInsert(DataSet: TDataSet);
    procedure PageClientDataSetAfterPost(DataSet: TDataSet);
    procedure PageClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
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
    procedure PageClientDataSetAfterScroll(DataSet: TDataSet);
    procedure PageClientDataSetAfterRefresh(DataSet: TDataSet);
    procedure PageClientDataSetBeforeScroll(DataSet: TDataSet);
    procedure PageClientDataSetBeforeInsert(DataSet: TDataSet);
    procedure PageClientDataSetBeforePost(DataSet: TDataSet);
    procedure PageClientDataSetBeforeRefresh(DataSet: TDataSet);
    procedure PageClientDataSetAfterCancel(DataSet: TDataSet);
    procedure PageClientDataSetBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PageSynEditsSetup;
    procedure PageTabsUpdate;
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
procedure TPageMainForm.PageSynEditsSetup;
begin
  gsyn.Setup(PageHeaderDBSynEdit , Trunc(OptionTabWidthJvSpinEdit.Value), ckHtml, OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(PageFooterDBSynEdit , Trunc(OptionTabWidthJvSpinEdit.Value), ckHtml, OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(PageHeadDBSynEdit   , Trunc(OptionTabWidthJvSpinEdit.Value), ckHtml, OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(PageCssDBSynEdit    , Trunc(OptionTabWidthJvSpinEdit.Value), ckCss , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(PageJsDBSynEdit     , Trunc(OptionTabWidthJvSpinEdit.Value), ckJs  , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(PageJsAfterDBSynEdit, Trunc(OptionTabWidthJvSpinEdit.Value), ckJs  , OptionFoldingLineShowCheckBox.Checked);
end;

procedure TPageMainForm.PageTabsUpdate;
begin
  PageHeaderTabSheet.Caption  := ifthen(PageHeaderDBSynEdit.Text.IsEmpty , 'Header'   , 'HEADER'   );
  PageFooterTabSheet.Caption  := ifthen(PageFooterDBSynEdit.Text.IsEmpty , 'Footer'   , 'FOOTER'   );
  PageHeadTabSheet.Caption    := ifthen(PageHeadDBSynEdit.Text.IsEmpty   , '  Head'   , '  HEAD'   );
  PageCssTabSheet.Caption     := ifthen(PageCssDBSynEdit.Text.IsEmpty    , '   Css'   , '   CSS'   );
  PageJsTabSheet.Caption      := ifthen(PageJsDBSynEdit.Text.IsEmpty     , 'Js Before', 'JS BEFORE');
  PageJsAfterTabSheet.Caption := ifthen(PageJsAfterDBSynEdit.Text.IsEmpty, 'Js After' , 'JS AFTER' );
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TPageMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
  {$ENDREGION}

  {$REGION 'syn'}
  PageSynEditsSetup;
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

  // notempty
  if PageHeaderDBSynEdit.Text.IsEmpty then
    PageHeaderTabSheet.Caption := TStrRec.StrCapitalize(PageHeaderTabSheet.Caption)
  else
    PageHeaderTabSheet.Caption := UpperCase(PageHeaderTabSheet.Caption);
end;

procedure TPageMainForm.PageHeaderDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // edit
  if not (PageClientDataSet.State in [dsEdit]) then
    PageClientDataSet.Edit;

  // modified
  if not TStrRec.StrEndsWith(PageHeaderTabSheet.Caption, ' ' + CHAR_CONTENT_CHANGED) then
    PageHeaderTabSheet.Caption := PageHeaderTabSheet.Caption + ' ' + CHAR_CONTENT_CHANGED;

  // stdshorcuts
  gsyn.SynEditOnKeyUp(Sender{, ckHtml}, Key, Shift);
end;

procedure TPageMainForm.PageFooterDBSynEditChange(Sender: TObject);
begin
  inherited;

  // notempty
  if PageFooterDBSynEdit.Text.IsEmpty then
    PageFooterTabSheet.Caption := TStrRec.StrCapitalize(PageFooterTabSheet.Caption)
  else
    PageFooterTabSheet.Caption := UpperCase(PageFooterTabSheet.Caption);
end;

procedure TPageMainForm.PageFooterDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // edit
  if not (PageClientDataSet.State in [dsEdit]) then
    PageClientDataSet.Edit;

  // modified
  if not TStrRec.StrEndsWith(PageFooterTabSheet.Caption, ' ' + CHAR_CONTENT_CHANGED) then
    PageFooterTabSheet.Caption := PageFooterTabSheet.Caption + ' ' + CHAR_CONTENT_CHANGED;

  // stdshorcuts
  gsyn.SynEditOnKeyUp(Sender{, ckHtml}, Key, Shift);
end;

procedure TPageMainForm.PageHeadDBSynEditChange(Sender: TObject);
begin
  inherited;

  // notempty
  if PageHeadDBSynEdit.Text.IsEmpty then
    PageHeadTabSheet.Caption := TStrRec.StrCapitalize(PageHeadTabSheet.Caption)
  else
    PageHeadTabSheet.Caption := UpperCase(PageHeadTabSheet.Caption);
end;

procedure TPageMainForm.PageHeadDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // edit
  if not (PageClientDataSet.State in [dsEdit]) then
    PageClientDataSet.Edit;

  // modified
  if not TStrRec.StrEndsWith(PageHeadTabSheet.Caption, ' ' + CHAR_CONTENT_CHANGED) then
    PageHeadTabSheet.Caption := PageHeadTabSheet.Caption + ' ' + CHAR_CONTENT_CHANGED;

  // stdshorcuts
  gsyn.SynEditOnKeyUp(Sender{, ckHtml}, Key, Shift);
end;

procedure TPageMainForm.PageCssDBSynEditChange(Sender: TObject);
begin
  inherited;

  // notempty
  if PageCssDBSynEdit.Text.IsEmpty then
    PageCssTabSheet.Caption := TStrRec.StrCapitalize(PageCssTabSheet.Caption)
  else
    PageCssTabSheet.Caption := UpperCase(PageCssTabSheet.Caption);
end;

procedure TPageMainForm.PageCssDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // edit
  if not (PageClientDataSet.State in [dsEdit]) then
    PageClientDataSet.Edit;

  // modified
  if not TStrRec.StrEndsWith(PageCssTabSheet.Caption, ' ' + CHAR_CONTENT_CHANGED) then
    PageCssTabSheet.Caption := PageCssTabSheet.Caption + ' ' + CHAR_CONTENT_CHANGED;

  // stdshorcuts
  gsyn.SynEditOnKeyUp(Sender{, ckCss}, Key, Shift);
end;

procedure TPageMainForm.PageJsDBSynEditChange(Sender: TObject);
begin
  inherited;

  // notempty
  if PageJsDBSynEdit.Text.IsEmpty then
    PageJsTabSheet.Caption := TStrRec.StrCapitalize(PageJsTabSheet.Caption)
  else
    PageJsTabSheet.Caption := UpperCase(PageJsTabSheet.Caption);
end;

procedure TPageMainForm.PageJsDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // edit
  if not (PageClientDataSet.State in [dsEdit]) then
    PageClientDataSet.Edit;

  // modified
  if not TStrRec.StrEndsWith(PageJsTabSheet.Caption, ' ' + CHAR_CONTENT_CHANGED) then
    PageJsTabSheet.Caption := PageJsTabSheet.Caption + ' ' + CHAR_CONTENT_CHANGED;

  // stdshorcuts
  gsyn.SynEditOnKeyUp(Sender{, ckJs}, Key, Shift);
end;

procedure TPageMainForm.PageJsAfterDBSynEditChange(Sender: TObject);
begin
  inherited;

  // notempty
  if PageJsAfterDBSynEdit.Text.IsEmpty then
    PageJsAfterTabSheet.Caption := TStrRec.StrCapitalize(PageJsAfterTabSheet.Caption)
  else
    PageJsAfterTabSheet.Caption := UpperCase(PageJsAfterTabSheet.Caption);
end;

procedure TPageMainForm.PageJsAfterDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  // edit
  if not (PageClientDataSet.State in [dsEdit]) then
    PageClientDataSet.Edit;

  // modified
  if not TStrRec.StrEndsWith(PageJsAfterTabSheet.Caption, ' ' + CHAR_CONTENT_CHANGED) then
    PageJsAfterTabSheet.Caption := PageJsAfterTabSheet.Caption + ' ' + CHAR_CONTENT_CHANGED;

  // stdshorcuts
  gsyn.SynEditOnKeyUp(Sender{, ckJs}, Key, Shift);
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TPageMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  {$REGION 'Object'}
  {$ENDREGION}

  {$REGION 'Detail'}
  if not (PageClientDataSet.State = dsBrowse) then
    PageDBNavigator.BtnClick(nbPost);
  {$ENDREGION}

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

{$REGION 'PageCds'}
procedure TPageMainForm.PageClientDataSetBeforeScroll(DataSet: TDataSet);
begin
  inherited;

  // tabs
  PageTabsUpdate;
end;

procedure TPageMainForm.PageClientDataSetAfterScroll(DataSet: TDataSet);
begin
  inherited;

  // detail
end;

procedure TPageMainForm.PageClientDataSetBeforeInsert(DataSet: TDataSet);
begin
  inherited;

  // detail
end;

procedure TPageMainForm.PageClientDataSetAfterInsert(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // set
 {DataSet.Edit;
//DataSet.FieldByName('FldObjectId').Value := FId; // automatic
  DataSet.FieldByName('FldPage'    ).Value := TNamRec.RndInt('Page'); *** removed ***
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);}
  {$ENDREGION}

end;

procedure TPageMainForm.PageClientDataSetBeforePost(DataSet: TDataSet);
begin
  inherited;

  // detail
end;

procedure TPageMainForm.PageClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'applyupdatetoremoteserver'}
  if PageClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    PageClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;

  // tabs
  PageTabsUpdate;
  {$ENDREGION}

end;

procedure TPageMainForm.PageClientDataSetBeforeRefresh(DataSet: TDataSet);
begin
  inherited;

  // detail
end;

procedure TPageMainForm.PageClientDataSetAfterRefresh(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // tabs
  PageTabsUpdate;
  {$ENDREGION}

end;

procedure TPageMainForm.PageClientDataSetAfterCancel(DataSet: TDataSet);
begin
  inherited;

  // tabs
  PageTabsUpdate;
end;

procedure TPageMainForm.PageClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  // detail
end;

procedure TPageMainForm.PageClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if PageClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    PageClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TPageMainForm.PageClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'reconcileerror'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Option'}
procedure TPageMainForm.OptionFoldingLineShowCheckBoxClick(Sender: TObject);
begin
  inherited;

  PageSynEditsSetup;
end;
{$ENDREGION}

end.
