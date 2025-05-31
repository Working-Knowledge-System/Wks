unit WksCodeClientMainFormUnit;

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
  JvClock, Vcl.Menus, Winapi.WebView2, Winapi.ActiveX, Vcl.Edge, Vcl.WinXCtrls;
{$ENDREGION}

{$REGION 'Type'}
type
  TCodeMainForm = class(TBaseMainForm)
    CodeAction: TActionList;
    CodeClientDataSet: TClientDataSet;
    CodeDBNavigator: TDBNavigator;
    CodeDataSource: TDataSource;
    CodeImageList24: TImageList;
    CodeJvScrollMaxBand: TJvScrollMaxBand;
    CodeObjectIdDBEdit: TDBEdit;
    CodeObjectIdLabel: TLabel;
    CodeOutputDirectoryDBEdit: TDBEdit;
    CodeOutputDirectoryLabel: TLabel;
    CodeOutputFileNameDBEdit: TDBEdit;
    CodeOutputFileNameLabel: TLabel;
    CodeReturnAsDBComboBox: TDBComboBox;
    CodeReturnAsLabel: TLabel;
    CodeReturnMimeTypeDBComboBox: TDBComboBox;
    CodeReturnMimeTypeLabel: TLabel;
    CodeRunCommandDBEdit: TDBEdit;
    CodeRunCommandLabel: TLabel;
    CodeSaveAction: TAction;
    CodeSaveToolButton: TToolButton;
    CodeTabSheet: TTabSheet;
    CodeToolBar: TToolBar;
    OptionCodeJvScrollMaxBand: TJvScrollMaxBand;
    OptionCodeSaveAfterPostCheckBox: TCheckBox;
    OptionCodeDirCreateIfNotExixtsCheckBox: TCheckBox;
    CodeOutputToLabel: TLabel;
    CodeOutputToDBComboBox: TDBComboBox;
    CodeRunToolButton: TToolButton;
    CodeRunAction: TAction;
    CodeSaveBranchToolButton: TToolButton;
    CodeSaveBranchAction: TAction;
    CodeHeaderAndFooterOffDBCheckBox: TDBCheckBox;
    CodeCommentRemoveDBCheckBox: TDBCheckBox;
    CodeLinesEmptyRemoveDBCheckBox: TDBCheckBox;
    CodeOutputProdDirectoryDBEditLabel: TLabel;
    CodeOutputProdDirectoryDBEdit: TDBEdit;
    CodeOutputProdDirectorySaveDBEditLabel: TLabel;
    CodeDescriptionBlockAddDBCheckBox: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure CodeClientDataSetAfterDelete(DataSet: TDataSet);
    procedure CodeClientDataSetAfterInsert(DataSet: TDataSet);
    procedure CodeClientDataSetAfterPost(DataSet: TDataSet);
    procedure CodeClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure CodeSaveActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CodeRunActionExecute(Sender: TObject);
    procedure ObjectClientDataSetAfterPost(DataSet: TDataSet);
    procedure CodeSaveBranchActionExecute(Sender: TObject);
    procedure CodeOutputDirectoryLabelClick(Sender: TObject);
    procedure CodeOutputProdDirectorySaveDBEditLabelClick(Sender: TObject);
    procedure CodeOutputProdDirectoryDBEditLabelClick(Sender: TObject);
  private
    { Private declarations }
    FOutputToChache: string;
    FOutputDirectoryChache: string;
    procedure CodeSave(IvTo: string; IvWithChilds: boolean = false); // IvTo = Dev, Test, Prod
  public
    { Public declarations }
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  CodeMainForm: TCodeMainForm;
{$ENDREGION}

implementation

{$REGION 'Uses'}
{$R *.dfm}

uses
    System.StrUtils
  , System.DateUtils
  , System.Types
  , Vcl.RecError // reconcileerrors
  , superobject
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Form'}
procedure TCodeMainForm.FormCreate(Sender: TObject);
//var
//  str: string;
begin
  inherited;

  {$REGION 'gui'}
  {$ENDREGION}

  {$REGION 'ini'}
  OptionCodeDirCreateIfNotExixtsCheckBox.Checked  := gini.BooGet(FObj + '/DirCreateIfNotExixts'      , true );
  OptionCodeSaveAfterPostCheckBox.Checked         := gini.BooGet(FObj + '/SaveAfterPost'             , true );
  {$ENDREGION}

  {$REGION 'property'}
  // codekind
