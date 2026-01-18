unit WksBaseClientMainFormUnit;

interface

{$REGION 'Help'}
{
  *** CLIENT ANCESTOR ***

  This form unit contains only the Object
  In descendent forms all Object stuff is inherited, then add only specific stuff about the specific Xxx object.
  To start a new Client, just copy all WksXxx*.* files and replace 'Xxx' --> 'Newobject' everywere.

  what    table       scope/part                   managedin
  ------------------------------------------------------------------------------
  OBJECT  TblObject   fixed/general/master         this happens in this ancestor form
  XXX     TblXxx      variable/specific/detail     this happens in descendent forms, same ancestor events plus specific events


  *** TABLES AND IDS ***
   -----------------            -------------
  |    TblObject    |          |   TblXxx    |
  |-----------------|          |-------------|
  | FldId           |1--------N| FldObjectId | select a group of items
  | FldPId          |          | FldId       | \_ organize those itemes hierarchically
  |                 |          | FldPId      | /
  | ...             |          | FldUId...   | or organize them as a flat list
  |                 |          |             |
   -----------------            -------------

  FldId     Object primary Id
  FldPId    Object parent Id
  FldObjectId   FldOId    Xxx Id to reference the Object Id (connects details to fixed info)
  FldUId    Xxy unique Id                     (ensure uniqueness in the detail table)

  This schema, for example, is used in the DbaFile database.


  *** SPECIFIC OBJECTS SO FAR ***
  0    1       2             3       4        5      6     7         8     9       10      11
                                                                                           Portfolio
                                                                                           Program
                                                                                           Package
                                                                                           Project
                                                                                           Phase
                                                                                           Group
  XXX, Person, Organization, Member, Account, Agent, Code, Document, Page, Report, System, Task
       User    Department                                  Guideline       Params
               Area                                        Procedure       Datasets
               Team                                        Specification   Charts
               Member                                      Standard        Series
                                                           Letter(Legal)
                                                           Act(Legal)
                                                           Help
  *** CHANGES ***
  FldObjectId --> FOId
}
{$ENDREGION}

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , Winapi.ActiveX
  , System.Win.ComObj        // edge webview
  , Winapi.WebView2          // edge webview
  , System.SysUtils
  , System.Variants
  , System.Classes
  , System.Actions
  , System.ImageList
  , Vcl.ActnColorMaps
  , Vcl.ActnList
  , Vcl.ActnMan
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
  , Vcl.Edge                 // edge webview
  , Vcl.WinXCtrls            // win 10 ctrls
  , Vcl.PythonGUIInputOutput // python i/o
  , Data.DB
  , Datasnap.DBClient        // clientdataset
//, Midaslib                 // *** without it the client, on a different pc, give a blocching, hard to find error, moved in WksBaseClientProject.dpr ***
  , Soap.SOAPConn
  , SynEdit
  , SynDBEdit
  , SynEditCodeFolding
  , JvCaptionPanel
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
  , JvClock
  , JvComponentBase
  , JvNavigationPane
  , VirtualTrees
//, VirtualTrees.Types
  , DTClientTree
  , DTDBTreeView
  , PythonEngine
  , PythonVersions
  , Wks000Unit
  , WksLogFrameUnit
  , WksColorDialogFormUnit
  , WksWordFrameUnit
  , WksPythonUnit
  ;
{$ENDREGION}

{$REGION 'Const'}
const
  WM_AFTER_SHOW = WM_USER + 300; // custom message to simulate an aftershow event
{$ENDREGION}

{$REGION 'Type'}
type
  TBaseMainForm = class(TForm)
    ActionBrowseAction: TAction;
    ActionBrowseToolButton: TToolButton;
    ActionDeleteAction: TAction;
    ActionDeleteToolButton: TToolButton;
    ActionDestroyAction: TAction;
    ActionDestroyToolButton: TToolButton;
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
    ClientToolBar: TToolBar;
    ClientVersionAction: TAction;
    ClientVersionCheckToolButton: TToolButton;
    ClientnfoToolButton: TToolButton;
    DayLabel: TLabel;
    FileKindImageList24: TImageList;
    FilesLocalDeleteAction: TAction;
    FilesLocalFolderOpenAction: TAction;
    FilesLocalOpenAction: TAction;
    FilesRioAction: TActionList;
    FilesRioCheckInAction: TAction;
    FilesRioCheckInPopup: TMenuItem;
    FilesRioCheckInToolButton: TToolButton;
    FilesRioCheckOutAction: TAction;
    FilesRioCheckOutCancelAction: TAction;
    FilesRioCheckOutCancelPopup: TMenuItem;
    FilesRioCheckOutCancelToolButton: TToolButton;
    FilesRioCheckOutPopup: TMenuItem;
    FilesRioCheckOutToolButton: TToolButton;
    FilesRioDeleteAction: TAction;
    FilesRioDeletePopup: TMenuItem;
    FilesRioDeleteToolButton: TToolButton;
    FilesRioDownloadAction: TAction;
    FilesRioDownloadPopup: TMenuItem;
    FilesRioDownloadToolButton: TToolButton;
    FilesRioHttpLinkAction: TAction;
    FilesRioHttpLinkToolButton: TToolButton;
    FilesRioImageList24: TImageList;
    FilesRioInfoLabel: TLabel;
    FilesRioLocalClearToolButton: TToolButton;
    FilesRioLocalDeletePopup: TMenuItem;
    FilesRioLocalFolderOpenPopup: TMenuItem;
    FilesRioLocalOpenPopup: TMenuItem;
    FilesRioLocalOpenToolButton: TToolButton;
    FilesRioMoveAction: TAction;
    FilesRioMovePopup: TMenuItem;
    FilesRioMoveToolButton: TToolButton;
    FilesRioOwnershipTakeAction: TAction;
    FilesRioOwnershipTakePopup: TMenuItem;
    FilesRioOwnershipTakeToolButton: TToolButton;
    FilesRioPopup: TPopupMenu;
    FilesRioPropertiesAction: TAction;
    FilesRioPropertiesToolButton: TToolButton;
    FilesRioPropertyPopupFile: TMenuItem;
    FilesRioRefreshAction: TAction;
    FilesRioRefreshPopup: TMenuItem;
    FilesRioRefreshToolButton: TToolButton;
    FilesRioSearchAction: TAction;
    FilesRioSearchPopup: TMenuItem;
    FilesRioSearchToolButton: TToolButton;
    FilesRioTabSheet: TTabSheet;
    FilesRioToolBar: TToolBar;
    FilesRioTopPanel: TPanel;
    FilesRioTree: TVirtualStringTree;
    FilesRioUploadAction: TAction;
    FilesRioUploadPopup: TMenuItem;
    FilesRioUploadToolButton: TToolButton;
    FilesRioWorkingFolderlOpenToolButton: TToolButton;
    FilesRiohttpLinkPopup: TMenuItem;
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
    ObjectClientDataSet: TClientDataSet;
    ObjectContentCharCountLabel: TLabel;
    ObjectContentDBSynEdit: TDBSynEdit;
    ObjectContentEdgeBrowser: TEdgeBrowser;
    ObjectContentKindDBComboBox: TDBComboBox;
    ObjectContentKindLabel: TLabel;
    ObjectContentLeftPanel: TPanel;
    ObjectContentPrevCharCountLabel: TLabel;
    ObjectContentPrevDBSynEdit: TDBSynEdit;
    ObjectContentPrevSaveSpeedButton: TSpeedButton;
    ObjectContentPrevTabSheet: TTabSheet;
    ObjectContentPrevTopPanel: TPanel;
    ObjectContentSplitView: TSplitView;
    ObjectContentSplitter: TSplitter;
    ObjectContentSynEditTimer: TTimer;
    ObjectContentTabSheet: TTabSheet;
    ObjectContentTopPanel: TPanel;
    ObjectCreatedLabel: TLabel;
    ObjectDBEdit: TDBEdit;
    ObjectDBNavigator: TDBNavigator;
    ObjectDTClientTree: TDTClientTree;
    ObjectDataCharCountLabel: TLabel;
    ObjectDataDBSynEdit: TDBSynEdit;
    ObjectDataKindDBComboBox: TDBComboBox;
    ObjectDataKindLabel: TLabel;
    ObjectDataSource: TDataSource;
    ObjectDataTabSheet: TTabSheet;
    ObjectDataTopPanel: TPanel;
    ObjectDataValidateSpeedButton: TSpeedButton;
    ObjectDateJvScrollMaxBand: TJvScrollMaxBand;
    ObjectDescriptionDBSynEdit: TDBSynEdit;
    ObjectDescriptionShowSpeedButton: TSpeedButton;
    ObjectDescriptionSplitter: TSplitter;
    ObjectEncryptedDBCheckBox: TDBCheckBox;
    ObjectGeneralJvScrollMaxBand: TJvScrollMaxBand;
    ObjectId8DBEdit: TDBEdit;
    ObjectId8Label: TLabel;
    ObjectIdDBEdit: TDBEdit;
    ObjectIdDBText: TDBText;
    ObjectIdJvScrollMaxBand: TJvScrollMaxBand;
    ObjectIdLabel: TLabel;
    ObjectImage2DBImage: TDBImage;
    ObjectImageClearLabel: TLabel;
    ObjectImageDBImage: TDBImage;
    ObjectImageEditLabel: TLabel;
    ObjectImageFitLabel: TLabel;
    ObjectImageJvScrollMaxBand: TJvScrollMaxBand;
    ObjectImageLoadLabel: TLabel;
    ObjectImageSaveLabel: TLabel;
    ObjectJobGradeCalculateLabel: TLabel;
    ObjectToJobGradeMinDBComboBox: TDBComboBox;
    ObjectToJobGradeMinLabel: TLabel;
    ObjectJvScrollMax: TJvScrollMax;
    ObjectKindDBComboBox: TDBComboBox;
    ObjectKindDBText: TDBText;
    ObjectKindImageList16: TImageList;
    ObjectKindLabel: TLabel;
    ObjectNodeInfoLabel: TLabel;
    ObjectNoteCharCountLabel: TLabel;
    ObjectNoteDBSynEdit: TDBSynEdit;
    ObjectNoteTabSheet: TTabSheet;
    ObjectNoteTopPanel: TPanel;
    ObjectOrderDBEdit: TDBEdit;
    ObjectOrderLabel: TLabel;
    ObjectPIdDBEdit: TDBEdit;
    ObjectPIdLabel: TLabel;
    ObjectPersinstentDBCheckBox: TDBCheckBox;
    ObjectRevDBEdit: TDBEdit;
    ObjectRevLabel: TLabel;
    ObjectStateDBComboBox: TDBComboBox;
    ObjectStateDBText: TDBText;
    ObjectStateImageList24: TImageList;
    ObjectStateLabel: TLabel;
    ObjectTabSheet: TTabSheet;
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
    OptionFileBackupBeforeCheckInCheckBox: TCheckBox;
    OptionFileDeleteAfterUploadCheckBox: TCheckBox;
    OptionFileJvScrollMaxBand: TJvScrollMaxBand;
    OptionFileLocalFileOverrideAskCheckBox: TCheckBox;
    OptionFileOnDoubleClickComboBox: TComboBox;
    OptionFileOnDoubleClickLabel: TLabel;
    OptionFileOpenAfterChechOutCheckBox: TCheckBox;
    OptionFileReadOnlyDownloadedFileCheckBox: TCheckBox;
    OptionFileShowOnlyMyFilesCheckBox: TCheckBox;
    OptionFileWorkingFolderClearLabel: TLabel;
    OptionFileWorkingFolderLabel: TLabel;
    OptionFileWorkingFolderSelectButtonedEdit: TButtonedEdit;
    OptionFileWorkingFolderUseCheckBox: TCheckBox;
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
    OptionPythonExePathEdit: TEdit;
    OptionPythonExePathLabel: TLabel;
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
    OptionTextBoxInfoShowCheckBox: TCheckBox;
    OptionTextRightEdgeComboBox: TComboBox;
    OptionTextRightEdgeLabel: TLabel;
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
    SearchAction: TAction;
    SearchActionList: TActionList;
    SearchButtonedEdit: TButtonedEdit;
    SearchFilterPanel: TPanel;
    SearchImageList: TImageList;
    SearchInContentCheckBox: TCheckBox;
    SearchInDataCheckBox: TCheckBox;
    SearchInLabel: TLabel;
    SearchInNoteCheckBox: TCheckBox;
    SearchLabel: TLabel;
    SearchMatchCaseCheckBox: TCheckBox;
    SearchNextAction: TAction;
    SearchNextToolButton: TToolButton;
    SearchPrevAction: TAction;
    SearchPrevToolButton: TToolButton;
    SearchReplaceAction: TAction;
    SearchReplaceAllButton: TButton;
    SearchReplaceInEdit: TEdit;
    SearchReplaceInLabel: TLabel;
    SearchReplaceMatchCaseICheckBox: TCheckBox;
    SearchReplaceOutEdit: TEdit;
    SearchReplaceOutLabel: TLabel;
    SearchReplaceSwapLabel2: TLabel;
    SearchReplaceSwapLabel: TLabel;
    SearchReplaceToolButton: TToolButton;
    SearchReplaceWholeCheckBox: TCheckBox;
    SearchResultListBox: TListBox;
    SearchTabSheet: TTabSheet;
    SearchToolButton: TToolButton;
    SearchWholeWordCheckBox: TCheckBox;
    StatusBar: TStatusBar;
    SynEditContentHeaderInsertAction: TAction;
    SynEditContentPopup: TPopupMenu;
    SynEditContentRegionCollapseAction: TAction;
    SynEditContentRegionExpandAction: TAction;
    SynEditContentRegionInsertAction: TAction;
    SynEditContentTemplateInsertAction: TAction;
    SynEditContentTemplateInsertPopup: TMenuItem;
    SynEditDataJsonTemplateInsertAction: TAction;
    SynEditHeaderInsertPopup: TMenuItem;
    SynEditInsertRegionPopup: TMenuItem;
    SynEditRegionInsertPopup: TMenuItem;
    SysEditContentAction: TActionList;
    SysEditContentImageList24: TImageList;
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
    TextLineNumberToolButton: TToolButton;
    TextLineNumbersAction: TAction;
    TextLineNumbersToolButton: TToolButton;
    TextLinePrefixAction: TAction;
    TextLinePrefixToolButton: TToolButton;
    TextNumbersAction: TAction;
    TextSortAscAction: TAction;
    TextSortAscToolButton: TToolButton;
    TextSortDescAction: TAction;
    TextSortDescToolButton: TToolButton;
    TextSpecialCharsAction: TAction;
    TextSpecialCharsToolButton: TToolButton;
    TextStatsAction: TAction;
    TextStatsToolButton: TToolButton;
    TextTabToSpacesAction: TAction;
    TextTabToSpacesToolButton: TToolButton;
    TextToolBar: TToolBar;
    TextTrimRightAction: TAction;
    TextTrimRightToolButton: TToolButton;
    TextUtilsLineBeginWithPopup: TMenuItem;
    TextUtilsLineNumbersPopup: TMenuItem;
    TextUtilsPopup: TPopupMenu;
    TextWordWrapAction: TAction;
    TextWordWrapToolButton: TToolButton;
    TextZeroStartAction: TAction;
    TextZeroStartToolButton: TToolButton;
    TimeTabSheet: TTabSheet;
    TimerJvClock: TJvClock;
    TimerJvThreadTimer: TJvThreadTimer;
    TimerLabel: TLabel;
    TopActionTabSheet: TTabSheet;
    TopClientTabSheet: TTabSheet;
    TopPageControl2: TPageControl;
    TopPageControl3: TPageControl;
    TopPageControl: TPageControl;
    TopPanel: TPanel;
    TopSearchTabSheet: TTabSheet;
    TopSearchToolBar: TToolBar;
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
    WordTabSheet: TTabSheet;
    YearLabel: TLabel;
    ActionImportToolButton: TToolButton;
    ActionImportAction: TAction;
    ObjectPersonJvScrollMaxBand: TJvScrollMaxBand;
    ObjectAuthorLabel: TLabel;
    ObjectOwnerCsvDBEdit: TDBEdit;
    ObjectOwnerCsvLabel: TLabel;
    ObjectUpdatedByLabel: TLabel;
    ObjectExpireLabel: TLabel;
    ObjectExpireJvDBDateTimePicker: TJvDBDateTimePicker;
    ObjectGroupLabel: TLabel;
    ObjectGroupDBEdit: TDBEdit;
    ObjectHiddenDBCheckBox: TDBCheckBox;
    ObjectContentTopPanel2: TPanel;
    ObjectTitleLabel: TLabel;
    ObjectTitleDBEdit: TDBEdit;
    ObjectSubtitleLabel: TLabel;
    ObjectSubtitleDBEdit: TDBEdit;
    ObjectDescriptionLabel: TLabel;
    ObjectBgColorLabel: TLabel;
    ObjectBgColorDBEdit: TDBEdit;
    ObjectFgColorLabel: TLabel;
    ObjectFgColorDBEdit: TDBEdit;
    ObjectRouteIdCsvLabel: TLabel;
    ObjectRouteIdCsvDBEdit: TDBEdit;
    ObjectUpdatedDBEdit: TDBEdit;
    ObjectAuthorDBEdit: TDBEdit;
    ObjectUpdatedByDBEdit: TDBEdit;
    ObjectCreatedDBEdit: TDBEdit;
    ObjectDataJvScrollMaxBand: TJvScrollMaxBand;
    ObjectData2Label: TLabel;
    ObjectData2DBEdit: TDBEdit;
    ObjectData3Label: TLabel;
    ObjectData3DBEdit: TDBEdit;
    ObjectData4Label: TLabel;
    ObjectData4DBEdit: TDBEdit;
    ObjectData1Label: TLabel;
    ObjectData1DBEdit: TDBEdit;
    ActionExportToolButton: TToolButton;
    ActionExportAction: TAction;
    ActionGenerateToolButton: TToolButton;
    ActionGenerateAction: TAction;
    procedure ActionBrowseActionExecute(Sender: TObject);
    procedure ActionDeleteActionExecute(Sender: TObject);
    procedure ActionDestroyActionExecute(Sender: TObject);
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
    procedure FilesLocalDeleteActionExecute(Sender: TObject);
    procedure FilesLocalFolderOpenActionExecute(Sender: TObject);
    procedure FilesLocalOpenActionExecute(Sender: TObject);
    procedure FilesRioCheckInActionExecute(Sender: TObject);
    procedure FilesRioCheckOutActionExecute(Sender: TObject);
    procedure FilesRioCheckOutCancelActionExecute(Sender: TObject);
    procedure FilesRioDeleteActionExecute(Sender: TObject);
    procedure FilesRioDownloadActionExecute(Sender: TObject);
    procedure FilesRioHttpLinkActionExecute(Sender: TObject);
    procedure FilesRioMoveActionExecute(Sender: TObject);
    procedure FilesRioOwnershipTakeActionExecute(Sender: TObject);
    procedure FilesRioPropertiesActionExecute(Sender: TObject);
    procedure FilesRioRefreshActionExecute(Sender: TObject);
    procedure FilesRioSearchActionExecute(Sender: TObject);
    procedure FilesRioTabSheetShow(Sender: TObject);
    procedure FilesRioTreeChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure FilesRioTreeClick(Sender: TObject);
    procedure FilesRioTreeDblClick(Sender: TObject);
    procedure FilesRioTreeEditCancelled(Sender: TBaseVirtualTree; Column: TColumnIndex);
    procedure FilesRioTreeEdited(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
    procedure FilesRioTreeEditing(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var Allowed: boolean);
    procedure FilesRioTreeFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
    procedure FilesRioTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure FilesRioTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean; var ImageIndex: TImageIndex);
    procedure FilesRioTreeGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
    procedure FilesRioTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure FilesRioTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure FilesRioTreeNewText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; NewText: string);
    procedure FilesRioTreeNodeClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);
    procedure FilesRioTreeNodeDblClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);
    procedure FilesRioTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure FilesRioUploadActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MainSoapConnectionAfterExecute(const MethodName: string; SOAPResponse: TStream);
    procedure MainSoapConnectionBeforeExecute(const MethodName: string; SOAPRequest: TStream);
    procedure ObjectClientDataSetAfterCancel(DataSet: TDataSet);
    procedure ObjectClientDataSetAfterDelete(DataSet: TDataSet);
    procedure ObjectClientDataSetAfterInsert(DataSet: TDataSet);
    procedure ObjectClientDataSetAfterOpen(DataSet: TDataSet);
    procedure ObjectClientDataSetAfterPost(DataSet: TDataSet);
    procedure ObjectClientDataSetAfterRefresh(DataSet: TDataSet);
    procedure ObjectClientDataSetAfterScroll(DataSet: TDataSet);
    procedure ObjectClientDataSetBeforeCancel(DataSet: TDataSet);
    procedure ObjectClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure ObjectClientDataSetBeforeInsert(DataSet: TDataSet);
    procedure ObjectClientDataSetBeforePost(DataSet: TDataSet);
    procedure ObjectClientDataSetBeforeRefresh(DataSet: TDataSet);
    procedure ObjectClientDataSetBeforeScroll(DataSet: TDataSet);
    procedure ObjectClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure ObjectContentDBSynEditChange(Sender: TObject);
    procedure ObjectContentDBSynEditDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: boolean);
    procedure ObjectContentDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ObjectContentDBSynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ObjectContentDBSynEditMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ObjectContentDBSynEditMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ObjectContentDBSynEditStatusChange(Sender: TObject; Changes: TSynStatusChanges);
    procedure ObjectContentEdgeBrowserCreateWebViewCompleted(Sender: TCustomEdgeBrowser; AResult: HRESULT);
    procedure ObjectContentKindDBComboBoxChange(Sender: TObject);
    procedure ObjectContentPrevDBSynEditChange(Sender: TObject);
    procedure ObjectContentPrevDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ObjectContentPrevDBSynEditMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ObjectContentPrevSaveSpeedButtonClick(Sender: TObject);
    procedure ObjectContentSynEditTimerTimer(Sender: TObject);
    procedure ObjectDBEditKeyPress(Sender: TObject; var Key: Char);
    procedure ObjectDTClientTreeClick(Sender: TObject);
    procedure ObjectDTClientTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure ObjectDTClientTreeDBTreeCreateNode(Sender: TDTDBTreeView; Node: PVirtualNode; DataSet: TDataSet);
    procedure ObjectDTClientTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean; var ImageIndex: TImageIndex);
    procedure ObjectDTClientTreeNodeClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);
    procedure ObjectDTClientTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure ObjectDataDBSynEditChange(Sender: TObject);
    procedure ObjectDataDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ObjectDataDBSynEditMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ObjectDataKindDBComboBoxChange(Sender: TObject);
    procedure ObjectDataValidateSpeedButtonClick(Sender: TObject);
    procedure ObjectDescriptionShowSpeedButtonClick(Sender: TObject);
    procedure ObjectIdDBTextDblClick(Sender: TObject);
    procedure ObjectImage2DBImageDblClick(Sender: TObject);
    procedure ObjectImageClearLabelClick(Sender: TObject);
    procedure ObjectImageFitLabelClick(Sender: TObject);
    procedure ObjectImageLoadLabelClick(Sender: TObject);
    procedure ObjectImageSaveLabelClick(Sender: TObject);
    procedure ObjectJobGradeCalculateLabelClick(Sender: TObject);
    procedure ObjectKindDBComboBoxChange(Sender: TObject);
    procedure ObjectNoteDBSynEditChange(Sender: TObject);
    procedure ObjectNoteDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ObjectNoteDBSynEditMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OptionFileWorkingFolderClearLabelClick(Sender: TObject);
    procedure OptionFileWorkingFolderSelectButtonedEditRightButtonClick(Sender: TObject);
    procedure OptionFoldingLineShowCheckBoxClick(Sender: TObject);
    procedure OptionFontSizeJvSpinEditChange(Sender: TObject);
    procedure OptionPythonEnvInitSpeedButtonClick(Sender: TObject);
    procedure OptionPythonRawOutputCheckBoxClick(Sender: TObject);
    procedure OptionPythonVersionComboBoxChange(Sender: TObject);
    procedure OptionTabWidthJvSpinEditChange(Sender: TObject);
    procedure OptionTextBoxInfoShowCheckBoxClick(Sender: TObject);
    procedure OptionTextRightEdgeComboBoxChange(Sender: TObject);
    procedure OptionWeekWorkOneStartJvDateTimePickerChange(Sender: TObject);
    procedure ReplaceButtonedEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ReplaceButtonedEditLeftButtonClick(Sender: TObject);
    procedure ReplaceButtonedEditRightButtonClick(Sender: TObject);
    procedure SearchActionExecute(Sender: TObject);
    procedure SearchButtonedEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SearchButtonedEditLeftButtonClick(Sender: TObject);
    procedure SearchButtonedEditRightButtonClick(Sender: TObject);
    procedure SearchNextActionExecute(Sender: TObject);
    procedure SearchPrevActionExecute(Sender: TObject);
    procedure SearchReplaceActionExecute(Sender: TObject);
    procedure SearchReplaceAllButtonClick(Sender: TObject);
    procedure SearchReplaceInEditKeyPress(Sender: TObject; var Key: Char);
    procedure SearchReplaceSwapLabel2Click(Sender: TObject);
    procedure SearchReplaceSwapLabelClick(Sender: TObject);
    procedure SearchResultListBoxClick(Sender: TObject);
    procedure SynEditContentHeaderInsertActionExecute(Sender: TObject);
    procedure SynEditContentRegionCollapseActionExecute(Sender: TObject);
    procedure SynEditContentRegionExpandActionExecute(Sender: TObject);
    procedure SynEditContentRegionInsertActionExecute(Sender: TObject);
    procedure SynEditContentTemplateInsertPopupClick(Sender: TObject);
    procedure TextCommentActionExecute(Sender: TObject);
    procedure TextCompareActionExecute(Sender: TObject);
    procedure TextFoldActionExecute(Sender: TObject);
    procedure TextFoldingActionExecute(Sender: TObject);
    procedure TextGutterActionExecute(Sender: TObject);
    procedure TextLineNumbersActionExecute(Sender: TObject);
    procedure TextLinePrefixActionExecute(Sender: TObject);
    procedure TextNumbersActionExecute(Sender: TObject);
    procedure TextSortAscActionExecute(Sender: TObject);
    procedure TextSortDescActionExecute(Sender: TObject);
    procedure TextSpecialCharsActionExecute(Sender: TObject);
    procedure TextStatsActionExecute(Sender: TObject);
    procedure TextTabToSpacesActionExecute(Sender: TObject);
    procedure TextTrimRightActionExecute(Sender: TObject);
    procedure TextWordWrapActionExecute(Sender: TObject);
    procedure TextZeroStartActionExecute(Sender: TObject);
    procedure TimerJvClockClick(Sender: TObject);
    procedure TimerJvThreadTimerTimer(Sender: TObject);
    procedure UtilsPythonExecActionExecute(Sender: TObject);
    procedure WeekLabelClick(Sender: TObject);
    procedure WordTabSheetHide(Sender: TObject);
    procedure WordTabSheetShow(Sender: TObject);
    procedure ActionImportActionExecute(Sender: TObject);
    procedure ObjectBgColorLabelClick(Sender: TObject);
    procedure ObjectBgColorDBEditChange(Sender: TObject);
    procedure ActionExportActionExecute(Sender: TObject);
    procedure ActionGenerateActionExecute(Sender: TObject);
  protected
    // winmessages
    procedure WmFormAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
  //procedure WMMouseWheel(var Msg: TWMMouseWheel); message WM_MOUSEWHEEL; // overriding mouseweel
  private
    { Private declarations }
    // flags
    FMultiInsertOn       : boolean;                // set to true only if genetare mulpiple objects insert
    // chache
    FIdIni               : integer;                // idlastsaved
    FIdGui               : integer;                // idlastduringguitreeclick (after a refresh FId is resetted on cdsafterscroll... so we use FIdGui that is set on treenode click)
    FObject              : string;                 // objectname
    FObjectKind          : string;                 // Root, Zzz, Person, Code, ...
    FContentKind         : string;                 // Text, Sql, Py, Md, ...
  //FAuthor              : string;                 // ex FromMember
    FInSearchAndReplace  : boolean;                // searchspeedup
  //FXxxFieldRecArr      : TXxxFieldRecArr;        // xxx variable/specific fields/values asked during new object creation (but in descendent forms!)
    // synedit
  //FSynEditCaretPos     : TBufferCoord;           // syneditposcache \__no more necessary, cursor state is saved directly into each TblObject
  //FSynEditTopLinePos   : integer;                // syneditposcache /
  //FSynEditIsDragging   : boolean;                // syneditselectiondrag
  //FSynEditDragStartPos : TPoint;                 // syneditselectiondrag
    // text
    FTextUtilsLineBeginWith: string;               // 
    // python
    FPythonEngine         : TPythonEngine;         // local
    FPythonGUIInputOutput : TPythonGUIInputOutput; // local
    // cds
    function  CdsCloseAll(var IvFbk: string): boolean;
    function  CdsOpenAll(var IvFbk: string): boolean;
    // soap
    function  SoapRefresh(var IvFbk: string): boolean;
    function  SoapClose(var IvFbk: string): boolean;
    function  SoapOpen(var IvFbk: string): boolean;
  //procedure SoapCancel;
    // object
  //procedure ObjectCdsApplyUpdates;
    procedure ObjectGuiEnable(IvEnable: boolean);
    procedure ObjectNodeLocate(IvId: integer);
    procedure ObjectNodeLocateAndExpand(IvId: integer; IvExpand: boolean = true);
    function  ObjectContentKind(IvContentKindDefault: string = 'Txt'): string;
    procedure ObjectContentPersistInfo(var IvDir, IvId, IvName, IvFile: string);
    procedure ObjectContentPersist(IvReadOnly: boolean = true);
    procedure ObjectContentPersistOpen;
    procedure ObjectSynEditsSetup;
    procedure ObjectSynEditsFreeze;
    procedure ObjectSynEditsUnfreeze;
