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
  JvClock, Vcl.Menus, Winapi.WebView2, Winapi.ActiveX, Vcl.Edge, Vcl.WinXCtrls
  , Wks000Unit;
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
    CodeReturnAsDBComboBox: TDBComboBox;
    CodeReturnAsLabel: TLabel;
    CodeReturnMimeTypeDBComboBox: TDBComboBox;
    CodeReturnMimeTypeLabel: TLabel;
    CodeRunCommandDBEdit: TDBEdit;
    CodeSaveItemAction: TAction;
    CodeSaveItemToolButton: TToolButton;
    CodeTabSheet: TTabSheet;
    CodeToolBar: TToolBar;
    OptionCodeJvScrollMaxBand: TJvScrollMaxBand;
    OptionCodeSaveAfterPostCheckBox: TCheckBox;
    OptionCodeDirCreateIfNotExixtsCheckBox: TCheckBox;
    CodeRunToolButton: TToolButton;
    CodeRunAction: TAction;
    CodeSaveBranchToolButton: TToolButton;
    CodeSaveBranchAction: TAction;
    CodeSaveChildsAction: TAction;
    CodeSaveChildsToolButton: TToolButton;
    CodeOutputJvScrollMaxBand: TJvScrollMaxBand;
    CodeOutputDevDirectoryLabel: TLabel;
    CodeOutputFileNameLabel: TLabel;
    CodeOutputProdDirectoryLabel: TLabel;
    CodeOutputDevDirectoryDBEdit: TDBEdit;
    CodeOutputFileNameDBEdit: TDBEdit;
    CodeOutputProdDirectoryDBEdit: TDBEdit;
    CodeRunCommandLabel: TLabel;
    CodeOutputTestDirectoryLabel: TLabel;
    CodeOutputTestDirectoryDBEdit: TDBEdit;
    CodeOutputProdSaveLabel: TLabel;
    CodeOutputTestSaveLabel: TLabel;
    CodeOutputDevSaveLabel: TLabel;
    CoseGapToolButton: TToolButton;
    CodeTopPanel: TPanel;
    CodeEnvComboBox: TComboBox;
    CodeSaveToComboBox: TComboBox;
    CodeSaveLabel: TLabel;
    CodeHeaderAndFooterOffDBCheckBox: TDBCheckBox;
    CodeCommentRemoveDBCheckBox: TDBCheckBox;
    CodeLinesEmptyRemoveDBCheckBox: TDBCheckBox;
    CodeDescriptionBlockAddDBCheckBox: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure CodeClientDataSetAfterDelete(DataSet: TDataSet);
    procedure CodeClientDataSetAfterInsert(DataSet: TDataSet);
    procedure CodeClientDataSetAfterPost(DataSet: TDataSet);
    procedure CodeClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure CodeSaveItemActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CodeRunActionExecute(Sender: TObject);
    procedure ObjectClientDataSetAfterPost(DataSet: TDataSet);
    procedure CodeSaveBranchActionExecute(Sender: TObject);
    procedure CodeOutputDevDirectoryLabelClick(Sender: TObject);
    procedure CodeOutputProdSaveLabelClick(Sender: TObject);
    procedure CodeOutputProdDirectoryLabelClick(Sender: TObject);
    procedure CodeSaveChildsActionExecute(Sender: TObject);
    procedure CodeOutputTestSaveLabelClick(Sender: TObject);
    procedure CodeOutputDevSaveLabelClick(Sender: TObject);
    procedure CodeOutputTestDirectoryLabelClick(Sender: TObject);
  private
    { Private declarations }
    FOutputToChache: string;
    FOutputDirectoryChache: string;
    function  CodeOutputEnv: string; // Dev, Test, Prod
    function  CodeSaveItem  ({IvId: integer;} IvEnv: string; var IvFbk: TFbk2Rec): boolean;
    function  CodeSaveChilds({IvId: integer;} IvEnv: string; var IvFbk: TFbk2Rec): boolean;
    function  CodeSaveBranch({IvId: integer;} IvEnv: string; var IvFbk: TFbk2Rec): boolean;
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
  , System.Math
  , System.RegularExpressions
  , Vcl.RecError // reconcileerrors
  , superobject
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
  CodeEnvComboBox.ItemIndex                       := gini.IntGet(FObj + '/CodeEnv'                   , 0    );
  CodeSaveToComboBox.ItemIndex                    := gini.IntGet(FObj + '/CodeSaveTo'                , 0    ); CodeSaveToComboBox.Enabled := false;
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
  gini.IntSet(FObj + '/CodeEnv'                   , CodeEnvComboBox.ItemIndex                      );
  gini.IntSet(FObj + '/CodeSaveTo'                , CodeSaveToComboBox.ItemIndex                   );
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
    CodeSaveItemAction.Execute;
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
function  TCodeMainForm.CodeOutputEnv: string;
begin
  Result := CodeEnvComboBox.Items.KeyNames[CodeEnvComboBox.ItemIndex];
