unit WksBaseClientMainFormUnit;

{*** CLIENT ANCESTOR CONTAINING ONLY "OBJECT"  ***}

{ what    table       scope/part                   managedin
  ------------------------------------------------------------------------------
  OBJECT  TblObject   fixed/general/master         this happens in this ancestor form
  XXX     TblXxx      variable/specific/detail     this happens in descendent forms, same events

        1    2            3             4       5        6      7     8         9     10      11      12
  XXX = Xxx, Person+User, Organization, Member, Account, Agent, Code, Document, Page, Report, System, Task
}

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , System.Actions
  , System.ImageList
  , Vcl.ActnList
  , Vcl.Buttons
  , Vcl.ComCtrls
  , Vcl.Controls
  , Vcl.DBCtrls
//, Vcl.DBGrids
  , Vcl.Dialogs
  , Vcl.ExtCtrls
  , Vcl.ExtDlgs
  , Vcl.Forms
  , Vcl.Graphics
//, Vcl.Grids
  , Vcl.ImgList
  , Vcl.Mask
  , Vcl.StdCtrls
  , Vcl.ToolWin
  , Vcl.AppEvnts
  , Vcl.Menus
  , Data.DB
  , Datasnap.DBClient
  , Midaslib // *** without it the client, on a different pc, give a blocching, hard to find error ***
  , Soap.SOAPConn
  , SynEdit
  , SynDBEdit
  , SynEditCodeFolding
  , JvCaptionPanel
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
  , JvClock
  , JvComponentBase
  , JvNavigationPane
  , VirtualTrees
  , DTClientTree
  , DTDBTreeView
  , PythonEngine, PythonVersions, Vcl.PythonGUIInputOutput
  , Wks000Unit
  , WksLogFrameUnit
  , WksPythonUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TBaseMainForm = class(TForm)
    ActionBrowseAction: TAction;
    ActionBrowseToolButton: TToolButton;
    ActionEditAction: TAction;
    ActionEditToolButton: TToolButton;
    ActionFitAction: TAction;
    ActionFitToolButton: TToolButton;
    ActionGotoAction: TAction;
    ActionGotoToolButton: TToolButton;
    ActionLoadFromFileAction: TAction;
    ActionLoadFromFileToolButton: TToolButton;
    ActionMarkdownAction: TAction;
    ActionMarkdownToolButton: TToolButton;
    ActionPersistedOpenAction: TAction;
    ActionPersistedOpenToolButton: TToolButton;
    ActionPostAction: TAction;
    ActionPostToolButton: TToolButton;
    ActionRefreshAction: TAction;
    ActionRefreshToolButton: TToolButton;
    ActionSaveToFileAction: TAction;
    ActionSaveToFileToolButton: TToolButton;
    ActionTabSheet: TTabSheet;
    ActionZzzAction: TAction;
    ActionZzzToolButton: TToolButton;
    ActionsAction: TActionList;
    ActionsImageList24: TImageList;
    ActionsToolBar: TToolBar;
    ApplicationEvents: TApplicationEvents;
    BottomJvNetscapeSplitter: TJvNetscapeSplitter;
    BottomPanel: TPanel;
    ButtonedImageList: TImageList;
    ClientAction: TActionList;
    ClientDonateAction: TAction;
    ClientDonateToolButton: TToolButton;
    ClientExitAction: TAction;
    ClientExitToolButton: TToolButton;
    ClientHelpAction: TAction;
    ClientHelpToolButton: TToolButton;
    ClientImageList24: TImageList;
    ClientInfoAction: TAction;
    ClientShareAction: TAction;
    ClientShareToolButton: TToolButton;
    ClientTabSheet: TTabSheet;
    ClientToolBar: TToolBar;
    ClientVersionAction: TAction;
    ClientVersionCheckToolButton: TToolButton;
    ClientnfoToolButton: TToolButton;
    ContentPrevTabSheet: TTabSheet;
    ContentTabSheet: TTabSheet;
    DayLabel: TLabel;
    JsonTabSheet: TTabSheet;
    LeftJvNetscapeSplitter: TJvNetscapeSplitter;
    LeftPageControl: TPageControl;
    LeftPanel: TPanel;
    LogFrame: TLogFrame;
    MainPageControl: TPageControl;
    MainPanel: TPanel;
    MainSoapConnection: TSoapConnection;
    MemberBadgeImage: TImage;
    MemberMemberLabel2: TLabel;
    MemberMemberLabel: TLabel;
    MemberRoleLevelLabel2: TLabel;
    MemberRoleLevelLabel: TLabel;
    MemberTabSheet: TTabSheet;
    MonthLabel: TLabel;
    NoteTabSheet: TTabSheet;
    ObjectApprovalJvScrollMaxBand: TJvScrollMaxBand;
    ObjectClientDataSet: TClientDataSet;
    ObjectContentCharCountLabel: TLabel;
    ObjectContentDBSynEdit: TDBSynEdit;
    ObjectContentKindDBComboBox: TDBComboBox;
    ObjectContentKindLabel: TLabel;
    ObjectContentPrevDBSynEdit: TDBSynEdit;
    ObjectContentPrevSaveSpeedButton: TSpeedButton;
    ObjectContentPrevTopPanel: TPanel;
    ObjectContentTopPanel: TPanel;
    ObjectCreatedDBText: TDBText;
    ObjectCreatedLabel: TLabel;
    ObjectDBEdit: TDBEdit;
    ObjectDBNavigator: TDBNavigator;
    ObjectDTClientTree: TDTClientTree;
    ObjectDataCharCountLabel: TLabel;
    ObjectDataDBSynEdit: TDBSynEdit;
    ObjectDataKindDBComboBox: TDBComboBox;
    ObjectDataKindLabel: TLabel;
    ObjectDataSource: TDataSource;
    ObjectDataTopPanel: TPanel;
    ObjectDataValidateSpeedButton: TSpeedButton;
    ObjectDateJvScrollMaxBand: TJvScrollMaxBand;
    ObjectDescriptionDBEdit: TDBEdit;
    ObjectDescriptionLabel: TLabel;
    ObjectEncryptedDBCheckBox: TDBCheckBox;
    ObjectFromAreaDBEdit: TDBEdit;
    ObjectFromAreaLabel: TLabel;
    ObjectFromDepartmentDBEdit: TDBEdit;
    ObjectFromDepartmentLabel: TLabel;
    ObjectFromJvScrollMaxBand: TJvScrollMaxBand;
    ObjectFromMemberDBEdit: TDBEdit;
    ObjectFromMemberLabel: TLabel;
    ObjectFromOrganizationDBEdit: TDBEdit;
    ObjectFromOrganizationLabel: TLabel;
    ObjectFromTeamDBEdit: TDBEdit;
    ObjectFromTeamLabel: TLabel;
    ObjectGeneralJvScrollMaxBand: TJvScrollMaxBand;
    ObjectId8DBEdit: TDBEdit;
    ObjectId8Label: TLabel;
    ObjectIdDBEdit: TDBEdit;
    ObjectIdDBText: TDBText;
    ObjectIdJvScrollMaxBand: TJvScrollMaxBand;
    ObjectIdLabel: TLabel;
    ObjectImageClearLabel: TLabel;
    ObjectImageDBImage: TDBImage;
    ObjectImageEditLabel: TLabel;
    ObjectImageFitLabel: TLabel;
    ObjectImageJvScrollMaxBand: TJvScrollMaxBand;
    ObjectImageLoadLabel: TLabel;
    ObjectImageSaveLabel: TLabel;
    ObjectJobGradeCalculateLabel: TLabel;
    ObjectJobGradeMinDBComboBox: TDBComboBox;
    ObjectJobGradeMinLabel: TLabel;
    ObjectJvScrollMax: TJvScrollMax;
    ObjectKindDBComboBox: TDBComboBox;
    ObjectKindDBText: TDBText;
    ObjectKindImageList16: TImageList;
    ObjectKindLabel: TLabel;
    ObjectNodeInfoLabel: TLabel;
    ObjectNoteDBSynEdit: TDBSynEdit;
    ObjectNoteTopPanel: TPanel;
    ObjectOrderDBEdit: TDBEdit;
    ObjectOrderLabel: TLabel;
    ObjectPIdDBEdit: TDBEdit;
    ObjectPIdLabel: TLabel;
    ObjectPersinstentDBCheckBox: TDBCheckBox;
    ObjectRevDBEdit: TDBEdit;
    ObjectRevLabel: TLabel;
    ObjectRouteDBEdit: TDBEdit;
    ObjectRouteLabel: TLabel;
    ObjectSpareDBEdit: TDBEdit;
    ObjectSpareLabel: TLabel;
    ObjectStateDBComboBox: TDBComboBox;
    ObjectStateDBText: TDBText;
    ObjectStateImageList24: TImageList;
    ObjectStateLabel: TLabel;
    ObjectSubtitleDBEdit: TDBEdit;
    ObjectSubtitleLabel: TLabel;
    ObjectTabSheet: TTabSheet;
    ObjectTitleDBEdit: TDBEdit;
    ObjectTitleLabel: TLabel;
    ObjectToAreaDBEdit: TDBEdit;
    ObjectToAreaLabel: TLabel;
    ObjectToDepartmentDBEdit: TDBEdit;
    ObjectToDepartmentLabel: TLabel;
    ObjectToJvScrollMaxBand: TJvScrollMaxBand;
    ObjectToMemberDBEdit: TDBEdit;
    ObjectToMemberLabel: TLabel;
    ObjectToOrganizationDBEdit: TDBEdit;
    ObjectToOrganizationLabel: TLabel;
    ObjectToTeamDBEdit: TDBEdit;
    ObjectToTeamLabel: TLabel;
    ObjectTreeTabSheet: TTabSheet;
    ObjectTypeJvScrollMaxBand: TJvScrollMaxBand;
    ObjectUpdatedDBText: TDBText;
    ObjectUpdatedLabel: TLabel;
    OpenDialog: TOpenDialog;
    OptionAlwaysOnTopCheckBox: TCheckBox;
    OptionAutoHideCheckBox: TCheckBox;
    OptionAutoLoginCheckBox: TCheckBox;
    OptionAutoRefreshCheckBox: TCheckBox;
    OptionAutoRunCheckBox: TCheckBox;
    OptionBackupOnExitCheckBox: TCheckBox;
    OptionCommentRemoveCheckBox: TCheckBox;
    OptionCryptoKeyEdit: TEdit;
    OptionCryptoKeyLabel: TLabel;
    OptionDateTimeJvScrollMaxBand: TJvScrollMaxBand;
    OptionFoldersJvScrollMaxBand: TJvScrollMaxBand;
    OptionFoldingLineShowCheckBox: TCheckBox;
    OptionFontSizeJvSpinEdit: TJvSpinEdit;
    OptionFontSizeLabel: TLabel;
    OptionInterfaceJvScrollMaxBand: TJvScrollMaxBand;
    OptionJvScrollMax: TJvScrollMax;
    OptionMessageBeforeHideCheckBox: TCheckBox;
    OptionPasswordOnMaximizeCheckBox: TCheckBox;
    OptionPersistRootFolderEdit: TEdit;
    OptionPersistRootFolderLabel: TLabel;
    OptionPythonEnvInitSpeedButton: TSpeedButton;
    OptionPythonJvScrollMaxBand: TJvScrollMaxBand;
    OptionPythonRawOutputCheckBox: TCheckBox;
    OptionPythonVersionComboBox: TComboBox;
    OptionPythonVersionLabel: TLabel;
    OptionSecurityJvScrollMaxBand: TJvScrollMaxBand;
    OptionShowInTrayCheckBox: TCheckBox;
    OptionShowJvScrollMaxBand: TJvScrollMaxBand;
    OptionStateDefaultComboBox: TComboBox;
    OptionStateDefaultLabel: TLabel;
    OptionTabSheet: TTabSheet;
    OptionTabWidthJvSpinEdit: TJvSpinEdit;
    OptionTabWidthLabel: TLabel;
    OptionTempFolderEdit: TEdit;
    OptionTempFolderLabel: TLabel;
    OptionVerboseCheckBox: TCheckBox;
    OptionWeekWorkOneStartJvDateTimePicker: TJvDateTimePicker;
    OptionWeekWorkOneStartLabel: TLabel;
    OptionWorkWeekDayEdit: TEdit;
    OptionWorkWeekDayLabel: TLabel;
    OptionWorkWeekTimeEdit: TEdit;
    OptionWorkWeekTimeLabel: TLabel;
    OrganizationLogoImage: TImage;
    OrganizationNameLabel2: TLabel;
    OrganizationNameLabel: TLabel;
    OrganizationOrganizationLabel2: TLabel;
    OrganizationOrganizationLabel: TLabel;
    OrganizationTabSheet: TTabSheet;
    PersonNameLabel2: TLabel;
    PersonNameLabel: TLabel;
    PersonPictureImage: TImage;
    PersonSurnameLabel2: TLabel;
    PersonSurnameLabel: TLabel;
    PersonTabSheet: TTabSheet;
    PropertyTabSheet: TTabSheet;
    RegionExpand1: TMenuItem;
    ReplaceButtonedEdit: TButtonedEdit;
    ReplaceLabel: TLabel;
    RightJvNetscapeSplitter: TJvNetscapeSplitter;
    RightPageControl: TPageControl;
    RightPanel: TPanel;
    SaveDialog: TSaveDialog;
    SearchButtonedEdit: TButtonedEdit;
    SearchFilterPanel: TPanel;
    SearchInContentCheckBox: TCheckBox;
    SearchInDataCheckBox: TCheckBox;
    SearchInLabel: TLabel;
    SearchInNoteCheckBox: TCheckBox;
    SearchLabel: TLabel;
    SearchMatchCaseCheckBox: TCheckBox;
    SearchReplaceSwapLabel: TLabel;
    SearchResultListBox: TListBox;
    SearchTabSheet: TTabSheet;
    SearchWholeWordCheckBox: TCheckBox;
    StatusBar: TStatusBar;
    SynEditInsertRegionPopup: TMenuItem;
    SynEditPopup: TPopupMenu;
    SynEditRegionCollapseAction: TAction;
    SynEditRegionExpandAction: TAction;
    SynEditRegionInsertAction: TAction;
    SynEditRegionInsertPopup: TMenuItem;
    SysEditAction: TActionList;
    SysEditImageList24: TImageList;
    TextAction: TActionList;
    TextCommentAction: TAction;
    TextCommentToolButton: TToolButton;
    TextCompareAction: TAction;
    TextCompareToolButton: TToolButton;
    TextFoldAction: TAction;
    TextFoldToolButton: TToolButton;
    TextFoldingAction: TAction;
    TextFoldingToolButton: TToolButton;
    TextGutterAction: TAction;
    TextGutterToolButton: TToolButton;
    TextImageList24: TImageList;
    TextLineNumbersAction: TAction;
    TextLineNumbersToolButton: TToolButton;
    TextReplaceAction: TAction;
    TextReplaceToolButton: TToolButton;
    TextSearchAction: TAction;
    TextSearchNextAction: TAction;
    TextSearchNextToolButton: TToolButton;
    TextSearchPrevAction: TAction;
    TextSearchPrevToolButton: TToolButton;
    TextSearchToolButton: TToolButton;
    TextSpecialCharsAction: TAction;
    TextSpecialCharsToolButton: TToolButton;
    TextTabToSpacesAction: TAction;
    TextTabToSpacesToolButton: TToolButton;
    TextToolBar: TToolBar;
    TextUtilsLineBeginWithPopup: TMenuItem;
    TextUtilsLineNumbersAction: TAction;
    TextUtilsLineNumbersPopup: TMenuItem;
    TextUtilsLinePrefixWithAction: TAction;
    TextUtilsPopup: TPopupMenu;
    TextUtilsSortAscAction: TAction;
    TextUtilsSortAscPopup: TMenuItem;
    TextUtilsSortDescAction: TAction;
    TextUtilsSortDescPopup: TMenuItem;
    TextUtilsStatsAction: TAction;
    TextUtilsTextStatsPopup: TMenuItem;
    TextUtilsToolButton: TToolButton;
    TextWordWrapAction: TAction;
    TextWordWrapToolButton: TToolButton;
    TextZeroStartAction: TAction;
    TextZeroStartToolButton: TToolButton;
    TimeTabSheet: TTabSheet;
    TimerJvClock: TJvClock;
    TimerJvThreadTimer: TJvThreadTimer;
    TimerLabel: TLabel;
    TopPageControl2: TPageControl;
    TopPageControl3: TPageControl;
    TopPageControl: TPageControl;
    TopPanel: TPanel;
    TopReplaceButton: TButton;
    TopReplaceInEdit: TEdit;
    TopReplaceInLabel: TLabel;
    TopReplaceMatchCaseICheckBox: TCheckBox;
    TopReplaceNextButton: TButton;
    TopReplaceOutEdit: TEdit;
    TopReplaceOutLabel: TLabel;
    TopReplaceSwapLabel: TLabel;
    TopReplaceWholeCheckBox: TCheckBox;
    TopSearchTabSheet: TTabSheet;
    TopTextTabSheet: TTabSheet;
    TopUtilsTabSheet: TTabSheet;
    UserAvatarImage: TImage;
    UserPasswordLabel2: TLabel;
    UserPasswordLabel: TLabel;
    UserTabSheet: TTabSheet;
    UserUsernameLabel2: TLabel;
    UserUsernameLabel: TLabel;
    UtilsActionList: TActionList;
    UtilsImageList: TImageList;
    UtilsPythonExecAction: TAction;
    UtilsPythonExecToolButton: TToolButton;
    UtilsToolBar: TToolBar;
    WeekLabel: TLabel;
    WeekdayLabel: TLabel;
    YearLabel: TLabel;
    procedure ActionBrowseActionExecute(Sender: TObject);
    procedure ActionEditActionExecute(Sender: TObject);
    procedure ActionFitActionExecute(Sender: TObject);
    procedure ActionGotoActionExecute(Sender: TObject);
    procedure ActionLoadFromFileActionExecute(Sender: TObject);
    procedure ActionMarkdownActionExecute(Sender: TObject);
    procedure ActionPersistedOpenActionExecute(Sender: TObject);
    procedure ActionPostActionExecute(Sender: TObject);
    procedure ActionRefreshActionExecute(Sender: TObject);
    procedure ActionSaveToFileActionExecute(Sender: TObject);
    procedure ActionZzzActionExecute(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure ClientDonateActionExecute(Sender: TObject);
    procedure ClientExitActionExecute(Sender: TObject);
    procedure ClientHelpActionExecute(Sender: TObject);
    procedure ClientInfoActionExecute(Sender: TObject);
    procedure ClientShareActionExecute(Sender: TObject);
    procedure ClientVersionActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure MainSoapConnectionAfterExecute(const MethodName: string; SOAPResponse: TStream);
    procedure MainSoapConnectionBeforeExecute(const MethodName: string; SOAPRequest: TStream);
    procedure ObjectClientDataSetAfterDelete(DataSet: TDataSet);
    procedure ObjectClientDataSetAfterInsert(DataSet: TDataSet);
    procedure ObjectClientDataSetAfterPost(DataSet: TDataSet);
    procedure ObjectClientDataSetAfterRefresh(DataSet: TDataSet);
    procedure ObjectClientDataSetAfterScroll(DataSet: TDataSet);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure ObjectClientDataSetBeforeInsert(DataSet: TDataSet);
    procedure ObjectClientDataSetBeforePost(DataSet: TDataSet);
    procedure ObjectClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure ObjectContentDBSynEditChange(Sender: TObject);
    procedure ObjectContentDBSynEditDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure ObjectContentDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ObjectContentDBSynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ObjectContentDBSynEditMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ObjectContentDBSynEditStatusChange(Sender: TObject; Changes: TSynStatusChanges);
    procedure ObjectContentKindDBComboBoxChange(Sender: TObject);
    procedure ObjectContentPrevDBSynEditChange(Sender: TObject);
    procedure ObjectContentPrevDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ObjectContentPrevSaveSpeedButtonClick(Sender: TObject);
    procedure ObjectDBEditKeyPress(Sender: TObject; var Key: Char);
    procedure ObjectDTClientTreeClick(Sender: TObject);
    procedure ObjectDTClientTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure ObjectDTClientTreeDBTreeCreateNode(Sender: TDTDBTreeView; Node: PVirtualNode; DataSet: TDataSet);
    procedure ObjectDTClientTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex);
    procedure ObjectDTClientTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure ObjectDataDBSynEditChange(Sender: TObject);
    procedure ObjectDataDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ObjectDataValidateSpeedButtonClick(Sender: TObject);
    procedure ObjectImageClearLabelClick(Sender: TObject);
    procedure ObjectImageFitLabelClick(Sender: TObject);
    procedure ObjectImageLoadLabelClick(Sender: TObject);
    procedure ObjectImageSaveLabelClick(Sender: TObject);
    procedure ObjectJobGradeCalculateLabelClick(Sender: TObject);
    procedure ObjectKindDBComboBoxChange(Sender: TObject);
    procedure ObjectNoteDBSynEditChange(Sender: TObject);
    procedure ObjectNoteDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OptionFoldingLineShowCheckBoxClick(Sender: TObject);
    procedure OptionFontSizeJvSpinEditChange(Sender: TObject);
    procedure OptionPythonEnvInitSpeedButtonClick(Sender: TObject);
    procedure OptionPythonRawOutputCheckBoxClick(Sender: TObject);
    procedure OptionPythonVersionComboBoxChange(Sender: TObject);
    procedure OptionTabWidthJvSpinEditChange(Sender: TObject);
    procedure OptionWeekWorkOneStartJvDateTimePickerChange(Sender: TObject);
    procedure ReplaceButtonedEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ReplaceButtonedEditLeftButtonClick(Sender: TObject);
    procedure ReplaceButtonedEditRightButtonClick(Sender: TObject);
    procedure SearchButtonedEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SearchButtonedEditLeftButtonClick(Sender: TObject);
    procedure SearchButtonedEditRightButtonClick(Sender: TObject);
    procedure SearchReplaceSwapLabelClick(Sender: TObject);
    procedure SearchResultListBoxClick(Sender: TObject);
    procedure SynEditRegionCollapseActionExecute(Sender: TObject);
    procedure SynEditRegionExpandActionExecute(Sender: TObject);
    procedure SynEditRegionInsertActionExecute(Sender: TObject);
    procedure TextCommentActionExecute(Sender: TObject);
    procedure TextCompareActionExecute(Sender: TObject);
    procedure TextFoldActionExecute(Sender: TObject);
    procedure TextFoldingActionExecute(Sender: TObject);
    procedure TextGutterActionExecute(Sender: TObject);
    procedure TextLineNumbersActionExecute(Sender: TObject);
    procedure TextReplaceActionExecute(Sender: TObject);
    procedure TextSearchActionExecute(Sender: TObject);
    procedure TextSearchNextActionExecute(Sender: TObject);
    procedure TextSearchPrevActionExecute(Sender: TObject);
    procedure TextSpecialCharsActionExecute(Sender: TObject);
    procedure TextTabToSpacesActionExecute(Sender: TObject);
    procedure TextUtilsLineNumbersActionExecute(Sender: TObject);
    procedure TextUtilsLinePrefixWithActionExecute(Sender: TObject);
    procedure TextUtilsSortAscActionExecute(Sender: TObject);
    procedure TextUtilsSortDescActionExecute(Sender: TObject);
    procedure TextUtilsStatsActionExecute(Sender: TObject);
    procedure TextWordWrapActionExecute(Sender: TObject);
    procedure TextZeroStartActionExecute(Sender: TObject);
    procedure TimerJvClockClick(Sender: TObject);
    procedure TimerJvThreadTimerTimer(Sender: TObject);
    procedure TopReplaceButtonClick(Sender: TObject);
    procedure TopReplaceNextButtonClick(Sender: TObject);
    procedure TopReplaceSwapLabelClick(Sender: TObject);
    procedure UtilsPythonExecActionExecute(Sender: TObject);
    procedure WeekLabelClick(Sender: TObject);
  private
    { Private declarations }
    FObject             : string;          // objectname
    FObjectKind         : string;          // Root, Zzz, Person, ...
    FContentKind        : string;          // Text, Sql, Py, Markdown, ...
    FIdIni              : integer;         // idlastsaved
    FIdGui              : integer;         // idlastduringguitreeclick (after a refresh FId is resetted on cdsafterscroll... so we use FIdGui that is set on treenode click)
    FFromOrganization   : string;          //
    FFromMember         : string;          //
    FInSearchAndReplace : boolean;         // searchspeedup
  //FXxxFieldRecArr     : TXxxFieldRecArr; // xxx variable/specific fields/values asked during new object creation (but in descendent forms!)
    // synedit
    FSynEditCaretPos    : TBufferCoord;    // syneditposcache
    FSynEditTopLinePos  : integer;         // syneditposcache
  //FSynEditIsDragging  : boolean;         // syneditselectiondrag
  //FSynEditDragStartPos: TPoint;          // syneditselectiondrag
    // text
    FTextUtilsLineBeginWith: string;
    // python
    FPythonEngine        : TPythonEngine;         // local
    FPythonGUIInputOutput: TPythonGUIInputOutput; // local
    // routine
    procedure SynEditsSetup;
    function  CdsCloseAll(var IvFbk: string): boolean;
    function  CdsOpenAll(var IvFbk: string): boolean;
    function  SoapRefresh(var IvFbk: string): boolean;
    function  SoapClose(var IvFbk: string): boolean;
    function  SoapOpen(var IvFbk: string): boolean;
  //procedure SoapCancel;
  //procedure ObjectCdsApplyUpdates;
    procedure ObjectGuiEnable(IvEnable: boolean);
    procedure ObjectNodeLocate(IvId: integer);
    procedure ObjectNodeLocateAndExpand(IvId: integer; IvExpand: boolean = true);
    function  ContentKind(IvContentKindDefault: string = 'Txt'): string;
  //procedure ObjectTabsModifiedReset;
    procedure ObjectTabsModifiedUpdateBold; // contenthasdata
    procedure ObjectContentPersistInfo(var IvDir, IvId, IvName, IvFile: string);
    procedure ObjectContentPersist(IvReadOnly: boolean = true);
    procedure ObjectContentPersistOpen;
  public
    { Public declarations }
    FObj               : string;          // Xxx, Account, Code, Person...
    FId                : integer;         // idcurrent
  //FFldObj            : string;          // FldObject
    FNodePath          : string;          // object selected node path
    FNodeKey           : integer;         // object selected node key=oid
    FNodeCaption       : string;          // object selected node caption
    FNodeLevel         : integer;         // object selected node level
    FNodeChildsCount   : integer;         // object selected node childs
    FChildsDeleteOk    : boolean;         // flag to delete xxx childs
    // datetime
    FYear, FQuarter, FMonth   , FWeekIso   , FWeekWork   , FWeekDay, FDay   , FHour     , FMinute, FSecond, FMilliSecond: word;   // integer
                     FMonthStr, FWeekIsoStr, FWeekWorkStr          , FDayStr, FMonthStr3, FDayStr3                      : string; // string
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  BaseMainForm: TBaseMainForm;
{$ENDREGION}

