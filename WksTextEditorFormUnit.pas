unit WksTextEditorFormUnit;

{
  *** TEXT EDITOR ANCESTOR ***
  Form.Tag      contains the TCokEnum (as integer)
  Tab.Tag       0 = notchanged ; 1 = changed
  SynEdit.Tag   = Form.Tag   *** WASTEFUL use just Form.Tag ***
}

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.Actions
  , System.Classes
  , System.Diagnostics
  , System.ImageList
  , System.RegularExpressions         
  , System.SysUtils
  , System.Types
  , System.UITypes
  , System.Variants
  , Vcl.ActnList
  , Vcl.Buttons
  , Vcl.ComCtrls
  , Vcl.Controls
  , Vcl.Dialogs
  , Vcl.ExtCtrls
  , Vcl.ExtDlgs
  , Vcl.Forms
  , Vcl.Graphics
  , Vcl.ImgList
  , Vcl.Menus
  , Vcl.StdCtrls
  , Vcl.ToolWin
  , Vcl.PythonGUIInputOutput
  , JvExControls
  , JvScrollMax
  , JvExExtCtrls
  , JvExtComponent
  , JvNetscapeSplitter
  , SynEdit
  , SynEditTypes
  , SynEditCodeFolding
  , SynEditHighlighter
  , SynHighlighterJSON
  , SynEditPythonBehaviour
  , VirtualTrees
  , SuperObject //, SuperXmlParser
  , PythonEngine
  , PythonVersions
  , WksLogFrameUnit
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TTextEditorForm = class(TForm)
    BottomPanel: TPanel;
    CloseAction: TAction;
    CloseToolButton: TToolButton;
    CollapseToolButton: TToolButton;
    ExpandToolButton: TToolButton;
    FoldAction: TAction;
    FoldToolButton: TToolButton;
    SynEditInsertHeaderPopup: TMenuItem;
    JsonTreefyAction: TAction;
    JsonFormatAction: TAction;
    JsonToolButton: TToolButton;
    LayoutAction: TAction;
    LayoutToolButton: TToolButton;
    LeftJvNetscapeSplitter: TJvNetscapeSplitter;
    LeftPageControl: TPageControl;
    LeftPanel: TPanel;
    LineNumbersAction: TAction;
    LogFrame: TLogFrame;
    MainPageControl: TPageControl;
    MainPanel: TPanel;
    NewAction: TAction;
    NewToolButton: TToolButton;
    OpenAction: TAction;
    OpenTextFileDialog: TOpenTextFileDialog;
    OpenToolButton: TToolButton;
    OptionDirDefaultEdit: TEdit;
    OptionDirDefaultLabel: TLabel;
    OptionGeneralJvScrollMaxBand: TJvScrollMaxBand;
    OptionJvScrollMax: TJvScrollMax;
    OptionPythonEngineRecycleSpeedButton: TSpeedButton;
    OptionPythonJvScrollMaxBand: TJvScrollMaxBand;
    OptionPythonRawOutputCheckBox: TCheckBox;
    OptionPythonVersionComboBox: TComboBox;
    OptionPythonVersionLabel: TLabel;
    OptionSaveBeforeRunCheckBox: TCheckBox;
    OptionTabSheet: TTabSheet;
    OptionTabWidthEdit: TEdit;
    OptionTabWidthLabel: TLabel;
    PythonEngine1: TPythonEngine;
    PythonGUIInputOutput1: TPythonGUIInputOutput;
    SynEditInsertRegionPopup: TMenuItem;
    RightJvNetscapeSplitter: TJvNetscapeSplitter;
    RightPageControl: TPageControl;
    RightPanel: TPanel;
    RunAction: TAction;
    RunToolButton: TToolButton;
    SaveAction: TAction;
    SaveAsAction: TAction;
    SaveAsToolButton: TToolButton;
    SaveTextFileDialog: TSaveTextFileDialog;
    SaveToolButton: TToolButton;
    SpecialCharsAction: TAction;
    SpellcheckAction: TAction;
    SpellcheckToolButton: TToolButton;
    StatusBar: TStatusBar;
    SynEditInsertHeaderAction: TAction;
    SynEditInsertRegionAction: TAction;
    SynEditPopup: TPopupMenu;
    SynJSONSyn: TSynJSONSyn;
    MainActionList: TActionList;
    MainImageList24: TImageList;
    TopMainTabSheet: TTabSheet;
    TopMainToolBar: TToolBar;
    TopPageControl: TPageControl;
    TreeActionList: TActionList;
    TreeCollapseAction: TAction;
    TreeExpandAction: TAction;
    TreeImageList16: TImageList;
    TreeNodeValueSynEdit: TSynEdit;
    TreeSplitter: TSplitter;
    TreeToolBar: TToolBar;
    TreeVst: TVirtualStringTree;
    FoldingToolButton: TToolButton;
    FoldingAction: TAction;
    User1ToolButton: TToolButton;
    User1Action: TAction;
    MatchPrevToolButton: TToolButton;
    MatchPrevAction: TAction;
    MatchNextAction: TAction;
    MatchNextToolButton: TToolButton;
    NoCaseAction: TAction;
    SortAscAction: TAction;
    SortDescAction: TAction;
    TextUtilsPopup: TPopupMenu;
    UtilSortAscPopup: TMenuItem;
    UtilSortDescPopup: TMenuItem;
    TextUtilsToolButton: TToolButton;
    UtilLineBeginWithPopup: TMenuItem;
    UtilLineNumberingPopup: TMenuItem;
    LineBeginWithAction: TAction;
    LineNumberingAction: TAction;
    BottomJvNetscapeSplitter: TJvNetscapeSplitter;
    WordsWrapAction: TAction;
    UtilTabsToSpacesPopup: TMenuItem;
    TabsToSpacesAction: TAction;
    UtilSpacesToTabsPopup: TMenuItem;
    SpacesToTabsAction: TAction;
    User2Action: TAction;
    User3Action: TAction;
    User2ToolButton: TToolButton;
    User3ToolButton: TToolButton;
    User4ToolButton: TToolButton;
    User4Action: TAction;
    User5ToolButton: TToolButton;
    User5Action: TAction;
    UtilJsonFormatPopup: TMenuItem;
    UtilSpecialCharsPopup: TMenuItem;
    UtilWordWrapPopup: TMenuItem;
    UtilLineNumbersPopup: TMenuItem;
    UtilNoCasePopup: TMenuItem;
    RenameAction: TAction;
    ClearAction: TAction;
    SearchAction: TAction;
    ExitAction: TAction;
    ExitToolButton: TToolButton;
    CommentAction: TAction;
    CommentToolButton: TToolButton;
    OptionFoldAfterOpenCheckBox: TCheckBox;
    GotoToolButton: TToolButton;
    GotoAction: TAction;
    procedure NewActionExecute(Sender: TObject);
    procedure OpenActionExecute(Sender: TObject);
    procedure SaveActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SaveAsActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LayoutActionExecute(Sender: TObject);
    procedure SpellcheckActionExecute(Sender: TObject);
    procedure TreeVstGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure TreeVstFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure TreeVstChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure TreeVstGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure TreeVstCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure TreeVstHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
    procedure JsonTreefyActionExecute(Sender: TObject);
    procedure SynEditInsertHeaderActionExecute(Sender: TObject);
    procedure SynEditInsertRegionActionExecute(Sender: TObject);
    procedure FoldActionExecute(Sender: TObject);
    procedure SpecialCharsActionExecute(Sender: TObject);
    procedure LineNumbersActionExecute(Sender: TObject);
    procedure OptionDirDefaultLabelClick(Sender: TObject);
    procedure OptionTabWidthEditChange(Sender: TObject);
    procedure TreeCollapseActionExecute(Sender: TObject);
    procedure TreeExpandActionExecute(Sender: TObject);
    procedure JsonFormatActionExecute(Sender: TObject);
    procedure RunActionExecute(Sender: TObject);
    procedure OptionPythonEngineRecycleSpeedButtonClick(Sender: TObject);
    procedure OptionPythonRawOutputCheckBoxClick(Sender: TObject);
    procedure OptionPythonVersionComboBoxChange(Sender: TObject);
    procedure FoldingActionExecute(Sender: TObject);
    procedure MainPageControlChange(Sender: TObject);
    procedure User1ActionExecute(Sender: TObject);
    procedure MatchPrevActionExecute(Sender: TObject);
    procedure MatchNextActionExecute(Sender: TObject);
    procedure NoCaseActionExecute(Sender: TObject);
    procedure SortAscActionExecute(Sender: TObject);
    procedure SortDescActionExecute(Sender: TObject);
    procedure LineBeginWithActionExecute(Sender: TObject);
    procedure LineNumberingActionExecute(Sender: TObject);
    procedure WordsWrapActionExecute(Sender: TObject);
    procedure TabsToSpacesActionExecute(Sender: TObject);
    procedure SpacesToTabsActionExecute(Sender: TObject);
    procedure User2ActionExecute(Sender: TObject);
    procedure User3ActionExecute(Sender: TObject);
    procedure User4ActionExecute(Sender: TObject);
    procedure User5ActionExecute(Sender: TObject);
    procedure RenameActionExecute(Sender: TObject);
    procedure ClearActionExecute(Sender: TObject);
    procedure SearchActionExecute(Sender: TObject);
    procedure MainPageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MainPageControlDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure MainPageControlDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: boolean);
    procedure ExitActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CommentActionExecute(Sender: TObject);
    procedure GotoActionExecute(Sender: TObject);
  private
    { Private declarations }
    FScript: string;                 // selected piece of content or entire content of current synedit
    FDocumentNumSeq: integer;        // 1, 2, ...
    FLineBeginWith: string;          //
    FFormIsModalInvoked: boolean;    // false=standardapp , true=forismodalwithjustonetab(invoched by a wks*client app)
    procedure  StatusBarUpdate;
  protected
    procedure WMSysCommand(var IvMsg: TWmSysCommand); message WM_SYSCOMMAND;
  //function  RvLocal(IvString: string): string;
  public
    { Public declarations }
    property  Script            : string  read FScript             write FScript            ;
    property  FormIsModalInvoked: boolean read FFormIsModalInvoked write FFormIsModalInvoked;
    class function  Execute(var IvText: string; var IvFbk: string): boolean; // indicate text is changed or not
    function  EditorIsPython: boolean;
    function  TabNew: TTabSheet;
    function  TabAvailable: boolean;
    function  TabCurrent: TTabSheet;
    function  SynEditCurrent: TSynEdit;
    function  SynEditCurrentIsEmpty: boolean;
    function  SynEditCurrentIsChanged: boolean;
    procedure SynEditCurrentFlash(IvMs: integer = 100);
    function  SynEditCurrentCodeKind: TCodKindEnum; // of synedit
    procedure SynEditOnChange(Sender: TObject);
    procedure SynEditDblClick(Sender: TObject);
    procedure SynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SynEditMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TreeClear;
    procedure TreeUpdate(const IvRoot: ISuperObject);
    function  TreeNodePath(IvTreeVst: TVirtualStringTree; IvPVirtualNode: PVirtualNode): string;
    function  TreeNodeValue(IvTreeVst: TVirtualStringTree; IvPVirtualNode: PVirtualNode; IvFormat: boolean = true; IvEscape: boolean = false): string;
    procedure JsonStrTreefy(IvJsonStr: string);
    procedure PythonComponentsReset;
    function  OptionTabWidthDef: integer;
    function  TextSpacesHeadRemove(IvText: string): string;
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  TextEditorForm: TTextEditorForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    VirtualTrees.Types
  , WksSpellcheckDialogFormUnit
  , WksPythonUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  PTreeNode = ^TTreeNode;
  TTreeNode = record
    Index: integer;
    Name: string;
    SuperObjectI: ISuperObject;
  end;
{$ENDREGION}