end;

function  TCodeMainForm.CodeSaveItem({IvId: integer;} IvEnv: string; var IvFbk: TFbk2Rec): boolean;
var
  i, oid: integer;
  ist: boolean;                                 // istemplate? (item "content" is a template/stencil so must be compiled with json in "data", the json can be multi-colors so might generate many content-compiled outputs)
  ona, ofn, fin{, fix}, fsp, odi, fbk: string;  // objname, outputfilename, filename, fileext, filespec, outputdir
  jso, jsi: ISuperObject; jva: string;          // jsonobj, jsonitem, jsonvalue
  dba{, hfo}, cor, ler: boolean;                  // descriptionblockadd, headerandfooteroff, commentremove, linesemptyremove

procedure filesave(IvFsp: string; IvRvDsDo, IvRvJsonDo: boolean);
var
  tik: TTicRec;
  sbu: TSbuRec;
  oid, pid, ord: integer;
  ona, cki, des, con, com, co1, co2, csr, a, b: string; // objectname, contentkind, description, content, comment, comment1, comment2, commentseparatorrow
begin
  // *** DUPLICATED LOGIC IN TDbaRec.ObjTreeContentDba ***

  // start
  tik.Init;

  // zip
  oid := ObjectClientDataSet.FieldByName('FldId').AsInteger;
  pid := ObjectClientDataSet.FieldByName('FldPId').AsInteger;
  ord := ObjectClientDataSet.FieldByName('FldOrder').AsInteger;
//sta := ObjectClientDataSet.FieldByName('FldState').AsString;
  cki := ObjectClientDataSet.FieldByName('FldContentKind').AsString;
  des := ObjectClientDataSet.FieldByName('FldDescription').AsString.Trim;
  ona := ObjectClientDataSet.FieldByName('FldObject').AsString;
  con := ObjectClientDataSet.FieldByName('FldContent').AsString;

  // commentstrings
  com := TCodRec.CommentStr(cki);
  co1 := TCodRec.Comment1Str(cki);
  co2 := TCodRec.Comment2Str(cki);

  // commentseparatorrow
  if not CodeClientDataSet.FieldByName('FldHeaderAndFooterOff').AsBoolean then begin
    if      Sametext('Html', cki) then
      csr := co1 + StringOfChar(com.Chars[0], 73) + co2   // <!------------>
    else if Sametext('Css', cki) then
      csr := co1 + StringOfChar(com.Chars[0], 75) + co2   // /*-----------*/
    else
      csr := StringOfChar(com.Chars[0], 80);              // ---------------
  end;

  // header
  if not CodeClientDataSet.FieldByName('FldHeaderAndFooterOff').AsBoolean then begin
    a := Format('%s', [ona]);
    b := Format('(oid:%d, pid:%d, ord:%d)', [oid, pid, ord]);
    sbu.Add(csr, true, System.Math.IfThen(i = 0, 0, 2));
    if      Sametext('Html', cki) then
      sbu.Add('%s %-34s%37s %s', [co1, a, b, co2])
    else if Sametext('Css', cki) then
      sbu.Add('%s %-36s%37s %s', [co1, a, b, co2])
    else
      sbu.Add('%s %-40s%37s', [com, a, b]);
    sbu.Add(csr);
    sbu.Anl(2);
  end;

  // descriptionblock
  if CodeClientDataSet.FieldByName('FldDescriptionBlockAdd').AsBoolean and (not des.IsEmpty) then begin
    sbu.Add(co1, true, 0);
    sbu.Add(des);
    sbu.Add(co2);
    sbu.Anl(2);
  end;

  // content
  con := grva.Rva(con, CodeClientDataSet.FieldByName('FldCommentRemove').AsBoolean, CodeClientDataSet.FieldByName('FldLinesEmptyRemove').AsBoolean, true);
  // rva with datasets