implementation

{$REGION 'Uses'}
{$R *.dfm}

uses
    System.StrUtils
  , System.DateUtils
  , System.Types
  , System.TypInfo
  , System.Rtti
  , System.UITypes
  , System.Diagnostics
//, System.UITypes // vkcodes
  , Vcl.RecError // reconcileerrors
  , Vcl.DBGrids
  , WksLoginFormUnit
  , WksMemberRoleLevelGradeFormUnit
  , WksTextStatsFormUnit
  , WksTextDiffFormUnit
  , WksTextEditorFormUnit
  , WksJsonEditorFormUnit
  , WksPythonEditorFormUnit
  , WksSqlEditorFormUnit
  ;
{$ENDREGION}

{$REGION 'Routines'}

  {$REGION 'Soap'}
function  TBaseMainForm.CdsCloseAll(var IvFbk: string): boolean;
var
  i, z: integer;
  cmp: TComponent;
begin
  try
    // allclientdatasetclose
    z := 0;
    for i := 0 to ComponentCount-1 do begin
      cmp := Components[i];
      if (not (cmp is TControl)) and (not cmp.HasParent) then // directly placed component
        if cmp is TClientDataSet then
          if {cmp.Name <> ObjectImportXmlCds.Name}true then begin
            (cmp as TClientDataSet).Close;
            Inc(z)
          end;
    end;

    // end
    IvFbk := Format('%d local client datasets disconnected from remote providers', [z]);;
    Result := true;
  except
    on e: Exception do begin
      IvFbk := e.Message;
      IvFbk := Format('Unable to disconnect local client datasets from remote providers, %s', [e.Message]);
      Result := false;
    end;
  end;