{$REGION 'Routine'}

  {$REGION 'Execute'}
class function TTextEditorForm.Execute(var IvText: string; var IvFbk: string): boolean;
var
  frm: TTextEditorForm;
begin
  // form
  frm := TTextEditorForm.Create(nil);

  // forismodalinvokedbyclient
  frm.FormIsModalInvoked := true;

  // temporarytransfer
  frm.Script := IvText;

  // waitforclose
  try
    Result := frm.ShowModal = mrOk;
    if Result then begin
      IvFbk  := 'Text changed';
      IvText := frm.SynEditCurrent.Text;
    end else
      IvFbk  := 'Text unchanged';
    //IvText := should be unchanged;
  finally
  //FreeAndNil(frm);
    frm.Release;
  end;
end;
  {$ENDREGION}

  {$REGION 'WMessage'}
{procedure TTextEditorForm.WMSyscommand(var IvMsg: TWmSysCommand);
begin
  if IvMsg.CmdType = SC_Close then
      ShowMessage('X close button pressed');

  inherited;
end;}
  {$ENDREGION}

  {$REGION 'RvLocal'}
{function  TTextEditorForm.RvLocal(IvString: string): string;
var
  n, e: string;
begin
  Result := StringReplace(IvString, '[RvTmpDir()]'    , TmpDir    , [rfReplaceAll]);
  Result := StringReplace(Result  , '[RvTitle()]'     , TitleGet  , [rfReplaceAll]);
  Result := StringReplace(Result  , '[RvScriptFile()]', ScriptFile, [rfReplaceAll]);
  Result := StringReplace(Result  , '[RvOutputFile()]', OutputFile, [rfReplaceAll]);

  n := ExtractFileName(ScriptFile);
  e := ExtractFileExt(ScriptFile) ;
  n := n.Remove(Length(n) - Length(e));
  Result := StringReplace(Result  , '[RvScriptFileName()]', n, [rfReplaceAll]);

  n := ExtractFileName(OutputFile);
  e := ExtractFileExt(OutputFile) ;
  n := n.Remove(Length(n) - Length(e));
  Result := StringReplace(Result  , '[RvOutputFileName()]', n, [rfReplaceAll]);
end;}
  {$ENDREGION}

  {$REGION 'Editor'}