//    procedure ObjectSynEditStateStoreToDb;
//    procedure ObjectSynEditStateRestoreFromDb;
    procedure ObjectTabsUpdate;
    procedure ObjectContentSplitterUpdate;
    procedure ObjectContentEdgeBrowserUpdate;
    procedure ObjectContentPrevInfoUpdate;
    procedure ObjectContentInfoUpdate;
    procedure ObjectDataInfoUpdate;
    procedure ObjectNoteInfoUpdate;
    // files
    function  FilesRioFileLocalSpec(IvFilePathOriginal, IvFilename: string; IvFilenameReadOnly: boolean): string;
    procedure FilesRioFileLocalDelete(IvLocalFileSpec: string; var IvFbk: string);
    procedure FilesRioTreeLoad(IvFilRemVector: TFilRemVector);
    function  FilesRioFileDownload(IvPFilRec: PFilRec; IvFilenameReadOnly: boolean; var IvLocalFileSpec, IvFbk: string): boolean;
    function  FilesRioFileUpload(IvLocalFileSpec: string; IvFileOriginalDelete: boolean; var IvFbk: string): boolean;
    function  FilesRioFileUpdate(IvPFilRec: PFilRec; IvFileOriginalDelete: boolean; var IvLocalFileSpec, IvFbk: string): boolean;
    function  FilesRioFileDelete(IvPFilRec: PFilRec; IvUser: string; IvDeleteSoft: boolean; IvRecoverable: boolean; var IvFbk: string): boolean;
    function  FilesRioFileMove(IvUId, IvObj: string; IvObjectId: integer; var IvFbk: string): boolean;
    function  FilesRioFileMoveIsAllowed(IvObj: string; IvObjectId: integer; IvUId, IvUser: string; var IvIsAllowed: boolean; var IvFbk: string): boolean;
  public
    { Public declarations }
    // object
    FObj               : string;          // Xxx, Account, Code, Person... --> TObjEnum
    FId                : integer;         // id        (current)
    FPId               : integer;         // parentid  (hierarchical relationship)
  //FObjectId          : integer;         // objectid  (id in details table)
    // objecttree
    FNodePath          : string;          // selected node path
    FNodeKey           : integer;         // selected node key=oid
    FNodeCaption       : string;          // selected node caption
    FNodeLevel         : integer;         // selected node level
    FNodeChildsCount   : integer;         // selected node childs
    FChildsDeleteOk    : boolean;         // flag to delete details xxx childs
    // now
    FYear, FQuarter, FMonth    , FWeekIso   , FWeekWork   , FWeekDay, FDay    , FHour, FMinute, FSecond, FMilliSecond: word;
                     FMonthStr , FWeekIsoStr, FWeekWorkStr          , FDayStr                                        : string;
                     FMonthStr3                                     , FDayStr3                                       : string;
    // content and data(json)
    procedure ContentInsert(IvMessage, IvTextToInsert: string);
    procedure DataJsonInsert(IvMessage, IvTextToInsert: string);
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
  , System.Math
  , System.Generics.Collections
//, System.UITypes // vkcodes
  , Vcl.RecError // reconcileerrors
  , Vcl.DBGrids
  , Vcl.Clipbrd
  , SyneditTypes
  , WksLoginFormUnit
  , WksTextEditorFormUnit
  , WksJsonEditorFormUnit
  , WksPythonEditorFormUnit
  , WksSqlEditorFormUnit
  , WksTextDiffFormUnit
  , WksTextStatsFormUnit
  , WksMemberRoleLevelGradeFormUnit
  , WksGenerateDialogFormUnit
//, WksExportDialogFormUnit *** incomplete ***
  , WksFileSoapMainServiceIntf
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
                // *** I think here a remote provider name might be set ***
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
  if TAskRec.No('You made some changes to %s clientdataset, apply them to remote server?', [FObj]) then
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

function  TBaseMainForm.ObjectContentKind(IvContentKindDefault: string): string; // [OBJECTLIST]
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
    {gsyn.Focused}ObjectContentDBSynEdit.Lines.SaveToFile(fsp);
  except
    on e: Exception do
      TMesRec.E(e.Message);
  end;

  // setreadonly
  if IvReadOnly then
    if not TFsyRec.FileAttrReadOnlySet(fsp, fbk) then
      TMesRec.W(fbk);
end;

procedure TBaseMainForm.ObjectContentPersistOpen;
var
  dir, oid, nam, fsp, fbk: string; // dir, id, name, filespec
begin
  // info
  ObjectContentPersistInfo(dir, oid, nam, fsp);

  // open
  if not TFsyRec.FileExists(fsp, fbk) then
    TMesRec.W(fbk)
  else if not TWinRec.WinShellExec(Application.Handle, fsp, fbk) then
    TMesRec.W(fbk);
end;

procedure TBaseMainForm.ObjectSynEditsSetup;
var
  idx, tab: integer;
  cke: TCodKindEnum;
//dke: TDatKindEnum;
begin
  // exit
  if not ObjectClientDataSet.Active then
    Exit;

  // contentkind
  idx := ObjectContentKindDBComboBox.ItemIndex - 1;
  if idx < 0 then
    cke := ckTxt
  else
    cke := TCodRec.CodeKindEnumFromInt(idx);

  // tabspaces
  tab := Trunc(OptionTabWidthJvSpinEdit.Value);

  // selectively
//         if MainPageControl.ActivePage = ObjectContentPrevTabSheet then begin
    ObjectContentPrevDBSynEdit.BeginUpdate;
    gsyn.Setup(ObjectContentPrevDBSynEdit, tab, cke                , OptionFoldingLineShowCheckBox.Checked);
    ObjectContentPrevDBSynEdit.EndUpdate;

//end else if MainPageControl.ActivePage = ObjectContentTabSheet then begin
    ObjectDescriptionDBSynEdit.BeginUpdate;
    gsyn.Setup(ObjectDescriptionDBSynEdit, tab{, cke});
    ObjectDescriptionDBSynEdit.EndUpdate;
    ObjectContentDBSynEdit.BeginUpdate;
    gsyn.Setup(ObjectContentDBSynEdit    , tab, cke                , OptionFoldingLineShowCheckBox.Checked);
    ObjectContentDBSynEdit.EndUpdate;

//end else if MainPageControl.ActivePage = ObjectDataTabSheet then begin
    ObjectDataDBSynEdit.BeginUpdate;
    gsyn.Setup(ObjectDataDBSynEdit       , tab, TCodKindEnum.ckJson, OptionFoldingLineShowCheckBox.Checked); // *** NOP, depends on DataType --> dke? ***
    ObjectDataDBSynEdit.EndUpdate;

//end else if MainPageControl.ActivePage = ObjectDataTabSheet then begin
    ObjectNoteDBSynEdit.BeginUpdate;
    gsyn.Setup(ObjectNoteDBSynEdit       , tab, TCodKindEnum.ckTxt , OptionFoldingLineShowCheckBox.Checked);
    ObjectNoteDBSynEdit.EndUpdate;
//end;

  // adjust
  ObjectDBEdit.Margins.Left := 35;

  // codefolding
  TextFoldingAction.Checked := true; // the above setup will activate the codefolding
end;

//procedure TBaseMainForm.ObjectSynEditStateStoreToDb;
//var
//  sts: TStringStream; // vec : TArray<TSynFoldRange>
//begin
//  // *** warning, ds should already be in edit mode ***
//
//  // caret
//  //FSynEditCaretPos   := ObjectContentDBSynEdit.CaretXY;
//  //FSynEditTopLinePos := ObjectContentDBSynEdit.TopLine;
//  ObjectClientDataset.FieldByName('FldEditorCaret').Value := Format('%d,%d,%d', [ObjectContentDBSynEdit.CaretX, ObjectContentDBSynEdit.CaretY, ObjectContentDBSynEdit.TopLine]);
//
//  // foldingstate
//  sts := TStringStream.Create;
//  try
//    sts.Clear;
//    ObjectContentDBSynEdit.AllFoldRanges.StoreCollapsedState(sts);
//    ObjectClientDataset.FieldByName('FldEditorFolding').Value := sts.Bytes{DataString}; // *** WARNING if --[REGION ''] are not present the sts will be empty and field will be null so the restore will fail!
//  finally
//    sts.Clear;
//    sts.Free;
//  end;
//end;