end;

function  TBaseMainForm.CdsOpenAll(var IvFbk: string): boolean;
var
  i, z: integer;
  cmp: TComponent;
  prv, csv: string; // provider, csv
begin
  try
    // providersget
    TSopRec.SoapProviderCsv(MainSoapConnection, csv);

    // allclientdatasetopen
    z := 0;
    for i := 0 to ComponentCount-1 do begin
      cmp := Components[i];
      if (not (cmp is TControl)) and (not cmp.HasParent) then // directly placed component
        if cmp is TClientDataSet then
          if {cmp.Name <> ObjectImportXmlCds.Name}true then begin
            prv := (cmp as TClientDataSet).ProviderName;
            if not prv.IsEmpty then
              if TStrRec.StrHas(csv, prv) then begin
                (cmp as TClientDataSet).Open;
              Inc(z)
            end;
          end;
    end;

    // end
    IvFbk := Format('%d local client datasets connected to remote providers %s', [z, csv]);
    Result := true;
  except
    on e: Exception do begin
      IvFbk := Format('Unable to connect local client datasets to remote providers, %s', [e.Message]);
      Result := false;
    end;
  end;
end;

function  TBaseMainForm.SoapClose(var IvFbk: string): boolean;
begin
  try
    MainSoapConnection.Close;
    IvFbk := 'Soap connection closed and disconnected from remote server';
    Result := true;
  except
    on e: Exception do begin
      IvFbk := Format('Unable to close Soap connection, %s', [e.Message]);
      Result := false;
    end;
  end;
end;

function  TBaseMainForm.SoapOpen(var IvFbk: string): boolean;
begin
  try
    MainSoapConnection.Open;
    IvFbk := Format('Soap connection activated and connected to remote server %s, Agent used is %s', [MainSoapConnection.URL, MainSoapConnection.RIO.HTTPWebNode.Agent]);
    Result := true;
  except
    on e: Exception do begin
      IvFbk := Format('Unable to activate Soap connection, %s', [e.Message]);
      Result := false;
    end;
  end;
end;

function  TBaseMainForm.SoapRefresh(var IvFbk: string): boolean;
begin
  // clientdatasetsclose
  Result := CdsCloseAll(IvFbk);
  LogFrame.Log(IvFbk, Result);
  if not Result then
    Exit;

  // soapclose
  Result := SoapClose(IvFbk);
  LogFrame.Log(IvFbk, Result);
  if not Result then
    Exit;

  // soapopen
  Result := SoapOpen(IvFbk);
  LogFrame.Log(IvFbk, Result);
  if not Result then
    Exit;

  // clientdatasetsopen
  Result := CdsOpenAll(IvFbk);
  LogFrame.Log(IvFbk, Result);
end;

{procedure TBaseMainForm.SoapCancel;
begin
  // nochanges
  if ObjectClientDataSet.ChangeCount <= 0 then begin
    LogFrame.Log('No changes has been made to %s clientdataset', [FObj]);
    Exit;
  end;

  // ask
  if TAskRec.YesFmt('You made some changes to %s clientdataset, are you sure to discard them?', [FObj]) then
    ObjectClientDataSet.CancelUpdates;
end;

procedure TBaseMainForm.ObjectCdsApplyUpdates;
begin
  // nochanges
  if ObjectClientDataSet.ChangeCount <= 0 then begin
    LogFrame.Log('No changes has been made to %s clientdataset, no actions applied on remote server', [FObj]);
    Exit;
  end;

  // ask
  if TAskRec.NoFmt('You made some changes to %s clientdataset, apply them to remote server?', [FObj]) then
    Exit;

  // applychangestoremoteserver
  try
    if ObjectClientDataSet.ApplyUpdates(0) > 0 then
      TMesRec.I('Update failed for changes in %s clientdataset', [FObj])
    else
      TMesRec.I('Changes in %s clientdataset has been applied to remote server', [FObj]);
  except
    on e: Exception do
      TMesRec.I(e.Message);
  end;
end;}
  {$ENDREGION}

  {$REGION 'Object'}
procedure TBaseMainForm.ObjectGuiEnable(IvEnable: boolean);
begin
  // toolbar
  ActionRefreshAction.Enabled       := true;     // always on
  ActionPostAction.Enabled          := IvEnable;
  ActionGoToAction.Enabled          := IvEnable;
  ActionFitAction.Enabled           := IvEnable;
  ActionEditAction.Enabled          := IvEnable;
  ActionZzzAction.Enabled           := IvEnable;
  ActionLoadFromFileAction.Enabled  := IvEnable;
  ActionSaveToFileAction.Enabled    := IvEnable;
  ActionPersistedOpenAction.Enabled := IvEnable;
  ActionMarkdownAction.Enabled      := IvEnable;

  // tree
  ObjectDTClientTree.Visible  := IvEnable;
  ObjectNodeInfoLabel.Visible := IvEnable;
end;

procedure TBaseMainForm.ObjectNodeLocate(IvId: integer);
begin
  if not ObjectClientDataSet.Active then
    Exit;
  ObjectClientDataSet.Locate('FldId', giif.Int(IvId = 1, FIdIni, IvId), []);
end;

procedure TBaseMainForm.ObjectNodeLocateAndExpand(IvId: integer; IvExpand: boolean);
begin
  ObjectNodeLocate(IvId);
  ObjectDTClientTree.Expanded[ObjectDTClientTree.FocusedNode] := IvExpand;
end;

//procedure TBaseMainForm.ObjectTabsModifiedReset;
//begin
//  ContentPrevTabSheet.Caption := 'Previous';
//  ContentTabSheet.Caption     := 'Content' ;
//  JsonTabSheet.Caption        := '  Data'  ;
//  NoteTabSheet.Caption        := '  Note'  ;
//end;

procedure TBaseMainForm.ObjectTabsModifiedUpdateBold;
var
  cap: string;
begin
  cap := ContentPrevTabSheet.Caption;
  if ObjectContentPrevDBSynEdit.Text.IsEmpty then begin
    if cap.StartsWith('• ') then Delete(cap, 1, 2)
  end else begin
    if not cap.StartsWith('• ') then cap := '• ' + cap
  end;
  ContentPrevTabSheet.Caption := cap;

  cap := ContentTabSheet.Caption;
  if ObjectContentDBSynEdit.Text.IsEmpty then begin
    if cap.StartsWith('• ') then Delete(cap, 1, 2)
  end else begin
    if not cap.StartsWith('• ') then cap := '• ' + cap
  end;
  ContentTabSheet.Caption := cap;

  cap := JsonTabSheet.Caption;
  if ObjectDataDBSynEdit.Text.IsEmpty then begin
    if cap.StartsWith('• ') then Delete(cap, 1, 2)
  end else begin
    if not cap.StartsWith('• ') then cap := '• ' + cap
  end;
  JsonTabSheet.Caption := cap;

  cap := NoteTabSheet.Caption;
  if ObjectNoteDBSynEdit.Text.IsEmpty then begin
    if cap.StartsWith('• ') then Delete(cap, 1, 2)
  end else begin
    if not cap.StartsWith('• ') then cap := '• ' + cap
  end;
  NoteTabSheet.Caption := cap;
end;

function  TBaseMainForm.ContentKind(IvContentKindDefault: string): string; // [OBJECTLIST]
begin
       if FObj = 'Agent'        then Result := TCodRec.SQL.Kind
  else if FObj = 'Code'         then Result := TCodRec.PY.Kind
  else                               Result := IvContentKindDefault;
end;

procedure TBaseMainForm.ObjectContentPersistInfo(var IvDir, IvId, IvName, IvFile: string);
var
  fbk: string;
begin
  // dir
  IvDir := OptionPersistRootFolderEdit.Text + '\' + FObj;
  if not TFsyRec.DirExists(IvDir, fbk) then
    if not TFsyRec.DirForce(IvDir, fbk) then begin
      TMesRec.W('%s, unable to persist object', [fbk]);
      Exit;
    end;

  // id
  IvId := ObjectIdDBEdit.Text;

  // name
  IvName := TStrRec.StrDel(ObjectDBEdit.Text, ' ');
  IvName := TFsyRec.FileNameClean(IvName);

  // file
  IvFile := Format('%s\%s_%s.txt', [IvDir, IvId, IvName]);
end;

procedure TBaseMainForm.ObjectContentPersistOpen;
var
  dir, oid, nam, fsp, fbk: string; // dir, id, name, filespec
begin
  // info
  ObjectContentPersistInfo(dir, oid, nam, fsp);

  // exec
  if not TFsyRec.FileExists(fsp, fbk) then
    TMesRec.W(fbk)
  else if not TWinRec.WinShellExec(Application.Handle, fsp, fbk) then
    TMesRec.W(fbk);
end;

procedure TBaseMainForm.ObjectContentPersist(IvReadOnly: boolean);
var
  dir, oid, nam, fsp, pat, fbk: string; // pattern
begin
  // info
  ObjectContentPersistInfo(dir, oid, nam, fsp);

  // deleteoldbyid/versioning?
  pat := Format('%s_*.txt', [oid]);
  TFsyRec.FileDeleteByWildcards(dir, pat, fbk, true);

  // savenew
  try
    ObjectContentDBSynEdit.Lines.SaveToFile(fsp);
  except
    on e: Exception do
      TMesRec.E(e.Message);
  end;

  // setreadonly
  if IvReadOnly then
    if not TFsyRec.FileAttrReadOnlySet(fsp, fbk) then
      TMesRec.W(fbk);
end;
  {$ENDREGION}

  {$REGION 'SynEdit'}
procedure TBaseMainForm.SynEditsSetup;
var
  idx: integer;
  cke: TCodKindEnum;
begin
  // exit
  if not ObjectClientDataSet.Active then
    Exit;

  // codekind
  idx := ObjectContentKindDBComboBox.ItemIndex - 1; // *** not working well ***
  if idx < 0 then
    cke := ckTxt
  else
    cke := TCodRec.CodeKindEnumFromInt(idx);

  gsyn.Setup(ObjectContentPrevDBSynEdit, Trunc(OptionTabWidthJvSpinEdit.Value), cke                , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ObjectContentDBSynEdit    , Trunc(OptionTabWidthJvSpinEdit.Value), cke                , OptionFoldingLineShowCheckBox.Checked);
  gsyn.Setup(ObjectDataDBSynEdit       , Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckJson, OptionFoldingLineShowCheckBox.Checked); // *** NOP, depends on DataType ***
  gsyn.Setup(ObjectNoteDBSynEdit       , Trunc(OptionTabWidthJvSpinEdit.Value), TCodKindEnum.ckTxt , OptionFoldingLineShowCheckBox.Checked);
  TextFoldingAction.Checked := true; // the above setup will activate the folding
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Form'}
procedure TBaseMainForm.FormCreate(Sender: TObject);

  {$REGION 'var'}
var
  suc: boolean; // success
  str, fbk: string;
  coi: TCoiRec; // contentitem (contentkind)
//dai: TCoiRec; // dataitem (datakind)
  sti: TStiRec; // stateitem
  pvs: TPythonVersions;
  pve: TPythonVersion;
  {$ENDREGION}

begin

  {$REGION '*** LOGIN SESSION GOBJS ***'}
  suc := TLoginForm.Execute(fbk); // *** business objects (gpxy, gorg, gthe, gwse, gper, gusr, gmbr, ..., gcli, gsys) are initialized during this phase ***
  if not suc then
    Application.Terminate;
  {$ENDREGION}

  {$REGION '*** OBJECT (fixed/general) ***'}
  // xxx
  FObj := StringReplace(Name, 'MainForm', '', []); // XxxMainForm --> Xxx, AccountMainForm --> Account;
  {$ENDREGION}

  {$REGION '*** XXX (variable/specific) continue in discendent clients? ***'}
  // xxxfield
//FFldXxx  := 'Fld' + FObj; // useless
  {$ENDREGION}

  {$REGION 'form'}
  TFrmRec.FormInit(Sender as TForm);
  {$ENDREGION}

  {$REGION 'gui'}
  MainPanel.Align                     := alClient;
//LeftJvNetscapeSplitter.Minimized    := true;
  RightJvNetscapeSplitter.Maximized   := true;
  TopPageControl.ActivePageIndex      := 1;
  MainPageControl.ActivePageIndex     := 1;
  LeftPageControl.ActivePageIndex     := 0;
  RightPageControl.ActivePageIndex    := 0;
//ActionTabSheet.Caption              := FObj;
//ObjectTreeTabSheet.Caption          := FObj;
  ObjectNodeInfoLabel.Caption         := '';
  ObjectContentCharCountLabel.Caption := '';
  ObjectDataCharCountLabel.Caption    := '';
  ObjectContentPrevDBSynEdit.ReadOnly := true;
  TopReplaceOutEdit.Clear;
  TopReplaceInEdit.Clear;
  {$ENDREGION}

  {$REGION 'zzz'}
  ActionBrowseAction.Visible       := false;