function TTextEditorForm.EditorIsPython: boolean;
begin
  Result := TCodKindEnum(Tag) = TCodKindEnum.ckPy;
end;
  {$ENDREGION}

  {$REGION 'Gui'}
procedure TTextEditorForm.StatusBarUpdate;
begin
  StatusBar.Panels[0].Text := Format('row: %d  col: %d  rows %d  chars: %d  bytes: %d  selection: %d', [
    SynEditCurrent.CaretY, SynEditCurrent.CaretX
  , SynEditCurrent.Lines.Count, Length(UTF8Encode(SynEditCurrent.Text))
  , Length(SynEditCurrent.Text), SynEditCurrent.SelLength
  ]);
end;
  {$ENDREGION}

  {$REGION 'Tab'}
function  TTextEditorForm.TabNew: TTabSheet;
var
  nam: string;
  tab: TTabSheet;
  syn: TSynEdit;
  spb: TSynEditPythonBehaviour;
begin
  Inc(FDocumentNumSeq);
  nam := Format('Document%d', [FDocumentNumSeq]);

  tab := TTabSheet.Create(MainPageControl);
  tab.Parent := MainPageControl;
  tab.Caption := nam;

  syn := TSynEdit.Create(tab);
  syn.Parent      := tab;
  syn.Align       := alClient;
  syn.BorderStyle := bsNone;
  syn.OnChange    := SynEditOnChange;
  syn.OnDblClick  := SynEditDblClick;
  syn.OnKeyUp     := SynEditKeyUp;
  syn.OnMouseUp   := SynEditMouseUp;
  syn.PopupMenu   := SynEditPopup;
  syn.TabWidth    := OptionTabWidthDef;
  syn.Tag         := Self.Tag;                               // usedbygsyntodomanythings

  gsyn.CodeKind := TCodKindEnum(syn.Tag);                    // setbefore ScanForFoldRanges
  gsyn.Setup(syn, OptionTabWidthDef, gsyn.CodeKind);
  syn.OnScanForFoldRanges := gsyn.ScanForFoldRanges;         // *** already done in gsyn.Setup() ***
  syn.UseCodeFolding := true;                                // *** idem ***
  FoldingAction.Checked := true;

  if EditorIsPython then begin
    spb := TSynEditPythonBehaviour.Create(syn);
    spb.Editor := syn;
    spb.Indent := OptionTabWidthDef;
  end;

  tab.PageControl := MainPageControl;
  MainPageControl.ActivePage := tab;

  syn.SetFocus;
  Result := tab;
end;

function  TTextEditorForm.TabAvailable: boolean;
begin
  Result := Assigned(MainPageControl.ActivePage);
  if not Result then
    TMesRec.I('No document available');
end;

function  TTextEditorForm.TabCurrent: TTabSheet;
begin
  if MainPageControl.PageCount > 0 then
    Result := MainPageControl.ActivePage
  else
    Result := nil;
end;
  {$ENDREGION}

  {$REGION 'SynEdit'}
function  TTextEditorForm.SynEditCurrent: TSynEdit;
var
  tab: TTabSheet;
begin
  tab := TabCurrent;
  if Assigned(tab) then
    Result := tab.Controls[0] as TSynEdit
  else
    Result := nil;
end;

procedure TTextEditorForm.SynEditCurrentFlash(IvMs: integer);
var
  col: TColor;
begin
  col := SynEditCurrent.Color;
  SynEditCurrent.Color := clYellow;
  Application.ProcessMessages;
  Sleep(IvMs);
  SynEditCurrent.Color := col;
end;

function  TTextEditorForm.SynEditCurrentIsChanged: boolean;
begin
  Result := TabCurrent.Tag <> 0;
end;

function  TTextEditorForm.SynEditCurrentIsEmpty: boolean;
begin
  Result := SynEditCurrent.Text.Trim.Length = 0;
end;

function  TTextEditorForm.SynEditCurrentCodeKind: TCodKindEnum;
begin
  Result := TCodKindEnum({Self.Tag}SynEditCurrent.Tag);
end;

procedure TTextEditorForm.SynEditOnChange(Sender: TObject);
begin
  if not SynEditCurrentIsChanged then begin
    TabCurrent.Tag := 1;
    TabCurrent.Caption := TabCurrent.Caption + ' ' + CHAR_CONTENT_CHANGED;
  end;
  StatusBarUpdate;
end;

procedure TTextEditorForm.SynEditDblClick(Sender: TObject); // *** duplicate in Base or wks000unit ***
var
  sel, rep: string;
begin
  sel := SynEditCurrent.SelText;
  if (not SameText('false', sel)) and (not SameText('true', sel)) then
    Exit;

       if sel = 'false' then rep := 'true'
  else if sel = 'true'  then rep := 'false'
  else if sel = 'False' then rep := 'True'
  else if sel = 'True'  then rep := 'False';
  SynEditCurrent.SelText := rep;
end;

procedure TTextEditorForm.SynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  gsyn.SynEditOnKeyUp(Sender, Key, Shift);
  StatusBarUpdate;
end;

procedure TTextEditorForm.SynEditMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  StatusBarUpdate;
end;
  {$ENDREGION}

  {$REGION 'Tree'}
procedure TTextEditorForm.TreeClear;
begin
  TreeVst.Clear;
  TreeNodeValueSynEdit.Clear;
  LeftJvNetscapeSplitter.Maximized := true;
end;

procedure TTextEditorForm.TreeUpdate(const IvRoot: ISuperObject);
  procedure NodeProcess(IvParent: PVirtualNode; const IvNode: ISuperObject; const IvText: string; IvId: integer = -1);
  var
    i: integer;
    vnp: PVirtualNode;     // virtualnodeptr
    vnd: PTreeNode;        // nodedata
    soi: TSuperObjectIter; // iterator
  begin
    vnp := TreeVst.AddChild(IvParent);
    vnd := TreeVst.GetNodeData(vnp);
    vnd.Index := IvId;
    vnd.Name := IvText;
    vnd.SuperObjectI := IvNode;
    Include(vnp.States, vsInitialized);
    case ObjectGetType(IvNode) of
      stObject: begin
        include(vnp.States, vsExpanded);
        if ObjectFindFirst(IvNode, soi) then
          repeat
            NodeProcess(vnp, soi.val, soi.key, -1);
          until not ObjectFindNext(soi);
        ObjectFindClose(soi);
      end;
      stArray: begin
        include(vnp.States, vsExpanded);
        for i := 0 to IvNode.AsArray.Length - 1 do
          NodeProcess(vnp, IvNode.AsArray[i], inttostr(i), i);
      end;
    end;
  end;
begin
  TreeNodeValueSynEdit.Clear;
  TreeVst.BeginUpdate;
  try
    TreeVst.Clear;
    NodeProcess(nil, IvRoot, 'Root');
  finally
    TreeVst.EndUpdate;
  end;
end;

function  TTextEditorForm.TreeNodePath(IvTreeVst: TVirtualStringTree; IvPVirtualNode: PVirtualNode): string;
var
  nod, pad: PTreeNode; // nodedata, parentdata
label
  rootlabel;