//procedure TBaseMainForm.ObjectSynEditStateRestoreFromDb;
//var
//  sts: TStringStream;
//  car: string;
//begin
//  // caret
//  //ObjectContentDBSynEdit.CaretXY := FSynEditCaretPos  ;
//  //ObjectContentDBSynEdit.TopLine := FSynEditTopLinePos;
//  // reset
//  //FSynEditCaretPos   := BufferCoord(1, 1);
//  //FSynEditTopLinePos := 1;
//
//  // caret
//  car := TStrRec.StrCoalesce([ObjectClientDataset.FieldByName('FldEditorCaret').AsString, '1,1,1']);
//  ObjectContentDBSynEdit.CaretX  := TCsvRec.CsvRowField(car, 0);
//  ObjectContentDBSynEdit.CaretY  := TCsvRec.CsvRowField(car, 1);
//  ObjectContentDBSynEdit.TopLine := TCsvRec.CsvRowField(car, 2);
//
//  // exit
//  if ObjectClientDataset.FieldByName('FldEditorFolding').Value = null then
//    Exit;
//
//  // foldingstate
//  sts := TStringStream.Create;
//  try
//    TStmRec.FromByteArray(ObjectClientDataset.FieldByName('FldEditorFolding').AsBytes, sts);
//    sts.Seek(0, soBeginning);
//
//    // folding
//    ObjectContentDBSynEdit.AllFoldRanges.RestoreCollapsedState(sts);
//
//    // folding
//  //  gsyn.CodeKind := TCodKindEnum(ObjectContentDBSynEdit.Tag); // *** must be set before caling ScanForFoldRanges ***
//  //  ObjectContentDBSynEdit.OnScanForFoldRanges := gsyn.ScanForFoldRanges;
//  //  ObjectContentDBSynEdit.UseCodeFolding := false;
//  //  ObjectContentDBSynEdit.UseCodeFolding := true;
//  finally
//    sts.Clear;
//    sts.Free;
//  end;
//end;

procedure TBaseMainForm.ObjectSynEditsFreeze;
begin
//ObjectContentDBSynEdit.BeginUpdate;
  ObjectContentPrevDBSynEdit.DataSource := nil;
  ObjectContentDBSynEdit.DataSource     := nil;
  ObjectDataDBSynEdit.DataSource        := nil;
  ObjectNoteDBSynEdit.DataSource        := nil;
end;

procedure TBaseMainForm.ObjectSynEditsUnfreeze;
begin
  ObjectContentPrevDBSynEdit.DataSource := ObjectDataSource;
  ObjectContentDBSynEdit.DataSource     := ObjectDataSource;
  ObjectDataDBSynEdit.DataSource        := ObjectDataSource;
  ObjectNoteDBSynEdit.DataSource        := ObjectDataSource;
//ObjectContentDBSynEdit.EndUpdate;
end;

procedure TBaseMainForm.ObjectTabsUpdate;
begin
  ObjectContentPrevTabSheet.Caption := ifthen(ObjectContentPrevDBSynEdit.Text.IsEmpty, 'Previous', 'PREVIOUS');
  ObjectContentTabSheet.Caption     := ifthen(ObjectContentDBSynEdit.Text.IsEmpty    , 'Content' , 'CONTENT' );
  ObjectDataTabSheet.Caption        := ifthen(ObjectDataDBSynEdit.Text.IsEmpty       , '  Data'  , '  DATA'  );
  ObjectNoteTabSheet.Caption        := ifthen(ObjectNoteDBSynEdit.Text.IsEmpty       , '  Note'  , '  NOTE'  );
end;

procedure TBaseMainForm.ObjectContentSplitterUpdate;
begin
  ObjectContentSplitter.Align  := alLeft;
  ObjectContentSplitView.Width := (ObjectContentTabSheet.ClientWidth - ObjectContentSplitter.Width) div 2;
  ObjectContentSplitter.Align  := alRight;
end;

procedure TBaseMainForm.ObjectContentEdgeBrowserUpdate;
var
  htm: string;
begin
    htm := THtmRec.Page(
      TStrRec.StrCoalesce([ObjectTitleDBEdit.Text, ObjectDBEdit.Text], '') // title
    , ObjectSubTitleDBEdit.Text                                            // subtitle
    , ObjectContentDBSynEdit.Text                                          // content
    , ObjectContentKindDBComboBox.Text                                     // contentkind
    , ''                                                                   // class
    , ''                                                                   // style
    , true                                                                 // titleshow
    , true                                                                 // subtitleshow
    , true                                                                 // imageshow
    , true                                                                 // topnavoff
    , true                                                                 // systeminfooff
    , false                                                                // urlabsolute
    );

    // navigate
    ObjectContentEdgeBrowser.NavigateToString(htm); // '<html><body><h1>Hello From Delphi</h1></body></html>'
end;

procedure TBaseMainForm.ObjectContentPrevInfoUpdate;
begin
  ObjectContentPrevCharCountLabel.Caption := Format('row: %d  col: %d  rows %d  chars: %d  bytes: %d  selection: %d', [ObjectNoteDBSynEdit.CaretY   , ObjectNoteDBSynEdit.CaretX   , ObjectNoteDBSynEdit.Lines.Count   , Length(UTF8Encode(ObjectNoteDBSynEdit.Text))   , Length(ObjectNoteDBSynEdit.Text)   , ObjectNoteDBSynEdit.SelLength   ]);
end;

procedure TBaseMainForm.ObjectContentInfoUpdate;
begin
  ObjectContentCharCountLabel.Caption     := Format('row: %d  col: %d  rows %d  chars: %d  bytes: %d  selection: %d', [ObjectContentDBSynEdit.CaretY, ObjectContentDBSynEdit.CaretX, ObjectContentDBSynEdit.Lines.Count, Length(UTF8Encode(ObjectContentDBSynEdit.Text)), Length(ObjectContentDBSynEdit.Text), ObjectContentDBSynEdit.SelLength]);
end;

procedure TBaseMainForm.ObjectDataInfoUpdate;
begin
  ObjectDataCharCountLabel.Caption        := Format('row: %d  col: %d  rows %d  chars: %d  bytes: %d  selection: %d', [ObjectDataDBSynEdit.CaretY   , ObjectDataDBSynEdit.CaretX   , ObjectDataDBSynEdit.Lines.Count   , Length(UTF8Encode(ObjectDataDBSynEdit.Text))   , Length(ObjectDataDBSynEdit.Text)   , ObjectDataDBSynEdit.SelLength   ]);
end;

procedure TBaseMainForm.ObjectNoteInfoUpdate;
begin
  ObjectNoteCharCountLabel.Caption        := Format('row: %d  col: %d  rows %d  chars: %d  bytes: %d  selection: %d', [ObjectNoteDBSynEdit.CaretY   , ObjectNoteDBSynEdit.CaretX   , ObjectNoteDBSynEdit.Lines.Count   , Length(UTF8Encode(ObjectNoteDBSynEdit.Text))   , Length(ObjectNoteDBSynEdit.Text)   , ObjectNoteDBSynEdit.SelLength   ]);
end;
  {$ENDREGION}

  {$REGION 'Content and Data'}
procedure TBaseMainForm.ContentInsert(IvMessage, IvTextToInsert: string);
var
  a: TBufferCoord;
begin
  if not IvMessage.IsEmpty then
    if TAskRec.No(IvMessage) then
      Exit;

  a := ObjectContentDBSynEdit.CaretXY;
  ObjectClientDataSet.Edit;
  gsyn.InsertTextAtCaret(ObjectContentDBSynEdit, IvTextToInsert);
//ObjectClientDataSet.Post;
  ObjectDBNavigator.BtnClick(nbPost);
//ObjectContentDBSynEdit.SelStart  := gui.SelLength;
//ObjectContentDBSynEdit.SelLength := 0;
  ObjectContentDBSynEdit.CaretXY := a;
end;

procedure TBaseMainForm.DataJsonInsert(IvMessage, IvTextToInsert: string);
var
  a: TBufferCoord;
begin
  if not IvMessage.IsEmpty then
    if TAskRec.No(IvMessage) then
      Exit;

  a := ObjectDataDBSynEdit.CaretXY;
  ObjectClientDataSet.Edit;
  gsyn.InsertTextAtCaret(ObjectDataDBSynEdit, IvTextToInsert);
//ObjectClientDataSet.Post;
  ObjectDBNavigator.BtnClick(nbPost);
//ObjectDataDBSynEdit.SelStart  := gui.SelLength;
//ObjectDataDBSynEdit.SelLength := 0;
  ObjectDataDBSynEdit.CaretXY := a;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Form'}
procedure TBaseMainForm.FormCreate(Sender: TObject);

  {$REGION 'var'}
var
  i: integer;
  suc: boolean; // success
  str, fbk: string;
  coi: TCoiRec; // contentitem (contentkind)
//dai: TCoiRec; // dataitem (datakind)
  sti: TStiRec; // stateitem
  pvs: TPythonVersions;
  pve: TPythonVersion;
  fcv: TArray<integer>; // FilesRiotree columns width vector
  {$ENDREGION}

begin

  {$REGION 'LOGIN SESSION & GLOBAL OBJECTS'}
  suc := TLoginForm.Execute(fbk); // *** business objects (gpxy, gorg, gthe, gses, gper, gusr, gmbr, ..., gcli, gsys) are initialized during this phase ***
  if not suc then
    Application.Terminate;
  {$ENDREGION}

  {$REGION 'OBJECT (master/general/standard)'}
  FObj := StringReplace(Name, 'MainForm', '', []); // XxxMainForm --> Xxx, AccountMainForm --> Account;
  {$ENDREGION}

  {$REGION 'XXX (detail/specific/custom)'}
  // xxxfield continue in discendent clients
//FFldXxx  := 'Fld' + FObj; // useless
  {$ENDREGION}

  {$REGION 'form'}
  TFrmRec.FormInit(Sender as TForm);

  // enable wheel events for the form
  //Self.OnMouseWheel := FormMouseWheel;
  {$ENDREGION}

  {$REGION 'gui'}
  MainPanel.Align                              := alClient;
//LeftJvNetscapeSplitter.Minimized             := true;
  RightJvNetscapeSplitter.Maximized            := true;
  TopPageControl.ActivePageIndex               := 1;
  MainPageControl.ActivePageIndex              := 1;
  LeftPageControl.ActivePageIndex              := 0;
  RightPageControl.ActivePageIndex             := 0;
//ActionTabSheet.Caption                       := FObj;
//ObjectTreeTabSheet.Caption                   := FObj;
  ObjectNodeInfoLabel.Caption                  := '';
  ObjectContentCharCountLabel.Caption          := '';
  ObjectDataCharCountLabel.Caption             := '';
  ObjectNoteCharCountLabel.Caption             := '';
  ObjectContentPrevDBSynEdit.ReadOnly          := true;
  ObjectContentSplitter.Visible                := false;
  ObjectContentSplitView.Opened                := false;
  ObjectContentTopPanel2.Visible               := false;
  ObjectDescriptionSplitter.Visible            := false;
//ActionMarkdownAction.Checked                 := true;
  SearchReplaceOutEdit.Clear;
  SearchReplaceInEdit.Clear;
  ObjectDataDBSynEdit.Tag                      := 11;
  {$ENDREGION}

  {$REGION 'zzz'}
  ActionBrowseAction.Visible       := false;
//ActionEditAction.Visible         := false;
//ActionZzzAction.Visible          := false;
  ActionDeleteAction.Visible       := false;
  ActionDestroyAction.Visible      := false;
  ActionLoadFromFileAction.Visible := false;
  ActionSaveToFileAction.Visible   := false;
//ActionMarkdownAction.Visible     := false;
  {$ENDREGION}

  {$REGION 'ini'}
  // object (by obj)
  FIdIni := gini.IntGet(FObj + '/Id', 1);
  FId := FIdIni;
  FIdGui := FId;

  // option (common)
  OptionCryptoKeyEdit.Text                         := gini.CryGet('Common/OptionCryptoKey'                  , '12345'                    );
  OptionPersistRootFolderEdit.Text                 := gini.StrGet('Common/OptionPersistRootFolder'          , 'C:\$\Persist'             );
  OptionTempFolderEdit.Text                        := gini.StrGet('Common/OptionTempFolder'                 , 'C:\$\Temp'                );
  OptionWeekWorkOneStartJvDateTimePicker.DateTime  := gini.FloGet('Common/OptionWeekWorkOneStart'           , IncHour(Date(), 19)        ); OptionWeekWorkOneStartJvDateTimePickerChange(nil);

  // optionfile (common)
  OptionFileShowOnlyMyFilesCheckBox.Checked        := gini.BooGet('File/OptionFileShowOnlyMyFiles'          , true                       );
  OptionFileLocalFileOverrideAskCheckBox.Checked   := gini.BooGet('File/OptionFileLocalFileOverrideAsk'     , true                       );
  OptionFileReadOnlyDownloadedFileCheckBox.Checked := gini.BooGet('File/OptionFileReadOnlyDownloadedFile'   , true                       );
  OptionFileOpenAfterChechOutCheckBox.Checked      := gini.BooGet('File/OptionFileOpenAfterChechOut'        , true                       );
  OptionFileDeleteAfterUploadCheckBox.Checked      := gini.BooGet('File/OptionFileDeleteAfterUpload'        , true                       );
  OptionFileBackupBeforeCheckInCheckBox.Checked    := gini.BooGet('File/OptionFileBackupBeforeCheckIn'      , true                       );
  OptionFileWorkingFolderUseCheckBox.Checked       := gini.BooGet('File/OptionFileWorkingFolderUse'         , true                       );
  OptionFileWorkingFolderSelectButtonedEdit.Text   := gini.StrGet('File/OptionFileWorkingFolderSelect'      , FILE_WORKING_FOLDER_DEFAULT);
  OptionFileOnDoubleClickComboBox.ItemIndex        := gini.IntGet('File/OptionFileOnDoubleClick'            , 0                          );

  // optiongeneral (by obj)
  OptionStateDefaultComboBox.ItemIndex             := gini.IntGet(FObj + '/OptionStateDefaul'               , 0                          );
  OptionFontSizeJvSpinEdit.Value                   := gini.FloGet(FObj + '/OptionFontSize'                  , 10                         ); OptionFontSizeJvSpinEditChange(nil);
  OptionTabWidthJvSpinEdit.Value                   := gini.FloGet(FObj + '/OptionTabWidth'                  , 2                          ); OptionTabWidthJvSpinEditChange(nil);
  OptionTextRightEdgeComboBox.ItemIndex            := gini.IntGet(FObj + '/OptionTextRightEdge'             , 5 {128}                    ); OptionTextRightEdgeComboBoxChange(nil);
  OptionAutoRunCheckBox.Checked                    := gini.BooGet(FObj + '/OptionAutoRun'                   , false                      );
  OptionAutoLoginCheckBox.Checked                  := gini.BooGet(FObj + '/OptionAutoLogin'                 , false                      );
  OptionAutoHideCheckBox.Checked                   := gini.BooGet(FObj + '/OptionAutoHide'                  , false                      );
  OptionAutoRefreshCheckBox.Checked                := gini.BooGet(FObj + '/OptionAutoRefresh'               , false                      );
  OptionShowInTrayCheckBox.Checked                 := gini.BooGet(FObj + '/OptionShowInTray'                , true                       );
  OptionMessageBeforeHideCheckBox.Checked          := gini.BooGet(FObj + '/OptionMessageBeforeHide'         , true                       );
  OptionPasswordOnMaximizeCheckBox.Checked         := gini.BooGet(FObj + '/OptionPasswordOnMaximize'        , false                      );
  OptionBackupOnExitCheckBox.Checked               := gini.BooGet(FObj + '/OptionBackupOnExit'              , false                      );
  OptionAlwaysOnTopCheckBox.Checked                := gini.BooGet(FObj + '/OptionAlwaysOnTop'               , false                      );
  OptionCommentRemoveCheckBox.Checked              := gini.BooGet(FObj + '/OptionCommentRemove'             , true                       );
  OptionVerboseCheckBox.Checked                    := gini.BooGet(FObj + '/OptionVerbose'                   , false                      );

  // optionshow (by obj)
  OptionTextBoxInfoShowCheckBox.Checked            := gini.BooGet(FObj + '/OptionTextBoxInfoShow'           , true                       );
  OptionFoldingLineShowCheckBox.Checked            := gini.BooGet(FObj + '/OptionFoldingLineShow'           , false                      );

  // searchreplace (by obj)
  SearchInContentCheckBox.Checked                  := gini.BooGet(FObj + '/SearchInContent'                 , true                       );
  SearchInDataCheckBox.Checked                     := gini.BooGet(FObj + '/SearchInData'                    , false                      );
  SearchInNoteCheckBox.Checked                     := gini.BooGet(FObj + '/SearchInNote'                    , false                      );
  {$ENDREGION}

  {$REGION 'proxy'}
  // *** gpxy setup happens during LoginFrom creation ***
  {$ENDREGION}

  {$REGION 'rio'}
  // *** TRioRec setup happens when it is called ***
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
//UserAvatarImage.Hint         := Format('winsession:%s', [gses.Info]);
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
  OrganizationNameLabel.Caption         := gorg.Www; // '(' + gorg.Www + ')'
  {$ENDREGION}

  {$REGION 'objtree'}
  // note: here we use PNodeItem (instead of TObjRec) as a node-data-structure

  // config
  // ...
  // nodedatasize (set before adding nodes)
  ObjectDTClientTree.NodeDataSize := SizeOf(PNodeItem{TObjRec}); // no needs to event TreeGetNodeDataSize()
  {$ENDREGION}

  {$REGION 'filestree'}
  // note: here we use the specific TFilRec as a node-data-structure

  // miiscoptions
  FilesRioTree.TreeOptions.MiscOptions      := FilesRioTree.TreeOptions.MiscOptions      + [TVTMiscOption.toReportMode];       // do hierarchical behaviour

  // paintoptions
//FilesRioTree.TreeOptions.PaintOptions     := FilesRioTree.TreeOptions.PaintOptions     - [TVTPaintOption.toShowTreeLines];
  FilesRioTree.TreeOptions.PaintOptions     := FilesRioTree.TreeOptions.PaintOptions     + [TVTPaintOption.toShowRoot
                                                                                         {, TVTPaintOption.toShowButtons}];
  // selectionoptions
  FilesRioTree.TreeOptions.SelectionOptions := FilesRioTree.TreeOptions.SelectionOptions + [TVTSelectionOption.toFullRowSelect
                                                                                         ,  TVTSelectionOption.toMultiSelect];
  // headeroptions
  FilesRioTree.Header.Options               := FilesRioTree.Header.Options               + [TVTHeaderOption.hoVisible];        // enable header to display columns
//FilesRioTree.Header.Options               := FilesRioTree.Header.Options               - [TVTHeaderOption.hoColumnResize];

  // columnsadd
  with FilesRioTree.Header.Columns do begin
    // userorder
    Add.Text := 'Filename';
    Add.Text := 'Updated';         // dbrecordupdated
    Add.Text := 'State';           // Active, Locked
    Add.Text := 'EditingBy';
    Add.Text := 'Rev';
    Add.Text := 'SizeBytes';
    Add.Text := 'Note';
    Add.Text := 'Owner';
    Add.Text := 'Organization';
    Add.Text := 'PathOriginal';
    Add.Text := 'DownloadCount';
    Add.Text := 'EditCount';
    Add.Text := 'CanDownload';
    Add.Text := 'CanEdit';
    Add.Text := 'Created';
    Add.Text := 'Modified';
    Add.Text := 'Kind';
    Add.Text := 'ContentType';
    Add.Text := 'ObjectId';
    Add.Text := 'UId';
    Add.Text := 'Obj';
    Add.Text := 'Storage';
  end;

  // columnswidth
  fcv := gini.IntVecGet('FilesRioTree/ColumnWidthCsv', [200, 40, 150, 70, 200, 70, 70, 90, 50, 160, 140, 100, 70, 110, 70, 50, 270, 80, 60, 70, 50, 150]);
  for i := Low(fcv) to High(fcv) do
    FilesRioTree.Header.Columns[i].Width := fcv[i];

  // nodedatasize (set before adding nodes)