//CodeKindDBComboBox.Items.Add('');
//for str in TCodeRec.CodeKindVector do CodeKindDBComboBox.Items.Add(str);
  {$ENDREGION}

end;

procedure TCodeMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  {$REGION 'ini'}
  gini.BooSet(FObj + '/DirCreateIfNotExixts'      , OptionCodeDirCreateIfNotExixtsCheckBox.Checked );
  gini.BooSet(FObj + '/SaveAfterPost'             , OptionCodeSaveAfterPostCheckBox.Checked        );
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TCodeMainForm.ActionPostActionExecute(Sender: TObject);
begin
  inherited;

  // detail
  if CodeClientDataSet.State = dsEdit then
    CodeDBNavigator.BtnClick(nbPost);
end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TCodeMainForm.ObjectClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'savetofile'}
  if OptionCodeSaveAfterPostCheckBox.Checked then
    CodeSaveAction.Execute;
  {$ENDREGION}

end;

procedure TCodeMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not FChildsDeleteOk then
    Exit;

  {$REGION 'object'}
  // ... continue from ancestor
  {$ENDREGION}

  {$REGION 'detail'}
  // ... continue from ancestor DELETING ALL CHILDS
  if CodeClientDataSet.Locate('FldObjectId', FId, []) then begin
    CodeClientDataSet.Delete;
    if CodeClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
    else begin
      CodeClientDataSet.Refresh; // IMPORTAN
      LogFrame.Log('%s detail data deleted from remote server', [FObj]);
    end;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'CodeActions'}
procedure TCodeMainForm.CodeSave(IvTo: string; IvWithChilds: boolean);
var
  okk, hch, wch, dba, hfo, cor, ler: boolean; // ok, haschild, withchild, descriptionblockadd, headerandfooteroff, commentremove, linesemptyremove
  i, blz{, ask}: integer; // count, blockcount, askreply
  oid, nam, ext, odi, od2, ofn, of2, cod, co2{, kin, mim}, fsp, jva, fbk: string; // id, codename, ext, outputdir, outputfilename, code(single/tree), kind, mime, filespec, jsonvalue
  stl: TStringList;
  jso, jsi: ISuperObject; // jsonobj, jsonitem