if IvRvDsDo then
  con := grva.RvaDsRecord(con, [ObjectClientDataSet, CodeClientDataSet]);
  // rva with json
if IvRvJsonDo then
  con := grva.RvaJson(con, jva, [rfReplaceAll]);
  // add
  sbu.Add(con, true, 0);

  // footer
  if not CodeClientDataSet.FieldByName('FldHeaderAndFooterOff').AsBoolean then begin
    a := Format('END', []);
    b := Format('(generated by wks @ %s in %d ms)', [DateTimeToStr(Now), tik.ElapsedMs]);
    sbu.Add(csr, true, 2);
    if      Sametext('Html', cki) then
      sbu.Add('%s %-14s%57s %s', [co1, a, b, co2])
    else if Sametext('Css', cki) then
      sbu.Add('%s %-16s%57s %s', [co1, a, b, co2])
    else
      sbu.Add('%s %-20s%57s', [com, a, b]);
    sbu.Add(csr);
  end;

  // save
  sbu.SaveToFile(IvFsp);
end;

begin
  // init
  IvFbk.Clear;
  oid := ObjectClientDataSet.FieldByName('FldId').AsInteger;
  ona := ObjectClientDataSet.FieldByName('FldObject').AsString;
  ofn := CodeClientDataSet.FieldByName('FldOutputFileName').AsString;

  // filemname
  if giis.Nx(ofn) then begin
    IvFbk.AddW('%4d - Outputfilename not defined, use objectname "%s"', [oid, ona]);
    fin := ona;
  end else
    fin := ofn;

  // .ext
//ext := TPatRec.Ext(ofn);
//if giis.Nx(fix) then begin
//  fix := ObjectClientDataSet.FieldByName('FldContentKind').AsString;
//  fix := TPatRec.ExtEnsure(fix);
//end;
//if giis.Nx(fix) then begin
//  LogFrame.Log('Extension or kind for %s not defined, nothing done', [ona], clRed);
//  Exit;
//end;
//if not TPatRec.ExtHas(ofn) then
//  ofn := ofn + fix;

  // outputdir
  if SameText('Dev', IvEnv) then
    odi := CodeClientDataSet.FieldByName('FldOutputDevDirectory').AsString
  else if SameText('Test', IvEnv) then
    odi := CodeClientDataSet.FieldByName('FldOutputTestDirectory').AsString
  else if SameText('Prod', IvEnv) then
    odi := CodeClientDataSet.FieldByName('FldOutputProdDirectory').AsString;
  if giis.Nx(odi) then begin
    IvFbk.AddE('%4d - Output %s directory for %s not defined, nothing done', [oid, IvEnv.ToUpper, ona]);
    Exit;
  end;

  // forceoutputdir
  if not DirectoryExists(odi) then
    if not System.SysUtils.ForceDirectories(odi) then begin
      IvFbk.AddE(fbk);
      Exit;
    end else
      IvFbk.AddI('%4d - OutputDirectory %s does not exists, created on the fly', [oid, odi]);

  // options
  dba := CodeClientDataSet.FieldByName('FldDescriptionBlockAdd').AsBoolean;