begin
  // init
  Result := '';

  // nodedata
  nod := IvTreeVst.GetNodeData(IvPVirtualNode);
  if not Assigned(nod)  then
    Exit;

  // parentdata
  pad := IvTreeVst.GetNodeData(IvPVirtualNode.Parent);
  if pad = nil then
    goto rootlabel

  // path
  else
    case ObjectGetType(pad.SuperObjectI) of
      stObject:
        Result := TreeNodePath(IvTreeVst, IvPVirtualNode.Parent) + '.' + nod.Name;
      stArray:
        Result := TreeNodePath(IvTreeVst, IvPVirtualNode.Parent) + '[' + nod.Name + ']';
    else
      Assert(false, 'unexpected');
    end;
  Exit;

rootlabel:
  Result := nod.Name;
end;

function  TTextEditorForm.TreeNodeValue(IvTreeVst: TVirtualStringTree; IvPVirtualNode: PVirtualNode; IvFormat, IvEscape: boolean): string;
var
  nod: PTreeNode; // nodedata
begin
  // nodedata
  nod := IvTreeVst.GetNodeData(IvPVirtualNode);

  // exit
  if not Assigned(nod) then begin
    Result := ''; // null
    Exit;
  end;

  // do
  if not Assigned(nod.SuperObjectI) then
    Result := '' // null
  else
    Result := nod.SuperObjectI.AsJSon(IvFormat, IvEscape);
end;
  {$ENDREGION}

  {$REGION 'Python'}
procedure TTextEditorForm.PythonComponentsReset;
var
  pvs: TPythonVersions;
  pve: TPythonVersion;
  str: string;
begin
  // exit
  if OptionPythonVersionComboBox.ItemIndex < 0 then begin
    ShowMessage('No Python version has been detected and selected');
    Exit;
  end;

  LogFrame.Log('Python engine resetting...', clRed);

  // destroy
  FreeAndNil(PythonEngine1);

  // pyver
  pvs := GetRegisteredPythonVersions;
  pve := pvs[OptionPythonVersionComboBox.ItemIndex];

  // create
  PythonEngine1 := TPythonEngine.Create(Self);
  pve.AssignTo(PythonEngine1);
  PythonEngine1.IO := PythonGUIInputOutput1;
  PythonEngine1.LoadDll;

  // log
  str := TPythonRec.PythonVersionInfo(pve);
  LogFrame.Log(str);
  LogFrame.Log('Python engine resetted (recreated)');
end;
  {$ENDREGION}

  {$REGION 'Options'}
function TTextEditorForm.OptionTabWidthDef: integer;
begin
  Result := StrToIntDef(OptionTabWidthEdit.Text, 4);
end;
  {$ENDREGION}

  {$REGION 'Json'}
procedure TTextEditorForm.JsonStrTreefy(IvJsonStr: string);
begin
  TreeClear;
  TreeUpdate(SO(IvJsonStr));
  LeftJvNetscapeSplitter.Maximized := false;
end;
  {$ENDREGION}

  {$REGION 'Other'}
function TTextEditorForm.TextSpacesHeadRemove(IvText: string): string;
var
  sli: TStrings;
  lin, spa: string;
  z, i: integer;
begin
  // exit
  if IvText.Trim.IsEmpty then
    Exit;

  sli := TStringList.Create;
  try
    // set
    sli.Text := IvText;

    // 1st non blank line
//    i := 0;
//    lin := sli[0];
//    while lin.IsEmpty do begin
//      Inc(i);
//      lin := sli[i];
//    end;

    // nolinesempty
    for i := sli.count - 1 downto 0 do begin
      if trim(sli[i]) = '' then // *** WARNING : same feature in StrLinesEmptyRemove() ***
        sli.Delete(i);
    end;

    // determine how many spaces start the 1st line
    lin := sli[0];
    z := 1;
    while lin[z] = ' ' do
      Inc(z);
    if z = 0 then
      Exit;

    // check if all lines have the same starting spaces
    z := z - 1;
    spa := StringOfChar(' ', z);
    for i := 0 to sli.Count-1 do begin
      lin := sli[i];
      if not lin.StartsWith(spa) then
        Exit;
    end;

    // remove starting spaces from all lines
    for i := 0 to sli.Count-1 do begin
      lin := sli[i];
      Delete(lin, 1, z);
      sli[i] := lin;
    end;

    // end
    Result := sli.Text;
  finally
    sli.Free;
  end;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Form'}
procedure TTextEditorForm.FormCreate(Sender: TObject);
var
  pvs: TPythonVersions;
  pve: TPythonVersion;
begin
  // form
  TFrmRec.FormInit(Sender as TForm);

  // gui
  MainPanel.Align := alClient;
  LeftJvNetscapeSplitter.Maximized    := true;
  RightJvNetscapeSplitter.Maximized   := true;
  TreeNodeValueSynEdit.Clear;

  // specializeit
  Caption := Format('%s - [TEXT Editor]', [Caption]);

  // optiongeneral *** these are the same for all editors ***
  OptionDirDefaultEdit.Text           := gini.StrGet('TextEditor/OptionDirDefault'   , 'C:\Temp');
  OptionTabWidthEdit.Text             := gini.StrGet('TextEditor/OptionTabWidth'     , '4'      );
  OptionSaveBeforeRunCheckBox.Checked := gini.BooGet('TextEditor/OptionSaveBeforeRun', true     );
  OptionFoldAfterOpenCheckBox.Checked := gini.BooGet('TextEditor/OptionFoldAfterOpen', true     );

  // custombutton *** these will be activated and customized in each specific editor ***
  RunToolButton.Visible               := false;
  User1ToolButton.Visible             := false;
  User2ToolButton.Visible             := false;
  User3ToolButton.Visible             := false;
  User4ToolButton.Visible             := false;
  User5ToolButton.Visible             := false;
//PythonEngineResetToolButton.Visible := false;

  // optionpython *** this will be activated in descendent python editor ***
  OptionPythonJvScrollMaxBand.Visible := false;
  // but versions discovery appens here *** optionally move directly to python editor formoncreate *** | *** duplicated in BaseClient ***
  OptionPythonJvScrollMaxBand.Visible := true;
  pvs := GetRegisteredPythonVersions;
  for pve in pvs do
    OptionPythonVersionComboBox.Items.Add(pve.DisplayName);
  if OptionPythonVersionComboBox.Items.Count = 0 then
    MessageDlg('No Python version has been detected', mtWarning, [mbOk], 0)
  else begin
    OptionPythonVersionComboBox.ItemIndex := 0;
    OptionPythonVersionComboBoxChange(Self);
  end;
  OptionPythonRawOutputCheckBox.Checked := false;

  // codetype *** set the form tag to be equal to the standard defined codeid ***
       if Name = 'TextEditorForm'   then Tag := Ord(TCodKindEnum.ckTxt )
  else if Name = 'JsonEditorForm'   then Tag := Ord(TCodKindEnum.ckJson)
  else if Name = 'PythonEditorForm' then Tag := Ord(TCodKindEnum.ckPy  )
  else if Name = 'SqlEditorForm'    then Tag := Ord(TCodKindEnum.ckSql );

  // controls *** set conseguently to general and codetype ***
  OpenTextFileDialog.InitialDir := OptionDirDefaultEdit.Text;
  SaveTextFileDialog.InitialDir := OptionDirDefaultEdit.Text;
  OpenTextFileDialog.DefaultExt := TCodRec.Vector[Tag].DlgDefaultExt;
  SaveTextFileDialog.DefaultExt := TCodRec.Vector[Tag].DlgDefaultExt;
  OpenTextFileDialog.Filter     := TCodRec.Vector[Tag].DlgFilter;
  SaveTextFileDialog.Filter     := TCodRec.Vector[Tag].DlgFilter;
  gsyn.Setup(TreeNodeValueSynEdit, OptionTabWidthDef);