//ActionEditAction.Visible         := false;
  ActionZzzAction.Visible          := false;
  ActionLoadFromFileAction.Visible := false;
  ActionSaveToFileAction.Visible   := false;
  ActionMarkdownAction.Visible     := false;
  {$ENDREGION}

  {$REGION 'ini'}
  // object
  FIdIni := gini.IntGet(FObj + '/Id', 1);
  FId := FIdIni;
  FIdGui := FId;

  // optioncommon
  OptionCryptoKeyEdit.Text                        := gini.CryGet('Common/OptionCryptoKey'            , '12345'            );
  OptionPersistRootFolderEdit.Text                := gini.StrGet('Common/OptionPersistRootFolder'    , 'C:\$\Persist'     );
  OptionTempFolderEdit.Text                       := gini.StrGet('Common/OptionTempFolder'           , 'C:\$Tmp'          );
  OptionWeekWorkOneStartJvDateTimePicker.DateTime := gini.FloGet('Common/OptionWeekWorkOneStart'     , IncHour(Date(), 19)); OptionWeekWorkOneStartJvDateTimePickerChange(nil);

  // optiongeneral
  OptionStateDefaultComboBox.ItemIndex            := gini.IntGet(FObj + '/OptionStateDefaul'         , 0                  );
  OptionFontSizeJvSpinEdit.Value                  := gini.FloGet(FObj + '/OptionFontSize'            , 10                 ); OptionFontSizeJvSpinEditChange(nil);
  OptionTabWidthJvSpinEdit.Value                  := gini.FloGet(FObj + '/OptionTabWidth'            , 2                  ); OptionTabWidthJvSpinEditChange(nil);
  OptionAutoRunCheckBox.Checked                   := gini.BooGet(FObj + '/OptionAutoRun'             , false              );
  OptionAutoLoginCheckBox.Checked                 := gini.BooGet(FObj + '/OptionAutoLogin'           , false              );
  OptionAutoHideCheckBox.Checked                  := gini.BooGet(FObj + '/OptionAutoHide'            , false              );
  OptionAutoRefreshCheckBox.Checked               := gini.BooGet(FObj + '/OptionAutoRefresh'         , false              );
  OptionShowInTrayCheckBox.Checked                := gini.BooGet(FObj + '/OptionShowInTray'          , true               );
  OptionMessageBeforeHideCheckBox.Checked         := gini.BooGet(FObj + '/OptionMessageBeforeHide'   , true               );
  OptionPasswordOnMaximizeCheckBox.Checked        := gini.BooGet(FObj + '/OptionPasswordOnMaximize'  , false              );
  OptionBackupOnExitCheckBox.Checked              := gini.BooGet(FObj + '/OptionBackupOnExit'        , false              );
  OptionAlwaysOnTopCheckBox.Checked               := gini.BooGet(FObj + '/OptionAlwaysOnTop'         , false              );
  OptionCommentRemoveCheckBox.Checked             := gini.BooGet(FObj + '/OptionCommentRemove'       , true               );
  OptionVerboseCheckBox.Checked                   := gini.BooGet(FObj + '/OptionVerbose'             , false              );

  // optionshow
  OptionFoldingLineShowCheckBox.Checked           := gini.BooGet(FObj + '/OptionFoldingLineShow'     , false              );

  // searchreplace
  SearchInContentCheckBox.Checked                 := gini.BooGet(FObj + '/SearchInContent'           , true               );
  SearchInDataCheckBox.Checked                    := gini.BooGet(FObj + '/SearchInData'              , false              );
  SearchInNoteCheckBox.Checked                    := gini.BooGet(FObj + '/SearchInNote'              , false              );
  {$ENDREGION}

  {$REGION 'proxy'}
  // *** gpxy setup happens during LoginFrom creation ***
  {$ENDREGION}

  {$REGION 'rio'}
  // *** grio setup happens when it is called ***
  {$ENDREGION}

  {$REGION 'soap'}
  // agent
  suc := TSopRec.SoapConnectionAgentSet(fbk, MainSoapConnection, true);
  LogFrame.Log(fbk, suc);

  // proxy
  if gpxy.Use then begin
    suc := TSopRec.SoapConnectionProxySet(fbk, MainSoapConnection, gpxy.UrlOrAddress, gpxy.Port, gpxy.Username, gpxy.Password);
    LogFrame.Log(fbk, suc);
  end;

  // url
  suc := TSopRec.SoapConnectionUrlSet(fbk, MainSoapConnection);
  LogFrame.Log(fbk, suc);

//if not suc then
  //Close;
  {$ENDREGION}

  {$REGION 'Person'}
  TPicRec.PicFromGraphic(PersonPictureImage.Picture, gper.PictureGraphic, 44);
  PersonPictureImage.Hint      := Format('id:%d code:%s email:%s', [gper.Obj.Id, gper.Obj.&Object, gper.Email]);
  PersonNameLabel.Caption      := gper.Name;
  PersonSurnameLabel.Caption   := gper.Surname;
  {$ENDREGION}

  {$REGION 'User'}
  TPicRec.PicFromGraphic(UserAvatarImage.Picture, gusr.AvatarGraphic, 44);
  UserAvatarImage.Hint         := Format('%s', [gusr.Info]);
  UserUsernameLabel.Caption    := gusr.Username;
  UserPasswordLabel.Caption    := gusr.Password;
  {$ENDREGION}

  {$REGION 'Session'}
//UserAvatarImage.Hint         := Format('winsession:%s', [gwse.Info]);
  {$ENDREGION}

  {$REGION 'Member'}
  TPicRec.PicFromGraphic(MemberBadgeImage.Picture, gmbr.BadgeGraphic, 44);
  MemberBadgeImage.Hint        := Format('%s', [gmbr.Info]);
  MemberMemberLabel.Caption    := gmbr.Member;
  MemberRoleLevelLabel.Caption := Format('%s / %s', [gmbr.JobRole, gmbr.JobLevel]);
  {$ENDREGION}

  {$REGION 'Organization'}
  TPicRec.PicFromGraphic(OrganizationLogoImage.Picture, gorg.LogoGraphic, 44);
  OrganizationLogoImage.Hint            := gorg.Slogan;
  OrganizationOrganizationLabel.Caption := gorg.Obj.&Object;
  OrganizationNameLabel.Caption         := gorg.Www;
  {$ENDREGION}

  {$REGION 'tree'}
  // nodedatasize
  ObjectDTClientTree.NodeDataSize := SizeOf(PNodeItem); // SizeOf(TObjectNodeRec); see ObjectDTClientTreeDBTreeCreateNode
  {$ENDREGION}

  {$REGION 'clock'}
  TimerJvClock.Enabled       := true;
  {$ENDREGION}

  {$REGION 'timer'}
  // set interval to 1 second
  TimerJvThreadTimer.Interval := 1000;

  // when false, the thread associated with the timer is destroyed when the timer is disabled
  // when true, the thread will be suspended and it is maintained across multiple timer activations
  TimerJvThreadTimer.KeepAlive := true;

  // start disabled
  TimerJvThreadTimer.Enabled := true;
  {$ENDREGION}

  {$REGION 'property'}

    {$REGION 'object (common/fixed)'}
  // objectkind
  ObjectKindDBComboBox.Items.Add('');
  for str in TObjRec.ObjKindVector do ObjectKindDBComboBox.Items.Add(str);

  // contentkind
  ObjectContentKindDBComboBox.Items.Add('');
  for coi in TCodRec.Vector do ObjectContentKindDBComboBox.Items.Add(coi.Kind);

  // datakind
  ObjectDataKindDBComboBox.Items.Add('');
  for coi in TCodRec.Vector do ObjectDataKindDBComboBox.Items.Add(coi.Kind); // *** TO BE UPDATED ***

  // state
  ObjectStateDBComboBox.Items.Add('');
  for sti in TStaRec.Vector do ObjectStateDBComboBox.Items.Add(sti.Name);
    {$ENDREGION}

    {$REGION 'xxx (specific/variable)'}
    // continue in discendent clients
    {$ENDREGION}

    {$REGION 'python'}
  pvs := GetRegisteredPythonVersions;
  for pve in pvs do
    OptionPythonVersionComboBox.Items.Add(pve.DisplayName);
  if OptionPythonVersionComboBox.Items.Count = 0 then
    LogFrame.LogOne('No Python version(s) has been detected', fmWarning)
  else begin
    OptionPythonVersionComboBox.ItemIndex := 0;
    OptionPythonVersionComboBoxChange(Self);
    LogFrame.LogOne('Python version(s) detected, see Options', fmSuccess);
  end;
  OptionPythonRawOutputCheckBox.Checked := false;
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'searchreplace'}
  SearchButtonedEdit.Clear;
  ReplaceButtonedEdit.Clear;
  {$ENDREGION}

  {$REGION 'ready'}
  LogFrame.Log('%s %s client ready', [TWksRec.ACRONYM, FObj.ToUpper]);
  {$ENDREGION}

end;

procedure TBaseMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  fbk: string;
begin

  {$REGION 'ini'}
  // object
  gini.IntSet(FObj + '/Id', FId);

  // optioncommon
  gini.CrySet( 'Common/OptionCryptoKey'           , OptionCryptoKeyEdit.Text                       );
  gini.StrSet( 'Common/OptionPersistRootFolder'   , OptionPersistRootFolderEdit.Text               );
  gini.StrSet( 'Common/OptionTempFolder'          , OptionTempFolderEdit.Text                      );
  gini.FloSet( 'Common/OptionWeekWorkOneStart'    , OptionWeekWorkOneStartJvDateTimePicker.DateTime);

  // optiongeneral
  gini.IntSet(FObj + '/OptionStateDefaul'         , OptionStateDefaultComboBox.ItemIndex           );
  gini.FloSet(FObj + '/OptionFontSize'            , OptionFontSizeJvSpinEdit.Value                 );
  gini.FloSet(FObj + '/OptionTabWidth'            , OptionTabWidthJvSpinEdit.Value                 );
  gini.BooSet(FObj + '/OptionAutoRun'             , OptionAutoRunCheckBox.Checked                  );
  gini.BooSet(FObj + '/OptionAutoLogin'           , OptionAutoLoginCheckBox.Checked                );
  gini.BooSet(FObj + '/OptionAutoHide'            , OptionAutoHideCheckBox.Checked                 );
  gini.BooSet(FObj + '/OptionAutoRefresh'         , OptionAutoRefreshCheckBox.Checked              );
  gini.BooSet(FObj + '/OptionShowInTray'          , OptionShowInTrayCheckBox.Checked               );
  gini.BooSet(FObj + '/OptionMessageBeforeHide'   , OptionMessageBeforeHideCheckBox.Checked        );
  gini.BooSet(FObj + '/OptionPasswordOnMaximize'  , OptionPasswordOnMaximizeCheckBox.Checked       );
  gini.BooSet(FObj + '/OptionBackupOnExit'        , OptionBackupOnExitCheckBox.Checked             );
  gini.BooSet(FObj + '/OptionAlwaysOnTop'         , OptionAlwaysOnTopCheckBox.Checked              );
  gini.BooSet(FObj + '/OptionCommentRemove'       , OptionCommentRemoveCheckBox.Checked            );
  gini.BooSet(FObj + '/OptionVerbose'             , OptionVerboseCheckBox.Checked                  );

  // optionshow
  gini.BooSet(FObj + '/OptionFoldingLineShow'     , OptionFoldingLineShowCheckBox.Checked          );

  // searchreplace
  gini.BooSet(FObj + '/SearchInContent'           , SearchInContentCheckBox.Checked                );
  gini.BooSet(FObj + '/SearchInData'              , SearchInDataCheckBox.Checked                   );
  gini.BooSet(FObj + '/SearchInNote'              , SearchInNoteCheckBox.Checked                   );
  {$ENDREGION}

  {$REGION 'sessionclose'}
  if gwse.SessionId > 0 then begin
    gwse.DateTimeEnd := Now;
    if gwse.CloseRio(fbk) then begin
      LogFrame.LogShow;
      LogFrame.Log('winsession %d closed at %s', [gwse.SessionId, DateTimeToStr(gwse.DateTimeEnd)]);
      Application.ProcessMessages;
      Sleep(TWksRec.SHORT_PAUSE_MS);
    end else
      TMesRec.W(fbk);
  end;
  {$ENDREGION}

  {$REGION 'timer'}
  TimerJvClock.Enabled       := false;
  TimerJvThreadTimer.Enabled := false;
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Application'}
procedure TBaseMainForm.ApplicationEventsException(Sender: TObject; E: Exception);
begin
  // raised when an unhandled exception occurs within the application
  TMesRec.E(E.Message, 'Unhandled Application Exception');
end;
{$ENDREGION}

{$REGION 'Timer'}
procedure TBaseMainForm.TimerJvThreadTimerTimer(Sender: TObject);
var
  tic: TDateTime; // now
begin
  // now
  tic := Now;

  // parts-int
  DecodeDate(tic, FYear, FMonth, FDay);                                                              //  2017   1..12   1..31
  DecodeTime(tic, FHour, FMinute, FSecond, FMilliSecond);                                            // 0..11   0..59   0..59   0..999
  FQuarter             := TDatRec.DatQuarter(tic);                                                   // 1..4
  FWeekDay             := TDatRec.DatWeekDayId(tic);                                                 // 1..7
  FWeekIso             := TDatRec.DatWeekIso(tic);                                                   // 1..52{53}
  FWeekWork            := TDatRec.DatWeekWork(tic, OptionWeekWorkOneStartJvDateTimePicker.DateTime); // 1..52{53}

  // parts-str
  FMonthStr            := TDatRec.DatMonthStr(tic);                                                  // January..December
  FDayStr              := TDatRec.DatWeekDayStr(tic);                                                // Monday..Saturday
  FMonthStr3           := TDatRec.DatMonthStr(tic, 0, 3);                                            // Jan..Dec
  FDayStr3             := TDatRec.DatWeekDayStr(tic, 0, 3);                                          // Mon..Sun
  FWeekIsoStr          := Format('Y%d-IW%2d', [FYear, FWeekIso]);                                    // Y2024-IW52
  FWeekWorkStr         := Format('Y%d-WW%2d', [FYear, FWeekWork]);                                   // Y2024-WW52

  // gui
  YearLabel.Caption    := FYear.ToString;                                                            //
  DayLabel.Caption     := FDay.ToString;                                                             //
  WeekdayLabel.Caption := FDayStr;                                                                   //
  MonthLabel.Caption   := FMonthStr;                                                                 //
  WeekLabel.Caption    := IfThen(WeekLabel.Tag = 0, FWeekIsoStr, FWeekWorkStr);                      //
  TimerLabel.Caption   := Format('%.2d:%.2d:%.2d', [FHour, FMinute, FSecond]);                       //
end;
{$ENDREGION}

{$REGION 'Top'}

  {$REGION 'Client'}
procedure TBaseMainForm.ClientExitActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TBaseMainForm.ClientInfoActionExecute(Sender: TObject);
begin
  TMesRec.NI;
end;

procedure TBaseMainForm.ClientHelpActionExecute(Sender: TObject);
begin
  TMesRec.NI;
end;

procedure TBaseMainForm.ClientVersionActionExecute(Sender: TObject);
begin
  TMesRec.NI;
end;