//hfo := CodeClientDataSet.FieldByName('FldHeaderAndFooterOff').AsBoolean;
  cor := CodeClientDataSet.FieldByName('FldCommentRemove').AsBoolean;
  ler := CodeClientDataSet.FieldByName('FldLinesEmptyRemove').AsBoolean;

  // istemplate
  ist := (not ObjectClientDataSet.FieldByName('FldData').AsString.Trim.IsEmpty) and TRegEx.IsMatch(ObjectClientDataSet.FieldByName('FldData').AsString, '\$.*\$', []);

  // save normal
  if not ist then begin
    // filespec
    fsp := TPatRec.DelimiterEnsure(odi) + fin;
    fsp := grva.RvaDsRecord(fsp, [ObjectClientDataSet, CodeClientDataSet]);             // rva with datasets

    // save
    filesave(fsp, true, false);

    // log
    IvFbk.AddS('%4d - Code saved to: %s', [oid, fsp]);

  // compile and save com
  end else begin
    i := 0;
    jso := SO(ObjectClientDataSet.FieldByName('FldData').AsString);
    for jsi in jso['Items'] do begin
      Inc(i);

      // rvitemjson
      jva := jsi.AsString;

      // filespec
      fsp := TPatRec.DelimiterEnsure(odi) + fin;
      fsp := grva.RvaDsRecord(fsp, [ObjectClientDataSet, CodeClientDataSet]);           // rva with datasets
      fsp := grva.RvaJson(fsp, jva, [rfReplaceAll]);                                    // rva with json

      // save
      filesave(fsp, true, true);

      // log
      IvFbk.AddS('%4d - template%d "%s" saved to: %s', [oid, i, jsi.AsString, fsp]);
    end;
  end;
end;

function  TCodeMainForm.CodeSaveChilds({IvId: integer;} IvEnv: string; var IvFbk: TFbk2Rec): boolean;
var
  dat: PNodeItem;
  nod: PVirtualNode;
  oid: integer;
  bkm: TBookmark;
  fbk: TFbk2Rec;
begin
  // exit
  if not TVstRec.NodeHasChildren(ObjectDTClientTree.FocusedNode) then begin
    TMesRec.AutoClose('Save Childs Codes', 'Please select an Item with childs code objects');
    Exit;
  end;

  // loop
  ObjectClientDataSet.DisableControls;
  bkm := ObjectClientDataSet.GetBookmark;
  try
    // 1st
    nod := ObjectDTClientTree.FocusedNode.FirstChild;
    while Assigned(nod) do begin
      // nodedata
      dat := ObjectDTClientTree.GetNodeData(nod);

      // exist
      if Assigned(dat) then begin
        // caption col0
      //IvFbk.Add('%4d', [ObjectDTClientTree.Text[nod, 0]]);

        // nodeparams
      //if not VarIsClear(dat.Param) then begin
      //  TVstRec.NodeParamGet(ObjectDTClientTree, sib, idi, pid, azo, nam, obj, obk, cok, sta, org, dax);
      //end;

        // id
        oid := dat.Key.ToInteger;

        // locate
        ObjectClientDataSet.Locate('FldId', oid, []);

        // save
        if ObjectClientDataSet.FieldByName('FldState').AsString = 'Active' then
          CodeSaveItem({FId,} CodeOutputEnv, fbk);
      end;

      // next
    //nod := ObjectDTClientTree.GetNextSibling(nod);
      nod := nod.NextSibling;
    end;

    // log
    LogFrame.Log(fbk.Text);
  finally
    ObjectClientDataSet.GotoBookmark(bkm);
    ObjectClientDataSet.EnableControls;
  end;
end;

function  TCodeMainForm.CodeSaveBranch({IvId: integer;} IvEnv: string; var IvFbk: TFbk2Rec): boolean;
var
  aff: integer;
  fsp, ona, cod, fbk: string;
  dba, hfo, cor, ler: boolean;