//FilesRioTree.NodeDataSize := SizeOf(TFilRec); // not needed if TreeGetNodeDataSize() is present
  {$ENDREGION}

  {$REGION 'clock'}
  TimerJvClock.Enabled := true;
  {$ENDREGION}

  {$REGION 'timer'}
  // set interval to 1 second
  TimerJvThreadTimer.Interval := 1000;

  // when false, the thread associated with the timer is destroyed when the timer is disabled
  // when true, the thread will be suspended and it is maintained across multiple timer activations
  TimerJvThreadTimer.KeepAlive := true;

  // start
  TimerJvThreadTimer.Enabled := true;
  {$ENDREGION}

  {$REGION 'property'}

    {$REGION 'object (common/fixed)'}
  // objectkind
  ObjectKindDBComboBox.Items.Add('');
  for str in TObjRec.ObjKindVector do
    ObjectKindDBComboBox.Items.Add(str);

  // contentkind
  ObjectContentKindDBComboBox.Items.Add('');
  for coi in TCodRec.Vector do
    ObjectContentKindDBComboBox.Items.Add(coi.Kind);

  // datakind
  ObjectDataKindDBComboBox.Items.Add('');
  for coi in TCodRec.Vector do
    ObjectDataKindDBComboBox.Items.Add(coi.Kind); // *** TO BE UPDATED ***

  // state
  ObjectStateDBComboBox.Items.Add('');
  for sti in TStaRec.Vector do
    ObjectStateDBComboBox.Items.Add(sti.Name);
    {$ENDREGION}

    {$REGION 'xxx (specific/variable)'}
    // continue in discendent clients
    {$ENDREGION}

    {$REGION 'python'}
  // versions
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

  // exepath(last)
  OptionPythonExePathEdit.Text := pve.PythonExecutable;
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'searchreplace'}
  SearchButtonedEdit.Clear;
  ReplaceButtonedEdit.Clear;
  {$ENDREGION}

  {$REGION 'synedit'}
  {$ENDREGION}

  {$REGION 'ready'}
  LogFrame.Log('%s %s client ready', [TSysRec.ACRONYM, FObj.ToUpper]);
  {$ENDREGION}

end;

procedure TBaseMainForm.FormShow(Sender: TObject);
begin
  // post a custom message WM_AFTER_SHOW to the form itself effectively triggering WmFormAfterShow routine(s), here and in descendent forms
  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TBaseMainForm.WmFormAfterShow(var Msg: TMessage);
begin
  // code here will be executed 1st after formshow event
  //ShowMessage('WM_AFTER_SHOW message received 1st !');
  ObjectContentEdgeBrowser.CreateWebView;
end;

{procedure TBaseMainForm.WMMouseWheel(var Msg: TWMMouseWheel);
const
  ScrollStep = 20; // adjust to how many pixels you want per wheel notch
begin
  // weelscroll
  if Msg.WheelDelta < 0 then
//  ObjectJvScrollMax.Perform(WM_VSCROLL, SB_LINEDOWN, 0)
    ObjectJvScrollMax.ScrollBy(0, ScrollStep)
  else
//  ObjectJvScrollMax.Perform(WM_VSCROLL, SB_LINEUP, 0)
    ObjectJvScrollMax.ScrollBy(0, -ScrollStep)
  ;
  // force ScrollMax to actually update the scrollbox
//  ObjectJvScrollMax.Perform(CM_SCROLLBARCHANGE, 0, 0);

  Msg.Result := 1; // mark as handled
end;}

procedure TBaseMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
  fbk: string;
  inv: TArray<integer>;
begin

  {$REGION 'objtree'}
  // columnswidthsave
  {$ENDREGION}

  {$REGION 'filestree'}
  // columnswidthsave
  for i := 0 to FilesRioTree.Header.Columns.Count - 1 do
    TArrayHlp.ArrayAppend<integer>(inv, FilesRioTree.Header.Columns[i].Width);
  gini.IntVecSet('FilesRioTree/ColumnWidthCsv', inv);
  {$ENDREGION}

  {$REGION 'synedit'}
  {$ENDREGION}

  {$REGION 'ini'}
  // object (by obj)
  gini.IntSet(FObj + '/Id', FId);

  // option (common)
  gini.CrySet( 'Common/OptionCryptoKey'                , OptionCryptoKeyEdit.Text                        );
  gini.StrSet( 'Common/OptionPersistRootFolder'        , OptionPersistRootFolderEdit.Text                );
  gini.StrSet( 'Common/OptionTempFolder'               , OptionTempFolderEdit.Text                       );
  gini.FloSet( 'Common/OptionWeekWorkOneStart'         , OptionWeekWorkOneStartJvDateTimePicker.DateTime );

  // optionfile (common)
  gini.BooSet(  'File/OptionFileShowOnlyMyFiles'       , OptionFileShowOnlyMyFilesCheckBox.Checked       );
  gini.BooSet(  'File/OptionFileLocalFileOverrideAsk'  , OptionFileLocalFileOverrideAskCheckBox.Checked  );
  gini.BooSet(  'File/OptionFileReadOnlyDownloadedFile', OptionFileReadOnlyDownloadedFileCheckBox.Checked);
  gini.BooSet(  'File/OptionFileOpenAfterChechOut'     , OptionFileOpenAfterChechOutCheckBox.Checked     );
  gini.BooSet(  'File/OptionFileDeleteAfterUpload'     , OptionFileDeleteAfterUploadCheckBox.Checked     );
  gini.BooSet(  'File/OptionFileBackupBeforeCheckIn'   , OptionFileBackupBeforeCheckInCheckBox.Checked   );
  gini.BooSet(  'File/OptionFileWorkingFolderUse'      , OptionFileWorkingFolderUseCheckBox.Checked      );
  gini.StrSet(  'File/OptionFileWorkingFolderSelect'   , OptionFileWorkingFolderSelectButtonedEdit.Text  );
  gini.IntSet(  'File/OptionFileOnDoubleClick'         , OptionFileOnDoubleClickComboBox.ItemIndex       );

  // optiongeneral (by obj)
  gini.IntSet(FObj + '/OptionStateDefaul'              , OptionStateDefaultComboBox.ItemIndex            );
  gini.FloSet(FObj + '/OptionFontSize'                 , OptionFontSizeJvSpinEdit.Value                  );
  gini.FloSet(FObj + '/OptionTabWidth'                 , OptionTabWidthJvSpinEdit.Value                  );
  gini.IntSet(FObj + '/OptionTextRightEdge'            , OptionTextRightEdgeComboBox.ItemIndex           );
  gini.BooSet(FObj + '/OptionAutoRun'                  , OptionAutoRunCheckBox.Checked                   );
  gini.BooSet(FObj + '/OptionAutoLogin'                , OptionAutoLoginCheckBox.Checked                 );
  gini.BooSet(FObj + '/OptionAutoHide'                 , OptionAutoHideCheckBox.Checked                  );
  gini.BooSet(FObj + '/OptionAutoRefresh'              , OptionAutoRefreshCheckBox.Checked               );
  gini.BooSet(FObj + '/OptionShowInTray'               , OptionShowInTrayCheckBox.Checked                );
  gini.BooSet(FObj + '/OptionMessageBeforeHide'        , OptionMessageBeforeHideCheckBox.Checked         );
  gini.BooSet(FObj + '/OptionPasswordOnMaximize'       , OptionPasswordOnMaximizeCheckBox.Checked        );
  gini.BooSet(FObj + '/OptionBackupOnExit'             , OptionBackupOnExitCheckBox.Checked              );
  gini.BooSet(FObj + '/OptionAlwaysOnTop'              , OptionAlwaysOnTopCheckBox.Checked               );
  gini.BooSet(FObj + '/OptionCommentRemove'            , OptionCommentRemoveCheckBox.Checked             );
  gini.BooSet(FObj + '/OptionVerbose'                  , OptionVerboseCheckBox.Checked                   );

  // optionshow (by obj)
  gini.BooSet(FObj + '/OptionTextBoxInfoShow'          , OptionTextBoxInfoShowCheckBox.Checked           );
  gini.BooSet(FObj + '/OptionFoldingLineShow'          , OptionFoldingLineShowCheckBox.Checked           );

  // searchreplace (by obj)
  gini.BooSet(FObj + '/SearchInContent'                , SearchInContentCheckBox.Checked                 );
  gini.BooSet(FObj + '/SearchInData'                   , SearchInDataCheckBox.Checked                    );
  gini.BooSet(FObj + '/SearchInNote'                   , SearchInNoteCheckBox.Checked                    );
  {$ENDREGION}

  {$REGION 'sessionclose'}
  if gses.SessionId > 0 then begin
    gses.DateTimeEnd := Now;
    if gses.CloseRio(fbk) then begin
      LogFrame.LogShow;
      LogFrame.Log('winsession %d closed at %s', [gses.SessionId, DateTimeToStr(gses.DateTimeEnd)]);
      Application.ProcessMessages;
      Sleep(MEDIUM_PAUSE_MS);
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
  DecodeDate(tic, FYear, FMonth, FDay);                                                              // 2017    1..12   1..31
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
    if TAskRec.No('WARNING'
      + sLineBreak
      + sLineBreak + 'Current "%s" is still in edit and has not been saved yet to the remote server !'
      + sLineBreak + 'Refreshing will reload everytingh from server and will owerride all your edits' // *** may be isnt' true ***
      + sLineBreak
      + sLineBreak + 'Continue ?', [FObj]) then
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
    MainPageControl.ActivePage := ObjectContentTabSheet;
  //ObjectContentDBSynEdit.SetFocus;
    Screen.Cursor := crDefault;
  end;
end;

procedure TBaseMainForm.ActionPostActionExecute(Sender: TObject);
begin
  if not (ObjectClientDataSet.State = dsBrowse) then begin
    // rev
    ObjectClientDataSet.FieldByName('FldRev').Value := ObjectClientDataSet.FieldByName('FldRev').AsInteger + 1;
    
    // post
    ObjectDBNavigator.BtnClick(nbPost);
  end;
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
var
  mbr: string; // member
  vnp: PVirtualNode;
  oid, pid: integer;
begin
  // ownercheck
  mbr := ObjectClientDataSet.FieldByName('FldAuthor').AsString;
  if mbr <> gusr.Username then begin
    TMesRec.I('Not allowed!  only %s can recycle this item !', [mbr]);
    Exit;
  end;

  // childscheck
  vnp := ObjectDTClientTree.FocusedNode;
  if vnp.ChildCount > 0 then begin
    TMesRec.I('This item has childs, please remove all childs first');
    Exit;
  end;

  // ask
  if not TAskRec.Yes('Move the current item to the Zzz recycle folder ?'
      + sLineBreak + 'Fields values will remain unchanged, only the State field will be set to Recycled') then
    Exit;

  // remember
  oid := ObjectClientDataSet.FieldByName('FldId').AsInteger;
  pid := ObjectClientDataSet.FieldByName('FldPId').AsInteger;

  // zzzMOVE
  ObjectDTClientTree.DataSource := nil; // IMPORTANT
//ObjectClientDataSet.Edit;
  TDstRec.RecordRecycleSoft(ObjectClientDataSet);
//ObjectClientDataSet.Post;           // post already done!
//ObjectDBNavigator.BtnClick(nbPost); // post already done!
//ObjectRefreshAction.Execute;
  ObjectDTClientTree.DataSource := ObjectDataSource; // IMPORTANT
  ObjectNodeLocateAndExpand(pid);
  //ObjectDTClientTree.Expanded[ObjectDTClientTree.FocusedNode] := true;

  // log
  LogFrame.LogOne('Item %d moved to the Zzz recycle folder', [oid]);
end;

procedure TBaseMainForm.ActionDeleteActionExecute(Sender: TObject);
var
  mbr: string;
  vnp: PVirtualNode;
  oid, pid: integer;
begin
  // ownercheck
  mbr := ObjectClientDataSet.FieldByName('FldAuthor').AsString;
  if mbr <> gusr.Username then begin
    TMesRec.I('Not allowed!  only %s can recycle this item !', [mbr]);
    Exit;
  end;

  // childscheck
  vnp := ObjectDTClientTree.FocusedNode;
  if vnp.ChildCount > 0 then begin
    TMesRec.I('This item has childs, please remove all childs first');
    Exit;
  end;


  // ask
  if not TAskRec.Yes('Soft delete the current item and move it to the Zzz recycle folder ?'
      + sLineBreak + 'Fields values will be set to NULL, name will be set to Available and state will be set to Deleted') then
    Exit;

  // remember
  oid := ObjectClientDataSet.FieldByName('FldId').AsInteger;
  pid := ObjectClientDataSet.FieldByName('FldPId').AsInteger;

  // zzzDELETE
  ObjectDTClientTree.DataSource := nil; // IMPORTANT
//ObjectClientDataSet.Edit;
  TDstRec.RecordDeleteSoft(ObjectClientDataSet, 'FldObject');
//ObjectClientDataSet.Post;           // post already done!
//ObjectDBNavigator.BtnClick(nbPost); // post already done!
//ObjectRefreshAction.Execute;
  ObjectDTClientTree.DataSource := ObjectDataSource; // IMPORTANT
  ObjectNodeLocate{AndExpand}(pid);

  // log
  LogFrame.LogOne('Item %d soft deleted and moved to the Zzz recycle folder', [oid]);
end;