end;

procedure TTextEditorForm.FormShow(Sender: TObject);
var
  tab: TTabSheet;
begin
  // tabadd
  tab := TabNew;

  // contentadd from temporarytransfer (this works eiter if the form is invoked modal and Script has something or if the form is a normal app and Script is empty)
  tab.Tag := 1; // avoidadding ' ' + CHAR_CONTENT_CHANGED
    SynEditCurrent.Text := Script;
  tab.Tag := 0; // onchangereset
end;

procedure TTextEditorForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // ini
  gini.StrSet('TextEditor/OptionDirDefault'   , OptionDirDefaultEdit.Text          );
  gini.StrSet('TextEditor/OptionTabWidth'     , OptionTabWidthEdit.Text            );
  gini.BooSet('TextEditor/OptionSaveBeforeRun', OptionSaveBeforeRunCheckBox.Checked);
  gini.BooSet('TextEditor/OptionFoldAfterOpen', OptionFoldAfterOpenCheckBox.Checked);

  // modalinvoked
  if FormIsModalInvoked then begin
    if SynEditCurrentIsChanged then
      ModalResult := mrOk
    else
      ModalResult := mrCancel;

  // normalapp recursivelyclosealltabs
  end else
    while Assigned(MainPageControl.ActivePage) do
      CloseAction.Execute;
end;

procedure TTextEditorForm.WMSysCommand(var IvMsg: TWMSysCommand);
begin
  // closingfrombordericon (happensearlier)
//  if IvMsg.CmdType = SC_CLOSE then
//    TMesRec.I('for "x" chosen');

  inherited; // continue to FormClose()
end;
{$ENDREGION}

{$REGION 'Action'}

  {$REGION 'Document'}
procedure TTextEditorForm.ExitActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TTextEditorForm.NewActionExecute(Sender: TObject);
begin
  TabNew;
end;

procedure TTextEditorForm.OpenActionExecute(Sender: TObject);
var
  tab: TTabsheet;
  syn: TSynEdit;
  fil: string;
begin
  if not OpenTextFileDialog.Execute then
    Exit;
  fil := OpenTextFileDialog.FileName;

  if not FileExists(fil) then begin
    MessageDlg(Format('File "%s" does not exists', [fil]), mtInformation, [mbOk], 0, mbOk);
    Exit;
  end;

  if Assigned(MainPageControl.ActivePage)
  and TRegEx.IsMatch(TabCurrent.Caption, '^Document\d+$')
  and SynEditCurrentIsEmpty then
    tab := TabCurrent
  else
    tab := TabNew;
  tab.Caption := fil;

  syn := SynEditCurrent;
  tab.Tag := 1; // avoidadding ' ' + CHAR_CONTENT_CHANGED
    syn.Lines.LoadFromFile(fil);
  tab.Tag := 0; // onchangereset

  if OptionFoldAfterOpenCheckBox.Checked then
    FoldAction.Execute;
end;

procedure TTextEditorForm.SaveActionExecute(Sender: TObject);
begin
  if not TabAvailable then
    Exit;

  if SynEditCurrentIsEmpty then
    if TAskRec.No('Current document is EMPTY!  If you save it, the copy on the disk will be OVERRIDDEN and become EMPTY too!  Continue?') then
      Exit;

  if TRegEx.IsMatch(TabCurrent.Caption, '^Document\d+( \*)?$') then begin
    SaveAsAction.Execute;
    Exit;
  end;

  TabCurrent.Caption := StringReplace(TabCurrent.Caption, ' ' + CHAR_CONTENT_CHANGED, '', []);
//if fileexist then
//  askoverryde
//else
    SynEditCurrent.Lines.SaveToFile(TabCurrent.Caption);
  TabCurrent.Tag := 0;
  LogFrame.Log('Document saved to "%s"', [TabCurrent.Caption]);
end;

procedure TTextEditorForm.SaveAsActionExecute(Sender: TObject);
begin
  if not TabAvailable then
    Exit;

  SaveTextFileDialog.FileName := StringReplace(TabCurrent.Caption, ' ' + CHAR_CONTENT_CHANGED, '', []);
  if not SaveTextFileDialog.Execute then
    Exit;
  TabCurrent.Caption := SaveTextFileDialog.FileName;

  SaveAction.Execute;
end;

procedure TTextEditorForm.RenameActionExecute(Sender: TObject);
begin
  TMesRec.NI;
end;

procedure TTextEditorForm.ClearActionExecute(Sender: TObject);
begin
  TMesRec.NI;
end;

procedure TTextEditorForm.CommentActionExecute(Sender: TObject);
var
//cok: TCodKindEnum;
  syn: TSynEdit;
  key: word;
  sst: TShiftState;
begin
  // simulatectrl+/
//cok := SynEditCurrentCodeKind;
  syn := SynEditCurrent;
  key := vkSlash;
  sst := [ssCtrl];
  gsyn.SynEditOnKeyUp(syn, key, sst);

  // *** CONTINUE IN DESCENDENT FORMS ***
  // [...]
end;

procedure TTextEditorForm.CloseActionExecute(Sender: TObject);
var
  mdr: integer;

  procedure tab_close;
  begin
    MainPageControl.ActivePage.Free;
    FoldingAction.Checked := false;
    if MainPageControl.PageCount > 0 then
      MainPageControlChange(Sender);
    Logframe.Log('Tab closed');
  end;
begin
  if not TabAvailable then
    Exit;

  if SynEditCurrentIsChanged then begin
    mdr := MessageDlg(Format('Document "%s" is changed, save it? ... then close the tab?', [TabCurrent.Caption]), mtConfirmation, mbYesNoCancel, 0);
    if mdr = mrYes then begin
      SaveAction.Execute;
    //Logframe.Log('Document saved'); *** already done in the previous instruction ***
      tab_close;
    end else if mdr = mrNo then begin
      Logframe.Log('Document NOT saved');
      tab_close
    end else
      Logframe.Log('Nothing done');
  end else begin
    tab_close;
  end;
end;

procedure TTextEditorForm.GotoActionExecute(Sender: TObject);
var
  uok: boolean; // userok
  lin: string;
begin
  uok := TAskRec.Str('Locate a line', 'Please enter a line number', '', lin);
  if (not uok) or lin.IsEmpty then
    Exit;

  Screen.Cursor := crHourGlass;
  try
    gsyn.CaretMoveToLine(SynEditCurrent, StrToIntDef(lin, SynEditCurrent.CaretY));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TTextEditorForm.SearchActionExecute(Sender: TObject);