begin
  inherited;

  // savetonotdefined
  if CodeOutputToDBComboBox.ItemIndex <= 0 {nointent} then begin
    LogFrame.Log('"Output to" is undefined, please select if you want to save the output to the "local computer" or to the "remote server", the code "%s" will not be saved to disk', [nam], clRed);
    Beep;
    Exit;
  end;

  // outputdir
  if SameText('Dev', IvTo) then
    odi := CodeClientDataSet.FieldByName('FldOutputDirectory').AsString
  else if SameText('Prod', IvTo) then
    odi := CodeClientDataSet.FieldByName('FldOutputProdDirectory').AsString;
  if giis.Nx(odi) then begin
    LogFrame.Log('Output %s directory not defined, the code "%s" will not be saved to disk', [IvTo, nam], clRed);
    Beep;
    Exit;
  end;
  odi := grva.RvaDsRecord(odi, [ObjectClientDataSet, CodeClientDataSet]);

  // id
  oid := ObjectClientDataSet.FieldByName('FldId').AsString;

  // haschilds
  hch := TVstRec.NodeHasChildren(ObjectDTClientTree.FocusedNode);
  if hch then begin
  //ask := TAskRec.YesNoCancel('Selected node has children.'+#10#13+'Save the node with childs?'+#10#13+'If No, only the selected single node will be saved.');
  //if (ask = mrNone) or (ask = mrCancel) then begin
  //  LogFrame.Log('User cancelled "Save" action', clWebOrange);
  //  Exit;
  //end else if ask = mrYes then begin
  //  LogFrame.Log('Save node with childs');
  //  wch := true;
  //end else begin
  //  LogFrame.Log('Save only selected node');
  //  wch := false;
  //end;
    wch := IvWithChilds;
  end else
    wch := false;

  // codename
  nam := ObjectClientDataSet.FieldByName('FldObject').AsString;

  // ext
  ext := TPatRec.Ext(nam);
  if giis.Nx(ext) then begin
    ext := ObjectClientDataSet.FieldByName('FldContentKind').AsString;
    ext := TPatRec.ExtEnsure(ext);
  end;
  if giis.Nx(ext) then begin
    LogFrame.Log('Extension or kind not defined, the code "%s" will not be saved to disk', [nam], clRed);
    Exit;
  end;

  // outputdir
  if not DirectoryExists(odi) then
    if not OptionCodeDirCreateIfNotExixtsCheckBox.Checked then begin
      LogFrame.Log('OutputDirectory %s does not exists in the filesystem, the code "%s" will not be saved to disk', [odi, nam], clRed);
      Exit;
    end else begin
      if not TFsyRec.DirForce(odi, fbk) then
        TMesRec.W(fbk)
      else
        LogFrame.Log('OutputDirectory %s does not exists, created now on the fly', [odi], clWebOrange);
    end;

  // outputfilename
  ofn := CodeClientDataSet.FieldByName('FldOutputFileName').AsString;
  if giis.Nx(ofn) then begin
    LogFrame.Log('Outputfilename not defined, use codename "%s"', [nam], clWebOrange);
    ofn := nam;
  end;
  if not TPatRec.ExtHas(ofn) then
    ofn := ofn + ext;
  ofn := grva.RvaDsRecord(ofn, [ObjectClientDataSet, CodeClientDataSet]);

  // filespec
  fsp := TPatRec.DelimiterEnsure(odi) + ofn;

  // options
  dba := CodeDescriptionBlockAddDBCheckBox.Checked;
  hfo := CodeHeaderAndFooterOffDBCheckBox.Checked;
  cor := CodeCommentRemoveDBCheckBox.Checked;
  ler := CodeLinesEmptyRemoveDBCheckBox.Checked;

  // saveremote
  if CodeOutputToDBComboBox.ItemIndex = 1 {server} then begin
    okk := TDbaRec.ObjTreeContentRioSave('Code', oid, wch, dba, hfo, cor, ler, fsp, blz, nam, cod, fbk);
    LogFrame.Log(fbk, okk);
    Exit;
  end;

  // codefromdbario
  okk := TDbaRec.ObjTreeContentRio('Code', oid, wch, dba, hfo, cor, ler{, fsp}, blz, nam, cod, fbk);
  if not okk then begin
    TMesRec.W(fbk);
    LogFrame.Log(fbk, clRed);
    Exit;
  end;

  // savelocally
  stl := TStringList.Create;
  try
    // no-data --> no-template --> single-file-save
    if giis.Nx(ObjectDataDBSynEdit.Text) then begin
      stl.Text := cod;

      // save
      stl.SaveToFile(fsp);
      LogFrame.Log('Code saved to local computer: %s', [fsp], clGreen);

    // yes-data --> code-is-template --> multi-files-save
    end else begin
      jso := SO(ObjectDataDBSynEdit.Text);
      i := 0;
      for jsi in jso['Items'] do begin
        Inc(i);

        // rvitemjson
        jva := jsi.AsString;

        // outputdir
        od2 := grva.RvaJson(odi, jva, [rfReplaceAll]);

        // outputfilename
        of2 := grva.RvaJson(ofn, jva, [rfReplaceAll]);

        // filespec
        fsp := TPatRec.DelimiterEnsure(od2) + of2;

        // compile
        co2 := grva.RvaJson(cod, jva, [rfReplaceAll]);
        stl.Text := co2;

        // save
        stl.SaveToFile(fsp);
        LogFrame.Log('Code%d "%s" saved to local computer: %s', [i, jsi.AsString, fsp], clGreen);
      end;
    end;
  finally
    stl.Free;
  end;
end;

procedure TCodeMainForm.CodeSaveActionExecute(Sender: TObject);
begin
  inherited;

  CodeSave('Dev', false);
end;

procedure TCodeMainForm.CodeSaveBranchActionExecute(Sender: TObject);
begin
  inherited;

  CodeSave('Dev', true);
end;

procedure TCodeMainForm.CodeRunActionExecute(Sender: TObject);
var
  oid: integer;
  cna, ruc{, exr, wdi}: string; // codename, runcommand, execresult, workingdir