procedure TBaseMainForm.ActionDestroyActionExecute(Sender: TObject);
begin
  // DESTROY
{ if DlgYesConfirm('Destroy', 'You are about to destroy all your Xxxs (Accounts) stored locally and remotely in the Cloud.'#13#13'CONTINUE ?') then
    if DlgYesConfirm('DESTROY LOCALLY', 'PLEASE CONFIRM TO DESTROY ALL OBJECTS STORED "LOCALLY".'#13#13'THE OPERATION IS REVERSIBLE'#13#13'CONTINUE ?') then begin
      //XxxCds.DisableControls;
      //try
        //XxxCds.EmptyDataSet; // seemsnotworking
          XxxCds.First;
          while XxxCds.RecordCount > 1 do begin
            if XxxCds.FieldByName('FldPId').AsInteger = FUserRootPId then begin // rootidskip
              XxxCds.Next;
              Continue;
            end;
            XxxCds.Delete;
            Application.ProcessMessages;
          end;
      //finally
      //  XxxCds.EnableControls;
      //end;
      if DlgYesConfirm('DESTROY ON CLOUD', 'PLEASE CONFIRM ALSO TO DESTROY ALL OBJECTS STORED "REMOTELY IN THE CLOUD".'#13#13'THE OPERATION IS NOT REVERSIBLE, YOU CAN RESTORE DATA ONLY FROM A BACKUP'#13#13'CONTINUE ?') then
        SoapApplyUpdates;
    end; }
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

procedure TBaseMainForm.ActionGenerateActionExecute(Sender: TObject);
var
  fbk: string;
  okk: boolean;
begin
  FMultiInsertOn := true;
  try
    okk := TGenerateDialogForm.Execute(FObj, FId, ObjectClientDataSet, fbk, Format('Generate Multiple %s Objects', [FObj]));
    if okk then
      ActionRefreshAction.Execute;
    LogFrame.Log(fbk);
  finally
    FMultiInsertOn := false;
  end;
end;

procedure TBaseMainForm.ActionExportActionExecute(Sender: TObject);
//var
//  f, e, k: string;
//  fbk: string;
//  okk: boolean;
begin
(*
  SaveDialog.FileName := TSysRec.Name + '_' + FObj + '_' + TDatRec.DtToCode(Now);
  if not SaveDialog.Execute then
    Exit;

  f := SaveDialog.FileName;
  e := ExtractFileExt(f);

  if TFsyRec.FileExists(f, k) then
    if not TAskRec.Yes(TFsyRec.FSY_FILE_ALREADY_EXISTS_REPLACE_IT) then
      Exit;

  if SameText(e, '.xml') then
    ObjectClientDataset.SaveToFile(f, dfXMLUTF8)
  else
    ObjectClientDataset.SaveToFile(f, dfBinary); // .cds
  TMesRec.I('All objects exported to %s', [f]);

procedure TXxxMainForm.XxxTreeBranchExportPopupClick(Sender: TObject);
var
  j: superobject.ISuperobject;
  i, n, f: string; // id, name, filespec
begin
  // zip
  i := XxxClientDataSet.FieldByName('FldId').AsString;
  n := XxxClientDataSet.FieldByName(FFldObj).AsString;
  f := Format('%s\Wks%s_%s_%s.json', [wks.Dir('tmp'), FObj, i, n]);

  // tojson
  Dst.RecordToJson(XxxClientDataSet, j);
  if not Assigned(j) then //begin
    raise Exception.CreateFmt('Unable to parse %s %s %s as json, probably invalid escape', [FObj, i, a]);
  //Exit;
//end;

  // disk
  j.SaveTo(f, true, true);
  LogFmt('%-10s|%s ...', ['EXPORT', f]);
  mes.IFmt('%s %s %s exported to %s', [FObj, i, n, f]);
end;
*)
end;

procedure TBaseMainForm.ActionImportActionExecute(Sender: TObject);
var
  i, z, idn, pid, ck: integer; // cryptokey
  s1, s2: TStream;
  f, e, o, d, x, h, u, p, n, y, l, k: string; // filename, ext, owner, kind, xxx, hook, username, password, note, encrypted
  cds: TClientDataset;
begin

  {$REGION 'File'}
  if not OpenDialog.Execute then
    Exit;

  pid := FId;
  o   := gmbr.Member;
  f   := OpenDialog.FileName;
  e   := ExtractFileExt(f);
  {$ENDREGION}

  {$REGION 'Exit'}
  if not ({(e = '.xls') or (e = '.xlsx') or} (e = '.xml') or (e = '.cds')) then begin
    TMesRec.W('Unable to import file of type %s, valid types are: *.xml, *.cds', [f, e]); // *.xls, *.xlsx,
    Exit;
  end;
  {$ENDREGION}

  try

    {$REGION 'Load'}
    if          (e = '.xls') or (e = '.xlsx') then begin

      {$REGION 'XlsXlsx'}
    // connect to excel file
    //ImportXlsADOConnection.Close;
    //ImportXlsADOConnection.ConnectionString := CsMsExcel('ADO', f);
    //ImportXlsADOConnection.Open;
    ////ImportXlsADOConnection.GetTableNames(IvExcelSheet, true);
    //ImportXlsADOQuery.Active := true;
      {$ENDREGION}

    end else if (e = '.xml') or (e = '.cds') then begin

      {$REGION 'XmlCds'}
      cds := TClientDataset.Create(nil);
      cds.LoadFromFile(f);
      cds.Open;
      {$ENDREGION}

    end;
    if TAskRec.No('Loaded file %s.  Continue to import %d total records ?', [f, cds.RecordCount]) then
      Exit;
    {$ENDREGION}

    {$REGION 'Scan'}
    for i := 0 to cds.RecordCount-1 do begin
      // record
      d := cds.FieldByName('FldKind').AsString     ;
      y := cds.FieldByName('FldEncrypted').AsString;
      x := cds.FieldByName('FldObject').AsString   ;

      // loghead
      l := Format('%.3d) [RvState] %s, %s, %s, %s', [i, x, h, u, p]);

      // alreadyexists and validusernamepassword
      if (u <> '') and (p <> '') {and (XxxExists('FldObject;FldUsername;FldPassword', VarArrayOf([h, u, p]), k))} then begin
        l := TStrRec.StrReplace(l, '[RvState]', 'ALREADYEXIST');

      // doesntexists
      end else begin
        l := TStrRec.StrReplace(l, '[RvState]', 'IMPORTED    ');

        // idnext
        idn := TDbaRec.TblIdNextRio('');

        // appendnewbatimage
        ObjectClientDataSet.AppendRecord([idn, pid, o, d, x, h, u, p, n, y, nil]);

        // edit
        ObjectClientDataSet.Edit;

        // create a read stream channel to the image field
        s1 := cds.CreateBlobStream(cds.FieldByName('FldImage'), bmRead);
        try
          s1.Seek(0, soFromBeginning);
          // create a write stream to the image field of current record of accountcsd
          s2 := ObjectClientDataSet.CreateBlobStream(ObjectClientDataSet.FieldByName('FldImage'), bmWrite);
          // copy from 1st stream to the 2nd one
          try
            s2.Seek(0, soFromBeginning);
            s2.CopyFrom(s1, s1.Size);
          finally
            FreeAndNil(s2);
          end;
        finally
          FreeAndNil(s1);
        end;

        // post
      //ObjectClientDataSet.Post;
        ObjectDBNavigator.BtnClick(nbPost);
        Application.ProcessMessages;
        Inc(z);

        // end
      //if ObjectClientDataSet.ApplyUpdates(0) > 0 then
        //l := str.Replace(l, 'IMPORTED    ', 'UPDATEFAILED');
      end;

      // log
      LogFrame.Log(l);

      // next
      cds.Next;
    end;

    // end
    cds.Close;
    TMesRec.I('Imported %d records', [z]);
    {$ENDREGION}

  except
    on e: Exception do begin
      LogFrame.Log(e);
      TMesRec.W(e.Message);
    end;
  end;

(*
procedure TXxxMainForm.XxxTreeBranchImportPopupClick(Sender: TObject);
var
  i, p, n: integer; // id, pid, idnext
  j: superobject.ISuperobject;
  f, q, k: string; // filespec
  d: TFileOpenDialog;
begin
  mes.NA;
  d := TFileOpenDialog.Create(nil);
  try
    // dialog
    d.Title := FObj + ' Import';
    d.DefaultExtension := '.json';
    d.DefaultFolder := ExtractfileDir(wks.TempDir);

    if d.Execute then begin
      // json
      f := d.FileName;
      j := TSuperObject.ParseFile(f, false);
      LogFmt('%-10s|%s ...', ['IMPORTING', f]);
      Log(j.AsJSon(true, false));

      // idincoming
      i := j.I['FldId'];

      // idincoming-exist --> override-existing and locate-to-it
      if XxxClientDataSet.Locate('FldId', i, []) then begin

      // override-current
    //end else begin

      // insert-new under current as a new-child
      end else begin
        // parentcurrent
        p := XxxClientDataSet.FieldByName('FldId').AsInteger;

        // idnext *** NOOOOOOO ***
        n := x.TblIdNext('DbaXxx.dbo.TblXxx');

        // append
        XxxClientDataSet.AppendRecord( [
         {j.I['FldId']}          n            // Id
        ,{j.I['FldPId']}         p            // PId
        , j.S['FldOrganization'].QuotedString // Organization
        , j.S['FldOwner'       ].QuotedString // Owner
        , j.S['FldXxx'         ].QuotedString // Xxx
        , j.S['FldKind'        ].QuotedString // Kind
        , j.S['FldState'       ].QuotedString // State
        , j.S['FldCreated'     ].QuotedString // Created
        , j.S['FldUpdated'     ].QuotedString // Updated
        , j.S['FldDescription' ].QuotedString // Description
        , j.S['FldContent'     ].QuotedString // Script
        , j.S['FldJson'        ].QuotedString // Json
        , j.S['FldContinuousOn'].QuotedString // ContinuousOn
        , j.S['FldDelayMs'     ].QuotedString // DelayMs
        , j.S['FldOnSuccess'   ].QuotedString // OnSuccess
        , j.S['FldOnFail'      ].QuotedString // OnFail
        , j.S['FldOnEmpty'     ].QuotedString // OnEmpty
        , j.S['FldHistorySave' ].QuotedString // HistorySave
        ] );
        Log(q);
      end;
      LogFmt('%-10s|%s under %d', ['IMPORTED', f, p]);
    end;
  finally
    FreeAndNil(d);
  end
end;
*)
end;

procedure TBaseMainForm.ActionPersistedOpenActionExecute(Sender: TObject);
begin
  ObjectContentPersistOpen;
end;

procedure TBaseMainForm.ActionMarkdownActionExecute(Sender: TObject);
begin
  ObjectContentSplitView.Opened := ActionMarkdownAction.Checked; // now ObjectContentSplitView will open only if this action is checked (button down)
  if ObjectContentSplitView.Opened then
    ObjectContentSplitterUpdate;
end;
  {$ENDREGION}

  {$REGION 'Text'}
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

procedure TBaseMainForm.TextFoldingActionExecute(Sender: TObject);
begin
  // exit
  if gsyn.Focused = nil then begin
    TMesRec.W('Edit control not focused! Please click inside the edit control to make it focused');
    Exit;
  end;

  // gui
  gsyn.Focused.UseCodeFolding := TextFoldingToolButton.Down;
  TextFoldToolButton.Enabled := gsyn.Focused.UseCodeFolding;

  // syneditsetupandstate
  if gsyn.Focused.UseCodeFolding then begin
    ObjectSynEditsSetup;
//    ObjectSynEditStateRestoreFromDb;
  end;
end;

procedure TBaseMainForm.TextFoldActionExecute(Sender: TObject);
begin
  if gsyn.Focused = nil then begin
    TMesRec.W('Edit control not focused! Please click inside the edit control to make it focused');
    Exit;
  end;

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

procedure TBaseMainForm.TextCommentActionExecute(Sender: TObject);
var
//cok: TCodKindEnum;
  key: word;
  sst: TShiftState;
begin
  // edit
  if not (ObjectClientDataSet.State in [dsEdit]) then
    ObjectClientDataSet.Edit;

  // stdshorcuts (simulate ctrl+/)
//cok := TCodRec.CodeKindEnumFromInt(gsyn.Focused.Tag);
  key := vkSlash;
  sst := [ssCtrl];
  gsyn.SynEditOnKeyUp(gsyn.Focused{, cok}, key, sst);
end;

procedure TBaseMainForm.TextGutterActionExecute(Sender: TObject);
begin
  if gsyn.Focused = nil then begin
    TMesRec.W('Edit control not focused! Please click inside the edit control to make it focused');
    Exit;
  end;
  gsyn.Focused.Gutter.Visible := TextGutterAction.Checked;
  if gsyn.Focused = ObjectContentDBSynEdit then
    ObjectDescriptionDBSynEdit.Gutter.Visible := TextGutterAction.Checked;
  if gsyn.Focused.Gutter.Visible then
    ObjectDBEdit.Margins.Left := 35
  else
    ObjectDBEdit.Margins.Left := 3;
end;

procedure TBaseMainForm.TextNumbersActionExecute(Sender: TObject);
begin
  gsyn.Focused.Gutter.ShowLineNumbers := TextLineNumbersAction.Checked;
end;

procedure TBaseMainForm.TextZeroStartActionExecute(Sender: TObject);
begin
  gsyn.Focused.Gutter.ZeroStart := TextZeroStartAction.Checked;
end;

procedure TBaseMainForm.TextTabToSpacesActionExecute(Sender: TObject);
var
  spz: integer;      // spacesnum
  spn: string;       // spaces
//buc: TBufferCoord; // cache
begin
  spz := TVntRec.VntToInt(OptionTabWidthJvSpinEdit.Value, 2);
  TAskRec.Int('Tab to spaces', 'How many spaces for a tab ?', spz, spz);
  spn := TStrRec.StrReplicate(' ', spz);
  with gsyn.Focused do begin
  //buc := CaretXY;
    ObjectClientDataSet.Edit;
    Text := StringReplace(Text, #9, spn, [rfReplaceAll]);
  //ObjectClientDataSet.Post;
    ObjectDBNavigator.BtnClick(nbPost);
  //CaretXY := buc; // unneded afterpost event will do the same
  end;
end;

procedure TBaseMainForm.TextCompareActionExecute(Sender: TObject);
begin
  WksTextDiffFormUnit.TTextDiffForm.Execute(gsyn.Focused.Lines);
end;

procedure TBaseMainForm.TextLinePrefixActionExecute(Sender: TObject);
var
//buc: TBufferCoord;
  stl: TStringList;
  i: integer;
//s: string;
begin
  if not TAskRec.Str('Line Begin With', 'Input a string all lines will begin with', FTextUtilsLineBeginWith, FTextUtilsLineBeginWith) then
    Exit;
  with gsyn.Focused do begin
  //buc := CaretXY;
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
  //CaretXY := buc; // unneded afterpost event will do the same
  end;
end;

procedure TBaseMainForm.TextLineNumbersActionExecute(Sender: TObject);
var
  //buc: TBufferCoord;
  stl: TStringList;
  i: integer;
  str: string;
begin
  str := '';
  if not TAskRec.Str('Line Numbers', 'Input optional char(s) after each number', ') ', str) then
    Exit;
  with gsyn.Focused do begin
  //buc := CaretXY;
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
  //CaretXY := buc; // unneded afterpost event will do the same
  end;
end;

procedure TBaseMainForm.TextSortAscActionExecute(Sender: TObject);
var
//buc: TBufferCoord;
  stl: TStringList;
begin
  if gsyn.Focused = nil then begin
    TMesRec.W('Edit control not focused! Please click inside the edit control to make it focused');
    Exit;
  end;
  if gsyn.Focused.SelText.IsEmpty then begin
    TMesRec.W('Please select some lines of text');
    Exit;
  end;

  with gsyn.Focused do begin
  //buc := CaretXY;
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
  //CaretXY := buc; // unneded afterpost event will do the same
  end;
end;

procedure TBaseMainForm.TextSortDescActionExecute(Sender: TObject);
var
//buc: TBufferCoord;
  stl: TStringList;
begin
  if gsyn.Focused = nil then begin
    TMesRec.W('Edit control not focused! Please click inside the edit control to make it focused');
    Exit;
  end;
  if gsyn.Focused.SelText.IsEmpty then begin
    TMesRec.W('Please select some lines of text');
    Exit;
  end;

  with gsyn.Focused do begin
  //buc := CaretXY;
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
  //CaretXY := buc; // unneded afterpost event will do the same
  end;
end;

procedure TBaseMainForm.TextStatsActionExecute(Sender: TObject);
begin
  WksTextStatsFormUnit.TTextStatsForm.Execute(gsyn.Focused.Lines);
end;

procedure TBaseMainForm.TextTrimRightActionExecute(Sender: TObject);
var
  i, zro, zto, le0, le1: integer;
//syn: TSynEdit;
begin
  if gsyn.Focused = nil then begin
    TMesRec.W('Edit control not focused! Please click inside the edit control to make it focused');
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  try
    with gsyn.Focused do begin
      zto := 0;
      for i := 0 to Lines.Count - 1 do begin
        le0 := Lines[i].Length;
        Lines[i] := Lines[i].TrimRight;
        le1 := Lines[i].Length;
        zro := le0 - le1;
        zto := zto + zro;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;

  TMesRec.I('Total %d white chars has been removed from end of lines', [zto])
end;
  {$ENDREGION}

  {$REGION 'Search'}
procedure TBaseMainForm.SearchActionExecute(Sender: TObject);
begin
  gsyn.SearchReplaceFormShow(gsyn.Focused, gsyg, false);
end;

procedure TBaseMainForm.SearchPrevActionExecute(Sender: TObject);
begin
  gsyg.Backwards := true;
  gsyn.SearchReplaceDo(gsyn.Focused, gsyg, false);
end;

procedure TBaseMainForm.SearchNextActionExecute(Sender: TObject);
begin
  gsyg.Backwards := false;
  gsyn.SearchReplaceDo(gsyn.Focused, gsyg, false);
end;

procedure TBaseMainForm.SearchReplaceActionExecute(Sender: TObject);
begin
  gsyn.SearchReplaceFormShow(gsyn.Focused, gsyg, true);
end;

procedure TBaseMainForm.SearchReplaceSwapLabel2Click(Sender: TObject);
var
  buf: string;
begin
  buf := SearchReplaceOutEdit.Text;
  SearchReplaceOutEdit.Text := SearchReplaceInEdit.Text;
  SearchReplaceInEdit.Text  := buf;
end;

procedure TBaseMainForm.SearchReplaceInEditKeyPress(Sender: TObject; var Key: Char);
begin
  if string(SearchReplaceInEdit.Text).IsEmpty then
    TMesRec.W('Replacing something wit an empty string will not be recoverable doing a swap.');
end;

procedure TBaseMainForm.SearchReplaceAllButtonClick(Sender: TObject);
var
  cpz, coz, jsz, noz: integer; // counters
  cps, cos, das, nos: string;  // strorig
  ous, ins: string;
  who, noc: boolean;           // wholestr, nocasesens
  fla: TReplaceFlags;
begin
  if TAskRec.No('All occurrences of "%s" will be replaced with "%s", the action migth be not reversible swapping and replacing again.   Continue?', [SearchReplaceOutEdit.Text, SearchReplaceInEdit.Text]) then
    Exit;

  Screen.Cursor := crHourGlass;
  try
    // inputs
    ous := SearchReplaceOutEdit.Text;
    ins := SearchReplaceInEdit.Text;
    who := SearchReplaceWholeCheckBox.Checked;
    noc := not SearchReplaceMatchCaseICheckBox.Checked;

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
  {$ENDREGION}

  {$REGION 'Utils'}
procedure TBaseMainForm.UtilsPythonExecActionExecute(Sender: TObject);
var
  cod: string;
  wat: TStopwatch;
begin
  // exit
  if OptionPythonVersionComboBox.Items.Count = 0 then begin
    TMesRec.I('Python is not present, unable to execute the code fragment;');
    Exit;
  end;

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
  LogFrame.LogOne(NOT_IMPLEMENTED_STR, fmWarning);
end;
  {$ENDREGION}

  {$REGION 'Object'}
procedure TBaseMainForm.ObjectIdDBTextDblClick(Sender: TObject);
begin
  Clipboard.AsText := ObjectClientDataSet.FieldByName('FldId').AsString;
  LogFrame.LogOne('Object id %s copied', [Clipboard.AsText], fmSuccess);
end;

procedure TBaseMainForm.ObjectImage2DBImageDblClick(Sender: TObject);
begin
  Clipboard.Assign(ObjectImageDBImage.Picture);
  LogFrame.LogOne('Image copied', fmSuccess);
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

procedure TBaseMainForm.ObjectDTClientTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean; var ImageIndex: TImageIndex);
begin
  TVstRec.OnGetImageIndex(Sender, Node, Kind, Column, Ghosted, ImageIndex);
end;

procedure TBaseMainForm.ObjectDTClientTreeClick(Sender: TObject);
begin
  // treepecific
  FIdGui := FId; // chache
  TVstRec.NodeInfo(ObjectDTClientTree, ObjectDTClientTree.FocusedNode, FNodePath, FNodeCaption, FNodeKey, FNodeLevel, FNodeChildsCount);
end;

procedure TBaseMainForm.ObjectDTClientTreeNodeClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);
begin
  // nodespecific
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Center'}

  {$REGION 'Previous'}
procedure TBaseMainForm.ObjectContentPrevDBSynEditChange(Sender: TObject);
begin
  // info
  ObjectContentPrevInfoUpdate;

  // notempty
  if ObjectContentPrevDBSynEdit.Text.IsEmpty then
    ObjectContentPrevTabSheet.Caption := TStrRec.StrCapitalize(ObjectContentPrevTabSheet.Caption)
  else
    ObjectContentPrevTabSheet.Caption := UpperCase(ObjectContentPrevTabSheet.Caption);
end;

procedure TBaseMainForm.ObjectContentPrevDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState); // *** not useful, read only ***
begin
  // modified
//  if not TStrRec.StrEndsWith(ObjectContentPrevTabSheet.Caption, ' ' + CHAR_CONTENT_CHANGED) then
//    ObjectContentPrevTabSheet.Caption := ObjectContentPrevTabSheet.Caption + ' ' + CHAR_CONTENT_CHANGED;

  // stdshorcuts
//  gsyn.KeyUp(Sender as TDBSynEdit, TCodRec.CodeKindEnumFromInt((Sender as TDBSynEdit).Tag), Key, Shift);
end;

procedure TBaseMainForm.ObjectContentPrevDBSynEditMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // info
  ObjectContentPrevInfoUpdate;
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
procedure TBaseMainForm.ObjectDBEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then begin
    Key := #0; // prevent beeping
    ActionPostActionExecute(nil);
  end;
end;

procedure TBaseMainForm.ObjectContentDBSynEditChange(Sender: TObject);
begin
  // info
  ObjectContentInfoUpdate;

  // notempty
  if ObjectContentDBSynEdit.Text.IsEmpty then
    ObjectContentTabSheet.Caption := TStrRec.StrCapitalize(ObjectContentTabSheet.Caption)
  else
    ObjectContentTabSheet.Caption := UpperCase(ObjectContentTabSheet.Caption);
end;

procedure TBaseMainForm.ObjectContentDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // stdshorcuts
  gsyn.SynEditOnKeyUp(Sender, Key, Shift);

  // nochangekey
  if TKbdRec.KeyIsANoChange(Key, Shift) then
    Exit;

  // edit
//  if not (ObjectClientDataSet.State in [dsEdit]) then
//    ObjectClientDataSet.Edit;

  // modified
  if not TStrRec.StrEndsWith(ObjectContentTabSheet.Caption, ' ' + CHAR_CONTENT_CHANGED) then
    ObjectContentTabSheet.Caption := ObjectContentTabSheet.Caption + ' ' + CHAR_CONTENT_CHANGED;

  // realtypingpausedetector (reset and restart the timer only if a key-press changes the text)
  if not ActionMarkdownAction.Checked then
    Exit;
  if not ObjectContentSplitView.Opened then
    Exit;
  ObjectContentSynEditTimer.Enabled := false;
  ObjectContentSynEditTimer.Enabled := true;
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
//  if str = '[scCaretX,scCaretY, scSelection]' then
//    if not (ObjectClientDataSet.State in [dsEdit]) then begin
//      ObjectClientDataSet.Edit;
end;

procedure TBaseMainForm.ObjectContentDBSynEditDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: boolean);
begin
//  LogFrame.Log('Dragging...');
//  if not (ObjectClientDataSet.State in [dsEdit]) then begin
//    ObjectClientDataSet.Edit;
//    LogFrame.Log('Editing...');
//  end;
end;

procedure TBaseMainForm.ObjectContentDBSynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  if ( not (ObjectClientDataSet.State in [dsEdit]) ) and (ObjectContentDBSynEdit.SelLength > 0) and (Button = mbLeft) then begin
//  FSynEditIsDragging := true;
//  FSynEditDragStartPos := Point(X, Y);
//  LogFrame.Log('Start dragging...');
//    ObjectClientDataSet.Edit;
//  LogFrame.Log('Editing...');
//  end;
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

procedure TBaseMainForm.ObjectContentDBSynEditMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // info
  ObjectContentInfoUpdate;
end;