procedure TBaseMainForm.ClientDonateActionExecute(Sender: TObject);
begin
  TMesRec.NI;
end;

procedure TBaseMainForm.ClientShareActionExecute(Sender: TObject);
begin
  TMesRec.NI;
end;
  {$ENDREGION}

  {$REGION 'Actions'}
procedure TBaseMainForm.ActionRefreshActionExecute(Sender: TObject);
var
  fbk: string;
begin
  // exit
  if ObjectClientDataSet.State in [dsEdit] then
    if TAskRec.NoFmt('WARNING'
     + sLineBreak
     + sLineBreak +  'Current "%s" is still in edit and has not been saved yet to the remote server !'
     + sLineBreak +  'Refreshing will reload everytingh from server and will owerride all your edits' // *** may be isnt' true ***
     + sLineBreak
     + sLineBreak +  'Continue ?', [FObj]) then
      Exit;

  // go
  Screen.Cursor := crHourGlass;
  try
    if not SoapRefresh(fbk) then begin
      TMesRec.W(fbk);
    //Close;
    end else begin
      ObjectGuiEnable(true);
      ObjectNodeLocateAndExpand(FIdGui);
    end;
  finally
    MainPageControl.ActivePage := ContentTabSheet;
    ObjectContentDBSynEdit.SetFocus;
    Screen.Cursor := crDefault;
  end;
end;

procedure TBaseMainForm.ActionPostActionExecute(Sender: TObject);
begin
  // object
  if ObjectClientDataSet.State = dsEdit then begin
    // rev
    ObjectClientDataSet.FieldByName('FldRev').Value := ObjectClientDataSet.FieldByName('FldRev').AsInteger + 1;
    // post
    ObjectDBNavigator.BtnClick(nbPost);
  end;

  // xxx
  // *** continue in descendent ***
end;

procedure TBaseMainForm.ActionGotoActionExecute(Sender: TObject);
var
  uok, fou: boolean; // userok, found
  ids: string;
begin
  uok := TAskRec.Str('Locate an Object', 'Please enter an Object Id', '', ids);
  if (not uok) or ids.IsEmpty then
    Exit;

  Screen.Cursor := crHourGlass;
  ObjectClientDataSet.DisableControls;
  try
    ObjectClientDataSet.First;
    fou := ObjectClientDataSet.Locate('FldId', ids, []);
    if not fou then
      TMesRec.W('Unable to locate object %s', [ids])
    else
      LogFrame.Log('Object %s found', [ids], clGreen);
  finally
    ObjectClientDataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TBaseMainForm.ActionFitActionExecute(Sender: TObject);
var
  gri: TDBGrid;
begin
  gri := TGriRec.GriFocused;
  if Assigned(gri) then
    TGriRec.GriColumnsWidthFit(gri);
end;

procedure TBaseMainForm.ActionBrowseActionExecute(Sender: TObject);
//var
//  oid: integer;
//  url: string;
begin
  // i
//  oid := StrToInt(ObjectIdDBText.Caption);
//  url := gaps.Link(FObj, oid);
//  TUrlRec.Go(url);

  // ii
//CenterPageControl.ActivePage := BrowseTabSheet;
//Chromium.Load(url);
//TUrlRec.Go(age.Url(ObjectClientDataSet.FieldByName('FldId').AsInteger));

  TMesRec.NI;
end;

procedure TBaseMainForm.ActionEditActionExecute(Sender: TObject);
var
  chc: boolean;          // contenthaschanged
  ock, con, fbk: string; // objcontentkind
begin
  // zip
  ock := ObjectContentKindDBComboBox.Text;
  con := ObjectContentDBSynEdit.Text;

  // editorinvoke
       if ock = TCodRec.PY.Kind   then chc := WksPythonEditorFormUnit.TPythonEditorForm.Execute(con    , fbk)
  else if ock = TCodRec.JSON.Kind then chc := WksJsonEditorFormUnit.TJsonEditorForm.Execute    (con    , fbk)
  else if ock = TCodRec.SQL.Kind  then chc := WksSqlEditorFormUnit.TSqlEditorForm.Execute      (con, '', fbk)
                                  else chc := WksTextEditorFormUnit.TTextEditorForm.Execute    (con    , fbk);
  LogFrame.Log(fbk, chc);

  // contenthaschanged
  if chc then
    if TAskRec.Yes('Content has been changed, update underlining object content?') then begin
      // edit
      ObjectContentDBSynEdit.DataSource.DataSet.Edit;

      // backup to contentprev
      ObjectContentPrevDBSynEdit.Text := ObjectContentDBSynEdit.Text;
      LogFrame.Log('Actual object content saved into "PrevContent"');

      // save new
      ObjectContentDBSynEdit.Text := con;
      LogFrame.Log('Actual object content replaced with "new changed content"');

      // save
      ObjectContentDBSynEdit.DataSource.DataSet.Post;
    end;
end;

procedure TBaseMainForm.ActionZzzActionExecute(Sender: TObject);
begin
  TMesRec.NI;
end;

procedure TBaseMainForm.ActionLoadFromFileActionExecute(Sender: TObject);
begin
  OpenDialog.Title      := 'Load From File';
  OpenDialog.Filter     := 'ALL files (*.*)|*.*|TEXT files (*.txt)|*.txt|SOURCE files (*.src)|*.src.txt';
  OpenDialog.InitialDir := TEMP_PATH;
  OpenDialog.DefaultExt := '.*';
  OpenDialog.FileName   := ObjectDBEdit.Text;

  if not OpenDialog.Execute then
    Exit;

  if not ObjectContentDBSynEdit.Text.IsEmpty then
    if TAskRec.No('Current object content is not empty! Continue?') then
      Exit;

  ObjectClientDataSet.Edit;
  ObjectContentDBSynEdit.Lines.LoadFromFile(OpenDialog.FileName);
//ObjectClientDataSet.Post;
  ObjectDBNavigator.BtnClick(nbPost);
end;

procedure TBaseMainForm.ActionSaveToFileActionExecute(Sender: TObject);
begin
  SaveDialog.Title      := 'Save To File';
  SaveDialog.Filter     := 'ALL files (*.*)|*.*|TEXT files (*.txt)|*.txt|SOURCE files (*.src)|*.src.txt';
  OpenDialog.InitialDir := TEMP_PATH;
  SaveDialog.DefaultExt := '.*';
  OpenDialog.FileName   := ObjectDBEdit.Text;

  if not SaveDialog.Execute then
    Exit;

  ObjectContentDBSynEdit.Lines.SaveToFile(OpenDialog.FileName);
end;

procedure TBaseMainForm.ActionPersistedOpenActionExecute(Sender: TObject);
begin
  ObjectContentPersistOpen;
end;

procedure TBaseMainForm.ActionMarkdownActionExecute(Sender: TObject);
begin
  TMesRec.NI;
end;
  {$ENDREGION}

  {$REGION 'Text'}
procedure TBaseMainForm.TextSearchActionExecute(Sender: TObject);
begin
  gsyn.SearchReplaceFormShow(gsyn.Focused, gsyg, false);
end;

procedure TBaseMainForm.TextSearchPrevActionExecute(Sender: TObject);
begin
  gsyg.Backwards := true;
  gsyn.SearchReplaceDo(gsyn.Focused, gsyg, false);
end;

procedure TBaseMainForm.TextSearchNextActionExecute(Sender: TObject);
begin
  gsyg.Backwards := false;
  gsyn.SearchReplaceDo(gsyn.Focused, gsyg, false);
end;

procedure TBaseMainForm.TextReplaceActionExecute(Sender: TObject);
begin
  gsyn.SearchReplaceFormShow(gsyn.Focused, gsyg, true);
end;

procedure TBaseMainForm.TextSpecialCharsActionExecute(Sender: TObject);
begin
  gsyn.CharOnOff(gsyn.Focused, TextSpecialCharsAction.Checked);
end;

procedure TBaseMainForm.TextWordWrapActionExecute(Sender: TObject);
begin
  with gsyn.Focused do begin
    if TextWordWrapAction.Checked then begin
      UseCodeFolding := false;
      WordWrap       := true;
    end else begin
      UseCodeFolding := true;
      WordWrap       := false;
    end;
  end;
end;

procedure TBaseMainForm.TextFoldActionExecute(Sender: TObject);
begin
  if TextFoldAction.ImageIndex = 7 then begin
    TextFoldAction.ImageIndex := 8;
    TextFoldAction.Caption := 'Unfold';
    gsyn.Focused.CollapseFoldType(FoldRegionType);
  end else begin
    TextFoldAction.ImageIndex := 7;
    TextFoldAction.Caption := 'Fold';
    gsyn.Focused.UnCollapseFoldType(FoldRegionType);
  end;
end;

procedure TBaseMainForm.TextFoldingActionExecute(Sender: TObject);
begin
  gsyn.Focused.UseCodeFolding := TextFoldingToolButton.Down;
  TextFoldToolButton.Enabled := TextFoldingToolButton.Down;
end;

procedure TBaseMainForm.TextCommentActionExecute(Sender: TObject);
var
  cok: TCodKindEnum;
  syn: TCustomSynEdit;
  key: word;
  sst: TShiftState;
begin
  // edit
  if not (ObjectClientDataSet.State in [dsEdit]) then
    ObjectClientDataSet.Edit;

  // simulatectrl+/
  cok := TCodRec.CodeKindEnumFromInt(gsyn.Focused.Tag);
  syn := gsyn.Focused;
  key := vkSlash;
  sst := [ssCtrl];
  gsyn.KeyUp(syn, cok, key, sst);
end;

procedure TBaseMainForm.TextGutterActionExecute(Sender: TObject);
begin
  gsyn.Focused.Gutter.Visible := TextGutterAction.Checked;
end;

procedure TBaseMainForm.TextLineNumbersActionExecute(Sender: TObject);
begin
  gsyn.Focused.Gutter.ShowLineNumbers := TextLineNumbersAction.Checked;
end;

procedure TBaseMainForm.TextZeroStartActionExecute(Sender: TObject);
begin
  gsyn.Focused.Gutter.ZeroStart := TextZeroStartAction.Checked;
end;

procedure TBaseMainForm.TextTabToSpacesActionExecute(Sender: TObject);
var
  spz: integer; // spacesnum
  spn: string; // spaces
  buc: TBufferCoord;