begin
  TMesRec.NI;
end;

procedure TTextEditorForm.FoldingActionExecute(Sender: TObject);
begin
  if not TabAvailable then
    Exit;

  SynEditCurrent.UseCodeFolding := FoldingToolButton.Down;
  FoldToolButton.Enabled := FoldingToolButton.Down;
end;

procedure TTextEditorForm.FoldActionExecute(Sender: TObject);
begin
  if not TabAvailable then
    Exit;

  if FoldAction.ImageIndex = 14 then begin
    FoldAction.ImageIndex := 15;
    FoldAction.Caption := 'Unfold';
    SynEditCurrent.CollapseFoldType(FoldRegionType);
  end else begin
    FoldAction.ImageIndex := 14;
    FoldAction.Caption := 'Fold';
    SynEditCurrent.UnCollapseFoldType(FoldRegionType);
  end;
end;

procedure TTextEditorForm.RunActionExecute(Sender: TObject);
begin
  if not TabAvailable then
    Exit;

  // output (necessary since pythonoutput write directly into outputmemo)
  if LogFrame.ClearAutoToolButton.Down then
    LogFrame.ClearToolButton.Click;

  // script
  if OptionSaveBeforeRunCheckBox.Checked then begin
    SaveAction.Execute;
    application.ProcessMessages; // update in the tab is immediately visible
  end;

  // selection
  if SynEditCurrent.SelText.IsEmpty then begin
    FScript := SynEditCurrent.Text;
    LogFrame.Log('Execute script "%s"', [TabCurrent.Caption]);
  end else begin
    FScript := SynEditCurrent.SelText;
    FScript := TextSpacesHeadRemove(FScript);
    LogFrame.Log('Execute a fragment of script "%s"', [TabCurrent.Caption]);
  end;

  // comment
//if CommentRemoveOption.Checked then
  //FScript := TStr.RecCommentRemove(FScript);

  // linesempty
//if LinesEmptyOption.Checked then
  //FScript := TStr.RecLinesEmptyRemove(FScript);

  // compile
//FScript := TRvaRec.Rva(FScript);

  // *** CONTINUE IN DESCENDENT FORMS in TPythonEditorForm.RunActionExecute ***
  // [...]
end;

procedure TTextEditorForm.User1ActionExecute(Sender: TObject);
begin
  // *** CONTINUE IN DESCENDENT FORMS ***
  // [...]
end;

procedure TTextEditorForm.User2ActionExecute(Sender: TObject);
begin
  // *** CONTINUE IN DESCENDENT FORMS ***
  // [...]
end;

procedure TTextEditorForm.User3ActionExecute(Sender: TObject);
begin
  // *** CONTINUE IN DESCENDENT FORMS ***
  // [...]
end;

procedure TTextEditorForm.User4ActionExecute(Sender: TObject);
begin
  // *** CONTINUE IN DESCENDENT FORMS ***
  // [...]
end;

procedure TTextEditorForm.User5ActionExecute(Sender: TObject);
begin
  // *** CONTINUE IN DESCENDENT FORMS ***
  // [...]
end;

procedure TTextEditorForm.SpecialCharsActionExecute(Sender: TObject);
begin
  if not TabAvailable then
    Exit;

  gsyn.CharOnOff(SynEditCurrent, SpecialCharsAction.Checked);
end;

procedure TTextEditorForm.LineNumbersActionExecute(Sender: TObject);
begin
  if not TabAvailable then
    Exit;

  SynEditCurrent.Gutter.ShowLineNumbers := LineNumbersAction.Checked;
end;

procedure TTextEditorForm.WordsWrapActionExecute(Sender: TObject);
begin
//  if WrapAction.Checked then begin
//    SynEditCurrent.UseCodeFolding := false;
//    SynEditCurrent.WordWrap       := true;
//  end else begin
//    SynEditCurrent.UseCodeFolding := true;
//    SynEditCurrent.WordWrap       := false;
//  end;

    SynEditCurrent.UseCodeFolding := not WordsWrapAction.Checked;
    SynEditCurrent.WordWrap       := WordsWrapAction.Checked;
end;

procedure TTextEditorForm.NoCaseActionExecute(Sender: TObject);
begin
  gsyg.CaseSensitive := NoCaseAction.Checked; // *** change NoCase to CaseSensitive ***

  if NoCaseAction.ImageIndex = 28 then begin
    NoCaseAction.ImageIndex := 29;
    NoCaseAction.Caption    := 'Case';
    NoCaseAction.HInt       := 'Search with case sensitivity';
  end else begin
    NoCaseAction.ImageIndex := 28;
    NoCaseAction.Caption    := 'No Case';
    NoCaseAction.HInt       := 'Search with case insensitivity';
  end;
end;

procedure TTextEditorForm.JsonTreefyActionExecute(Sender: TObject);
var
  wic: TWinControl;
begin
//if not TabAvailable then
  //Exit;

  if not JsonTreefyAction.Checked then begin
    TreeClear;
  end else begin
    try
      wic := Screen.ActiveControl;
      if wic is TSynEdit then begin
        if (wic as TSynEdit).SelAvail then
          JsonStrTreefy((wic as TSynEdit).SelText)
        else
          JsonStrTreefy((wic as TSynEdit).Text)
      end else if wic is TRichEdit then begin
        if not (wic as TRichEdit).SelText.IsEmpty then
          JsonStrTreefy((wic as TRichEdit).SelText)
        else
          JsonStrTreefy((wic as TRichEdit).Text);
      end;
    except
      on e: Exception do
        MessageDlg(e.Message, TMsgDlgType.mtWarning, [mbOk], 0, mbOk);
    end;
  end;
end;

procedure TTextEditorForm.JsonFormatActionExecute(Sender: TObject);
var
  wic: TWinControl;
  juf, jfm: string; // json un/formatted
begin
  wic := Screen.ActiveControl;
  if wic is TSynEdit then begin
    if not (wic as TSynEdit).SelAvail then
      TMesRec.I('Please select a valid json string')
    else
      juf := (wic as TSynEdit).SelText;
  end else if wic is TRichEdit then begin
    if (wic as TRichEdit).SelText.IsEmpty then
      TMesRec.I('Please select a valid json string')
    else
      juf := (wic as TRichEdit).Text;
  end;
  if not juf.IsEmpty then begin
    jfm := TJsoRec.Pretty(juf);
    LogFrame.Output(jfm);
  end;
end;

procedure TTextEditorForm.SpellcheckActionExecute(Sender: TObject);
var
  txt: string;
begin
  if not TabAvailable then
    Exit;

  if SynEditCurrent.SelText.IsEmpty then begin
    txt := SynEditCurrent.Text;
    if TSpellcheckDialogForm.Execute(txt) then
      SynEditCurrent.Text := txt;
  end else begin
    txt := SynEditCurrent.SelText;
    if TSpellcheckDialogForm.Execute(txt) then
      SynEditCurrent.SelText := txt;
  end;
end;