procedure TBaseMainForm.ObjectDescriptionShowSpeedButtonClick(Sender: TObject);
begin
  ObjectContentTopPanel2.Visible     := ObjectDescriptionShowSpeedButton.Down;
  ObjectDescriptionSplitter.Visible  := ObjectDescriptionShowSpeedButton.Down;
  if ObjectDescriptionShowSpeedButton.Down then begin
    ObjectDescriptionShowSpeedButton.Caption := '-';
    ObjectDescriptionSplitter.Top := ObjectContentTopPanel2.Height;
  end else
    ObjectDescriptionShowSpeedButton.Caption := '+';
end;
  {$ENDREGION}

  {$REGION 'Content Popup'}
procedure TBaseMainForm.ObjectContentSynEditTimerTimer(Sender: TObject);
begin
  // user has paused typing more then this timer interval, so trigger the desired edge browser update
  ObjectContentSynEditTimer.Enabled := false;
  ObjectContentEdgeBrowserUpdate;
end;

procedure TBaseMainForm.SynEditContentHeaderInsertActionExecute(Sender: TObject);
begin
  gsyn.InsertHeader(gsyn.Focused);
end;

procedure TBaseMainForm.SynEditContentRegionInsertActionExecute(Sender: TObject);
begin
  gsyn.InsertRegion(gsyn.Focused);
end;

procedure TBaseMainForm.SynEditContentRegionCollapseActionExecute(Sender: TObject);
begin
  gsyn.RegionCollapse(ObjectContentDBSynEdit);
end;

procedure TBaseMainForm.SynEditContentRegionExpandActionExecute(Sender: TObject);
begin
  gsyn.RegionExpand(ObjectContentDBSynEdit);
end;

procedure TBaseMainForm.SynEditContentTemplateInsertPopupClick(Sender: TObject);
begin
  gsyn.InsertContentTemplate(ObjectContentDBSynEdit);
end;
  {$ENDREGION}

  {$REGION 'Data'}
procedure TBaseMainForm.ObjectDataDBSynEditChange(Sender: TObject);
begin
  // info
  ObjectDataInfoUpdate;

  // notempty
  if ObjectDataDBSynEdit.Text.IsEmpty then
    ObjectDataTabSheet.Caption := ' ' + TStrRec.StrCapitalize(ObjectDataTabSheet.Caption)
  else
    ObjectDataTabSheet.Caption := UpperCase(ObjectDataTabSheet.Caption);
end;

procedure TBaseMainForm.ObjectDataDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // edit
//  if not (ObjectClientDataSet.State in [dsEdit]) then
//    ObjectClientDataSet.Edit;

  // modified
  if not TStrRec.StrEndsWith(ObjectDataTabSheet.Caption, ' ' + CHAR_CONTENT_CHANGED) then
    ObjectDataTabSheet.Caption := ObjectDataTabSheet.Caption + ' ' + CHAR_CONTENT_CHANGED;

  // stdshorcuts
  gsyn.SynEditOnKeyUp(Sender{, ckJson}, Key, Shift);
end;

procedure TBaseMainForm.ObjectDataDBSynEditMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // info
  ObjectDataInfoUpdate;
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
  // notempty
  if ObjectNoteDBSynEdit.Text.IsEmpty then
    ObjectNoteTabSheet.Caption := TStrRec.StrCapitalize(ObjectNoteTabSheet.Caption)
  else
    ObjectNoteTabSheet.Caption := UpperCase(ObjectNoteTabSheet.Caption);
end;

procedure TBaseMainForm.ObjectNoteDBSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // info
  ObjectNoteInfoUpdate;

  // edit
//  if not (ObjectClientDataSet.State in [dsEdit]) then
//    ObjectClientDataSet.Edit;

  // modified
  if not TStrRec.StrEndsWith(ObjectNoteTabSheet.Caption, ' ' + CHAR_CONTENT_CHANGED) then
    ObjectNoteTabSheet.Caption := ObjectNoteTabSheet.Caption + ' ' + CHAR_CONTENT_CHANGED;

  // stdshorcuts
  gsyn.SynEditOnKeyUp(Sender{, ckTxt}, Key, Shift);
end;

procedure TBaseMainForm.ObjectNoteDBSynEditMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // info
  ObjectNoteInfoUpdate;
end;
{$ENDREGION}

  {$REGION 'Edge'}
procedure TBaseMainForm.ObjectContentEdgeBrowserCreateWebViewCompleted( Sender: TCustomEdgeBrowser; AResult: HRESULT);
begin
  if Succeeded(AResult) then
    Sender.AddWebResourceRequestedFilter('*', COREWEBVIEW2_WEB_RESOURCE_CONTEXT_IMAGE)

  else if AResult = HResultFromWin32(ERROR_FILE_NOT_FOUND) then
    LogFrame.LogOne('No Edge installation been detected', fmWarning)

  else if AResult = E_FAIL then
    LogFrame.LogOne('Failed to initialise Edge loader', fmWarning)

  else try
    OleCheck(AResult)

  except
    on e: Exception do
      LogFrame.LogOne('Failed to initialise Edge: %s', [e.Message], fmWarning);
  end;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Right'}

  {$REGION 'Property'}

    {$REGION 'JobGrade'}
procedure TBaseMainForm.ObjectJobGradeCalculateLabelClick(Sender: TObject);
var
  rol, lev, fbk: string;
  jgm: integer; // ToJobGradeMin
  okk: boolean;
begin
  jgm := ObjectClientDataSet.FieldByName('FldToJobGradeMin').AsInteger;
  okk := TMemberRoleLevelGradeForm.Execute(rol, lev, jgm, fbk);
  if okk then begin
    ObjectClientDataSet.Edit;
    ObjectClientDataSet.FieldByName('FldToJobGradeMin').Value := jgm;
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
begin
  // contentkindidx
  idx := ObjectContentKindDBComboBox.ItemIndex - 1;
  ObjectContentDBSynEdit.Tag := idx;

  // synsetupandstate
  ObjectSynEditsSetup;
//ObjectSynEditStateRestoreFromDb;

  // edge
  if ActionMarkdownAction.Checked then begin
    ObjectContentSplitter.Visible := TCodKindEnum(ObjectContentDBSynEdit.Tag) = ckMd;
    ObjectContentSplitView.Opened := ObjectContentSplitter.Visible;
  end;
end;

procedure TBaseMainForm.ObjectDataKindDBComboBoxChange(Sender: TObject);
var
  idx: integer;
begin
  // datakindidx
  idx := ObjectDataKindDBComboBox.ItemIndex - 1;
  ObjectDataDBSynEdit.Tag := idx;
end;
    {$ENDREGION}

    {$REGION 'Colors'}
procedure TBaseMainForm.ObjectBgColorLabelClick(Sender: TObject);
var
  col, fbk: string;
  lab: TLabel;
  edi: TDBEdit;
begin
  inherited;

  // init
  lab := Sender as TLabel;
  if      lab.Tag = 0 then edi := ObjectBgColorDBEdit
  else if lab.Tag = 1 then edi := ObjectFgColorDBEdit;

  // color
  col := edi.Text;
  if col.Trim.IsEmpty then
    col := 'FFFFFF';

  // formandset
  if not TColorDialogForm.Execute(col, fbk) then
    LogFrame.Log(fbk, clWebOrange)
  else begin
    ObjectClientDataSet.Edit;
    edi.Text := col;
    ObjectClientDataSet.Post;
    LogFrame.Log(fbk)
  end;
end;

procedure TBaseMainForm.ObjectBgColorDBEditChange(Sender: TObject);
var
  col: TColor;
begin
  inherited;

  col := TColRec.FromHexStr((Sender as TDBEdit).Text);
  (Sender as TDBEdit).Color      := col;
  (Sender as TDBEdit).Font.Color := TColRec.TColAntiBw(col);
end;
    {$ENDREGION}

  {$ENDREGION}

  {$REGION 'Search'}
procedure TBaseMainForm.SearchButtonedEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SearchButtonedEditLeftButtonClick(Sender);
end;

procedure TBaseMainForm.SearchButtonedEditLeftButtonClick(Sender: TObject);
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
  SearchReplaceOutEdit.Text := SearchButtonedEdit.Text;
end;

procedure TBaseMainForm.SearchButtonedEditRightButtonClick(Sender: TObject);
begin
  SearchButtonedEdit.Clear;
  SearchResultListBox.Clear;
  SearchButtonedEdit.SetFocus;
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

procedure TBaseMainForm.ReplaceButtonedEditRightButtonClick(Sender: TObject);
begin
  ReplaceButtonedEdit.Clear;
  SearchResultListBox.Clear;
  SearchButtonedEdit.SetFocus;
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

procedure TBaseMainForm.OptionTextBoxInfoShowCheckBoxClick(Sender: TObject);
begin
  ObjectContentPrevCharCountLabel.Visible := OptionTextBoxInfoShowCheckBox.Checked;
  ObjectContentCharCountLabel.Visible     := OptionTextBoxInfoShowCheckBox.Checked;
  ObjectDataCharCountLabel.Visible        := OptionTextBoxInfoShowCheckBox.Checked;
  ObjectNoteCharCountLabel.Visible        := OptionTextBoxInfoShowCheckBox.Checked;
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

procedure TBaseMainForm.OptionTextRightEdgeComboBoxChange(Sender: TObject);
var
  col: integer;
begin
  col := StrToInt(OptionTextRightEdgeComboBox.Text);
  ObjectContentPrevDBSynEdit.RightEdge := col;
  ObjectContentDBSynEdit.RightEdge     := col;
  ObjectDataDBSynEdit.RightEdge        := col;
  ObjectNoteDBSynEdit.RightEdge        := col;
end;
    {$ENDREGION}

    {$REGION 'Show'}
procedure TBaseMainForm.OptionFoldingLineShowCheckBoxClick(Sender: TObject);
begin
  // exit
  if not ObjectClientDataSet.Active then
    Exit;

  // syneditsetupandstate
  ObjectSynEditsSetup;
//  ObjectSynEditStateRestoreFromDb;
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
  okk := TPythonRec.PythonComponentsInit(Self, FPythonEngine, FPythonGUIInputOutput, TCustomMemo(LogFrame.OutputRichEdit), OptionPythonVersionComboBox.ItemIndex, fbk);
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
procedure TBaseMainForm.ObjectClientDataSetAfterOpen(DataSet: TDataSet);
begin
  ;
end;

procedure TBaseMainForm.ObjectClientDataSetBeforeCancel(DataSet: TDataSet);
begin
  ;
end;

procedure TBaseMainForm.ObjectClientDataSetAfterCancel(DataSet: TDataSet);
begin
  // tabs
  ObjectTabsUpdate;
end;

procedure TBaseMainForm.ObjectClientDataSetBeforeRefresh(DataSet: TDataSet);
begin
  // freeze
//ObjectSynEditsFreeze
end;

procedure TBaseMainForm.ObjectClientDataSetAfterRefresh(DataSet: TDataSet);
begin

  {$REGION 'object'}
  // unfreeze
//ObjectSynEditsUnfreeze;

  // tabs
  ObjectTabsUpdate;

  // syneditsetupandstate
  ObjectSynEditsSetup;
//  ObjectSynEditStateRestoreFromDb;

  // notworking
//ObjectDTClientTree.Invalidate;
  {$ENDREGION}

end;

procedure TBaseMainForm.ObjectClientDataSetBeforeScroll(DataSet: TDataSet);
begin
  // tabs
//ObjectTabsUpdate;

  // freeze
  ObjectSynEditsFreeze;
end;

procedure TBaseMainForm.ObjectClientDataSetAfterScroll(DataSet: TDataSet);
var
  eon: boolean; // edgeopened
begin
  // speedups
  if FInSearchAndReplace or FMultiInsertOn then
    Exit;

  {$REGION 'object'}
  // currentremember
  FId               := DataSet.FieldByName('FldId'              ).AsInteger;
  FPId              := DataSet.FieldByName('FldPId'             ).AsInteger;
  FObjectKind       := DataSet.FieldByName('FldObjectKind'      ).AsString;
  FContentKind      := DataSet.FieldByName('FldContentKind'     ).AsString;
//FAuthor           := DataSet.FieldByName('FldAuthor'          ).AsString;  // ex FldOwner, FldFromMember
  FObject           := DataSet.FieldByName('FldObject'          ).AsString;

  // info
  try
  ObjectNodeInfoLabel.Caption := Format('total %d  childs %d', [DataSet.RecordCount, ObjectDTClientTree.FocusedNode.ChildCount]);
  except
  end;
  ObjectIdDBText.Hint         := Format('Parent id: %d', [FPId]);

  // unfreeze
  ObjectSynEditsUnfreeze;

  // tabs
  ObjectTabsUpdate;

  // kind
  ObjectContentKindDBComboBoxChange(nil);

  // syneditsetupandstate
//ObjectSynEditsSetup;             *** unnecessary, already done in prev line ***
//ObjectSynEditFoldRestoreFromDb;  *** unnecessary, already done in prev line ***

  // contentjsonnote focus and charcount
           if MainPageControl.ActivePage = ObjectContentPrevTabSheet then begin
    ObjectContentPrevInfoUpdate;
  //ObjectContentPrevDBSynEdit.SetFocus;
  end else if MainPageControl.ActivePage = ObjectContentTabSheet then begin
    ObjectContentInfoUpdate;
  //ObjectContentDBSynEdit.SetFocus;
  end else if MainPageControl.ActivePage = ObjectDataTabSheet then begin
    ObjectDataInfoUpdate;
  //ObjectDataDBSynEdit.SetFocus;
  end else if MainPageControl.ActivePage = ObjectNoteTabSheet then begin
    ObjectNoteInfoUpdate;
  //ObjectNoteDBSynEdit.SetFocus;
  end;

  // edge
  if ActionMarkdownAction.Checked then begin
    eon := 'Html,Md'.Contains(DataSet.FieldByName('FldContentKind').AsString);
    ObjectContentSplitter.Visible := eon;
    ObjectContentSplitView.Opened := eon;
    if eon then begin
      // geom
      ObjectContentSplitterUpdate;

      // edge
      ObjectContentEdgeBrowserUpdate;
    end;
  end;

  // ids
//ObjectIdDBEdit.DataSource.DataSet.FieldByName(ObjectIdDBEdit.DataField).Alignment       := taLeftJustify;
//ObjectPIdDBEdit.DataSource.DataSet.FieldByName(ObjectPIdDBEdit.DataField).Alignment     := taLeftJustify;
//ObjectOrderDBEdit.DataSource.DataSet.FieldByName(ObjectOrderDBEdit.DataField).Alignment := taLeftJustify;
//XxxIdDBEdit.DataSource.DataSet.FieldByName(XxxIdDBEdit.DataField).Alignment             := taLeftJustify;

  // contentsjsonnotecharcount
//ObjectContentPrevInfoUpdate;
//ObjectContentInfoUpdate;
//ObjectDataInfoUpdate;
//ObjectNoteInfoUpdate;
  {$ENDREGION}

  {$REGION 'files'}
  if MainPageControl.ActivePage = FilesRioTabSheet then
    FilesRioRefreshAction.Execute;
  {$ENDREGION}

end;

procedure TBaseMainForm.ObjectClientDataSetBeforePost(DataSet: TDataSet);
begin
  // speedups
  if FInSearchAndReplace or FMultiInsertOn then
    Exit;

  {$REGION 'object'}
  // syneditstate
//  ObjectSynEditStateStoreToDb;

  // lastupdated
  DataSet.FieldByName('FldUpdated').Value := Now;
  DataSet.FieldByName('FldUpdatedBy').Value := gmbr.Member;

  // rev
  DataSet.FieldByName('FldRev').Value := StrToIntDef(DataSet.FieldByName('FldRev').AsString, 0) + 1;

  // persist
  if ObjectPersinstentDBCheckBox.Checked then begin
    // content
    ObjectContentPersist();
    if OptionVerboseCheckBox.Checked then
      LogFrame.Log('%s Content saved to local disk', [FObj]);

    // data
  //ObjectDataPersist();
  //if VerboseOptionCheckBox.Checked then
    //LogFmt('%s Data saved to local disk', [FObj]);

    // note
  //ObjectNotePersist();
  //if VerboseOptionCheckBox.Checked then
    //LogFmt('%s Note saved to local disk', [FObj]);
  end;

  // freeze
  ObjectSynEditsFreeze;
  {$ENDREGION}

end;

procedure TBaseMainForm.ObjectClientDataSetAfterPost(DataSet: TDataSet);
var
  vnp: PVirtualNode;
begin
  // speedups
  if FInSearchAndReplace or FMultiInsertOn then
    Exit;

  {$REGION 'object'}
  // applyupdatetoremoteserver
  if ObjectClientDataSet.ApplyUpdates(0) > 0 then begin
    TMesRec.I('Unable to save %s object data to remote server', [FObj]);

    // unfreeze
    ObjectSynEditsUnfreeze;

  end else begin
    if OptionVerboseCheckBox.Checked then
      LogFrame.Log('%s object data saved to remote server', [FObj]);

    // unfreeze
    ObjectSynEditsUnfreeze;

    // IMPORTANT geteventualremotechanges?
    //DataSet.Refresh;

    // tabs
    ObjectTabsUpdate;

    // nodemetadataset
    vnp := ObjectDTClientTree.FocusedNode;
    if Assigned(vnp) then begin
      TVstRec.NodeParamSet(ObjectDTClientTree, vnp, FObj, DataSet);
      ObjectDTClientTree.InvalidateChildren(vnp.Parent, true);
    end;

    // syneditsetupandstate
//    ObjectSynEditsSetup;
//    ObjectSynEditStateRestoreFromDb;
  end;
  {$ENDREGION}

  // log
  LogFrame.LogOne('posted', fmInfo, 2000);
end;

procedure TBaseMainForm.ObjectClientDataSetBeforeInsert(DataSet: TDataSet);
begin
  // speedups
  if FInSearchAndReplace or FMultiInsertOn then
    Exit;

  {$REGION 'object'}
  // freeze
  ObjectDTClientTree.DataSource := nil; // 1-IMPORTANT
  {$ENDREGION}

end;

procedure TBaseMainForm.ObjectClientDataSetAfterInsert(DataSet: TDataSet);
var
  idn: integer;         // rioidnext
  def, fbk: string;     // default
  pmv: array of string; // prompts
  vav: array of string; // values
begin
  // speedups
  if FInSearchAndReplace or FMultiInsertOn then
    Exit;

  {$REGION 'object'}
  // askvectors
  SetLength(pmv, 5);
  SetLength(vav, Length(pmv));

  // objectdefault
  def := TNamRec.RndInt(FObj);
  pmv[0] := 'Object Kind'            ; vav[0] := FObj;
  pmv[1] := 'Content Kind'           ; vav[1] := ObjectContentKind(FContentKind);
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
    if not InputQuery('New data for ' + FObj, pmv, vav) then begin
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

      // setup standard
      TObjRec.ObjDstRecordSetup(
        DataSet
      , idn              // id
      , FId              // pid
      , vav[0]           // objectkind
      , vav[1]           // contentkind
      , vav[2]           // object
      , giif.NxN(vav[3]) // title
      , giif.NxN(vav[4]) // subtitle
      , null             // description
      , null             // order
      );

    //DataSet.Post;
      ObjectDBNavigator.BtnClick(nbPost);
      //IdNextReleaseRio;
      LogFrame.Log('Object data for %s initialized', [FObj]);

      // locate
      //DataSet.Locate('FldId', idn, []); // ObjectNodeLocateAndExpand(i); // error! but not needed
    except
      on e: Exception do begin
        // cancel
        DataSet.Delete; // *** WARNING: start onbeforecancel ***

        // locate
        DataSet.Locate('FldId', FIdGui, []);

        TMesRec.W(e.Message);
        LogFrame.Log('For help please contact ' + TSysRec.PHONE, false);
        LogFrame.LogShow;
      end;
    end;
  finally
    // unfreeze
    ObjectDTClientTree.DataSource := ObjectDataSource; // 2-IMPORTANT
  end;
  {$ENDREGION}

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

  // in case of delete it in not possible to do an auto ObjectClientDataSet.ApplyUpdates(0)
  // becouse there is not an AfterDelete event so a message to the user is necessary
  //ShowMessage('After deleting one or more records, please Apply Update to the remote server !');

  // *** continue in descendent form  DELETING ALL XXX CHILDS ***
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