begin
  spz := TVntRec.VntToInt(OptionTabWidthJvSpinEdit.Value, 2);
  TAskRec.Int('Tab to spaces', 'How many spaces for a tab ?', spz, spz);
  spn := TStrRec.StrReplicate(' ', spz);
  with gsyn.Focused do begin
    buc := CaretXY;
    ObjectClientDataSet.Edit;
    Text := StringReplace(Text, #9, spn, [rfReplaceAll]);
  //ObjectClientDataSet.Post;
    ObjectDBNavigator.BtnClick(nbPost);
    CaretXY := buc;
  end;
end;

procedure TBaseMainForm.TextCompareActionExecute(Sender: TObject);
begin
  WksTextDiffFormUnit.TTextDiffForm.Execute(gsyn.Focused.Lines);
end;

procedure TBaseMainForm.TextUtilsLinePrefixWithActionExecute(Sender: TObject);
var
  buc: TBufferCoord;
  stl: TStringList;
  i: integer;
//s: string;
begin
  if not TAskRec.Str('Line Begin With', 'Input a string all lines will begin with', FTextUtilsLineBeginWith, FTextUtilsLineBeginWith) then
    Exit;
  with gsyn.Focused do begin
    buc := CaretXY;
    stl := TStringList.Create;
    try
      stl.Text := SelText;
      for i := 0 to stl.Count - 1 do
        stl[i] := FTextUtilsLineBeginWith + stl[i];
      ObjectClientDataSet.Edit;
      SelText := stl.Text;
    //ObjectClientDataSet.Post;
      ObjectDBNavigator.BtnClick(nbPost);
    finally
      stl.Free;
    end;
    CaretXY := buc;
  end;
end;

procedure TBaseMainForm.TextUtilsLineNumbersActionExecute(Sender: TObject);
var
  buc: TBufferCoord;
  stl: TStringList;
  i: integer;
  str: string;
begin
  str := '';
  if not TAskRec.Str('Line Numbers', 'Input optional char(s) after each number', ') ', str) then
    Exit;
  with gsyn.Focused do begin
    buc := CaretXY;
    stl := TStringList.Create;
    try
      stl.Text := SelText;
      for i := 0 to stl.Count - 1 do
        stl[i] := i.ToString + str + stl[i+1];
      ObjectClientDataSet.Edit;
      SelText := stl.Text;
    //ObjectClientDataSet.Post;
      ObjectDBNavigator.BtnClick(nbPost);
    finally
      stl.Free;
    end;
    CaretXY := buc;
  end;
end;

procedure TBaseMainForm.TextUtilsSortAscActionExecute(Sender: TObject);
var
  buc: TBufferCoord;
  stl: TStringList;
begin
  if gsyn.Focused.SelText.IsEmpty then begin
    TMesRec.W('Please select some lines of text');
    Exit;
  end;

  with gsyn.Focused do begin
    buc := CaretXY;
    stl := TStringList.Create;
    try
      stl.Text := SelText;
      stl.Sort;
    //stl.CustomSort(TStlRec.StlSortAsc);
      ObjectClientDataSet.Edit;
      SelText := stl.Text;
    //ObjectClientDataSet.Post;
      ObjectDBNavigator.BtnClick(nbPost);
    finally
      stl.Free;
    end;
    CaretXY := buc;
  end;
end;

procedure TBaseMainForm.TextUtilsSortDescActionExecute(Sender: TObject);
var
  buc: TBufferCoord;
  stl: TStringList;
begin
  if gsyn.Focused.SelText.IsEmpty then begin
    TMesRec.W('Please select some lines of text');
    Exit;
  end;

  with gsyn.Focused do begin
    buc := CaretXY;
    stl := TStringList.Create;
    try
      stl.Text := SelText;
      stl.CustomSort(TStlRec.StlSortDesc);
      ObjectClientDataSet.Edit;
      SelText := stl.Text;
    //ObjectClientDataSet.Post;
      ObjectDBNavigator.BtnClick(nbPost);
    finally
      stl.Free;
    end;
    CaretXY := buc;
  end;
end;

procedure TBaseMainForm.TextUtilsStatsActionExecute(Sender: TObject);
begin
  WksTextStatsFormUnit.TTextStatsForm.Execute(gsyn.Focused.Lines);
end;
  {$ENDREGION}

  {$REGION 'Search'}
procedure TBaseMainForm.TopReplaceSwapLabelClick(Sender: TObject);
var
  buf: string;
begin
  buf := TopReplaceOutEdit.Text;
  TopReplaceOutEdit.Text := TopReplaceInEdit.Text;
  TopReplaceInEdit.Text  := buf;
end;

procedure TBaseMainForm.TopReplaceButtonClick(Sender: TObject);
var
  cpz, coz, jsz, noz: integer; // counters
  cps, cos, das, nos: string;  // strorig
  ous, ins: string;
  who, noc: boolean;           // wholestr, nocasesens
  fla: TReplaceFlags;
begin
  Screen.Cursor := crHourGlass;
  try
    // inputs
    ous := TopReplaceOutEdit.Text;
    ins := TopReplaceInEdit.Text;
    who := TopReplaceWholeCheckBox.Checked;
    noc := not TopReplaceMatchCaseICheckBox.Checked;

    // origs
    cps := ObjectClientDataSet.FieldByName('FldContentPrev').AsString;
    cos := ObjectClientDataSet.FieldByName('FldContent'    ).AsString;
    das := ObjectClientDataSet.FieldByName('FldData'       ).AsString;
    nos := ObjectClientDataSet.FieldByName('FldNote'       ).AsString;

    // occurrences
    cpz := TStrRec.StrOccurences(cps, ous, who, noc);
    coz := TStrRec.StrOccurences(cos, ous, who, noc);
    jsz := TStrRec.StrOccurences(das, ous, who, noc);
    noz := TStrRec.StrOccurences(nos, ous, who, noc);

    // options
    fla := [rfReplaceAll];
    if noc then fla := fla + [rfIgnoreCase];

    // replace
    ObjectClientDataSet.Edit;
    ObjectClientDataSet.FieldByName('FldContentPrev').Value := StringReplace(cps, ous, ins, fla);
    ObjectClientDataSet.FieldByName('FldContent'    ).Value := StringReplace(cos, ous, ins, fla);
    ObjectClientDataSet.FieldByName('FldData'       ).Value := StringReplace(das, ous, ins, fla);
    ObjectClientDataSet.FieldByName('FldNote'       ).Value := StringReplace(nos, ous, ins, fla);
  //ObjectClientDataSet.Post;
    ObjectDBNavigator.BtnClick(nbPost);

    // fbk
    LogFrame.Log('replacements: prev %d, cont: %d, json: %d, note: %d', [cpz, coz, jsz, noz], clWebOrange);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TBaseMainForm.TopReplaceNextButtonClick(Sender: TObject);
var
  key: word;
begin
  // stdshorcutsloop + ctrl+f
  key := vkF;
  gsyn.KeyUp(ObjectContentDBSynEdit, TCodRec.CodeKindEnumFromInt(ObjectContentDBSynEdit.Tag), key, [ssCtrl]);
end;
  {$ENDREGION}

  {$REGION 'Utils'}
procedure TBaseMainForm.UtilsPythonExecActionExecute(Sender: TObject);
var
  cod: string;
  wat: TStopwatch;
begin
  // codetoexecute
  cod := gsyn.Focused.SelText;

  // noselection
  if cod.IsEmpty then
    LogFrame.LogOne('Please select some python code to execute...', fmWarning)

  // exec
  else begin
    Screen.Cursor := crHourGlass;
    try
      try
        MaskFPUExceptions(true);
        wat.StartNew;
        FPythonEngine.ExecString(ansistring(cod));
        wat.Stop;
        LogFrame.LogOne('Python code executed in %d ms', [wat.Elapsed.Milliseconds], fmSuccess);
      except
        on e: EPyException do begin
          LogFrame.LogOne(e.Message, fmWarning);
        end;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;
  {$ENDREGION}

  {$REGION 'Time'}
procedure TBaseMainForm.WeekLabelClick(Sender: TObject);
begin
  if WeekLabel.Tag = 1 then begin
    WeekLabel.Hint := 'ISO 8601 Week';
    WeekLabel.Tag := 0;
  end else begin
    WeekLabel.Hint := 'Work Week';
    WeekLabel.Tag := 1;
  end;
end;

procedure TBaseMainForm.TimerJvClockClick(Sender: TObject);
begin
  if TimerJvClock.ShowMode = scAnalog then
    TimerJvClock.ShowMode := scDigital
  else
    TimerJvClock.ShowMode := scAnalog;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Left'}

  {$REGION 'Tree'}
procedure TBaseMainForm.ObjectDTClientTreeDBTreeCreateNode(Sender: TDTDBTreeView; Node: PVirtualNode; DataSet: TDataSet);
begin
  TVstRec.NodeParamSet(ObjectDTClientTree, Node, FObj, DataSet); // in OnFormCreate set ObjectDTClientTree.NodeDataSize := SizeOf(PNodeItem);
end;

procedure TBaseMainForm.ObjectDTClientTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
begin
  TVstRec.OnPaintText(Sender, TargetCanvas, Node, Column, TextType);
end;

procedure TBaseMainForm.ObjectDTClientTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
begin
  TVstRec.OnCompareNodes(Sender, Node1, Node2, Column, Result);
end;

procedure TBaseMainForm.ObjectDTClientTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex);
begin
  TVstRec.OnGetImageIndex(Sender, Node, Kind, Column, Ghosted, ImageIndex);
end;

procedure TBaseMainForm.ObjectDTClientTreeClick(Sender: TObject);
begin
  FIdGui := FId; // chache
  TVstRec.NodeInfo(ObjectDTClientTree, ObjectDTClientTree.FocusedNode, FNodePath, FNodeCaption, FNodeKey, FNodeLevel, FNodeChildsCount);
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Center'}

  {$REGION 'Object'}
procedure TBaseMainForm.ObjectDBEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then begin
    Key := #0; // prevent beeping
    ActionPostActionExecute(nil);
  end;
end;
  {$ENDREGION}

  {$REGION 'ContentPre'}
procedure TBaseMainForm.ObjectContentPrevDBSynEditChange(Sender: TObject);
begin
  // changed
  if string(ContentPrevTabSheet.Caption).EndsWith('Previous') then
    ContentPrevTabSheet.Caption := ContentPrevTabSheet.Caption + ' •';
  // bold
  ObjectTabsModifiedUpdateBold;
end;

procedure TBaseMainForm.ObjectContentPrevDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // stdshorcutsloop
  gsyn.KeyUp(Sender as TDBSynEdit, TCodRec.CodeKindEnumFromInt((Sender as TDBSynEdit).Tag), Key, Shift);
end;

procedure TBaseMainForm.ObjectContentPrevSaveSpeedButtonClick(Sender: TObject);
begin
  // prevupdatetocurr
  ObjectClientDataSet.Edit;
  ObjectClientDataSet.FieldByName('FldContentPrev').Value := ObjectClientDataSet.FieldByName('FldContent').Value;
//ObjectClientDataSet.Post;
  ObjectDBNavigator.BtnClick(nbPost);
end;
  {$ENDREGION}

  {$REGION 'Content'}
procedure TBaseMainForm.ObjectContentDBSynEditChange(Sender: TObject);
begin
  // changed
  if string(ContentTabSheet.Caption).EndsWith('Content') then
    ContentTabSheet.Caption := ContentTabSheet.Caption + ' •';
  // bold
  ObjectTabsModifiedUpdateBold;
end;

procedure TBaseMainForm.ObjectContentDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // edit
  if not (ObjectClientDataSet.State in [dsEdit]) then
    ObjectClientDataSet.Edit;

  // stdshorcutsloop
  gsyn.KeyUp(Sender as TDBSynEdit, TCodRec.CodeKindEnumFromInt((Sender as TDBSynEdit).Tag), Key, Shift);
end;

procedure TBaseMainForm.ObjectContentDBSynEditStatusChange(Sender: TObject; Changes: TSynStatusChanges);
//var
//  str: string;
//
//  function SynStatusChangesToString(const AValue: TSynStatusChanges): string;
//  begin
//    if PTypeInfo(TypeInfo(TSynStatusChanges)).Kind = tkVariant then
//      Result := VarToStr(TValue.From<TSynStatusChanges>(AValue).AsVariant)
//    else
//      Result := TValue.From<TSynStatusChanges>(AValue).ToString;
//  end;
begin
//  str := SynStatusChangesToString(Changes);
//  LogFrame.Log(str);
//
//  if str = '[scCaretX,scCaretY,scSelection]' then
//    if not (ObjectClientDataSet.State in [dsEdit]) then begin
//      ObjectClientDataSet.Edit;
end;

procedure TBaseMainForm.ObjectContentDBSynEditDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
//  LogFrame.Log('Dragging...');
//  if not (ObjectClientDataSet.State in [dsEdit]) then begin
//    ObjectClientDataSet.Edit;
//    LogFrame.Log('Editing...');
//  end;
end;

procedure TBaseMainForm.ObjectContentDBSynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ( not (ObjectClientDataSet.State in [dsEdit]) ) and (ObjectContentDBSynEdit.SelLength > 0) and (Button = mbLeft) then begin
//  FSynEditIsDragging := true;
//  FSynEditDragStartPos := Point(X, Y);
//  LogFrame.Log('Start dragging...');
    ObjectClientDataSet.Edit;
//  LogFrame.Log('Editing...');
  end;
end;

procedure TBaseMainForm.ObjectContentDBSynEditMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
//  if FSynEditIsDragging {and (ssLeft in Shift)} then begin
//    LogFrame.Log('Try dragging...');
//    if (Abs(X - FSynEditDragStartPos.X) > 5) or (Abs(Y - FSynEditDragStartPos.Y) > 5) then begin
//      FSynEditIsDragging := false;
//      ObjectContentDBSynEdit.BeginDrag(false, 5);
//      LogFrame.Log('Dragging...');
//      Application.ProcessMessages;
//    end;
//  end;
end;
{$ENDREGION}

  {$REGION 'Data'}
procedure TBaseMainForm.ObjectDataDBSynEditChange(Sender: TObject);
begin
  // changed
  if string(JsonTabSheet.Caption).EndsWith('  Data') then
    JsonTabSheet.Caption := JsonTabSheet.Caption + ' •';
  // bold
  ObjectTabsModifiedUpdateBold;
end;

procedure TBaseMainForm.ObjectDataDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // stdshorcutsloop
  gsyn.KeyUp(Sender as TDBSynEdit, ckJson, Key, Shift);
end;

procedure TBaseMainForm.ObjectDataValidateSpeedButtonClick(Sender: TObject);
var
  fbk: string;
begin
  if not TJsoRec.IsValid(ObjectDataDBSynEdit.Text, fbk) then
    TMesRec.W(fbk)
  else
    TMesRec.I(fbk);
end;
  {$ENDREGION}

  {$REGION 'Note'}
procedure TBaseMainForm.ObjectNoteDBSynEditChange(Sender: TObject);
begin
  // changed
  if string(NoteTabSheet.Caption).EndsWith('  Note') then
    NoteTabSheet.Caption := NoteTabSheet.Caption + ' •';
  // bold
  ObjectTabsModifiedUpdateBold;
end;

procedure TBaseMainForm.ObjectNoteDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // stdshorcutsloop
  gsyn.KeyUp(Sender as TDBSynEdit, ckTxt, Key, Shift);
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Right'}

  {$REGION 'Property'}

    {$REGION 'JobGrade'}
procedure TBaseMainForm.ObjectJobGradeCalculateLabelClick(Sender: TObject);
var
  rol, lev, fbk: string;
  jgm: integer; // jobgrademin
  okk: boolean;
begin
  jgm := ObjectClientDataSet.FieldByName('FldJobGradeMin').AsInteger;
  okk := TMemberRoleLevelGradeForm.Execute(rol, lev, jgm, fbk);
  if okk then begin
    ObjectClientDataSet.Edit;
    ObjectClientDataSet.FieldByName('FldJobGradeMin').Value := jgm;
  //ObjectClientDataSet.Post;
    ObjectDBNavigator.BtnClick(nbPost);
    LogFrame.Log('Object %d %s will be availble only to "%s %s %d" or upper grade members', [ObjectClientDataSet.FieldByName('FldId').AsInteger, ObjectClientDataSet.FieldByName('FldObject').AsString, rol, lev, jgm]);
  end;
  LogFrame.Log(fbk, okk);
end;
    {$ENDREGION}

    {$REGION 'Image'}
procedure TBaseMainForm.ObjectImageLoadLabelClick(Sender: TObject);
var
  fbk: string;
  boo: boolean;
  gra: TGraphic;
begin
//gra := TGraphic.Create; // *** created in PictureDlgLoad ***
  boo := TGraRec.PictureDlgLoad(gra, fbk);
  if OptionVerboseCheckBox.Checked then
    LogFrame.Log(fbk);
  if boo then begin
    try
      ObjectImageDBImage.DataSource.DataSet.Edit;
      ObjectImageDBImage.Picture.Graphic := gra;
      ObjectImageDBImage.DataSource.DataSet.Post;
    finally
      FreeAndNil(gra);
    end;
  end;
end;

procedure TBaseMainForm.ObjectImageSaveLabelClick(Sender: TObject);
var
  fna, ext, fbk: string;
  {boo: boolean;}
begin
  fna := Format('%s_%d_%s_Image', [FObjectKind, FId, TStrRec.StrSafe(ObjectDBEdit.Text)]);
  ext := '.png';

  {boo :=} TGraRec.PictureDlgSave(ObjectImageDBImage.Picture.Graphic, fna, ext, fbk);
  TMesRec.I('Image saved to %s', [fna]);
  LogFrame.Log(fbk);
end;

procedure TBaseMainForm.ObjectImageFitLabelClick(Sender: TObject);
begin
  ObjectImageDBImage.Stretch      := not ObjectImageDBImage.Stretch;
  ObjectImageDBImage.Proportional := ObjectImageDBImage.Stretch;
  ObjectImageFitLabel.Caption     := ifthen(ObjectImageDBImage.Stretch, 'Unfit', 'Fit');
end;

procedure TBaseMainForm.ObjectImageClearLabelClick(Sender: TObject);
begin
  ObjectImageDBImage.DataSource.DataSet.Edit;
  ObjectImageDBImage.Picture := nil;
  ObjectImageDBImage.DataSource.DataSet.Post;