begin
  inherited;

  // idname
  oid := ObjectClientDataSet.FieldByName('FldId').AsInteger;
  cna := ObjectClientDataSet.FieldByName('FldObject').AsString;

  // runcommand
  ruc := CodeClientDataSet.FieldByName('FldRunCommand').AsString;
  if giis.Nx(ruc) then begin
    LogFrame.Log('Unable to execute "%s" code, "Run Command" not yet defined, exit', [cna], clRed);
    Exit;
  end;

  // confirm
  if TAskRec.No('You are about to execute "%s" code.  Continue?', [cna]) then
    Exit;
  LogFrame.Log('Running code %d %s', [oid, cna]);

  // rv
  ruc := grva.RvaDsRecord(ruc, [ObjectClientDataSet, CodeClientDataSet]);

  // commented
  if ruc.StartsWith('--')  then
    LogFrame.Log('Unable to executed commented: %s', [ruc])

  // run
  else begin
    try
      TWinRec.WinProcessRun(ruc);
      LogFrame.Log('Executed: %s', [ruc]);
    except
      on e: Exception do
        LogFrame.Log(e);
    end;
  end;
end;
{$ENDREGION}

{$REGION 'CodeCds'}
procedure TCodeMainForm.CodeClientDataSetAfterDelete(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  if CodeClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s detail data from remote server', [FObj])
  else begin
    CodeClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data deleted from remote server', ['Object']);
  end;
  {$ENDREGION}

end;

procedure TCodeMainForm.CodeClientDataSetAfterInsert(DataSet: TDataSet);
var
  pmv: array of string; // prompts
  vav: array of string; // values
begin
  inherited;

  {$REGION 'detail'}
    // askvectors
  SetLength(pmv, 2);
  SetLength(vav, Length(pmv));

  // objectdefault
  pmv[0] := 'Output To'       ; vav[0] := giif.NxD(FOutputToChache       , 'LocalComputer');
  pmv[1] := 'Output Directory'; vav[1] := giif.NxD(FOutputDirectoryChache, ''             );

  // chache
  FOutputToChache        := vav[0];
  FOutputDirectoryChache := vav[1];

  // set
  DataSet.Edit;
//DataSet.FieldByName('FldObjectId'       ).Value := FId; // automatic
  DataSet.FieldByName('FldReturnAs'       ).Value := null;
  DataSet.FieldByName('FldReturnMimeType' ).Value := null;
  DataSet.FieldByName('FldOutputTo'       ).Value := FOutputToChache;
  DataSet.FieldByName('FldOutputDirectory').Value := FOutputDirectoryChache;
  DataSet.FieldByName('FldOutputFileName' ).Value := null;
  DataSet.FieldByName('FldRunCommand'     ).Value := null;
  DataSet.Post;
  LogFrame.Log('%s data initialized', [FObj]);
  {$ENDREGION}

end;

procedure TCodeMainForm.CodeClientDataSetAfterPost(DataSet: TDataSet);
begin
  inherited;

  {$REGION 'detail'}
  // applyupdatetoremoteserver
  if CodeClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s detail to remote server', [FObj])
  else begin
    CodeClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s detail data saved to remote server', [FObj]);
  end;
  {$ENDREGION}

end;

procedure TCodeMainForm.CodeClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;

  {$REGION 'detail'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Property'}
procedure TCodeMainForm.CodeOutputDirectoryLabelClick(Sender: TObject);
var
  pat, fbk: string;
begin
  inherited;

  pat := CodeOutputDirectoryDBEdit.Text;
  LogFrame.LogOrMsg(fbk, TFsyRec.DirOpen(pat, fbk));
end;

procedure TCodeMainForm.CodeOutputProdDirectoryDBEditLabelClick(Sender: TObject);
var
  pat, fbk: string;
begin
  inherited;

  pat := CodeOutputProdDirectoryDBEdit.Text;
  LogFrame.LogOrMsg(fbk, TFsyRec.DirOpen(pat, fbk));
end;

procedure TCodeMainForm.CodeOutputProdDirectorySaveDBEditLabelClick( Sender: TObject);
begin
  inherited;

  CodeSave('Prod', false);
end;
{$ENDREGION}

end.