end;

procedure TBaseMainForm.ObjectClientDataSetReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin

  {$REGION 'reconcileerror'}
  Action := HandleReconcileError(DataSet, UpdateKind, E);
  {$ENDREGION}

end;
{$ENDREGION}

{$REGION 'Files'}

  {$REGION 'options'}
procedure TBaseMainForm.OptionFileWorkingFolderSelectButtonedEditRightButtonClick(Sender: TObject);
var
  dir, fbk: string;
begin
  if TFsyRec.DirChose('C:\', FILE_WORKING_FOLDER_DEFAULT, dir, fbk) then
    OptionFileWorkingFolderSelectButtonedEdit.Text := dir;
end;

procedure TBaseMainForm.OptionFileWorkingFolderClearLabelClick(Sender: TObject);
var
  dir, fbk: string;
begin
  dir := OptionFileWorkingFolderSelectButtonedEdit.Text;

  if not TFsyRec.DirExists(dir, fbk) then begin
    TMesRec.I('Unable to delete the working folder %s, it does not exists', [dir]);
    Exit;
  end;

  if TAskRec.No('Delete the working folder %s with all contained files ?', [dir]) then
    Exit;

  if not TFsyRec.DirDelete(dir, fbk, true) then
    TMesRec.I(fbk)
  else
    LogFrame.Log(fbk, clGreen);
end;
  {$ENDREGION}

  {$REGION 'routines'}
function  TBaseMainForm.FilesRioFileLocalSpec(IvFilePathOriginal, IvFilename: string; IvFilenameReadOnly: boolean): string;
var
  pha, nam, fbk: string;
begin
  // originalpathcheck
//if not TFsyRec.DirExists(IvFilePathOriginal, fbk) then begin
//  TMesRec.W('Original file path does not exist, create it');
//  TFsyRec.DirForce(IvFilePathOriginal, fbk);
//end;

  // workingfoldercheck
//if not TFsyRec.DirExists(OptionFileWorkingFolderSelectButtonedEdit.Text, fbk) then begin
//  TMesRec.W('Path is empty, use default C:\$\Filer, please check the local "Working Folder" or the remote file "Path" property');
//  TFsyRec.DirForce(OptionFileWorkingFolderSelectButtonedEdit.Text, fbk);
//end;

  // path
  pha := ifthen(OptionFileWorkingFolderUseCheckBox.Checked, OptionFileWorkingFolderSelectButtonedEdit.Text, IvFilePathOriginal);
  if not giis.Ex(pha) then begin
    TMesRec.W('Local path is empty, please check the local "Working Folder" or the remote file "Path" property');
    pha := 'C:\$\Filer';
  end;

  // pathforce
  if not TFsyRec.DirExists(pha, fbk) then begin
    TMesRec.W('Path %s does not exist, create it', [pha]);
    TFsyRec.DirForce(pha, fbk);
  end;

  // filename+readonly
  nam := IvFilename;
  if IvFilenameReadOnly then
    nam := TPatRec.NameChange(nam, TPatRec.Name(nam) + '_readonly');

  // filespec
  Result := IncludeTrailingPathDelimiter(pha) + nam;
end;

procedure TBaseMainForm.FilesRioFileLocalDelete(IvLocalFileSpec: string; var IvFbk: string);

  procedure FileDeleteMacro;
  var
    boo: boolean;
  begin
    // delete
    boo := TFsyRec.FileDelete(IvLocalFileSpec, IvFbk, not true);

    // fbk
    if not boo then
      TMesRec.W(IvFbk)
    else begin
      LogFrame.LogShow;
      LogFrame.Log('Local file %s deleted', [IvLocalFileSpec]);
    //TMesRec.AutoClose('Delete local file', Format('Local file %s deleted', [IvFileSpec]), 1000);
    end;
  end;

begin
  if OptionFileDeleteAfterUploadCheckBox.Checked then
    FileDeleteMacro
  else if TAskRec.Yes('Delete local file %s ?', [IvLocalFileSpec]) then
    FileDeleteMacro;
end;

procedure TBaseMainForm.FilesRioTreeLoad(IvFilRemVector: TFilRemVector);
var
  pvn: PVirtualNode;
  frm: TFilRem;
  pfr: PFilRec;
begin
  FilesRioTree.BeginUpdate;
  for frm in IvFilRemVector do begin
    // nodenewadd
    pvn := FilesRioTree.AddChild(nil);

    // nodedata
    pfr := FilesRioTree.GetNodeData(pvn);

    // nodeset
    frm.ToTreeNode(pfr);

    // nodeconfigure (optional)
    FilesRioTree.NodeHeight[pvn] := 28;
    pvn.CheckType := ctCheckBox;

    // nodevisuallyupdate (*)
    FilesRioTree.RepaintNode(pvn);
  end;
  FilesRioTree.EndUpdate;
//FilesRioTree.Refresh; (*)
end;

function  TBaseMainForm.FilesRioFileDownload(IvPFilRec: PFilRec; IvFilenameReadOnly: boolean; var IvLocalFileSpec, IvFbk: string): boolean;
var
  frm: TFilRem;
  lfs: string; // localfilespec
begin
  // internet
//Result := TNetRec.InternetIsAvailable(IvFbk);
//if not Result then
  //Exit;

  // rem
  frm := TFilRem.Create;
  try
    // set
    frm.FromRec(IvPFilRec^);

    // rio
    Screen.Cursor := crHourGlass;
    Result := (TRioRec.HttpRio('File') as IFileSoapMainService).FileSelectSoap(frm, true, IvFbk); // *** does load the bytearray! ***
    Screen.Cursor := crDefault;
    if not Result then
      Exit;

    // fbk
    if not Result then begin
      TMesRec.I(IvFbk);
      Exit;
    end;

    // filespec
    lfs := FilesRioFileLocalSpec(frm.PathOriginal, frm.Filename, IvFilenameReadOnly);

    // existing
    if TFsyRec.FileExists(lfs, IvFbk) then begin
      // removereadonlyattr
      Result := TFsyRec.FileAttrReadOnlyUnset(lfs, IvFbk);
      if not Result then
        Exit;

      // delete
      if OptionFileLocalFileOverrideAskCheckBox.Checked then begin
        if TAskRec.Yes('Override existing local file %s ?', [lfs]) then
          Result := TFsyRec.FileDelete(lfs, IvFbk)
        else
          Exit;
      end else
        Result := TFsyRec.FileDelete(lfs, IvFbk);
      if not Result then
        Exit;
    end;

    // save
    Result := TFsyRec.FileFromByteArray(frm.ByteArray, lfs, IvFbk);
    if not Result then
      Exit;

    // readonlyset
    if {OptionFileReadOnlyDownloadedFileCheckBox.Checked and} IvFilenameReadOnly then begin
      Result := TFsyRec.FileAttrReadOnlySet(lfs, IvFbk);
      if not Result then
        Exit;
    end;

    // result
    IvLocalFileSpec := lfs;
  finally
    FreeAndNil(frm);
  end;
end;

function  TBaseMainForm.FilesRioFileUpload(IvLocalFileSpec: string; IvFileOriginalDelete: boolean; var IvFbk: string): boolean;
var
  frm: TFilRem;
  oid, rev: integer; // ownerobjid, revision
  obj, org, own, lfs, nte, sto: string; // xxxobj, organization, owner, localfilespec, note, storage
begin
  // internet
//Result := TNetRec.InternetIsAvailable(IvFbk);
//if not Result then
  //Exit;

  // upload
  Screen.Cursor := crHourGlass;
  frm := TFilRem.Create;
  try
    // zip
    oid := FId;
    obj := FObj;
    org := gorg.Obj.&Object;
    own := gmbr.Member;
    lfs := IvLocalFileSpec;
    rev := 1;
    nte := '';
    sto := 'Database';

    // set
    frm.Init(oid, obj, org, own, lfs, rev, nte, sto); // does carry the bytearray!

    // rio
    Result := (TRioRec.HttpRio('File') as IFileSoapMainService).FileInsertSoap(frm, IvFbk); // does carry the bytearray!
  finally
    FreeAndNil(frm);
    Screen.Cursor := crDefault;
  end;

  // fbk
  if not Result then begin
    TMesRec.I(IvFbk);
    Exit;
  end;

  // refresh
  FilesRioRefreshAction.Execute;

  // localdelete
  FilesRioFileLocalDelete(lfs, IvFbk);
end;

function  TBaseMainForm.FilesRioFileUpdate(IvPFilRec: PFilRec; IvFileOriginalDelete: boolean; var IvLocalFileSpec, IvFbk: string): boolean;
var
  frm: TFilRem;
  lfs: string;
begin
  // internet
//Result := TNetRec.InternetIsAvailable(IvFbk);
//if not Result then
  //Exit;

  // rem
  Screen.Cursor := crHourGlass;
  frm := TFilRem.Create;
  try
    // zip
    lfs := IvLocalFileSpec;

    // set
    frm.FromTreeNode(IvPFilRec);

    // override
    frm.Updated   := Now;
    frm.State     := TStaRec.ACTIVE.Name;
    frm.Revision  := frm.Revision + 1;
    frm.Modified  := TFsyRec.FileModified(lfs);
    frm.SizeBytes := TFsyRec.FileSizeBytes(lfs);
    frm.ByteArray := TFsyRec.FileToByteArray(lfs);
    frm.EditCount := frm.EditCount + 1;
    frm.EditingBy := '';

    // rio
    Result := (TRioRec.HttpRio('File') as IFileSoapMainService).FileUpdateSoap(frm, gmbr.Member, IvFbk); // does carry the bytearray!
  finally
    FreeAndNil(frm);
    Screen.Cursor := crDefault;
  end;

  // fbk
  if not Result then begin
    TMesRec.I(IvFbk);
    Exit;
  end;
end;

function  TBaseMainForm.FilesRioFileDelete(IvPFilRec: PFilRec; IvUser: string; IvDeleteSoft, IvRecoverable: boolean; var IvFbk: string): boolean;
var
  frm: TFilRem;
begin
  // internet
//Result := TNetRec.InternetIsAvailable(IvFbk);
//if not Result then
  //Exit;

  // rem
  Screen.Cursor := crHourGlass;
  frm := TFilRem.Create;
  try
    // set
    frm.FromTreeNode(IvPFilRec);

    // rio
    if IvDeleteSoft then begin
      // override
      frm.Updated := Now;
      frm.State   := ifthen(IvRecoverable, TStaRec.RECOVERABLE.Name, TStaRec.DELETEABLE.Name);
      Result := (TRioRec.HttpRio('File') as IFileSoapMainService).FileUpdateSoap(frm, IvUser, IvFbk);
      if Result then
        IvFbk := IvFbk + sLineBreak + sLineBreak + Format('File %s has not effectively deleted.  Its state has been set to "%s".  You can recover it in the next 24h or an automatic job will EFFECTIVELY DELETE it.', [frm.State, frm.Filename]);

    end else begin
      Result := (TRioRec.HttpRio('File') as IFileSoapMainService).FileDeleteSoap(frm, IvUser, IvRecoverable, IvFbk);
      if Result then
        IvFbk := IvFbk + sLineBreak + sLineBreak + Format('File %s has been deleted.  It is%s recoverable.', [frm.Filename, ifthen(IvRecoverable, '', ' not')]);
    end;
  finally
    FreeAndNil(frm);
    Screen.Cursor := crDefault;
  end;
end;

function  TBaseMainForm.FilesRioFileMoveIsAllowed(IvObj: string; IvObjectId: integer; IvUId, IvUser: string; var IvIsAllowed: boolean; var IvFbk: string): boolean;
begin
  // internet
//Result := TNetRec.InternetIsAvailable(IvFbk);
//if not Result then
  //Exit;

  // rio
  Screen.Cursor := crHourGlass;
  try
    Result := (TRioRec.HttpRio('File') as IFileSoapMainService).FileMoveIsAllowedSoap(FObj, IvObjectId, IvUId, IvUser, IvIsAllowed, IvFbk);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function  TBaseMainForm.FilesRioFileMove(IvUId, IvObj: string; IvObjectId: integer; var IvFbk: string): boolean;
var
  sql: string;
  aff: integer;
begin
  // internet
//Result := TNetRec.InternetIsAvailable(IvFbk);
//if not Result then
  //Exit;

  // sql
  sql :=         'update'
  + sLineBreak + '    DbaFile.dbo.TblFile'
  + sLineBreak + 'set'
  + sLineBreak + '    FldObjectId = ' + TSqlRec.Val(IvObjectId)
  + sLineBreak + 'where'
  + sLineBreak + '    FldUId = ' + TSqlRec.Val(IvUId)
  + sLineBreak + 'and FldObj = ' + TSqlRec.Val(IvObj)
  ;

  // exec
  Result := TDbaRec.CmdExec(sql, aff, IvFbk);
  if not Result then
    Exit;

  // fbk
  IvFbk := Format('File with %s and Obj %s moved to Id %d', [IvUId, IvObj, IvObjectId]);
end;
  {$ENDREGION}

  {$REGION 'tree'}
procedure TBaseMainForm.FilesRioTreeChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  FilesRioTree.Refresh;
end;

procedure TBaseMainForm.FilesRioTreeClick(Sender: TObject);
begin
  // general, not node specific, suitable for a ctrl related PopupMenu
  //ShowMessage('Tree view clicked');
end;

procedure TBaseMainForm.FilesRioTreeDblClick(Sender: TObject);
begin
  if OptionFileOnDoubleClickComboBox.Text = 'CheckOut' then
    FilesRioCheckOutAction.Execute
  else
    FilesRioDownloadAction.Execute;
end;

procedure TBaseMainForm.FilesRioTreeEditing(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var Allowed: boolean);
begin
  // edit only          filename, note, candownload, canedit
  Allowed := Column in [0       , 6  {, 12         , 13}];
end;

procedure TBaseMainForm.FilesRioTreeEditCancelled(Sender: TBaseVirtualTree; Column: TColumnIndex);
begin
  ;
end;

procedure TBaseMainForm.FilesRioTreeEdited(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
begin
  ;
end;

procedure TBaseMainForm.FilesRioTreeFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
begin
  FilesRioTree.Refresh;
end;

procedure TBaseMainForm.FilesRioTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  pfr: PFilRec;
begin
  pfr := FilesRioTree.GetNodeData(Node);
  if Assigned(pfr) then begin
    // i
{//  pfr.ObjectId      := '';
    pfr.UId           := '';
    pfr.Obj           := '';
    pfr.Kind          := '';
    pfr.State         := '';
//  pfr.Created       := '';
//  pfr.Updated       := '';
    pfr.Organization  := '';
    pfr.Owner         := '';
    pfr.PathOriginal  := '';
    pfr.Filename      := '';
//  pfr.Revision      := '';
    pfr.ContentType   := '';
//  pfr.Modified      := '';
//  pfr.SizeBytes     := '';
    pfr.Storage       := '';
    pfr.EditingBy     := '';
    pfr.Note          := '';
//  pfr.CanDownload   := '';
//  pfr.CanEdit       := '';
//  pfr.DownloadCount := '';
//  pfr.EditCount     := '';}

    // ii
    Finalize(pfr^);
  end;
end;

procedure TBaseMainForm.FilesRioTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: boolean; var ImageIndex: TImageIndex);
var
  pfr: PFilRec;
  ext: string;
begin
  if Column <> 0 then
    Exit;

  if Kind in [ikNormal, ikSelected] then begin // either selected or not
    pfr := FilesRioTree.GetNodeData(Node);
    ext := TPatRec.Ext(pfr.Filename);
    if       ext = '.txt'                     then ImageIndex :=  1
    else if (ext = '.rtf')                    then ImageIndex :=  2
    else if (ext = '.bmp')                    then ImageIndex :=  3
    else if (ext = '.doc') or (ext = '.docx') then ImageIndex :=  4
    else if (ext = '.xls') or (ext = '.xlsx') then ImageIndex :=  5
    else if (ext = '.ppt') or (ext = '.pptx') then ImageIndex :=  6
    else if (ext = '.mdb') or (ext = '.mdbx') then ImageIndex :=  7
    else if (ext = '.vsd') or (ext = '.vsdx') then ImageIndex :=  8
    else if (ext = '.png')                    then ImageIndex :=  9
    else if (ext = '.jpg')                    then ImageIndex := 10
    else if (ext = '.pdf')                    then ImageIndex := 11
    else if (ext = '.zip')                    then ImageIndex := 12
    else if (ext = '.rar')                    then ImageIndex := 13
    else                                           ImageIndex :=  0;
  end;
end;

procedure TBaseMainForm.FilesRioTreeGetNodeDataSize(Sender: TBaseVirtualTree; var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TFilRec);
end;

procedure TBaseMainForm.FilesRioTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  pfr: PFilRec;
begin
    pfr := FilesRioTree.GetNodeData(Node);
    if not Assigned(pfr) then
      Exit;

    case Column of // userorder
      00: CellText := pfr.Filename;
      01: CellText := DateTimeToStr(pfr.Updated);  // dbrecordupdated
      02: CellText := pfr.State;
      03: CellText := pfr.EditingBy;
      04: CellText := pfr.Revision.ToString;
      05: CellText := pfr.SizeBytes.ToString;
      06: CellText := pfr.Note;
      07: CellText := pfr.Owner;
      08: CellText := pfr.Organization;
      09: CellText := pfr.PathOriginal;
      10: CellText := pfr.DownloadCount.ToString;
      11: CellText := pfr.EditCount.ToString;
      12: CellText := pfr.CanDownload.ToString;
      13: CellText := pfr.CanEdit.ToString;
      14: CellText := DateTimeToStr(pfr.Created);
      15: CellText := DateTimeToStr(pfr.Modified);
      16: CellText := pfr.Kind;
      17: CellText := pfr.ContentType;
      18: CellText := pfr.ObjectId.ToString;
      19: CellText := pfr.UId;
      20: CellText := pfr.Obj;
      21: CellText := pfr.Storage;
    end;
end;

procedure TBaseMainForm.FilesRioTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
//Node.CheckType := ctCheckBox;
end;

procedure TBaseMainForm.FilesRioTreeNewText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; NewText: string);
var
  boo: boolean;
  pfr: PFilRec;
  own, oid, uid, whe, fld, fbk: string; // owner, oid, uid, where, field
begin
  // change a cell (filename rename or add a note)

  // rowactual
  pfr := FilesRioTree.GetNodeData(Node);
  own := pfr.Owner;
  oid := pfr.ObjectId.ToString;
  uid := pfr.UId;
  whe := Format('FldObjectId = %s and FldUId = ''%s'' and FldObj = ''%s''', [oid, uid, FObj]);

  // check
  if own <> gmbr.Member then
    if not gmbr.IsAdmin then begin
      TMesRec.W('Only owner %s can update file properties', [own]);
      Exit;
    end else
      TMesRec.I('You can change file properties because your role is Admin');

  // field
  case Column of
     0: fld := 'FldFilename';
     6: fld := 'FldNote';
  //12: fld := 'FldCanDownload';
  //13: fld := 'FldCanEdit';
  end;

  // rioupdate
  boo := TDbaRec.FldSetWhereRio('DbaFile.dbo.TblFile', fld, whe, NewText, fbk);
  if not boo then begin
    TMesRec.W(fbk);
    Exit;
  end;

  // rowupdate
  case Column of
    00: pfr.Filename             := NewText;
    06: pfr.Note                 := NewText;
  //11: pfr.CanDownload.ToString := NewText;
  //12: pfr.CanEdit.ToString     := NewText;
  end;

  // log
  LogFrame.Log('Column %s changed to new value %s', [fbk.Replace('Fld', ''), NewText]);

  // refresh
  //FileRioRefreshAction.Execute;
end;

procedure TBaseMainForm.FilesRioTreeNodeClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);
var
  ndr: PFilRec; // node data structure