end;
    {$ENDREGION}

    {$REGION 'General'}
procedure TBaseMainForm.ObjectKindDBComboBoxChange(Sender: TObject);
begin
  ;
end;

procedure TBaseMainForm.ObjectContentKindDBComboBoxChange(Sender: TObject);
var
  idx: integer;
//cok: string; // codekind
//cke: TCodKindEnum;
begin
  // codekind
  idx := ObjectContentKindDBComboBox.ItemIndex - 1;
//cok := ObjectContentKindDBComboBox.Text;
//cke := TCodRec.CodeKindEnumFromInt(idx);

  // highlighter
//       if cok = TCodRec.BAT.Kind  then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckBat ); ObjectContentDBSynEdit.Tag :=  0; end
//  else if cok = TCodRec.CSS.Kind  then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckCss ); ObjectContentDBSynEdit.Tag :=  1; end
//  else if cok = TCodRec.DWS.Kind  then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckDws ); ObjectContentDBSynEdit.Tag :=  2; end
//  else if cok = TCodRec.HTML.Kind then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckHtml); ObjectContentDBSynEdit.Tag :=  3; end
//  else if cok = TCodRec.INI.Kind  then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckIni ); ObjectContentDBSynEdit.Tag :=  4; end
//  else if cok = TCodRec.JAVA.Kind then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckJava); ObjectContentDBSynEdit.Tag :=  5; end
//  else if cok = TCodRec.JS.Kind   then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckJs  ); ObjectContentDBSynEdit.Tag :=  6; end
//  else if cok = TCodRec.JSL.Kind  then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckJsl ); ObjectContentDBSynEdit.Tag :=  7; end
//  else if cok = TCodRec.JSON.Kind then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckJson); ObjectContentDBSynEdit.Tag :=  8; end
//  else if cok = TCodRec.MD.Kind   then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckMd  ); ObjectContentDBSynEdit.Tag :=  9; end
//  else if cok = TCodRec.PAS.Kind  then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckPas ); ObjectContentDBSynEdit.Tag := 10; end
//  else if cok = TCodRec.PY.Kind   then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckPy  ); ObjectContentDBSynEdit.Tag := 11; end
//  else if cok = TCodRec.R.Kind    then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckR   ); ObjectContentDBSynEdit.Tag := 12; end
//  else if cok = TCodRec.SQL.Kind  then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckSql ); ObjectContentDBSynEdit.Tag := 13; end
//  else if cok = TCodRec.TXT.Kind  then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckTxt ); ObjectContentDBSynEdit.Tag := 14; end
//  else if cok = TCodRec.YAML.Kind then begin ObjectContentDBSynEdit.Highlighter := gsyn.Highlighter(Self, ckYaml); ObjectContentDBSynEdit.Tag := 15; end;
  ObjectContentDBSynEdit.Tag := idx;

  // folding
//  gsyn.CodeKind := TCodKindEnum(ObjectContentDBSynEdit.Tag); // *** must be set before caling ScanForFoldRanges ***
//  ObjectContentDBSynEdit.OnScanForFoldRanges := gsyn.ScanForFoldRanges;
//  ObjectContentDBSynEdit.UseCodeFolding := false;
//  ObjectContentDBSynEdit.UseCodeFolding := true;

  // synsetup
//gsyn.Setup(ObjectContentDBSynEdit, Trunc(OptionTabWidthJvSpinEdit.Value), cke);
  SynEditsSetup;
end;
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'Search'}
procedure TBaseMainForm.SearchButtonedEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SearchButtonedEditRightButtonClick(Sender);
end;

procedure TBaseMainForm.SearchButtonedEditLeftButtonClick(Sender: TObject);
begin
  SearchButtonedEdit.Clear;
  SearchResultListBox.Clear;
  SearchButtonedEdit.SetFocus;
end;

procedure TBaseMainForm.SearchButtonedEditRightButtonClick(Sender: TObject);
var
  csv: string; // fieldcsv
begin
  // exit
  if SearchButtonedEdit.Text = '' then begin
    TMesRec.MsgShow('please supply a search string');
    Exit;
  end;

  // clear
  SearchResultListBox.Clear;

  {$REGION 'Method 1 - nocase - nowhoelword'}
  // searchin
  csv := 'FldObject';
  if SearchInContentCheckBox.Checked then csv := csv + ',FldContent';
  if SearchInDataCheckBox.Checked    then csv := csv + ',FldData';
  if SearchInNoteCheckBox.Checked    then csv := csv + ',FldNote';

  // listload
  TDstRec.DsFilterList(ObjectClientDataSet, SearchButtonedEdit.Text, csv, 'FldObject', SearchResultListBox.Items);
  {$ENDREGION}

  {$REGION 'Method 2 - withcase - withwhoelword'}
  // implement like replace
  {$ENDREGION}

  // globalsearchinfo
  gsyg.SearchText := SearchButtonedEdit.Text;

  // replacetab
  TopReplaceOutEdit.Text := SearchButtonedEdit.Text;
end;

procedure TBaseMainForm.SearchReplaceSwapLabelClick(Sender: TObject);
var
  str: string;
begin
  SearchButtonedEdit.Color  := clYellow;
  ReplaceButtonedEdit.Color := clYellow;
  Application.ProcessMessages;

  str := SearchButtonedEdit.Text;
  SearchButtonedEdit.Text := ReplaceButtonedEdit.Text;
  ReplaceButtonedEdit.Text := str;

  sleep(250);
  SearchButtonedEdit.Color  := clWindow;
  ReplaceButtonedEdit.Color := clWindow;
  Application.ProcessMessages;
end;

procedure TBaseMainForm.SearchResultListBoxClick(Sender: TObject);
var
  i: integer;
begin
  // idget
  i := integer(SearchResultListBox.Items.Objects[SearchResultListBox.ItemIndex]);

  // locateid
  ObjectNodeLocateAndExpand(i);
end;
  {$ENDREGION}

  {$REGION 'Replace'}
procedure TBaseMainForm.ReplaceButtonedEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ReplaceButtonedEditRightButtonClick(Sender);
end;

procedure TBaseMainForm.ReplaceButtonedEditLeftButtonClick(Sender: TObject);
begin
  ReplaceButtonedEdit.Clear;
  SearchResultListBox.Clear;
  SearchButtonedEdit.SetFocus;
end;

procedure TBaseMainForm.ReplaceButtonedEditRightButtonClick(Sender: TObject);

  {$REGION 'var'}