procedure TTextEditorForm.LayoutActionExecute(Sender: TObject);
begin
  if LayoutAction.ImageIndex = 11 then begin
    LayoutAction.ImageIndex              := 12;
    RightPanel.Tag                       := RightPanel.Width;
    RightPanel.Width                     := ClientWidth div 2;

    LogFrame.OutputTabSheet.PageControl  := RightPageControl;
    LogFrame.GridTabSheet.PageControl    := RightPageControl;
    RightPageControl.ActivePage          := LogFrame.OutputTabSheet;
    LogFrame.OutputTabSheet.PageIndex    := 0;
  //LogFrame.ConsoleSplitter.Visible     := false;
  //LogFrame.LogRichEdit.Visible         := false;

  end else begin
    LayoutAction.ImageIndex              := 11;
    RightPanel.Width                     := RightPanel.Tag;
    RightPanel.Tag                       := 0;

    LogFrame.OutputTabSheet.PageControl  := LogFrame.LogPageControl;
    LogFrame.GridTabSheet.PageControl    := LogFrame.LogPageControl;
    LogFrame.LogPageControl.ActivePage   := LogFrame.OutputTabSheet;
    LogFrame.OutputTabSheet.PageIndex    := 0;
  //LogFrame.ConsoleSplitter.Visible     := true;
  //LogFrame.ConsoleSplitter.Left        := LogFrame.LogRichEdit.Left - LogFrame.ConsoleSplitter.Width;
  //LogFrame.LogRichEdit.Visible         := true;
  end;
end;
  {$ENDREGION}

  {$REGION 'SynEdit'}
procedure TTextEditorForm.MatchPrevActionExecute(Sender: TObject);
var
  key: word;
begin
  if (not SynEditCurrent.SelAvail) and (MatchPrevAction.Hint.IsEmpty) and (MatchNextAction.Hint.IsEmpty) then begin
    TMesRec.I('Please select some text to search...');
    Exit;
  end;

  // cache
  MatchPrevAction.Hint := Format('Search previous "%s"', [SynEditCurrent.SelText]);

  // stdshorcuts (simulate ctrl+shift+F)
  key := vkF;
  gsyn.SynEditOnKeyUp(SynEditCurrent, key, [ssShift, ssCtrl]);
end;

procedure TTextEditorForm.MatchNextActionExecute(Sender: TObject);
var
  key: word;
begin
  if (not SynEditCurrent.SelAvail) and (MatchPrevAction.Hint.IsEmpty) and (MatchNextAction.Hint.IsEmpty) then begin
    TMesRec.I('Please select some text to search...');
    Exit;
  end;

  // cache
  MatchNextAction.Hint := Format('Search next "%s"', [SynEditCurrent.SelText]);

  // stdshorcuts (simulate ctrl+F)
  key := vkF;
  gsyn.SynEditOnKeyUp(SynEditCurrent, key, [ssCtrl]);
end;

procedure TTextEditorForm.SynEditInsertHeaderActionExecute(Sender: TObject);
begin
  gsyn.InsertHeader(SynEditCurrent);
end;

procedure TTextEditorForm.SynEditInsertRegionActionExecute(Sender: TObject);
begin
  gsyn.InsertRegion(SynEditCurrent);
end;
  {$ENDREGION}

  {$REGION 'Utils'}
function  SortDesc(List: TStringList; Index1, Index2: integer): integer;
begin
  Result := -AnsiCompareText(List[Index1], List[Index2]); // negate the result so a descending sort is done
end;

procedure TTextEditorForm.SortAscActionExecute(Sender: TObject);
var
  car: TBufferCoord;
  sli: TStringList;
begin
  if not TabAvailable then
    Exit;

  if not SynEditCurrent.SelAvail then begin
    TMesRec.W('Please select some lines of text');
    Exit;
  end;

  car := SynEditCurrent.CaretXY;
  sli := TStringList.Create;
  try
    sli.Text := SynEditCurrent.SelText;
    sli.Sort;
    SynEditCurrent.SelText := sli.Text.Trim;
  finally
    sli.Free;
  end;
  SynEditCurrent.CaretXY := car;
end;

procedure TTextEditorForm.SortDescActionExecute(Sender: TObject);
var
  car: TBufferCoord;
  sli: TStringList;
begin
  if not TabAvailable then
    Exit;

  if not SynEditCurrent.SelAvail then begin
    TMesRec.W('Please select some lines of text');
    Exit;
  end;

  car := SynEditCurrent.CaretXY;
  sli := TStringList.Create;
  try
    sli.Text := SynEditCurrent.SelText;
    sli.CustomSort(SortDesc);
    SynEditCurrent.SelText := sli.Text.Trim;
  finally
    sli.Free;
  end;
  SynEditCurrent.CaretXY := car;
end;

procedure TTextEditorForm.LineNumberingActionExecute(Sender: TObject);
var
  car: TBufferCoord;
  sli: TStringList;
  cha: string;
  i: integer;
begin
  if not TabAvailable then
    Exit;

  if not TAskRec.Str('Line Numbers', 'Input a char after each number', ') ', cha) then
    Exit;

  car := SynEditCurrent.CaretXY;
  sli := TStringList.Create;
  try
    sli.Text := SynEditCurrent.SelText;
    for i := 0 to sli.Count - 1 do
      sli[i] := i.ToString + cha + sli[i];
    SynEditCurrent.SelText := sli.Text;
  finally
    sli.Free;
  end;
  SynEditCurrent.CaretXY := car;
end;

procedure TTextEditorForm.LineBeginWithActionExecute(Sender: TObject);
var
  car: TBufferCoord;
  sli: TStringList;
  i: integer;
begin
  if not TabAvailable then
    Exit;

  if not TAskRec.Str('Line Begin With', 'Input a string all lines will begin with', FLineBeginWith, FLineBeginWith) then
    Exit;

  car := SynEditCurrent.CaretXY;
  sli := TStringList.Create;
  try
    sli.Text := SynEditCurrent.SelText;
    for i := 0 to sli.Count - 1 do
      sli[i] := FLineBeginWith + sli[i];
    SynEditCurrent.SelText := sli.Text;
  finally
    sli.Free;
  end;
  SynEditCurrent.CaretXY := car;
end;

procedure TTextEditorForm.TabsToSpacesActionExecute(Sender: TObject);
var
  taz: integer; // tabwidth
  spa: string;  // spaces
  cxy: TBufferCoord;