begin
  LogFrame.Log(NOT_IMPLEMENTED_STR, clRed);
  Exit;

  // options
  dba := CodeClientDataSet.FieldByName('FldDescriptionBlockAdd').AsBoolean;
  hfo := CodeClientDataSet.FieldByName('FldHeaderAndFooterOff').AsBoolean;
  cor := CodeClientDataSet.FieldByName('FldCommentRemove').AsBoolean;
  ler := CodeClientDataSet.FieldByName('FldLinesEmptyRemove').AsBoolean;

  // savelocally
  if CodeSaveToComboBox.ItemIndex = 0 then begin
    // codefromdbario
    if not TDbaRec.ObjTreeContentRio    ('Code', FId.ToString, true, dba, hfo, cor, ler{, fsp}, aff, ona, cod, fbk) then begin
      TMesRec.W(fbk);
      LogFrame.Log(fbk, clRed);
    end else begin
      LogFrame.Log(NOT_IMPLEMENTED_STR, clRed);
    end;

  // saveremoterio
  end else begin
    if not TDbaRec.ObjTreeContentRioSave('Code', FId.ToString, true, dba, hfo, cor, ler , fsp , aff, ona, cod, fbk) then begin
      TMesRec.W(fbk);
      LogFrame.Log(fbk, clRed);
    end else
      LogFrame.Log(fbk, clGreen); // *** message should be adjusted ***
  end;
end;

procedure TCodeMainForm.CodeSaveItemActionExecute(Sender: TObject);
var
  fbk: TFbk2Rec;
begin
  inherited;

  CodeSaveItem({FId,} CodeOutputEnv, fbk);
  LogFrame.Log(fbk.Text);
end;

procedure TCodeMainForm.CodeSaveChildsActionExecute(Sender: TObject);
var
  fbk: TFbk2Rec;
begin
  inherited;

  CodeSaveChilds({FId,} CodeOutputEnv, fbk);
  LogFrame.Log(fbk.Text);
end;

procedure TCodeMainForm.CodeSaveBranchActionExecute(Sender: TObject);
var
  fbk: TFbk2Rec;
begin
  inherited;

  CodeSaveBranch({FId,} CodeOutputEnv, fbk);
  LogFrame.Log(fbk.Text);
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
procedure TCodeMainForm.CodeOutputDevDirectoryLabelClick(Sender: TObject);
var
  pat, fbk: string;
begin
  inherited;

  pat := CodeOutputDevDirectoryDBEdit.Text;
  LogFrame.LogOrMsg(fbk, TFsyRec.DirOpen(pat, fbk));
end;

procedure TCodeMainForm.CodeOutputDevSaveLabelClick(Sender: TObject);
var
  fbk: TFbk2Rec;
begin
  inherited;

  CodeSaveItem({FId,} 'Dev', fbk);
  LogFrame.Log(fbk.Text);
end;

procedure TCodeMainForm.CodeOutputTestDirectoryLabelClick(Sender: TObject);
var
  pat, fbk: string;
begin
  inherited;

  pat := CodeOutputTestDirectoryDBEdit.Text;
  LogFrame.LogOrMsg(fbk, TFsyRec.DirOpen(pat, fbk));
end;

procedure TCodeMainForm.CodeOutputTestSaveLabelClick(Sender: TObject);
var
  fbk: TFbk2Rec;
begin
  inherited;

  CodeSaveItem({FId,} 'Test', fbk);
  LogFrame.Log(fbk.Text);
end;

procedure TCodeMainForm.CodeOutputProdDirectoryLabelClick(Sender: TObject);
var
  pat, fbk: string;
begin
  inherited;

  pat := CodeOutputProdDirectoryDBEdit.Text;
  LogFrame.LogOrMsg(fbk, TFsyRec.DirOpen(pat, fbk));
end;

procedure TCodeMainForm.CodeOutputProdSaveLabelClick( Sender: TObject);
var
  fbk: TFbk2Rec;
begin
  inherited;

  CodeSaveItem({FId,} 'Prod', fbk);
  LogFrame.Log(fbk.Text);
end;
{$ENDREGION}

end.