const
  separators: set of {char}ansichar = [' ', '.', ',', '?', '!', #13, #10, #09, '(', ')', '[', ']', '{', '}'];
//separators = System.AnsiStrings.WordDelimiters; // any char except core alphanum

var
  bm: TBookmark;
  wa: TStopwatch;
//go: boolean;                // commitreplace
  op, np: string;             // oldpattern, newpattern
  oz, ri, oi, oa: integer;    // objcounttotal, reccurrent, objid, objaffected
  ww, mc: boolean;            // wholeword, matchcase
  xz, cz, jz, nz: integer;    // replacementscount
  xr, cr, jr, nr: boolean;    // replacementhashappened
  xn, co, js, no: string;     // xxxname, content, json, note

  function xreplace(var x: string; var z: integer; const fld: string): boolean;
  begin
    // affectable?
    Result := (not x.Trim.IsEmpty) and (TStrRec.StrHasWithOpt(x, op, ww, mc));
    if not Result then
      Exit;

    // potentialoccurrences
    z := z + TStrRec.StrOccurences(x, op, ww, mc);

    // replace
  //if go then begin
      x := TStrRec.StrReplaceWithOpt(x, op, np, ww, mc);

      // cdschangeandcommit
      ObjectClientDataSet.Edit;
      ObjectClientDataSet.FieldByName(fld).Value := x;
    //ObjectClientDataSet.Post;
      ObjectDBNavigator.BtnClick(nbPost);
  //end;
  end;
  {$ENDREGION}

begin

  {$REGION 'exit'}
  if SearchButtonedEdit.Text = '' then  begin
    TMesRec.MsgShow('please supply a search string');
    Exit;
  end;
  if ReplaceButtonedEdit.Text = '' then begin
    TMesRec.MsgShow('please supply a replace string');
    Exit;
  end;
  {$ENDREGION}

  {$REGION 'init'}
  // clear
  SearchResultListBox.Clear;
//Application.ProcessMessages;

  // zip
//go := ReplaceCommitCheckBox.Checked;
  // patterns
  op := SearchButtonedEdit.Text;
  np := ReplaceButtonedEdit.Text;
  // options
  ww := SearchWholeWordCheckBox.Checked;
  mc := SearchMatchCaseCheckBox.Checked;
  {$ENDREGION}

  {$REGION 'feedback'}
//if go then begin
    if not TAskRec.Yes('W A R N I N G'#10#10'you are about to permanently change objects, continue?') then
       Exit;
//end else
//  mes.MsgShow('Just listing objects that contains "'+op+'"', 'Listing');
  {$ENDREGION}

  {$REGION 'loop'}
  wa := TStopwatch.StartNew;
  FInSearchAndReplace := true;
  Screen.Cursor := crHourGlass;
  ObjectClientDataSet.DisableControls;
  bm := ObjectClientDataSet.GetBookmark;
  try
    // loop
    oz := ObjectClientDataSet.RecordCount;
    ri := 0; // reccurrent
    oa := 0; // objaffected
    ObjectClientDataSet.First;
    while not ObjectClientDataSet.Eof do begin
      // set
      Inc(ri);
      oi := ObjectClientDataSet.FieldByName('FldId').AsInteger;    // objid
      xn := ObjectClientDataSet.FieldByName('FldObject').AsString; // objname

      // status
      LogFrame.LogOne('%d of %d searching object %4d - %s', [ri, oz, oi, xn]);

      // objectalwaysreplace
      xz := 0;                              // fldobject replacements count
      xr := xreplace(xn, xz, 'FldObject');  // replacement has happened
      if xr then
        ObjectDTClientTree.UpdateText;

      // contentreplace
      cz := 0;                              // fldcontent replacements count
      cr := false;
    if SearchInContentCheckBox.Checked then begin
      co := ObjectClientDataSet.FieldByName('FldContent').AsString;
      cr := xreplace(co, cz, 'FldContent'); // replacement has happened
    end;

      // datareplace
      jz := 0;                              // flddata replacements count
      jr := false;
    if SearchInDataCheckBox.Checked then begin
      js := ObjectClientDataSet.FieldByName('FldData').AsString;
      jr := xreplace(js, jz, 'FldData');    // replacement has happened
    end;

      // notereplace
      nz := 0;                              // replacements count
      nr := false;
    if SearchInNoteCheckBox.Checked then begin
      no := ObjectClientDataSet.FieldByName('FldNote').AsString;
      nr := xreplace(no, nz, 'FldNote');    // replacement has happened
    end;

      // log
      if xr or cr or jr or nr then begin
        // affected
        Inc(oa);

        // found
        SearchResultListBox.Items.AddObject(Format('name:%2d content:%2d json:%2d note:%2d - %4d - %s', [xz, cz, jz, nz, oi, xn]), TObject(oi)); // addthestringandtheobjid

        // ?
        Application.ProcessMessages;
      end;

      // next
      ObjectClientDataSet.Next;
    end;

    // log
    LogFrame.Log('%d of %d objects updated in %f seconds', [oa, oz, wa.ElapsedMilliseconds/1000]);
  finally
    ObjectClientDataSet.GotoBookmark(bm);
    ObjectClientDataSet.EnableControls;
    Screen.Cursor := crDefault;
    FInSearchAndReplace := false;
  end;
  {$ENDREGION}

  // ctrlf
  gsyg.SearchText := ReplaceButtonedEdit.Text;
end;
  {$ENDREGION}

  {$REGION 'Option'}

    {$REGION 'DateTime'}
procedure TBaseMainForm.OptionWeekWorkOneStartJvDateTimePickerChange(Sender: TObject);
var
  dat: TDateTime;
  tim: TTime;
begin
  // zip
  dat := OptionWeekWorkOneStartJvDateTimePicker.DateTime;
  tim := TimeOf(dat);

  // wwdayoftheweek
  OptionWorkWeekDayEdit.Text  := TDatRec.DatWeekDayStr(dat);
  OptionWorkWeekDayEdit.Tag   := TDatRec.DatWeekDayId(dat);
  OptionWorkWeekDayEdit.Hint  := OptionWorkWeekDayEdit.Tag.ToString;

  // wwtime
  OptionWorkWeekTimeEdit.Text := TimeToStr(TimeOf(dat));
  OptionWorkWeekTimeEdit.Tag  := Trunc(tim * 24);
  OptionWorkWeekTimeEdit.Hint := OptionWorkWeekTimeEdit.Tag.ToString;
end;
    {$ENDREGION}

    {$REGION 'Interface'}
procedure TBaseMainForm.OptionTabWidthJvSpinEditChange(Sender: TObject);
var
  tab: integer;
begin
  tab := Trunc(OptionTabWidthJvSpinEdit.Value);
  ObjectContentPrevDBSynEdit.TabWidth := tab;
  ObjectContentDBSynEdit.TabWidth     := tab;
  ObjectDataDBSynEdit.TabWidth        := tab;
  ObjectNoteDBSynEdit.TabWidth        := tab;
end;

procedure TBaseMainForm.OptionFontSizeJvSpinEditChange(Sender: TObject);
var
  siz: integer;
begin
  siz := Trunc(OptionFontSizeJvSpinEdit.Value);
  ObjectContentPrevDBSynEdit.Font.Size := siz;
  ObjectContentDBSynEdit.Font.Size     := siz;
  ObjectDataDBSynEdit.Font.Size        := siz;
  ObjectNoteDBSynEdit.Font.Size        := siz;
end;
    {$ENDREGION}

    {$REGION 'Show'}
procedure TBaseMainForm.OptionFoldingLineShowCheckBoxClick(Sender: TObject);
begin
  SynEditsSetup;
end;
    {$ENDREGION}

    {$REGION 'Python'}
procedure TBaseMainForm.OptionPythonVersionComboBoxChange(Sender: TObject);
begin
  if OptionPythonVersionComboBox.Items.Count <= 0 then
    Exit;

  OptionPythonEnvInitSpeedButton.Click;
end;

procedure TBaseMainForm.OptionPythonEnvInitSpeedButtonClick(Sender: TObject);
var
  okk: boolean;
  fbk: string;
begin
  okk := TPytRec.PythonComponentsInit(Self, FPythonEngine, FPythonGUIInputOutput, TCustomMemo(LogFrame.OutputRichEdit), OptionPythonVersionComboBox.ItemIndex, fbk);
  LogFrame.Log(fbk, okk);
  if okk then begin
    OptionPythonEnvInitSpeedButton.Caption := 'Python environment Ok';
    OptionPythonEnvInitSpeedButton.Font.Color := clGreen;
    LogFrame.LogOne('Python environment inizialized', fmSuccess);
  end else begin
    OptionPythonEnvInitSpeedButton.Caption := 'Python environment not initialized';
    OptionPythonEnvInitSpeedButton.Font.Color := clWebDarkOrange;
    LogFrame.LogOne('Unable to inizialize python environment', fmWarning);
  end;
end;

procedure TBaseMainForm.OptionPythonRawOutputCheckBoxClick(Sender: TObject);
begin
  FPythonGUIInputOutput.RawOutput := OptionPythonRawOutputCheckBox.Checked;
end;
    {$ENDREGION}

  {$ENDREGION}

{$ENDREGION}

{$REGION 'SoapConnection'}
procedure TBaseMainForm.MainSoapConnectionBeforeExecute(const MethodName: string; SOAPRequest: TStream);
begin
//  LogFrame.LogSoapRequest(SOAPRequest); // *** problems, something is not free up ***
end;

procedure TBaseMainForm.MainSoapConnectionAfterExecute(const MethodName: string; SOAPResponse: TStream);
begin
//  LogFrame.LogSoapResponse(SOAPResponse);
end;
{$ENDREGION}

{$REGION 'ObjectCds'}
procedure TBaseMainForm.ObjectClientDataSetAfterScroll(DataSet: TDataSet);
begin
  // searchandreplacespeedups
  if FInSearchAndReplace then
    Exit;

  {$REGION 'object'}
  // currentremember
  FId               := DataSet.FieldByName('FldId'              ).AsInteger;
  FObjectKind       := DataSet.FieldByName('FldObjectKind'      ).AsString;
  FContentKind      := DataSet.FieldByName('FldContentKind'     ).AsString;
  FFromOrganization := DataSet.FieldByName('FldFromOrganization').AsString; // ex FldOrganization
  FFromMember       := DataSet.FieldByName('FldFromMember'      ).AsString; // ex FldOwner
  FObject           := DataSet.FieldByName('FldObject'          ).AsString;

  // info
  ObjectNodeInfoLabel.Caption := Format('total %d', [{FId, DataSet.RecNo,} DataSet.RecordCount]);

  // kind
//ObjectKindDBComboBoxChange(nil);
  ObjectContentKindDBComboBoxChange(nil);

  // ids
//ObjectIdDBEdit.DataSource.DataSet.FieldByName(ObjectIdDBEdit.DataField).Alignment       := taLeftJustify;
//ObjectPIdDBEdit.DataSource.DataSet.FieldByName(ObjectPIdDBEdit.DataField).Alignment     := taLeftJustify;
//ObjectOrderDBEdit.DataSource.DataSet.FieldByName(ObjectOrderDBEdit.DataField).Alignment := taLeftJustify;
//XxxIdDBEdit.DataSource.DataSet.FieldByName(XxxIdDBEdit.DataField).Alignment             := taLeftJustify;

  // contentsjsonnotecharcount
//ObjectContentInfoUpdate;
//ObjectContentPrevInfoUpdate;
//ObjectDataInfoUpdate;
//ObjectNoteInfoUpdate;

  // markdown
  ActionMarkdownAction.Enabled := DataSet.FieldByName('FldContentKind').AsString = TCodRec.MD.Kind;

  // tabsbold
  ObjectTabsModifiedUpdateBold;
  {$ENDREGION}

  {$REGION 'detail'}
  // *** continue in descendent form... NO! ***
  {$ENDREGION}

end;

procedure TBaseMainForm.ObjectClientDataSetBeforeInsert(DataSet: TDataSet);
begin

  {$REGION 'object'}
  // treedisconnect
  ObjectDTClientTree.DataSource := nil; // 1-IMPORTANT
  {$ENDREGION}

  {$REGION 'detail'}
  // *** continue in descendent form... NO! ***
  {$ENDREGION}

end;

procedure TBaseMainForm.ObjectClientDataSetBeforePost(DataSet: TDataSet);
begin
  // caretchache
  FSynEditCaretPos   := ObjectContentDBSynEdit.CaretXY;
  FSynEditTopLinePos := ObjectContentDBSynEdit.TopLine;

  // lastupdatedset
  DataSet.FieldByName('FldUpdated').Value := Now;

  // revinc
  DataSet.FieldByName('FldRev').Value := StrToIntDef(DataSet.FieldByName('FldRev').AsString, 0) + 1;

  // persist
  if ObjectPersinstentDBCheckBox.Checked then begin
    // content
    ObjectContentPersist();
    if OptionVerboseCheckBox.Checked then
      LogFrame.Log('%s content saved to local disk: %s', [FObj]);

    // data
  //ObjectDataPersist();
  //if VerboseOptionCheckBox.Checked then
    //LogFmt('%s data saved to local disk', [FObj]);

    // note
    // ...
  end;
end;

procedure TBaseMainForm.ObjectClientDataSetAfterInsert(DataSet: TDataSet);
var
  idn: integer;         // rioidnext
  def, fbk: string;     // default
  pmv: array of string; // prompts
  vav: array of string; // values
begin

  {$REGION 'object'}
  // askvectors
  SetLength(pmv, 5);
  SetLength(vav, Length(pmv));

  // objectdefault
  def := TNamRec.RndInt(FObj);
  pmv[0] := 'Object Kind'            ; vav[0] := FObj;
  pmv[1] := 'Content Kind'           ; vav[1] := ContentKind(FContentKind);
  pmv[2] := Format('%s Name', [FObj]); vav[2] := def; if vav[2].Trim.IsEmpty then vav[2] := def;
  pmv[3] := 'Title'                  ; vav[3] := '';
  pmv[4] := 'Subtitle'               ; vav[4] := '';

  // chache
  // see CodeClient

  // override
  if FObj = 'Person' then
    pmv[2] := 'Person Surname and Name';

  try
    // ask
    if not InputQuery('New object data for ' + FObj, pmv, vav) then begin
      DataSet.Delete; // Abort ?
    //mes.I('User cancelled the action');
    //ObjectDTClientTree.DataSource := ObjectDataSource; // 2-IMPORTANT treereconnect
      Exit;
    end;

    // idnext
    if not TObjRec.IdNextRio(FObj, idn, fbk) then begin // *** this should "lock" the idnext numer on the server untill it is effectively used ***
      DataSet.Delete; // Abort ?
      TMesRec.W(fbk);
    //ObjectDTClientTree.DataSource := ObjectDataSource; // 2-IMPORTANT treereconnect
    //IdNextReleaseRio;
      Exit;
    end;

    // set
    try
      DataSet.Edit;
      DataSet.FieldByName('FldId'              ).Value := idn;
      DataSet.FieldByName('FldPId'             ).Value := FId;
      DataSet.FieldByName('FldId8'             ).Value := TId8Rec.Generate;
    //DataSet.FieldByName('FldOrder'           ).Value := null;
      DataSet.FieldByName('FldRev'             ).Value := 0;
      DataSet.FieldByName('FldCreated'         ).Value := now;
      DataSet.FieldByName('FldUpdated'         ).Value := now;
      DataSet.FieldByName('FldFromOrganization').Value := gmbr.Organization;
      DataSet.FieldByName('FldFromDepartment'  ).Value := gmbr.Department;
      DataSet.FieldByName('FldFromArea'        ).Value := gmbr.Area;
      DataSet.FieldByName('FldFromTeam'        ).Value := gmbr.Team;
      DataSet.FieldByName('FldFromMember'      ).Value := gmbr.Member;
      DataSet.FieldByName('FldToOrganization'  ).Value := gmbr.Organization;
      DataSet.FieldByName('FldToDepartment'    ).Value := gmbr.Department;
      DataSet.FieldByName('FldToArea'          ).Value := gmbr.Area;
      DataSet.FieldByName('FldToTeam'          ).Value := gmbr.Team;
      DataSet.FieldByName('FldToMember'        ).Value := '*';
    //DataSet.FieldByName('FldRoute'           ).Value := null;
      DataSet.FieldByName('FldObjectKind'      ).Value := vav[0];
      DataSet.FieldByName('FldContentKind'     ).Value := vav[1];
    //DataSet.FieldByName('FldDataKind'        ).Value := null;
      DataSet.FieldByName('FldState'           ).Value := TStaRec.Active.Name;
      DataSet.FieldByName('FldTitle'           ).Value := giif.NxN(vav[3]);
      DataSet.FieldByName('FldSubtitle'        ).Value := giif.NxN(vav[4]);
    //DataSet.FieldByName('FldDescription'     ).Value := null;
    //DataSet.FieldByName('FldSpare'           ).Value := null;
      DataSet.FieldByName('FldEncrypted'       ).Value := false;
      DataSet.FieldByName('FldPersist'         ).Value := true;
    //DataSet.FieldByName('FldImage'           ).Value := null;
    //DataSet.FieldByName('FldContentPrev'     ).Value := null;
    //DataSet.FieldByName('FldContent'         ).Value := null;
    //DataSet.FieldByName('FldData'            ).Value := null;
    //DataSet.FieldByName('FldNote'            ).Value := null;
      DataSet.FieldByName('FldObject'          ).Value := vav[2]; // this goes into TblObject, in TblXxx we do NOT replicate into FldXxx and leave just the FldId that is auto generated due to master-detail relationship
    //DataSet.Post;
      ObjectDBNavigator.BtnClick(nbPost);
      //IdNextReleaseRio;
      LogFrame.Log('Object data for %s initialized', [FObj]);

      // locate
      DataSet.Locate('FldId', idn, []); // ObjectNodeLocateAndExpand(i);
    except
      on e: Exception do begin
        // cancel
        DataSet.Delete; // *** WARNING: start onbeforecancel ***

        // locate
        DataSet.Locate('FldId', FIdGui, []);

        TMesRec.W(e.Message);
        LogFrame.Log('For help please contact ' + TWksRec.PHONE, false);
        LogFrame.LogShow;
      end;
    end;
  finally
    // treereconnect
    ObjectDTClientTree.DataSource := ObjectDataSource; // 2-IMPORTANT
  end;
  {$ENDREGION}

  {$REGION 'detail'}
  // *** continue in descendent form... NO! ***
  {$ENDREGION}

end;

procedure TBaseMainForm.ObjectClientDataSetAfterPost(DataSet: TDataSet);
var
  vnp: PVirtualNode;
begin

  {$REGION 'object'}
  // applyupdatetoremoteserver
  if ObjectClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to save %s object data to remote server', [FObj])
  else begin
    DataSet.Refresh; // IMPORTANT geteventualremotechanges?
    vnp := ObjectDTClientTree.FocusedNode;
    if Assigned(vnp) then begin
      TVstRec.NodeParamSet(ObjectDTClientTree, vnp, FObj, DataSet);
      ObjectDTClientTree.InvalidateChildren(vnp.Parent, true);
    end;

    // syneditcaretrestore
    ObjectContentDBSynEdit.CaretXY := FSynEditCaretPos;
    ObjectContentDBSynEdit.TopLine := FSynEditTopLinePos;

    if OptionVerboseCheckBox.Checked then
      LogFrame.Log('%s object data saved to remote server', [FObj]);
  end;
  {$ENDREGION}

  {$REGION 'detail'}
  // *** continue in descendent form... NO! ***
  {$ENDREGION}

  // tabsbold
  ObjectTabsModifiedUpdateBold;
end;

procedure TBaseMainForm.ObjectClientDataSetAfterRefresh(DataSet: TDataSet);
begin

  {$REGION 'syn'}
  SynEditsSetup;
  {$ENDREGION}

  {$REGION 'object'}
  ObjectDTClientTree.Invalidate; // notworking
  {$ENDREGION}

  {$REGION 'detail'}
  // *** continue in descendent form... NO! ***
  {$ENDREGION}

  // tabsbold
  ObjectTabsModifiedUpdateBold;
end;

procedure TBaseMainForm.ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
begin

  {$REGION 'object'}
  // nochild
  FChildsDeleteOk := not DataSet.Locate('FldPId', FId, []);

  // abort
  if not FChildsDeleteOk then begin
  //DataSet.Cancel; // not working
    TMesRec.W('This %s object has children, delete is not allowed.  Delete the children first!', [FObj]);
    Abort();
  end;
  {$ENDREGION}

  {$REGION 'detail'}
  // *** continue in descendent form... YES, DELETING ALL XXX CHILDS ***
  {$ENDREGION}

end;

procedure TBaseMainForm.ObjectClientDataSetAfterDelete(DataSet: TDataSet);
begin

  {$REGION 'object'}
  if ObjectClientDataSet.ApplyUpdates(0) > 0 then
    TMesRec.I('Unable to delete %s object data from remote server', [FObj])
  else begin
    ObjectClientDataSet.Refresh; // IMPORTAN
    LogFrame.Log('%s object data deleted from remote server', [FObj]);
  end;
  {$ENDREGION}

  {$REGION 'detail'}
  // *** continue in descendent form... NO! ***
  {$ENDREGION}

end;

procedure TBaseMainForm.ObjectClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin

  {$REGION 'object'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

  {$REGION 'detail'}
  // *** continue in descendent form... NO! ***
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'SynEdit'}
procedure TBaseMainForm.SynEditRegionInsertActionExecute(Sender: TObject);
begin
  gsyn.InsertRegion(ObjectContentDBSynEdit);
end;

procedure TBaseMainForm.SynEditRegionCollapseActionExecute(Sender: TObject);
begin
  gsyn.RegionCollapse(ObjectContentDBSynEdit);
end;

procedure TBaseMainForm.SynEditRegionExpandActionExecute(Sender: TObject);
begin
  gsyn.RegionExpand(ObjectContentDBSynEdit);
end;
{$ENDREGION}

end.