begin
  taz := StrToIntDef(OptionTabWidthEdit.Text, 2);
  if TAskRec.No(Format('Replace all TABS with %d SPACES?', [taz])) then
    Exit;

  spa := TStrRec.StrReplicate(' ', taz);
  cxy := SynEditCurrent.CaretXY;
  SynEditCurrent.Text := StringReplace(SynEditCurrent.Text, #9, spa, [rfReplaceAll]);
  SynEditCurrent.CaretXY := cxy;
end;

procedure TTextEditorForm.SpacesToTabsActionExecute(Sender: TObject);
var
  taz: integer; // tabwidth
  spa: string;  // spaces
  cxy: TBufferCoord;
begin
  taz := StrToIntDef(OptionTabWidthEdit.Text, 2);
  if TAskRec.No(Format('Replace all %d SPACES with TABS?', [taz])) then
    Exit;

  spa := TStrRec.StrReplicate(' ', taz);
  cxy := SynEditCurrent.CaretXY;
  SynEditCurrent.Text := StringReplace(SynEditCurrent.Text, spa, #9, [rfReplaceAll]);
  SynEditCurrent.CaretXY := cxy;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'PageControl'}
procedure TTextEditorForm.MainPageControlChange(Sender: TObject);
begin
  FoldingAction.Checked := SynEditCurrent.UseCodeFolding;
end;

  {$REGION 'TabReorder'}
procedure TTextEditorForm.MainPageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MainPageControl.BeginDrag(False);
end;

procedure TTextEditorForm.MainPageControlDragDrop(Sender, Source: TObject; X, Y: Integer);
const
  TCM_GETITEMRECT = $130A;
var
  i: Integer;
  r: TRect;
begin
  if not (Sender is TPageControl) then
    Exit;
  with MainPageControl do begin
    for i := 0 to PageCount - 1 do begin
      Perform(TCM_GETITEMRECT, i, lParam(@r));
      if PtInRect(r, Point(X, Y)) then begin
        if i <> ActivePage.PageIndex then
          ActivePage.PageIndex := i;
        Exit;
      end;
    end;
  end;
end;

procedure TTextEditorForm.MainPageControlDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: boolean);
begin
  if Sender is TPageControl then
    Accept := true;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'TreeVst'}
procedure TTextEditorForm.TreeVstGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TTreeNode);
end;

procedure TTextEditorForm.TreeVstFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  nod: PTreeNode; // nodedata
begin
  nod := PTreeNode(TreeVst.GetNodeData(Node));
  nod.Index := 0;
  nod.Name := '';
  nod.SuperObjectI := nil;
end;

procedure TTextEditorForm.TreeVstChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  StatusBar.Panels[1].Text := TreeNodePath(TreeVst, Node); // VstTree.Path(Node, 0, '/');
  TreeNodeValueSynEdit.Text := TreeNodeValue(TreeVst, Node, true, false);
end;

procedure TTextEditorForm.TreeVstGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  nod: PTreeNode; // nodedata
begin
  nod := TreeVst.GetNodeData(Node);
  case Column of
    0: CellText := nod.Name;
    1: begin
      case ObjectGetType(nod.SuperObjectI) of
        stObject: CellText := '[object]';
        stArray : CellText := '[array]';
        stNull  : CellText := '[null]';
      else
        CellText := nod.SuperObjectI.AsString;
      end;
    end;
  end;
end;

procedure TTextEditorForm.TreeVstCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  n1d, n2d, pad: PTreeNode; // node1, node2, parent
begin
  case Column of
  0: begin
      pad := TreeVst.GetNodeData(Node1.Parent);
      n1d := TreeVst.GetNodeData(Node1);
      n2d := TreeVst.GetNodeData(Node2);
      if (pad <> nil) and ObjectIsType(pad.SuperObjectI, stArray) then
        Result := n1d.Index - n2d.Index
      else
        Result := CompareText(n1d.name, n2d.name);
    end;
  end;
end;

procedure TTextEditorForm.TreeVstHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
begin
  TreeVst.BeginUpdate;
  try
    Sender.SortDirection := TSortDirection(1 - Ord(Sender.SortDirection));
  finally
    TreeVst.EndUpdate;
  end;
end;

procedure TTextEditorForm.TreeCollapseActionExecute(Sender: TObject);
var
  nod: PVirtualNode;
begin
  nod := TreeVst.GetFirstSelected;
  if not Assigned(nod) then begin
    TMesRec.I('Please select a node');
    Exit;
  end;

  nod := nod.FirstChild;
  TreeVst.BeginUpdate;
  while Assigned(nod) do begin
    TreeVst.FullCollapse(nod);
    nod := TreeVst.GetNextSibling(nod);
  end;
  TreeVst.EndUpdate;
end;

procedure TTextEditorForm.TreeExpandActionExecute(Sender: TObject);
var
  nod: PVirtualNode;
begin
  nod := TreeVst.GetFirstSelected;
  if not Assigned(nod) then begin
    TMesRec.I('Please select a node');
    Exit;
  end;

  nod := nod.FirstChild;
  TreeVst.BeginUpdate;
  while Assigned(nod) do begin
    TreeVst.FullExpand(nod);
    nod := TreeVst.GetNextSibling(nod);
  end;
  TreeVst.EndUpdate;
end;

//class function  TJsonTreeForm.Execute(var IvJson: string): boolean;
//var
//  frm: TJsonTreeForm;
//begin
//  frm := TJsonTreeForm.Create(nil);
//  try
//    frm.VstUpdate(SO(IvJson));
//    Result := frm.ShowModal = mrOk;
//    if Result then
//      IvJson := frm.NodeSource(frm.VstTree, frm.VstTree.TopNode, true);
//  finally
//    FreeAndNil(frm);
//  end;
//end;

//procedure TJsonForm.ActionFileOpenAccept(Sender: TObject);
//var
//  e: string;
//begin
//  e := ExtractFileExt(TFileOpen(sender).Dialog.FileName);
//  if Sametext(e, '.xml') then
//    UpdateRoot(XMLParseFile(TFileOpen(sender).Dialog.FileName, true))
//  else if Sametext(e, '.json') then
//    UpdateRoot(TSuperObject.ParseFile(TFileOpen(sender).Dialog.FileName, False))
//  else
//    msg.Show('Unknown file extesion');
//end;
{$ENDREGION}

{$REGION 'Options'}
procedure TTextEditorForm.OptionDirDefaultLabelClick(Sender: TObject);
var
  k: string;
begin
  if not DirectoryExists(OptionDirDefaultEdit.Text) then begin
    TMesRec.I('Temp directory %s does not exist', [OptionDirDefaultEdit.Text]);
    Exit;
  end;

  if not TWinRec.WinShellExec(Application.Handle, {'explorer.exe ' +} OptionDirDefaultEdit.Text, k) then
    TMesRec.W(k);
end;

procedure TTextEditorForm.OptionTabWidthEditChange(Sender: TObject);
var
  i: integer;
begin
  // tree
  TreeNodeValueSynEdit.TabWidth := OptionTabWidthDef;

  // documents
  for i := 0 to MainPageControl.PageCount - 1 do
    (MainPageControl.Pages[i].Controls[0] as TSynEdit).TabWidth := OptionTabWidthDef;
end;

procedure TTextEditorForm.OptionPythonVersionComboBoxChange(Sender: TObject);
begin
  OptionPythonEngineRecycleSpeedButton.Click;
end;

procedure TTextEditorForm.OptionPythonEngineRecycleSpeedButtonClick(Sender: TObject);
begin
  PythonComponentsReset;
end;

procedure TTextEditorForm.OptionPythonRawOutputCheckBoxClick(Sender: TObject);
begin
  PythonGUIInputOutput1.RawOutput := OptionPythonRawOutputCheckBox.Checked;
end;
{$ENDREGION}

end.