begin
  if Assigned(HitInfo.HitNode) then begin
    ndr := Sender.GetNodeData(HitInfo.HitNode);
    if Assigned(ndr) then begin
      FilesRioInfoLabel.Caption := Format('%s', [{ndr.ObjectId, ndr.UId, ndr.Obj, }ndr.Filename]);
    end;
  end;
end;

procedure TBaseMainForm.FilesRioTreeNodeDblClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);
begin
  ;
end;

procedure TBaseMainForm.FilesRioTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
begin
  case Column of
    2: begin // state
         if not (vsSelected in Node.States) then
           TargetCanvas.Font.Color := TStaRec.ColorFromState(Node.GetData<TFilRec>.State);
         TargetCanvas.Font.Style := [TFontStyle.fsBold];
       end;

    3: begin // editingby
         if not (vsSelected in Node.States) then
           TargetCanvas.Font.Color := clRed;
         TargetCanvas.Font.Style := [TFontStyle.fsBold];
       end;
  end;
end;
  {$ENDREGION}

  {$REGION 'tabsheet'}
procedure TBaseMainForm.FilesRioTabSheetShow(Sender: TObject);
begin
  FilesRioRefreshAction.Execute;
end;
  {$ENDREGION}

  {$REGION 'actions'}
procedure TBaseMainForm.FilesRioRefreshActionExecute(Sender: TObject);
var
  fbk: string;
  frv: TFilRemVector;
begin
  // reset
  FilesRioTree.Clear;
  FilesRioInfoLabel.Caption := '';
  Application.ProcessMessages;

  // exit
  if not (FId > 0) then begin
    TMesRec.I('Please select a node in the tree on the left');
    Exit;
  end;

  // do
  Screen.Cursor := crHourGlass;
  try
    // rio
    if not ((TRioRec.HttpRio('File') as IFileSoapMainService).FileVectorSoap(FId, FObj, frv, false, fbk)) then begin // *** do not load the bytearray! ***
    //TMesRec.I(fbk);
      FilesRioInfoLabel.Caption := fbk;
      Exit;
    end;

    // tree
    FilesRioTreeLoad(frv);

    // info
    FilesRioInfoLabel.Caption := Format('%d file(s)', [Length(frv)]);
  finally
    TFilRem.TFilRemVectorFree(frv);
    Screen.Cursor := crDefault;
  end;
end;

procedure TBaseMainForm.FilesRioDownloadActionExecute(Sender: TObject);
var
  boo: boolean;
  lfs, fbk: string;
  pfr: PFilRec;
  pvn: PVirtualNode;
begin
  // nodes
  if FilesRioTree.SelectedCount = 0 then begin
    TMesRec.I('Please select one or more files to download');
    Exit;
  end;

  // nodesloop
  for pvn in FilesRioTree.SelectedNodes do begin
    // nodedata
    pfr := FilesRioTree.GetNodeData(pvn);

    // downloadlocallyreadonly
    boo := FilesRioFileDownload(pfr, true, lfs, fbk);
    if not boo then begin
      TMesRec.I(fbk);
      // ask to continue or not
      if TAskRec.No('Continue to download the remaining files ?') then
        Exit;
    end;

    // open
    if OptionFileOpenAfterChechOutCheckBox.Checked then
      boo := TWinRec.WinShellExec(Application.Handle, lfs, fbk);
      if not boo then
        TMesRec.I(fbk);
  end;
end;

procedure TBaseMainForm.FilesRioUploadActionExecute(Sender: TObject);
var
  i: integer;
  lfs, fbk: string;
begin
  // filesask
  if not OpenDialog.Execute then
    Exit;

  // filesloop
  for i := 0 to OpenDialog.Files.Count-1 do begin
    // zip
    lfs := OpenDialog.Files.Strings[i];

    // upload
    LogFrame.Log('Uploading %s ...', [lfs]);
    if not FilesRioFileUpload(lfs, OptionFileDeleteAfterUploadCheckBox.Checked, fbk) then
      TMesRec.W(fbk);

    // refresh
    FilesRioRefreshAction.Execute;

    // continue
    if (OpenDialog.Files.Count > 1) and (i < OpenDialog.Files.Count-1) then
      if not TAskRec.Yes then
        Break;
  end;

  // refresh
//FilesRioRefreshAction.Execute;
end;

procedure TBaseMainForm.FilesRioCheckOutActionExecute(Sender: TObject);
var
  oid: integer;
  boo: boolean;
  pfr: PFilRec;
  vnt: variant;
  obj, own, lfs, uid, whe, fbk: string; // xxxobj, owner, file, uid, where
begin
  // node
  if FilesRioTree.SelectedCount <> 1 then begin
    TMesRec.I('Please select the file to check-out for editing');
    Exit;
  end;

  // zip
  pfr := FilesRioTree.GetNodeData(FilesRioTree.FocusedNode);
  oid := pfr.ObjectId;
  uid := pfr.UId;
  obj := pfr.Obj;
  own := pfr.Owner;
  whe := Format('FldObjectId = %d and FldUId = ''%s'' and FldObj = ''%s''', [oid, uid, obj]);

  // alreadytaken
  boo := TDbaRec.FldGetWhereRio('DbaFile.dbo.TblFile', 'FldEditingBy', whe, vnt, '', fbk);
  if not boo then begin
    TMesRec.I(fbk);
    Exit;
  end;
  boo := VarToStr(vnt).IsEmpty;
  if not boo then begin
    TMesRec.I('Unable to check-out, user %s has locked the file for editing', [vnt]);
    Exit;
  end;

  // checkout = downloadlocallynotreadonly
  boo := FilesRioFileDownload(pfr, false, lfs, fbk);
  if not boo then begin
    TMesRec.W(fbk);
    Exit;
  end;

  // lock
  boo := TDbaRec.FldSetWhereRio('DbaFile.dbo.TblFile', 'FldState', whe, TStaRec.LOCKED.Name, fbk);
  if not boo then begin
    TMesRec.W('Unable to check-out, unabe to lock the document, %s', [fbk]);
    Exit;
  end;

  // sign
  boo := TDbaRec.FldSetWhereRio('DbaFile.dbo.TblFile', 'FldEditingBy', whe, gmbr.Member, fbk);
  if not boo then begin
    TMesRec.W('Unable to check-out, unabe to sign the document, %s', [fbk]);
    Exit;
  end;

  TMesRec.I('File locked, checked-out and saved locally to %s', [lfs]);

  // refresh
  FilesRioRefreshAction.Execute;

  // open
  if OptionFileOpenAfterChechOutCheckBox.Checked then
    boo := TWinRec.WinShellExec(Application.Handle, lfs, fbk);
    if not boo then
      TMesRec.I(fbk);
end;

procedure TBaseMainForm.FilesRioCheckOutCancelActionExecute(Sender: TObject);
var
  boo: boolean;
  pfr: PFilRec;
  oid: integer;
  eby, obj, uid, lfs, whe, nte, fbk: string; // editingby, xxxobj, uid, file, where, note
begin
  // node
  if FilesRioTree.SelectedCount <> 1 then begin
    TMesRec.I('Please select the file to cancel the check-out');
    Exit;
  end;

  // zip
  pfr := FilesRioTree.GetNodeData(FilesRioTree.FocusedNode);
  oid := pfr.ObjectId;
  uid := pfr.UId;
  obj := pfr.Obj;
//own := pfr.Owner;
  eby := pfr.EditingBy;
  whe := Format('FldObjectId = %d and FldUId = ''%s'' and FldObj = ''%s''', [oid, uid, obj]);
  lfs := FilesRioFileLocalSpec(pfr.PathOriginal, pfr.Filename, false);

  // cancancelcheckout
  boo := (eby = gmbr.Member);
  if not boo then begin
    TMesRec.W('Unable to cancel check-out, only user %s can cancel its check-out', [eby]);
    Exit;
  end;

  // unlock
  boo := TDbaRec.FldSetWhereRio('DbaFile.dbo.TblFile', 'FldState', whe, TStaRec.ACTIVE.Name, fbk);
  if not boo then begin
    TMesRec.W('Unable to cancel check-out, unable to unlock the document, %s', [fbk]);
    Exit;
  end;

  // signatureremove
  boo := TDbaRec.FldSetWhereRio('DbaFile.dbo.TblFile', 'FldEditingBy', whe, NULL, fbk);
  if not boo then begin
    TMesRec.W('Unable to cancel check-out, unable to remove signature from the document, %s', [fbk]);
    Exit;
  end;

  // refresh
  FilesRioRefreshAction.Execute;

  TMesRec.I('File %s heck-out cancelled', [lfs]);

  // localdelete
  if TFsyRec.FileExists(lfs, fbk) then
    if TAskRec.Yes('What about the local file %s ? delete it ?', [lfs]) then
      TFsyRec.FileDelete(lfs, fbk, true);

  // history-remote
  nte := Format('%s check-out cancelled', [TFsyRec.FileNameExt(lfs)]);
  boo := TDbaRec.RecInsertRio('DbaFile.dbo.TblHistory', [oid.ToString, uid, obj, Now, gorg.Obj.&Object, gusr.Username, nte], fbk);
  if not boo then
    TMesRec.W('Unable to save history, %s', [fbk]);
end;

procedure TBaseMainForm.FilesRioCheckInActionExecute(Sender: TObject);
var
  boo: boolean;
  lfs, fbk: string;
  pfr: PFilRec;
begin
  // node
  if FilesRioTree.SelectedCount <> 1 then begin
    TMesRec.I('Please select the file to check-in (update the remote file)');
    Exit;
  end;

  // zip
  pfr := FilesRioTree.GetNodeData(FilesRioTree.FocusedNode);
  lfs := FilesRioFileLocalSpec(pfr.PathOriginal, pfr.Filename, false);

  // checkin = fileremoteupdatewithfilelocal
  boo := FilesRioFileUpdate(pfr, OptionFileDeleteAfterUploadCheckBox.Checked, lfs, fbk);
  if not boo then begin
    TMesRec.I(fbk);
    Exit;
  end;

  TMesRec.I('File %s checked-in and saved remotely', [lfs]);

  // refresh
  FilesRioRefreshAction.Execute;

  // localdelete
  FilesRioFileLocalDelete(lfs, fbk);
end;

procedure TBaseMainForm.FilesRioSearchActionExecute(Sender: TObject);
begin
  TMesRec.NI;
end;

procedure TBaseMainForm.FilesRioHttpLinkActionExecute(Sender: TObject);
var
  pfr: PFilRec;
begin
  // node
  if not Assigned(FilesRioTree.FocusedNode) then begin
    TMesRec.I('Please select the file to get the download');
    Exit;
  end;

  // nodedata
  pfr := FilesRioTree.GetNodeData(FilesRioTree.FocusedNode);

  // url
  Clipboard.AsText := gaps.FileIsapiDownloadUrl(pfr.ObjectId, pfr.UId, pfr.Obj);

  // fbk
  TMesRec.AutoCloseFmt('Info', 'Link to %s copied', [pfr.Filename], 1500);
end;

procedure TBaseMainForm.FilesRioMoveActionExecute(Sender: TObject);
var
  {i,} aff: integer;
  boo: boolean;
  pvn: PVirtualNode;
  pfr: PFilRec;
  oid, uid, obj, fna, fbk: string;
begin
  // node(s)
  aff := FilesRioTree.SelectedCount;
  if aff = 0 then begin
    TMesRec.I('Please select one or more files to move to a different %s object', [FObj]);
    Exit;
  end;

  // idtargetask
  if not TAskRec.Str('File Move', Format('Input the target %s''s Id to move the file', [FObj]), '', oid) then
    Exit;

  // nodesloop
  //i := -1;
  for pvn in FilesRioTree.SelectedNodes do begin
    // idx
  //Inc(i);

    // nodedata
    pfr := FilesRioTree.GetNodeData(pvn);

    // zip
    uid := pfr.UId;
    obj := pfr.Obj;
    fna := pfr.Filename;

    // checktarget
    FilesRioFileMoveIsAllowed({FObj}obj, oid.ToInteger, uid, gmbr.Member, boo, fbk);
    if not boo then begin
      TMesRec.W(fbk);
      continue;
    end;

    // confirm
    if not TAskRec.Yes('MOVE remote file %s to Id %s', [fna, oid]) then
      continue;

    // moverio
    boo := FilesRioFileMove(uid, obj, oid.ToInteger, fbk);
    LogFrame.Log(fbk, boo);
    if not boo then
      TMesRec.W(fbk);

    // continue
  //if (aff > 1) and (i < aff - 1) then
    //if not TAskRec.Yes then
      //Break;
  end;

  // refresh
  FilesRioRefreshAction.Execute;
end;

procedure TBaseMainForm.FilesRioOwnershipTakeActionExecute(Sender: TObject);
begin
  TMesRec.NI;
end;

procedure TBaseMainForm.FilesRioPropertiesActionExecute(Sender: TObject);
begin
  TMesRec.NI;

  // show remote and local properties
end;

procedure TBaseMainForm.FilesRioDeleteActionExecute(Sender: TObject);
var
  i, aff: integer;
  boo: boolean;
  pvn: PVirtualNode;
  pfr: PFilRec;
  lfs, fbk: string; // localfilespec
begin
  // nodes
  aff := FilesRioTree.SelectedCount;
  if aff = 0 then begin
    TMesRec.I('Please select one or more files to DELETE REMOTELY');
    Exit;
  end;

  // confirm
  if TAskRec.No('DELETE %d remote file(s)?', [FilesRioTree.SelectedCount]) then
    Exit;

  // nodesloop
  i := -1;
  for pvn in FilesRioTree.SelectedNodes do begin
    // idx
    Inc(i);

    // nodedata
    pfr := FilesRioTree.GetNodeData(pvn);

    // zip
    lfs := FilesRioFileLocalSpec(pfr.PathOriginal, pfr.Filename, false);

    // checksbeforedelete
    // these are performed on the server side

    // deleterio
    boo := FilesRioFileDelete(pfr, gmbr.Member, false, false, fbk);
    TMesRec.I(fbk);
    LogFrame.Log(fbk, boo);

    // continue
    if (aff > 1) and (i < aff - 1) then
      if not TAskRec.Yes then
        Break;
  end;

  // refresh
  FilesRioRefreshAction.Execute;
end;

procedure TBaseMainForm.FilesLocalDeleteActionExecute(Sender: TObject);
var
  i, aff: integer;
  pvn: PVirtualNode;
  pfr: PFilRec;
  lfs, ron, fbk: string; // file, readonlyfile
begin
  // nodes
  aff := FilesRioTree.SelectedCount;
  if aff = 0 then begin
    TMesRec.I('Please select one or more files to DELETE LOCALLY (both normal and "*_readonly" files will be deleted)');
    Exit;
  end;

  // confirm
  if TAskRec.No('DELETE %d local file(s)?', [FilesRioTree.SelectedCount]) then
    Exit;

  // nodesloop
  i := -1;
  for pvn in FilesRioTree.SelectedNodes do begin
    // idx
    Inc(i);

    // nodedata
    pfr := FilesRioTree.GetNodeData(pvn);

    // zip
    lfs := FilesRioFileLocalSpec(pfr.PathOriginal, pfr.Filename, false);
    ron := FilesRioFileLocalSpec(pfr.PathOriginal, pfr.Filename, true);

    // deletelocalarchive
    if not TFsyRec.FileExists(lfs, fbk) then
      TMesRec.I('File %s does not exists LOCALLY', [lfs])
    else if TAskRec.Yes('Delete the LOCAL file %s', [lfs]) then begin
      TFsyRec.FileDelete(lfs, fbk);
      TMesRec.I(fbk);
    end;

    // deletelocalreadonly
    if not TFsyRec.FileExists(ron, fbk) then
      TMesRec.I('File %s does not exists LOCALLY', [ron])
    else if TAskRec.Yes('Delete the LOCAL read-only file %s', [ron]) then begin
      if not TFsyRec.FileAttrReadOnlyUnset(ron, fbk) then begin
        TMesRec.I(fbk);
        Exit;
      end;
      TFsyRec.FileDelete(ron, fbk);
      TMesRec.I(fbk);
    end;

    // continue
    if (aff > 1) and (i < aff - 1) then
      if not TAskRec.Yes then
        Break;
  end;

  // refresh
//FilesRioRefreshAction.Execute; // not needed
  TMesRec.I('Don''t worry... remote files was not touched');
end;

procedure TBaseMainForm.FilesLocalOpenActionExecute(Sender: TObject);
var
  lfs, fbk: string;
  pfr: PFilRec;
begin
  // node
  if not Assigned(FilesRioTree.FocusedNode) then begin
    TMesRec.I('Please select one file to open from the local working folder ' + OptionFileWorkingFolderSelectButtonedEdit.Text);
    Exit;
  end;

  // nodedata
  pfr := FilesRioTree.GetNodeData(FilesRioTree.FocusedNode);

  // zip
  lfs := FilesRioFileLocalSpec(pfr.PathOriginal, pfr.Filename, false);

  // open
  if not TFsyRec.FileExists(lfs, fbk) then
    TMesRec.I('File %s does not exists in the local working folder', [lfs])
  else
    TWinRec.WinShellExec(Application.Handle, lfs, fbk);
end;

procedure TBaseMainForm.FilesLocalFolderOpenActionExecute(Sender: TObject);
var
  wof, fbk: string;
begin
  wof := OptionFileWorkingFolderSelectButtonedEdit.Text;
  if not TFsyRec.DirExists(wof, fbk) then
    TMesRec.I('Unable to open the working folder %s, it does not exists (it will be auto created after the 1st download/checkout)', [wof])
  else if not TFsyRec.DirOpen(OptionFileWorkingFolderSelectButtonedEdit.Text, fbk) then
    TMesRec.I(fbk);
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Words'}
procedure TBaseMainForm.WordTabSheetHide(Sender: TObject);
begin
  // donotfreeforperformance
//WordTabSheet.FindChildControl('WordFrame').Free;
end;

procedure TBaseMainForm.WordTabSheetShow(Sender: TObject);
var
  frm: TWordFrame;
begin
  // exit
  if Assigned(WordTabSheet.FindChildControl('WordFrame')) then
    Exit;

  // create
  frm := TWordFrame.Create(Self);
  frm.Parent := WordTabSheet;
  frm.Name := 'WordFrame';
  frm.Align := alClient;
end;
{$ENDREGION}

end.
