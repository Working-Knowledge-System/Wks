object BaseMainForm: TBaseMainForm
  Left = 0
  Top = 0
  Caption = 'BaseMainForm'
  ClientHeight = 842
  ClientWidth = 1580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object LeftJvNetscapeSplitter: TJvNetscapeSplitter
    Left = 300
    Top = 74
    Height = 596
    Align = alLeft
    MinSize = 1
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
    ExplicitLeft = 303
    ExplicitTop = 77
    ExplicitHeight = 588
  end
  object RightJvNetscapeSplitter: TJvNetscapeSplitter
    Left = 1270
    Top = 74
    Height = 596
    Align = alRight
    MinSize = 1
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
    ExplicitLeft = 875
    ExplicitTop = 77
    ExplicitHeight = 588
  end
  object BottomJvNetscapeSplitter: TJvNetscapeSplitter
    Left = 0
    Top = 670
    Width = 1580
    Height = 10
    Cursor = crVSplit
    Align = alBottom
    MinSize = 1
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
    ExplicitTop = 665
    ExplicitWidth = 1188
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 1580
    Height = 74
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Caption = 'TopPanel'
    ShowCaption = False
    TabOrder = 0
    object TopPageControl: TPageControl
      Left = 0
      Top = 0
      Width = 1160
      Height = 74
      ActivePage = TopTextTabSheet
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object TopClientTabSheet: TTabSheet
        Caption = 'Client'
        object ClientToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 293
          Height = 44
          Align = alLeft
          ButtonHeight = 46
          ButtonWidth = 45
          Caption = 'ClientToolBar'
          Images = ClientImageList24
          ShowCaptions = True
          TabOrder = 0
          object ClientExitToolButton: TToolButton
            Left = 0
            Top = 0
            Action = ClientExitAction
          end
          object ClientnfoToolButton: TToolButton
            Left = 45
            Top = 0
            Action = ClientInfoAction
          end
          object ClientHelpToolButton: TToolButton
            Left = 90
            Top = 0
            Action = ClientHelpAction
          end
          object ClientVersionCheckToolButton: TToolButton
            Left = 135
            Top = 0
            Action = ClientVersionAction
          end
          object ClientDonateToolButton: TToolButton
            Left = 180
            Top = 0
            Action = ClientDonateAction
          end
          object ClientShareToolButton: TToolButton
            Left = 225
            Top = 0
            Action = ClientShareAction
          end
        end
      end
      object TopActionTabSheet: TTabSheet
        Caption = 'Actions'
        ImageIndex = 1
        object ActionsToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 594
          Height = 44
          Align = alLeft
          AutoSize = True
          ButtonHeight = 46
          ButtonWidth = 54
          Caption = 'ActionsToolBar'
          Images = ActionsImageList24
          ShowCaptions = True
          TabOrder = 0
          object ActionRefreshToolButton: TToolButton
            Left = 0
            Top = 0
            Action = ActionRefreshAction
          end
          object ActionPostToolButton: TToolButton
            Left = 54
            Top = 0
            Action = ActionPostAction
          end
          object ActionGotoToolButton: TToolButton
            Left = 108
            Top = 0
            Action = ActionGotoAction
          end
          object ActionFitToolButton: TToolButton
            Left = 162
            Top = 0
            Action = ActionFitAction
          end
          object ActionBrowseToolButton: TToolButton
            Left = 216
            Top = 0
            Action = ActionBrowseAction
          end
          object ActionEditToolButton: TToolButton
            Left = 270
            Top = 0
            Action = ActionEditAction
          end
          object ActionMarkdownToolButton: TToolButton
            Left = 324
            Top = 0
            Action = ActionMarkdownAction
          end
          object ActionZzzToolButton: TToolButton
            Left = 378
            Top = 0
            Action = ActionZzzAction
          end
          object ActionLoadFromFileToolButton: TToolButton
            Left = 432
            Top = 0
            Action = ActionLoadFromFileAction
          end
          object ActionSaveToFileToolButton: TToolButton
            Left = 486
            Top = 0
            Action = ActionSaveToFileAction
          end
          object ActionPersistedOpenToolButton: TToolButton
            Left = 540
            Top = 0
            Action = ActionPersistedOpenAction
          end
        end
      end
      object TopTextTabSheet: TTabSheet
        Caption = '  Text'
        ImageIndex = 3
        object TextToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 993
          Height = 44
          Align = alLeft
          ButtonHeight = 46
          ButtonWidth = 61
          Caption = 'ClientToolBar'
          Images = TextImageList24
          ShowCaptions = True
          TabOrder = 0
          object TextFoldingToolButton: TToolButton
            Left = 0
            Top = 0
            Action = TextFoldingAction
          end
          object TextFoldToolButton: TToolButton
            Left = 61
            Top = 0
            Action = TextFoldAction
          end
          object TextCommentToolButton: TToolButton
            Left = 122
            Top = 0
            Action = TextCommentAction
          end
          object TextWordWrapToolButton: TToolButton
            Left = 183
            Top = 0
            Action = TextWordWrapAction
          end
          object TextSpecialCharsToolButton: TToolButton
            Left = 244
            Top = 0
            Action = TextSpecialCharsAction
          end
          object TextGutterToolButton: TToolButton
            Left = 305
            Top = 0
            Action = TextGutterAction
          end
          object TextLineNumbersToolButton: TToolButton
            Left = 366
            Top = 0
            Action = TextNumbersAction
          end
          object TextZeroStartToolButton: TToolButton
            Left = 427
            Top = 0
            Action = TextZeroStartAction
          end
          object TextSortAscToolButton: TToolButton
            Left = 488
            Top = 0
            Action = TextSortAscAction
          end
          object TextSortDescToolButton: TToolButton
            Left = 549
            Top = 0
            Action = TextSortDescAction
          end
          object TextTabToSpacesToolButton: TToolButton
            Left = 610
            Top = 0
            Action = TextTabToSpacesAction
          end
          object TextTrimRightToolButton: TToolButton
            Left = 671
            Top = 0
            Action = TextTrimRightAction
          end
          object TextLinePrefixToolButton: TToolButton
            Left = 732
            Top = 0
            Action = TextLinePrefixAction
          end
          object TextLineNumberToolButton: TToolButton
            Left = 793
            Top = 0
            Action = TextLineNumbersAction
          end
          object TextStatsToolButton: TToolButton
            Left = 854
            Top = 0
            Action = TextStatsAction
          end
          object TextCompareToolButton: TToolButton
            Left = 915
            Top = 0
            Action = TextCompareAction
          end
        end
      end
      object TopSearchTabSheet: TTabSheet
        Caption = 'Search'
        ImageIndex = 5
        object SearchReplaceOutLabel: TLabel
          Left = 215
          Top = 12
          Width = 35
          Height = 15
          Caption = 'Search'
        end
        object SearchReplaceInLabel: TLabel
          Left = 399
          Top = 12
          Width = 41
          Height = 15
          Caption = 'Replace'
        end
        object SearchReplaceSwapLabel2: TLabel
          Left = 879
          Top = 12
          Width = 28
          Height = 15
          Caption = 'Swap'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = SearchReplaceSwapLabel2Click
        end
        object TopSearchToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 209
          Height = 44
          Align = alLeft
          ButtonHeight = 46
          ButtonWidth = 48
          Caption = 'TopSearchToolBar'
          Images = SearchImageList
          ShowCaptions = True
          TabOrder = 0
          object SearchToolButton: TToolButton
            Left = 0
            Top = 0
            Action = SearchAction
          end
          object SearchPrevToolButton: TToolButton
            Left = 48
            Top = 0
            Action = SearchPrevAction
          end
          object SearchNextToolButton: TToolButton
            Left = 96
            Top = 0
            Action = SearchNextAction
          end
          object SearchReplaceToolButton: TToolButton
            Left = 144
            Top = 0
            Action = SearchReplaceAction
          end
        end
        object SearchReplaceOutEdit: TEdit
          Left = 257
          Top = 9
          Width = 121
          Height = 23
          TabOrder = 1
          Text = 'SearchReplaceOutEdit'
        end
        object SearchReplaceInEdit: TEdit
          Left = 448
          Top = 9
          Width = 121
          Height = 23
          TabOrder = 2
          Text = 'SearchReplaceInEdit'
          OnKeyPress = SearchReplaceInEditKeyPress
        end
        object SearchReplaceAllButton: TButton
          Left = 597
          Top = 8
          Width = 78
          Height = 25
          Caption = 'Replace All'
          TabOrder = 3
          OnClick = SearchReplaceAllButtonClick
        end
        object SearchReplaceMatchCaseICheckBox: TCheckBox
          Left = 697
          Top = 12
          Width = 82
          Height = 17
          Caption = 'Match Case case'
          TabOrder = 4
        end
        object SearchReplaceWholeCheckBox: TCheckBox
          Left = 785
          Top = 12
          Width = 90
          Height = 17
          Caption = 'Whole Word'
          TabOrder = 5
        end
      end
      object TopUtilsTabSheet: TTabSheet
        Caption = ' Utils'
        ImageIndex = 4
        object UtilsToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 306
          Height = 44
          Align = alLeft
          ButtonHeight = 46
          ButtonWidth = 47
          Caption = 'UtilsToolBar'
          Images = UtilsImageList
          ShowCaptions = True
          TabOrder = 0
          object UtilsPythonExecToolButton: TToolButton
            Left = 0
            Top = 0
            Action = UtilsPythonExecAction
          end
        end
      end
    end
    object TopPageControl3: TPageControl
      Left = 1280
      Top = 0
      Width = 300
      Height = 74
      ActivePage = TimeTabSheet
      Align = alRight
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object TimeTabSheet: TTabSheet
        Caption = ' Time'
        ImageIndex = 1
        object YearLabel: TLabel
          Left = 0
          Top = -2
          Width = 55
          Height = 13
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Alignment = taCenter
          AutoSize = False
          Caption = '2023'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object MonthLabel: TLabel
          Left = 0
          Top = 31
          Width = 55
          Height = 13
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Alignment = taCenter
          AutoSize = False
          Caption = 'September'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DayLabel: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 12
          Width = 55
          Height = 22
          Margins.Top = 5
          Alignment = taCenter
          AutoSize = False
          Caption = '00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object TimerLabel: TLabel
          AlignWithMargins = True
          Left = 152
          Top = 6
          Width = 87
          Height = 35
          Margins.Top = 6
          Margins.Right = 6
          Alignment = taCenter
          AutoSize = False
          Caption = '00:00:00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object WeekdayLabel: TLabel
          Left = 51
          Top = 6
          Width = 91
          Height = 30
          Alignment = taCenter
          AutoSize = False
          Caption = 'Wednesday'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object WeekLabel: TLabel
          Left = 51
          Top = 31
          Width = 91
          Height = 13
          Hint = 'ISO 8601'
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Alignment = taCenter
          AutoSize = False
          Caption = 'Week'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = WeekLabelClick
        end
        object TimerJvClock: TJvClock
          Left = 248
          Top = 0
          Width = 44
          Height = 44
          Margins.Top = 0
          Margins.Bottom = 2
          BevelInner = bvNone
          BevelOuter = bvNone
          DotsColor = clBlack
          DateFormat = 'MM/dd/yyyy'
          FixedTime = 41671.602685185190000000
          SecondsHandColor = clRed
          ShowMode = scAnalog
          Align = alRight
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          OnClick = TimerJvClockClick
        end
      end
      object PersonTabSheet: TTabSheet
        Caption = 'Person'
        ImageIndex = 2
        object PersonNameLabel2: TLabel
          Left = 4
          Top = 5
          Width = 31
          Height = 13
          Caption = 'Name:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object PersonSurnameLabel2: TLabel
          Left = 4
          Top = 24
          Width = 46
          Height = 13
          Caption = 'Surname:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object PersonSurnameLabel: TLabel
          Left = 74
          Top = 24
          Width = 120
          Height = 13
          Caption = 'PersonSurnameLabel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object PersonNameLabel: TLabel
          Left = 74
          Top = 5
          Width = 101
          Height = 13
          Caption = 'PersonNameLabel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object PersonPictureImage: TImage
          Left = 248
          Top = 0
          Width = 44
          Height = 44
          Align = alRight
        end
      end
      object UserTabSheet: TTabSheet
        Caption = ' User'
        ImageIndex = 3
        object UserAvatarImage: TImage
          Left = 248
          Top = 0
          Width = 44
          Height = 44
          Align = alRight
        end
        object UserUsernameLabel2: TLabel
          Left = 4
          Top = 5
          Width = 52
          Height = 13
          Caption = 'Username:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object UserPasswordLabel2: TLabel
          Left = 4
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Password:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object UserPasswordLabel: TLabel
          Left = 74
          Top = 24
          Width = 110
          Height = 13
          Caption = 'UserPasswordLabel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = cl3DLight
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object UserUsernameLabel: TLabel
          Left = 74
          Top = 5
          Width = 114
          Height = 13
          Caption = 'UserUsernameLabel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object MemberTabSheet: TTabSheet
        Caption = 'Member'
        ImageIndex = 4
        object MemberBadgeImage: TImage
          Left = 248
          Top = 0
          Width = 44
          Height = 44
          Align = alRight
        end
        object MemberMemberLabel2: TLabel
          Left = 4
          Top = 5
          Width = 42
          Height = 13
          Caption = 'Member:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object MemberMemberLabel: TLabel
          Left = 74
          Top = 5
          Width = 124
          Height = 13
          Caption = 'MemberMemberLabel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object MemberRoleLevelLabel2: TLabel
          Left = 4
          Top = 24
          Width = 60
          Height = 13
          Caption = 'Role / Level:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object MemberRoleLevelLabel: TLabel
          Left = 74
          Top = 24
          Width = 132
          Height = 13
          Caption = 'MemberRoleLevelLabel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object OrganizationTabSheet: TTabSheet
        Caption = 'Organization'
        ImageIndex = 5
        object OrganizationLogoImage: TImage
          Left = 248
          Top = 0
          Width = 44
          Height = 44
          Align = alRight
          Center = True
          Proportional = True
        end
        object OrganizationOrganizationLabel2: TLabel
          Left = 4
          Top = 5
          Width = 65
          Height = 13
          Caption = 'Organization:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object OrganizationNameLabel2: TLabel
          Left = 4
          Top = 24
          Width = 31
          Height = 13
          Caption = 'Name:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object OrganizationNameLabel: TLabel
          Left = 74
          Top = 24
          Width = 134
          Height = 13
          Caption = 'OrganizationNameLabel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object OrganizationOrganizationLabel: TLabel
          Left = 74
          Top = 5
          Width = 174
          Height = 13
          Caption = 'OrganizationOrganizationLabel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object TopPageControl2: TPageControl
      Left = 1160
      Top = 0
      Width = 120
      Height = 74
      ActivePage = ObjectTabSheet
      Align = alRight
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object ObjectTabSheet: TTabSheet
        Caption = 'Object'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        object ObjectIdDBText: TDBText
          AlignWithMargins = True
          Left = 0
          Top = 12
          Width = 64
          Height = 22
          Margins.Top = 12
          Margins.Right = 24
          Alignment = taCenter
          DataField = 'FldId'
          DataSource = ObjectDataSource
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          OnDblClick = ObjectIdDBTextDblClick
        end
        object ObjectKindDBText: TDBText
          Left = 0
          Top = -2
          Width = 64
          Height = 13
          Alignment = taCenter
          DataField = 'FldObjectKind'
          DataSource = ObjectDataSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object ObjectStateDBText: TDBText
          Left = 0
          Top = 31
          Width = 64
          Height = 13
          Alignment = taCenter
          DataField = 'FldState'
          DataSource = ObjectDataSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object ObjectImage2DBImage: TDBImage
          AlignWithMargins = True
          Left = 65
          Top = 0
          Width = 44
          Height = 44
          Margins.Left = 0
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alRight
          BorderStyle = bsNone
          DataField = 'FldImage'
          DataSource = ObjectDataSource
          Proportional = True
          ReadOnly = True
          Stretch = True
          TabOrder = 0
          OnDblClick = ObjectImage2DBImageDblClick
        end
      end
    end
  end
  object LeftPanel: TPanel
    Left = 0
    Top = 74
    Width = 300
    Height = 596
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'LeftPanel'
    ShowCaption = False
    TabOrder = 1
    object LeftPageControl: TPageControl
      Left = 0
      Top = 0
      Width = 300
      Height = 596
      ActivePage = ObjectTreeTabSheet
      Align = alClient
      TabOrder = 0
      object ObjectTreeTabSheet: TTabSheet
        Caption = 'Object'
        object ObjectNodeInfoLabel: TLabel
          Left = 0
          Top = 551
          Width = 292
          Height = 15
          Align = alBottom
          Alignment = taCenter
          Caption = 'ObjectNodeInfoLabel'
          ExplicitWidth = 113
        end
        object ObjectDTClientTree: TDTClientTree
          Left = 0
          Top = 25
          Width = 292
          Height = 526
          Align = alClient
          BorderStyle = bsNone
          Colors.BorderColor = 15987699
          Colors.DisabledColor = clGray
          Colors.DropMarkColor = 15385233
          Colors.DropTargetColor = 15385233
          Colors.DropTargetBorderColor = 15385233
          Colors.FocusedSelectionColor = 15385233
          Colors.FocusedSelectionBorderColor = 15385233
          Colors.GridLineColor = 15987699
          Colors.HeaderHotColor = clBlack
          Colors.HotColor = clBlack
          Colors.SelectionRectangleBlendColor = 15385233
          Colors.SelectionRectangleBorderColor = 15385233
          Colors.SelectionTextColor = clBlack
          Colors.TreeLineColor = 9471874
          Colors.UnfocusedColor = clGray
          Colors.UnfocusedSelectionColor = 14737632
          Colors.UnfocusedSelectionBorderColor = clGray
          DragMode = dmAutomatic
          Header.AutoSizeIndex = 0
          Header.MainColumn = -1
          Images = ObjectKindImageList16
          NodeDataSize = 4
          StateImages = ObjectStateImageList24
          TabOrder = 0
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoSort, toAutoTristateTracking, toAutoHideButtons, toAutoDeleteMovedNodes, toAutoChangeScale]
          OnClick = ObjectDTClientTreeClick
          OnCompareNodes = ObjectDTClientTreeCompareNodes
          OnPaintText = ObjectDTClientTreePaintText
          OnGetImageIndex = ObjectDTClientTreeGetImageIndex
          OnNodeClick = ObjectDTClientTreeNodeClick
          Touch.InteractiveGestures = [igPan, igPressAndTap]
          Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
          DataSource = ObjectDataSource
          DBTreeFields.KeyFieldName = 'FldId'
          DBTreeFields.ParentFieldName = 'FldPId'
          DBTreeFields.ListFieldName = 'FldObject'
          DBTreeFields.ParentOfRootValue = '0'
          DBTreeImages.HasChildrenImageIndex = -1
          DBTreeImages.HasChildrenSelectedIndex = -1
          DBTreeImages.NoChildrenImageIndex = -1
          DBTreeImages.NoChildrenSelectedIndex = -1
          UseFilter = True
          OnDBTreeCreateNode = ObjectDTClientTreeDBTreeCreateNode
          Columns = <>
        end
        object ObjectDBNavigator: TDBNavigator
          Left = 0
          Top = 0
          Width = 292
          Height = 25
          DataSource = ObjectDataSource
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
          Align = alTop
          Flat = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
    end
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 680
    Width = 1580
    Height = 140
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'BottomPanel'
    ShowCaption = False
    TabOrder = 2
    inline LogFrame: TLogFrame
      Left = 0
      Top = 0
      Width = 1580
      Height = 140
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitWidth = 1580
      inherited LogPageControl: TPageControl
        Width = 1580
        ExplicitWidth = 1580
        inherited OutputTabSheet: TTabSheet
          ExplicitWidth = 1572
          inherited OutputRichEdit: TRichEdit
            Width = 1570
            StyleElements = [seFont, seClient, seBorder]
            ExplicitWidth = 1570
          end
        end
        inherited LogTabSheet: TTabSheet
          inherited LogRichEdit: TRichEdit
            StyleElements = [seFont, seClient, seBorder]
          end
        end
        inherited SoapTabSheet: TTabSheet
          inherited SoapGridPanel: TGridPanel
            ControlCollection = <
              item
                Column = 1
                Control = LogFrame.SoapResponseLabel
                Row = 0
              end
              item
                Column = 0
                Control = LogFrame.SoapRequestRichEdit
                Row = 1
              end
              item
                Column = 0
                Control = LogFrame.SoapRequestLabel
                Row = 0
              end
              item
                Column = 1
                Control = LogFrame.SoapResponseRichEdit
                Row = 1
              end>
            StyleElements = [seFont, seClient, seBorder]
            inherited SoapResponseLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited SoapRequestRichEdit: TRichEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited SoapRequestLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited SoapResponseRichEdit: TRichEdit
              StyleElements = [seFont, seClient, seBorder]
            end
          end
        end
        inherited OptionTabSheet: TTabSheet
          inherited OptionOutputLineWidthMaxLabel: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited OptionOutputLinesMaxLabel: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited OptionOutputLineWidthMaxEdit: TEdit
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited OptionOutputLinesMaxEdit: TEdit
            StyleElements = [seFont, seClient, seBorder]
          end
        end
      end
      inherited LogToolBar: TToolBar
        inherited ClearToolButton: TToolButton
          ExplicitWidth = 43
        end
        inherited ClearAutoToolButton: TToolButton
          ExplicitWidth = 42
        end
        inherited WrapToolButton: TToolButton
          ExplicitWidth = 44
        end
      end
    end
  end
  object RightPanel: TPanel
    Left = 1280
    Top = 74
    Width = 300
    Height = 596
    Margins.Left = 0
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alRight
    BevelOuter = bvNone
    Caption = 'RightPanel'
    ShowCaption = False
    TabOrder = 3
    object RightPageControl: TPageControl
      Left = 0
      Top = 0
      Width = 300
      Height = 596
      ActivePage = PropertyTabSheet
      Align = alClient
      TabOrder = 0
      object PropertyTabSheet: TTabSheet
        Caption = 'Properties'
        object ObjectJvScrollMax: TJvScrollMax
          Left = 0
          Top = 0
          Width = 292
          Height = 566
          BorderWidth = 0
          Beveled = False
          ButtonFont.Charset = ANSI_CHARSET
          ButtonFont.Color = clWindowText
          ButtonFont.Height = -11
          ButtonFont.Name = 'Segoe UI'
          ButtonFont.Style = []
          AutoHeight = False
          ScrollBarWidth = 10
          OneExpanded = True
          Align = alClient
          BevelOuter = bvNone
          ParentColor = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object ObjectIdJvScrollMaxBand: TJvScrollMaxBand
            Width = 279
            Height = 21
            Expanded = False
            Caption = 'Ids'
            ExpandedHeight = 292
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object ObjectOrderLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 177
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Order'
              ExplicitWidth = 30
            end
            object ObjectRevLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 227
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Rev'
              ExplicitWidth = 19
            end
            object ObjectPIdLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 77
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'PId'
              ExplicitWidth = 17
            end
            object ObjectIdLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 27
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Id'
              ExplicitWidth = 10
            end
            object ObjectId8Label: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 127
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Id8'
              ExplicitWidth = 16
            end
            object ObjectOrderDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 198
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldOrder'
              DataSource = ObjectDataSource
              TabOrder = 0
            end
            object ObjectPIdDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 98
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldPId'
              DataSource = ObjectDataSource
              ReadOnly = True
              TabOrder = 1
            end
            object ObjectRevDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 248
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldRev'
              DataSource = ObjectDataSource
              TabOrder = 2
            end
            object ObjectIdDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 48
              Width = 247
              Height = 23
              Hint = 'Id'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clMoneyGreen
              DataField = 'FldId'
              DataSource = ObjectDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 3
            end
            object ObjectId8DBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 148
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldId8'
              DataSource = ObjectDataSource
              TabOrder = 4
            end
          end
          object ObjectDateJvScrollMaxBand: TJvScrollMaxBand
            Width = 279
            Height = 21
            Expanded = False
            Caption = 'Dates'
            ExpandedHeight = 163
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object ObjectCreatedLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 27
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Created'
              ExplicitWidth = 41
            end
            object ObjectCreatedDBText: TDBText
              AlignWithMargins = True
              Left = 16
              Top = 48
              Width = 247
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldCreated'
              DataSource = ObjectDataSource
              ExplicitTop = 47
              ExplicitWidth = 249
            end
            object ObjectUpdatedLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 71
              Width = 247
              Height = 15
              Hint = 'Set Updated field to current date and time'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Updated'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 45
            end
            object ObjectUpdatedDBText: TDBText
              AlignWithMargins = True
              Left = 16
              Top = 92
              Width = 247
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldUpdated'
              DataSource = ObjectDataSource
              ExplicitTop = 88
              ExplicitWidth = 249
            end
            object ObjectUpdatedByDBText: TDBText
              AlignWithMargins = True
              Left = 16
              Top = 136
              Width = 247
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldUpdatedBy'
              DataSource = ObjectDataSource
              ExplicitLeft = 56
              ExplicitTop = 177
              ExplicitWidth = 249
            end
            object ObjectUpdatedByLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 115
              Width = 247
              Height = 15
              Hint = 'Set Updated field to current date and time'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Updated by'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 61
            end
          end
          object ObjectFromJvScrollMaxBand: TJvScrollMaxBand
            Width = 279
            Height = 21
            Expanded = False
            Caption = 'From'
            ExpandedHeight = 292
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object ObjectFromOrganizationLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 27
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Organization'
              ExplicitWidth = 68
            end
            object ObjectFromMemberLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 227
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Member'
              ExplicitWidth = 45
            end
            object ObjectFromTeamLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 177
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Team'
              ExplicitWidth = 28
            end
            object ObjectFromAreaLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 127
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Area'
              ExplicitWidth = 24
            end
            object ObjectFromDepartmentLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 77
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Department'
              ExplicitWidth = 63
            end
            object ObjectFromOrganizationDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 48
              Width = 247
              Height = 23
              Hint = 'Organization'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldFromOrganization'
              DataSource = ObjectDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
            end
            object ObjectFromMemberDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 248
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldFromMember'
              DataSource = ObjectDataSource
              ReadOnly = True
              TabOrder = 1
            end
            object ObjectFromTeamDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 198
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldFromTeam'
              DataSource = ObjectDataSource
              ReadOnly = True
              TabOrder = 2
            end
            object ObjectFromAreaDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 148
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldFromArea'
              DataSource = ObjectDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 3
            end
            object ObjectFromDepartmentDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 98
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldFromDepartment'
              DataSource = ObjectDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 4
            end
          end
          object ObjectToJvScrollMaxBand: TJvScrollMaxBand
            Width = 279
            Height = 21
            Expanded = False
            Caption = 'To'
            ExpandedHeight = 341
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            DesignSize = (
              279
              21)
            object ObjectToOrganizationLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 27
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Organization'
              ExplicitWidth = 68
            end
            object ObjectToMemberLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 227
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Member'
              ExplicitWidth = 45
            end
            object ObjectToTeamLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 177
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Team'
              ExplicitWidth = 28
            end
            object ObjectToAreaLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 127
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Area'
              ExplicitWidth = 24
            end
            object ObjectToDepartmentLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 77
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Department'
              ExplicitWidth = 63
            end
            object ObjectJobGradeMinLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 277
              Width = 247
              Height = 15
              Hint = 
                'A two digit number, first indicate Function, second indicate exp' +
                'erience'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Job Grade Min'
              ExplicitWidth = 76
            end
            object ObjectJobGradeCalculateLabel: TLabel
              Left = 214
              Top = 277
              Width = 49
              Height = 15
              Anchors = [akTop, akRight]
              Caption = 'Calculate'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ObjectJobGradeCalculateLabelClick
              ExplicitLeft = 216
            end
            object ObjectToOrganizationDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 48
              Width = 247
              Height = 23
              Hint = 'Organization'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldToOrganization'
              DataSource = ObjectDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object ObjectToMemberDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 248
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldToMember'
              DataSource = ObjectDataSource
              TabOrder = 1
            end
            object ObjectToTeamDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 198
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldToTeam'
              DataSource = ObjectDataSource
              TabOrder = 2
            end
            object ObjectToAreaDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 148
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldToArea'
              DataSource = ObjectDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object ObjectToDepartmentDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 98
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldToDepartment'
              DataSource = ObjectDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
            end
            object ObjectJobGradeMinDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 298
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clBtnFace
              DataField = 'FldJobGradeMin'
              DataSource = ObjectDataSource
              DropDownCount = 26
              Items.Strings = (
                '0'
                '10'
                '11'
                '12'
                '13'
                '14'
                '20'
                '21'
                '22'
                '23'
                '24'
                '30'
                '31'
                '32'
                '33'
                '34'
                '40'
                '50'
                '60'
                '70'
                '71'
                '72'
                '73'
                '74'
                '80'
                '90')
              TabOrder = 5
            end
          end
          object ObjectApprovalJvScrollMaxBand: TJvScrollMaxBand
            Width = 279
            Height = 21
            Expanded = False
            Caption = 'Approval'
            ExpandedHeight = 92
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object ObjectRouteLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 27
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Route'
              ExplicitWidth = 31
            end
            object ObjectRouteDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 48
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldRoute'
              DataSource = ObjectDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
          end
          object ObjectImageJvScrollMaxBand: TJvScrollMaxBand
            Width = 279
            Height = 21
            Expanded = False
            Caption = 'Image'
            ExpandedHeight = 309
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object ObjectImageLoadLabel: TLabel
              Left = 16
              Top = 24
              Width = 23
              Height = 13
              Cursor = crHandPoint
              Caption = 'Load'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ObjectImageLoadLabelClick
            end
            object ObjectImageSaveLabel: TLabel
              Left = 53
              Top = 24
              Width = 24
              Height = 13
              Cursor = crHandPoint
              Caption = 'Save'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ObjectImageSaveLabelClick
            end
            object ObjectImageEditLabel: TLabel
              Left = 91
              Top = 24
              Width = 18
              Height = 13
              Cursor = crHandPoint
              Caption = 'Edit'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsUnderline]
              ParentFont = False
            end
            object ObjectImageFitLabel: TLabel
              Left = 157
              Top = 24
              Width = 12
              Height = 13
              Cursor = crHandPoint
              Caption = 'Fit'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ObjectImageFitLabelClick
            end
            object ObjectImageClearLabel: TLabel
              Left = 122
              Top = 24
              Width = 25
              Height = 13
              Cursor = crHandPoint
              Caption = 'Clear'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ObjectImageClearLabelClick
            end
            object ObjectImageDBImage: TDBImage
              AlignWithMargins = True
              Left = 16
              Top = 43
              Width = 247
              Height = 0
              Margins.Left = 16
              Margins.Top = 24
              Margins.Right = 16
              Margins.Bottom = 16
              Align = alClient
              DataField = 'FldImage'
              DataSource = ObjectDataSource
              TabOrder = 0
            end
          end
          object ObjectTypeJvScrollMaxBand: TJvScrollMaxBand
            Width = 279
            Height = 21
            Expanded = False
            Caption = 'Types'
            ExpandedHeight = 203
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object ObjectContentKindLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 82
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Content Type'
              ExplicitWidth = 70
            end
            object ObjectKindLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 27
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Object Type'
              ExplicitWidth = 62
            end
            object ObjectDataKindLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 137
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Data Type'
              ExplicitWidth = 51
            end
            object ObjectContentKindDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 103
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clBtnFace
              DataField = 'FldContentKind'
              DataSource = ObjectDataSource
              DropDownCount = 32
              TabOrder = 0
              OnChange = ObjectContentKindDBComboBoxChange
            end
            object ObjectKindDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 48
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clBtnFace
              DataField = 'FldObjectKind'
              DataSource = ObjectDataSource
              DropDownCount = 35
              TabOrder = 1
              OnChange = ObjectKindDBComboBoxChange
            end
            object ObjectDataKindDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 158
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clBtnFace
              DataField = 'FldDataKind'
              DataSource = ObjectDataSource
              DropDownCount = 32
              TabOrder = 2
              OnChange = ObjectDataKindDBComboBoxChange
            end
          end
          object ObjectGeneralJvScrollMaxBand: TJvScrollMaxBand
            Width = 279
            Height = 21
            Expanded = False
            Caption = 'General'
            ExpandedHeight = 284
            ButtonVisible = True
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonVisible = False
            ParentButtonFont = False
            object ObjectStateLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 22
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'State'
              ExplicitWidth = 26
            end
            object ObjectSpareLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 172
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Spare'
              ExplicitWidth = 29
            end
            object ObjectDescriptionLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 273
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Description'
              Visible = False
              ExplicitWidth = 60
            end
            object ObjectTitleLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 72
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Title'
              ExplicitWidth = 22
            end
            object ObjectSubtitleLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 122
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Subtitle'
              ExplicitWidth = 40
            end
            object ObjectStateDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 43
              Width = 247
              Height = 23
              Hint = 'State'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldState'
              DataSource = ObjectDataSource
              DropDownCount = 48
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object ObjectSpareDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 193
              Width = 247
              Height = 23
              Hint = 'Page'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldSpare'
              DataSource = ObjectDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object ObjectEncryptedDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 227
              Width = 247
              Height = 17
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Encrypted'
              DataField = 'FldEncrypted'
              DataSource = ObjectDataSource
              Enabled = False
              TabOrder = 2
            end
            object ObjectDescriptionDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 294
              Width = 247
              Height = 23
              Hint = 'Page'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldDescription'
              DataSource = ObjectDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              Visible = False
            end
            object ObjectPersinstentDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 250
              Width = 247
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Persist on disk'
              DataField = 'FldPersist'
              DataSource = ObjectDataSource
              TabOrder = 4
            end
            object ObjectTitleDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 93
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldTitle'
              DataSource = ObjectDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
            end
            object ObjectSubtitleDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 143
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldSubtitle'
              DataSource = ObjectDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
            end
          end
        end
      end
      object SearchTabSheet: TTabSheet
        Caption = 'Search'
        ImageIndex = 1
        object SearchFilterPanel: TPanel
          Left = 0
          Top = 0
          Width = 292
          Height = 137
          Align = alTop
          BevelOuter = bvNone
          Color = clWindow
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          DesignSize = (
            292
            137)
          object SearchLabel: TLabel
            Left = 8
            Top = 11
            Width = 35
            Height = 15
            Caption = 'Search'
          end
          object ReplaceLabel: TLabel
            Left = 8
            Top = 43
            Width = 41
            Height = 15
            Caption = 'Replace'
          end
          object SearchReplaceSwapLabel: TLabel
            Left = 8
            Top = 75
            Width = 28
            Height = 15
            Cursor = crHandPoint
            Hint = 'Swap search and replace values'
            Caption = 'Swap'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = SearchReplaceSwapLabelClick
          end
          object SearchInLabel: TLabel
            Left = 8
            Top = 107
            Width = 28
            Height = 15
            Hint = 'Object name is searched anyway'
            Caption = 'Do in'
          end
          object SearchButtonedEdit: TButtonedEdit
            Left = 64
            Top = 8
            Width = 221
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            AutoSelect = False
            AutoSize = False
            Images = ButtonedImageList
            LeftButton.Hint = 'Search'
            LeftButton.ImageIndex = 1
            LeftButton.Visible = True
            RightButton.Hint = 'Clear text'
            RightButton.ImageIndex = 0
            RightButton.Visible = True
            TabOrder = 0
            Text = 'SearchButtonedEdit'
            OnKeyUp = SearchButtonedEditKeyUp
            OnLeftButtonClick = SearchButtonedEditLeftButtonClick
            OnRightButtonClick = SearchButtonedEditRightButtonClick
          end
          object ReplaceButtonedEdit: TButtonedEdit
            Left = 64
            Top = 40
            Width = 221
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            AutoSelect = False
            AutoSize = False
            Images = ButtonedImageList
            LeftButton.Hint = 'Replace all'
            LeftButton.ImageIndex = 2
            LeftButton.Visible = True
            RightButton.Hint = 'Clear text'
            RightButton.ImageIndex = 0
            RightButton.Visible = True
            TabOrder = 1
            Text = 'ReplaceButtonedEdit'
            OnKeyUp = ReplaceButtonedEditKeyUp
            OnLeftButtonClick = ReplaceButtonedEditLeftButtonClick
            OnRightButtonClick = ReplaceButtonedEditRightButtonClick
          end
          object SearchMatchCaseCheckBox: TCheckBox
            Left = 64
            Top = 75
            Width = 97
            Height = 17
            Caption = 'Match Case'
            TabOrder = 2
          end
          object SearchWholeWordCheckBox: TCheckBox
            Left = 196
            Top = 75
            Width = 89
            Height = 17
            Caption = 'Whole Word'
            TabOrder = 3
          end
          object SearchInContentCheckBox: TCheckBox
            Left = 64
            Top = 107
            Width = 63
            Height = 17
            Caption = 'Content'
            TabOrder = 4
          end
          object SearchInDataCheckBox: TCheckBox
            Left = 140
            Top = 107
            Width = 45
            Height = 17
            Caption = 'Data'
            TabOrder = 5
          end
          object SearchInNoteCheckBox: TCheckBox
            Left = 195
            Top = 107
            Width = 47
            Height = 17
            Caption = 'Note'
            TabOrder = 6
          end
        end
        object SearchResultListBox: TListBox
          Left = 0
          Top = 137
          Width = 292
          Height = 429
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 15
          ParentFont = False
          TabOrder = 1
          OnClick = SearchResultListBoxClick
        end
      end
      object OptionTabSheet: TTabSheet
        Caption = 'Options'
        ImageIndex = 2
        object OptionJvScrollMax: TJvScrollMax
          Left = 0
          Top = 0
          Width = 292
          Height = 566
          Beveled = False
          ButtonFont.Charset = ANSI_CHARSET
          ButtonFont.Color = clWindowText
          ButtonFont.Height = -11
          ButtonFont.Name = 'Segoe UI'
          ButtonFont.Style = []
          AutoHeight = False
          ScrollBarWidth = 8
          ScrollBarVisible = False
          OneExpanded = True
          Align = alClient
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          object OptionDateTimeJvScrollMaxBand: TJvScrollMaxBand
            Width = 286
            Height = 21
            Expanded = False
            Caption = 'Date and Time'
            ExpandedHeight = 129
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            DesignSize = (
              286
              21)
            object OptionWeekWorkOneStartLabel: TLabel
              Left = 16
              Top = 36
              Width = 96
              Height = 15
              Caption = 'Work Week 1 Start'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object OptionWorkWeekDayLabel: TLabel
              Left = 15
              Top = 65
              Width = 83
              Height = 15
              Caption = 'Work Week Day'
            end
            object OptionWorkWeekTimeLabel: TLabel
              Left = 16
              Top = 94
              Width = 89
              Height = 15
              Caption = 'Work Week Time'
            end
            object OptionWeekWorkOneStartJvDateTimePicker: TJvDateTimePicker
              Left = 128
              Top = 33
              Width = 142
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              Date = 45007.000000000000000000
              Format = 'yyyy/MM/dd hh:mm:ss'
              Time = 0.791666666656965400
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = OptionWeekWorkOneStartJvDateTimePickerChange
              DropDownDate = 45007.000000000000000000
            end
            object OptionWorkWeekDayEdit: TEdit
              Left = 128
              Top = 62
              Width = 142
              Height = 23
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 1
              Text = 'OptionWorkWeekDayEdit'
            end
            object OptionWorkWeekTimeEdit: TEdit
              Left = 128
              Top = 91
              Width = 142
              Height = 23
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 2
              Text = 'OptionWorkWeekTimeEdit'
            end
          end
          object OptionInterfaceJvScrollMaxBand: TJvScrollMaxBand
            Width = 286
            Height = 21
            Expanded = False
            Caption = 'Interface'
            ExpandedHeight = 404
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            DesignSize = (
              286
              21)
            object OptionTabWidthLabel: TLabel
              Left = 16
              Top = 90
              Width = 51
              Height = 15
              Caption = 'Tab width'
            end
            object OptionStateDefaultLabel: TLabel
              Left = 16
              Top = 36
              Width = 66
              Height = 15
              Caption = 'Default state'
            end
            object OptionFontSizeLabel: TLabel
              Left = 16
              Top = 63
              Width = 46
              Height = 15
              Caption = 'Font size'
            end
            object OptionTextRightEdgeLabel: TLabel
              Left = 16
              Top = 117
              Width = 78
              Height = 15
              Caption = 'Text right edge'
            end
            object OptionTabWidthJvSpinEdit: TJvSpinEdit
              Left = 229
              Top = 87
              Width = 41
              Height = 23
              MaxValue = 8.000000000000000000
              MinValue = 4.000000000000000000
              Value = 4.000000000000000000
              Anchors = [akTop, akRight]
              TabOrder = 0
              OnChange = OptionTabWidthJvSpinEditChange
            end
            object OptionShowInTrayCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 235
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Show in tray icon'
              TabOrder = 1
            end
            object OptionMessageBeforeHideCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 258
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Inform before minimize/hide'
              TabOrder = 2
            end
            object OptionAlwaysOnTopCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 281
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Always on top'
              TabOrder = 3
            end
            object OptionAutoRunCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 143
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Top = 124
              Margins.Right = 16
              Align = alTop
              Caption = ' Auto run'
              TabOrder = 4
            end
            object OptionBackupOnExitCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 327
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Backup on exit'
              TabOrder = 5
            end
            object OptionAutoHideCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 189
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Auto hide'
              TabOrder = 6
            end
            object OptionPasswordOnMaximizeCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 304
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Ask password on maximize/unhide'
              TabOrder = 7
            end
            object OptionAutoRefreshCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 212
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Auto refresh (at startup)'
              TabOrder = 8
            end
            object OptionAutoLoginCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 166
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Auto login'
              TabOrder = 9
            end
            object OptionStateDefaultComboBox: TComboBox
              Left = 128
              Top = 33
              Width = 142
              Height = 23
              Anchors = [akTop, akRight]
              TabOrder = 10
              Text = 'OptionStateDefaultComboBox'
              Items.Strings = (
                'Active'
                'Testing')
            end
            object OptionCommentRemoveCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 350
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Remove Comment (if code)'
              TabOrder = 11
            end
            object OptionFontSizeJvSpinEdit: TJvSpinEdit
              Left = 229
              Top = 60
              Width = 41
              Height = 23
              MaxValue = 24.000000000000000000
              MinValue = 8.000000000000000000
              Value = 9.000000000000000000
              Anchors = [akTop, akRight]
              TabOrder = 12
              OnChange = OptionFontSizeJvSpinEditChange
            end
            object OptionVerboseCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 373
              Width = 254
              Height = 17
              Hint = 'Show addtional info in the log panel'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Verbose messages'
              TabOrder = 13
            end
            object OptionTextRightEdgeComboBox: TComboBox
              Left = 197
              Top = 114
              Width = 73
              Height = 23
              TabOrder = 14
              Text = 'OptionTextRightEdgeComboBox'
              OnChange = OptionTextRightEdgeComboBoxChange
              Items.Strings = (
                '8'
                '16'
                '32'
                '64'
                '80'
                '128'
                '256'
                '512'
                '1024')
            end
          end
          object OptionFoldersJvScrollMaxBand: TJvScrollMaxBand
            Width = 286
            Height = 21
            Expanded = False
            Caption = 'Folders'
            ExpandedHeight = 97
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            DesignSize = (
              286
              21)
            object OptionPersistRootFolderLabel: TLabel
              Left = 16
              Top = 36
              Width = 93
              Height = 15
              Caption = 'Persist root folder'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object OptionTempFolderLabel: TLabel
              Left = 16
              Top = 63
              Width = 63
              Height = 15
              Caption = 'Temp folder'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object OptionPersistRootFolderEdit: TEdit
              Left = 128
              Top = 33
              Width = 142
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = 'OptionPersistRootFolderEdit'
            end
            object OptionTempFolderEdit: TEdit
              Left = 128
              Top = 60
              Width = 142
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Text = 'OptionTempFolderEdit'
            end
          end
          object OptionSecurityJvScrollMaxBand: TJvScrollMaxBand
            Width = 286
            Height = 21
            Expanded = False
            Caption = 'Security'
            ExpandedHeight = 70
            ButtonVisible = True
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonVisible = False
            ParentButtonFont = False
            DesignSize = (
              286
              21)
            object OptionCryptoKeyLabel: TLabel
              Left = 16
              Top = 36
              Width = 58
              Height = 15
              Margins.Right = 16
              Caption = 'Crypto Key'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object OptionCryptoKeyEdit: TEdit
              Left = 128
              Top = 33
              Width = 142
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              MaxLength = 5
              NumbersOnly = True
              ParentFont = False
              TabOrder = 0
              Text = 'OptionCryptoKeyEdit'
            end
          end
          object OptionShowJvScrollMaxBand: TJvScrollMaxBand
            Width = 286
            Height = 21
            Expanded = False
            Caption = 'Show'
            ExpandedHeight = 92
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object OptionFoldingLineShowCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 58
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Show folding division line'
              TabOrder = 0
              OnClick = OptionFoldingLineShowCheckBoxClick
            end
            object OptionTextBoxInfoShowCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 35
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Show text boxes infos'
              TabOrder = 1
              OnClick = OptionTextBoxInfoShowCheckBoxClick
            end
          end
          object OptionPythonJvScrollMaxBand: TJvScrollMaxBand
            Width = 286
            Height = 21
            Expanded = False
            Caption = 'Python'
            ExpandedHeight = 207
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object OptionPythonVersionLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 35
              Width = 254
              Height = 15
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Version'
              ExplicitWidth = 38
            end
            object OptionPythonEnvInitSpeedButton: TSpeedButton
              AlignWithMargins = True
              Left = 16
              Top = 173
              Width = 254
              Height = 22
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Initialize Environment'
              Flat = True
              Glyph.Data = {
                52030000424D5203000000000000520200002800000010000000100000000100
                08000000000000010000C30E0000C30E00008700000087000000FFFFFF00E7F3
                E500B7DFB30098D49400B2E1B500F2F9F300FEFEFE00A3D69B004BB33A004BB4
                3B004BB53C0046B43B0050B14900CAE6CD00FDFEFD00F4F9F500B9DEB2004AB4
                3A0047B33C0096D18F00AADBA30060BC520047B43A0042B244006BC2600043B9
                540075C3660048B43B0089D29300ECF5EA0053B744004CB53B004AB63A0057C0
                6300F1F8F000A4D4A300B4DBAF00F6FAF600A3D59A004DB43D004CB53C004AB5
                3A0080C68200EEF6EB00A6D79D006FC063004FB53F0032B13900E4F3E70091CD
                85006BC05E004FB43F0047B437009DD1A000DBEED7005BBA4D004BB53B003EB4
                3B00A9DDB100F8FBF800E0EFDD00CEE7CE00ECF5ED00CFE9CB0049B43B0048B4
                3A007BC27B00A9D7A20049B63A0058BD67008FCE86004AB539005CB85A006BBF
                5F0068BE6F00D0E9CB0030B43B00DDF3E1007BC66F0047B43C0090D59C00FBFD
                FB0050B53D0037B63B00B7E7C30081C8760047B53C0073CC8400AAD9A30082D1
                8D00EDF6EB004CB43B003BB33A00CEE9D300B1DBAA004AB6390044B13F00D0E8
                D100B2DDAD0050B65400F9FCF90089CB7E0049B4390054B45000FCFDFC00F7FB
                F60066BF590047B23E0079C57200A8D8AC00D0E9CC004EB63D004AB63B004AB4
                3C0059B84A004AB53B0048B23C00C3E0C100E7F4E60072C365004FB859004BB5
                3A004AB53C0054B6450078C56F00CFE8CE00E1F0DE00CAE7C500EEF7EF0099D0
                900039AF3A00EEF7EE009ED4950056BC5C00F3F9F40000000000000000000684
                8586000000000000000E7E7F80068138828300000000000076772947782C797A
                097B7C7D000000696A386B6C6D6E6F70717273747500005E5F60610000006229
                6364656667680055565700000000005859005A5B5C5D004E4F50000000000000
                00005152535400464748494A0000000000004B294C4D003F4009414200000000
                0000434445063637380A393A00000000003B3C3D3E002B2C2D2E2F3000000E31
                323334350000000000222324250000262728292A0000000000001A1B1C00001D
                1E1F202100000000000010111213141516171819000000000000060708090A0B
                0C0D0E0F000000000000000001020304050000000000}
              OnClick = OptionPythonEnvInitSpeedButtonClick
              ExplicitLeft = 6
              ExplicitTop = 99
              ExplicitWidth = 184
            end
            object OptionPythonExePathLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 90
              Width = 254
              Height = 15
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Exe path'
              ExplicitWidth = 45
            end
            object OptionPythonRawOutputCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 145
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Raw output'
              TabOrder = 0
              OnClick = OptionPythonRawOutputCheckBoxClick
            end
            object OptionPythonVersionComboBox: TComboBox
              AlignWithMargins = True
              Left = 16
              Top = 56
              Width = 254
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Style = csDropDownList
              TabOrder = 1
              OnChange = OptionPythonVersionComboBoxChange
            end
            object OptionPythonExePathEdit: TEdit
              AlignWithMargins = True
              Left = 16
              Top = 111
              Width = 254
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              TabOrder = 2
              Text = 'OptionPythonExePathEdit'
            end
          end
          object OptionFilesJvScrollMaxBand: TJvScrollMaxBand
            Width = 286
            Height = 21
            Expanded = False
            Caption = 'Files'
            ExpandedHeight = 274
            Beveled = False
            DesignSize = (
              286
              21)
            object OptionFilesWorkingFolderLabel: TLabel
              Left = 16
              Top = 238
              Width = 79
              Height = 15
              Caption = 'Working folder'
            end
            object OptionFilesOnDoubleClickLabel: TLabel
              Left = 16
              Top = 209
              Width = 83
              Height = 15
              Caption = 'On double click'
            end
            object OptionFilesWorkingFolderClearLabel: TLabel
              Left = 243
              Top = 239
              Width = 27
              Height = 15
              Anchors = [akTop, akRight]
              Caption = 'Clear'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = OptionFilesWorkingFolderClearLabelClick
            end
            object OptionFilesWorkingFolderUseCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 173
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 
                'Use working folder for download or check-out (otherwise use the ' +
                'original path)'
              TabOrder = 0
            end
            object OptionFilesOpenAfterChechOutCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 104
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Open file after download or check-out'
              TabOrder = 1
            end
            object OptionFilesLocalFileOverrideAskCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 58
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Ask before override local file'
              TabOrder = 2
            end
            object OptionFilesReadOnlyDownloadedFileCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 81
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Read-only downloaded files'
              TabOrder = 3
            end
            object OptionFilesBackupBeforeCheckInCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 150
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Backup local file before upload or check-in'
              TabOrder = 4
            end
            object OptionFilesDeleteAfterUploadCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 127
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Delete local file after upload or check-in'
              TabOrder = 5
            end
            object OptionFilesOnDoubleClickComboBox: TComboBox
              Left = 109
              Top = 206
              Width = 84
              Height = 23
              ItemIndex = 0
              TabOrder = 6
              Text = 'Download'
              Items.Strings = (
                'Download'
                'CheckOut')
            end
            object OptionFilesWorkingFolderSelectButtonedEdit: TButtonedEdit
              Left = 109
              Top = 235
              Width = 124
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              DoubleBuffered = False
              Images = ButtonedImageList
              ParentDoubleBuffered = False
              RightButton.ImageIndex = 3
              RightButton.Visible = True
              TabOrder = 7
              Text = 'OptionFilesWorkingFolderSelectButtonedEdit'
              OnRightButtonClick = OptionFilesWorkingFolderSelectButtonedEditRightButtonClick
            end
            object OptionFilesShowOnlyMyFilesCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 35
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Show only my files'
              Enabled = False
              TabOrder = 8
            end
          end
        end
      end
      object WordTabSheet: TTabSheet
        Caption = 'Words'
        ImageIndex = 5
        OnHide = WordTabSheetHide
        OnShow = WordTabSheetShow
      end
    end
  end
  object StatusBar: TStatusBar
    AlignWithMargins = True
    Left = 3
    Top = 820
    Width = 1574
    Height = 19
    Margins.Top = 0
    Panels = <
      item
        Text = 'Row : 0 , Col : 0 , Selection : 0 , Bytes : 0'
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object MainPanel: TPanel
    Left = 310
    Top = 74
    Width = 907
    Height = 596
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'MainPanel'
    ShowCaption = False
    TabOrder = 5
    object MainPageControl: TPageControl
      Left = 0
      Top = 0
      Width = 907
      Height = 596
      ActivePage = ObjectDataTabSheet
      Align = alClient
      TabOrder = 0
      StyleName = 'Windows'
      object ObjectContentPrevTabSheet: TTabSheet
        Caption = 'Previous'
        ImageIndex = 3
        object ObjectContentPrevDBSynEdit: TDBSynEdit
          Left = 0
          Top = 28
          Width = 899
          Height = 538
          Cursor = crIBeam
          DataField = 'FldContentPrev'
          DataSource = ObjectDataSource
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Consolas'
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          OnKeyUp = ObjectContentPrevDBSynEditKeyUp
          OnMouseUp = ObjectContentPrevDBSynEditMouseUp
          BorderStyle = bsNone
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Consolas'
          Gutter.Font.Style = []
          Gutter.Font.Quality = fqClearTypeNatural
          Gutter.Bands = <
            item
              Kind = gbkMarks
              Width = 13
            end
            item
              Kind = gbkLineNumbers
            end
            item
              Kind = gbkFold
            end
            item
              Kind = gbkTrackChanges
            end
            item
              Kind = gbkMargin
              Width = 3
            end>
          OnChange = ObjectContentPrevDBSynEditChange
        end
        object ObjectContentPrevTopPanel: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 898
          Height = 28
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 1
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Caption = 'ObjectContentPrevTopPanel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          ShowCaption = False
          TabOrder = 1
          object ObjectContentPrevSaveSpeedButton: TSpeedButton
            AlignWithMargins = True
            Left = 16
            Top = 3
            Width = 53
            Height = 22
            Margins.Left = 16
            Align = alLeft
            Caption = 'Save'
            Flat = True
            OnClick = ObjectContentPrevSaveSpeedButtonClick
          end
          object ObjectContentPrevCharCountLabel: TLabel
            AlignWithMargins = True
            Left = 703
            Top = 3
            Width = 187
            Height = 22
            Margins.Right = 8
            Align = alRight
            Caption = 'ObjectContentPrevCharCountLabel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitHeight = 15
          end
        end
      end
      object ObjectContentTabSheet: TTabSheet
        Caption = 'Content'
        object ObjectContentSplitter: TSplitter
          Left = 689
          Top = 28
          Width = 10
          Height = 538
          Align = alRight
          ExplicitLeft = 341
          ExplicitHeight = 535
        end
        object ObjectContentTopPanel: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 898
          Height = 28
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 1
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Caption = 'ObjectContentTopPanel'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object ObjectContentCharCountLabel: TLabel
            AlignWithMargins = True
            Left = 698
            Top = 3
            Width = 164
            Height = 22
            Margins.Right = 8
            Align = alRight
            Caption = 'ObjectContentCharCountLabel'
            Layout = tlCenter
            ExplicitHeight = 15
          end
          object ObjectDescriptionShowSpeedButton: TSpeedButton
            AlignWithMargins = True
            Left = 873
            Top = 3
            Width = 22
            Height = 22
            Hint = 'Show Description text box'
            Align = alRight
            AllowAllUp = True
            GroupIndex = 1
            Caption = '+'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = ObjectDescriptionShowSpeedButtonClick
            ExplicitLeft = 527
            ExplicitTop = 0
          end
          object ObjectDBEdit: TDBEdit
            AlignWithMargins = True
            Left = 35
            Top = 3
            Width = 657
            Height = 22
            Margins.Left = 35
            Align = alClient
            BorderStyle = bsNone
            DataField = 'FldObject'
            DataSource = ObjectDataSource
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            TabOrder = 0
            OnKeyPress = ObjectDBEditKeyPress
          end
        end
        object ObjectContentSplitView: TSplitView
          Left = 699
          Top = 28
          Width = 200
          Height = 538
          OpenedWidth = 200
          Placement = svpRight
          TabOrder = 1
          UseAnimation = False
          object ObjectContentEdgeBrowser: TEdgeBrowser
            Left = 0
            Top = 0
            Width = 200
            Height = 538
            Align = alClient
            TabOrder = 0
            AllowSingleSignOnUsingOSPrimaryAccount = False
            TargetCompatibleBrowserVersion = '117.0.2045.28'
            UserDataFolder = '%LOCALAPPDATA%\bds.exe.WebView2'
            OnCreateWebViewCompleted = ObjectContentEdgeBrowserCreateWebViewCompleted
          end
        end
        object ObjectContentLeftPanel: TPanel
          Left = 0
          Top = 28
          Width = 689
          Height = 538
          Align = alClient
          BevelOuter = bvNone
          Caption = 'ObjectContentLeftPanel'
          ShowCaption = False
          TabOrder = 2
          object ObjectDescriptionSplitter: TSplitter
            Left = 0
            Top = 108
            Width = 689
            Height = 10
            Cursor = crVSplit
            Align = alTop
            ExplicitLeft = 14
            ExplicitTop = 124
            ExplicitWidth = 732
          end
          object ObjectContentDBSynEdit: TDBSynEdit
            Left = 0
            Top = 118
            Width = 689
            Height = 420
            Cursor = crIBeam
            DataField = 'FldContent'
            DataSource = ObjectDataSource
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Consolas'
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentColor = False
            ParentFont = False
            PopupMenu = SynEditContentPopup
            TabOrder = 0
            OnDragOver = ObjectContentDBSynEditDragOver
            OnKeyUp = ObjectContentDBSynEditKeyUp
            OnMouseDown = ObjectContentDBSynEditMouseDown
            OnMouseMove = ObjectContentDBSynEditMouseMove
            OnMouseUp = ObjectContentDBSynEditMouseUp
            BorderStyle = bsNone
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Consolas'
            Gutter.Font.Style = []
            Gutter.Font.Quality = fqClearTypeNatural
            Gutter.Bands = <
              item
                Kind = gbkMarks
                Width = 13
              end
              item
                Kind = gbkLineNumbers
              end
              item
                Kind = gbkFold
              end
              item
                Kind = gbkTrackChanges
              end
              item
                Kind = gbkMargin
                Width = 3
              end>
            OnChange = ObjectContentDBSynEditChange
            OnStatusChange = ObjectContentDBSynEditStatusChange
          end
          object ObjectDescriptionDBSynEdit: TDBSynEdit
            Left = 0
            Top = 0
            Width = 689
            Height = 108
            Cursor = crIBeam
            DataField = 'FldDescription'
            DataSource = ObjectDataSource
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -13
            Font.Name = 'Consolas'
            Font.Style = [fsItalic]
            Font.Quality = fqClearTypeNatural
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            BorderStyle = bsNone
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Consolas'
            Gutter.Font.Style = []
            Gutter.Font.Quality = fqClearTypeNatural
            Gutter.Bands = <
              item
                Kind = gbkMarks
                Width = 13
              end
              item
                Kind = gbkLineNumbers
              end
              item
                Kind = gbkFold
              end
              item
                Kind = gbkTrackChanges
              end
              item
                Kind = gbkMargin
                Width = 3
              end>
          end
        end
      end
      object ObjectDataTabSheet: TTabSheet
        Caption = ' Data'
        ImageIndex = 1
        object ObjectDataDBSynEdit: TDBSynEdit
          Left = 0
          Top = 28
          Width = 899
          Height = 538
          Cursor = crIBeam
          DataField = 'FldData'
          DataSource = ObjectDataSource
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Consolas'
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          OnKeyUp = ObjectDataDBSynEditKeyUp
          OnMouseUp = ObjectDataDBSynEditMouseUp
          BorderStyle = bsNone
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Consolas'
          Gutter.Font.Style = []
          Gutter.Font.Quality = fqClearTypeNatural
          Gutter.Bands = <
            item
              Kind = gbkMarks
              Width = 13
            end
            item
              Kind = gbkLineNumbers
            end
            item
              Kind = gbkFold
            end
            item
              Kind = gbkTrackChanges
            end
            item
              Kind = gbkMargin
              Width = 3
            end>
          OnChange = ObjectDataDBSynEditChange
        end
        object ObjectDataTopPanel: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 898
          Height = 28
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 1
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Caption = 'JsonTopPanel'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
          object ObjectDataCharCountLabel: TLabel
            AlignWithMargins = True
            Left = 745
            Top = 3
            Width = 145
            Height = 22
            Margins.Right = 8
            Align = alRight
            Caption = 'ObjectDataCharCountLabel'
            Layout = tlCenter
            ExplicitHeight = 15
          end
          object ObjectDataValidateSpeedButton: TSpeedButton
            AlignWithMargins = True
            Left = 16
            Top = 3
            Width = 53
            Height = 22
            Margins.Left = 16
            Align = alLeft
            Caption = 'Validate'
            Flat = True
            OnClick = ObjectDataValidateSpeedButtonClick
          end
        end
      end
      object ObjectNoteTabSheet: TTabSheet
        Caption = '  Note'
        ImageIndex = 2
        object ObjectNoteDBSynEdit: TDBSynEdit
          Left = 0
          Top = 28
          Width = 899
          Height = 538
          Cursor = crIBeam
          DataField = 'FldNote'
          DataSource = ObjectDataSource
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Consolas'
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          OnKeyUp = ObjectNoteDBSynEditKeyUp
          OnMouseUp = ObjectNoteDBSynEditMouseUp
          BorderStyle = bsNone
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Consolas'
          Gutter.Font.Style = []
          Gutter.Font.Quality = fqClearTypeNatural
          Gutter.Bands = <
            item
              Kind = gbkMarks
              Width = 13
            end
            item
              Kind = gbkLineNumbers
            end
            item
              Kind = gbkFold
            end
            item
              Kind = gbkTrackChanges
            end
            item
              Kind = gbkMargin
              Width = 3
            end>
          OnChange = ObjectNoteDBSynEditChange
        end
        object ObjectNoteTopPanel: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 898
          Height = 28
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 1
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Caption = 'ObjectNoteTopPanel'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
          object ObjectNoteCharCountLabel: TLabel
            AlignWithMargins = True
            Left = 743
            Top = 3
            Width = 147
            Height = 22
            Margins.Right = 8
            Align = alRight
            Caption = 'ObjectNoteCharCountLabel'
            Layout = tlCenter
            ExplicitHeight = 15
          end
        end
      end
      object FilesRioTabSheet: TTabSheet
        Caption = '  Files'
        ImageIndex = 4
        OnShow = FilesRioTabSheetShow
        object FilesRioTopPanel: TPanel
          Left = 0
          Top = 0
          Width = 899
          Height = 46
          Align = alTop
          BevelOuter = bvNone
          Caption = 'FilesRioTopPanel'
          ShowCaption = False
          TabOrder = 0
          object FilesRioInfoLabel: TLabel
            AlignWithMargins = True
            Left = 704
            Top = 12
            Width = 187
            Height = 31
            Margins.Top = 12
            Margins.Right = 8
            Align = alRight
            Caption = 'FilesRioInfoLabel'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitHeight = 22
          end
          object FilesRioToolBar: TToolBar
            Left = 0
            Top = 0
            Width = 915
            Height = 46
            Align = alLeft
            AutoSize = True
            ButtonHeight = 46
            ButtonWidth = 61
            Caption = 'FilesRioToolBar'
            Images = FilesRioImageList24
            ShowCaptions = True
            TabOrder = 0
            object FilesRioRefreshToolButton: TToolButton
              Left = 0
              Top = 0
              Action = FilesRioRefreshAction
            end
            object FilesRioDownloadToolButton: TToolButton
              Left = 61
              Top = 0
              Action = FilesRioDownloadAction
            end
            object FilesRioUploadToolButton: TToolButton
              Left = 122
              Top = 0
              Action = FilesRioUploadAction
            end
            object FilesRioCheckOutToolButton: TToolButton
              Left = 183
              Top = 0
              Action = FilesRioCheckOutAction
            end
            object FilesRioCheckOutCancelToolButton: TToolButton
              Left = 244
              Top = 0
              Action = FilesRioCheckOutCancelAction
            end
            object FilesRioCheckInToolButton: TToolButton
              Left = 305
              Top = 0
              Action = FilesRioCheckInAction
            end
            object FilesRioSearchToolButton: TToolButton
              Left = 366
              Top = 0
              Action = FilesRioSearchAction
            end
            object FilesRioHttpLinkToolButton: TToolButton
              Left = 427
              Top = 0
              Action = FilesRioHttpLinkAction
            end
            object FilesRioMoveToolButton: TToolButton
              Left = 488
              Top = 0
              Action = FilesRioMoveAction
            end
            object FilesRioOwnershipTakeToolButton: TToolButton
              Left = 549
              Top = 0
              Action = FilesRioOwnershipTakeAction
            end
            object FilesRioPropertiesToolButton: TToolButton
              Left = 610
              Top = 0
              Action = FilesRioPropertiesAction
            end
            object FilesRioDeleteToolButton: TToolButton
              Left = 671
              Top = 0
              Action = FilesRioDeleteAction
            end
            object FilesRioLocalClearToolButton: TToolButton
              Left = 732
              Top = 0
              Action = FilesLocalDeleteAction
            end
            object FilesRioLocalOpenToolButton: TToolButton
              Left = 793
              Top = 0
              Action = FilesLocalOpenAction
            end
            object FilesRioWorkingFolderlOpenToolButton: TToolButton
              Left = 854
              Top = 0
              Action = FilesLocalFolderOpenAction
            end
          end
        end
        object FilesRioTree: TVirtualStringTree
          Left = 0
          Top = 46
          Width = 899
          Height = 520
          Align = alClient
          BorderStyle = bsNone
          BorderWidth = 4
          Header.AutoSizeIndex = 0
          Header.MainColumn = -1
          Images = FileKindImageList24
          PopupMenu = FilesRioPopup
          TabOrder = 1
          OnChange = FilesRioTreeChange
          OnClick = FilesRioTreeClick
          OnDblClick = FilesRioTreeDblClick
          OnEditCancelled = FilesRioTreeEditCancelled
          OnEdited = FilesRioTreeEdited
          OnEditing = FilesRioTreeEditing
          OnFocusChanged = FilesRioTreeFocusChanged
          OnFreeNode = FilesRioTreeFreeNode
          OnGetText = FilesRioTreeGetText
          OnPaintText = FilesRioTreePaintText
          OnGetImageIndex = FilesRioTreeGetImageIndex
          OnGetNodeDataSize = FilesRioTreeGetNodeDataSize
          OnInitNode = FilesRioTreeInitNode
          OnNewText = FilesRioTreeNewText
          OnNodeClick = FilesRioTreeNodeClick
          OnNodeDblClick = FilesRioTreeNodeDblClick
          Touch.InteractiveGestures = [igPan, igPressAndTap]
          Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
          Columns = <>
        end
      end
    end
  end
  object ClientImageList24: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 376
    Top = 152
    Bitmap = {
      494C010106001100040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000003000000001002000000000000048
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000011E01C52555
      25FF255525FF011E01C500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000101016D090909F3090909F3070707EE090909F30101016D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000062306C588B6
      88FF88B688FF062306C500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      016D0A0A0AF79CC69CFF729C72FF9CC69CFF729C72FF070707EB0101016D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000010025061206811B481BF886B3
      86FF86B386FF1B481BF806120681000100250000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      08E49CC69CFF729C72FF9CC69CFF729C72FF9CC69CFF729C72FF090909F80000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000030047305A30F1649564FF87B287FF88B5
      88FF88B588FF88B588FF669566FF305A30F10003004700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000A0A
      0AED729C72FF9CC69CFF729C72FF9CC69CFF729C72FF9CC69CFF080808F10000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000002003D335733E686B086FF87B287FF82B082FF85B5
      85FF85B585FF8BB28BFF8CB58CFF8CB78CFF355A35E60002003D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000A0A
      0AF69CC69CFF729C72FF9CC69CFF729C72FF9CC69CFF729C72FF090909F90000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000030816088A679867FF86B086FF709B70FF0E290EBF0016
      00AD001600AD0E290EBF79A779FF8BB98BFF6D9A6DFF0816088A000000030000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000101016D0202
      02D1729C72FF9CC69CFF729C72FF9CC69CFF729C72FF9CC69CFF090909F40000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000082A5A2AFF88B688FF74A074FF112811B3000000160000
      00000000000000000016142C14B378A578FF8EB78EFF2D5B2DFF000000080000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000101016D070707D9729C
      72FF9CC69CFF729C72FF9CC69CFF729C72FF9CC69CFF0A0A0AF70101016D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000001010601530B2A0BCE061C06AB0000000D000000000000
      00000000000000000000000C008470A170FF8AB88AFF2F5E2FFF000000080000
      0000000000000000000000000000000000000000000000000000000000000000
      00000101016D0B0B0BF6080808F8090909FB090909F9070707D9716CFFFF9CC6
      9CFF729C72FF0A0A0AF10C0C0CF1080808E9080808E40101016D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000001C173117BF7BA77BFF8EBA8EFF2C5C2CFF000000080000
      0000000000000000000000000000000000000000000000000000000000000101
      016D080808DE716CFFFF9E9EFFFF716CFFFF9E9EFFFF716CFFFF9E9EFFFF716C
      FFFF070707D90000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000F01090168062306C50623
      06C5062306C5163616D27AA67AFF89B789FF689568FF05100579000000020000
      0000000000000000000000000000000000000000000000000000000000000B0B
      0BF9716CFFFF9E9EFFFF716CFFFF9E9EFFFF716CFFFF9E9EFFFF090909FE0202
      028C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000020037265126EF5F8C5FFF86B286FF89B7
      89FF89B789FF8AB48AFF90B990FF8AB68AFF2D4E2DDC00020035000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      08FB9E9EFFFF716CFFFF9E9EFFFF716CFFFF9E9EFFFF716CFFFF0A0A0AF40000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000200352D4E2DDC8AB68AFF8EB88EFF87B387FF89B7
      89FF89B789FF8DB68DFF608D60FF265126EF0002003700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      08FC716CFFFF9E9EFFFF716CFFFF9E9EFFFF716CFFFF9E9EFFFF0A0A0AF40000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000205100579689568FF89B789FF7AA67AFF163616D20623
      06C5062306C5062306C5010901680000000F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000A0A
      0AF59E9EFFFF716CFFFF9E9EFFFF716CFFFF9E9EFFFF716CFFFF090909FC0303
      0398000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000082C5C2CFF8EBA8EFF7BA77BFF173117BF0000001C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      016D090909FB9E9EFFFF716CFFFF9E9EFFFF716CFFFF9E9EFFFF9E9EFFFF716C
      FFFF070707D90000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000082F5E2FFF8AB88AFF70A170FF000C0084000000000000
      000000000000000000000000000D061C06AB0B2A0BCE01060153000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      00000101016D080808ED0C0C0CF90C0C0CF80A0A0AF5070707D9716CFFFF59CE
      E7FF419CB5FF090909F10A0A0AF10A0A0AF10B0B0BED0101016D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000082D5B2DFF8EB78EFF76A276FF112811B3000000160000
      00000000000000000016112811B374A074FF88B688FF2A5A2AFF000000080000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000101016D070707D9419C
      B5FF59CEE7FF419CB5FF59CEE7FF419CB5FF59CEE7FF090909F80101016D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000030816088A6D9A6DFF89B789FF75A175FF0E290EBF0016
      00AD001600AD0E290EBF709B70FF86B086FF679867FF0816088A000000030000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000101016D0909
      09F9419CB5FF59CEE7FF419CB5FF59CEE7FF419CB5FF59CEE7FF090909F60000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000002003D355A35E68CB78CFF8CB58CFF8BB28BFF89B5
      89FF89B589FF82B082FF87B287FF86B086FF335733E60002003D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000909
      09F359CEE7FF419CB5FF59CEE7FF419CB5FF59CEE7FF419CB5FF080808F60000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000030047305A30F1669566FF88B588FF88B6
      88FF88B688FF87B287FF649564FF305A30F10003004700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000B0B
      0BED419CB5FF59CEE7FF419CB5FF59CEE7FF419CB5FF59CEE7FF080808F20000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000010025061206811B481BF886B3
      86FF86B386FF1B481BF806120681000100250000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      08E259CEE7FF419CB5FF59CEE7FF419CB5FF59CEE7FF419CB5FF090909F90000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000062306C588B6
      88FF88B688FF062306C500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      016D090909F259CEE7FF419CB5FF59CEE7FF419CB5FF080808F20101016D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000011E01C52555
      25FF255525FF011E01C500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000101016D0A0A0AEF090909F8090909F70A0A0AF70101016D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7F7F700FFFFFF00F7F7F700FFFFFF00F7F7
      F700FFFFFF00F7F7F700FFFFFF00F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F7F7F700080808000000000008080800000000000808
      080008080800080808000000000008080800F7F7F70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7E7EF00F7E7E700EFE7E700EFDE
      E700EFDEE700EFDEDE00E7DEDE00E7DEDE00E7D6DE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000376437003663
      360036633600C0C0C000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000303059FF3030
      59FF303059FF59CEE7FFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700080808000000A5000808AD000000A5000808AD000000
      A5000808AD000000A5000808AD000000A50008080800F7F7F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B5A63007B5A63007B5A63007B5A63007B5A
      63007B5A63007B5A63007B5A63007B5A6300E7DEDE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039673900D6E7D500B3D1
      B300B3D1B30036633600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF49AD
      C6FF62C6DEFF303059FFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F700080808000000A5006B6BBD005A5AB5006B6BBD005A5AB5006B6B
      BD005A5AB5006B6BBD005A5AB5006B6BBD000000A50008080800F7F7F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B5A6300EFDEE700EFDEE700D6BDC600D6BD
      C600D6BDC600D6BDC600D6BDC6007B5A6300E7DEDE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039673900D6E7D500B3D1
      B300B3D1B30036633600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF62C6
      DEFF49ADC6FF303059FFFFFFFFFF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F7
      F700080808000000A5005252C6004242BD000808AD000000A5000808AD000000
      A5000808AD000000A5000808AD004242BD005A5AB5000000A50008080800F7F7
      F700000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B5A6300EFDEE700EFDEE700D6BDC600D6BD
      C600D6BDC600D6BDC600D6BDC6007B5A6300E7DEDE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039673900D7E8D700D5E7
      D600D5E7D6003764370000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF59CE
      E7FF59CEE7FF303059FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F7F7000808
      08000000A5005252C6004242BD000808AD000000A5000808AD000000A5000808
      AD000000A5000808AD000000A5000808AD004242BD005252C6000000A5000808
      0800F7F7F7000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B5A63007B5A63007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A63007B5A63007B5A63000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000396739003967
      3900396739000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000303059FF3030
      59FF303059FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700080808000000
      A5005252C6004242BD000808AD000000A5000808AD000000A5000808AD000000
      A5000808AD000000A5000808AD000000A5000808AD004242BD005A5AB5000000
      A50008080800F7F7F70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300F7E7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000080808007373CE006B6B
      BD004242BD000808AD000000A5000808AD000000A5000808AD000000A5000808
      AD000000A5000808AD000000A5000808AD000000A5000808AD004242BD006B6B
      BD000000A50008080800F7F7F700000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300F7E7EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039673900396739003967
      39003967390039673900FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000303059FF3030
      59FF303059FFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484D6005A5A
      B5000808AD000000A5000808AD000000A5000808AD000000A5000808AD000000
      A5000808AD000000A5000808AD000000A5000808AD000000A5000808AD005A5A
      B5000808AD0000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300EFE7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000038663800D7E8D700B9D7
      B800B9D8B90038663800FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF62C6
      DEFF49ADC6FF303059FFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000080808007373CE006B6B
      BD000000A5000808AD000000A5000808AD000000A5000808AD000000A5000808
      AD000000A5000808AD000000A5000808AD000000A5000808AD000000A5006B6B
      BD000000A50008080800F7F7F700000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300F7E7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000038663800D7E8D700B9D7
      B800B9D8B900B9D8B90039673900FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF49AD
      BDFF62C6DEFF303059FFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484D6005A5A
      B5000808AD000000A5000808AD000000A5000808AD000000A5000808AD000000
      A5000808AD000000A5000808AD000000A5000808AD000000A5000808AD005A5A
      B5000808AD0000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300F7E7EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000038663800D7E8
      D700B8D8B800B8D8B800B8D8B90039673900FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF62C6
      D6FF49ADC6FF303059FFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000080808007373CE006B6B
      BD000000A5000808AD000000A5000808AD000000A5000808AD000000A5000808
      AD000000A5000808AD000000A5000808AD000000A5000808AD000000A5006B6B
      BD000000A50008080800F7F7F700000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300F7E7EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003866
      3800D7E8D700D7E8D700B8D7B900B9D8B90039673900FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF419C
      B5FF62C6D6FF303059FFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484D6005A5A
      B5000808AD000000A5000808AD000000A5000808AD000000A5000808AD000000
      A5000808AD000000A5000808AD000000A5000808AD000000A5000808AD005A5A
      B5000808AD0000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300F7E7EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003866380038663800D7E8D700B9D8B80039673900FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF62BD
      CEFF49A5BDFF303059FFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000080808007373CE006B6B
      BD000000A5000808AD000000A5000808AD000000A5000808AD000000A5000808
      AD000000A5000808AD000000A5000808AD000000A5000808AD000000A5006B6B
      BD000000A50008080800F7F7F700000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700EFDE
      E700EFDEE7007B5A6300F7E7EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000336033003361340000000000000000000000
      0000000000000000000038663800D7E8D700B9D7B80039673900FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF419C
      B5FF62BDCEFF303059FFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484D6005A5A
      B5000808AD000000A5000808AD000000A5000808AD000000A5000808AD000000
      A5000808AD000000A5000808AD000000A5000808AD000000A5000808AD005A5A
      B5000808AD0000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A63007B5A63007B5A
      63007B5A63007B5A630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000315E3100CEDDCE00A9C4AA0034613300000000000000
      0000000000000000000037653700D6E7D600B7D6B70039673900FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF59B5
      C6FF419CB5FF303059FFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000080808007373CE00B5B5
      DE004242BD000808AD000000A5000808AD000000A5000808AD000000A5000808
      AD000000A5000808AD000000A5000808AD000000A5000808AD004242BD006B6B
      BD000000A50008080800F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFDEE700EFE7
      E700F7E7E7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000305D3000CDDCCD00A7C2A70033603300000000000000
      0000000000000000000037643600D5E6D500B6D4B60038673800FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF4194
      A5FF59B5C6FF303059FFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080808007373
      CE00A5A5E7004242BD000808AD000000A5000808AD000000A5000808AD000000
      A5000808AD000000A5000808AD000000A5000808AD004242BD005252C6000000
      A50008080800F7F7F70000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B5A63007B5A
      63007B5A6300F7E7E70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000305D3000CDDCCD00A7C2A70033603300000000000000
      0000000000000000000037643600D5E6D500B6D4B60038673800FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF59AD
      BDFF4194A5FF303059FFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      08007373CE00A5A5E7004242BD000808AD000000A5000808AD000000A5000808
      AD000000A5000808AD000000A5000808AD004242BD005252C6000000A5000808
      0800F7F7F7000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300F7E7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000305D3000CDDCCD00A7C2A700336033003461
      34003461340034613400B0CDAF00B2D0B10037653700FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF418C
      A5FF59ADBDFF303059FFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000080808007373CE00A5A5E7004242BD000808AD000000A5000808AD000000
      A5000808AD000000A5000808AD004242BD005252C6000000A50008080800F7F7
      F700000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300EFE7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000002F5C2F00CCDACC00CDDCCD00A7C2A700AAC4
      A900ABC7AB00ABC7AB00D1E2D100D2E3D20036643600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF59A5
      B5FF418CA5FF303059FFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000080808007373CE00B5B5DE005A5AB5006B6BBD005A5AB5006B6B
      BD005A5AB5006B6BBD005A5AB5006B6BBD000000A50008080800F7F7F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700EFDE
      E700EFDEE7007B5A6300EFDEE700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002F5C2F00305D3000CDDCCD00CEDD
      CE00CFDFCF00CFDFCF003361330034613400FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF59CE
      E7FF59CEE7FF303059FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000080808007373CE008484D6007373CE008484D6007373
      CE008484D6007373CE008484D6007373CE0008080800F7F7F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B5A63007B5A
      63007B5A63000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000305D3000315E
      3100315F3200315F320000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000303059FF3030
      59FF303059FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000080808000000000008080800000000000808
      080000000000080808000000000008080800F7F7F70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000300000000100010000000000400200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFF000000FE00FFFF
      FFFFFFE3FF000000FC007FFF007FFFC1FF000000F8003FFE007FFF81FF000000
      F0001FFE007FFF81FF000000E0000FFE007FFF83FF000000C00007FE00FFFFC7
      FF000000800003FF81FFFFC1FF000000800001FF81FFFF81FF000000800001FF
      81FFFF81FF000000800001FF81FFFF80FF000000800001FF81FFFFC07F000000
      800001FF81FFFFE03F000000800001FF81FFFFF03F000000800001FF81FFFE7C
      1F000000800001FF83FFFC3C1F000000800001FFC7FFFC3C1F000000C00003FF
      C3FFFC3C1F000000E00007FF81FFFE003F000000F0000FFF81FFFE003F000000
      F8001FFF81FFFF007F000000FC003FFFC7FFFFC3FF000000FE007FFFFFFFFFFF
      FF000000FFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000
      000000000000}
  end
  object ClientAction: TActionList
    Images = ClientImageList24
    Left = 584
    Top = 152
    object ClientExitAction: TAction
      Caption = '  Exit  '
      Hint = 'Exit the client application'
      ImageIndex = 0
      ShortCut = 16453
      OnExecute = ClientExitActionExecute
    end
    object ClientInfoAction: TAction
      Caption = 'Info'
      Hint = 'Show info about this client'
      ImageIndex = 1
      ShortCut = 112
      OnExecute = ClientInfoActionExecute
    end
    object ClientHelpAction: TAction
      Caption = 'Help'
      Hint = 'Open the help module'
      ImageIndex = 2
      OnExecute = ClientHelpActionExecute
    end
    object ClientVersionAction: TAction
      Caption = 'Version'
      Hint = 'Show for new versions'
      ImageIndex = 3
      OnExecute = ClientVersionActionExecute
    end
    object ClientDonateAction: TAction
      Caption = 'Donate'
      Hint = 'Make a donation'
      ImageIndex = 4
      OnExecute = ClientDonateActionExecute
    end
    object ClientShareAction: TAction
      Caption = 'Share'
      Hint = 'Share this application'
      ImageIndex = 5
      OnExecute = ClientShareActionExecute
    end
  end
  object ActionsImageList24: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 376
    Top = 208
    Bitmap = {
      494C01010B001800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000060000000480000000100200000000000006C
      0000000000000000000000000000000000000C6EA1000C6EA1000C6EA1000C6E
      A1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6E
      A1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6E
      A1005C8CAA000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE0018BEF5000ABBF8000AB8
      F6000AB6F4000AB3F1000AB1EE000AADEB000AACE8000AA9E5000AA7E4000AA5
      E1000AA1DD000A9FDB000A9CD8000A9AD6000A99D3000A96D1000A93CE000A91
      CB00266F9B00000000000000000000000000000000009E3F0A009E3F0A009B3D
      0A009B3D0A00993A0A0098380A0095360A0094350A0092330A0091310A008F30
      0A008D2F0A008C2D0A008A2B0A00892B0A00872A0A0087290A0087290A00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE0023A0D0000ABEFC000ABC
      F9000AB9F7000AB7F5000AB5F2000AB2F0000AAEEC000AACE9000AABE7000AA8
      E4000AA6E2000AA2DF000AA0DC000A9ED9000A9BD7000A99D4000A96D1000A94
      CF001872A500C1C4C500000000000000000000000000A1420A00FFFFFF00FFFF
      FC00FFFFF800FFFFF600FFFFEF00FFFEEC00FFFBE900FFFAE500FFFAE200FFF7
      DC00FFF5DA00FFF3D600FFF1D300FFEFCE00FFEDCB00FFEBC800872A0A00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE001F87B60010C1FC000ABE
      FC000ABDFB000ABBF8000AB8F6000AB6F4000AB3F1000AB0ED000AADEB000AAC
      E8000AA9E5000AA7E4000AA3E0000AA1DD000A9FDB000A9CD8000A9AD6000A98
      D2000B85BE007A9DB300000000000000000000000000A5460A00FFFFFF00FFFF
      FF00FFFFF800FFFFF600FFFDEF00FFFDED00FFFDEB00FFFAE800FFF9E400FFFA
      E100FFF6DB00FFF4D900FFF2D500FFF1D100FFEECC00FFECC800892B0A00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE001174A80028C7F8000ABE
      FC000ABEFC000ABEFC000ABCF9000AB9F7000AB7F5000AB3F1000AB1EE000AAE
      EC000AACE9000AABE7000AA8E4000AA5E1000AA2DF000AA0DC000A9ED9000A9B
      D7000B98D2003D7DA500000000000000000000000000A7480A00FFFFFF00FFFF
      FF00FFFFFF00FFFEF000FFFBEA00FFFBED00FFFCEC00FFFCEA00FFF9E700FFF8
      E300FFF9E000FFF5DA00FFF3D800FFF0D300FFEDCF00FFEBC8008A2B0A00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE000D74A9003CB8E2000ABE
      FC000ABEFC000ABEFC000ABEFC000ABDFB000ABBF8000AB8F6000AB5F2000AB2
      F0000AB0ED000AADEB000AACE8000AA9E5000AA6E2000AA3E0000AA1DD000A9F
      DB000B9DD8002479A800C1C4C5000000000000000000AB4A0A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFE00FFFBED00FFFAE900FFFAEC00FFFBEB00FFFBE900FFF8
      E600FFF7E200FFF8DF00FFF4D900FFF2D700FFEBCE00FFE2C4008B2D0A00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE001282B300369EC60011C2
      FC000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABCF9000AB9F7000AB6
      F4000AB3F1000AB1EE000AAEEC000AACE9000AA9E5000AA7E4000AA5E1000AA2
      DF000BA0DC000D87C00086A1B4000000000000000000AD4E0A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFFAEB00FFF8E700FFF9EB00FFFAEA00FFFA
      E800FFF7E500FFF6E100FFF7DE00FFF3D800FFF1D600FFE4C7008D2F0A00C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE001487B8001B81AE0035CF
      FB000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABDFB000ABB
      F8000AB7F5000AB5F2000AB2F0000AB0ED000AADEB000AABE7000AA8E4000AA6
      E2000BA3E0000BA0DC004683A8000000000000000000AD4E0A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFF9EA00FFF5E400FFF8EA00FFF9
      E900FFF9E700FFF6E400FFF5E000FFF6DD00FFF2D700FFECD1008F300A00C0C0
      C00000000000000000000000000000000000000000FC000000FF000000FF0000
      001B0000000000000000000000000000000000000000000000AF000000FF0000
      00FF000000630000000000000000000000000000000000000000000000250000
      00B1000000080000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE00188DBD000F72A30055C9
      EB000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABE
      FC000ABCF9000AB8F6000AB6F4000AB3F1000AB1EE000AAEEC000AACE8000AA9
      E5000BA7E3000BA5E1002779A6000000000000000000B1520A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFD00FFF7E800FFF2E100FFF7
      E900FFF8E800FFF8E600FFF5E300FFF4DF00FFF5DC00FFEBD10091320A00C0C0
      C00000000000000000000000000000000000000000FC000000FF000000FF0000
      001B0000000000000000000000000000000000000000000000AF000000FF0000
      00FF000000630000000000000000000000000000000000000014000000DB0000
      00FF000000AA0000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE001C93C000147FAE002C8D
      B800ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFCFC0068F1
      FC000ABEFC000ABCF9000AB9F7000AB7F5000AB5F2000AB2F0000AB0ED000AAC
      E9000BABE7000BA8E400108CC50096ABB80000000000B3540A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFD00FFF6E800FFEF
      DE00FFF6E700FFF7E700FFF7E500FFF4E200FFF3DE00FFEDD40093340A00C0C0
      C00000000000000000000000000000000000000000FC000000FF000000FF0000
      001B0000000000000015000000540000000000000000000000AF000000FF0000
      00FF0000006300000000000000000000000000000008000000C5000000FF0000
      00FF000000FF0000008A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE00239EC9001785B300167A
      A9000A74AC000A74AC000A74AC000A74AC000A74AC000A74AC000A74AC002B92
      BC0068F1FC000ABEFC000ABDFB000ABBF8000AB8F6000AB6F4000AB3F1000AB1
      EE000BAEEB000BACE8000BA6E2004A84A80000000000B6570A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF5
      E800FDECDB00FFF5E60001B3180001B3180001B3180001B3180001B3180001B3
      180000000000000000000000000000000000000000FC000000FF000000FF0000
      001B00000002000000B9000000F60000002F00000000000000AF000000FF0000
      00FF00000063000000000000000000000002000000AA000000FF000000FF0000
      00FF000000FF000000FF00000069000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE003CD3F20031C0E40030BB
      DF0032BCDF0034BDDF0035BEDF0038BEDF003ABFDF0035B3D4002592B9001A7E
      A90052C4E20068F1FC000ABEFC000ABEFC000ABCF9000AB9F7000AB7F5000AB5
      F2000BB1EE000BAEEC000BADE9002D7DA90000000000B7590A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF5E800FBEBDA0001B3180000D0140001BF1F0001BF1F0000D0140001B3
      180000000000000000000000000000000000000000FC000000FF000000FF0000
      001B0000007F000000FF000000FF000000DA0000000F000000AF000000FF0000
      00FF0000006300000000000000000000008B000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FB0000004B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE006BF2FC0047E2FC0048E4
      FC004BE4FC004EE5FC0050E7FC0053E8FC0056E9FC0058E9FC0042C1DD002A98
      BD00197BA9004DD6F600ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFC
      FC00ADFCFC00ADFCFC0042CBE900297DAA0000000000B95C0A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF5E80001B3180000D5280001C62C0001C62C0000D5280001B3
      180000000000000000000000000000000000000000FC000000FF000000FF0000
      0060000000FD000000FF000000FF000000FF000000AC000000B0000000FF0000
      00FF00000063000000000000000B000000550000005500000071000000FF0000
      00FF000000F00000005500000055000000490000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE0083FBFC004EE5FC0050E7
      FC0053E8FC0056E9FC0059EBFC005BEBFC005EECFC0061EDFC0059DFF10035A5
      C5002487AE000A74AC000A74AC000A74AC000A74AC000A74AC000A74AC000A74
      AC000A74AC000A74AC000A74AC00B6BDC10000000000BC5E0A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0001B3180000D93B0001CD3A0001CD3A0000D93B0001B3
      180000000000000000000000000000000000000000FC000000FF000000FF0000
      00F5000000FF000000FF000000FE000000FF000000FF000000F5000000FF0000
      00FF00000063000000000000000000000000000000000000002A000000FF0000
      00FF000000E80000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE00ADFCFC0056E9FC0059EB
      FC005CECFC005FEDFC0061EDFC0063EEFC0067F0FC006AF1FC006CF1FB005BD7
      E80001B3180001B318003CA8C6003DA9C6003FA9C60041ABC60042ABC6000A78
      AE000000000000000000000000000000000000000000BD600A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0001B3180000DD4F0000D34B0000D34B0000DD4F0001B3
      180000000000000000000000000000000000000000FC000000FF000000FF0000
      00FF000000FF000000C300000063000000FF000000FF000000FF000000FF0000
      00FF00000063000000000000000000000000000000000000002A000000FF0000
      00FF000000E80000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE00ADFCFC005FEDFC0062EE
      FC0064F0FC0067F0FC006AF1FC006DF2FC0070F4FC0073F5FC0076F6FC0001B3
      180000F1AF0000F1AF0001B3180084FCFC0085FCFC0085FCFC0085FCFC000A78
      AE000000000000000000000000000000000000000000BF620A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0001B3180000E1630000D95C0000D95C0000E1630001B3
      180000000000000000000000000000000000000000FC000000FF000000FF0000
      00FF000000E90000001A000000000000009A000000FF000000FF000000FF0000
      00FF00000063000000000000000000000000000000000000002A000000FF0000
      00FF000000E80000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE00ADFCFC0068F1FC006BF2
      FC006DF2FC0070F4FC0073F5FC0076F6FC0079F7FC007CF8FC0001B3180000F0
      A50000EA960000EA960000F0A50001B3180085FCFC0085FCFC0087FCFC000A78
      AE000000000000000000000000000000000000000000C0630A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004CC95C0001B3
      180001B3180001B3180001B3180000E6760000E06E0000E06E0000E6760001B3
      180001B3180001B3180001B318004C7D5C00000000FC000000FF000000FF0000
      00FC00000043000000000000000000000008000000CE000000FF000000FF0000
      00FF00000063000000000000000000000000000000000000002A000000FF0000
      00FF000000E80000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE00ADFCFC0071F5FC0073F5
      FC0076F6FC0079F7FC007CF8FC007FF9FC0083FBFC0001B3180000EB8E0000EB
      8E0000E47E0000E47E0000EB8E0000EB8E0001B318000A78AE000A78AE004C99
      B6000000000000000000000000000000000000000000C2650A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001B3180000EA
      8A0000EA8A0000EA8A0000EA8A0000EA8A0000E6820000E6820000EA8A0000EA
      8A0000EA8A0000EA8A0000EA8A0001B31800000000FB000000FF000000FF0000
      007C0000000000000000000000000000000000000023000000EF000000FF0000
      00FF00000063000000000000000000000000000000000000002A000000FF0000
      00FF000000E80000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A78AE00ADFCFC007CF8
      FC007FF9FC0083FBFC0085FCFC0085FCFC0001B3180000E6760000E6760000E6
      760000DC670000DC670000E6760000E6760000E6760001B31800000000000000
      00000000000000000000000000000000000000000000C5680A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0001B3
      180000EE9D0000EE9D0000EE9D0000EE9D0000EC960000EC960000EE9D0000EE
      9D0000EE9D0000EE9D0001B31800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000A78AE00ADFC
      FC00ADFCFC00ADFCFC00ADFCFC0001B3180000E15F0000E15F0000E15F0000E1
      5F0000D6530000D6530000E15F0000E15F0000E15F0000E15F0001B318000000
      00000000000000000000000000000000000000000000C6690A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0001B3180000F2B20000F2B20000F2B20000F1AE0000F1AE0000F2B20000F2
      B20000F2B20001B3180000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000A78
      AE000A78AE000A78AE000A78AE004CC95C0001B3180001B3180001B3180000DC
      480001CE400001CE400000DC480001B3180001B3180001B318004CC95C000000
      00000000000000000000000000000000000000000000C76B0A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0001B3180000F7C50000F7C50000F7C50000F7C50000F7C50000F7
      C50001B318000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000001B3180000D7
      320001C7300001C7300000D7320001B318000000000000000000000000000000
      00000000000000000000000000000000000000000000C96D0A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0001B3180000FBD90000FBD90000FBD90000FBD90001B3
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000001B3180000D2
      1B0001BF210001BF210000D21B0001B318000000000000000000000000000000
      00000000000000000000000000000000000000000000CA6D0A00C96D0A00C96B
      0A00C76B0A00C6690A00C5680A00C4650A00C0630A00C0630A00BF610A00BD60
      0A00BC5E0A00B95C0A00B85A0A0001B3180000FFEC0000FFEC0001B318000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000001B3180001B3
      180001B3180001B3180001B3180001B318000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000001B3180001B31800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000054514C57AC8752C0CA801CEFD57900FFD278
      02FFC97304FFBF6D09FFBD7213FCB7792CF10000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C6EA1000C6EA1000C6EA1000C6E
      A1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6E
      A1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6E
      A1005C8CAA000000000000000000000000000000000000000000000000000000
      0000000000000000000080726187D47700FFD57700FFD57800FFAE5F07FF944E
      0BFF964F0CFF964F0CFF954E0DFF954D0DFF94561DF6766C6287000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE0018BEF5000ABBF8000AB8
      F6000AB6F4000AB3F1000AB1EE000AADEB000AACE8000AA9E5000AA7E4000AA5
      E1000AA1DD000A9FDB000A9CD8000A9AD6000A99D3000A96D1000A93CE000A91
      CB00266F9B000000000000000000000000000000000000000000000000000000
      0000D37600FED47600FFD47700FFD57800FFAD5F06FF964F0AFF9C520BFF9A52
      0CFF9A510CFF98500CFF974F0DFF964E0DFF944D0DFF924C0EFF914C0EFF766C
      62870000000000000000000000000000000000000000000000006F526F00271C
      2800412E3E00321925007C717800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000A78AE0023A0D0000ABEFC000ABC
      F9000AB9F7000AB7F5000AB5F2000AB2F0000AAEEC000AACE9000AABE7000AA8
      E4000AA6E2000AA2DF000AA0DC000A9ED9000A9BD7000A99D4000A96D1000A94
      CF001872A500C1C4C5000000000000000000000000000000000000000000917C
      619CD47700FFD47700FFD57800FFBA6704FF954F0AFF9B520BFF9D530BFF9B52
      0CFF9A510CFF98500CFF974F0DFF964E0DFF944D0DFF924C0EFF914C0EFF8F4A
      0EFF8172649C0000000000000000000000000000000000000000000000000000
      0000000000000008160012261F00504241008F638300BB90A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003333330033333300333333003333330033333300333333003333
      3300333333003333330033333300333333003333330033333300FFFFFF000000
      0000000000000000000000000000000000000A78AE001F87B60010C1FC000ABE
      FC000ABDFB000ABBF8000AB8F6000AB6F4000AB3F1000AB0ED000AADEB000AAC
      E8000AA9E5000AA7E4000AA3E0000AA1DD000A9FDB000A9CD8000A9AD6000A98
      D2000B85BE007A9DB3000000000000000000000000000000000080726187D476
      00FFD47700FFD57800FFD57900FF975109FF9A520AFF9D530BFF9D530BFF9B52
      0CFF9A510CFF98500CFF974F0DFF964E0DFF944D0DFF924C0EFF914C0EFF8F4A
      0EFF8E4A0EFF756C63870000000000000000000000000000000000000000221C
      170012202700619EC500294862000000000000030000282A1200A68493000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC009999990099999900999999006666660033333300FFFFFF000000
      0000000000000000000000000000000000000A78AE001174A80028C7F8000ABE
      FC000ABEFC000ABEFC000ABCF9000AB9F7000AB7F5000AB3F1000AB1EE000AAE
      EC000AACE9000AABE7000AA8E4000AA5E1000AA2DF000AA0DC000A9ED9000A9B
      D7000B98D2003D7DA500000000000000000000000000C97E1CEFD47700FFD477
      00FFD57900FFD57900FFD67A01FF99510AFF9E540BFF9F540BFF9D530BFF9B52
      0CFF9A510CFF97591BF68C7661AF524F4D570000000000000000000000008172
      649C925A29EF8D490FFF00000000000000000000000000000000000000009068
      850038504B0092E5ED0062A4C400395C89003F6180000008110029251600BA96
      A400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000A78AE000D74A9003CB8E2000ABE
      FC000ABEFC000ABEFC000ABEFC000ABDFB000ABBF8000AB8F6000AB5F2000AB2
      F0000AB0ED000AADEB000AACE8000AA9E5000AA6E2000AA3E0000AA1DD000A9F
      DB000B9DD8002479A800C1C4C5000000000000000000D47700FFD47700FFD578
      00FFD57A01FFD67A01FFCB7403FF9B520AFF9F540BFF9F540BFF9D530BFF9B52
      0CFF995A1BF60000000000000000000000000000000000000000000000000000
      000000000000524F4D5700000000000000000000000000000000000000000000
      0000284E3E00A3FFFF00C5FFFF0054C7FF000088F50058372F007D250000815C
      4B00A98C9B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000A78AE001282B300369EC60011C2
      FC000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABCF9000AB9F7000AB6
      F4000AB3F1000AB1EE000AAEEC000AACE9000AA9E5000AA7E4000AA5E1000AA2
      DF000BA0DC000D87C00086A1B4000000000000000000D57700FFD57800FFD579
      00FFD67A01FFD67B02FFC77204FF9B520BFF9F540BFF9F540BFF9D530BFF9A6C
      40DC000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000736F7B006EA09D0060DEFF0047D9FF005E98A500DD793200E65103008C3E
      1700704E2F00A886940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000A78AE001487B8001B81AE0035CF
      FB000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABDFB000ABB
      F8000AB7F5000AB5F2000AB2F0000AB0ED000AADEB000AABE7000AA8E4000AA6
      E2000BA3E0000BA0DC004683A80000000000AE8752C0D57900FFD57A01FFD67B
      01FFD77D03FFD78004FFC87405FF9A510AFF9E540BFF9F540BFF000000000000
      000000000000000000008AAA61CF7EBD35FE71C03AFF67C33EFF60C441FF4FC7
      48FF5DC25AEF606B607000000000000000000000000000000000000000000000
      00000000000062454A000068BC0061B3BB00FFB01100FC901900E16A1400C24E
      13009D4722006C4A2500A8899700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000A78AE00188DBD000F72A30055C9
      EB000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABE
      FC000ABCF9000AB8F6000AB6F4000AB3F1000AB1EE000AAEEC000AACE8000AA9
      E5000BA7E3000BA5E1002779A60000000000CA811CEFD57A01FFD67B02FFD67C
      02FFD78004FFD78104FFCD7806FF98500AFF9D530BFF9D540BFE000000000000
      00000000000088996CAF8DBE31FF82BE34FF70C03AFF6AC33EFF61C441FF56C9
      48FF4FCB4CFF4BCF50FF00000000000000000000000000000000000000000000
      00000000000000000000B5A77E00D2CE4400FFDE5200FFB02D00EE811600D860
      1300BF4F150094421C0078574400AB90A1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000A78AE001C93C000147FAE002C8D
      B800ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFCFC0068F1
      FC000ABEFC000ABCF9000AB9F7000AB7F5000AB5F2000AB2F0000AB0ED000AAC
      E9000BABE7000BA8E400108CC50096ABB800D57900FFD67B02FFD67C02FFD77D
      03FFD78105FFD88205FFD88306FF944E0AFF9B520BFF9D6E3FDC000000000000
      0000000000003A3B393C8FBE31FF8AC035FF7CC33AFF70C43EFF68C541FF5DCA
      49FF50CC4DFF4CCE50FF70AE79C0000000000000000000000000000000000000
      0000000000000000000000000000FBC35B00E1CC2800FCDB4A00FFB73800EF7E
      1300DE661300C64D11008A3D130077564400A486960000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000A78AE00239EC9001785B300167A
      A9000A74AC000A74AC000A74AC000A74AC000A74AC000A74AC000A74AC002B92
      BC0068F1FC000ABEFC000ABDFB000ABBF8000AB8F6000AB6F4000AB3F1000AB1
      EE000BAEEB000BACE8000BA6E2004A84A800D47A02FFD77D03FFD78004FFD781
      05FFD88406FFD98507FFD98608FF8E4C09FF914D0AFF69625C73000000000000
      00000000000000000000787D68879DC232FF8BC539FF82C63DFF72C741FF5ECE
      4BFF5DD350FF54D655FF46D95BFF61C374DC0000000000000000000000000000
      000000000000000000000000000000000000D8AE5000F0DB5500FFE04D00FFB3
      3300F18B1D00E66C1200C64D110092421C0066462400A7849500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000A78AE003CD3F20031C0E40030BB
      DF0032BCDF0034BDDF0035BEDF0038BEDF003ABFDF0035B3D4002592B9001A7E
      A90052C4E20068F1FC000ABEFC000ABEFC000ABCF9000AB9F7000AB7F5000AB5
      F2000BB1EE000BAEEC000BADE9002D7DA900DB8C0FFFD67D04FFD88105FFD882
      06FFD98507FFD98608FFDA8809FFC5760BFF894809FF6A645D76000000000000
      00000000000000000000ABA15ED3A2C231FF8DC539FF8AC93DFF75CA44FF67D0
      4BFF61D34FFF5BD553FF4BDB5CFF45DF62FE0000000000000000000000000000
      00000000000000000000000000000000000000000000EBBB6500F3DB4600FFDC
      5600FBAB2B00F18B1D00DE661300BF4F15009D472100704B3500AA89A1000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000A78AE006BF2FC0047E2FC0048E4
      FC004BE4FC004EE5FC0050E7FC0053E8FC0056E9FC0058E9FC0042C1DD002A98
      BD00197BA9004DD6F600ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFC
      FC00ADFCFC00ADFCFC0042CBE900297DAA00DA8F13FFD68005FFD88306FFD884
      07FFD98608FFDA8809FFDA890AFFDC8C0DFFC0740DFF8F7050C8000000000000
      00000000000000000000B79F2DFAA6C231FF9BC738FF8CC83CFF8ACB40FF72D3
      4CFF69D650FF58D857FF50DF5FFF4CE162FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DFB85E00E1C9
      1900FFDE5900FFB43400EE7E1400DA601200CC500D0089400D0074533F00B98A
      9E00000000000000000000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000A78AE0083FBFC004EE5FC0050E7
      FC0053E8FC0056E9FC0059EBFC005BEBFC005EECFC0061EDFC0059DFF10035A5
      C5002487AE000A74AC000A74AC000A74AC000A74AC000A74AC000A74AC000A74
      AC000A74AC000A74AC000A74AC00B6BDC100EFB033FDCB7A06FFD28108FFD785
      09FFDB890BFFDB8B0CFFDC8C0DFFDD8F0FFFDD9010FFDD9111FFC19547DC8277
      6489706A5E76BC8917FFC4C02AFFBCC42EFFA4C837FF9DCB3BFF95CD3FFF78D8
      50FF70DB54FF64DE59FF53E261FF50E665FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DCB5
      5A00E6D03800FDDB4700FFB83700EC801500CE641B00884D25002B2E3C002B2E
      3C00644A5D000000000000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000A78AE00ADFCFC0056E9FC0059EB
      FC005CECFC005FEDFC0061EDFC0063EEFC0067F0FC006AF1FC0001B3180001B3
      180001B3180001B3180001B3180001B318003FA9C60041ABC60042ABC6000A78
      AE0000000000000000000000000000000000CAAC64D0BE7207FFC87A08FFCF81
      09FFD8890CFFD98A0DFFDA8D0EFFDB9010FFDB9011FFDB9112FFD58F14FFCC8B
      14FFC28514FFC8B625FFC4C32CFFBEC42EFFABC936FFA2CC3BFF97CF40FF79D8
      4FFF6FDB54FF62E05CFF57E562FF50E665FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D5AA4C00ECD85000FFE04800EFAC3E00A8866200687079004B708C00395A
      72002B2E3C0060465F0000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000A78AE00ADFCFC005FEDFC0062EE
      FC0064F0FC0067F0FC006AF1FC006DF2FC0070F4FC0073F5FC0001B3180000D2
      1B0001BF210001BF210000D21B0001B3180085FCFC0085FCFC0085FCFC000A78
      AE000000000000000000000000000000000056544E57E5A524FFB97108FFC379
      0AFFD0840CFFD3880DFFD58A0EFFD58C10FFD58D11FFD28D13FFC78813FFBE83
      13FFB37A13FFD1C228FFCEC32AFFC5C42CFFB6C733FFAECD39FF9DD040FF80DB
      50FF75DE55FF6EDF58FF5BE865FF67D578E70000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E4BD5B00F7D52900EDD67F009CABB2006595C5005795C8005D91
      BD005C799B002B2E3C0060465F00000000000000000000000000000000000000
      00000000000033333300FFFFFF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC009999990099999900999999006666660033333300FFFFFF00FFFF
      FF00000000000000000000000000000000000A78AE00ADFCFC0068F1FC006BF2
      FC006DF2FC0070F4FC0073F5FC0076F6FC0079F7FC007CF8FC0001B3180000D7
      320001C7300001C7300000D7320001B3180085FCFC0085FCFC0087FCFC000A78
      AE000000000000000000000000000000000000000000FAC035FFF8C035FFF6C0
      34FFBA8113FFAF710DFFB5760EFFB67810FFB47810FFAF7511FFCDAC21FFD1C2
      28FFD1C228FFD1C228FFD1C228FFCDC42AFFBECA34FFB5CE39FFA5D442FF83DF
      54FF7AE157FF6FE55EFF5BEB69FE000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E0B98000C2C48A00B7D9EB009CCDF4007FC0E90073B9
      E90073A2D000444C52002B2E3C00000000000000000000000000000000000000
      0000333333003333330033333300333333003333330033333300333333003333
      330033333300333333003333330033333300333333003333330033333300FFFF
      FF00000000000000000000000000000000000A78AE00ADFCFC0071F5FC0073F5
      FC0076F6FC0079F7FC007CF8FC004CC95C0001B3180001B3180001B3180000DC
      480001CE400001CE400000DC480001B3180001B3180001B318004CC95C004C99
      B6000000000000000000000000000000000000000000EAB947EFFAC035FFF7C0
      34FFF3C033FFEFBE30FFE2B227FFDDB327FFDAB426FFDBC22BFFD1C228FFD1C2
      28FFD1C228FFD1C228FFD1C228FFCEC42AFFB8CD38FFB1D03CFFABD341FF8ADE
      51FF85E257FF71E75FFF78977A9C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0AFB800ABCDE100C5ECF900C1EBFF0092C4
      E10076979B002B2E3C00CA95AA00000000000000000000000000000000000000
      000033333300FFFFFF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC0099999900999999009999990099999900999999006666660033333300FFFF
      FF0000000000000000000000000000000000000000000A78AE00ADFCFC007CF8
      FC007FF9FC0083FBFC0085FCFC0001B3180000E15F0000E15F0000E15F0000E1
      5F0000D6530000D6530000E15F0000E15F0000E15F0000E15F0001B318000000
      000000000000000000000000000000000000000000003B3B393CF8BF35FEF8C0
      35FFF2C033FFF1C033FFEAC12FFFE5C12FFFE0C12CFFD9C22BFFD3C229FFD1C2
      28FFD1C228FFD1C228FFD1C228FFCDC42BFFBBCC36FFB3D03CFFABD441FF8EDF
      51FF83E358FF78E95FFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009CA9CC00BFD8E000D8E7EA00B1B7
      BD002B2E3C00DCABC50000000000000000000000000000000000000000000000
      0000333333003333330033333300333333003333330033333300333333003333
      3300333333003333330033333300333333003333330033333300333333000000
      00000000000000000000000000000000000000000000000000000A78AE00ADFC
      FC00ADFCFC00ADFCFC00ADFCFC00ADFCFC0001B3180000E6760000E6760000E6
      760000DC670000DC670000E6760000E6760000E6760001B31800000000000000
      000000000000000000000000000000000000000000000000000000000000998C
      6E9CF3C033FFF1C032FFEFC032FFE6C12FFFE4C12EFFDFC12CFFD6C229FFD6C2
      2AFFD5C22AFFD1C42BFFCDC52CFFCAC82FFFB9D03AFFB3D23EFFA6D745FF99DE
      4EFF86E458FE5155505700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C8AEB200ABA178002B2E
      3C00E1B2D1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCCCCC00CCCC
      CC00CCCCCC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000A78
      AE000A78AE000A78AE000A78AE000A78AE000000000001B3180000EB8E0000EB
      8E0000E47E0000E47E0000EB8E0000EB8E0001B3180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5BF34FEF1C032FFEEC031FFE8C12FFFE6C12EFFE0C12DFFD7C22AFFD7C2
      2AFFD6C22AFFCFC42BFFCBC72EFFC7C931FFBDCE37FFB3D23EFFA7D745FF98D8
      57F6525550570000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3A2AF00E7B2
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000001B3180000F0
      A50000EA960000EA960000F0A50001B318000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003B3B393CE4B946EFF1C032FFEAC130FFE4C12EFFE1C12DFFDCC12BFFD7C2
      2BFFD6C22AFFD1C52CFFCCC72EFFCBC830FFBAD03AFFB3D23EFFAED542FF1E1E
      1E1F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000001B3
      180000F1AF0000F1AF0001B31800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000055544E57B4A567C0D7B943EFDDC22DFFDBC2
      2CFFD8C42DFFD0C72FFFC8C33BF6B7B957DC1E1E1E1F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000001B3180001B3180000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B6E1B60061C0660038B54D002ABB48002AC4
      4A0029C4470028BA450032B245005BBC5E00AFDEAF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BBE7BB0040C04F0038CF63003FE970002AF24B0018F62B000CFA
      180004FD09000BFB160021F83B0038EC630033CC590033B53D00B2E1B2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000074CA77002DC9500038E2660031E45C002AEA510022F03F0019F52E0011F8
      21000DFA190010F91E0017F62A0020F23B0029EC4E0043E5770037C555007CCF
      7D00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3989800F0E5E5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005CBB
      62002DCE520021DD3C0026DF48002FE259002EE7580026ED490020F23A001AF5
      2F0017F62A0019F52D001EF3370024EF45002CE9540036E3610049E56C0063DA
      81008AD68C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A8624000A8624000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F3EAEA00AA6D6D00B9868600FCF9
      F900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073BD760024C6
      430013D822001BDB300023DE41002AE1510030E45C002CE9550026ED490023F0
      410021F13E0022F03F0025EE47002BEA510034E55F0043E5680057E670006CE8
      7D0087E39900B4E6B40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A8624000A8624000A8624000A86
      2400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6B9B900AB6F6F00AE747300C8A1
      A1000000000000000000000000000000000000000000EFE3E300DABFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9DBB9001AAC310009D3
      11000ED61A0016D928001EDC370025DF46002CE1530030E45C002FE759002CEA
      54002AEB50002BEA52002EE8570037E5610044E5680056E6710069E87C007CEA
      870091EC9A00A6E6AE00E4F6E400000000000000000000000000000000000000
      00000000000000000000000000000A8624000A8624008AE6B50047CD83000A86
      24000A8624000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B9888800C4979200BD8A8500B57F
      7C00DAC0C00000000000F5EEEE00D7BABA00B9868600B47E7E00AF757500F3EB
      EB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000389743000BC8150003D1
      06000AD4130011D71F0018DA2C001FDD3A0027DF490038DF670039D0680035C3
      610033BD5E0037C3630042DB6F0045E4670053E66F0068E77B007BEA88008EEC
      9500A0EEA400B6F1BC00CBEDCD00000000000000000000000000000000000000
      000000000000000000000A8624000A86240077E6A9007BF1B000AEF8D4005ACF
      8D000A8624000A86240000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F2E8E800B0767500DAB9AD00B1787500CEA4
      9600AC717100BE8F8F00B0777700CAA2A000E6D1CE00F6EAE500C1939100E4D0
      D000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3D3B5001399240000C2000000CE
      010005D20A000BD5160012D721001DDB35002ECE55005BCD7200C0EAC9000000
      000000000000C7E4CC007DBD8B0066C7800073E9850086EC910098EE9F00AAF0
      AE00BAF2BC00CAF5CB00DCF5DE00000000000000000000000000000000000000
      0000000000000A8624000A86240054E08F004FE68C006FEEA6008CF5BF00ACF9
      D4005CCE8C000A8624000A862400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D5B6B600C08E8600DEBEAE00AA6E6E00AD71
      7100C3979600DFC6C300F4E7E200F4E6E000F2E2DB00F3E3DC00CEA7A300D4B6
      B600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000609F66000BA3140000B8000000C6
      000001CF020006D30C000DD5190022C63F0085D6920000000000000000000000
      0000000000000000000000000000CADFCE00A6DAB000B2F2B700C0F4C300CDF6
      CF00D8F7D800E3F9E30000000000000000000000000000000000000000000000
      00000A8624000A8624002BD86F001FDB64003EE27D005AE9950071EFA8007EF2
      B40087F2B80056CD87000A8624000A8624000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBF8F800E0CBCB00B27B7B00CA9C8D00D9B4A200CBA19600EEDD
      D600F4E6DF00F2E2DA00F2E2DA00F3E3DC00F3E4DD00F3E4DD00DCBEBA00C59B
      9B00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00000000000000
      000000000000000000000000000000000000257D3100019A030000AC000000BB
      000000C7000001CF020011CA1F0052BC5F000000000000000000000000000000
      000000000000000000000000000000000000DDE9DF00D7F4DA00DFF9E000E7FA
      E700000000000000000000000000000000000000000000000000CBDFDF000A86
      24000A86240016D05B0000D046000DD7540028DD6A003FE37E0051E78E005BE9
      96005AE9950057E8920047CB7C000A8624000A86240000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFAFA00E3CF
      CF00C69D9D00AF757500C1949200D9BCB900E0C2B400D2A89400D8B29F00E0C1
      B100F1DFD800F3E3DB00F3E4DD00F3E5DE00F4E6DF00F4E7E100EAD6D100B580
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B007B7B7B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B000000
      0000000000000000000000000000000000000C6F1700008C0000009D000000AD
      000000BB000000C500000EAB1B00B9E0BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5DCD9000A8624000A86
      240009C74B0000C63E0000CC420001D247000ED7540022DC650030DF720037E1
      780037E177002EDF700024DC67002DC769000A8624000A862400000000000000
      00000000000000000000000000000000000000000000CCA7A700AF767600BE8E
      8D00D9BBB800F1E2DD00F4E6DF00F2E1D900F1DFD700E2C5B700D2A79300D6B0
      9D00E2C5B500F3E4DD00F4E6DF00F5E7E100F5E8E200F6E9E300F5E9E300AE73
      7300FBF7F7000000000000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B000000000000000000000000000000000010741800189818001CA01C0020AF
      20000DB20D0000B800000D941900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B9D4CD00188435000A86240001BD
      3C0000BD350000C23A0000C83E0007CE480011D453001CD85D0026DB660029DC
      690022DB640010D7560004D44B0002D148001BC35B00058729000A8624000000
      00000000000000000000000000000000000000000000D9BDBD00B1797900C79D
      9B00E9D2CC00F1DED600F2E0D700F2E0D900F2E1DA00F3E3DB00E7CEC200D1A7
      9300D5AE9B00E5CBBE00F5E8E200F6E9E300F6EAE400F7EBE600F7ECE700BB89
      8800ECDEDE000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B00E7E7E7007B7B7B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B00E7E7E7007B7B
      7B008C8C8C00000000000000000000000000217F290048B7480048B7480048BA
      480021AC210000A600000D8D1900000000000000000000000000000000000000
      0000000000009AE1C00011871D000B8615000F891900118D1C000F8E1A000F90
      1B000F951C00119C1F0013A6220047C4580051A368000A86240000B12F0000B3
      2D000FBD3E002FCA5C0048D4720051D97B004CDA79001CD3580041DB740051DF
      810051DF810050DE7F0042DA730027D25E0007C843000DBE4D00048625000A86
      2400000000000000000000000000000000000000000000000000FAF6F600D4B5
      B500B0777700C89D9A00EBD6CF00F3E3DB00F3E4DD00F3E4DE00F4E6DF00ECD7
      CD00D3A99500D4AC9900EAD4C900F6EBE600F7ECE700F7EDE800F8EEEA00C9A1
      9F00DCC3C30000000000000000000000000000000000000000007B7B7B00B5B5
      B500E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7E700E7E7
      E700B5B5B5007B7B7B000000000000000000258130005AC15A005AC15A005AC1
      5A003DAF3D00009200000C8D1500BDDEC2000000000000000000000000000000
      0000000000009FCBAC000AA2130016F6160046F546005EF25E0061ED610057E4
      570040D5400027C327000AAC0A0015B6260051B5700000A624000BAD2E0045C4
      630066D2810067D5840067D787005BD7800012C84A005CD1870025CE5D004BD9
      780067DF8D0067DE8C0067DD8B0067DB8A0061D8840027C6540002B63E000080
      1D000A8624000000000000000000000000000000000000000000000000000000
      0000F8F4F400D1B0B000B0777600CCA3A000EEDCD600F5E7E000F5E8E200F5E9
      E300F0DFD700D4AD9A00D4AC9800EFDDD500F8EEE900F8EFEB00F8F0EC00D8B9
      B800CDA9A9000000000000000000000000000000000000000000000000007B7B
      7B00B5B5B500E7E7E700B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500B5B5B500E7E7E700B5B5
      B5007B7B7B0000000000000000000000000032873F006DC96D006CCA6C006CCA
      6C006AC76A00078C07000589090058AD66000000000000000000000000000000
      0000000000000000000084B78D000DA6170001E901001DE71D0053E853006CE7
      6C006CE26C006CDD6C006BD76B003FCF540097D0AD0007A1230064C878007CD3
      8F007CD691007CD8930068D4840015BF440083D3A30000000000BFE3D70022C3
      540052D579007CDF9A007CDE99007CDD98007CDC96007BD994003CC45E0001AD
      3200007B16000A86240000000000000000000000000000000000000000000000
      00000000000000000000F7F1F100CEAAAA00B0777700CEA9A600F1E2DD00F6EB
      E500F7ECE700F3E6E000D7B2A000D5AD9A00F4E7E100F9F1EE00FAF2EF00E6D3
      D100BD8E8E000000000000000000000000000000000000000000000000000000
      0000B5B5B500B5B5B500B5B5B500000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B500B5B5
      B5000000000000000000000000000000000064A66E0070C173007DD27D007DD2
      7D007DD27D0046AE4600008800000E8A19008BC2940000000000000000000000
      000000000000000000000000000051A35E0006C30B0000D700000ED40E0079E6
      79007DE37D007DE07D007DDC7D004FD965000000000096CCAA0020AA3A0078CF
      8A0092DAA1006FD1860010B2380096D6B100000000000000000000000000C8E3
      DE0039C6640050D0730091E1A70092E0A60092DFA50092DDA40091DBA20059C7
      710004A52A0000750F000A862400000000000000000000000000000000000000
      000000000000000000000000000000000000F5EDED00CBA5A500B0787700D2AF
      AD00F4E8E400F8EFEB00F7ECE800DBB9AA00D7B2A000F8EFEB00FAF4F100F6ED
      EB00AE757500FFFEFE0000000000000000000000000000000000000000000000
      000000000000B5B5B500B5B5B500000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500B5B5B5000000
      000000000000000000000000000000000000B4D7BA0051A459008ED88E008ED8
      8E008ED88E008ED78E00259A2500008801000B821500569D6000C0D9C4000000
      000000000000C3DBC6005A9F63000B95160001C5010002C6020067DE67008EE6
      8E008EE48E008EE18E008EDF8E0054DC68000000000000000000B1DAC6001EA7
      380055C26A0019AE3A00ACDAC400000000000000000000000000000000000000
      00000000000045C069004BC86A00A6E3B500A7E3B500A7E2B400A7E1B300A8DF
      B20072CA8100059B2000007009000A8624000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F2E9E900C8A0
      A000B1797900D5B6B400F7EEEA00F9F2EF00E0C3B500DCBBAB00FBF6F300FBF7
      F500B47E7E00F4EBEB0000000000000000000000000000000000000000000000
      00000000000000000000B5B5B500000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500000000000000
      000000000000000000000000000000000000000000003E99490096D898009CDE
      9C009CDE9C009CDE9C0098DA98002C9E2C00008800000383070008760F000B6E
      14000B6E1400087A10000496070000AD000006B3060069D769009CE79C009CE6
      9C009CE59C009CE39C009CE29C0058DD6800000000000000000000000000B3D6
      C70056BB6E00B1D8C50000000000000000000000000000000000000000000000
      0000000000000000000058C0760044C05F00B9E7C200BEE7C600BEE7C500BEE6
      C400BEE5C3008DD096000C951D000A8624000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0E5E500C49A9A00B37C7B00D9BDBB00FAF3F100E6CEC300E3C9BC00FCF9
      F800C3989800E4D0D00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7DCBB004CAA5400ABE4
      AB00AAE4AA00AAE4AA00AAE4AA00ABE3AB006BBF6B0018941800008800000088
      000000880000008C0000049504003DB63D0092DD9200AAE7AA00AAE7AA00AAE7
      AA00AAE6AA00AAE6AA00AAE5AA0059DE67000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000077C790003AB55100C6E9CC00D3EED700D3ED
      D700D3ECD600C4E4C7002C9E35006FB67D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EDE0E000C1949400B47F7F00DDC4C300EBD8CF00ECDA
      D200D3B3B200D5B6B60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006FBF760077C7
      7C00B6E9B600B6E8B600B6E8B600B6E8B600B6E8B600B8E9B8009BD89B007FCA
      7F0077C6770089D08900ADE4AD00B6E9B600B6E9B600B6E9B600B6E9B600B6EA
      B600B4E9B500B8EAB800B6E9B6005ADF65000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007EC3930034AB4600D2ECD500E9F5
      EB00CDE8D000299C31007BBD8900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EADBDB00BE8F8F00B7838300D6B6
      B100DABDB900C59C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000057BE
      5D007DD18100C2EDC200C0EDC000C0EDC000C0EDC000C0EDC000C0EDC000C0ED
      C000C0EDC000C0EDC000C0EDC000C0EDC000C0EDC000C0EDC000C2EDC20083DB
      870030C93B005CD76300C2EDC20059E062000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0D1B3002A9F3600ABD8
      AE0025982C007FBA8D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7D5D500BB8B
      8B00B1797900B681810000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006BCF6F0055CB5900C2EDC200CAF1CA00CAF1CA00CAF1CA00CAF1CA00CAF1
      CA00CAF1CA00CAF1CA00CAF1CA00CAF1CA00CAF1CA00C3EEC3005ACD5D0064D3
      69000000000084E388005DDD620065E26A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A2CBB3003BA0
      4500A0CDB0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E4D0D000C79E9E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B1E8B30035C037006DD06E00BEEBBE00D6F4D600D2F4D200D2F4
      D200D2F4D200D2F4D200D6F4D600C0ECC00070D1710033BF3500ABE6AC000000
      000000000000000000008DE98F00D0F2D1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ABE4AB0064CC640081D58100BFE7BF00DFF2
      DF00E0F2E000C1E8C10083D5830062CC6200A6E2A60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000480000000100010000000000600300000000000000000000
      000000000000000000000000FFFFFF00000007C0000F00000000000000000780
      000F00000000000000000380000F00000000000000000380000F000000000000
      00000380000F00000000000000000180000F00000000000000000180000F0000
      0000000000000180000F00000000000000000180000F00000000000000000080
      000F00000000000000000080000F00000000000000000080000F000000000000
      00000080000F00000000000000000080000F00000000000000000F80000F0000
      0000000000000F80000F00000000000000000F80000000000000000000000F80
      000000000000000080003F800001000000000000C0001F800003000000000000
      E0001F800007000000000000FFC0FF80000F000000000000FFC0FF80001F0000
      00000000FFC0FFFFFF3F000000000000FE00FFFFFFFFFFFFFF000007FC003FFF
      FFFFFFFFFF000007F0000FC1FFFFFC001F000003E00007E03FFFF8001F000003
      C00003E01FFFF8001F0000038000E3E00FFFF8001F0000018007FBF007FFF800
      1F000001800FFFF003FFF8001F000001003C03F801FFF8001F000001003803FC
      00FFF8001F000000003801FE007FF8001F000000003C00FF003FF8001F000000
      003C00FF801FF8001F000000003C00FFC00FF8001F000000000000FFE007F800
      1F00000F000000FFF003F8001F00000F000000FFF801F8000F00000F800001FF
      FC01F0000F00000F800001FFFE01F0000F80001F800003FFFF03F0001FC0003F
      E00003FFFF87FF83FFE0807FF00007FFFFCFFFC7FFFFC0FFF0000FFFFFFFFFFF
      FFFFE1FFFE007FFFFFFFFFFFFFFFF3FFFE007FFFFFFFFFFFFFFFFFFFF8001FFF
      FFFFFFFFFFFFFFFFF0000FFFFFFFFF9FFFFFFFFFE00007FF9FFFFF0FFFFFFFFF
      C00003FF0FFFFF0F9FFFFFFF800001FE07FFFF040FFFFFFF800001FC03FFFE00
      0FFFFFFF001801F801FFFE000FFFFFFF007E03F000FFF8000FFDFFBF00FF0FC0
      007FC0000FF9FF9F00FFFF80003F800007F1FF8F01FFFF00001F800007E00007
      01F80000000FC00007C0000300F800000007F00007E0000700FC00004003FC00
      07F1FF8F007E0080E001FF0003F9FF9F001800C1F800FFC003FDFFBF800000E3
      FC00FFF003FFFFFF800000FFFE00FFFC03FFFFFFC00000FFFF01FFFF03FFFFFF
      E00000FFFF83FFFFC3FFFFFFF00008FFFFC7FFFFF3FFFFFFF8001CFFFFFFFFFF
      FFFFFFFFFE007FFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ActionsAction: TActionList
    Images = ActionsImageList24
    Left = 584
    Top = 208
    object ActionRefreshAction: TAction
      Caption = 'Refresh'
      Hint = 'Refresh reloading data from server'
      ImageIndex = 0
      OnExecute = ActionRefreshActionExecute
    end
    object ActionPostAction: TAction
      Caption = 'Post'
      ImageIndex = 1
      OnExecute = ActionPostActionExecute
    end
    object ActionGotoAction: TAction
      Caption = 'Goto'
      Hint = 'Jump to a specific object giving its ID'
      ImageIndex = 2
      OnExecute = ActionGotoActionExecute
    end
    object ActionFitAction: TAction
      Caption = 'Fit'
      ImageIndex = 3
      OnExecute = ActionFitActionExecute
    end
    object ActionBrowseAction: TAction
      Caption = 'Browse'
      ImageIndex = 4
      OnExecute = ActionBrowseActionExecute
    end
    object ActionEditAction: TAction
      Caption = 'Edit'
      Hint = 'Open current content in a suitable editor'
      ImageIndex = 5
      OnExecute = ActionEditActionExecute
    end
    object ActionMarkdownAction: TAction
      AutoCheck = True
      Caption = 'Md'
      Hint = 'Show the Markdown view'
      ImageIndex = 10
      OnExecute = ActionMarkdownActionExecute
    end
    object ActionZzzAction: TAction
      Caption = 'Zzz'
      Hint = 'Recycle current object for future reuse'
      ImageIndex = 6
      OnExecute = ActionZzzActionExecute
    end
    object ActionLoadFromFileAction: TAction
      Caption = 'Load'
      Hint = 'Load current Content from a file'
      ImageIndex = 7
      OnExecute = ActionLoadFromFileActionExecute
    end
    object ActionSaveToFileAction: TAction
      Caption = 'Save'
      Hint = 'Save current Content to a file'
      ImageIndex = 8
      OnExecute = ActionSaveToFileActionExecute
    end
    object ActionPersistedOpenAction: TAction
      Caption = 'Persisted'
      ImageIndex = 9
      OnExecute = ActionPersistedOpenActionExecute
    end
  end
  object ObjectKindImageList16: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 72
    Top = 208
    Bitmap = {
      494C01014A009800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003001000001002000000000000030
      0100000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000BDFF0000BFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000EAD7C700D1A8
      8500E2C7B100D2AA8800000000000000000000000000FAF5F100CB9C7500E5CD
      B900D8B597000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000E0EFFFF0E0EFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000DDBEA400C28A
      5C00D2A98700C28A5B00000000000000000000000000F5ECE400BD814F00D9B5
      9800CB9C74000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000BDFF0000
      BFFF0000000000000000000000000E0EFFFF0E0EFFFF00000000000000000000
      00000000BDFF0000BFFF00000000000000000000000000000000DDBEA400C28A
      5C00D2A98700C28A5B00000000000000000000000000F5ECE400BD814F00D9B5
      9800CB9C74000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFF0E0EFFFF0E0E
      FFFF0E0EFFFF00000000000000000000FFFF0000FFFF00000000000000000000
      DCFF0E0EFFFF0E0EFFFFFFFFFFFF000000000000000000000000DDBEA400C28A
      5C00D2A98700C28A5B00000000000000000000000000F5ECE400BD814F00D9B5
      9800CB9C74000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFF0E0E
      FFFF0E0EFFFF00008CFF000000000000FAFF0000FAFF0000000000008FFF0E0E
      FFFF0E0EFFFFFFFFFFFF00000000000000000000000000000000DDBEA400C28A
      5C00D2A98700C28A5B000000000000000000E2C8B300D8B49700BD814F00CA9A
      7200C48E6100DDBDA400EAD8C800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFF0000FFFF0000FFFF000000000000000000000000000000000000FFFF0000
      FFFFFFFFFFFF00000000000000000000000000000000FAF5F200DDBDA300C28A
      5C00D2A98700C28A5B00FBF7F30000000000D7B39500BD814F00BD814F00BD81
      4F00BD814F00BD814F00E6D0BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFDFC00C0865600D7B29400BE83
      5200C28A5C00C28A5B00CC9D7600D8B59800E3C9B400BD814F00BD814F00BD81
      4F00BD814F00BE825100E8D3C200E5CDB9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000120F9EFF000070FF000072FF0000
      6DFF00008FFF0000000000000000000000000000000000000000000000001617
      9CFF00006AFF000071FF00006BFF322EA6FFFEFCFB00BE835200D6B09100BD81
      4F00BD814F00C28A5B00CA9A7200CEA17C00DCBDA300BE835200BD814F00BD81
      4F00BD814F00CA997100D2A98800DEBFA6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003537FFFF0000FFFF0E0EFFFF1314
      FFFF3333FFFF0000000000000000000000000000000000000000000000001D15
      EEFF0E0EFFFF0E0EFFFF0E0EFFFF0000F3FFFEFCFB00BE835200D6B09100BD81
      4F00BD814F00C28A5B00CA9A7200E4CBB600CB9C7500CD9F7900BD814F00BD81
      4F00BD814F00D8B59800C0865700F5EBE3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFB00BE835200D6B09100BD81
      4F00BD814F00C28A5B00CA9A7200F8F2EE00BF855400DAB79B00BD814F00BD81
      4F00BD814F00D8B59700C8966C00FFFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000A4FF0000C7FF000000000000000000000000000000000000C5FF0000
      9FFF00000000000000000000000000000000FEFCFB00BE835200D2A98700BD81
      4F00BD814F00C1885900C8966C0000000000CC9E7800CFA48000BD814F00BD81
      4F00BF845300CD9F7900DDBEA500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      7AFF0E0EFFFF0E0EFFFF000000000000BDFF0000BFFF000000003727FFFF0E0E
      FFFF000088FF000000000000000000000000FEFEFD00C38D6000BD814F00BD81
      4F00BD814F00BD814F00BD81500000000000E3CAB400BD814F00BD814F00BD81
      4F00BD814F00BE825000F4EAE200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009BFF0E0E
      FFFF0E0EFFFFFFFFFFFF000000002219FFFF2316FFFF00000000FFFFFFFF0E0E
      FFFF0E0EFFFF0000ACFF000000000000000000000000F1E5DB00D7B29400D4AD
      8D00D4AD8D00D5AE8E00E7D0BE0000000000FDFCFB00E0C4AD00D7B39500D7B2
      9300D6B19300E9D5C40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000E0EFFFF0E0E
      FFFFFFFFFFFF00000000000000002A1FFAFF2B22FCFF0000000000000000FFFF
      FFFF0E0EFFFF0E0EFFFF00000000000000000000000000000000F9F3EE00C896
      6C00C7936800F7EFE90000000000000000000000000000000000D7B39500BE83
      5200DDBEA4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFF0000000000000000000000002D1EFEFF2D1EFEFF00000000000000000000
      0000FFFFFFFF0000000000000000000000000000000000000000E8D3C200BD81
      4F00BD814F00E3C9B400000000000000000000000000FEFDFD00C0875700BD81
      4F00C69266000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001D15EEFF1D15EEFF00000000000000000000
      0000000000000000000000000000000000000000000000000000FAF6F300CFA4
      8000CEA17C00F9F3EF0000000000000000000000000000000000E1C6B000C896
      6D00E6D0BD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DEDEDEFF414141FF383838FF383830FF494141FFDEDEDEFF0000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF00000000000000053F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF0000000000000000000000000000000000000000C0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FF000000000000000000000000000000004141
      41FF494141FFCECECEFF514941FF948472FF948472FF514941FFCECECEFF4141
      41FF414141FF000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF00000000000000063F3F3FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3F3F3FFF000000000000000000000000000000009E3E09FF9B3C
      09FF9B3C09FF983709FF953509FF923209FF913009FF8D2E09FF8C2C09FF892A
      09FF872909FF872809FFC0C0C0FF000000000000000000000000414141FF6A62
      59FF6A6259FF302828FF7A7262FFA59484FF9C948CFF7A7262FF302828FF6A62
      59FF6A6259FF494141FF0000000000000000000000FF010101FF000000FF0000
      00FF010101FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF010101FF000000FF00000000000000003F3F3FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3F3F3FFF00000000000000000000000000000000A14109FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF872909FFC0C0C0FF0000000000000000414141FF726A62FFA594
      84FF9C948CFFBDB5A5FFCEC6BDFFC6BDB5FFBDB5ADFFB5A59CFFA59C8CFFA594
      84FF9C948CFF726A62FF414141FF00000000000000FF000000FF363636FF4747
      47FF000000FF020202FF000000FF0D0D0DFF7A7A7AFF878787FF868686FF8787
      87FF838383FF303030FF000000FF000000FF000000003F3F3FFFFFFFFFFFFFFF
      FFFF0000FFFF0000FFFFFF9400FFFF9400FF62BA43FF62BA43FF0069FFFF0069
      FFFFFFFFFFFF3F3F3FFF00000000000000000000000000000000A74709FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF8A2A09FFC0C0C0FF0000000000000000414141FF726A62FFAD9C
      94FFCEC6BDFFD6CEC6FFCEC6BDFFC6BDB5FFBDB5ADFFB5AD9CFFADA59CFFA59C
      8CFFA5948CFF726A62FF414141FF00000000000000FF000000FF717171FFE9E9
      E9FF767676FF000000FF000000FF2E2E2EFFF1F1F1FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF6C6C6CFF000000FF000000FF000000003F3F3FFF3F3F3FFFFFFF
      FFFF0000FFFF0000FFFFFF9400FFFF9400FF62BA43FF62BA43FF0069FFFF0069
      FFFFFFFFFFFF3F3F3FFF00000000000000000000000000000000AB4909FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF8B2C09FFC0C0C0FF00000000DEDEDEFFCECECEFF303030FFCEC6
      BDFFD6D6CEFFD6CEC6FFBDB5ADFF948C7AFF8C847AFFB5A59CFFADA59CFFA59C
      8CFFA5948CFF383830FFCECECEFFDEDEDEFF000000FF000000FF585858FFF8F8
      F8FFFBFBFBFF949494FF000000FF0B0B0BFF999999FFA8A8A8FFA6A6A6FFA7A7
      A7FFA3A3A3FF3F3F3FFF000000FF000000FF00000000000000063F3F3FFFFFFF
      FFFF0000FFFF0000FFFFFF9400FFFF9400FF62BA43FF62BA43FF0069FFFF0069
      FFFFFFFFFFFF3F3F3FFF00000000000000000000000000000000AD4D09FFFFFF
      FFFFFFFFFFFFB2B4B0D8667E40CC53933BF43DB0D0F5568A9ECAB1B4B6D8FFFF
      FFFFFFFFFFFF8F2F09FFC0C0C0FF00000000494949FF414141FF948C84FFDEDE
      D6FFDED6D6FFC6BDB5FF414141FF8C8C8CFF8C8C8CFF414138FFADA59CFFA59C
      8CFFA59484FF8C847AFF414141FF494949FF000000FF000000FF000000FF7A7A
      7AFFF1F1F1FFFFFFFFFFAFAFAFFF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF010101FF000000FF000000003F3F3FFFFFFFFFFFFFFF
      FFFF0000FFFF0000FFFFFF9400FFFF9400FFFFFFFFFFFFFFFFFF0069FFFF0069
      FFFFFFFFFFFF3F3F3FFF00000000000000000000000000000000B15109FFFFFF
      FFFFB2B4B0D85D931FED59A200FF5BA200FF4AAA98FF2EC7FCFF3FAAD4EBB1B4
      B6D8FFFFFFFF913109FFC0C0C0FF00000000494141FFBDB5A5FFC6BDB5FFDEDE
      D6FFDED6CEFF9C948CFF8C8C8CFFFFFFFFFFFFFFFFFF8C8C8CFF948C84FFA594
      8CFFA59484FFADA59CFFBDB5A5FF494141FF000000FF000000FF010101FF0000
      00FF505050FFE2E2E2FFFFFFFFFFC9C9C9FF1A1A1AFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000003F3F3FFF3F3F3FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF9400FFFF9400FFFFFFFFFFFFFFFFFF0069FFFF0069
      FFFFFFFFFFFF3F3F3FFF00000000000000000000000000000000B65609FFFFFF
      FFFF67804CCB5CA500FF8FB776FFD9C6AFFFD5C1AAFF7BCAE9FF2EC8FDFF5587
      9AC8FFFFFFFF953509FFC0C0C0FF00000000494941FFBDB5ADFFCEC6BDFFDEDE
      D6FFDED6CEFF9C9C94FF8C8C8CFFFFFFFFFFFFFFFFFF8C8C8CFF948C84FFA59C
      8CFFA59484FFB5ADA5FFBDB5ADFF494941FF000000FF000000FF010101FF0000
      00FF505050FFE2E2E2FFFFFFFFFFC9C9C9FF1A1A1AFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF00000000000000063F3F3FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF9400FFFF9400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3F3F3FFF00000000000000000000000000000000B75809FFFFFF
      FFFF5E9E0EF85FA93CFFDBC6B5FFF67D42FFF3772AFFD3CCD4FF33C9FAFF38B3
      DFF2FFFFFFFF983709FFC0C0C0FF00000000494949FF414141FFA59C94FFDEDE
      DEFFDED6CEFFCEC6BDFF494949FF8C8C8CFF8C8C8CFF494949FFB5AD9CFFA59C
      8CFFA59484FF9C9C94FF414141FF494949FF000000FF000000FF000000FF7A7A
      7AFFF1F1F1FFFFFFFFFFAFAFAFFF000000FF000000FF010101FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000003F3F3FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3F3F3FFF00000000000000000000000000000000BC5D09FFFFFF
      FFFF63A500F9538F93FFDBBBCBFFFA872DFFF67D1AFFD4CED4FF35CBFCFF39B4
      E0F2FFFFFFFFA14109FFC0C0C0FF00000000DEDEDEFFCECECEFF383838FFDED6
      CEFFDED6CEFFD6CEC6FFCEC6BDFFA59C94FF9C9C94FFBDB5ADFFADA59CFFA59C
      8CFFB5A59CFF414138FFCECECEFFDEDEDEFF000000FF000000FF585858FFF8F8
      F8FFFBFBFBFF939393FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000003F3F3FFF3F3F3FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3F3F3FFF00000000000000000000000000000000BD5F09FFFFFF
      FFFF6B8368CE425DD1FF878AE4FFDBBDCCFFD9C1CCFF7CBCE8FF31B4F0FF5785
      99C9FFFFFFFFA54509FFC0C0C0FF0000000000000000414141FF94948CFFD6D6
      CEFFD6D6CEFFD6CEC6FFCEC6BDFFC6BDB5FFBDB5ADFFB5A59CFFADA59CFFADA5
      9CFFD6CEC6FF94948CFF414141FF00000000000000FF000000FF717171FFE9E9
      E9FF767676FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF00000000000000063F3F3FFFFFFF
      FFFFFF2500FFFF2500FFFF2500FFFF2500FFFF2500FFFF2500FFFF2500FFFF25
      00FFFFFFFFFF3F3F3FFF00000000000000000000000000000000C06209FFFFFF
      FFFFB2B3B6D9515ACBF03F4EE3FF4057E1FF3C58E0FF2F48DEFF3E4ABDEDB0B1
      B5D8FFFFFFFFAB4909FFC0C0C0FF0000000000000000414141FF9C9C94FFDED6
      D6FFDED6CEFFD6D6CEFFCEC6BDFFC6BDB5FFBDB5ADFFB5AD9CFFC6BDB5FFD6D6
      CEFFDED6CEFF9C9C94FF414141FF00000000000000FF000000FF363636FF4848
      48FF000000FF020202FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000003F3F3FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3F3F3FFF00000000000000000000000000000000C26409FFFFFF
      FFFFFFFFFFFFB2B2B7D961659CCF4551D8FB414DD6FB5A5D96CDB0B1B5D8FFFF
      FFFFFFFFFFFFAD4D09FFC0C0C0FF000000000000000000000000414141FFA59C
      9CFF9C9C9CFF414141FFB5B5ADFFDED6D6FFDED6CEFFB5B5ADFF414141FF9C9C
      9CFFA59C9CFF414141FF0000000000000000000000FF010101FF000000FF0000
      00FF010101FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000003F3F3FFF3F3F3FFFFFFF
      FFFFFF2500FFFF2500FFFF2500FFFF2500FFFF2500FFFF2500FFFF2500FFFF25
      00FFFFFFFFFF3F3F3FFF00000000000000000000000000000000C66809FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB15109FFC0C0C0FF000000000000000000000000000000004141
      41FF414141FFCECECEFF414141FFEFEFE7FFE7DEDEFF414141FFCECECEFF4141
      41FF414141FF000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF00000000000000063F3F3FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3F3F3FFF00000000000000000000000000000000C76A09FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB35309FFC0C0C0FF000000000000000000000000000000000000
      000000000000DEDEDEFF494949FF515151FF515151FF494949FFDEDEDEFF0000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF00000000000000063F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF00000000000000000000000000000000CA6C09FFC96A
      09FFC76A09FFC56709FFC46409FFC06209FFBF6009FFBC5D09FFB95B09FFB656
      09FFB15109FFB75809FF00000000000000000000000000000000000000170000
      0058000000140000000000000000000000000000002A0000004E000000120000
      004C000000500000005000000050000000500000000000000000000000000000
      00000000000000000000DCBCA1FFE1C5AEFFD6B091FFDCBCA1FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD814EFFE5CEBBFFE5CEBBFFBD814EFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000480000
      00FF0000003E00000000000000000000000000000080000000FF0000003C0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      00000000000000000000CB9B73FFD2A987FFC28B5CFFCB9B73FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD814EFFD6B293FFD6B293FFC38C5DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000460000
      00FF000000340000004D000000FF0000001400000078000000FF0000003A0000
      00FF0000007E0000002900000031000000310000000000000000000000000000
      00000000000000000000CB9B73FFD2A987FFC28B5CFFCB9B73FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD814EFFD6B293FFD6B293FFC38C5DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B2C7BCFF61A59DFFABC4BBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000460000
      00FF00000041000000FF000000FF000000FF00000072000000FF0000003A0000
      00FF0000005B0000000000000000000000000000000000000000000000000000
      00000000000000000000CB9B73FFD2A987FFC28B5CFFCB9B73FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD814EFFD6B293FFD6B293FFC38C5DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000D7A6FFF599F95FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000460000
      00FF00000096000000FF000000FF000000FF00000098000000FF0000003A0000
      00FF0000005F0000000000000000000000000000000000000000000000000000
      00000000000000000000CB9B73FFD2A987FFC28B5CFFCB9B73FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C08756FFC08756FFBD814EFFD1A784FFD1A784FFC1895AFFC08756FFC087
      56FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000002B8C81FF20887CFF000000000000000000000000BDD1
      C9FF000000000000000000000000000000000000000000000000000000450000
      00FF000000FF000000FF0000002B000000FF000000F4000000FF0000003A0000
      00FF0000005F0000000000000000000000000000000000000000000000000000
      00000000000000000000CB9B73FFD2A987FFC28B5CFFCB9B73FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BD814EFFBD814EFFBD814EFFBD814EFFBD814EFFBD814EFFBD814EFFBD81
      4EFF0000000000000000000000000000000000000000000000000000000060AC
      A2FF15887AFF000000006CACA0FF138678FFB3CAC0FF00000000000000001587
      79FF58A89EFFC4D5CDFF00000000000000000000000000000000000000480000
      00FF000000FF0000003C00000000000000FF000000FF000000FF0000003D0000
      00FF000000620000000000000000000000000000000000000000000000000000
      000000000000D4AD8CFFCB9B73FFCB9B73FFC08857FFCB9B73FFD4AD8CFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD814EFFBD814EFFBD814EFFBD814EFFBD814EFFBD814EFF0000
      000000000000000000000000000000000000000000006AB2A8FF1B8E81FF168B
      7DFF1E8E81FF00000000AAC7BCFF168B7DFF7AB5AAFF00000000000000002290
      83FF168B7DFF198D7EFF62AFA5FF000000000000000000000000000000240000
      00FF000000FF000000000000000000000018000000FF000000FF0000001D0000
      0088000000340000000000000000000000000000000000000000000000000000
      000000000000BE8452FFCB9B73FFBD814EFFBD814EFFCB9B73FFBE8452FF0000
      0000000000000000000000000000000000000000000000000000C08756FF0000
      000000000000BD814EFFBD814EFFBD814EFFBD814EFFBD814EFFBE824FFF0000
      000000000000C08756FF0000000000000000279789FF199182FF259587FF79B5
      A9FF000000000000000000000000229486FF43A295FF00000000000000000000
      000081B8ADFF299789FF199182FF1D9384FF00000000000000000000002A0000
      00FF000000491D16CBFF1D16CBFF0000000000000000000000000000052A1D16
      CBFF000004260000000000000000000000000000000000000000000000000000
      000000000000BE8452FFCB9B73FFBD814EFFBD814EFFCB9B73FFBE8452FF0000
      0000000000000000000000000000000000000000000000000000C08756FFC087
      56FF0000000000000000BD814EFFBD814EFFBD814EFFBD814EFF000000000000
      0000C08756FFC08756FF0000000000000000259A8AFF1D9687FF3CA597FFA7CE
      C5FF00000000000000000000000056AC9EFF209889FF00000000000000000000
      0000AFD1C9FF45A89BFF1D9687FF1D9687FF0000000000000000000000470000
      00FF0000007B0604276E1D16CBFF01000833000004240000021E1D16CBFF1D16
      CBFF0000000C0000000000000000000000000000000000000000000000000000
      000000000000BE8452FFCB9B73FFBD814EFFBD814EFFCB9B73FFBE8452FF0000
      000000000000000000000000000000000000000000000000000000000000C087
      56FFC08756FF00000000BD814EFFBD814EFFBD814EFFBD814EFF00000000BD81
      4EFFC08756FF000000000000000000000000AECDC3FF49AA9BFF209C8BFF209C
      8BFF42AB9CFF000000000000000094C4B8FF209C8BFF9BC8BDFF0000000049AE
      A0FF209C8BFF209C8BFF41A798FFA6CABFFF0000000000000000000000410000
      00FF00000079000000091D16CBFF1D16CBFF1D16CBFF1D16CBFF1D16CBFF0605
      2F7B000000000000000000000000000000000000000000000000000000000000
      000000000000BE8250FFC48E61FFBD814EFFBD814EFFC48E61FFBE8250FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C08756FFC08756FFBD814EFFBD814EFFBD814EFFBD814EFFC08756FFC087
      56FF000000000000000000000000000000000000000000000000ABCDC3FF47AD
      9DFF24A290FF0000000000000000CFDAD1FF25A290FF64B8AAFF0000000024A2
      90FF40AB9BFFA2CBC0FF00000000000000000000000000000000000000FF0000
      00FF000000FF000000001D16CBFF1D16CBFF0202114B09073D8D1D16CBFF0000
      0321000000000000000000000000000000000000000000000000000000000000
      000000000000C18858FFBD814EFFBD814EFFBD814EFFBD814EFFC18858FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BD824FFFBD814EFFBD814EFFBD814EFFBD814EFFBE8350FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A6CEC3FF00000000000000000000000048B1A1FF35AC9BFF000000009ECC
      C0FF000000000000000000000000000000000000000000000035000000FF0000
      00FF000000FF0000006E000004251D16CBFF010007321D16CBFF1D16CBFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E2C8B3FFDAB89CFFDFC1A9FFE2C8B3FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E6CFBCFFD9B79BFFD9B79BFFE4CBB6FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000081C5B8FF2AAC99FFBCD9CFFF0000
      00000000000000000000000000000000000000000002000000FF000000FF0000
      0034000000FF000000FF000000271D16CBFF1D16CBFF1D16CBFF020110480000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E3CAB5FFBD824FFFBD824FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D5AF8FFFBD814EFFBD814EFFCC9D75FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0DBD2FF53BCABFF9DD2C6FF0000
      000000000000000000000000000000000000000000FF000000FF000000860000
      000000000024000000FF000000FF030216571D16CBFF1D16CBFF000000040000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D1A785FFBD814EFFBD814EFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C08756FFC08756FFC08756FFC08756FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000053000000600000000C0000
      0000000000000000003E000000660000011E0302175701010936000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CA9A70FFCA9A70FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E9D6C5FFC08756FFC08756FFE2C7B1FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000008400000084000042E7
      5A0042E75A0042BD5A0073B57B005AC6630039DE5A0039E7520039E7520031E7
      520031E752000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A3998500A399
      8400A2978000A59A840073644E004A341800422A0C004F391F007A6A58000000
      000000000000000000000000000000000000008400000084000021E7420021E7
      420021BD390084C68C00FFFFFF00DEEFDE0021C6390010DE310010DE310010DE
      310010DE310010DE310000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDB7AC00D0C8B500FFFDF900FFFE
      FD00FFFEFD00FFFEFA00F5F1E800C0B7A200705C39004C3001004A2D00003E24
      01006E5D4A000000000000000000000000000084000010D6310010D6310010CE
      290084B58400FFFFFF00FFFFFF00FFFFFF009CCEA50010BD310010BD290010BD
      290010BD310010BD290010BD3100008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000001142302CB0634942D03E2B28AD120A0A67000000000000
      000000000000000000000000000000000000ABA18C00FFFEFB00FFFFFF00FFFF
      FD00FFFDF900FFFDF900FFFEFC00FFFFFE00FEFCF800CEC6B4006A542B005335
      0000462A0000604F350000000000000000000084000018C6310018BD310084AD
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFF70042A54A0018AD310018AD
      310018AD310018AD310018AD3100008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0001BB9A82FFC2C2C2FFB07744FFAE7442FFA16A3DFF97643BFF8A766EFE2015
      148400000000000000000000000000000000A79D8800FFFFFD00F8F5EE00A68D
      5D00986F2100A1762200AF8C4500C7B28700F5EFE000FFFEFC00FBF8F1009B8C
      6F00513402008877540094876D00000000000084000021BD31007BBD8400FFFF
      FF00FFFFFF00F7FFF700A5CE9C00FFFFFF00FFFFFF00CEE7CE0029A5390021B5
      390021B5390021B5390021B5390000840000000000FF000000FF000000000000
      00000000000000000000000000FF000000FF0000000000000000000000000000
      0000000000B1000000B10000000000000000000000000000000000000000160F
      0E6DC39E7CFFDADADAFFB68D67FFBA8555FFB27946FFAB7547FF97908CFF8F6C
      58FE00000000000000000000000000000000A89F8C00FDFAF200CBB89100AB6B
      0000C3800000CB860000CD880000C7830000B37A0900BE9D5A00F1E9D700FFFE
      F900B8AD950095876A00F5EFE200978B73000084000039AD4A00FFFFFF00FFFF
      FF00F7FFF70052BD630021AD3900D6E7D600FFFFFF00FFFFFF007BC6840029BD
      420029BD420029BD420029BD420000840000000000FF000000FF000000000000
      00150000001500000000000000FF000000FF0000000000000000000000080000
      00C5000000FF000000FF000000C500000008A54102FF00000000A84405FFAE4F
      12FFFDFDFDFFECDDD4FFA64102FFCF996EFFB97748FFA84405FFC9C5C2FFAB78
      59FF5C341EC12F1C0F85A0440CF60B08063CE3E0D900CDBD9800E2CFA500CD85
      0000E1970600E69E1000E79F1300E59C0D00DF940300CF890000B0780B00C8B0
      8000FFFCF500EDE9E000FFFFFE00A99E88000084000039BD5200BDDEBD00BDEF
      BD005ABD6B0031C64A0039C64A0063B56B00FFFFFF00FFFFFF00EFFFE7004AB5
      520031C64A0031C64A0031C64A0000840000000000FF000000FF000000020000
      00B9000000B900000002000000FF000000FF0000000000000000000000AA0000
      00FF000000FF000000FF000000FF000000AAA84405FF0807063253423DB5A844
      05FFFEFDFDFFD4AA90FFA84405FFC78453FFB06230FFA84405FFD0B5A3FFBBAF
      A7FF382624A300000004A54001FF3C22129000000000B1844700F3E1B800DEA4
      3200ECAF3900EEB74D00EEB95200EDB54800EBAB2E00DD970D00CC9A3500BF9E
      5B00E1D5BC00FFFFFF00FFFFFF00A99E89000084000039CE520039CE4A0039C6
      4A0042CE520042CE520042CE520039C65200ADDEB500FFFFFF00FFFFFF00B5DE
      B50042C65A0042CE520042CE520000840000000000FF000000FF000000FD0000
      00FF000000FF000000FD000000FF000000FF000000000000000B000000550000
      0071000000FF000000FF0000007100000055A84405FF0605052A847575D3CBA4
      89FFECCBAEFFA84405FFE6C9B1FFA84405FFA84405FFFBF5F2FFA84405FFC4AE
      9CFFA84405FF683616C6130D09520000000300000000C6803A00DC9C3200F4DC
      A900F0C97A00F3D08700F4D28E00F3CD8100F0C06300EBAF3800DE9E1E00F4E3
      BD00FFFEFC00FFFFFF00FFFFFE00A99E88000084000042D65A0042D65A0042D6
      5A0042D65A0042D65A0042D65A0042D65A0052B56300EFFFEF00FFFFFF00FFFF
      FF008CCE8C004ADE630042DE5A0000840000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      002A000000FF000000FF0000002A00000000453022974834279886604DD8CB9A
      79FFD4A17DFFE1B79AFFDDB193FFD9AB8AFFD6AA8EFFD6AA8FFFCD9E80FFC99B
      7EFF3C2C28A200000002000000090000000D00000000D99D6000E4992900F0CE
      8B00F8EACC00F8E4BB00F9E7C200F8E0B100F4D28D00EFBE5D00EAA72400D493
      1200D1B37600BDA77900A7987800827458000084000052DE630052DE630052DE
      63004ADE63004ADE63004AD663004AD6630052D6630084BD8C00FFFFFF00FFFF
      FF00FFFFFF006BC67B005AE7730000840000000000FF000000FF000000E90000
      001A0000001A000000E9000000FF000000FF0000000000000000000000000000
      002A000000FF000000FF0000002A00000000A84405FFA84405FFA84405FFB49F
      9BF0A84405FFA84405FFFFF0E1FFE4C4ACFFE6CFBDFFEFECE9FFA84405FFCFB3
      A0FFA84405FFA84405FF321C0E880101011600000000E9CDAF00E4992F00F1C6
      7900F9E7C400FDF8ED00FDF7EA00FBEDD200F7DCA700F1C77200ECAE3600E095
      0400BF7D0000915A000058320500000000000084000063EF7B006BEF840073EF
      840073EF8C007BEF8C007BEF8C007BEF8C007BEF8C0073DE8400C6D6BD00FFFF
      FF00FFFFFF00DEEFDE007BD68C0000840000000000FF000000FF000000430000
      00000000000000000043000000FF000000FF0000000000000000000000000000
      002A000000FF000000FF0000002A00000000000000000000000000000000150F
      0F66F4E7DBFFFCFAF8FFFEF0E1FFFAEADAFFE7DACEFFE5DCD3FFECECECFFCCC3
      C3FE000000000000000100000000000000000000000000000000DFA04C00EFBF
      6F00F8E1B500FDF5E500FEFAF400FBF0D800F7DEAB00F2C87500ECAF3900E095
      0500BA760000844D00009178600000000000008400007BEF8C0084EF940084EF
      94008CEF9C008CEF9C0094EF9C0094EF9C008CEF9C008CEF9C0084D69400CEF7
      CE00FFFFFF00FFFFFF00ADEFB500008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000130E0E62A59594EDFAF6F3FFFEFEFEFFE3C8AEFFD9BBA3FF0E0908570000
      0000000000000000000000000000000000000000000000000000F2E6D600E6AD
      5600F3CF9000F9E6C000FAECCF00F9E5BE00F5D69700F0C06400E9A62A00D686
      0100A6610000885A2B000000000000000000008400000084000094EFA50094EF
      A5009CEFA5009CEFAD00A5EFAD00A5EFAD009CEFAD009CEFAD009CEFAD009CCE
      9400EFF7E700F7FFEF0000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000E453837A66C5C59C640322FA30F0A095D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E8B76B00F0C47A00F3CE8D00F2CB8400EEBD6600E9A73A00DE890E00BB66
      0000A5713D00000000000000000000000000000000000084000000840000A5EF
      B500ADEFB500ADEFBD00ADEFBD00ADEFBD00ADEFB500ADEFB500ADEFB500ADEF
      B500A5EFB5000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F0D6B000E8B76F00E29E3E00DF8E2500D8822000D59251000000
      0000000000000000000000000000000000000000000000000000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008400FF0084
      00FF008400FF008400FF008400FF008400FF008400FF008400FF008400FF0084
      00FF008400FF008400FF000000000000000000000000000000007F1300007F13
      00007F1300007F1300007F1300007F1300007F1300007F1300007F1300007F13
      00007F1300007F130000000000000000000000000000000000003291FDFF3291
      FDFF3291FDFF3291FDFF3291FDFF3291FDFF3291FDFF3291FDFF3291FDFF3291
      FDFF3291FDFF3291FDFF000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00000000000000000000000000008400FF008400FF40E7
      58FF37DD59FF37DE58FF37E156FF37E452FF37E750FF37E84FFF37E750FF2FE7
      50FF2FE750FF008400FF008400FF00000000000000007F1300007F130000BD8C
      5A00BD8C5A00B5845200B5845200B5845200B5845200B5845200B5845200B584
      5200B58452007F1300007F13000000000000000000003291FDFF3291FDFF83BC
      FDFF83BCFDFF83BCFDFF83BCFDFF82BCFDFF82BCFDFF82BCFDFF82BCFDFF81BB
      FDFF81BBFDFF3291FDFF3291FDFF00000000000000000000FF000000FF006464
      FF006464FF006464FF006464FF006363FF006363FF006363FF006363FF006262
      FF006262FF000000FF000000FF0000000000008400FF008400FF0EDE2FFF0EDE
      2FFF0EDE2FFF0EDE2FFF0EDE2FFF0EDE2FFF0EDE2FFF0EDE2FFF0EDE2FFF0EDE
      2FFF0EDE2FFF0EDE2FFF008400FF008400FF7F1300007F130000B5834A00B583
      4A00B5834A00B5834A00B5834A00B5834A00B5834A00B5834A00B5834A00B583
      4A00B5834A00B5834A007F1300007F1300003291FDFF3291FDFF8BC1FEFF8BC1
      FEFF8BC1FEFF8BC0FEFF8BC0FEFF8BC0FEFF8AC0FEFF8AC0FEFF8AC0FEFF8AC0
      FEFF89C0FEFF89C0FEFF3291FDFF3291FDFF0000FF000000FF006F6FFF006F6F
      FF006F6FFF006E6EFF006E6EFF006E6EFF006D6DFF006D6DFF006D6DFF006D6D
      FF006C6CFF006C6CFF000000FF000000FF00008400FF0EBD2FFF0EBD2FFF0EBD
      2FFF0EBD2FFF0EBD2FFF0EBD2FFF0EBD2FFF0EBD2FFF0EBD2FFF0EBD2FFF0EBD
      2FFF0EBD2FFF0EBD27FF0EBD2FFF008400FF7F130000B57C4A00B57C4A00B57C
      4A00B57C4A00B57C4A00B57C4A00B57C4A00B57C4A00B57C4A00B57C4A00B57C
      4A00B57C4A00B57C4A00B57C4A007F1300003291FDFF94C6FEFF94C6FEFF94C6
      FEFF94C6FEFF94C6FEFF93C5FEFF93C5FEFF92C4FEFF92C4FEFF92C4FEFF92C4
      FEFF91C4FEFF91C4FEFF90C4FEFF3291FDFF0000FF007A7AFF007979FF007979
      FF007979FF007979FF007878FF007878FF007777FF007777FF007777FF007777
      FF007676FF007676FF007575FF000000FF00008400FF16AD2FFF16AD2FFF16AD
      2FFF16AD2FFF16AD2FFF16AD2FFF16AD2FFF16AD2FFF16AD2FFF16AD2FFF16AD
      2FFF16AD2FFF16AD2FFF16AD2FFF008400FF7F130000BD834A00BD834A00BD83
      4A00BD834A00BD834A00BD834A00BD834A00BD834A00BD834A00BD834A00BD83
      4A00BD834A00BD834A00BD834A007F1300003291FDFF9CCAFEFF9CCAFEFF9CCA
      FEFF9CCAFEFF9CCAFEFF9BCAFEFF9BCAFEFF9AC8FEFF9AC8FEFF9AC8FEFF9AC8
      FEFF99C8FEFF99C8FEFF99C8FEFF3291FDFF0000FF008484FF008383FF008383
      FF008383FF008383FF008282FF008282FF008181FF008181FF008181FF008181
      FF008080FF008080FF008080FF000000FF00008400FF1FB537FF1FB537FF1FB5
      37FF1FB537FF1FB537FF1FB537FF1FB537FF1FB537FF1FB537FF1FB537FF1FB5
      37FF1FB537FF1FB537FF1FB537FF008400FF7F130000BF864C00BF864C00BF86
      4C00BF864C00BF864C00BF864C00BF864C00BF864C00BF864C00BF864C00BF86
      4C00BF864C00BF864C00BF864C007F1300003291FDFFA5CEFEFFA4CEFEFFA4CE
      FEFFA4CEFEFFA4CEFEFFA3CEFEFFA3CEFEFFA3CEFEFFA3CEFEFFA2CDFEFFA2CD
      FEFFA1CCFEFFA1CCFEFFA1CCFEFF3291FDFF0000FF008E8EFF008D8DFF008D8D
      FF008D8DFF008D8DFF008C8CFF008C8CFF008C8CFF008C8CFF008B8BFF008B8B
      FF008A8AFF008A8AFF008A8AFF000000FF00008400FF27BD40FF27BD40FF27BD
      40FF27BD40FF27BD40FF27BD40FF27BD40FF27BD40FF27BD40FF27BD40FF27BD
      40FF27BD40FF27BD40FF27BD40FF008400FF7F130000C8865400C8865400C886
      5400C8865400C8865400C8865400C8865400C8865400C8865400C8865400C886
      5400C8865400C8865400C88654007F1300003291FDFFADD3FFFFADD3FFFFADD3
      FFFFADD3FFFFACD2FFFFACD2FFFFABD1FFFFABD1FFFFABD1FFFFABD1FFFFAAD1
      FFFFAAD1FFFFA9D1FFFFA9D1FFFF3291FDFF0000FF009898FF009898FF009898
      FF009898FF009797FF009797FF009696FF009696FF009696FF009696FF009595
      FF009595FF009494FF009494FF000000FF00008400FF2FC648FF2FC648FF2FC6
      48FF2FC648FF2FC648FF2FC648FF2FC648FF2FC648FF2FC648FF2FC648FF2FC6
      48FF2FC648FF2FC648FF2FC648FF008400FF7F130000C8865400C8865400C886
      5400C8865400C8865400C8865400C8865400C8865400C8865400C8865400C886
      5400C8865400C8865400C88654007F1300003291FDFFB5D7FFFFB5D7FFFFB5D7
      FFFFB5D7FFFFB4D7FFFFB4D7FFFFB3D6FFFFB3D6FFFFB3D6FFFFB3D6FFFFB2D5
      FFFFB2D5FFFFB2D5FFFFB2D5FFFF3291FDFF0000FF00A2A2FF00A2A2FF00A2A2
      FF00A2A2FF00A1A1FF00A1A1FF00A0A0FF00A0A0FF00A0A0FF00A0A0FF009F9F
      FF009F9FFF009F9FFF009F9FFF000000FF00008400FF37CE50FF41CF51FF41CF
      51FF41CF51FF41CF51FF41CF51FF41CF51FF41CF51FF41CF51FF41CF51FF41CF
      51FF41CF51FF41CF51FF41CF51FF008400FF7F130000D08E5400D08E5400D08E
      5400D08E5400D08E5400D08E5400D08E5400D08E5400D08E5400D08E5400D08E
      5400D08E5400D08E5400D08E54007F1300003291FDFFBDDBFFFFBDDBFFFFBDDB
      FFFFBDDBFFFFBCDBFFFFBCDBFFFFBCDBFFFFBCDBFFFFBBDBFFFFBBDBFFFFBAD9
      FFFFBAD9FFFFBAD9FFFFBAD9FFFF3291FDFF0000FF00ACACFF00ACACFF00ACAC
      FF00ACACFF00ABABFF00ABABFF00ABABFF00ABABFF00AAAAFF00AAAAFF00A9A9
      FF00A9A9FF00A9A9FF00A9A9FF000000FF00008400FF40D658FF40D658FF40D6
      58FF40D658FF40D658FF40D658FF40D658FF40D658FF40D658FF40D658FF40D6
      58FF40D658FF40D658FF40D658FF008400FF7F130000D0965C00D0965C00D096
      5C00D0965C00D0965C00D0965C00D0965C00D0965C00D0965C00D0965C00D096
      5C00D0965C00D0965C00D0965C007F1300003291FDFFC6E0FFFFC6E0FFFFC5DF
      FFFFC5DFFFFFC4DFFFFFC4DFFFFFC4DFFFFFC4DFFFFFC3DFFFFFC3DFFFFFC3DF
      FFFFC2DEFFFFC2DEFFFFC2DEFFFF3291FDFF0000FF00B7B7FF00B7B7FF00B6B6
      FF00B6B6FF00B5B5FF00B5B5FF00B5B5FF00B5B5FF00B4B4FF00B4B4FF00B4B4
      FF00B3B3FF00B3B3FF00B3B3FF000000FF00008400FF47DE61FF47DE61FF47DE
      61FF47DE61FF47DE61FF47DE61FF47DE61FF47DE61FF47DE61FF47DE61FF47DE
      61FF47DE61FF47DE61FF47DE61FF008400FF7F130000D89E6500D89E6500D89E
      6500D89E6500D89E6500D89E6500D89E6500D89E6500D89E6500D89E6500D89E
      6500D89E6500D89E6500D89E65007F1300003291FDFFCDE4FFFFCDE4FFFFCDE4
      FFFFCDE4FFFFCDE4FFFFCCE3FFFFCCE3FFFFCCE3FFFFCCE3FFFFCBE3FFFFCBE3
      FFFFCAE2FFFFCAE2FFFFCAE2FFFF3291FDFF0000FF00C1C1FF00C1C1FF00C1C1
      FF00C0C0FF00C0C0FF00BFBFFF00BFBFFF00BFBFFF00BFBFFF00BEBEFF00BEBE
      FF00BDBDFF00BDBDFF00BDBDFF000000FF00008400FF71EF8DFF71EF8DFF71EF
      8DFF71EF8DFF71EF8DFF71EF8DFF71EF8DFF71EF8DFF71EF8DFF71EF8DFF71EF
      8DFF71EF8DFF71EF8DFF71EF8DFF008400FF7F130000D8A67500D8A67500D8A6
      7500D8A67500D8A67500D8A67500D8A67500D8A67500D8A67500D8A67500D8A6
      7500D8A67500D8A67D00D8A67D007F1300003291FDFFD5E8FFFFD5E8FFFFD5E8
      FFFFD5E8FFFFD5E8FFFFD4E8FFFFD4E8FFFFD4E8FFFFD4E8FFFFD3E8FFFFD3E8
      FFFFD3E8FFFFD3E8FFFFD2E7FFFF3291FDFF0000FF00CBCBFF00CBCBFF00CBCB
      FF00CACAFF00CACAFF00C9C9FF00C9C9FF00C9C9FF00C9C9FF00C8C8FF00C8C8
      FF00C8C8FF00C8C8FF00C7C7FF000000FF00008400FF8DEF9DFF8DEF9DFF8DEF
      9DFF8DEF9DFF8DEF9DFF8DEF9DFF8DEF9DFF8DEF9DFF8DEF9DFF8DEF9DFF8DEF
      9DFF8DEF9DFF8DEF9DFF8DEF9DFF008400FF7F130000CEA57300CEA57300CEA5
      7300CEA57300CEA57300CEA57300CEA57300CEA57300CEA57300CEA57300CEA5
      7300CEA57300CEA57B00CEA57B007F1300003291FDFFDDECFFFFDDECFFFFDDEC
      FFFFDCECFFFFDCECFFFFDCECFFFFDCECFFFFDCECFFFFDCECFFFFDBECFFFFDBEC
      FFFFDBECFFFFDBECFFFFDAECFFFF3291FDFF0000FF00D5D5FF00D5D5FF00D5D5
      FF00D4D4FF00D4D4FF00D4D4FF00D4D4FF00D3D3FF00D3D3FF00D2D2FF00D2D2
      FF00D2D2FF00D2D2FF00D1D1FF000000FF00008400FF008400FF94EFA5FF93EF
      A5FF93EFA5FF94EFA5FF95EFA5FF97EFA5FF99EFA5FF9BEFA5FF9CEFA5FF9CEF
      A5FF9DEFA5FF9DEFA5FF008400FF008400FF7F1300007F130000D6AD8400D6AD
      8400D6AD8400D6AD8400D6AD8400D6AD8400D6AD8400D6AD8400D6AD8400D6AD
      8400D6AD8400D6AD84007F1300007F1300003291FDFF3291FDFFE5F1FFFFE5F1
      FFFFE4F1FFFFE4F1FFFFE4F1FFFFE4F1FFFFE4F1FFFFE4F0FFFFE4F0FFFFE3F0
      FFFFE3F0FFFFE3F0FFFF3291FDFF3291FDFF0000FF000000FF00DFDFFF00DFDF
      FF00DEDEFF00DEDEFF00DEDEFF00DEDEFF00DEDEFF00DDDDFF00DDDDFF00DCDC
      FF00DCDCFF00DCDCFF000000FF000000FF0000000000008400FF008400FFA4EF
      B5FFA4EFB5FFA5EFB5FFA6EFB5FFA8EFB5FFAAEFB5FFACEFB5FFADEFB5FFADEF
      B5FFAEEFB5FF008400FF008400FF00000000000000007F1300007F130000DEB5
      8C00DEB59400DEB59400DEB59400DEB59400DEB69400DEB89400DEB99400DEBB
      9400DEBC94007F1300007F13000000000000000000003291FDFF3291FDFFEDF5
      FFFFEDF5FFFFECF5FFFFECF5FFFFECF5FFFFECF5FFFFECF5FFFFECF5FFFFECF5
      FFFFECF5FFFF3291FDFF3291FDFF00000000000000000000FF000000FF00E9E9
      FF00E9E9FF00E8E8FF00E8E8FF00E8E8FF00E8E8FF00E7E7FF00E7E7FF00E7E7
      FF00E7E7FF000000FF000000FF00000000000000000000000000008400FF0084
      00FF008400FF008400FF008400FF008400FF008400FF008400FF008400FF0084
      00FF008400FF008400FF000000000000000000000000000000007F1300007F13
      00007F1300007F1300007F1300007F1300007F1300007F1300007F1300007F13
      00007F1300007F130000000000000000000000000000000000003291FDFF3291
      FDFF3291FDFF3291FDFF3291FDFF3291FDFF3291FDFF3291FDFF3291FDFF3291
      FDFF3291FDFF3291FDFF000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000008396B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003131AD003131AD003131AD003131
      AD0000000000000000003131AD003131AD003131AD003131AD00000000000000
      00003131AD003131AD003131AD003131AD000000000000000000000000000000
      000010427300215A840008396B0008396B00294A730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C5A
      29009C5A29009C5A29009C5A29009C5A29009C5A29009C5A29009C5A29009C5A
      29009C5A2900000000000000000000000000087BAD00087BAD00087BAD00087B
      AD00087BAD00087BAD00087BAD00087BAD00087BAD00087BAD00087BAD00087B
      AD00087BAD00087BAD0000000000000000003131AD003131AD003131AD003131
      AD0000000000000000003131AD003131AD003131AD003131AD00000000000000
      00003131AD003131AD003131AD003131AD000000000000000000000000000839
      63003973A50029639400215A8C00215A8C0008396B0008396B00000000000000
      0000000000000000000000000000000000000000000000000000000000009C5A
      2900CE7B3900CE7B3900CE7B3900CE7B3900CE7B3900CE7B3900CE7B3900CE7B
      39009C5A2900000000000000000000000000087BAD0008BDF70008BDF70008B5
      F70008B5EF0008ADEF0008ADE70008A5E70008A5DE00089CDE00089CD600089C
      D6000894CE00087BAD0000000000000000003131AD003131AD003131AD003131
      AD0000000000000000003131AD003131AD003131AD003131AD00000000000000
      00003131AD003131AD003131AD003131AD000000000000000000103963002963
      94004A84B500316B9C0029639400296394002963940008396B0008396B000839
      6B000000000000000000000000000000000000000000000000009C5A2900CE7B
      3900CE7B3900CE7B3900CE7B3900CE7B3900CE7B3900CE7B3900CE7B3900CE7B
      3900CE7B39009C5A29000000000000000000087BAD0018A5D60008BDFF0008BD
      FF0008B5F70008B5F70008B5EF0008ADEF0008ADE70008A5E70008A5DE00089C
      DE00089CD600087BAD0000000000000000003131AD003131AD003131AD003131
      AD0000000000000000003131AD003131AD003131AD003131AD00000000000000
      00003131AD003131AD003131AD003131AD0000000000294A7300185284004284
      B5005294BD0042739C0008396B00738C9C002963940008396B00296394002963
      940008396B0008396B00000000000000000000000000000000009C5A2900CE7B
      3900CE7B3900FFFFF700FFFFFF00CE7B3900CE7B3900CE7B3900CE7B3900CE7B
      3900CE7B39009C5A29000000000000000000087BAD00087BAD0008BDFF0008BD
      FF0008BDFF0008BDF70008B5F70008B5EF0008ADEF0008ADE70008A5E70008A5
      DE00089CDE00089CD600087BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000526B8C0010427300397BAD004A8C
      BD003973A500104A73002963940008396B0008396B0008396B00296394002963
      94002963940008396B000000000000000000000000009C5A2900CE7B3900CE7B
      3900CE7B3900FFFFF700FFFFFF00CE7B3900CE7B3900CE7B3900CE7B3900CE7B
      3900CE7B3900CE7B39009C5A290000000000087BAD00087BAD0010C6FF0008BD
      FF0008BDFF0008BDFF0008BDFF0008B5F70008B5F70008ADEF0008ADEF0008AD
      E70008A5E70008A5DE00087BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000083963003173A5004284B5002963
      9C0008396B00296394002963940029639400738C9C0008396B00738C9C002963
      94002963940008396B000000000000000000000000009C5A2900CE7B3900CE7B
      3900CE7B3900FFFFF700FFFFFF00CE7B3900CE7B3900CE7B3900CE7B3900CE7B
      3900CE7B3900CE7B39009C5A290000000000087BAD00087BAD0063EFFF0063EF
      FF0063EFFF0063EFFF0063EFFF0063EFFF0008BDF70008B5F70008B5EF0008AD
      EF0008ADE70008A5E700087BAD00000000003131AD003131AD003131AD003131
      AD0000000000000000003131AD003131AD003131AD003131AD00000000000000
      00003131AD003131AD003131AD003131AD00083163004284B500215284001042
      73005A9CCE002963940029639400296394002963940008396B0008396B00738C
      9C002963940008396B0000000000000000009C5A2900CE7B3900CE7B3900CE7B
      3900CE7B3900FFFFF700FFFFFF00FEFDF400FDFCF300FCFBF200CE7B3900CE7B
      3900CE7B3900CE7B3900CE7B39009C5A2900087BAD00107BAD00087BAD00087B
      AD00087BAD00087BAD00087BAD00087BAD0063EFFF0008BDFF0008B5F70008B5
      F70008ADEF0008ADE70008A5DE00087BAD003131AD003131AD003131AD003131
      AD0000000000000000003131AD003131AD003131AD003131AD00000000000000
      00003131AD003131AD003131AD003131AD0008396300184A7B00104A7B005AA5
      D60073BDE70029639400316B9C00296B9C002963940008396B00296394000839
      6B0008396B0008396B0000000000000000009C5A2900CE7B3900CE7B3900CE7B
      3900CE7B3900FFFFF700FFFFFF00CE7B3900CE7B3900FFFFFF00FFFFF700CE7B
      3900CE7B3900CE7B3900CE7B39009C5A2900087BAD005AEFFF0042BDD60042BD
      D60042BDD60042BDD60042BDD60042BDD600087BAD0063EFFF0063EFFF0063EF
      FF0063EFFF0063EFFF0008ADEF00087BAD003131AD003131AD003131AD003131
      AD0000000000000000003131AD003131AD003131AD003131AD00000000000000
      00003131AD003131AD003131AD003131AD0010396300185284005AA5D6006BB5
      E7007BC6EF0029639400316B9C00316B9C00296B9C0008396B00296394002963
      940021528400083163000000000000000000000000009C5A2900CE7B3900CE7B
      3900CE7B3900FFFFF700FFFFFF00CE7B3900CE7B3900CE7B3900FFFFF700CE7B
      3900CE7B3900CE7B39009C5A290000000000087BAD00ADFFFF005AEFFF005AEF
      FF005AEFFF005AEFFF005AEFFF0052DEEF0042BDD600087BAD00087BAD00087B
      AD00087BAD00087BAD00087BAD00087BAD003131AD003131AD003131AD003131
      AD0000000000000000003131AD003131AD003131AD003131AD00000000000000
      00003131AD003131AD003131AD003131AD0010396300529CC6006BADDE0073BD
      EF009CD6F700BDD6E70084ADC600528CB50031739C0008396B00296394002963
      940029639400083163000000000000000000000000009C5A2900CE7B3900C076
      3900CE7B3900FFFFF700FFFFFF00CE7B3900CE7B3900FFFFFF00FFFFF700CE7B
      3900CE7B3900CE7B39009C5A290000000000087BAD00ADFFFF0052EFFF005AEF
      FF005AEFFF0063EFFF0063F7FF005AEFFF0052DEEF0042BDD60042BDD60042BD
      D60042BDD600087BAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000103963005AA5D60073BDE700A5D6
      EF00A5CEEF0073BDE7007BB5E7007BADD6006B94B50010396B0042739C002963
      94002963940008316300000000000000000000000000000000009C5A2900C67B
      3900CE7B3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE7B3900CE7B
      3900CE7B39009C5A29000000000000000000087BAD00ADFFFF0063F7FF006BF7
      FF006BF7FF0073F7FF0073F7FF007BFFFF007BFFFF0084FFFF0084FFFF0084FF
      FF0084FFFF00087BAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001039630073B5DE009CC6E70084BD
      E7006BADDE005AA5D6005294C600215A8C0008396300215284003173A5003973
      9C00295A8C00214A7300000000000000000000000000000000009C5A2900CB7B
      3900CE7B3900CE7B3900CE7B3900CE7B3900CE7B3900CE7B3900CE7B3900CB7B
      3900CE7B39009C5A29000000000000000000087BAD00ADFFFF0073F7FF0073F7
      FF007BFFFF007BF7FF007BF7FF00087BAD00087BAD00087BAD00087BAD00087B
      AD00087BAD000000000000000000000000003131AD003131AD003131AD003131
      AD0000000000000000003131AD003131AD003131AD003131AD00000000000000
      00003131AD003131AD003131AD003131AD0021426B006BA5C60063A5D6005AA5
      D6005294C600296B9C0008396B00104A7B00296B9C0029639400104A7B000831
      63004A6384000000000000000000000000000000000000000000000000009C5A
      2900CE7B3900CE7B3900CE7B3900CE7B3900CE7B3900CE7B3900CE7B3900CE7B
      39009C5A290000000000000000000000000000000000087BAD00ADFFFF00ADFF
      FF00ADFFFF00ADFFFF00087BAD00000000000000000000000000000000000000
      0000000000000000000000000000000000003131AD003131AD003131AD003131
      AD0000000000000000003131AD003131AD003131AD003131AD00000000000000
      00003131AD003131AD003131AD003131AD009CA5B500425A7B0021426B000839
      6B001042730008396B00184A7B00215A84001042730010396300526B8C000000
      0000000000000000000000000000000000000000000000000000000000009C5A
      29009C5A29009C5A29009C5A29009C5A29009C5A29009C5A29009C5A29009C5A
      29009C5A29000000000000000000000000000000000000000000087BAD00087B
      AD00087BAD00087BAD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003131AD003131AD003131AD003131
      AD0000000000000000003131AD003131AD003131AD003131AD00000000000000
      00003131AD003131AD003131AD003131AD000000000000000000000000000000
      0000A5ADB5008494A500637B9400526B8C006B7B940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003131AD003131AD003131AD003131
      AD0000000000000000003131AD003131AD003131AD003131AD00000000000000
      00003131AD003131AD003131AD003131AD0000000000FFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFF
      FFFF00000000FFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFF
      FFFF00000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000E0943200E0933000E0922D00E0922D00E0922D00E0922D00E0933000E094
      3200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEB59C00CEB59C0000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      0000000000FFFFFFFFFF00000000000000FFFFFFFFFF00000000000000FFFFFF
      FFFF00000000000000FF000000FFFFFFFFFF000000FF000000FFFFFFFFFF0000
      0000000000FFFFFFFFFF00000000000000FFFFFFFFFF00000000000000FFFFFF
      FFFF00000000000000FF000000FFFFFFFFFF0000000000000000FD6E8F000000
      000000000000E0922D00E0922D00E0922D00E0922D00E0922D00E0922D000000
      00000000000000C0830000000000000000000000000000000000000000000000
      00000000000000000000CEB59C00A56B4200A56B4200CEB59C00000000000000
      000000000000000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF00000000FD6E8F00FD6E8F00FD6E
      8F000000000000000000E4A14B00E0922D00E0922D00E0922D00000000000000
      000000C0830000C0830000C08300000000000000000000000000000000000000
      000000000000CEB59C00A56B4200A56B4200A56B4200A56B4200CEB59C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FD6E8F00FD6E8F00FD6E8F00FD6E
      8F00FD6E8F0000000000000000000000000000000000000000000000000000C0
      830000C0830000C0830000C0830000C083000000000000000000000000000000
      0000CEB59C00A56B4200A56B4200A56B4200A56B4200A56B4200A56B4200CEB5
      9C0000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFD6E8F00FD6E8F00FD6E8F00FD6E
      8F00FD6E8F0000000000000000000000000000000000000000000000000000C0
      830000C0830000C0830000C0830000C083000000000000000000000000000000
      0000CEB59C00A56B4200A56B4200A56B4200A56B4200A56B4200A56B4200CEB5
      9C0000000000000000000000000000000000000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFFFD6E8F00FD6E8F00FD6E8F00FD6E
      8F00000000000000000000000000000000000000000000000000000000000000
      000000C0830000C0830000C0830000C083000000000000000000000000000000
      000000000000CEB59C00A56B4200A56B4200A56B4200A56B4200CEB59C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FD6E8F00FD6E8F00FD6E8F00FD6E
      8F00000000000000000000000000000000000000000000000000000000000000
      000000C0830000C0830000C0830000C083000000000000000000000000000000
      000000000000CEB59C00A56B4200A56B4200A56B4200A56B4200CEB59C000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CEB59C00A56B4200A56B4200CEB59C00CEB59C00A56B4200A56B4200CEB5
      9C0000000000000000000000000000000000000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB59C00CEB5
      9C00A56B4200A56B4200CEB59C000000000000000000CEB59C00A56B4200A56B
      4200CEB59C00CEB59C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E747EA00E42CE700E42CE700E42C
      E700000000000000000000000000000000000000000000000000000000000000
      00001C8BFE001C8BFE001C8BFE001C8BFE0000000000CEB59C00A56B4200A56B
      4200A56B4200CEB59C0000000000000000000000000000000000CEB59C00A56B
      4200A56B4200A56B4200CEB59C0000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFE42CE700E42CE700E42CE700E42C
      E700000000000000000000000000000000000000000000000000000000000000
      00001C8BFE001C8BFE001C8BFE001C8BFE00CEB59C00A56B4200A56B4200A56B
      4200A56B4200CEB59C0000000000000000000000000000000000CEB59C00A56B
      4200A56B4200A56B4200A56B4200CEB59C00000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFFE42CE700E42CE700E42CE700E42C
      E700E42CE7000000000000000000000000000000000000000000000000001C8B
      FE001C8BFE001C8BFE001C8BFE001C8BFE00A56B4200A56B4200A56B4200A56B
      4200A56B4200A56B4200CEB59C00CEB59C00CEB59C00CEB59C00A56B4200A56B
      4200A56B4200A56B4200A56B4200A56B42000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E42CE700E42CE700E42CE700E42C
      E700E42CE7000000000000000000000000000000000000000000000000001C8B
      FE001C8BFE001C8BFE001C8BFE001C8BFE00A56B4200A56B4200A56B4200A56B
      4200A56B4200A56B4200A56B4200A56B4200A56B4200A56B4200A56B4200A56B
      4200A56B4200A56B4200A56B4200A56B4200FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF00000000E42CE700E42CE700E42C
      E70000000000000000002120E1002120E1002120E1002120E100000000000000
      00001C8BFE001C8BFE001C8BFE0000000000CEB59C00A56B4200A56B4200A56B
      4200A56B4200CEB59C00CEB59C00CEB59C00CEB59C00CEB59C00CEB59C00A56B
      4200A56B4200A56B4200A56B4200CEB59C00000000FFFFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFF
      FFFF00000000FFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFF
      FFFF00000000FFFFFFFF000000FFFFFFFFFF0000000000000000E42CE7000000
      0000000000002928E2002120E1002120E1002120E1002120E1002120E1000000
      0000000000001C8BFE00000000000000000000000000CEB59C00A56B4200A56B
      4200CEB59C00000000000000000000000000000000000000000000000000CEB5
      9C00A56B4200A56B4200CEB59C0000000000000000FF000000FFFFFFFFFF0000
      0000000000FFFFFFFFFF00000000000000FFFFFFFFFF00000000000000FFFFFF
      FFFF00000000000000FF000000FFFFFFFFFF000000FF000000FFFFFFFFFF0000
      0000000000FFFFFFFFFF00000000000000FFFFFFFFFF00000000000000FFFFFF
      FFFF00000000000000FF000000FFFFFFFFFF0000000000000000000000000000
      00003231E3002120E1002120E1002120E1002120E1002120E1002120E1002120
      E100000000000000000000000000000000000000000000000000CEB59C00CEB5
      9C00000000000000000000000000000000000000000000000000000000000000
      0000CEB59C00CEB59C000000000000000000000000000000000000000000AF91
      71FF955F37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F
      37FFAF9171FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AF9171FF955F37FF955F
      37FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FF955F37FF955F37FFAF9171FF0000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF840000FF8400
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AF9171FF955F37FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FF955F37FFAF9171FF00000000000000FF848484FF8484
      84FF848484FF848484FF848484FF848484FFFFFF00FFFFFF00FFFFFF00FF8400
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000955F37FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFFFFFFFFFF94
      00FFFF9400FFFF9400FFFF9400FF955F37FF00000000000000FF848484FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FFFFFF00FF840000FF840000FF8400
      00FF000000000000000000000000000000000000000000000000030600311D3F
      01992F6701C32F6A00C62F6A00C62F6A00C62F6A00C62F6A00C62F6A00C62F67
      01C31D3F01990306003200000000000000000000000000000000000009320202
      5C99010195C3000099C6000099C6000099C6000099C6000099C6000099C60101
      96C401015C99000009320000000000000000955F37FFFF9400FFFFFFFFFFFFFF
      FFFFFFFFFFFFFF9400FFFF9400FFFFFFFFFFFFFFFFFFFFFFFFFFFF9400FFFF94
      00FFFFFFFFFFFFFFFFFFFF9400FF976038FF00000000000000FF848484FF0000
      00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF008484FF0000FFFF00FFFFFF0000
      FFFF0000000000000000000000000000000000000000112401734EAD00FD4FB0
      00FF4FB000FF4FB000FF4FB000FF4FB000FF50B101FF90CD5DFFC5E5ABFFC8E6
      AFFF9AD16AFF53AF06FD112501750000000000000000010133730101FBFD5D5D
      FFFFABABFFFFAFAFFFFF6A6AFFFF0505FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FBFD0101357500000000955F37FFFF9400FFFF9400FFFF94
      00FFFFFFFFFFFF9400FFFFFFFFFFFF9400FFFFFFFFFFFFFFFFFFFF9400FFFFFF
      FFFFFF9400FFFF9400FFFF9400FF976038FF00000000000000FF000000FFC6C6
      C6FFFFFFFFFFFFFFFFFF008484FF0000FFFF00FFFFFF00FFFFFF0000FFFF0000
      000000000000000000000000000000000000060D00464FAE00FE5FB716FFFFFF
      FFFFFFFFFFFF53B204FF4FB000FF50B000FFC4E4A9FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFD5ECC1FF54B006FE060E0048000013460000FDFEA9A9FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C1FFFF0606FFFF0000FFFF0000FFFF8888
      FFFFFFFFFFFF0000FFFF0000FDFE00001448955F37FFFF9400FFFFFFFFFFFFFF
      FFFFFFFFFFFFFF9400FFFFFFFFFFFF9400FFFF9400FFFFFFFFFFFF9400FFFFFF
      FFFFFF9400FFFF9400FFFF9400FF976038FF00000000000000FF848484FFFFFF
      FFFFFFFFFFFF008484FF00FFFFFF00FFFFFF0000FFFF0000FFFF000000000000
      0000000000000000000000000000000000002D6202BE4FB000FFFFFFFFFF4FB0
      00FF4FB000FFFFFFFFFF4FB000FF89CA53FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF9ED371FF2E6402C002028DBE5353FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7171FFFF0000FFFF0000FFFF7070
      FFFFFFFFFFFF0000FFFF0000FFFF020290C0955F37FFFF9400FFFFFFFFFFFF94
      00FFFF9400FFFF9400FFFFFFFFFFFF9400FFFF9400FFFFFFFFFFFF9400FFFFFF
      FFFFFF9400FFFF9400FFFF9400FF976038FF00000000000000FF848484FFFFFF
      FFFFFFFFFFFF000084FF008484FF0000FFFFFFFF00FF840000FF000000000000
      0000000000000000000000000000000000004BA502F64FB000FFFFFFFFFF4FB0
      00FF4FB000FFFFFFFFFF4FB000FFBBE09CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFD0EABAFF4DA702F80202EDF69C9CFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABAFFFF0000FFFF0000FFFF7070
      FFFFFFFFFFFF0000FFFF0000FFFF0202F1F8955F37FFFF9400FFFFFFFFFFFFFF
      FFFFFFFFFFFFFF9400FFFF9400FFFFFFFFFFFFFFFFFFFF9400FFFF9400FFFFFF
      FFFFFF9400FFFF9400FFFF9400FF976038FF00000000000000FF848484FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF00FF840000FF000000000000
      0000000000000000000000000000000000004DA603F84FB000FFFFFFFFFF4FB0
      00FF4FB000FFFFFFFFFF4FB000FFBCE19EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFD1EABCFF4DA802F90303F0F89E9EFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCFFFF0000FFFF0000FFFF7070
      FFFFFFFFFFFF0000FFFF0000FFFF0202F2F9955F37FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FF976038FF00000000000000FF848484FFC6C6
      C6FFC6C6C6FFC6C6C6FFC6C6C6FF000000FFFFFF00FF840000FF000000000000
      0000000000000000000000000000000000002F6702C24FB000FFFFFFFFFF4FB0
      00FF4FB000FFFFFFFFFF4FB000FF8DCB57FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFA1D575FF2E6701C2020293C25757FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7575FFFF0000FFFF8888FFFFFFFF
      FFFFFFFFFFFF0000FFFF0000FFFF020295C3955F37FFFF9400FFFF9400FF955F
      37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F
      37FFA1673DFFFF9400FFFF9400FF976038FF00000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFFFFF00FF840000FF000000000000
      0000840000FF840000FF840000FF00000000070F004C4FB000FF63B91DFFFFFF
      FFFFFFFFFFFF56B309FF4FB000FF50B101FFCAE7B1FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFDAEEC8FF55B308FF0710004E0000174D0101FFFFB1B1FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C8FFFF0808FFFF0000FFFF3939FFFF8888
      FFFFFFFFFFFF0000FFFF0000FFFF0000174E955F37FF955F37FF955F37FF955F
      37FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FF955F37FF955F37FF955F37FF905B35FF00000000840000FFFFFF00FF8400
      00FFC6C6C6FFC6C6C6FF840000FFFFFF00FFFFFF00FF840000FF000000000000
      0000840000FFFFFF00FF840000FF0000000000000000122700794FAE00FE4FB0
      00FF4FB000FF4FB000FF4FB000FF4FB000FF51B103FF97D067FFCDE8B6FFD0EA
      BAFFA1D475FF55B108FE142A017D000000000000000001013B7B0303FDFE6767
      FFFFB6B6FFFFBABAFFFF7575FFFF0808FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FDFE01013F7F00000000955F37FF955F37FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FF955F37FF9A6B48FF00000000840000FFFFFF00FF8400
      00FF840000FF840000FF840000FFFFFF00FFFFFF00FF840000FF840000FF8400
      00FF840000FFFFFF00FF840000FF0000000000000000000000000409003A2147
      01A3377702D1377B00D5377B00D5377B00D5377B00D5377B00D5377B00D53777
      02D1214901A40409003C0000000000000000000000000000000000000D3B0101
      69A40202ABD10000B2D50000B2D50000B2D50000B2D50000B2D50000B2D50202
      ABD1010169A400000E3D0000000000000000AF9171FF955F37FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FF955F37FFAF9171FF00000000840000FFFFFF00FFFFFF
      00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF
      00FFFFFF00FFFFFF00FF840000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AF9171FF955F37FF955F
      37FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FF955F37FF955F37FFA27758FF0000000000000000840000FF840000FF8400
      00FF840000FF840000FF840000FF840000FF840000FF840000FF840000FF8400
      00FF840000FF840000FF840000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AF91
      71FF955F37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F
      37FFAF9171FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E3F8EAFFC2F0
      D0FFC9F1D6FFF4FCF6FF00000000000000000000000000000000FFF7F0FFFFD8
      AFFFFFD3A3FFFFECD7FF000000000000000000000000000000000E2754FF0C26
      53FFD1D5DDFFD5D8E0FFD6D9E0FF0C2653FF102F5BFF13315CFF092656FF0C26
      53FF0C2653FFCACCCDFF00000000000000000000000000000000000000000000
      0000000000FF008080FF008080FF000000FF0000000000000000000000FF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFEFDFFA1E8B7FF63DA8BFF63DA
      8BFF63DA8BFF6BDC91FFCFF3DBFF0000000000000000FFDBB5FFFF931BFFFF8D
      0EFFFF8D0EFFFF8D0EFFFFBA6BFFFFFDFCFF00000000000000003777A7FF3E7A
      AAFF051643FF051643FF051643FF2A72AEFF49ABD0FF52B7D8FF1C74B8FF3077
      AAFF3678A7FF061118FF00000000000000000000000000000000000000000000
      000000FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF2200FFFF2200FF00000000000000000000
      0000FF2200FFFF2200FFFF2200FF00000000B6EDC7FF63DA8BFF63DA8BFF74DE
      98FF6BDC91FF63DA8BFF67DB8EFFE9F9EEFFFFEEDDFFFF9015FFFF8D0EFFFF91
      18FFFF9826FFFF8D0EFFFF8D0EFFFFC98FFF0000000000000000000000003E8B
      BEFF2C83BCFF44A6CDFF40A1C9FF1D74ADFF1669A4FF176BA6FF186AA6FF2980
      B4FF224D85FF030D3CFF000006FFB2B2C1FF0000000000000000000000000000
      00FF00FF00FF00FF00FF008080FF008080FF008080FF008080FF008080FF0000
      00FF008080FF00FF00FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000FF2200FFFF2200FF00000000000000000000
      0000FF2200FFFF2200FFFF2200FF0000000075DE99FF63DA8BFFA6E9BBFFFEFE
      FEFFF3FCF6FF76DE99FF63DA8BFFB0EBC2FFFFC384FFFF8D0EFFFF9A2AFFFFF5
      EBFFFFFEFEFFFFBB6EFFFF8D0EFFFF9A2AFF0000000000000000000000003B7B
      A9FF15649DFF166AA5FF1569A4FF166CACFF1970B5FF1E77BAFF2682C1FF2F87
      C2FF306EA5FF07174EFF0F0F36FF000059FF0000000000000000000000000000
      0000008080FF008080FF008080FF008080FF000000FF000000FF000000FF0000
      0000000000FF008080FF00FF00FF008080FF0000000000000000000000000000
      0000808080FF808080FF808080FFFF2200FFFF2200FF808080FF808080FFFF22
      00FFFF2200FFFF2200FF000000000000000065DA8CFF63DA8BFFD3F4DDFF0000
      000000000000D0F3DBFFB4ECC6FFCFF3DBFFFFB767FFFF8D0EFFFFB562FF0000
      000000000000FFDEBCFFFF8D0EFFFF8E10FF00000000000000000C2653FF6EA0
      BCFF406393FF1F61A0FF2377BDFF2679BDFF2A84C2FF308AC7FF3B94CFFF3E95
      D0FF3F8EC4FF204889FF000032FF000005FF0000000000000000000000000000
      0000000000FF000000FF008080FF00FF00FF008080FF008080FF000000000000
      0000000000000000000000000000000000000000000000000000808080FF8080
      80FFFFFFFFFFFFFFFFFFFFFFFFFFFF2200FFFF2200FFFFFFFFFFFFFFFFFFFF22
      00FFFF2200FF00000000000000000000000082E09FFF63DA8BFF90E4AAFFEFFB
      F3FF00000000000000000000000000000000FFC990FFFF8D0EFFFF941DFFFFF0
      E0FF00000000FFAE54FFFF8D0EFFFFA036FF00000000000000000C2653FF6DC7
      E7FFEAEAEAFF406393FF3287C9FF3589CBFF3990CDFF3E96D1FF4298D4FF4298
      D4FF4394CBFF3266A5FF00013FFF000007FF0000FFFF0000FFFF000000000000
      0000000000000000000000FF00FF00FF00FF008080FF008080FF000000FF0000
      00000000000000000000000000000000000000000000808080FFFFFFFFFFFFFF
      FFFFFFFFFFFF808080FF808080FFFF2200FFFF2200FFFF2200FFFF2200FFFF22
      00FFFF2200FFFFFFFFFF808080FF00000000CAF2D6FF63DA8BFF63DA8BFF63DA
      8BFF71DD95FFF6FCF8FF0000000000000000FFF5EBFFFF9622FFFF9927FFFFF9
      F3FF00000000FFBB6EFFFF8D0EFFFFD6AAFF0000000000000000000000000C26
      53FF25568EFF50AFDAFF5CBCE6FF5ABAE6FF58B9E7FF5DB3E8FF50A0DEFF4193
      D2FF3A6BB6FF3B72B5FF000150FF0A0A4AFF00000000000000000000FFFF0000
      00FF00FF00FF000000FF00000000000000FF00FF00FF00FF00FF008080FF0080
      80FF00000000000000000000000000000000808080FFFFFFFFFFFFFFFFFFFFFF
      FFFF808080FF0000000000000000FF2200FFFF2200FFFF2200FFFF2200FFFF22
      00FFFF2200FFFF2200FFFFFFFFFF808080FF00000000C2F0D0FF6DDC92FF63DA
      8BFF63DA8BFFB9EECAFF000000000000000000000000FFEAD4FF000000000000
      000000000000FFF6EDFFFFD09EFF000000000000000000000000000000000000
      00004096D0FF6CD5F1FF94E9F9FF94E9F9FF78E1F7FF7BCDF2FF57A5E5FF3C6D
      BAFF4394CBFF3B76B9FF000157FF07084EFF00000000000000000000FFFF0000
      FFFF000000FF00FF00FF0000000000000000008080FF008080FF008080FF0080
      80FF000000FF000000000000000000000000808080FFFFFFFFFFFFFFFFFF8080
      80FF000000000000000000000000FF2200FFFF2200FF00000000000000000000
      0000FF2200FFFF2200FFFF2200FF808080FF000000000000000000000000E2F8
      E9FFEAF9EFFFC3BBFFFFE6E2FFFF0000000000000000D6D1FFFFD3CDFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000091BFCFFF5CB7DEFF61C7EAFF7BD1EDFF67CAEBFF5EB4E6FF396CB6FF4496
      CBFF4498CCFF2351A6FF000064FF080F57FF00000000000000FF00FF00FF00FF
      00FF000000FF000000FF00FF00FF000000FF000000FF008080FF00FF00FF0080
      80FF000000FF000000000000000000000000808080FFFFFFFFFFFFFFFFFF8080
      80FF000000000000000000000000FF2200FFFF2200FF00000000000000000000
      0000FF2200FFFF2200FFFF2200FF808080FF0000000000000000000000000000
      0000D2CCFFFF4228FFFF7967FFFF0000000000000000634EFFFF4830FFFFE4E0
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000005C9DC1FF3763B1FF3864B2FF3864B2FF3763B1FF4095C9FF6BD5
      EFFF3882C1FF0B2187FF000070FF05295BFF000000FF00FF00FF008080FF0080
      80FF00FF00FF000000FF008080FF00FF00FF000000FF00FF00FF00FF00FF0080
      80FF000000FF000000000000000000000000808080FFFFFFFFFFFFFFFFFF8080
      80FF000000000000000000000000FF2200FFFF2200FFFF2200FFFF2200FFFF22
      00FFFF2200FFFF2200FFFF2200FF808080FF0000000000000000000000000000
      00007764FFFF4026FFFF634EFFFF0000000000000000553EFFFF4026FFFF9384
      FFFF000000000000000000000000000000000000000000000000C5D5E8FF2125
      91FF000781FF256BABFF3CA0C7FF48ACD1FF59BFDEFF5AC1DFFF67C8EBFF3D84
      C8FF091191FF00008BFF000578FF032360FF00000000000000FF008080FF0080
      80FF008080FF008080FF008080FF008080FF00FF00FF000000FF008080FF0000
      00FF00000000000000000000000000000000808080FFFFFFFFFFFFFFFFFF8080
      80FF000000000000000000000000FF2200FFFF2200FFFF2200FFFF2200FFFF22
      00FFFF2200FFFF2200FFFFFFFFFF808080FF0000000000000000000000000000
      00005841FFFF4026FFFFB4A9FFFF00000000000000009C8EFFFF4026FFFF705D
      FFFF000000000000000000000000000000000000000000000000000070FF171C
      ACFF0210B3FF27227BFF3383B6FF4DB6DCFF70D7F4FF54ACDBFF2343ACFF050A
      9EFF00009BFF000095FF073257FF00056CFF0000000000000000008080FF0080
      80FF008080FF008080FF008080FF008080FF000000FF000000FF000000FF0000
      00000000000000000000000000000000000000000000808080FFFFFFFFFFFFFF
      FFFF808080FF0000000000000000000000000000000000000000000000008080
      80FF808080FFFFFFFFFFFFFFFFFF808080FF0000000000000000000000000000
      00006B57FFFF4026FFFF7B69FFFF00000000000000006753FFFF4026FFFF8772
      FFFF00000000000000000000000000000000C5D5E8FF1D1F95FF0000CBFF0A0A
      D3FF261F82FF0302B8FF2E2570FF0B0FA4FF0409B1FF27217AFF0000ABFF0000
      AEFF0000A5FF000099FF26268AFFDBDBECFF0000000000000000000000FF00FF
      FFFF000000FF00FFFFFF000000FF008080FF0000000000000000000000000000
      00000000000000000000000000000000000000000000808080FFFFFFFFFFFFFF
      FFFFFFFFFFFF808080FF808080FF808080FF808080FF808080FF808080FFFFFF
      FFFFFFFFFFFFFFFFFFFF808080FF000000000000000000000000000000000000
      0000BAB0FFFF4026FFFF4026FFFF533BFFFF4E36FFFF4026FFFF4026FFFFD1CB
      FFFF00000000000000000000000000000000000070FF0000C8FF0000D5FF5151
      DEFF0000C9FF0000C9FF2E2670FF0403B5FF0000C2FF261F81FF0000B5FF0000
      B9FF0000A3FF000078FF00000000000000000000000000000000000000FF00FF
      FFFF000000FF00FFFFFF000000FF008080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF808080FF808080FF00000000000000000000000000000000000000000000
      0000000000009B8DFFFF4127FFFF4026FFFF4026FFFF442BFFFFB0A5FFFF0000
      00000000000000000000000000000000000000000000444A9EFF7880E5FF1111
      CDFF0000CFFF211B8DFF0000C9FF0001C6FF5151CEFF0C12B8FF0000A6FF2445
      7AFF27278BFFDCDCECFF00000000000000000000000000000000000000000000
      00FF008080FF000000FF008080FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80FF808080FF808080FF808080FF808080FF808080FF808080FF808080FF8080
      80FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E3DFFFFFB4AAFFFFB7ADFFFFEAE7FFFF000000000000
      0000000000000000000000000000000000000000000000000000000000002327
      8BFF090BBDFF090BBDFF090BB7FF161BB5FF000070FF05295BFF000070FFC1D0
      E5FF000000000000000000000000000000000000000000000000000000000000
      0000000000FF00000000000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000201001F010000170502002B080401340402002701000014000000000201
      001F64340CB85C300BB1000000000000000019E0F4FF1BE1F4FF1BE1F4FF1BE0
      F4FF1BE2F5FF1CE4F7FF1BE2F5FF1CE4F7FF1BE1F5FF1BE0F4FF1CE4F7FF1CE3
      F7FF1BE2F5FF1CE4F8FF1CE2F5FF19E0F3FF0000000000000000000000000000
      000000000000FCF8F2FFE0AA5DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005353539F2B2B2BFF3B3B3BDB00000000000000000000
      0000000000000000000000000000000000000000000000000000000000021109
      024D8B4810D9BA6015FBB66014F9A55712EDA75713EEB86015FA7C400ECD4022
      0794000000010703003100000000000000001BE1F4FF1EE1F4FF1DE1F4FF1DE2
      F5FF1CD7E8FF1296A2FF0D6D75FF139CA9FF1CDCEEFF1EE3F6FF18C1D1FF0F81
      8BFF0D6E76FF14A1AEFF1DDCEEFF1CE2F5FF0000000000000000000000000000
      000000000000F2DBBCFFD9983BFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000707
      0730ABABABFF484848FF3D3D3DFF313131FF262626FF1B1B1BFF101010FF2F2F
      2FDB000000000000000000000000000000000000000000000000934C10DFC063
      14FF00000003000000062212046C2C17057B170C03590503002B000000000000
      00004A27089F1109024E00000000000000001BE1F4FF1DE1F4FF1DE1F4FF1DE4
      F7FF139FABFF072728FF108994FF050000FF14A5B2FF1ACDDEFF050000FF0D6E
      76FF118E99FF050000FF1298A4FF1CE4F7FF0000000000000000000000000000
      000000000000EAC797FFD28416FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000898989FF9494
      94FF5E5E5EFF535353FF484848FF3D3D3DFF313131FF262626FF1B1B1BFF1010
      10FF040404FF0000000000000000000000000000000000000000000000122011
      0469170C035962330BB6BC6115FDB15C15F5C06314FFC06314FF010000160000
      00000201001A0000000100000000000000001BE1F4FF1DE1F4FF1DE1F4FF1DE1
      F5FF1CDCEEFF1BD3E4FF1DE5F8FF0C656DFF0F7C87FF1DE0F3FF18C3D3FF1DE2
      F5FF1DE3F5FF0B5F67FF0D6E76FF1BE2F5FF0000000000000000000000000000
      000000000000E9C491FFCD7501FFF6E7D2FF0000000000000000000000000000
      00000000000000000000000000000000000000000000717171FF7D7D7DFF7575
      75FF6A6A6AFF5E5E5EFF535353FF484848FF3D3D3DFF313131FF262626FF1B1B
      1BFF101010FF040404FF00000000000000000000000000000000000000000000
      00000804013561320BB5C06314FFC06314FFBC6115FD8F4A10DC0905013A0000
      000D2C17057B0000000400000000000000001BE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE2F5FF1DE3F6FF1DE2F4FF0C6870FF0F7C87FF1EE5F8FF1DE3F7FF16B7
      C6FF0B6068FF040000FF15AFBDFF1CE4F7FF0000000000000000000000000000
      000000000000EAC797FFCD7400FFE4B673FF0000000000000000000000000000
      0000000000000000000000000000000000000B0B0B3C666666FF717171FF8282
      82FF757575FF6A6A6AFF5E5E5EFF636363E7B6B6B6FFB7B7B7FF313131FF2626
      26FF1B1B1BFF101010FF3E3E3EFF000000000000000000000000000000000000
      000025130471B05C14F407040134040200250E080247271404730000000E0000
      000087470FD64524089900000000000000001BE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1DE1F4FF0C6870FF0F7D88FF1EE5F8FF1297A3FF0400
      00FF0C666EFF17BDCCFF1DE2F5FF1BE1F4FF0000000000000000000000000000
      000000000000F1DABBFFCD7400FFD07B0DFFF8ECDCFF00000000000000000000
      0000000000000000000000000000000000004F4F4FFF5B5B5BFF7C7C7CFF8D8D
      8DFF818181FF757575FF000000000000000000000000B6B6B6FFC1C1C1FF3131
      31FF262626FF1B1B1BFF101010FF000000000000000000000000000000001209
      024FC06314FF7E420FCF4826089D4624079B592F0AAE69370CBD522B0AA70000
      0012130A0252BE6314FE00000000000000001BE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1DE1F4FF0C6870FF0F808AFF1CDCEEFF072729FF1192
      9EFF1DE3F6FF1CDDF0FF1DE2F5FF1BE0F4FF0000000000000000000000000000
      000000000000FCF6EEFFCF7908FFCD7400FFD9983AFFFDFAF5FF000000000000
      000000000000000000000000000000000000444444FF4F4F4FFFA3A3A3FF9898
      98FF8D8D8DFF838383FF00000000000000000000000036363683B6B6B6FFC1C1
      C1FF313131FF262626FF1B1B1BFF000000000000000000000000000000000000
      000B69360CBC402208940000000300000000010104230F124386000000010000
      000B914C11DE331B068400000000000000001BE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1DE1F4FF0B5F66FF0E7883FF1DE2F4FF0C646CFF0A52
      59FF0F828CFF095055FF1BD4E5FF1BE2F6FF0000000000000000000000000000
      00000000000000000000DEA655FFCD7400FFCD7400FFDCA24DFFFDF9F4FF0000
      000000000000000000000000000000000000383838FF444444FFAFAFAFFFA3A3
      A3FF989898FF0000000000000000000000000000000000000000ABABABFFB6B6
      B6FF949494FF323232FF262626FF656565FF0000000000000000000000000000
      000000000000000000000C0F3578191E70AD000001152F3BD8F0000000000000
      0000000000000000000000000000000000001BE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1DE1F4FF13A0ADFF14A9B7FF1EE5F8FF1AD0E1FF108B
      96FF0E7580FF16B1C0FF1DE0F3FF1BE1F4FFFFFEFEFFF7E8D5FFE6BC82FFDB9D
      44FFD58D27FFD48B22FFD48B23FFCD7400FFCD7400FFCD7400FFD58E29FFF1DA
      BBFFFEFDFBFF0000000000000000000000002D2D2DFF393939FF989898FFAFAF
      AFFFA3A3A3FF0000000000000000000000000000000000000000A0A0A0FFABAB
      ABFFB6B6B6FF3D3D3DFF323232FF292929FF0000000000000000000000000000
      000000000000000000003440F0FD03040F40171C66A53441F4FF000000000000
      0000000000000000000000000000000000001BE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE4F7FF1DE3F7FF1DE1F4FF1DE3F6FF1DE4
      F7FF1DE3F7FF1DE4F8FF1DE1F4FF1BE0F4FFDFA95AFFD58F29FFD89637FFD895
      34FFD28416FFCD7400FFCD7400FFCD7400FFCD7400FFCD7400FFCD7400FFCD75
      00FFD58D27FFE1AD63FFE7BD84FFE7BE86FF222222FF2D2D2DFF393939FFBABA
      BAFFAFAFAFFF0000000000000000000000000000000000000000949494FFA0A0
      A0FFABABABFF484848FF3D3D3DFF1A1A1A9F0000000000000000000000000000
      000000000000000000003441F4FF1013478A333FE8F91B2178B3000000000000
      0000000000000000000000000000000000001BE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1DE1F4FF1BE1F4FFFCF8F1FFFFFEFDFF000000000000
      0000FEFBF8FFF4E0C6FFDEA553FFCD7501FFCD7400FFCD7500FFD18211FFCE77
      05FFCE7705FFD18212FFDA9B41FFEAC694FF171717FF222222FF2D2D2DFFC6C6
      C6FFBABABAFFAFAFAFFF0000000000000000000000008D8D8DFF898989FF9494
      94FFA0A0A0FF535353FF484848FF000000000000000000000000000000000000
      00000000000000000000323FECFB3441F2FE131856983440F0FD000000000000
      0000000000000000000000000000000000001BE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1DE1F4FF1BE1F4FF000000000000000000000000FEFC
      F9FFF2E3CAFFF5EAD7FFFFFEFEFFF0D7B5FFD0800FFFCD7500FFF2DDBFFFFDF9
      F3FFFDF9F3FF0000000000000000000000000C0C0CFF171717FF222222FF2D2D
      2DFFC5C5C5FFBABABAFF464646930000000000000000717171FF7D7D7DFF8989
      89FF949494FF5F5F5FFF535353FF000000000000000000000000000000000000
      000000000000000000000000000003040F40313DE4F7020208300C0F35780A0C
      296A000000000000000000000000000000001BE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1DE1F4FF1BE1F4FF0000000000000000FFFEFDFFD4A3
      4CFFC27903FFC37B06FFE3C48EFF00000000F1D8B7FFCE7602FFE6BD83FF0000
      000000000000000000000000000000000000000000000C0C0CFF171717FF2222
      22FF2D2D2DFF383838FF656565FF4F4F4FFF5B5B5BFF666666FF717171FF7D7D
      7DFF767676FF6A6A6AFF2B2B2B87000000000000000000000000000000000000
      0000000000000000000000000000000000002A34BCE01F268DC2000000000000
      0000000000000000000000000000000000001BE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1DE1F4FF1BE1F4FF0000000000000000F4E7D1FFC27A
      04FFC27903FFC27903FFC8891AFF0000000000000000DDA350FFE1AD63FF0000
      00000000000000000000000000000000000000000000252525EF0B0B0BFF1717
      17FF222222FF2D2D2DFF383838FF444444FF4F4F4FFF5B5B5BFF666666FF7171
      71FF828282FF757575FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010134689000000000000
      0000000000000000000000000000000000001BE1F4FF1EE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1F4FF1DE1
      F4FF1DE1F4FF1DE1F4FF1EE1F4FF1BE1F4FF0000000000000000F9F2E7FFC481
      0BFFC27903FFC27903FFCF9938FF0000000000000000EFD5B0FFE2B068FF0000
      0000000000000000000000000000000000000000000000000000323232EF0B0B
      0BFF171717FF222222FF2D2D2DFF383838FF444444FF4F4F4FFF5B5B5BFF9898
      98FF8D8D8DFF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000102072C000000000000
      00000000000000000000000000000000000019E0F4FF1BE1F4FF1BE1F4FF1BE1
      F4FF1BE1F4FF1BE1F4FF1BE1F4FF1BE1F4FF1BE1F4FF1BE1F4FF1BE1F4FF1BE1
      F4FF1BE1F4FF1BE1F4FF1BE1F4FF19E0F4FF000000000000000000000000EBD4
      ACFFCF9938FFD3A148FFF5EAD6FF0000000000000000FBF4EAFFEFD3ACFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000B0B0BFF171717FF222222FF2D2D2DFF383838FF444444FFAFAFAFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AF91
      7300006A7F00006A7F00006A7F00006A7F00006A7F00006A7F00006A7F00006A
      7F00AF9173000000000000000000000000000000000F080400357C4100C8CA6A
      00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A
      00FFCA6A00FFA75700E80B06003E000000020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7B1A9FF9E9992FF9E99
      92FF9A958EFF9A958EFF9A958EFF9A958EFF9A958EFF9A958EFF9A958EFF9A95
      8EFF9A958EFF9A958EFF9A958EFFAAA49CFF00000000AF917300006A7F00006A
      7F0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8
      FF00006A7F00006A7F00AF917300000000001108004A391E0088AA5900EACA6A
      00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A
      00FFCA6A00FFC56800FC814400CC160B00550000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D79C6DFFB95832FFAB4D2AFFAB4D
      2AFFA94B29FFA94B29FFA94B29FFA94B29FFA94B29FFA94B29FFA94B29FFA94B
      29FFA94B29FFAA4D29FFA94B29FFA7724DFFAF917300006A7F0000D8FF0000D8
      FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8
      FF0000D8FF0000D8FF00006A7F00AF917300975000DDAE5B00EDC56800FCCA6A
      00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A
      00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D38147FF514438FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF514438FFD38147FF006A7F0000D8FF0000D8FF0000D8
      FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8
      FF0000D8FF0000D8FF0000D8FF00006A7F00CA6A00FFCA6A00FFCA6A00FFCA6A
      00FFCA6A00FFCA6A00FFCA6C00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A
      00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FF00000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF00000000E78F51FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFD27A45FF006A7F0000D8FF00000000000000
      0000000000000000000000D8FF0000D8FF000000000000D8FF0000D8FF000000
      0000000000000000000000D8FF00006A7F00CA6A00FFCA6A00FFCA6A00FFCA6A
      00FFCA6A00FFCA6A00FFFDFBF8FFF3DFC7FFCA6A00FFCA6A00FFCA6A00FFCA6A
      00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FF000000FF000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF000000FF000000FFE58C4EFF000000FF000000FF4444
      44FFFFFFFFFFFFFFFFFF444444FF000000FF000000FF000000FF000000FF4444
      44FFFFFFFFFF000000FF000000FFD07742FF006A7F0000D8FF000000000000D8
      FF0000D8FF0000D8FF0000D8FF0000D8FF000000000000D8FF0000D8FF000000
      000000D8FF0000D8FF0000D8FF00006A7F00CA6A00FFCA6A00FFCA6A00FFCA6C
      00FFDC9E56FFEFD2B3FFE6B885FFFFFFFFFFCA6B00FFCA6A00FFE5BB88FFE4B5
      80FFCC6F06FFCA6A00FFCA6A00FFCA6A00FF000000FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFE4884CFF000000FF000000FFFFFF
      FFFF444444FF444444FFFFFFFFFF000000FFFFFFFFFF000000FF000000FFFFFF
      FFFF444444FF000000FF000000FFCF7340FF006A7F0000D8FF00000000000000
      0000000000000000000000D8FF0000D8FF000000000000D8FF0000D8FF000000
      000000D8FF0000D8FF0000D8FF00006A7F00CA6A00FFCC710AFFE9C092FFFFFF
      FFFFFFFFFFFFECCAA5FFCC7008FFFFFFFFFFD4882FFFCA6A00FFE1AB6EFFFFFF
      FFFFFFFFFFFFEFD2B3FFCF7A19FFCA6A00FF000000FFFFFFFFFF000000FF0000
      00FF000000FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFF0000
      00FF000000FF000000FFFFFFFFFF000000FFE3854AFF000000FF000000FFFFFF
      FFFF000000FF000000FF000000FF000000FF000000FF000000FF444444FFFFFF
      FFFF000000FF000000FF000000FFCE703EFF006A7F0000D8FF000000000000D8
      FF0000D8FF0000D8FF0000D8FF0000D8FF000000000000D8FF0000D8FF000000
      000000D8FF0000D8FF0000D8FF00006A7F00EDCFABFFFFFFFFFFFEFDFDFFDDA0
      5BFFC65F00FFC35500FFC65E00FFFFFFFFFFEDCEACFFC76200FFC65E00FFC55C
      00FFD89040FFF8EEE2FFFFFFFFFFF9F2E8FF000000FFFFFFFFFFFFFFFFFF0000
      00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFF000000FF000000FFFFFFFFFFFFFF
      FFFF000000FFFFFFFFFFFFFFFFFF000000FFE28148FF000000FF000000FFFFFF
      FFFF444444FF444444FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF4444
      44FF000000FF000000FF000000FFCD6C3CFF006A7F0000D8FF00000000000000
      0000000000000000000000D8FF0000000000000000000000000000D8FF000000
      000000D8FF0000D8FF0000D8FF00006A7F00F2DBC2FFFFFFFFFFF8F0E3FFD791
      42FFC45800FFC75F00FFC86300FFEAC79FFFFFFFFFFFC65E00FFC45700FFC459
      00FFD28327FFF3DFC7FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF0000
      00FFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FFFFFFFFFFFFFF
      FFFF000000FFFFFFFFFFFFFFFFFF000000FFE07845FF000000FF000000FF4444
      44FFFFFFFFFFFFFFFFFF444444FF000000FF000000FF000000FFFFFFFFFF0000
      00FF000000FF000000FF000000FFCB6739FF006A7F0000D8FF0000D8FF0000D8
      FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8
      FF0000D8FF0000D8FF0000D8FF00006A7F00CA6A00FFCF7817FFECCCA7FFFFFF
      FFFFFFFFFFFFEAC69EFFCA6A00FFD28429FFFFFFFFFFCD7109FFDB9C53FFFFFF
      FFFFFFFFFFFFF3DDC4FFD3842AFFCA6B00FF000000FFFFFFFFFFFFFFFFFF0000
      00FFFFFFFFFFFFFFFFFF000000FF000000FFFFFFFFFF000000FFFFFFFFFFFFFF
      FFFF000000FFFFFFFFFFFFFFFFFF000000FFDF7442FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFCA6336FF006A7F0000D8FF0000D8FF00006A
      7F00006A7F00006A7F00006A7F00006A7F00006A7F00006A7F00006A7F00006A
      7F0000D8FF0000D8FF0000D8FF00006A7F00CA6A00FFCA6A00FFCA6A00FFCC6F
      06FFE2AF73FFF4E3D0FFCA6A00FFC96700FFFFFFFFFFE8BF90FFE5BB8AFFEAC5
      9BFFCF7615FFCA6A00FFCA6A00FFCA6A00FF000000FFFFFFFFFF000000FF0000
      00FF000000FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFF0000
      00FF000000FF000000FFFFFFFFFF000000FFDD7040FF514438FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF514438FFC85F34FF006A7F00006A7F00006A7F00006A
      7F0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8
      FF00006A7F00006A7F00006A7F00006A7F00CA6A00FFCA6A00FFCA6A00FFCA6A
      00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFF1DCC4FFFFFFFFFFC96600FFCA6A
      00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FF000000FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFDF6D3FFFDA693CFFCA5C33FFCA5C
      33FFC75A31FFC75A31FFC75A31FFC75A31FFC75A31FFC75A31FFC75A31FFC75A
      31FFC75A31FFC95C32FFC75A31FFC75A31FF006A7F00006A7F0000D8FF0000D8
      FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8
      FF0000D8FF0000D8FF00006A7F00006A7F00CA6A00FFCA6A00FFCA6A00FFCA6A
      00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCF7918FFD99546FFCA6A00FFCA6A
      00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FF000000FF000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF000000FF000000FFD57318FFE38D28FFE3871DFFE387
      1DFFE3861BFFE38719FFE3851AFFE3871CFFE3861BFFE38414FFE18111FFE385
      19FFE58618FFE08723FFCA792DFFC15D1DFFAF917300006A7F0000D8FF0000D8
      FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8
      FF0000D8FF0000D8FF00006A7F00AF9173009B5100DFBC6200F6CA6A00FFCA6A
      00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A
      00FFCA6A00FFCA6A00FFC06500F98F4B00D700000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF00000000EABCA7FFB36242FFB36142FFB361
      42FFB36142FFB36142FFB36142FFB36142FFB36142FFB36142FFB36142FFB361
      42FFB36142FFB36141FFD15A36FFE39984FF00000000AF917300006A7F00006A
      7F0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8FF0000D8
      FF00006A7F00006A7F00A2795A00000000000D070042522B00A3BC6200F6CA6A
      00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A
      00FFCA6A00FFCA6A00FF723C00C0090500380000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AF91
      7300006A7F00006A7F00006A7F00006A7F00006A7F00006A7F00006A7F00006A
      7F00AF917300000000000000000000000000000000080D070042995000DECA6A
      00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A00FFCA6A
      00FFCA6A00FFCA6A00FF2212006A000000070000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000727CD6FF0014B5FF0014
      B6FF0015B6FF0014B6FF0014B6FF3642C3FF2E3BC0FF0015B6FF0015B6FF0015
      B6FF0014B7FF0114B5FF7985D9FF00000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00000000000F39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007686E0FF001DC5FF001D
      C5FF001DC5FF001DC5FF011CC6FF808CDFFF7484DDFF001DC5FF001DC5FF001D
      C5FF001DC5FF001DC6FF7A8AE0FF0000000000000000000000009E3F0A009B3D
      0A009B3D0A0098380A0095360A0092330A0091310A008D2F0A008C2D0A00892B
      0A00872A0A0087290A00C0C0C00000000000F39620FFF39620FFF39620FFF396
      20FFF39620FFF49F33FFF39620FFF39620FFF39E32FFF39620FFF39620FFF396
      20FFF39E32FFF39620FFF39620FFF39620FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000788CE8FF0025D4FF0026
      D3FF0026D3FF0026D3FF0427D4FFD3D8F3FFC0C9F0FF0025D4FF0026D3FF0026
      D3FF0026D3FF0025D4FF8091E8FF000000000000000000000000A1420A00FFFF
      FC00FFFFF800FFFFEF00FFFEEC00FFFAE500FFFAE200FFF5DA00FFF3D600FFEF
      CE00FFEDCB00872A0A00C0C0C00000000000F39620FFF39620FFF39620FFF49F
      34FFFCE7CCFFFFFFFFFFFEFEFDFFF9CE99FFFFFFFFFFFEFEFEFFF8C482FFFBE2
      C2FFFFFFFFFFFEFEFEFFF6B35EFFF39620FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009BACF1FF0431E3FF0332
      E3FF0332E3FF0432E3FF3455E5FFE9EDF2FFECEFF2FF2347E4FF0631E2FF0332
      E3FF0332E3FF0531E4FFBBC7F6FF000000000000000000000000A7480A00FFFF
      FF00FFFFFF00FFFBEA00FFFBED00FFFCEA00FFF9E700FFF9E000FFF5DA00FFF0
      D300FFEDCF008A2B0A00C0C0C00000000000F39620FFF39620FFF39620FFFFFF
      FFFFFAD5A7FFF39620FFF39926FFF49F34FFF39620FFF9CD95FFFCE8CFFFF4A0
      35FFF39620FFFCE6CBFFF9D19EFFF39620FF00000000085207FF085207FF0852
      07FF085207FF085207FF085207FF085207FF085207FF085207FF085207FF0852
      07FF085207FF085207FF085207FF0000000000000000ECEFFCFF3960F2FF3C65
      F4FF3C65F4FF3C65F2FF879CE8FFCDD5E2FFD8DCE2FF8298E7FF3C65F2FF3C65
      F4FF3B66F2FF456AF2FFF6F8FDFF000000000000000000000000AB4A0A00FFFF
      FF00FFFFFF00FFFBED00FFFAE900FFFBEB00FFFBE900FFF7E200FFF8DF00FFF2
      D700FFEBCE008B2D0A00C0C0C00000000000F39620FFF39620FFF39620FFFFFF
      FFFFFAD6A8FFF39620FFF39620FFF39620FFFAD9B0FFFEFAF6FFF8C484FFF4A6
      42FFFBE3C5FFFDEEDBFFF6B25BFFF39620FF085207FF085207FF1DB200FF1DB2
      00FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB2
      00FF1DB200FF1DB200FF085207FF085207FF0000000000000000D5DDFDFF7B9B
      FAFF85A3FEFF7597FAFFD0D5E9FFB5C0D3FFC1C8D5FFCDD3E9FF7699FAFF85A3
      FEFF799BF8FFCDD8FCFF00000000000000000000000000000000AD4E0A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFF5E400FFF8EA00FFF9E700FFF6E400FFF6
      DD00FFF2D7008F300A00C0C0C00000000000F39620FFF39620FFF39620FFFFFF
      FFFFFAD8AEFFF39620FFF39B2BFFF7BE76FFFDF3E6FFF4A33CFFF39620FFFAD5
      A7FFFBE3C3FFF39620FFF39620FFF39620FF085207FF1DB200FF1DB200FF1DB2
      00FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB2
      00FF1DB200FF1DB200FF1DB200FF085207FF0000000000000000000000001415
      26FF141526FF899ACAFFB5C1D3FF93AACFFF93A9CFFFB3C0D7FF8697C7FF1415
      26FF141526FF0000000000000000000000000000000000000000B1520A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7E800FFF2E100FFF8E800FFF8E600FFF4
      DF00FFF5DC0091320A00C0C0C00000000000F39620FFF39620FFF39620FFF4A0
      35FFFCE7CDFFFFFFFFFFFFFFFFFFF6B15AFFFFFFFFFFFFFFFFFFFEFEFEFFF8C2
      7EFFFFFFFFFFFFFFFFFFF5AF56FFF39620FF085207FF1DB200FFFFFFFFFFFBFF
      FFFFF1FEFCFF1DB200FFF3FFFDFFF9FBFFFFF4FFFFFF1DB200FF1DB200FFFFFF
      FFFFFFFFFFFF1DB200FF1DB200FF085207FF0000000000000000000000001415
      26FF141526FF90A3C9FFAAC3EFFFA9C1EEFFA3BDEAFF97B3E5FF738DB9FF0E11
      22FF141526FF0000000000000000000000000000000000000000B6570A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDECDB00FFF5E600FFF6
      E400FFF3E10095360A00C0C0C00000000000F39620FFF39620FFF39620FFF396
      20FFF39620FFF4A139FFF39825FFF39620FFF39722FFF4A540FFF39620FFF396
      20FFF39B2CFFF4A33BFFF39620FFF39620FF085207FF1DB200FFF6FFFFFF1DB2
      00FF1DB200FF1DB200FF1DB200FF1DB200FFFFFEFFFF1DB200FF1DB200FFFFFF
      FFFFFFFFFFFF1DB200FF1DB200FF085207FF0000000000000000000000001415
      26FF8293B4FFBACFF6FFC0D4F8FFBED3F8FFB5CAF3FFA7BFEDFF94B2E4FF667D
      A7FF333542FF0000000000000000000000000000000000000000B7590A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF5E800FBEBDA00FFF5
      E600FFF5E30098380A00C0C0C00000000000F39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FF085207FF1DB200FFFFFDFFFF1DB2
      00FF1DB200FF1DB200FFFFFBFFFFFEFDFFFFFFFFF9FF1DB200FFFBFDFFFF1DB2
      00FF1DB200FFFFFFFFFF1DB200FF085207FF0000000000000000000000001415
      26FFBAD0F5FFCEDFFCFFDDE8FDFFD7E5FCFFC5D7F9FFB2C8F2FF9EB9E8FF8EAD
      DFFF141526FF0000000000000000000000000000000000000000BC5E0A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9E9
      D800FFF2E400A1420A00C0C0C00000000000F39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FF085207FF1DB200FFFAFFFFFF1DB2
      00FF1DB200FF1DB200FFF9FFFAFF1DB200FF1DB200FF1DB200FFFAFFFDFF1DB2
      00FF1DB200FFFFFFFFFF1DB200FF085207FF0000000000000000000000001415
      26FFC2D6F9FFE1EBFDFFF4F9FEFFEDF3FDFFD2E0FCFFB8CEF5FFA3BDEBFF92B0
      E2FF141526FF0000000000000000000000000000000000000000BD600A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF4
      E700F8E8D700A5460A00C0C0C00000000000F39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FF085207FF1DB200FFFFFFFFFFFFFE
      FFFFE5FFF8FF1DB200FFFFFFF9FFFDFDFFFFFEFFFAFF1DB200FFFDFFFCFF1DB2
      00FF1DB200FFFFFFFFFF1DB200FF085207FF0000000000000000000000001415
      26FFC0D5F8FFDDE9FDFFF0F5FDFFE9F1FDFFD0DFFCFFB6CDF5FF98B0DBFF4755
      70FF141526FF0000000000000000000000000000000000000000C0630A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00AB4A0A00C0C0C00000000000F39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FF085207FF1DB200FF1DB200FF1DB2
      00FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB2
      00FF1DB200FF1DB200FF1DB200FF085207FF000000000000000000000000A6A8
      AFFF141526FF8F9CB7FF98A1B5FFA8B4CCFFBDD1F4FF99ADD4FF1E253EFF1015
      2FFFC5C5CBFF0000000000000000000000000000000000000000C2650A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00AD4E0A00C0C0C00000000000F39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FF085207FF085207FF1DB200FF1DB2
      00FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB2
      00FF1DB200FF1DB200FF085207FF085207FF000000000000000000000000F9F9
      F9FF585D73FF1E2445FF1E2445FF1D2444FF333B5CFF363E60FF1D2444FF565A
      71FFFDFDFDFF0000000000000000000000000000000000000000C6690A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B1520A00C0C0C00000000000F39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FF00000000085207FF085207FF0852
      07FF085207FF085207FF085207FF085207FF085207FF085207FF085207FF0852
      07FF085207FF085207FF085207FF000000000000000000000000000000000000
      0000F0F0F2FF727689FF575C75FF595C76FF595C75FF575B74FF7B8292FFF0F1
      F2FF000000000000000000000000000000000000000000000000C76B0A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B3540A00C0C0C00000000000F39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFCFCFFD6D7DCFFBABBC5FFBABCC5FFD4D5D9FFFDFDFDFF0000
      0000000000000000000000000000000000000000000000000000CA6D0A00C96B
      0A00C76B0A00C5680A00C4650A00C0630A00BF610A00BC5E0A00B95C0A00B657
      0A00B1520A00B7590A000000000000000000F39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF39620FFF396
      20FFF39620FFF39620FFF39620FFF39620FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000959190FF544D4BFF544E
      4CFF534D4AFFA29F9DFFE8E2DFFFBD8669FFB5795EFFEBE9E9FF969190FF534D
      4BFF534D4BFF534E4BFFA19D9CFF000000000000BA000000BA000000BA000000
      00000000BA000000BA000000BA00000000000000BA000000BA000000BA000000
      00000000BA000000BA000000BA0000000000FF260000FF260000FF260000FF26
      000000000000FF260000FF260000FF260000FF260000FF26000000000000FF26
      0000FF260000FF260000FF260000000000000000000000A3260000A3260000A3
      260000A3260000A3260000000000000000000000000000A3260000A3260000A3
      260000A3260000A326000000000000000000000000009B9898FF5D5857FF5D58
      57FF5D5857FFADABABFFF5F1EFFFB5846AFFAC7559FFF9F8F8FFA09D9CFF5D58
      57FF5D5857FF5D5857FFA8A5A4FF000000000000BA008484FF000000BA000000
      00000000BA008484FF000000BA00000000000000BA008484FF000000BA000000
      00000000BA008484FF000000BA0000000000FF260000FFC37000FFC37000FF26
      000000000000FF260000FFC37000FFC37000FFC37000FF26000000000000FF26
      0000FFC37000FFC37000FF260000000000000000000000A326007FFFA5007FFF
      A5007FFFA50000A3260000000000000000000000000000A326007FFFA5007FFF
      A5007FFFA50000A32600000000000000000000000000A29F9FFF686362FF6863
      62FF686362FFB1AFAEFFFAF9F7FFAC7B61FFA6775CFFFDFDFDFFA4A1A1FF6863
      62FF686362FF6D6867FFB0AEADFF000000000000BA008484FF000000BA000000
      00000000BA008484FF000000BA00000000000000BA008484FF000000BA000000
      00000000BA008484FF000000BA0000000000FF260000FFC37000FFC37000FF26
      000000000000FF260000FFC37000FFC37000FFC37000FF26000000000000FF26
      0000FFC37000FFC37000FF260000000000000000000000A326007FFFA5007FFF
      A5007FFFA50000A3260000000000000000000000000000A326007FFFA5007FFF
      A5007FFFA50000A32600000000000000000000000000ABA8A8FF746F6EFF736E
      6DFF746F6EFFAFACACFFF6F6F6FFA1745BFFA8826AFFF6F7F7FFA4A1A1FF736E
      6DFF777271FF767170FFCCCBCAFF000000000000BA000000BA000000BA000000
      00000000BA000000BA000000BA00000000000000BA000000BA000000BA000000
      00000000BA000000BA000000BA0000000000FF260000FF260000FF260000FF26
      000000000000FF260000FF260000FF260000FF260000FF26000000000000FF26
      0000FF260000FF260000FF260000000000000000000000A3260000A3260000A3
      260000A3260000A3260000000000000000000000000000A3260000A3260000A3
      260000A3260000A32600000000000000000000000000E7E6E6FF959090FF9894
      93FF989493FFB2AFAFFFE4E5E5FFA48169FFAC907DFFE6E5E5FFADAAA9FF9A96
      95FF9B9695FF989392FFF4F3F3FF00000000000000000000BA00000000000000
      0000000000000000BA000000000000000000000000000000BA00000000000000
      0000000000000000BA00000000000000000000000000FF260000000000000000
      0000000000000000000000000000FF2600000000000000000000000000000000
      000000000000FF260000000000000000000000000000000000000000000000A3
      26000000000000000000000000000000000000000000000000000000000000A3
      2600000000000000000000000000000000000000000000000000D2D0D0FFBCB9
      B8FFBFBCBBFFBAB8B8FFE4E4E4FFA97960FFB18B74FFE0DFDFFFBBB8B7FFC0BE
      BDFFB9B6B5FFD7D5D5FF0000000000000000000000000000BA00000000000000
      0000000000000000BA000000000000000000000000000000BA00000000000000
      0000000000000000BA00000000000000000000000000FF260000000000000000
      0000000000000000000000000000FF2600000000000000000000000000000000
      000000000000FF260000000000000000000000000000000000000000000000A3
      26000000000000000000000000000000000000000000000000000000000000A3
      260000000000000000000000000000000000000000000000000000000000EBEB
      EBFFE2E1E1FFCECECCFFC1C8D4FF8F91A2FF9296AAFFC4CAD7FFD1D1D0FFE3E1
      E1FFEFEFEFFF000000000000000000000000000000000000BA000000BA000000
      BA000000BA000000BA000000BA000000BA000000BA000000BA000000BA000000
      BA000000BA000000BA00000000000000000000000000FF260000FF260000FF26
      0000FF260000FF260000FF260000FF260000FF260000FF260000FF260000FF26
      0000FF260000FF260000000000000000000000000000000000000000000000A3
      260000A3260000A3260000A3260000A3260000A3260000A3260000A3260000A3
      2600000000000000000000000000000000000000000000000000000000000000
      0000FBFCFEFFBED1EEFFA7C0EDFFA6BFEDFFA0BAE7FF98B4E2FFB9CBE9FFFDFD
      FEFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000BA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF2600000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000A326000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CAD9F3FFB8CDF5FFBCD1F7FFBACFF4FFB3C9F1FFA4BDEBFF93B1E2FFBDCF
      ECFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000BA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF2600000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000A326000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F3F7
      FBFFB9CEF5FFCBDCFBFFD7E4FBFFD3E2FBFFC1D5F9FFAFC7F1FF9CB7E7FF93B0
      E1FFF5F8FCFF0000000000000000000000000000000000000000000000000000
      BA000000BA000000BA000000BA000000BA000000BA000000BA000000BA000000
      BA0000000000000000000000000000000000000000000000000000000000FF26
      0000FF260000FF260000FF260000FF260000FF260000FF260000FF260000FF26
      00000000000000000000000000000000000000000000000000000000000000A3
      260000A3260000A3260000A3260000A3260000A3260000A3260000A3260000A3
      260000000000000000000000000000000000000000000000000000000000E1EA
      F8FFC2D6FAFFDFE8FCFFF1F5FCFFEAF1FEFFCFDFFCFFB7CDF4FFA3BDEAFF90AF
      E1FFE3EAF7FF0000000000000000000000000000000000000000000000000000
      BA008484FF008484FF008484FF008484FF008484FF008484FF008484FF000000
      BA0000000000000000000000000000000000000000000000000000000000FF26
      0000FFC37000FFC37000FFC37000FFC37000FFC37000FFC37000FFC37000FF26
      00000000000000000000000000000000000000000000000000000000000000A3
      26007FFFA5007FFFA5007FFFA5007FFFA5007FFFA5007FFFA5007FFFA50000A3
      2600000000000000000000000000000000000000000000000000000000003348
      75FFB2C7E9FFE0EAFBFFF3F8FDFFEAF2FDFFD0E0FCFFB7CDF5FFA3BDEAFF90AE
      E0FF334875FF0000000000000000000000000000000000000000000000000000
      BA008484FF008484FF008484FF008484FF008484FF008484FF008484FF000000
      BA0000000000000000000000000000000000000000000000000000000000FF26
      0000FFC37000FFC37000FFC37000FFC37000FFC37000FFC37000FFC37000FF26
      00000000000000000000000000000000000000000000000000000000000000A3
      26007FFFA5007FFFA5007FFFA5007FFFA5007FFFA5007FFFA5007FFFA50000A3
      2600000000000000000000000000000000000000000000000000000000003348
      75FF334875FFC5D5F2FFDAE7FDFFD5E4FCFFBCD0F2FFA5BCE5FF92ACDAFF3348
      75FF334875FF0000000000000000000000000000000000000000000000000000
      BA008484FF008484FF008484FF008484FF008484FF008484FF008484FF000000
      BA0000000000000000000000000000000000000000000000000000000000FF26
      0000FFC37000FFC37000FFC37000FFC37000FFC37000FFC37000FFC37000FF26
      00000000000000000000000000000000000000000000000000000000000000A3
      26007FFFA5007FFFA5007FFFA5007FFFA5007FFFA5007FFFA5007FFFA50000A3
      260000000000000000000000000000000000000000000000000000000000F5F6
      F7FF334875FF334875FF8EA2C5FF4F638EFF364B78FF334875FF324975FF3348
      75FFFAFAFBFF0000000000000000000000000000000000000000000000000000
      BA000000BA000000BA000000BA000000BA000000BA000000BA000000BA000000
      BA0000000000000000000000000000000000000000000000000000000000FF26
      0000FF260000FF260000FF260000FF260000FF260000FF260000FF260000FF26
      00000000000000000000000000000000000000000000000000000000000000A3
      260000A3260000A3260000A3260000A3260000A3260000A3260000A3260000A3
      2600000000000000000000000000000000000000000000000000000000000000
      0000D9DDE5FF334875FF334875FF334875FF334875FF334875FF6B7DA3FFE3E6
      ECFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E7EAEFFF334875FF334875FF334875FFBDC7D9FFF1F2F5FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001212120080808000808080000E0E0E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D7D7D7FF7A7A7AFF404040FF262626FF262626FF404040FF7A7A7AFFD7D7
      D7FF0000000000000000000000000000000012326F0011357300123A7800133B
      7A00446599004D6D9C00512727005127270051272700313F68001C3E7A00282D
      4F0042293300422933001B3060002A447A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001212120080808000808080000E0E0E00000000000000
      0000000000000000000000000000000000000000000000000000000000007676
      76FF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E
      1EFF797979FF00000000000000000000000012326F0014478A0016498F00184B
      94009BB2D200D4D9E4005127270051272700512727009BADCE0096B2DC006550
      600051272700542F3300628AC6001B3E7D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001212120080808000808080000E0E0E00000000000000
      0000000000000000000000000000000000000000000000000000535353FF1E1E
      1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E
      1EFF1E1E1EFF545454FF0000000000000000213E760017488F00194D98001C4F
      9C00A0BDDC00E4EBF500D4E0F000C5D4EB00B7CBE500A8C0E2009AB6DD006853
      62005A3C4200646381005B83BE001F3D75000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001212120080808000808080000E0E0E00000000000000
      00000000000000000000000000000000000000000000797979FF1E1E1EFF1E1E
      1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E
      1EFF1E1E1EFF1E1E1EFF777777FF000000002E497C00194A93001E50A0002153
      A500A6C0DF00E9EEF600D9E4F100CBD9ED00BCCEE800ADC4E4009FB9DF0092AE
      D90085A5D400779AD0004067A30052678E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001111110080808000808080000E0E0E00000000000000
      000000000000000000000000000000000000D7D7D7FF252525FF8C8C8CFF1E1E
      1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E
      1EFF1E1E1EFF8D8D8DFF252525FFD7D7D7FF415986001B4995002255A8002558
      AD00A8C1E100EEF2F800DFE7F400D0DCEE00C0D1E900B2C7E400A3BDE00096B2
      DC0089A8D7007C9FD200284C89008893A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000004040400000000001111110000000000000000000E0E0E00000000000101
      010000000000000000000000000000000000797979FF727272FFFFFFFFFF3030
      30FF1E1E1EFF1E1E1EFF282828FF535353FF535353FF282828FF1E1E1EFF1E1E
      1EFF303030FFFFFFFFFF727272FF797979FF70809D00153774001A408F002553
      AD00A5B0DC00F4F6F900BBC9E20087A6D000618AC900A5BFE000A8C0E2009AB6
      DD008DACD8007B9CD00016377400BBBEC1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000004040400000000001111110000000000000000000E0E0E00000000000101
      0100000000000000000000000000000000003E3E3EFFB9B9B9FFFFFFFFFFD1D1
      D1FF585858FF767676FFA5A5A5FF696969FF696969FFA5A5A5FF767676FF5858
      58FFD1D1D1FFFFFFFFFFB9B9B9FF404040FF00000000B0B5BC004B5991000C13
      8900456DBC0013158C000E2C81001D509F002A5CB100B9CBE700ADC4E4008CA9
      D2004C6FA50021437F00465C8800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000004040400000000001111110000000000000000000E0E0E00000000000101
      010000000000000000000000000000000000232323FFDADADAFFFFFFFFFFFFFF
      FFFFFFFFFFFF7B7B7BFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF7B7B7BFFFFFF
      FFFFFFFFFFFFFFFFFFFFDADADAFF252525FF0000000000000000ADADBF001215
      8900234EAC00101187001A2E7900163C7E002B57A000738EB80032558C00112F
      7100334584009BA3B20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000004040400000000001010100000000000000000000E0E0E00000000000101
      010000000000000000000000000000000000232323FFDADADAFFFFFFFFFFFFFF
      FFFFD5D5D5FF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFFD5D5
      D5FFFFFFFFFFFFFFFFFFDADADAFF252525FF0000000000000000B2B2C0001214
      8900234EAC0014148900A3A4BA007F8CA5002F4A7E00112777001E4899001517
      8A009999B8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000040404002525250006060600000000000000000005050500262626000101
      0100000000000000000000000000000000003E3E3EFFB9B9B9FFFFFFFFFFFFFF
      FFFFA6A6A6FF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFFA6A6
      A6FFFFFFFFFFFFFFFFFFB9B9B9FF404040FF0000000000000000BDBDC4000F10
      8700234EAC0011118800B6B6C10000000000B4B4C1000F1188002048A9000F0F
      8600C1C1C5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000121212000000000000000000000000000000000000000000000000000F0F
      0F0000000000000000000000000000000000797979FF6F6F6FFFFFFFFFFFFFFF
      FFFFB8B8B8FF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFFB8B8
      B8FFFFFFFFFFFFFFFFFF6F6F6FFF7A7A7AFF0000000000000000BFBFC5000D0D
      8600234FAC000D0D8500C1C1C50000000000BDBDC4000D0D8700172E9C002E2E
      9100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000007B7B
      7B0000000000000000000000000000000000D7D7D7FF252525FFDEDEDEFFFFFF
      FFFFFFFFFFFF3A3A3AFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF3A3A3AFFFFFF
      FFFFFFFFFFFFDEDEDEFF252525FFD7D7D7FFC9C1B800CA915400CA8944000D0D
      840018329E000D0D85000000000000000000C19B76000A0B8500131C93006666
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005B5B5B00080808000808080058585800000000000000
      00000000000000000000000000000000000000000000777777FF4A4A4AFFFFFF
      FFFFFFFFFFFFFFFFFFFF4F4F4FFF1E1E1EFF1E1E1EFF4F4F4FFFFFFFFFFFFFFF
      FFFFFFFFFFFF4A4A4AFF777777FF00000000D59A4F00F6DAB200F9E5C6009993
      BC0024228C005A425B00C9BEB400CE9C5D00E0A658004949A80012107B00A9A9
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8B8B80000000000000000000000000000000000B5B5B5000000
      0000000000000000000000000000000000000000000000000000535353FF4A4A
      4AFFDEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDE
      DEFF4A4A4AFF535353FF0000000000000000D5B07E00EDCC9D00FCFCFC00FCFB
      F800E5B26B00E2AA5F00D48D2E00F9ECD600FCF9F600EDCC9800D0A268000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B50000000000000000000000000000000000B2B2B2000000
      0000000000000000000000000000000000000000000000000000000000007777
      77FF252525FF6F6F6FFFB9B9B9FFDADADAFFDADADAFFB9B9B9FF6F6F6FFF2525
      25FF777777FF000000000000000000000000C9C9C900E5BF8700ECCC9C00F4E0
      C100FCFCFB00FCFCFC00F7E2C400E7BD8000EBC69300D9AF7500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005B5B5B00080808000808080058585800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D7D7D7FF7A7A7AFF404040FF252525FF252525FF404040FF7A7A7AFFD7D7
      D7FF00000000000000000000000000000000000000000000000000000000D0B5
      8F00DDA86100E0AC6700D4A15E00C9C3BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000072C000051900000B3D60000E7F30000E7F30000B2D5000051900000
      072C000000000000000000000000000000000000000000000000000000000000
      0000000000370101019C020202DD010101FD010101FD020202DE0101019D0000
      00390000000000000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFF
      FFFF00000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000060000
      56940000F9FC0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      F9FC0000569400000006000000000000000000000000000000000000000F0202
      02A6000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF020202A80000000F0000000000000000000000FF000000FFFFFFFFFF0000
      0000000000FFFFFFFFFF00000000000000FFFFFFFFFF00000000000000FFFFFF
      FFFF00000000000000FF000000FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000600008ABC0000
      FFFF0000F1F80000539200000C380000000D0000000D00000B37000052910000
      F1F80000FFFF00008ABC00000006000000000000000000000010010101CC0000
      00FF000000FD020202A4010101490000001E0000001E00000047010101A20000
      00FD000000FF000000CC0000001100000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000000052910000FFFF0000
      CAE30000082E0000000000000000000000000000000000000000000000000000
      082E0000C8E20000FFFF000056940000000000000000020202AC000000FF0202
      02EE0000003E0000000000000000000000000000000000000000000000000000
      003E000000EB000000FF020202AF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF006E3D3D006E3D3D006E3D3D006E3D3D006E3D3D006E3D3D00FFFF
      FF00000000000000000000000000000000000000072B0000F9FC0000F3F90000
      0930000000000000FFFF0000FFFF000000000000000000000000000000000000
      00000000082E0000F1F80000F9FC0000072C00000040000000FF000000FD0000
      003F0000000000000000000000070000003E0000003E00000003000000000000
      00000000003C000000FD000000FF00000041FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000FFFF
      FF006E3D3D000000000000000000000000000000000000000000000000006E3D
      3D00FFFFFF00000000000000000000000000000051900000FFFF000052910000
      0000000000000000FFFF0000FFFF000000000000000000000000000000000000
      000000000000000052910000FFFF00005190020202A5000000FF020202A80000
      000000000000000000000000001C000000FF000000FF0000000E000000000000
      000000000000020202A5000000FF010101A6000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF00000000FFFFFF00FFFFFF006E3D
      3D006E3D3D00FFFFFF0000000000000000000000000000000000FFFFFF006E3D
      3D006E3D3D00FFFFFF00FFFFFF00000000000000B3D60000FFFF00000B370000
      0000000000000000FFFF0000FFFF000000000000000000000000000000000000
      00000000000000000B370000FFFF0000B2D5020202E2000000FF000000500000
      000000000000000000000000001C000000FF000000FF0000000E000000000000
      0000000000000101014E000000FF020202E40000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E3D3D006E3D3D006E3D
      3D006E3D3D006E3D3D006E3D3D0000000000000000006E3D3D006E3D3D006E3D
      3D006E3D3D006E3D3D006E3D3D00000000000000E7F30000FFFF0000000D0000
      0000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000
      0000000000000000000D0000FFFF0000E7F3020202FE000000FF0000002C0000
      000000000000000000000000001C000000FF000000FF0000000E000000000000
      0000000000000000002C000000FF010101FFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000006E3D
      3D006E3D3D000000000000000000000000000000000000000000000000006E3D
      3D006E3D3D000000000000000000000000000000E7F30000FFFF0000000D0000
      0000000000000000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000
      0000000000000000000D0000FFFF0000E7F3030303F6000000FF000000360000
      000000000000000000000000001C000000FF000000FF0000000E000000000000
      00000000000000000034000000FF030303F8000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      00006E3D3D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006E3D
      3D00000000000000000000000000000000000000B3D60000FFFF00000C380000
      0000000000000000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000
      00000000000000000C380000FFFF0000B2D5030303CC000000FF010101710000
      000000000000000000000000001C000000FF000000FF0000000E000000000000
      0000000000000101016E000000FF020202CD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006E3D3D006E3D3D006E3D3D006E3D3D006E3D3D006E3D3D000000
      000000000000000000000000000000000000000051900000FFFF000054930000
      0000000000000000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000
      000000000000000053920000FFFF000051900101017E000000FF020202DA0000
      000700000000000000000000001C000000FF000000FF0000000E000000000000
      000000000006020202D9000000FF0101017FFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000072B0000F9FC0000F3F90000
      0931000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000
      00000000082F0000F1F80000F9FC0000072C00000015010101EF000000FF0202
      029900000000000000000000001C000000FF000000FF0000000E000000000000
      000102020297000000FF000000F000000015000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000052910000FFFF0000
      CDE5000009310000000000000000000000000000000000000000000000000000
      09300000CAE30000FFFF00005694000000000000000001010158000000FF0000
      00FF00000000000000000000001C000000FF000000FF0000000E0000001B0202
      02AB000000FF000000FF0101015C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000006000089BB0000
      FFFF0000F3F90000549300000C380000000D0000000D00000B37000052910000
      F3F90000FFFF00008ABC000000060000000000000000000000000101016B0000
      00FB00000000000000FF000000FF000000FF000000FF0000000E0000009C0000
      00FF000000FC0101016C0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000060000
      52910000F9FC0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      F9FC000052910000000600000000000000000000000000000000000000000000
      003700000000000000FF000000FF000000FF000000FF0000000E0000009C0303
      03C800000039000000000000000000000000000000FFFFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFF
      FFFF00000000FFFFFFFF000000FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000072B000051900000B3D60000E7F30000E7F30000B2D5000051900000
      072B000000000000000000000000000000000000000000000000000000000000
      00000000000000000031020202AF030303FD020202FF0000000E000000110000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      0000000000FFFFFFFFFF00000000000000FFFFFFFFFF00000000000000FFFFFF
      FFFF00000000000000FF000000FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000CC2D00FFCC2D00FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000069FFFF0069FFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000180080FF180080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CC2D00FFCC2D00FFCBCBCBFFCC2D00FFCC2D00FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000069FFFF0069FFFFCBCBCBFF0069FFFF0069FFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000180080FF180080FFC6C6C6FF180080FF180080FF0000
      0000000000000000000000000000000000000679ADFF0679ADFF0679ADFF0679
      ADFF0679ADFF0679ADFF0679ADFF0679ADFF0679ADFF0679ADFF0679ADFF0679
      ADFF0679ADFF27719CFF00000000000000000000000000000000000000000000
      000000000000CC2D00FFCC2D00FFCC2D00FFCBCBCBFFCBCBCBFFCBCBCBFFCC2D
      00FFCC2D00FF0000000000000000000000000000000000000000000000000000
      0000000000000069FFFF0069FFFF0069FFFFCBCBCBFFCBCBCBFFCBCBCBFF0069
      FFFF0069FFFF0000000000000000000000000000000000000000000000000000
      000000000000180080FF0000C6FF180080FFC6C6C6FFC6C6C6FFC6C6C6FF1800
      80FF180080FF0000000000000000000000000679ADFF06BDF7FF06BDF7FF06B5
      F7FF06B5EFFF06ADEFFF06ADE7FF06A5E7FF06A5DEFF069CDEFF069CD6FF069C
      D6FF0694CEFF0E699CFF00000000000000000000000000000000000000000000
      0000CC2D00FFCC2D00FFCC2D00FFCC2D00FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCC2D00FFCC2D00FF000000000000000000000000000000000000
      00000069FFFF0069FFFF0069FFFF0069FFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0069FFFF0069FFFF000000000000000000000000000000000000
      0000180080FF0000C6FF0000C6FF180080FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
      C6FFC6C6C6FF180080FF180080FF000000000679ADFF16A5D6FF06BDFFFF06BD
      FFFF06B5F7FF06B5F7FF06B5EFFF06ADEFFF06ADE7FF06A5E7FF06A5DEFF069C
      DEFF069CD6FF0679BDFF94ADBDFF00000000000000000000000000000000CC2D
      00FFCC2D00FFCC2D00FFCC2D00FFCC2D00FFFFCC60FFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCC2D00FF0000000000000000000000000069
      FFFF0069FFFF0069FFFF0069FFFF0069FFFFFFCC61FFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFF0069FFFF0000000000000000000000001800
      80FF0000C6FF0000C6FF0000C6FF0000C6FF00D8FFFFC6C6C6FFC6C6C6FFC6C6
      C6FFC6C6C6FFC6C6C6FFC6C6C6FF180080FF0679ADFF1F8CBDFF06BDFFFF06BD
      FFFF06BDFFFF06BDF7FF06B5F7FF06B5EFFF06ADEFFF06ADE7FF06A5E7FF06A5
      DEFF069CDEFF069CD6FF4884A5FF000000000000000000000000CC2D00FFCC2D
      00FFCC2D00FFCC2D00FFCC2D00FFFFCC60FFFF6000FFCC2D00FFCC2D00FFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFF0000000000000000000000000069FFFF0069
      FFFF0069FFFF0069FFFF0069FFFFFFCC61FF00D8FFFF0069FFFF0069FFFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFF000000000000000000000000180080FF0000
      C6FF0000C6FF0000C6FF0000C6FF00D8FFFF0000CEFF180080FF180080FFC6C6
      C6FFC6C6C6FFC6C6C6FFC6C6C6FF000000000679ADFF1684B5FF0EC6FFFF06BD
      FFFF06BDFFFF06BDFFFF06BDFFFF06B5F7FF06B5F7FF06ADEFFF06ADEFFF06AD
      E7FF06A5E7FF06A5DEFF2779A5FF0000000000000000CC2D00FFCC2D00FFCC2D
      00FFCC2D00FFCC2D00FFFFCC60FFFF6000FFFF6000FFFF6000FFFF6000FFCC2D
      00FFCC2D00FFCBCBCBFFCBCBCBFF00000000000000000069FFFF0069FFFF0069
      FFFF0069FFFF0069FFFFFFCC61FF00D8FFFF00D8FFFF00D8FFFF00D8FFFF0069
      FFFF0069FFFFCBCBCBFFCBCBCBFF0000000000000000180080FF0000C6FF0000
      C6FF0000C6FF0000C6FF00D8FFFF0000CEFF0000CEFF0000CEFF0000CEFF1800
      80FF180080FFC6C6C6FFC6C6C6FF000000000679ADFF0671A5FF61EFFFFF61EF
      FFFF61EFFFFF61EFFFFF61EFFFFF61EFFFFF06BDF7FF06B5F7FF06B5EFFF06AD
      EFFF06ADE7FF06A5E7FF0E84BDFFA5B5BDFFCC2D00FFCC2D00FFCC2D00FFCC2D
      00FFCC2D00FFFFCC60FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF60
      00FFFF6000FFCC2D00FFCC2D00FF000000000069FFFF0069FFFF0069FFFF0069
      FFFF0069FFFFFFCC61FF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8
      FFFF00D8FFFF0069FFFF0069FFFF00000000180080FF0000C6FF0000C6FF0000
      C6FF0000C6FF00D8FFFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000
      CEFF0000CEFF180080FF180080FF000000000679ADFF0E79ADFF0679ADFF0679
      ADFF0679ADFF0679ADFF0679ADFF0679ADFF61EFFFFF06BDFFFF06B5F7FF06B5
      F7FF06ADEFFF06ADE7FF06A5DEFF508CADFFCC2D00FFCC2D00FFCC2D00FFCC2D
      00FFFFCC60FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF60
      00FFFF6000FFFF6000FFFF6000FFCC2D00FF0069FFFF0069FFFF0069FFFF0069
      FFFFFFCC61FF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8
      FFFF00D8FFFF00D8FFFF00D8FFFF0069FFFF180080FF0000C6FF0000C6FF0000
      C6FF00D8FFFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000
      CEFF0000CEFF0000CEFF0000CEFF180080FF0679ADFF58EFFFFF40BDD6FF40BD
      D6FF40BDD6FF40BDD6FF40BDD6FF40BDD6FF0679ADFF61EFFFFF61EFFFFF61EF
      FFFF61EFFFFF61EFFFFF06ADEFFF2F79ADFFCC2D00FFCC2D00FFCC2D00FFFFCC
      60FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF60
      00FFFF6000FFFF6000FFFF6000FF000000000069FFFF0069FFFF0069FFFFFFCC
      61FF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8
      FFFF00D8FFFF00D8FFFF00D8FFFF00000000180080FF0000C6FF0000C6FF00D8
      FFFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000
      CEFF0000CEFF0000CEFF0000CEFF000000000679ADFFADFFFFFF58EFFFFF58EF
      FFFF58EFFFFF58EFFFFF58EFFFFF50DEEFFF40BDD6FF0679ADFF0679ADFF0679
      ADFF0679ADFF0679ADFF0679ADFF2784ADFFCC2D00FFCC2D00FFFFCC60FFFF60
      00FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF60
      00FFFF6000FFFF6000FF00000000000000000069FFFF0069FFFFFFCC61FF00D8
      FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8
      FFFF00D8FFFF00D8FFFF0000000000000000180080FF0000C6FF00D8FFFF0000
      CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000
      CEFF0000CEFF0000CEFF00000000000000000679ADFFADFFFFFF50EFFFFF58EF
      FFFF58EFFFFF61EFFFFF61F7FFFF58EFFFFF50DEEFFF40BDD6FF40BDD6FF40BD
      D6FF40BDD6FF0679ADFFBDBDC6FFC6C6C6FFCC2D00FFFFCC60FFFF6000FFFF60
      00FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF60
      00FFFF6000FF0000000000000000000000000069FFFFFFCC61FF00D8FFFF00D8
      FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8
      FFFF00D8FFFF000000000000000000000000180080FF00D8FFFF0000CEFF0000
      CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000
      CEFF0000CEFF0000000000000000000000000679ADFFADFFFFFF61F7FFFF69F7
      FFFF69F7FFFF71F7FFFF71F7FFFF79FFFFFF79FFFFFF84FFFFFF84FFFFFF84FF
      FFFF84FFFFFF0679ADFF0000000000000000FFCC60FFFF6000FFFF6000FFFF60
      00FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF60
      00FF00000000000000000000000000000000FFCC61FF00D8FFFF00D8FFFF00D8
      FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8
      FFFF0000000000000000000000000000000000D8FFFF0000CEFF0000CEFF0000
      CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000
      CEFF000000000000000000000000000000000679ADFFADFFFFFF71F7FFFF71F7
      FFFF79FFFFFF79F7FFFF79F7FFFF0679ADFF0679ADFF0679ADFF0679ADFF0679
      ADFF0679ADFF79ADC6FF00000000000000000000000000000000FF6000FFFF60
      00FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FF0000
      000000000000000000000000000000000000000000000000000000D8FFFF00D8
      FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF0000
      00000000000000000000000000000000000000000000000000000000CEFF0000
      CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000
      000000000000000000000000000000000000000000000679ADFFADFFFFFFADFF
      FFFFADFFFFFFADFFFFFF0679ADFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF000000000000
      000000000000000000000000000000000000C6C6C6FF000000000679ADFF0679
      ADFF0679ADFF0679ADFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF6000FFFF6000FFFF6000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000D8FFFF00D8FFFF00D8FFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000CEFF0000CEFF0000CEFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FF000000000000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DADAFEFF7474FEFF3131FEFF0F0FFEFF0F0FFEFF3131FEFF7474FEFFD9D9
      FEFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000118000FF118000FF00000000000000000000
      000000000000000000000000000000000000C27A00FFC27A00FFC27A00FFC27A
      00FFCE9634FFEEDABAFFEDDBB9FFCB8F27FFC27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FF0000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000F9F9FFFF7474
      FEFF0202FEFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0202
      FEFF7474FEFFF9F9FFFF00000000000000000000000000000000000000000000
      00000000000000000000118000FF118000FFCBCBCBFF118000FF118000FF0000
      000000000000000000000000000000000000C27A00FFC27A00FFC27A00FFC27A
      00FFD3A048FFFEFFFFFFFFFFFEFFCD9638FFC27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FF0000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000000000
      00000000000000000000000000000000000000000000F9F9FFFF4C4CFEFF0000
      FFFF0000FFFF1D1DFEFF7979FEFFA8A8FEFFA8A8FEFF7A7AFEFF1E1EFEFF0000
      FFFF0000FFFF4A4AFEFFF9F9FFFF000000000000000000000000000000000000
      000000000000118000FF118000FF118000FFCBCBCBFFCBCBCBFFCBCBCBFF1180
      00FF118000FF000000000000000000000000C27A00FFC27A00FFC27A00FFC27A
      00FFD2A046FFFDFFFFFFFFFFFEFFCD9639FFC27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FF000000FF000000FF000000FF0000
      00FF000000000000000000000000000000FF000000FF00000000000000000000
      0000000000FF000000FF000000FF000000FF000000007676FEFF0000FFFF0000
      FFFF7575FEFFF8F8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0FFFF0202
      FEFF0000FFFF0000FFFF7474FEFF000000000000000000000000000000000000
      0000118000FF118000FF118000FF118000FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF118000FF118000FF00000000C27A00FFC27A00FFC27A00FFC27A
      00FFD2A046FFFDFFFDFFFFFFFEFFCD9639FFC27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FF000000FF000000FF000000FF0000
      00FF000000000000000000000000000000FF000000FF00000000000000000000
      0000000000FF000000FF000000FF000000FFDBDBFEFF0101FEFF0000FFFF7575
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4FEFF1414FEFF0000
      FFFF0303FEFF0000FFFF0202FEFFDADAFEFF0000000000000000000000001180
      00FF118000FF118000FF118000FF118000FFFFCC61FFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFF118000FFC27A00FFC27A00FFC27A00FFC27A
      00FFD19F44FFFEFFFDFFFEFEFEFFDBB372FFD2A04BFFD19E43FFC5820BFFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF030303FF010101FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF7676FEFF0000FFFF1C1CFEFFF8F8
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4FEFF1414FEFF0000FFFF1616
      FEFFD0D0FEFF1E1EFEFF0000FFFF7474FEFF0000000000000000118000FF1180
      00FF118000FF118000FF118000FFFFCC61FF09CC00FF118000FF118000FFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFF00000000C27A00FFC27A00FFC27A00FFC27A
      00FFD19F43FFFFFFFDFFFEFFFFFFFFFFFFFFFFFEFFFFFFFEFFFFFBF6EEFFD7A8
      55FFC27A00FFC27A00FFC27A00FFC27A00FF0000000000000006010101290000
      0002000000FF0C0C0CFF000000FF000000FF000000FF000000FF0B0B0BFF0000
      00FF000000010101012800000006000000003434FEFF0000FFFF7575FEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4FEFF1414FEFF0000FFFF1616FEFFD6D6
      FEFFFFFFFFFF7878FEFF0000FFFF3232FEFF00000000118000FF118000FF1180
      00FF118000FF118000FFFFCC61FF09CC00FF09CC00FF09CC00FF09CC00FF1180
      00FF118000FFCBCBCBFFCBCBCBFF00000000C27A00FFC27A00FFC27A00FFC27A
      00FFD19F43FFFEFFFDFFFEFFFFFFEFE6DBFFEDE1D0FFF5EEE8FFFEFFFCFFFDFD
      F9FFCE9533FFC27A00FFC27A00FFC27A00FF0000000000000000000000000000
      0000010101280D0D0DFD000000FF000000FF000000FF000000FF0D0D0DFD0101
      0128000000000000000000000000000000001212FEFF0000FFFFA5A5FEFFFFFF
      FFFFFFFFFFFFFFFFFFFFD4D4FEFF1414FEFF0000FFFF1616FEFFD6D6FEFFFFFF
      FFFFFFFFFFFFA8A8FEFF0000FFFF1010FEFF118000FF118000FF118000FF1180
      00FF118000FFFFCC61FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC
      00FF09CC00FF118000FF118000FF00000000C27A00FFC27A00FFC27A00FFC27A
      00FFD19F43FFFFFFFDFFFDFFFFFFD1963CFFC27B01FFBF8008FFECDBC1FFFEFF
      FFFFEAD2A8FFC27A00FFC27A00FFC27A00FF0000000000000000000000000000
      0000010101280D0C0CFD000000FF000000FF000000FF000000FF0D0C0CFD0101
      0128000000000000000000000000000000001212FEFF0000FFFFA6A6FEFFFFFF
      FFFFFFFFFFFFD4D4FEFF1414FEFF0000FFFF1616FEFFD6D6FEFFFFFFFFFFFFFF
      FFFFFFFFFFFFA8A8FEFF0000FFFF1010FEFF118000FF118000FF118000FF1180
      00FFFFCC61FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC
      00FF09CC00FF09CC00FF09CC00FF118000FFC27A00FFC27A00FFC27A00FFC27A
      00FFD19F43FFFEFFFDFFFCFFFFFFCF9739FFC27B00FFC27B00FFDDB989FFFEFF
      FFFFF6EBD8FFC27A00FFC27A00FFC27A00FF0000000000000006010101290000
      0005000000FF0F0F0FFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000050000002700000006000000003434FEFF0000FFFF7474FEFFFFFF
      FFFFD4D4FEFF1414FEFF0000FFFF1616FEFFD6D6FEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF7777FFFF0000FFFF3333FFFF118000FF118000FF118000FFFFCC
      61FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC
      00FF09CC00FF09CC00FF09CC00FF00000000C27A00FFC27A00FFC27A00FFC27A
      00FFD19F43FFFFFFFDFFFEFEFFFFCD953CFFBF7900FFC6790AFFEFDDC1FFFFFF
      FFFFF2E4CBFFC27A00FFC27A00FFC27A00FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF020202FF010101FF000000FF000000FF0000
      00FF000000FF050505FC000000FF000000FF7777FFFF0000FFFF1A1AFEFFCECE
      FEFF1414FEFF0000FFFF1616FEFFD6D6FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF8F8FEFF1C1CFEFF0000FFFF7575FEFF118000FF118000FFFFCC61FF09CC
      00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC
      00FF09CC00FF09CC00FF0000000000000000C27A00FFC27A00FFC27A00FFC27A
      00FFD19F43FFFFFFFDFFFEFFFFFFF4E5D5FFF2DFCBFFF5ECE0FFFEFFFEFFFDFE
      FEFFDFBB79FFC27A00FFC27A00FFC27A00FF000000FF000000FF000000FF0000
      00FF000000000000000000000000000000FF000000FF00000000000000000000
      0000000000FF000000FF000000FF000000FFDDDDFFFF0202FEFF0000FFFF0202
      FEFF0000FFFF1616FEFFD6D6FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF7575FEFF0000FFFF0202FEFFDCDCFEFF118000FFFFCC61FF09CC00FF09CC
      00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC
      00FF09CC00FF000000000000000000000000C27A00FFC27A00FFC27A00FFC27A
      00FFD39F43FFFCFEFCFFFCFFFFFFFCFFFFFFFFFFFFFFFFFFFFFFFBFFFDFFEBD7
      B3FFC48007FFC27A00FFC27A00FFC27A00FF000000FF000000FF000000FF0000
      00FF000000000000000000000000000000FF000000FF00000000000000000000
      0000000000FF000000FF000000FF000000FF000000007878FFFF0000FFFF0000
      FFFF0303FEFFD0D0FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFFF7272
      FEFF0000FFFF0000FFFF7575FEFF00000000FFCC61FF09CC00FF09CC00FF09CC
      00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC
      00FF00000000000000000000000000000000C27A00FFC27A00FFC27A00FFC27A
      00FFCA8D22FFE2BF85FFE2C086FFE2BF85FFE1BF84FFDFBC80FFD19C3FFFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FF0000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000000000
      00000000000000000000000000000000000000000000FBFBFFFF4E4EFEFF0000
      FFFF0000FFFF1A1AFEFF7474FEFFA5A5FEFFA5A5FEFF7474FEFF1B1BFEFF0000
      FFFF0000FFFF4D4DFEFFFBFBFFFF00000000000000000000000009CC00FF09CC
      00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF0000
      000000000000000000000000000000000000C27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FF0000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000FBFBFFFF7878
      FEFF0202FEFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0202
      FEFF7777FFFFFBFBFFFF00000000000000000000000000000000000000000000
      000009CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF000000000000
      00000000000000000000000000000000000000000000C27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FF000000000000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DFDFFFFF7878FEFF3636FEFF1313FEFF1313FEFF3535FEFF7777FEFFDCDC
      FEFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000009CC00FF09CC00FF09CC00FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCC3F00FFC94900000000000000000000000000000000000000
      0000000000000000000000000000002F00FF002F00FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000F7F7F7FF0A0A
      0AFFE3E3E3FF000000000000000000000000000000000000000000000000F3F3
      F3FF0A0A0AFFF3F3F3FF0000000000000000000000000F3371FF103876FF1139
      78FF426399FF4B6B9CFF4F2525FF4F2525FF4F2525FF2F3D66FF1A3C78FF262B
      4DFF402731FF402731FF192E5EFF284278FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFC94400FFD43A00FFCC3E00000000000000000000000000000000000000
      00000000000000000000002F00FF9CC69CFF9CC69CFF002F00FFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000004E4E
      4EFF8F8F8FFF000000000000000000000000000000000000000000000000A3A3
      A3FF424242FF00000000000000000000000010306DFF12458AFF14478FFF1649
      94FF9BB2D2FFD4D9E4FF4F2525FF4F2525FF4F2525FF9BADCEFF96B2DCFF634E
      5EFF4F2525FF522D31FF608AC6FF193C7BFF0000000000000000000000000000
      000000000000FFCC6600FFBB6600FFC46200FFBF5F000000000000000000FFC3
      5200FFD23A00FFC64900FFBF3F00000000000000000000000000000000000000
      00000000000000000000002F00FFFFFFFFFF9CC69CFF002F00FFFFFFFFFF0000
      000000000000000000000000000000000000000000000000000000000000A3A3
      A3FF3A3A3AFF0000000000000000000000000000000000000000000000004E4E
      4EFF9B9B9BFF0000000000000000000000001F3C74FF15468FFF174B98FF1A4D
      9CFFA0BDDCFFE4EBF5FFD4E0F0FFC5D4EBFFB7CBE5FFA8C0E2FF9AB6DDFF6651
      60FF583A40FF626181FF5983BEFF1D3B73FF000000000000000000000000FFCC
      5000FFD83500FFE45E00FFE56500FFE26200FFE26500FFDB4900FFD63E00FFD9
      5900FFCA43000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000002F00FF002F00FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000F3F3
      F3FF060606FFDFDFDFFFCFCFCFFF9B9B9BFF9B9B9BFFCFCFCFFFEFEFEFFF0A0A
      0AFFEBEBEBFF0000000000000000000000002C477AFF174893FF1C4EA0FF1F51
      A5FFA6C0DFFFE9EEF6FFD9E4F1FFCBD9EDFFBCCEE8FFADC4E4FF9FB9DFFF92AE
      D9FF85A5D4FF759AD0FF3E65A3FF50658EFF00000000FFAA5500FFBB5D00FFD3
      2E00FFDD5600FFDC3E00FFDA3E00FFD83D00FFD73C00FFD84E00FFD95800FFCC
      3800FFC369000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000E3E3
      E3FF171717FF070707FF323232FF6A6A6AFF6A6A6AFF323232FF080808FF1414
      14FFE3E3E3FF0000000000000000000000003F5786FF194795FF2053A8FF2356
      ADFFA8C1E1FFEEF2F8FFDFE7F4FFD0DCEEFFC0D1E9FFB2C7E4FFA3BDE0FF96B2
      DCFF89A8D7FF7A9FD2FF264A89FF8893A9FF00000000FFCD3B00FFDA6600FFD8
      5100FFD85100FFD75000FFD64F00FFD54E00FFD44E00FFD14D00FFCF4C00FFC8
      3C00FFC250000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000002F00FF002F00FFFFFFFFFF000000000000
      00000000000000000000000000000000000000000000000000009F9F9FFF1616
      16FF575757FF3A3A3AFF000000000000000000000000000000004D4D4DFF5252
      52FF161616FF939393FF00000000000000006E809DFF133572FF183E8FFF2351
      ADFFA5B0DCFFF4F6F9FFBBC9E2FF87A6D0FF5F8AC9FFA5BFE0FFA8C0E2FF9AB6
      DDFF8DACD8FF799CD0FF143572FFBBBEC1FF00000000FFC84200FFD45000FFD7
      5A00FFD75A00FFD75A00FFD65C00FFD45A00FFD25600FFD05500FFCF5500FFCE
      5600FFBE32000000000000000000000000000000000000000000000000000000
      00000000000000000000002F00FF94BD94FF9CC694FF002F00FFFFFFFFFF0000
      00000000000000000000000000000000000000000000000000002A2A2AFFD7D7
      D7FFF3F3F3FF060606FFE3E3E3FF0000000000000000F3F3F3FF0A0A0AFFEBEB
      EBFFD7D7D7FF262626FF939393FF0000000000000000B0B5BCFF495791FF0A11
      89FF436BBCFF11138CFF0C2A81FF1B4E9FFF285AB1FFB9CBE7FFADC4E4FF8CA9
      D2FF4A6DA5FF1F417DFF445A88FF0000000000000000FFB86300FFC74000FFD7
      7200FFD87400FFD97900FFD97C00FFDA8100FFDA8300FFD06A00FFCF6800FFCC
      6700FFC95A00FF7F000000000000000000000000000000000000000000000000
      00000000000000000000002F00FFFFFFFFFF84AD84FF94BD94FF002F00FFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000004E4E4EFF8F8F8FFF0000000000000000A3A3A3FF424242FF0000
      000000000000D7D7D7FF161616FFE3E3E3FF0000000000000000ADADBFFF1013
      89FF214CACFF0E0F87FF182C77FF143A7CFF2955A0FF718EB8FF30538CFF0F2D
      6FFF314384FF9BA3B2FF000000000000000000000000FFC15C00FFC34300FFD9
      8100FFDA8400FFDB8900FFDC8B00FFDC8F00FFDC9200FFD98D00FFCF7200FFCD
      7000FFCC7000FF7F3F0000000000000000000000000000000000000000000000
      0000000000000000000000000000002F00FFFFFFFFFF9CC69CFF9CC69CFF002F
      00FFFFFFFFFF0000000000000000000000000000000000000000000000000000
      000000000000A3A3A3FF3A3A3AFF00000000000000004E4E4EFF9B9B9BFF0000
      000000000000000000008B8B8BFF525252FF0000000000000000B2B2C0FF1012
      89FF214CACFF121289FFA3A4BAFF7D8CA5FF2D487CFF0F2575FF1C4699FF1315
      8AFF9999B8FF000000000000000000000000FFAA5500FDB64B00FFDB9800FFDE
      9E00FFDFA000FFE0A400FFE0A600FFE1AA00FFE2AD00FFE2B000FFE2B200FDCB
      7A00FDB141000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFF0000000000000000002F00FFFFFFFFFF9CC69CFF9CC6
      9CFF002F00FF0000000000000000000000000000000000000000000000000000
      000000000000EFEFEFFF060606FF181818FF191919FF070707FFE7E7E7FF0000
      0000000000000000000000000000000000000000000000000000BDBDC4FF0D0E
      87FF214CACFF0F0F88FFB6B6C1FF00000000B4B4C1FF0D0F88FF1E46A9FF0D0D
      86FFC1C1C5FF000000000000000000000000FFB43D00FEDBA000FFDFA700FFE1
      AB00FFE2AD00FFE3B100FFE3B300FFE4B600FFE4B800FEE5BC00FDE5BE00F8B5
      5100F9AF4F00000000000000000000000000000000000000000000000000FFFF
      FFFF002F00FF002F00FFFFFFFFFF0000000000000000002F00FFFFFFFFFF9CC6
      9CFF002F00FF0000000000000000000000000000000000000000000000000000
      000000000000767676FF000000FF000000FF000000FF000000FF767676FF0000
      0000000000000000000000000000000000000000000000000000BFBFC5FF0B0B
      86FF214DACFF0B0B85FFC1C1C5FF00000000BDBDC4FF0B0B87FF152C9CFF2C2C
      91FF00000000000000000000000000000000FFB24C00FCB64E00FBC67700FCDC
      AD00FDE7C500FDE8C800FDE8C900FCE8CC00FCE8CE00FCE9D000FBE9D200F8DE
      C100F2B66900EB8F3300FFAA550000000000000000000000000000000000002F
      00FF9CC69CFF9CC69CFF002F00FFFFFFFFFFFFFFFFFF002F00FFFFFFFFFF9CC6
      9CFF002F00FF0000000000000000000000000000000000000000000000000000
      0000000000001A1A1AFF000000FF0000000000000000000000FF1A1A1AFF0000
      000000000000000000000000000000000000C9C1B8FFCA9152FFCA8942FF0B0B
      84FF16309EFF0B0B85FF0000000000000000C19B74FF080985FF111A93FF6464
      A5FF0000000000000000000000000000000000000000FFA25C00FFBC5E00F7A5
      3300F7B76300FCE9D100FCEAD300FCEAD600FCEBD700FBEBDA00FAE7D400EB8F
      3100EA923A00EC9F5200E37D2400FFAA5500000000000000000000000000002F
      00FFFFFFFFFF9CC69CFF79AD79FF002F00FF002F00FFFFFFFFFF9CC69CFF9CC6
      9CFF002F00FF0000000000000000000000000000000000000000000000000000
      0000000000001A1A1AFF000000FF0000000000000000000000FF1A1A1AFF0000
      000000000000000000000000000000000000D59A4DFFF6DAB2FFF9E5C6FF9993
      BCFF22208CFF584059FFC9BEB4FFCE9C5BFFE0A656FF4747A8FF100E79FFA9A9
      BDFF000000000000000000000000000000000000000000000000000000000000
      0000EE913400FCEFE300FCEFE400F6DCC600EEBC9200FCF1E900F0C6A2000000
      000000000000FF9F5F00DC7D3E00E78737000000000000000000000000000000
      0000002F00FFFFFFFFFF9CC69CFF9CC69CFF9CC69CFF9CC69CFF79AD79FF002F
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000007A7A7AFF000000FF000000FF000000FF000000FF7A7A7AFF0000
      000000000000000000000000000000000000D5B07CFFEDCC9DFFFCFCFCFFFCFB
      F8FFE5B269FFE2AA5DFFD48D2CFFF9ECD6FFFCF9F6FFEDCC98FFD0A266FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1A14900FBF2EA00F5DDCA00E4802A00E98C3900F0C9AE00FAECE200FFAA
      55000000000000000000FF7F0000000000000000000000000000000000000000
      000000000000002F00FFFFFFFFFF9CC69CFF9CC69CFFFFFFFFFF002F00FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFBFF7A7A7AFF1A1A1AFF1A1A1AFF767676FFFBFBFBFF0000
      000000000000000000000000000000000000C9C9C9FFE5BF87FFECCC9CFFF4E0
      C1FFFCFCFBFFFCFCFCFFF7E2C4FFE7BD80FFEBC693FFD9AF73FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFAA5500FF7F00000000000000000000FFAA5500DD742D00FFAA
      5500000000000000000000000000000000000000000000000000000000000000
      00000000000000000000002F00FF002F00FF002F00FF002F00FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF000000FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000D0B5
      8FFFDDA85FFFE0AC65FFD4A15CFFC9C3BDFF0000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFF
      FFFF00000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      00000000000000000000F3F3F3FFAEAEAEFFB0B0B0FFF5F5F5FF000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000000000000000000061C6DEFF58CEE7FF61C6D6FF000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      0000000000FFFFFFFFFF00000000000000FFFFFFFFFF00000000000000FFFFFF
      FFFF00000000000000FF000000FFFFFFFFFF0000000000000000000000000000
      000000000000DDDDDDFF727272FF737373FF707070FF838383FFE1E1E1FF0000
      0000000000000000000000000000000000000000000000000000000000003B3B
      3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B
      3BFF3B3B3BFFFFFFFFFF00000000000000000000000000000000000000000000
      0000000000000000000061C6DEFF2F2F58FF2F2F58FF58CEE7FF61C6D6FF0000
      000000000000000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF000000000000000000000000F9F9
      F9FFB2B2B2FF4E4E4EFF4E4E4EFF717171FF737373FF6A6A6AFF656565FFBBBB
      BBFFFAFAFAFF0000000000000000000000000000000000000000000000003B3B
      3BFFFFFFFFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF9E9E9EFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF48ADC6FF2F2F58FF58CEE7FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8FF7C7C
      7CFF373737FF3C3C3CFF414141FF656565FF666666FF606060FF606060FF5858
      58FF8F8F8FFFEBEBEBFF00000000000000000000000000000000000000003B3B
      3BFFFFFFFFFF9E9E9EFFCFCFCFFF6C6C6CFFCFCFCFFF3B3B3BFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF58CEE7FF2F2F58FF000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF00000000D4D4D4FF4D4D4DFF2525
      25FF292929FF2E2E2EFF333333FF595959FF5A5A5AFF535353FF535353FF5252
      52FF4E4E4EFF656565FFDBDBDBFF000000000000000000000000000000003B3B
      3BFFFFFFFFFF9E9E9EFFCFCFCFFF6C6C6CFFCFCFCFFF3B3B3BFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF00000000000000000000000000000000000000000000
      00000000000000000000000000002F2F58FF2F2F58FF00000000000000000000
      000000000000000000000000000000000000000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF00000000989898FF282828FF2424
      24FF242424FF252525FF262626FF4D4D4DFF4E4E4EFF464646FF464646FF4545
      45FF434343FF444444FFAFAFAFFF000000000000000000000000000000003B3B
      3BFFFFFFFFFF9E9E9EFFCFCFCFFF6C6C6CFFCFCFCFFF3B3B3BFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000959595FF282828FF2424
      24FF242424FF242424FF242424FF4B4B4BFF4B4B4BFF404040FF404040FF4040
      40FF404040FF434343FFAFAFAFFF000000000000000000000000000000003B3B
      3BFFFFFFFFFF9E9E9EFFCFCFCFFF6C6C6CFFCFCFCFFF3B3B3BFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000000000000000000048ADC6FF58CEE7FF00000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF00000000969696FF282828FF2424
      24FF242424FF242424FF4C4C4CFF797979FF757575FF555555FF404040FF4040
      40FF404040FF434343FFAFAFAFFF000000000000000000000000000000003B3B
      3BFFFFFFFFFF9E9E9EFFCFCFCFFF6C6C6CFFCFCFCFFF3B3B3BFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF00000000000000000000000000000000000000000000
      0000000000000000000048ADBDFF2F2F58FF2F2F58FF58CEE7FF000000000000
      000000000000000000000000000000000000000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF00000000989898FF292929FF2424
      24FF323232FF767676FF7B7B7BFF757575FF717171FF787878FF757575FF4242
      42FF404040FF434343FFB2B2B2FF000000000000000000000000000000003B3B
      3BFFFFFFFFFF9E9E9EFFCFCFCFFF6C6C6CFFCFCFCFFF3B3B3BFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF61C6DEFF2F2F58FF58CEE7FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000999999FF292929FF4B4B
      4BFF858585FF6A6A6AFF6D6D6DFF6D6D6DFF6B6B6BFF656565FF666666FF8686
      86FF4F4F4FFF434343FFB2B2B2FF000000000000000000000000000000003B3B
      3BFFFFFFFFFF9E9E9EFFCFCFCFFF6C6C6CFFCFCFCFFF3B3B3BFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF48ADC6FF2F2F58FF58CEE7FF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF000000009E9E9EFF535353FF6161
      61FF5E5E5EFF6C6C6CFF707070FF6F6F6FFF6D6D6DFF6B6B6BFF686868FF6363
      63FF6D6D6DFF545454FFB4B4B4FF000000000000000000000000000000003B3B
      3BFFFFFFFFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF9E9E9EFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF61C6DEFF2F2F58FF58CEE7FF0000
      000000000000000000000000000000000000000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF00000000C3C3C3FF4F4F4FFF5B5B
      5BFF6B6B6BFF707070FF717171FF737373FF737373FF737373FF737373FF6F6F
      6FFF636363FF5A5A5AFFCECECEFF0000000000000000000000003B3B3BFF3B3B
      3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B
      3BFF3B3B3BFF3B3B3BFFFFFFFFFF000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF48ADBDFF2F2F58FF58CEE7FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D5D5D5FF7171
      71FF6C6C6CFF717171FF737373FF737373FF737373FF747474FF737373FF6A6A
      6AFF727272FFD9D9D9FF000000000000000000000000000000003B3B3BFFFFFF
      FFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
      9EFF6C6C6CFF3B3B3BFFFFFFFFFF000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF61C6DEFF2F2F58FF58CEE7FF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000F7F7
      F7FF9F9F9FFF676767FF747474FF747474FF747474FF737373FF6A6A6AFFA4A4
      A4FFF9F9F9FF00000000000000000000000000000000000000003B3B3BFF3B3B
      3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B
      3BFF3B3B3BFF3B3B3BFF00000000000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF409CB5FF2F2F58FF58CEE7FF0000
      000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFF
      FFFF00000000FFFFFFFF000000FFFFFFFFFF0000000000000000000000000000
      000000000000D4D4D4FF727272FF737373FF757575FF797979FFD9D9D9FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000B0B0BFFCFCFCFFFCFCFCFFFCFCFCFFF0B0B0BFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF58CEE7FF2F2F58FF4094A5FF0000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      0000000000FFFFFFFFFF00000000000000FFFFFFFFFF00000000000000FFFFFF
      FFFF00000000000000FF000000FFFFFFFFFF0000000000000000000000000000
      00000000000000000000F7F7F7FF9B9B9BFFA4A4A4FFF9F9F9FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000B0B0BFF0B0B0BFF0B0B0BFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000058A5B5FF2F2F58FF2F2F58FF408CA5FF000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300100000100010000000000800900000000000000000000
      000000000000000000000000FFFFFF000000C387000000000000C38700000000
      0000C387000000000000C387000000000000C301000000000000810100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010100000000000001010000000000008103000000000000C3C700000000
      0000C387000000000000C3C70000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C00300000000FFFF800100000000C01F
      0000000000000007000000000000000300000000000000010000000000000000
      0000000000000000000000000000800000000000000080000000000000008000
      0000000000008001000000000000C001000000000000C003000000000000F007
      800100000000F81FC00300000000FFFFC003C0030000C0038001800100008001
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8001800100008001C003C0030000C003FBFFFFFFFFFF0C30F07FE00700030C30
      E03FE00700030C30C00FC00300030C308003C0030001FFFF000380010001FFFF
      0003800100010C300003000000000C300003000000000C300003800100000C30
      000380010003FFFF0003C0030003FFFF0003C00300070C300007E00781FF0C30
      001FE007C3FF0C30F07FFFFFFFFF0C3092489248F00FFE7F12481248D81BFC3F
      7FFC7FFC8C31F81FFFFFFFFF07E0F00F3FFC3FFC04E0F00F3FFC3FFC0CF0F81F
      FFFFFFFF0CF0F81F3FFC3FFCFC3FF00F3FFC3FFCFC9FC183FFFFFFFF0CD083C1
      3FFC3FFC0C9003C03FFC3FFC04200000FFFFFFFF07E000003FFC3FFC8C310000
      12481248D81B87E112481248F00FCFF3E0070000000000008001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8001000000000000E007000000000000C3C3C003F0CFFFFF0180C003F007FE71
      0000E000E000FE710000E000F010F0031818C000F03FC0070F08C0003C1F8001
      0308E000C20F060083B9F000C3070E70E19FF00080070E70F18FF80000070E00
      F18FC000800F0E00F18FC000C01F87E0F18F0000C0FF8001F00F0003C0FFC003
      F81F8003E0FFE00FFC3FE00FF5FFFFFF00000000F9FF000000000000F9FF0000
      00000000F9FF000000000000F8FF000000000000F8FF000000000000F87F0000
      00000000F83F000000000000FC1F000000000000000700000000000000000000
      000000003000000000000000E007000000000000C11F000000000000C19F0000
      00000000C19F000000000000E19F0000FFFFE0070000FFFF800080010000FFFF
      000000000000FFFF000000000000800100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008001
      000080010000FFFFFFFFE0070000FFFF8001E0010000FFFF8001C0010000FFFF
      8001C0010000FFFF8001C001000080018001C00100000000C003C00100000000
      E007C00100000000E007C00100000000E007C00100000000E007C00100000000
      E007C00100000000E007C00100000000E007C00100000000E007C00100008001
      F00FC0010000FFFFF81FC0030000FFFFFFFFFFFFFFFF80011111082183838001
      111108218383800111110821838380011111082183838001BBBBBEFBEFEFC003
      BBBBBEFBEFEFE00780038003E00FF00FFEFFFEFFFEFFF00FFEFFFEFFFEFFE007
      E00FE00FE00FE007E00FE00FE00FE007E00FE00FE00FE007E00FE00FE00FE007
      E00FE00FE00FF00FFFFFFFFFFFFFF81FFFFFFC3FF00F0000FFFFFC3FE0070000
      FFFFFC3FC0030000FFFFFC3F800100003084FC3F00000000B6B5F42F00000000
      8631F42F00008001CE31F42F0000C003CEB5F42F0000C0078484F00F0000C107
      B7FFF00F0000C10F33FFF00F0000030FFFFFFC3F8001000FFFFFF81FC003001F
      FFFFF81FE007003FFFFFFC3FF00FE0FFFFFF000000009248FFFF000000001248
      FFFF000000007FFCF81F00000000FFFFF00F000000003FFCE007000000003FFC
      83C100000000FFFF8181000000003FFC8181000000003FFCE00700000000FFFF
      F00F000000003FFCF81F000000003FFCFFFF00000000FFFFFFFF000000003FFC
      FFFF000000001248FFFF000000001248FE7F00000000FFFFFC1F000000000003
      F807000000000003F001000000000001E000000000000001C001000000000001
      8001000000000000000100000000000000000000000000000001000000000000
      00030000000000000007000000000003000F000000000003C01F0000000081FF
      F03F0000000043FFFC7F00000000FFFF80010000F00F000000000000C0030000
      0000000080010000000000008001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800100000000000080010000
      00000000C003000080010000F00F0000FFF9FE3FC7E38000FFF1FC1FE7E70000
      F861FC1FE7E70000E007FE7FE00700008007FE7FE00700008007FE3FC3C30000
      8007FC1FC18180018003FC0FF998C0038003FE07F99CC0070007F307F81FC107
      0007E187F81FC10F0001E007F99F030F8000E007F99F000FF018F00FF81F001F
      F00DF81FF81F003FF98FFC3FFE7FE0FF9248FC3FE003FE3F1248F81FE003FC1F
      7FFCE007E003FC1FFFFFC003E003FC3F3FFC8001E003FE7F3FFC8001E003FFFF
      FFFF8001E003FE7F3FFC8001E003FC3F3FFC8001E003FC1FFFFF8001E003FC1F
      3FFC8001E001FC1F3FFC8001C001FC1FFFFFC003C001FC1F3FFCE007C003FC1F
      1248F81FF83FFC1F1248FC3FFC7FFC3F00000000000000000000000000000000
      000000000000}
  end
  object ObjectStateImageList24: TImageList
    ColorDepth = cd32Bit
    Height = 24
    Width = 24
    Left = 72
    Top = 264
    Bitmap = {
      494C010109001800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000060000000480000000100200000000000006C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFF0DC00FFCB8400FFAF4200FF9E1800FF95
      0300FF950300FF9E1800FFAF4200FFCB8400FFF0DC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFF0DD00FFB75400FF940100FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940100FFB75400FFF0DD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFD7A000FF980B00FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF980B00FFD7
      A000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCC
      8700FF940000FF940000FF940000FF940000FF940000FF940000FF9E1A00FFD6
      9F00FFE2BC00FFB04300FF940000FF940000FF940000FF940000FF940000FF94
      0000FFCC86000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFD7A100FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FFD69E00FFFF
      FF00FFFFFF00FFFBF600FFA42700FF940000FF940000FF940000FF940000FF94
      0000FF940000FFD7A00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFF1DE00FF980B00FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FFE2BA00FFFF
      FF00FFFFFF00FFFFFF00FFC57600FF940000FF940000FF940000FF940000FF94
      0000FF940000FF980B00FFF0DD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFB75500FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FFAD3D00FFFA
      F300FFFFFF00FFEFD800FF9E1A00FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FFB75400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFF1DE00FF940200FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FFA2
      2200FFC26F00FF9E1A00FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940100FFF0DC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFCC8600FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FFCB84000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFB04400FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FFB4
      4F00FFEACE00FF9E1A00FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FFAF42000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF9E1900FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FFDC
      AC00FFFFFF00FFBC6000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF9E18000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF950300FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FFE6
      C500FFFFFF00FFCA8100FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF9503000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF950300FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FFF0
      DC00FFFFFF00FFD7A000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF9503000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF9E1A00FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF9E1A00FFFB
      F700FFFFFF00FFE2BC00FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF9E19000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFB04500FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FFC06A00FFFF
      FF00FFFFFF00FFEDD500FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FFB044000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFCC8700FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FFCD8900FFFF
      FF00FFFFFF00FFF6E900FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FFCB85000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFF1DF00FF940200FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FFD7A100FFFF
      FF00FFFFFF00FFFDFB00FF9F1B00FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940200FFF1DE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFB85700FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FFDEB100FFFF
      FF00FFFFFF00FFFFFF00FFBF6700FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FFB75500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFF1E000FF990C00FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FFDDAE00FFFF
      FF00FFFFFF00FFFFFF00FFBF6700FF940000FF940000FF940000FF940000FF94
      0000FF940000FF990C00FFF1DE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFD8A400FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FFAA3400FFF1
      DE00FFFAF400FFE1B900FF9E1A00FF940000FF940000FF940000FF940000FF94
      0000FF940000FFD8A30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFCE
      8B00FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FFCE8B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFD8A400FF990C00FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF990C00FFD8
      A400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFF1E000FFB85700FF940200FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940200FFB85700FFF1E0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFF1DF00FFCC8700FFB04500FF9E1A00FF95
      0300FF950300FF9E1A00FFB04500FFCC8700FFF1DF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEEED800FDC97F00FEAE3E00FF9B1300FF94
      0100FF940100FF9B1300FEAE3E00FDC97F00FEEED80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00DCDCDC00B6B6B6009E9E9E009696
      9600969696009E9E9E00B6B6B600DCDCDC00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005F5F
      FF005E5EFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D8E8FE007FB4FE003D8DFE001274FE00016A
      FF00016AFF001274FE003D8DFE007EB3FE00D7E7FE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDEED900FEB55000FF940100FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940100FEB55000FDEED9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C0C0C000969696009696960096969600969696009696
      96009696960096969600969696009696960096969600C0C0C000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009090FF008F8FFF00C0C0FF00D0D0FF002E2EFF000000
      FF000000FF002D2DFF00D0D0FF00C1C1FF008F8FFF009090FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D9E8FE005098FE00016AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00016AFF004F98FE00D9E8FE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDD59B00FF970900FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF970900FDD4
      9B00000000000000000000000000000000000000000000000000000000000000
      0000EBEBEB009B9B9B0096969600969696009696960096969600969696009696
      96009696960096969600969696009696960096969600969696009B9B9B00EBEB
      EB00000000000000000000000000000000000000000000000000000000000000
      000000000000CDCDFF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00CCCCFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009CC5FE00096FFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00096FFF009BC4
      FE0000000000000000000000000000000000000000000000000000000000FECA
      8200FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FDCA8200000000000000000000000000000000000000000000000000DBDB
      DB00969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600DBDBDB000000000000000000000000000000000000000000000000000000
      0000000000006060FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF005F5FFF000000
      00000000000000000000000000000000000000000000000000000000000083B6
      FE00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF0081B5FE000000000000000000000000000000000000000000FDD49B00FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FDD49B0000000000000000000000000000000000EBEBEB009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      960096969600EBEBEB000000000000000000000000000000000000000000BDBD
      FF007373FF000808FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000808FF007373
      FF00BDBDFF0000000000000000000000000000000000000000009CC5FE00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF009BC4FE00000000000000000000000000FDEED900FF970900FF94
      0000FF940000FF940000FF940000FF940000FF940000FE9A1000FBAE4200FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF970900FDEED9000000000000000000FFFFFF009A9A9A009696
      9600969696009696960096969600979797009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009A9A9A00FFFFFF000000000000000000000000002121FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF002020FF00000000000000000000000000DAE9FE000A6FFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00096FFF00D9E8FE000000000000000000FEB55000FF940000FF94
      0000FF940000FF940000FF940000FF940000FE9A1000F3DDBC00F0EEE700FAB2
      4E00FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FEB550000000000000000000C0C0C000969696009696
      9600969696009696960096969600969696009696960096969600979797009696
      9600969696009898980096969600969696009696960096969600969696009696
      96009696960096969600C0C0C0000000000000000000000000000A0AFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000909FF000000000000000000000000005098FE00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF001E7BFF0068A7FF000F73
      FF00006AFF00006AFF004F98FE0000000000FEEED800FF940100FF940000FF94
      0000FF940000FF940000FF940000FE9A1000F3DDBC00F0EFEB00F0EFEB00F0EE
      E700FAB24E00FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940100FEEED800FFFFFF0096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600FFFFFF0000000000000000001A1AFF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF001919FF000000000000000000D9E8FE00016AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00046CFF0074AEFF00F4F8FF00FFFFFF0083B6
      FF00006AFF00006AFF00016AFF00D8E8FE00FEC97F00FF940000FF940000FF94
      0000FF940000FF940000FE9A1000F3DDBC00F0EFEB00F0EFEB00F0EFEB00F0EF
      EB00F0EEE700FAB24E00FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FDC97F00DBDBDB0096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600DBDBDB0000000000EAEAFF001515FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF001414FF00EAEAFF000000000080B4FE00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00378AFF00CEE2FF00FFFFFF00FFFFFF00E3EFFF003589
      FF00006AFF00006AFF00006AFF007FB4FE00FEAE3E00FF940000FF940000FF94
      0000FF940000FE9A1000F3DDBC00F0EFEB00F0EFEB00F0EDE700F3E0C300F0EF
      EB00F0EFEB00F0EEE700FAB24E00FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FEAE3E00B5B5B50096969600969696009696
      9600969696009898980096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600B5B5B500E8E8FF002C2CFF000000FF000000
      FF00FFFFFF000000FF002A2AFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF001F1FFF000000FF000000FF00FFFF
      FF000000FF000000FF002B2BFF00E7E7FF003F8EFE00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF001073FF0095C1FF00FDFEFF00FFFFFF00FBFDFF0090BEFF000D72FF00006A
      FF00006AFF00006AFF00006AFF003D8DFE00FF9B1300FF940000FF940000FF94
      0000FE9A1000F3DDBC00F0EFEB00F0EFEB00F0EDE700FAB24C00FE990D00F4DB
      B600F0EFEB00F0EFEB00F0EEE700FAB24E00FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF9B13009D9D9D0096969600969696009696
      9600969696009696960099999900969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      96009696960096969600969696009D9D9D003636FF000000FF000000FF000000
      FF00FFFFFF000101FF000000FF00FFFFFF000000FF00FFFFFF000000FF000000
      FF002323FF000000FF000000FF00FFFFFF000000FF002020FF000000FF00FFFF
      FF001616FF000000FF000000FF003535FF001475FE00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00599E
      FF00E7F1FF00FFFFFF00FFFFFF00CCE1FF003287FF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF001375FE00FF940100FF940000FF940000FF95
      0200F3DBB700F0EFEB00F0EFEB00F0EDE700FAB24C00FF940000FF940000FE99
      0D00F4DBB600F0EFEB00F0EFEB00F0EEE700FAB24E00FF940000FF940000FF94
      0000FF940000FF940000FF940000FF9401009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696005F5FFF000000FF000000FF000000
      FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF00FFFFFF000000FF000C0C
      FF000606FF000707FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF005E5EFF00016AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF006AA8FF00FFFF
      FF00FFFFFF00F1F7FF006FABFF00036CFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00016AFF00FF940100FF940000FF940000FF94
      0000FAB24E00F0EEE700F0EDE700FAB24C00FF940000FF940000FF940000FF94
      0000FE990D00F4DBB600F0EFEB00F0EFEB00F0EEE700FAB24E00FF940000FF94
      0000FF940000FF940000FF940000FF9401009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      960096969600969696009696960096969600E9E9FF001313FF000000FF000000
      FF00FFFFFF00FFFFFF000000FF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00FFFFFF000000FF001212FF00E8E8FF00016AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF008EBDFE00FFFF
      FF00D8E8FF001B7AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00016AFF00FF9B1300FF940000FF940000FF94
      0000FF940000FAB24E00FAB24C00FF940000FF940000FF940000FF940000FF94
      0000FF940000FE990D00F4DBB600F0EFEB00F0EFEB00F0EEE700FAB24E00FF94
      0000FF940000FF940000FF940000FF9B13009D9D9D0096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      96009696960096969600969696009D9D9D00000000007676FF000000FF000000
      FF00FFFFFF000000FF000000FF00FFFFFF000000FF00FFFFFF000000FF000000
      FF000F0FFF000000FF00FFFFFF000000FF000000FF00FFFFFF000000FF000000
      FF00FFFFFF000202FF007575FF00000000001475FE00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF008EBDFE00FFFF
      FF00B7D4FE00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF001375FE00FEAE3E00FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FE990D00F4DBB600F0EFEB00F0EFEB00F0EEE700FAB2
      4E00FF940000FF940000FF940000FEAE3E00B5B5B50096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600B5B5B500000000003939FF000000FF000000
      FF00FFFFFF000000FF000000FF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF00FFFFFF000000FF000000FF00FFFFFF000404FF002222
      FF00FFFFFF002525FF003838FF00000000003F8EFE00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF008EBDFE00FFFF
      FF00B7D4FE00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF003E8EFE00FEC97F00FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FE990D00F4DBB600F0EFEB00F0EFEB00F3DB
      B700FF950200FF940000FF940000FDC97F00DBDBDB0096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600DBDBDB00E3E3FF000202FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000202FF00E1E1FF0082B5FE00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF008EBDFE00FFFF
      FF00B7D4FE00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF0080B4FE00FEEED800FF940100FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FE990D00F4DBB600F3DDBC00FE9A
      1000FF940000FF940000FF940100FEEED800FFFFFF0096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600FFFFFF00D7D7FF001010FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000F0FFF00D6D6FF00DAE9FE00026BFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF008EBDFE00FFFF
      FF00B7D4FE00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00016AFF00D9E8FE0000000000FEB55000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FE990D00FE9A1000FF94
      0000FF940000FF940000FEB550000000000000000000C0C0C000969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      96009696960096969600C0C0C0000000000000000000E5E5FF005D5DFF000101
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000101FF005C5CFF00E4E4FF0000000000000000005199FE00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF008EBDFE00FFFF
      FF00B7D4FE00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF005098FE000000000000000000FDEED900FF970900FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF970900FDEED9000000000000000000FFFFFF009A9A9A009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009A9A9A00FFFFFF00000000000000000000000000000000006868
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF006666FF0000000000000000000000000000000000DBE9FE000A6FFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF008ABAFE00FFFF
      FF00B4D3FE00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF000A6FFF00DBE9FE00000000000000000000000000FDD59B00FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FDD59B0000000000000000000000000000000000EBEBEB009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      960096969600EBEBEB0000000000000000000000000000000000000000009494
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF009393FF0000000000000000000000000000000000000000009FC6FE00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF002D84FF00B6D4
      FF004894FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF009DC5FE000000000000000000000000000000000000000000FECA
      8200FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF940000FF94
      0000FECA8200000000000000000000000000000000000000000000000000DBDB
      DB00969696009696960096969600969696009696960096969600969696009696
      9600969696009696960096969600969696009696960096969600969696009696
      9600DBDBDB00000000000000000000000000000000000000000000000000C1C1
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00C0C0FF0000000000000000000000000000000000000000000000000084B7
      FE00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF0083B6FE000000000000000000000000000000000000000000000000000000
      0000FDD59B00FF970900FF940000FF940000FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940000FF940000FF970900FDD4
      9B00000000000000000000000000000000000000000000000000000000000000
      0000EBEBEB009A9A9A0096969600969696009696960096969600969696009696
      96009696960096969600969696009696960096969600969696009A9A9A00EBEB
      EB00000000000000000000000000000000000000000000000000000000000000
      0000AEAEFF009A9AFF008E8EFF002D2DFF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF002A2AFF008E8EFF009999FF00AEAE
      FF00000000000000000000000000000000000000000000000000000000000000
      00009FC6FE000A6FFF00006AFF00006AFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00006AFF00006AFF000A6FFF009EC6
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000FDEED900FEB55000FF940100FF940000FF940000FF940000FF94
      0000FF940000FF940000FF940000FF940000FF940100FEB55000FDEED9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C0C0C000969696009696960096969600969696009696
      96009696960096969600969696009696960096969600C0C0C000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D8D8FF000E0EFF000000FF000000FF001C1C
      FF001D1DFF000000FF000000FF000E0EFF00D7D7FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DCEAFE005299FE00026BFF00006AFF00006AFF00006AFF00006A
      FF00006AFF00006AFF00006AFF00006AFF00026BFF005199FE00DBE9FE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FEEED800FEC97F00FEAE3E00FF9B1300FF94
      0100FF940100FF9B1300FEAE3E00FEC97F00FEEED80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00DCDCDC00B6B6B6009E9E9E009696
      9600969696009E9E9E00B6B6B600DCDCDC00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADFF003A3AFF009E9EFF000000
      0000000000009E9EFF003A3AFF00AFAFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DAE9FE0082B5FE00408FFE001576FE00026B
      FE00026BFE001576FE00408FFE0082B5FE00DAE9FE0000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E4F4E600A6DCAA0077CA7D0058BD60004AB9
      52004AB9520058BD600077CA7D00A6DCAA00E4F4E60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E4F4E600A6DCAA0077CA7D0058BD60004AB9
      52004AB9520058BD600077CA7D00A6DCAA00E4F4E60000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      0000000000FF000000FFFFFFFFFF00000000000000FF000000FFFFFFFFFF0000
      0000000000FF000000FFFFFFFFFF00000000000000FF000000FFFFFFFFFF0000
      0000000000FF000000FF000000FFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E5F5E60083CE890049B8510048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500049B8510083CE8900E5F5E6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E5F5E60083CE890049B8510048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500049B8510083CE8900E5F5E6000000
      000000000000000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000303059FF3030
      59FF303059FF59CEE7FFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BAE4BD004FBB560048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B850004FBB5700BAE4
      BD00000000000000000000000000000000000000000000000000000000000000
      0000BAE4BD004FBB560048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B850004FBB5700BAE4
      BD0000000000000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF49AD
      C6FF62C6DEFF303059FFFFFFFFFF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A6DC
      AB0048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      5000A6DCAB00000000000000000000000000000000000000000000000000A6DC
      AB0048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      5000A6DCAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF62C6
      DEFF49ADC6FF303059FFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B9E4BD0048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B85000B9E4BD0000000000000000000000000000000000B9E4BD0048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B85000B9E4BD000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF59CE
      E7FF59CEE7FF303059FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5F4E6004FBB560048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500049B8510048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B850004FBB5700E5F5E6000000000000000000E5F4E6004FBB560048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B850004FBB5700E5F5E60000000000000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000303059FF3030
      59FF303059FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083CE890048B8500048B8
      500048B8500048B8500048B8500048B8500064C26B00DDEEDE00E7F1E80079CA
      7F0048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500083CE8900000000000000000083CE890048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500083CE890000000000000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000E4F4E50049B8510048B8500048B8
      500048B8500048B8500048B850005FC06600E4F0E500F7F7F700F7F7F700F1F5
      F10076C97C0048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500049B85100E4F4E500E4F4E50049B8510048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500049B85100E4F4E5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000303059FF3030
      59FF303059FFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      000000000000000000000000000000000000A5DCA90048B8500048B8500048B8
      500048B8500048B850005ABF6100DFEEE000F7F7F700F7F7F700F7F7F700F7F7
      F700EFF4F00072C7780048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B85000A5DCA900A5DCA90048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B85000A5DCA900FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF62C6
      DEFF49ADC6FF303059FFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000076CA7D0048B8500048B8500048B8
      500048B8500056BD5D00DAEDDB00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700EEF4EE006EC6750048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500076CA7C0076CA7D0048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500076CA7C00000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF49AD
      BDFF62C6DEFF303059FFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000058BD600048B8500048B8500048B8
      500052BC5A00D4EAD600F7F7F700F7F7F700F7F7F700B2DEB5008DD19200F6F7
      F600F7F7F700F7F7F700ECF3EC006BC5710048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500058BD600058BD600048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500058BD6000000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF62C6
      D6FF49ADC6FF303059FFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000004AB9510048B8500048B850004AB9
      5200CCE7CE00F7F7F700F7F7F700F7F7F700BAE1BD004AB9520048B8500090D2
      9500F6F7F600F7F7F700F7F7F700EAF2EB0068C36E0048B8500048B8500048B8
      500048B8500048B8500048B850004AB952004AB9510048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B850004AB952000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF419C
      B5FF62C6D6FF303059FFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000004AB9520048B8500048B8500061C1
      6800F7F7F700F7F7F700F7F7F700C2E4C4004BB9530048B8500048B8500048B8
      500096D49A00F7F7F700F7F7F700F7F7F700E8F2E90065C26B0048B8500048B8
      500048B8500048B8500048B850004AB952004AB9520048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B850004AB95200FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF62BD
      CEFF49A5BDFF303059FFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000059BE5F0048B8500048B850004BB9
      5200D0E9D200F7F7F700C6E5C8004EBA550048B8500048B8500048B8500048B8
      500048B850009BD69F00F7F7F700F7F7F700F7F7F700E5F1E60062C1690048B8
      500048B8500048B8500048B8500059BE5F0059BE5F0048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500059BE5F00000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF419C
      B5FF62BDCEFF303059FFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000078CA7D0048B8500048B8500048B8
      50004AB952005EC0650049B8510048B8500048B8500048B8500048B8500048B8
      500048B8500048B85000A0D8A400F7F7F700F7F7F700F7F7F700E3F0E4005FC0
      660048B8500048B8500048B8500078CA7D0078CA7D0048B8500048B8500048B8
      500048B8500048B8500049B8510048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500078CA7D00000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF59B5
      C6FF419CB5FF303059FFFFFFFFFF000000000000000000000000000000000000
      000000000000000000000000000000000000A7DCAA0048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B85000A5D9A900F7F7F700F7F7F700F7F7F700DFEE
      E0004DBA550048B8500048B85000A7DCAA00A7DCAA0048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B85000A7DCAA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF4194
      A5FF59B5C6FF303059FFFFFFFFFF000000000000000000000000000000000000
      000000000000000000000000000000000000E6F5E7004AB8520048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B85000AADBAD00F7F7F700F7F7F700F7F7
      F7005FC0660048B850004AB85200E6F5E700E6F5E7004AB8520048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B850004AB85200E6F5E700FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF59AD
      BDFF4194A5FF303059FFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000086CF8B0048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500049B85100A7DAAA00EBF3EC00B0DE
      B40048B8500048B8500086CF8B00000000000000000086CF8B0048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500086CF8B0000000000000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF418C
      A5FF59ADBDFF303059FFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7F5E80051BB580048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500051BB5800E7F5E8000000000000000000E7F5E80051BB580048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500051BB5800E7F5E80000000000000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF59A5
      B5FF418CA5FF303059FFFFFFFFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BEE5C00048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B85000BEE5C00000000000000000000000000000000000BEE5C00048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B85000BEE5C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000303059FF59CEE7FF59CE
      E7FF59CEE7FF303059FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ACDE
      AF0048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      5000ACDEAF00000000000000000000000000000000000000000000000000ACDE
      AF0048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500048B8500048B8
      5000ACDEAF00000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000303059FF3030
      59FF303059FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFE6C20051BB590048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500051BB5900BFE6
      C200000000000000000000000000000000000000000000000000000000000000
      0000BFE6C20051BB590048B8500048B8500048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B8500048B8500048B8500051BB5900BFE6
      C20000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFF000000FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9F6EA0089D18E004AB8520048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B850004AB8520089D18E00E9F6EA000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E9F6EA0089D18E004AB8520048B8500048B8500048B8500048B8
      500048B8500048B8500048B8500048B850004AB8520089D18E00E9F6EA000000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      0000000000FF000000FFFFFFFFFF00000000000000FF000000FFFFFFFFFF0000
      0000000000FF000000FFFFFFFFFF00000000000000FF000000FFFFFFFFFF0000
      0000000000FF000000FF000000FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E9F6EA00ACDEAF007CCC82005DBF64004EBA
      56004EBA56005EC065007CCC8200ACDEAF00E9F6EA0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E9F6EA00ACDEAF007CCC82005DBF64004EBA
      56004EBA56005EC065007CCC8200ACDEAF00E9F6EA0000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000480000000100010000000000600300000000000000000000
      000000000000000000000000FFFFFF00FE007F000000000000000000F8001F00
      0000000000000000F0000F000000000000000000E00007000000000000000000
      C000030000000000000000008000010000000000000000008000010000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000100
      0000000000000000800001000000000000000000C00003000000000000000000
      E00007000000000000000000F0000F000000000000000000F8001F0000000000
      00000000FE007F000000000000000000FE007FFE007FFFE7FFFE007FF8001FF8
      001FFC003FF8001FF0000FF0000FF8001FF0000FE00007E00007F8001FE00007
      C00003C00003E00007C00003800001800001C00003800001800001800001C000
      03800001000000000000C0000300000000000000000080000100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000010000000000000000008000
      0100000000000000000000000000000000000000000000000000000080000180
      0001800001800001800001800001E00007800001C00003C00003E00007C00003
      E00007E00007E00007E00007F0000FF0000FF0000FF0000FF8001FF8001FFE00
      7FF8001FFE007FFE007FFF18FFFE007F000000000000FE007FFE007F00000000
      0000F8001FF8001F000000000000F0000FF0000F000000000000E00007E00007
      000000000000C00003C000030000000000008000018000010000000000008000
      0180000100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800001800001000000000000800001800001000000000000C00003C00003
      000000000000E00007E00007000000000000F0000FF0000F000000000000F800
      1FF8001F000000000000FE007FFE007F00000000000000000000000000000000
      000000000000}
  end
  object MainSoapConnection: TSoapConnection
    Agent = 
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KH' +
      'TML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.7' +
      '8'
    URL = 'http://localhost/WksXxxSoapProject.dll/soap'
    SOAPServerIID = 'IAppServerSOAP - {C99F4735-D6D2-495C-8CA2-E53E5A439E61}'
    UseSOAPAdapter = True
    OnAfterExecute = MainSoapConnectionAfterExecute
    OnBeforeExecute = MainSoapConnectionBeforeExecute
    Left = 72
    Top = 320
  end
  object ObjectClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ObjectDataSetProvider'
    RemoteServer = MainSoapConnection
    AfterOpen = ObjectClientDataSetAfterOpen
    BeforeInsert = ObjectClientDataSetBeforeInsert
    AfterInsert = ObjectClientDataSetAfterInsert
    BeforePost = ObjectClientDataSetBeforePost
    AfterPost = ObjectClientDataSetAfterPost
    BeforeCancel = ObjectClientDataSetBeforeCancel
    AfterCancel = ObjectClientDataSetAfterCancel
    BeforeDelete = ObjectClientDataSetBeforeDelete
    AfterDelete = ObjectClientDataSetAfterDelete
    BeforeScroll = ObjectClientDataSetBeforeScroll
    AfterScroll = ObjectClientDataSetAfterScroll
    BeforeRefresh = ObjectClientDataSetBeforeRefresh
    AfterRefresh = ObjectClientDataSetAfterRefresh
    OnReconcileError = ObjectClientDataSetReconcileError
    Left = 72
    Top = 376
  end
  object ObjectDataSource: TDataSource
    DataSet = ObjectClientDataSet
    Left = 208
    Top = 376
  end
  object ButtonedImageList: TImageList
    ColorDepth = cd32Bit
    Left = 208
    Top = 208
    Bitmap = {
      494C010104000800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4D6
      AA0071C37F00A1D7AA000000000000000000000000000000000000000000A1D7
      AA0071C37F00A4D6AA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4D6AA0071C3
      7F0034B7590031AF4D00A1D7AA00000000000000000000000000A1D7AA0034AC
      490039B04E0071C37F00A4D6AA00000000000000000000000000000000000000
      0000000000000000000085270A0085270A0085270A0082270B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000071C37F0034B7
      59003EDB8D0027DD81002BB14C00A1D7AA0000000000A1D7AA0034AC49004CC3
      640051C6670039B04E0071C37F00000000000000000000000000000000000000
      0000000000000000000085270A00F9E4B200E49E57007D270C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1D7AA0031AF
      4D0027DD81000FEA850009D96C002AAF49006DC27B0035AD4B004EC86C0053CC
      70004CC3640034AC4900A1D7AA00000000000000000000000000000000000000
      0000000000000000000085270A00F9E4B000E4A15B007D270C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A1D7
      AA002BB14C0009D96C0004DE6E000DD364002FB34F004DCA700057D179004EC8
      6C0034AC4900A1D7AA0000000000000000000000000000000000000000000000
      0000000000000000000085270A00F8E1AE00E5A35E007D270C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A1D7AA0029AF49000CD364000EDB6C003DD170004ED178004ECA700035AD
      4B00A1D7AA000000000000000000000000000000000000000000000000000000
      000000000000C0B4B00085270A008F35130085270A0081270B00C1B6B4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006DC27B002EB34F003DD2710047D173004BCF720042B1580075C1
      8100000000000000000000000000000000000000000000000000000000000000
      00000000000098553F00B76C3E00F9D49E00F6CB8F00A15935009D5F4B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000006F6F
      6FFF6F6F6FFF00000000000000006F6F6FFF6F6F6FFF00000000000000006F6F
      6FFF6F6F6FFF0000000000000000000000000000000000000000000000000000
      0000A1D7AA0037AE4C0050CB73004AD174004BCF72005ECD760061C470004CAB
      5900ABD6B1000000000000000000000000000000000000000000000000000000
      0000B190870091391A00F4C99300FBD9A500F4C48700D196600084321700B8A2
      9B00000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006F6F
      6FFF6F6F6FFF00000000000000006F6F6FFF6F6F6FFF00000000000000006F6F
      6FFF6F6F6FFF000000000000000000000000000000000000000000000000A1D7
      AA0037AD4C005BCB780063D4840050CB730039B1500061C4700070CB7B0067C4
      730050A95A00AED5B2000000000000000000000000000000000000000000C3BD
      BB008C361B00D4945D00F8DBB200F8D19900F1BD7E00E4A765009D5731009042
      2900000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1D7AA0038AD
      4B005EC9750067D282005BCB780037AE4C006FC07B003EA7490066C4710078CB
      7E0077C4790059A85F00A6D6AD0000000000000000000000000000000000A069
      5900A6582F00F4CB9900FBE4BF00F6CA8E00EEB77700E5A66000BC7841008237
      1C00AC857A000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000071C37F0041B3
      55006ACF7E005EC9750037AD4C00A1D7AA0000000000A3D4A90042A64A0076C4
      78008ACF8A004CB3590071C37F00000000000000000000000000B8A29B008931
      1400E5AB6B00F9E4C500FBE2BD00F4C28600EBB16F00E49F5800C97F3F00924C
      280085301500C3BDBB0000000000000000000000FF000000FF00000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4D6AA0071C3
      7F0041B3550038AD4B00A1D7AA00000000000000000000000000A7D3A9004CA5
      50004CB3590071C37F00A4D6AA000000000000000000C7C4C30091432A00C177
      4500F2CA9500FBF2E400F9D9AC00F0BD7D00E8AB6700E1995000D6863C00A65B
      29007B371D00A06654000000000000000000000000000000FF00000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4D6
      AA0071C37F00A1D7AA000000000000000000000000000000000000000000A4D6
      AA0071C37F00A4D6AA00000000000000000000000000A87C6F009A492700EBB1
      6F00F9E9D400FCF8F200F5CB9400EDB67400E5A55F00DD934900D6833600B160
      2500853F1D007C2C1300BBAAA40000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000862B0F0085270A008527
      0A0085270A0085270A0085270A0085270A0085270A0085270A0085270A008427
      0A0081270B007F270B00954C36000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFC10000E3E3FFFFFDCC0000
      C1C1FC3FFCCC0000C081FC3FF44C0000C001FC3FDCC10000E003FC3FFDCC0000
      F007F81FBFCC0000F80FF81FFFC10000F007F00F33FF0000E003E00F33FF0000
      C001E00703FF0000C081C00333FF0000C1C18003B7FF0000E3E3800187FF0000
      FFFF8001CFFF0000FFFFFFFFCFFF000000000000000000000000000000000000
      000000000000}
  end
  object ApplicationEvents: TApplicationEvents
    OnException = ApplicationEventsException
    Left = 72
    Top = 152
  end
  object TimerJvThreadTimer: TJvThreadTimer
    OnTimer = TimerJvThreadTimerTimer
    Left = 208
    Top = 152
  end
  object SysEditContentImageList24: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 375
    Top = 432
    Bitmap = {
      494C010104001100040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000003000000001002000000000000048
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF696969FF696969FF696969FF696969FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF696969FF696969FF696969FF696969FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF696969FF696969FF696969FF696969FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FF696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FF696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FF696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FF696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FF696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FF696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F
      3FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FF696969FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FF696969FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000300000000100010000000000400200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF000000FF
      F03FFFF03FFFF03F000000FFF7FFFFF7FFFFF7FF000000FFF7FFFFF7FFFFF7FF
      000000FFF7FFFFF7FFFFF7FF000000FFF7FFFFF7FFFFF7FF000000FFF7FFFFF7
      FFFFF7FF000000FFF7FFFFF7FFFFF7FF000000FFF7FFFFF7FFFFF7FF000000FF
      F7FFFFF7FFFFF7FF000000FFF7FFFFF7FFFFF7FF000000FFF7FFFFF7FFFFF7FF
      000000FE003FFE003FFE003F000000FE003FFE003FFE003F000000FE003FFE00
      3FFE003F000000FE003FFE003FFE003F000000FE003FFE003FFE003F000000FE
      003FFE003FFE003F000000FE003FFE003FFE003F000000FE003FFE003FFE003F
      000000FE003FFE003FFE003F000000FE003FFE003FFE003F000000FE003FFE00
      3FFE003F000000FFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object SynEditContentPopup: TPopupMenu
    Left = 480
    Top = 432
    object SynEditInsertRegionPopup: TMenuItem
      Action = SynEditContentRegionCollapseAction
    end
    object RegionExpand1: TMenuItem
      Action = SynEditContentRegionExpandAction
    end
    object SynEditRegionInsertPopup: TMenuItem
      Action = SynEditContentRegionInsertAction
    end
    object SynEditHeaderInsertPopup: TMenuItem
      Action = SynEditContentHeaderInsertAction
    end
    object SynEditContentTemplateInsertPopup: TMenuItem
      Action = SynEditContentTemplateInsertAction
      OnClick = SynEditContentTemplateInsertPopupClick
    end
  end
  object SysEditContentAction: TActionList
    Images = SysEditContentImageList24
    Left = 584
    Top = 432
    object SynEditContentHeaderInsertAction: TAction
      Caption = 'Header Insert'
      ImageIndex = 0
      OnExecute = SynEditContentHeaderInsertActionExecute
    end
    object SynEditContentRegionInsertAction: TAction
      Caption = 'Region Insert'
      ImageIndex = 1
      OnExecute = SynEditContentRegionInsertActionExecute
    end
    object SynEditContentRegionCollapseAction: TAction
      Caption = 'Region Collapse'
      ImageIndex = 2
      OnExecute = SynEditContentRegionCollapseActionExecute
    end
    object SynEditContentRegionExpandAction: TAction
      Caption = 'Region Expand'
      ImageIndex = 3
      OnExecute = SynEditContentRegionExpandActionExecute
    end
    object SynEditContentTemplateInsertAction: TAction
      Caption = 'Content Template Insert'
    end
    object SynEditDataJsonTemplateInsertAction: TAction
      Caption = 'Data Json Template Insert'
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'xml'
    Filter = 'All files (*)|*|XML files (*.xml)|*.xml|CDS files (*.cds)|*.cds'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 688
    Top = 152
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xml'
    Filter = 'XML files (*.xml)|*.xml|CDS files (*.cds)|*.cds'
    Left = 792
    Top = 152
  end
  object TextImageList24: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 376
    Top = 264
    Bitmap = {
      494C010116002800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000006000000090000000010020000000000000D8
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000FFFFFFFFFFFFFFFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF00000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000FFFFFFFFFFFFFFFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000FFFFFFFFFFFFFFFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000FFFFFFFFFFFFFFFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF00000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000FFFFFFFFFFFFFFFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000FFFFFFFFFFFFFFFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000FFFFFFFFFFFFFFFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000FFFFFFFFFFFFFFFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000FFFFFFFFFFFFFFFFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FFFF0000
      FFFF000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000000000
      FFFF0000FFFF000000000000FFFF0000FFFF000000000000FFFF0000FFFF0000
      00000000FFFF0000FFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FFFF0000
      FFFF000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000000000
      FFFF0000FFFF000000000000FFFF0000FFFF000000000000FFFF0000FFFF0000
      00000000FFFF0000FFFF00000000000000000000000000000000000000000000
      000000000000000080FF000080FF000080FF000080FF000080FF000080FF0000
      80FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000800000FF800000FF800000FF0000000000000000800000FF8000
      00FF800000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFF0000FFFF000000000000FFFF0000FFFF000000000000
      FFFF0000FFFF000000000000FFFF0000FFFF000000000000FFFF0000FFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080FF000080FF000000000000000000000000000000000000
      80FF000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808080FF800000FF000000000000000000000000000000008000
      00FF808080FF0000000000000000000000000000000000000000000000FF0000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000000000FF000000FF000000FF5330
      53BE312931340000FFFF0000FFFF000000000000FFFF0000FFFF000000000000
      FFFF0000FFFF000000000000FFFF0000FFFF000000000000FFFF0000FFFF3129
      3134533053BE000000FF000000FF000000FF0000000000000000000000000000
      00000000000000000000000080FF000080FF0000000000000000000000000000
      00000000000000000000000000000000000000000000808080FF000000FF8080
      80FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000800000FF800000FF800000FF800000FF800000FF8000
      00FF0000000000000000000000000000000000000000808080FF000000FF8080
      80FF0000000000000000000000000000000000000000000000000000FF000000
      00000000FF00000000000000FF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000003B2F3B3F3B2F3B3F1A181A1B0000
      00FF563256BA0000000000000000000000000000FFFF0000FFFF000000000000
      FFFF0000FFFF000000000000FFFF0000FFFF0000000000000000000000005632
      56BA000000FF1A181A1B18161819000000000000000000000000000000000000
      0000000000000000000000000000000080FF000080FF00000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF800000FF0000000000000000800000FF8080
      80FF0000000000000000000000000000000000000000000000FF000000FF0000
      00FF0000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000000000000000000000000000000000000000000000000000100F
      1011000000FF613F618900000000000000000000FFFF0000FFFF000000000000
      FFFF0000FFFF000000000000FFFF0000FFFF0000000000000000613F61890000
      00FF100F10110000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000080FF000080FF000000000000
      000000000000000000000000000000000000808080FF000000FF000000FF0000
      00FF808080FF0000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF800000FF0000000000000000800000FF8080
      80FF00000000000000000000000000000000808080FF000000FF000000FF0000
      00FF808080FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001A181A1B000000FF523C5260000000010000FFFF0000FFFF000000000000
      FFFF0000FFFF000000000000FFFF0000FFFF0000000000000000000000FF1A18
      1A1B000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000080FF000080FF0000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000FF0000000000000000800000FF0000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A384A54000000FF151415160000FFFF0000FFFF000000000000
      FFFF0000FFFF000000000000FFFF0000FFFF00000000000000FF4A384A540000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080FF00000000000000000000000000000000000080FF0000
      80FF000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF800000FF800000FF808080FF0000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000030283032000000FF392E393D0000FFFF0000FFFF000000000000
      FFFF0000FFFF000000000000FFFF0000FFFF392E393D000000FF302830320000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080FF000080FF000080FF000080FF000080FF000080FF0000
      80FF000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000800000FF800000FF000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000007070708603F6083000000FF0000FFFF0000FFFF000000000000
      FFFF0000FFFF000000000000FFFF0000FFFF000000FF593E596F070707080000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000048374850000000FF1614161700000000000000000000
      FFFF0000FFFF000000000000000016141617000000FF48374850000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      00000000000000000000000000000000000000000000000000000000FF000000
      00000000FF00000000000000FF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF5E3F5E7D00000000000000000000
      FFFF0000FFFF00000000000000005E3F5E7D000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000800000FF800000FF800000FF0000000000000000800000FF8000
      00FF800000FF0000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080FF000080FF000080FF000080FF000080FF000080FF0000
      80FF000000000000000000000000000000000000000000000000000000FF0000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      000000000000000000000000000025202526000000FF16141617000000000000
      FFFF0000FFFF0000000016141617000000FF2520252600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808080FF800000FF000000000000000000000000000000008000
      00FF808080FF0000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080FF000080FF000000000000000000000000000000000000
      80FF000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF5E3F5E7B000000000000
      FFFF0000FFFF000000005E3F5E7B000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000800000FF800000FF800000FF800000FF800000FF8000
      00FF000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000080FF000080FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002A242A2C000000FF211D21220000
      FFFF0000FFFF211D2122000000FF2A242A2C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF800000FF0000000000000000800000FF8080
      80FF000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080FF000080FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000F0F0F10000000FF5B3F5B740606
      0607060606075B3F5B74000000FF0F0F0F100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080FF800000FF0000000000000000800000FF8080
      80FF000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000080FF000080FF000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002823282A000000FF4E3A
      4E594E3A4E59000000FF2823282A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000FF0000000000000000800000FF0000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000080FF000080FF0000
      0000000000000000000000000000000000000000000000000000000000FF0000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000011D1A1D1E0000
      00FF000000FF1D1A1D1E00000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080FF800000FF800000FF808080FF0000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080FF00000000000000000000000000000000000080FF0000
      80FF000000000000000000000000000000000000000000000000000000FF0000
      00000000000000000000000000000000000000000000000000000000FF000000
      00000000FF00000000000000FF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000800000FF800000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080FF000080FF000080FF000080FF000080FF000080FF0000
      80FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF0000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000303
      0304100F1011100F1011100F1011100F1011100F1011100F1011100F1011100F
      1011100F1011100F1011100F1011100F1011100F1011100F1011100F1011100F
      1011050505060000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000040404000404040004040
      4000404040004040400040404000000000000000000040404000404040004040
      4000404040004040400040404000000000000000000040404000404040004040
      4000404040004040400040404000000000000000000000000000000000000000
      00000000000000000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000000000000000000000000000171517183D3D
      3DFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D
      3DFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D
      3DFF3D3D3DFF201C202100000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000040404000404040004040
      4000404040004040400040404000000000000000000040404000404040004040
      4000404040004040400040404000000000000000000040404000404040004040
      400040404000404040004040400000000000000000000000FF000000FF000000
      FF000000FF000000FF00FF000000FF0000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000FF000000FF0000000000000000000000000000003D3D3DFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF3D3D3DFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF00FF000000F20D0300002BE000002BE000002BE000002B
      E000002BE000002BE000002BE000002BE000002BE000000DF5000000FF000000
      000000000000FF000000FF0000000000000000000000000000003D3D3DFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF3D3D3DFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000FF000000D42B0C0051FF840051FF840051FF840051FF
      840051FF840051FF840051FF840051FF840051FF8400002BE0000000FF000000
      000000000000FF000000FF0000000000000000000000000000003D3D3DFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF3D3D3DFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400838383002020200060606000BFBFBF00FFFFFF00FFFFFF008383
      83004C4C4C0030303000B7B7B700FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000FF000000D42B0C0051FF840051FF840051FF840051FF
      840051FF840051FF840051FF840051FF840051FF8400002BE0000000FF000000
      000000000000FF000000FF0000000000000000000000000000003D3D3DFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF3D3D3DFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF0070707000DBDBDB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008B8B8B00C3C3C300FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000FF000000D42B0C0051FF840051FF840051FF840051FF
      840051FF840051FF840051FF840051FF840051FF8400002BE0000000FF000000
      000000000000FF000000FF0000000000000000000000000000003D3D3DFF0000
      FFFF0000FFFF00008DFF3D3D3DFF00008DFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF000098FF3D3D3DFF00008DFF0000
      FFFF0000FFFF3D3D3DFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00CFCFCF007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0054545400FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000FF000000D42B0C0051FF840051FF840051FF840051FF
      840051FF840051FF840051FF840051FF840051FF8400002BE0000000FF000000
      000000000000FF000000FF0000000000000000000000000000003D3D3DFF3D3D
      3DFF3D3D3DFF3D3D3DFFFAFAFAFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D
      3DFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D3DFFF2F2F2FF3D3D3DFF3D3D
      3DFF3D3D3DFF3D3D3DFF15141516000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00303030004040400040404000404040002C2C
      2C0083838300FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000040404000A2A2A20000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000FF000000D42B0C0051FF840051FF840051FF840051FF
      840051FF840051FF840051FF840051FF840051FF8400002BE0000000FF000000
      000000000000FF000000FF0000000000000000000000000000003D3D3DFF0000
      E6FF0000E6FF3D3D3DFFE6E6E6FF3D3D3DFF0000E6FF0000E6FF0000E6FF0000
      E6FF0000E6FF0000E6FF0000E6FF0000E6FF3D3D3DFFE6E6E6FF3D3D3DFF0000
      E6FF0000E6FF3D3D3DFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF008B8B8B00C3C3C300FFFFFF00FFFFFF007070
      7000E3E3E300FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000404040004040400080808000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000FF000000D42B0C0051FF840051FF840051FF840051FF
      840051FF840051FF840051FF840051FF840051FF8400002BE0000000FF000000
      000000000000FF000000FF0000000000000000000000211D21223D3D3DFF3D3D
      3DFF3D3D3DFF5C331CEF824900FF814800FF3D3D3DFF3D3D3DFF3D3D3DFF3D3D
      3DFF3D3D3DFF3D3D3DFF3D3D3DFF3D3D3DFF704000FF3D3D3DFF3D3D3DFF3D3D
      3DFF3D3D3DFF3D3D3DFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00E7E7E70068686800FFFFFF00FBFBFB005858
      5800FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000404040004040400040404000808080000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000FF000000D42B0C0051FF840051FF840051FF840051FF
      840051FF840051FF840051FF840051FF840051FF8400002BE0000000FF000000
      000000000000FF000000FF000000000000000000000000000000040404050000
      000074411BF0FC9200FFFE9300FF6D3D17F200000000000000005F3F5F7FB566
      00FF613F618700000000111011125B323BD8F68F00FF7E4614F4000000000000
      00000F0F0F10633D619D00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF0058585800F7F7F700ABABAB00A3A3
      A300FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000004040400040404000404040004040400040404000404040004040
      4000404040004040400040404000404040008080800000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000FF000000D42B0C0051FF840051FF840051FF840051FF
      840051FF840051FF840051FF840051FF840051FF8400002BE0000000FF000000
      000000000000FF000000FF000000000000001C191C1D3D3D3DFF703F0CF88C4E
      06FBFE9400FFFE9300FF6D3D17F200000000000000000C0C0C0D643821EC6E3F
      0CF8131213140000000000000000231E232463361DEEFC9200FF5F3521EC0000
      0000613D6196D67900FF6F3F12F52A242A2C0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00A7A7A700A7A7A70058585800F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000004040400040404000404040004040400040404000404040004040
      4000404040004040400040404000404040004040400080808000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000FF000000D42B0C0051FF840051FF840051FF840051FF
      840051FF840051FF840051FF840051FF840051FF8400002BE0000000FF000000
      000000000000FF000000FF000000000000003D3D3DFFD17700FFAE6200FFFE94
      00FFFE9300FF6E3D15F30000000000000000000000005A3F5A71B76700FF633E
      6191000000000000000000000000000000000000000079430CF8945300FFCB73
      00FFCB7300FFFF9400FFF68F00FF613859B40000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00D7D7D7007F7F7F00787878003030300068686800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000004040400040404000404040004040400040404000404040004040
      4000404040004040400040404000404040004040400040404000808080000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000FF000000F20D0300D42B0C00D42B0C00D42B0C00D42B
      0C00D42B0C00D42B0C00D42B0C00D42B0C00D42B0C00F20D0300FF000000FF00
      0000FF000000FF000000FF000000000000005E3653BE623858B64736474F7744
      12F5DB7C00FF3D3D3DFF0000000000000000593E596F5E3428E777450AF91D1A
      1D1E0000000000000000000000000000000000000000633749CBFF9400FFFF94
      00FFFF9400FF663A22EB3D3D3DFF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FBFBFB00DFDFDF00DFDFDF00DFDFDF00F3F3F300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000004040400040404000404040004040400040404000404040004040
      4000404040004040400040404000404040004040400080808000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000070707080A0A0A0B6034
      41D3D47800FF3D3D3DFF00000000000000005F341DEEE98700FF48272EE31715
      1718000000000000000000000000000000004334434A70400CF8FF9400FFFF94
      00FFC46F00FF3D3D3DFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000004040400040404000404040004040400040404000404040004040
      40004040400040404000404040004040400080808000F2F2F200000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000000000000000000000000000000000000000000000005B3459B48449
      00FF5D3443D1100F10110000000000000000834900FFE18300FF603755BC0808
      08090000000000000000000000004E3A4E5A3B2108FAE68500FFE98700FF8A4E
      02FD3D3D3DFF0000000100000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000404040004040400040404000808080000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000151415163D3D
      3DFF040404050000000000000000000000005A3234DE5D3549CB100F10110000
      000000000000000000000000000000000000000000003D3D3DFF3D3D3DFF2D26
      2D2F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000404040004040400080808000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000040404050D0D0D0E000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000404040008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000020023009325FF009325FF009325FF0000000500000000000000000002
      0023009325FF009325FF009325FF000000050000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000009325FF009325FF009325FF0009024100000000000000000000
      0000009325FF009325FF009325FF000902410000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000641AD4009325FF009325FF0022087C00000000000000000000
      000000641AD4009325FF009325FF0022087C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000300C93009325FF009325FF004B13B700000000000000000000
      000000300C93009325FF009325FF004B13B70000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000F0352009325FF009325FF008421F300000000000000000000
      0000000F0352009325FF009325FF008421F30000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000009
      024200090242000E0350009325FF009325FF009325FF000E0350000902400009
      0240000E0350009325FF009325FF009325FF000E035000090240000902400009
      0241000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000008023F0093
      25FF009325FF009325FF009325FF009325FF009325FF009325FF009325FF0093
      25FF009325FF009325FF009325FF009325FF009325FF009325FF009325FF0093
      25FF000000040000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000008023F0093
      25FF009325FF009325FF009325FF009325FF009325FF009325FF009325FF0093
      25FF009325FF009325FF009325FF009325FF009325FF009325FF009325FF0093
      25FF000000040000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400838383002020200060606000BFBFBF00FFFFFF00FFFFFF008383
      83004C4C4C0030303000B7B7B700FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400838383002020200060606000BFBFBF00FFFFFF00FFFFFF008383
      83004C4C4C0030303000B7B7B700FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000008023F0078
      1EE700751EE400721EE200701CE0009325FF009325FF008421F2007F1FED007A
      1FE800751EE400701CE0009325FF009325FF008521F2008021EF007C1FEB007A
      1FE8000000040000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF0070707000DBDBDB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008B8B8B00C3C3C300FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF0070707000DBDBDB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008B8B8B00C3C3C300FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000100455009325FF009325FF009125FD000000000000
      00000000000000100455009325FF009325FF009125FD00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00CFCFCF007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0054545400FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00CFCFCF007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0054545400FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000010019009325FF009325FF009325FF000000100000
      00000000000000010019009325FF009325FF009325FF00000010000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00303030004040400040404000404040002C2C
      2C0083838300FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00303030004040400040404000404040002C2C
      2C0083838300FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000009325FF009325FF009325FF000E03510000
      00000000000000000000009325FF009325FF009325FF000E0351000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF008B8B8B00C3C3C300FFFFFF00FFFFFF007070
      7000E3E3E300FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF008B8B8B00C3C3C300FFFFFF00FFFFFF007070
      7000E3E3E300FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000005B16CA009325FF009325FF00290A880000
      00000000000000000000005B16CA009325FF009325FF00290A88000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00E7E7E70068686800FFFFFF00FBFBFB005858
      5800FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00E7E7E70068686800FFFFFF00FBFBFB005858
      5800FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009325FF009325FF009325FF009325FF009325FF009325FF009325FF0093
      25FF009325FF009325FF009325FF009325FF009325FF009325FF009325FF0093
      25FF009325FF0018066800000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF0058585800F7F7F700ABABAB00A3A3
      A300FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF0058585800F7F7F700ABABAB00A3A3
      A300FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009325FF009325FF009325FF009325FF009325FF009325FF009325FF0093
      25FF009325FF009325FF009325FF009325FF009325FF009325FF009325FF0093
      25FF009325FF0018066800000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00A7A7A700A7A7A70058585800F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00A7A7A700A7A7A70058585800F7F7
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009325FF009325FF009325FF009325FF009325FF009325FF009325FF0093
      25FF009325FF009325FF009325FF009325FF009325FF009325FF009325FF0093
      25FF009325FF0018066800000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00D7D7D7007F7F7F00787878003030300068686800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00D7D7D7007F7F7F00787878003030300068686800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F0006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D00F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000711BDF009325FF009325FF000C
      034A00000000000000000000000000711BDF009325FF009325FF000C034A0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FBFBFB00DFDFDF00DFDFDF00DFDFDF00F3F3F300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FBFBFB00DFDFDF00DFDFDF00DFDFDF00F3F3F300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004010A9009325FF009325FF002B
      0B8A000000000000000000000000004010A9009325FF009325FF002B0B8A0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000001D0772009325FF009325FF005B
      16CB000000000000000000000000001D0772009325FF009325FF005B16CB0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000008023C009325FF009325FF0093
      25FF0000000000000000000000000008023C009325FF009325FF009325FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000006009325FF009325FF0093
      25FF0001001B000000000000000000000006009325FF009325FF009325FF0001
      001B000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000006D1CDD007A1FE80081
      21F00012045B000000000000000000000000006D1CDD007A1FE8008121F00012
      045B000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4F4
      F400F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F2F2F2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CFCFCF00404040005C5C5C00000000007777770040404000B6B6B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000086868600A8A8A8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CFCFCF00404040005C5C5C00000000007777770040404000B6B6B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008686860040404000A8A8A8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CFCFCF00404040005C5C5C00000000007777770040404000B6B6B6000000
      00000000000000000000000000000000000000000000C0C0C000404040004040
      40004040400040404000404040004040400040404000E1E1E100000000000000
      0000868686004040400040404000404040004040400040404000393939007979
      7900E7E7E7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CFCFCF00404040005C5C5C00000000007777770040404000B6B6B6000000
      00000000000000000000000000000000000000000000B3B3B300404040004040
      40004040400040404000404040004040400040404000DBDBDB0000000000DADA
      DA00404040004040400040404000404040004040400040404000404040004040
      400040404000C2C2C20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CFCFCF00404040005C5C5C00000000007777770040404000B6B6B6000000
      00000000000000000000000000000000000000000000CECECE005B5B5B005B5B
      5B005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B00E8E8E800000000000000
      0000B0B0B00040404000404040003C3C3C005B5B5B005B5B5B004F4F4F004040
      40004040400040404000EAEAEA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CFCFCF00404040005C5C5C00000000007777770040404000B6B6B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B0B0B00040404000A8A8A800000000000000000000000000DDDD
      DD00404040004040400081818100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CFCFCF00404040005C5C5C00000000007777770040404000B6B6B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B0B0B000AEAEAE000000000000000000000000000000
      0000828282004040400046464600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CFCFCF00404040005C5C5C00000000007777770040404000B6B6B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FDFDFD000000000000000000000000000000
      00008F8F8F004040400041414100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FEFEFE00FEFE
      FE00CECECE00404040005C5C5C00000000007777770040404000B6B6B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F7F7
      F70031313100404040006D6D6D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C8C8C8005B5B5B004040400040404000404040004040
      400040404000404040005C5C5C00000000007777770040404000B6B6B6000000
      00000000000000000000000000000000000000000000E1E1E1009A9A9A009A9A
      9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A
      9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A009A9A9A008E8E8E003131
      31004040400040404000D3D3D300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006D6D6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE008181810040404000404040004040400040404000404040004040
      400040404000404040005C5C5C00000000007777770040404000B6B6B6000000
      00000000000000000000000000000000000000000000B3B3B300404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040009191910000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A1A1A1004040400040404000404040004040400040404000404040004040
      400040404000404040005C5C5C00000000007777770040404000B6B6B6000000
      00000000000000000000000000000000000000000000B3B3B300404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040004040400040404000404040004040400040404000404040003838
      3800B7B7B7000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      000000000000000000000000000000000000000000000000000000000000F8F8
      F800404040004040400040404000404040004040400040404000404040004040
      400040404000404040005C5C5C00000000007777770040404000B6B6B6000000
      00000000000000000000000000000000000000000000F9F9F900EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEA
      EA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00EAEAEA00F6F6F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F0006D6D6D00F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      000000000000000000000000000000000000000000000000000000000000C9C9
      C900404040004040400040404000404040004040400040404000404040004040
      400040404000404040005C5C5C00000000007777770040404000B6B6B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F0006D6D6D00F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      000000000000000000000000000000000000000000000000000000000000AEAE
      AE00404040004040400040404000404040004040400040404000404040004040
      400040404000404040005C5C5C00000000007777770040404000B6B6B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F0006D6D6D00F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      000000000000000000000000000000000000000000000000000000000000C5C5
      C500404040004040400040404000404040004040400040404000404040004040
      400040404000404040005C5C5C00000000007777770040404000B6B6B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F0006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D00F0F0F0006D6D6D00000000000000
      000000000000000000000000000000000000000000000000000000000000F5F5
      F500404040004040400040404000404040004040400040404000404040004040
      400040404000404040005C5C5C00000000007777770040404000B6B6B6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F0006D6D6D00F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000919191004040400040404000404040004040400040404000404040004040
      400040404000404040005C5C5C00000000007777770040404000B6B6B6000000
      00000000000000000000000000000000000000000000B7B7B700404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040007B7B7B0000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F0006D6D6D00F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC006B6B6B0040404000404040004040400040404000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000EFEFEF0000000000000000000000000000000000B3B3B300404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000404040007575750000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F0006D6D6D00F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE00B4B4B400464646004040400040404000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000ECECEC0000000000000000000000000000000000D8D8D8007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A
      7A007A7A7A00B7B7B70000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D00F0F0F000F0F0F000F0F0F000F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F0006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006468B7002027AE00575BB400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FE00FE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005F63
      B5001A32CD003B6FFC004C6DD7006065B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FE00FE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005F63B5001A32
      CD003B6FFC007EADFC00D6EEFC00303CB5000000000000000000000000000000
      00000000000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FE00FE000000000000FE000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005F63B5001A32CD003B6F
      FC007EADFC00E1F2FC005979DD004B4FB1000000000000000000000000000000
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FE000000FE0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F63B5001A32CD003B6FFC007EAD
      FC00E1F2FC005B7FE1004548AF000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FE000000FE
      000000FE000000FE000000FE000000FE000000FE000000FE000000FE00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005F63B5001A32CD003B6FFC007EADFC00E1F2
      FC005F84E4004145AE00C3C3C70000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FE000000FE
      000000FE000000FE000000FE000000FE000000FE000000FE000000FE000000FE
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005F63B5001A32CD003B6FFC007EADFC00E1F2FC006288
      E7003E40AD00C3C3C700000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FE000000FE
      000000FE000000FE000000FE000000FE000000FE000000FE000000FE00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000676AB7001A32CD003B6FFC007EADFC00E1F2FC00658DEA003A3D
      AC00C1C1C6000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FE000000FE0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      000000000000959595005B5757004C4747004E4A4A005654540087878700BDBD
      BD008B898900191521002F54BC007EADFC00E1F2FC006893ED00383BAB00BDBD
      C500000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006265B6003238
      B000A4A5C0000000000000000000000000000000000000000000000000000000
      00000000000000000000FE00FE000000000000FE000000000000000000000000
      00000000000000000000000000000000000000000000000000006265B6003238
      B000A4A5C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000008E8C
      8C00332C2C00442D2D005D3636006C3D3D006C3D3D0062383800573E3E00332E
      2E00211A1A00765555002E2B3500A1BED1006995EF00383BAB00B8B8C5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005C60B5002038CE00749F
      F7003C43B1000000000000000000000000000000000000000000000000000000
      00000000000000000000FE00FE00000000000000000000000000000000000000
      000000000000000000000000000000000000000000005C60B5002038CE00749F
      F7003C43B1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000000000000068646400402E
      2E00754A4A00A9848400CAA7A700D4ACAC00CFA2A200B4868600956666006F42
      4200482F2F00352F2F00D4D3D3001F1F28003B3FAA00B4B4C300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005C60B5002038CE007AA8FC00B0CA
      F300363AAE000000000000000000000000000000000000000000000000000000
      00000000000000000000FE00FE00000000000000000000000000000000000000
      0000000000000000000000000000000000005C60B5002038CE007AA8FC00B0CA
      F300363AAE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF0000000000000000000000000000007D7A7A00433030008D65
      6500DDC4C400E4CBCB00E1C4C400DBBBBB00D5ADAD00CE9F9F00CC9B9B00B88A
      8A00774C4C00533E3E00464343005F5E5E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005B5FB5002038CE007AA8FC00B0CCF300343A
      AE00BDBDC5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005B5FB5002038CE007AA8FC00B0CCF300343A
      AE00BDBDC5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BBBBBB00322A2A00815A5A00E3D0
      D000ECDCDC00ECDCDC00E7D2D200E1C6C600DAB7B700D1A8A800CC9B9B00CC9B
      9B00B98C8C0070464600211C1C00B7B7B7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005B5FB5002038CE007AA8FC00B2CFF5003237AE00BBBB
      C500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005B5FB5002038CE007AA8FC00B2CFF5003237AE00BBBB
      C500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006867670057383800C4AAAA00EEE0
      E000F5ECEC00F4EBEB00EDDEDE00E5CECE00DDBEBE00D4ACAC00CC9B9B00CC9B
      9B00CC9B9B00996D6D0057404000838383000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6B6B600858585007C7C7C00A6A6
      A600000000006A697E001B2686007AA8FC00B3D0F5003237AE00B8B8C5000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6B6B600858585007C7C7C00A6A6
      A600000000006A697E001B2686007AA8FC00B3D0F5003237AE00B8B8C5000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003B3737007C555500E7D2D200F0E4
      E400F8F5F500F7F3F300EFE2E200E6D0D000DEBFBF00D4ACAC00CC9C9C00CC9B
      9B00CC9B9B00B88A8A0068444400514E4E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C1C1C10055515100372B2B005C3C3C00684444004630
      30002C26260031242400423B4500798EB5003035AD00B6B6C300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C1C1C10055515100372B2B005C3C3C00684444004630
      30002C26260031242400423B4500798EB5003035AD00B6B6C300000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000038323200936F6F00E4CECE00ECDC
      DC00F2E6E600F1E5E500EBDADA00E4CCCC00DCBCBC00D3AAAA00CC9B9B00CC9B
      9B00CC9B9B00CA9A9A00724D4D00403D3D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000403B3B006A4C4C00C0A5A500DAB7B700D1A7A700CA99
      99009A717100251B1B009A98980023214300B4B4C30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000403B3B006A4C4C00C0A5A500DAB7B700D1A7A700CA99
      99009A717100251B1B009A98980023214300B4B4C30000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003A31310095717100E0C4C400E5D0
      D000E9D6D600E9D5D500E5CECE00DFC2C200D8B4B400D1A5A500CD9D9D00DFC2
      C200E4CCCC00D3ACAC0074505000413D3D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007A7878005B444400DBC8C800EBD9D900E4CCCC00DAB7B700CE9F
      9F00CC9B9B00A0777700221A1A00B6B6BA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007A7878005B444400DBC8C800EBD9D900E4CCCC00DAB7B700CE9F
      9F00CC9B9B00A0777700221A1A00B6B6BA000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003933330087626200DAB7B700DEC0
      C000E1C4C400E1C4C400DEBFBF00D9B6B600D3AAAA00CC9C9C00D5AEAE00EDDD
      DD00F5ECEC00C99F9F0068494900555252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000039343400A68C8C00F2E8E800F7F2F200EBDADA00DEBFBF00D1A5
      A500CC9B9B00CC9B9B00533C3C00959393000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000039343400A68C8C00F2E8E800F7F2F200EBDADA00DEBFBF00D1A5
      A500CC9B9B00CC9B9B00533C3C00959393000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000504C4C00674A4A00C59E9E00D6B0
      B000D8B4B400D8B3B300D5AEAE00D1A8A800CD9D9D00D1A6A600E6D0D000EFE2
      E200EBDADA00A67D7D004D3B3B00909090000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000038303000BFA7A700EFE2E200F3E8E800E9D5D500DDBEBE00D0A4
      A400CC9B9B00CC9B9B007E5C5C00646060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000038303000BFA7A700EFE2E200F3E8E800E9D5D500DDBEBE00D0A4
      A400CC9B9B00CC9B9B007E5C5C00646060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF0000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A2A2A2004035350097707000CE9F
      9F00D0A2A200D0A2A200CE9F9F00CE9F9F00E0C2C200E7D2D200EDDDDD00F2E6
      E600D1AAAA007E5D5D0035303000C1C1C1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003B333300B2979700E4CCCC00E5CFCF00E0C4C400D6B1B100CC9B
      9B00E5D0D000EFE2E2007B5A5A00676565000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003B333300B2979700E4CCCC00E5CFCF00E0C4C400D6B1B100CC9B
      9B00E5D0D000EFE2E2007B5A5A00676565000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF0000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4949005F454500A57C
      7C00CC9B9B00CC9B9B00CC9B9B00CFA2A200EBD9D900EEE0E000EEE0E000D3AC
      AC00906C6C004A3A3A007F7E7E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000494444008E6D6D00D7B3B300D8B5B500D5ADAD00D0A4A400D9B7
      B700EFE1E100DBBFBF00503E3E00969696000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000494444008E6D6D00D7B3B300D8B5B500D5ADAD00D0A4A400D9B7
      B700EFE1E100DBBFBF00503E3E00969696000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C1C1C100373434005F49
      490098737300C2959500CC9B9B00CD9E9E00E3CACA00D9B6B600B88F8F008867
      67004D3F3F005856560000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009D9D9D0043373700AE858500CC9B9B00CC9B9B00DEBFBF00ECDC
      DC00E4CCCC008664640036323200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009D9D9D0043373700AE858500CC9B9B00CC9B9B00DEBFBF00ECDC
      DC00E4CCCC008664640036323200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF004A49
      4900433939006D5353008C6B6B00987474009673730082636300624C4C003A34
      34006C6A6A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000706F6F0046393900936F6F00B38A8A00D0AAAA00B494
      94007A5D5D00332E2E00ADADAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000706F6F0046393900936F6F00B38A8A00D0AAAA00B494
      94007A5D5D00332E2E00ADADAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A0A0A0004A46460038343400373232002F2A2A00393636005F5C5C00B4B4
      B400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000949393003E3A3A003A3434003B3333003C36
      36004E4D4D00B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000949393003E3A3A003A3434003B3333003C36
      36004E4D4D00B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000900000000100010000000000C00600000000000000000000
      000000000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00
      0000000000000000FFFFFF000000000000000000C7FFFF000000000000000000
      F70007000000000000000000E70007000000000000000000F700070000000000
      00000000C7FFFF000000000000000000FFFFFF000000000000000000FFFFFF00
      0000000000000000C7FFFF000000000000000000DF0007000000000000000000
      C70007000000000000000000F70007000000000000000000C7FFFF0000000000
      00000000FFFFFF000000000000000000FFFFFF000000000000000000C7FFFF00
      0000000000000000EF0007000000000000000000EF0007000000000000000000
      EF0007000000000000000000CFFFFF000000000000000000FFFFFF0000000000
      00000000FFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFC92493FFFFFFFFFFFFFFFFFFC92493F80FFFF8C7FFFFFFFF
      F9249FF9EFDFF9E7DFC10007012480FCFF8FFC0F8FD500070724E1FE7F8FFCCF
      8FC10007E324C7FF3F07FCCF07FFFFFFF024CFFF9F07FEDF07FFFFFFF8249FFB
      CFDFFE1FDFFFFFFFF8241FF80FDFFF3FDFFFFFFFF8241FFFFFDFFFFFDFC10007
      FC663FFFFFDFFFFFDFD50007FE667FF8C7DFF80FDFC10007FE247FF9E7DFF9EF
      DFFFFFFFFF24FFFC0FDFFCFFDFFFFFFFFF00FFFCCFDFFE7FDFFFFFFFFF00FFFC
      CFDFFF3FDFFFFFFFFF81FFFEDFDFFF9FDFC10007FF81FFFE1FDFFBCFDFD50007
      FFFFFFFF3FFFF80FFFC10007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE000FFFFFFFFFFFFFFFFFFFFE000FF
      FFFFFC0001FFFFFFC46000FFFFFFFC0001FFFFFFD76000FFFFFFFCFFF9E00007
      D66000818181FCFFF9C00003D76000818181800019C00003C46000FFFFFF8000
      19C00003FFE000FFFFFF9C0019C00003FFE000FFFFFF9C0019C00003FFE000FF
      FFFF9C0019C00003C46000FFF7FF9C0019C00001D5E000FFF3FF9C0019C00003
      D46000FFF1FF9C0019800003D76000FFF0FF9C0019D0C433C46000F8007F9C00
      19018610FFE000F8003F9C0019038F80FFE000F8001F9C0001030F81FFE000F8
      003F9C0001830F03C46000F8003F9FFF9FC30E03D6E000FFF0FF9FFF9FC71F8F
      D6E000FFF1FF9FFF9FFF3FFFD6E000FFF3FF80001FFFFFFFC4E000FFF7FF8000
      1FFFFFFFFFE000FFFFFFFFFFFFFFFFFFFFFFFF000000FFE000FFE000FFF03F00
      0000FFE000FFE000FFF7FF000000FFE000FC6000FFF7FF000000FFE000FF6000
      FFF7FF000000FFE000FE6000FFF7FF000000FFE000FF6000FFF7FF000000FFE0
      00FC6000FFF7FF000000FFE000FFE000FFF7FF000000FFE000FFE000FFF7FF00
      0000FFE000FFE000FFF7FF000000FFE000FC6000FFF7FF000000FFE000FDE000
      FE003F000000FFE000FC6000FE003F000000FFE000FF6000FE003F000000FFE0
      00FC6000FE003F000000FFE000FFE000FE003F000000FFE000FFE000FE003F00
      0000FFE000FFE000FE003F000000FFE000FC6000FE003F000000FFE000FEE000
      FE003F000000FFE000FEE000FE003F000000FFE000FEE000FE003F000000FFE0
      00FCE000FFFFFF000000FFE000FFE000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFFFFF03FFFF03FFFF11FFFFCFFFFF7FFFFF7FFFFF11FFFF8FFFFF7FFFFF7FF
      FFF11F803007FFF7FFFFF7FFFFF11F802003FFF7FFFFF7FFFFF11F803001FFF7
      FFFFF7FFFFF11FFFF8E1FFF7FFFFF7FFFFF11FFFFCF1FFF7FFFFF7FFFFF11FFF
      FEF1FFF7FFFFF7FFFF811FFFFFE1FFF7FFFFF7FFFC011F800001FFF7FFFFF7FF
      F0011F800003FE003FFE003FF0011F800007FE003FFE003FE0011F80001FFE00
      3FFE003FE0011FFFFFFFFE003FFE003FE0011FFFFFFFFE003FFE003FE0011FFF
      FFFFFE003FFE003FE0011FFFFFFFFE003FFE003FF0011F800003FE003FFE003F
      F00007800003FE003FFE003FF80007800003FE003FFE003FFFFFFFFFFFFFFE00
      3FFE003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FDFFFFFCFFFFFFFFFFFFFFE0F9
      FFFFFC7FFFFFFF03FFFFC0F1FFFFFC3FFFFFFF01FFFF80E007FF801FFFFFEF39
      FFFF01C007FF800FFFFFE739FFFE018007FF8007FFFEA301FFFC03C007FF800F
      FFFBE703FFF807E007FF801FFFFFEF39F8000FF1FFC7FC3FC7F7FF39E0001FF9
      FF87FC7F87FFFF01C0003FFDFF07FCFF07F7FF038000FFFFFE07FFFE07FFFFFF
      0000FFFFFC0FFFFC0FFFFFFF0000FFFF081FFF081F9F9FFF0000FFFC003FFC00
      3F9F9FFF0000FFFC007FFC007FC03FFF0000FFF800FFF800FFC03FFF0000FFF8
      00FFF800FFCF3FFF0000FFF800FFF800FFE67FFF0000FFF800FFF800FFE67FFF
      8001FFF800FFF800FFF0FFFF8003FFF801FFF801FFF0FFFFC007FFFC01FFFC01
      FFF9FFFFF00FFFFE03FFFE03FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object TextAction: TActionList
    Images = TextImageList24
    Left = 584
    Top = 264
    object TextFoldingAction: TAction
      AutoCheck = True
      Caption = 'Folding'
      Checked = True
      ImageIndex = 6
      OnExecute = TextFoldingActionExecute
    end
    object TextFoldAction: TAction
      Caption = 'Fold'
      ImageIndex = 7
      OnExecute = TextFoldActionExecute
    end
    object TextSpecialCharsAction: TAction
      AutoCheck = True
      Caption = 'Specials'
      Hint = 'Show or hide special chars'
      ImageIndex = 4
      OnExecute = TextSpecialCharsActionExecute
    end
    object TextWordWrapAction: TAction
      AutoCheck = True
      Caption = 'Wrap'
      Hint = 'Word wrap or unwrap'
      ImageIndex = 5
      OnExecute = TextWordWrapActionExecute
    end
    object TextCommentAction: TAction
      Caption = 'Comm'
      Hint = 'Comment the current line'
      ImageIndex = 9
      OnExecute = TextCommentActionExecute
    end
    object TextGutterAction: TAction
      AutoCheck = True
      Caption = 'Gutter'
      Checked = True
      Hint = 'Show or hide the gutter'
      ImageIndex = 10
      OnExecute = TextGutterActionExecute
    end
    object TextNumbersAction: TAction
      AutoCheck = True
      Caption = 'Line No'
      Hint = 'Show or hide the lines numbers'
      ImageIndex = 11
      OnExecute = TextNumbersActionExecute
    end
    object TextZeroStartAction: TAction
      AutoCheck = True
      Caption = '0 start'
      Hint = 'Show or hide the lines numbers with leading zero'
      ImageIndex = 12
      OnExecute = TextZeroStartActionExecute
    end
    object TextTabToSpacesAction: TAction
      Caption = 'To spaces'
      Hint = 'Replace tabs with spaces'
      ImageIndex = 13
      OnExecute = TextTabToSpacesActionExecute
    end
    object TextCompareAction: TAction
      Caption = 'Compare'
      Hint = 'Compare current content with an external file'
      ImageIndex = 14
      OnExecute = TextCompareActionExecute
    end
    object TextStatsAction: TAction
      Caption = 'Statistics'
      Hint = 'Show text statistics'
      ImageIndex = 16
      OnExecute = TextStatsActionExecute
    end
    object TextSortAscAction: TAction
      Caption = 'Sort asc'
      Hint = 'Order selected lines in ascending order'
      ImageIndex = 17
      OnExecute = TextSortAscActionExecute
    end
    object TextSortDescAction: TAction
      Caption = 'Sort desc'
      Hint = 'Order selected lines in descending order'
      ImageIndex = 18
      OnExecute = TextSortDescActionExecute
    end
    object TextLinePrefixAction: TAction
      Caption = 'Prefix'
      Hint = 'Prefix selected lines with the given string'
      ImageIndex = 19
      OnExecute = TextLinePrefixActionExecute
    end
    object TextLineNumbersAction: TAction
      Caption = 'Numbers'
      Hint = 'Prefix selected lines with ascendin numbers'
      ImageIndex = 20
      OnExecute = TextLineNumbersActionExecute
    end
    object TextTrimRightAction: TAction
      Caption = 'Trim Right'
      Hint = 'Remove white chars to the end of all rows'
      ImageIndex = 21
      OnExecute = TextTrimRightActionExecute
    end
  end
  object TextUtilsPopup: TPopupMenu
    Images = TextImageList24
    Left = 480
    Top = 264
    object TextUtilsLineBeginWithPopup: TMenuItem
      Action = TextLinePrefixAction
    end
    object TextUtilsLineNumbersPopup: TMenuItem
      Action = TextLineNumbersAction
    end
  end
  object UtilsImageList: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 375
    Top = 376
    Bitmap = {
      494C010101001100040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003FD1FFFF3ECFFFFF3DCE
      FEFF3ACCFFFF3ACCFFFF39CBFFFF33CBFEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000043D4FEFF43D3FFFF40D2FFFF3FD1FFFF3ECF
      FFFF3DCEFEFF3ACCFFFF3ACCFFFF39CBFFFF37C9FFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000047D6FFFF44D5FFFF43D4FEFF43D3FFFF40D2FFFF3FD1
      FFFF3ECFFFFF3DCEFEFFFFFFFFFFFFFFFFFF39CBFFFF37C9FFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000048D7FFFF47D6FFFF44D5FFFF43D4FEFF43D3FFFF40D2
      FFFF3FD1FFFF3ECFFFFFFFFFFFFFFFFFFFFF3ACCFFFF38CAFEFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000049D9FFFF48D7FFFF47D6FFFF44D5FFFF43D4FEFF43D3
      FFFF40D2FFFF3FD1FFFF3ECFFFFF3DCEFEFF3ACCFFFF3ACCFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004ADAFFFF49D9FFFF48D7FFFF47D6FFFF44D5FFFF44D5
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A06D38FF9E6E
      36FF9D6D37FF000000004ADAFFFF4ADBFEFF49D9FFFF48D7FFFF49D6FFFF44D5
      FFFF43D4FEFF43D3FFFF3FD1FFFF3FD1FFFF40CEFFFF3DCFFDFF39CDFFFF39CC
      FFFF38CAFEFF5FD4F7FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A27137FFA17036FFA16F
      37FF9E6E36FF000000004DDCFFFF4ADAFFFF4ADAFFFF48D8FEFF48D7FFFF47D6
      FFFF44D5FFFF43D4FEFF43D3FFFF3FD1FFFF3FD1FFFF3ECFFFFF3BCEFEFF3ACC
      FFFF39CBFFFF38CAFEFF37C9FFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A57236FFA27137FFA170
      36FFA06E36FF000000004EDDFFFF4DDCFFFF4ADAFFFF4ADAFFFF48D8FEFF48D7
      FFFF47D6FFFF44D5FFFF43D4FEFF42D2FFFF3FD1FFFF3FD1FFFF3ECFFFFF3BCE
      FEFF3ACCFFFF39CBFFFF38CAFEFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A87436FFA57335FFA57236FFA271
      37FFA17036FF0000000046E0FBFF4EDDFFFF4DDCFFFF4ADAFFFF4ADAFFFF47D7
      FDFF48D7FFFF47D6FFFF44D5FFFF43D4FEFF43D3FFFF3FD1FFFF3FD1FFFF3ECF
      FFFF3BCEFEFF3ACCFFFF39CBFFFF38CAFEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A97536FFA87436FFA57335FFA572
      36FFA27137FFA17036FF000000004FDFFFFF4EDDFFFF4DDCFFFF4ADAFFFF4ADA
      FFFF48D8FEFF48D7FFFF47D6FFFF44D5FFFF43D4FEFF40D2FFFF3FD1FFFF3FD1
      FFFF3CCFFFFF3BCEFEFF3ACCFFFF39CBFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AB7536FFAB7536FFA87436FFA874
      36FFA57236FFA27137FF0000000000000000000000004EDDFFFF4DDCFFFF4ADA
      FFFF4ADAFFFF48D8FEFF48D7FFFF47D6FFFF44D5FFFF43D4FEFF40D2FFFF3FD1
      FFFF3FD1FFFF3CCFFFFF3BCEFEFF3ACCFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD7637FFAB7536FFAB7536FFA874
      36FFA77335FFA57236FFA27137FFA17036FFA16F37FF9E6E36FF9D6F36FF9C6E
      35FF9B6C36FF9A6B35FF976A35FF00000000000000000000000043D4FEFF40D2
      FFFF3FD1FFFF3FD1FFFF3CCFFFFF3BCEFEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AE7736FFAC7637FFAB7536FFAB75
      36FFA87436FFA87436FFA57236FFA27137FFA17036FFA06E36FF9E6E36FF9D6F
      36FF9C6E35FF9B6C36FF9A6B35FF976A35FF966934FF0000000044D5FFFF43D3
      FFFF40D2FFFF3FD1FFFF3FD1FFFF3BD0FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AF7837FFAE7736FFAD7637FFAB75
      36FFAB7536FFA87436FFA87436FFA57236FFA47135FFA17036FFA06E36FF9E6E
      36FF9E6E36FF9C6E35FF9B6C36FF9A6B35FF976A35FF956938FF0000000044D5
      FFFF43D3FFFF40D2FFFF3FD1FFFF3FD1FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AF7837FFAE7736FFAD76
      37FFAB7536FFAB7536FFA87436FFA87436FFA57236FFA47135FFA17036FFA16F
      37FF9E6E36FF9E6E36FF9C6E35FF9B6C36FF9A6B35FF976A35FF0000000045D6
      FFFF44D5FFFF43D3FFFF40D2FFFF45D0FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B27938FFAF7837FFAE77
      36FFAC7637FFAB7536FFAB7536FFA87436FFA87436FFA57236FFA27137FFA170
      36FFA06E36FF9E6E36FF9E6E36FF9C6E35FF9B6C36FF9A6B35FF0000000048D7
      FFFF45D6FFFF44D5FFFF43D3FFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B59269FFAF78
      37FFAE7736FFAD7637FFAB7536FFAB7536FFA87436FFA87436FFA57236FFA471
      35FFA17036FFA16F37FF9E6E36FF9E6E36FF9C6E35FF9B6C36FF0000000048D8
      FEFF46D7FFFF45D6FFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A47135FFA17036FFA16E39FF9E6E36FF9E6E36FF9C6E35FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AE7736FFAC7637FFAB7536FFAB7536FFA87436FFA874
      36FFA57236FFA27137FFA17036FFA06E36FF9E6E36FF9D6D37FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AF7837FFAE7736FFFFFFFFFFFFFFFFFFAB7536FFA874
      36FFA87436FFA57236FFA47135FFA17036FFA16F37FF9E6E36FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B27938FFAF7837FFFFFFFFFFFFFFFFFFAB7536FFAB75
      36FFA87436FFA87436FFA57236FFA47135FFA17036FFA16F37FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B27938FFAF7837FFAE7736FFAC7637FFAB75
      36FFAC7637FFA87436FFA87436FFA57236FFA27137FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B27938FFAF7837FFAE7736FFAD76
      37FFAB7536FFAB7536FFA87436FFA57A45FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object UtilsActionList: TActionList
    Images = UtilsImageList
    Left = 584
    Top = 376
    object UtilsPythonExecAction: TAction
      Caption = 'Py Exec'
      ImageIndex = 0
      OnExecute = UtilsPythonExecActionExecute
    end
  end
  object ObjectContentSynEditTimer: TTimer
    Enabled = False
    OnTimer = ObjectContentSynEditTimerTimer
    Left = 208
    Top = 320
  end
  object SearchImageList: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 375
    Top = 320
    Bitmap = {
      494C010104001100040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000003000000001002000000000000048
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006468B7002027AE00575BB400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FE00FE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005F63
      B5001A32CD003B6FFC004C6DD7006065B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FE00FE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005F63B5001A32
      CD003B6FFC007EADFC00D6EEFC00303CB5000000000000000000000000000000
      00000000000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FE00FE000000000000FE000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005F63B5001A32CD003B6F
      FC007EADFC00E1F2FC005979DD004B4FB1000000000000000000000000000000
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FE000000FE0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F63B5001A32CD003B6FFC007EAD
      FC00E1F2FC005B7FE1004548AF000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FE000000FE
      000000FE000000FE000000FE000000FE000000FE000000FE000000FE00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005F63B5001A32CD003B6FFC007EADFC00E1F2
      FC005F84E4004145AE00C3C3C70000000000000000000000000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FE000000FE
      000000FE000000FE000000FE000000FE000000FE000000FE000000FE000000FE
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005F63B5001A32CD003B6FFC007EADFC00E1F2FC006288
      E7003E40AD00C3C3C700000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FE000000FE
      000000FE000000FE000000FE000000FE000000FE000000FE000000FE00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000676AB7001A32CD003B6FFC007EADFC00E1F2FC00658DEA003A3D
      AC00C1C1C6000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FE000000FE0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000000000
      000000000000959595005B5757004C4747004E4A4A005654540087878700BDBD
      BD008B898900191521002F54BC007EADFC00E1F2FC006893ED00383BAB00BDBD
      C500000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006265B6003238
      B000A4A5C0000000000000000000000000000000000000000000000000000000
      00000000000000000000FE00FE000000000000FE000000000000000000000000
      00000000000000000000000000000000000000000000000000006265B6003238
      B000A4A5C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000000000000000
      000000000000FF000000FF000000000000000000000000000000000000008E8C
      8C00332C2C00442D2D005D3636006C3D3D006C3D3D0062383800573E3E00332E
      2E00211A1A00765555002E2B3500A1BED1006995EF00383BAB00B8B8C5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005C60B5002038CE00749F
      F7003C43B1000000000000000000000000000000000000000000000000000000
      00000000000000000000FE00FE00000000000000000000000000000000000000
      000000000000000000000000000000000000000000005C60B5002038CE00749F
      F7003C43B1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000000000000068646400402E
      2E00754A4A00A9848400CAA7A700D4ACAC00CFA2A200B4868600956666006F42
      4200482F2F00352F2F00D4D3D3001F1F28003B3FAA00B4B4C300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005C60B5002038CE007AA8FC00B0CA
      F300363AAE000000000000000000000000000000000000000000000000000000
      00000000000000000000FE00FE00000000000000000000000000000000000000
      0000000000000000000000000000000000005C60B5002038CE007AA8FC00B0CA
      F300363AAE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF000000FF0000000000000000000000000000007D7A7A00433030008D65
      6500DDC4C400E4CBCB00E1C4C400DBBBBB00D5ADAD00CE9F9F00CC9B9B00B88A
      8A00774C4C00533E3E00464343005F5E5E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005B5FB5002038CE007AA8FC00B0CCF300343A
      AE00BDBDC5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005B5FB5002038CE007AA8FC00B0CCF300343A
      AE00BDBDC5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BBBBBB00322A2A00815A5A00E3D0
      D000ECDCDC00ECDCDC00E7D2D200E1C6C600DAB7B700D1A8A800CC9B9B00CC9B
      9B00B98C8C0070464600211C1C00B7B7B7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005B5FB5002038CE007AA8FC00B2CFF5003237AE00BBBB
      C500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005B5FB5002038CE007AA8FC00B2CFF5003237AE00BBBB
      C500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006867670057383800C4AAAA00EEE0
      E000F5ECEC00F4EBEB00EDDEDE00E5CECE00DDBEBE00D4ACAC00CC9B9B00CC9B
      9B00CC9B9B00996D6D0057404000838383000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6B6B600858585007C7C7C00A6A6
      A600000000006A697E001B2686007AA8FC00B3D0F5003237AE00B8B8C5000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6B6B600858585007C7C7C00A6A6
      A600000000006A697E001B2686007AA8FC00B3D0F5003237AE00B8B8C5000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003B3737007C555500E7D2D200F0E4
      E400F8F5F500F7F3F300EFE2E200E6D0D000DEBFBF00D4ACAC00CC9C9C00CC9B
      9B00CC9B9B00B88A8A0068444400514E4E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C1C1C10055515100372B2B005C3C3C00684444004630
      30002C26260031242400423B4500798EB5003035AD00B6B6C300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C1C1C10055515100372B2B005C3C3C00684444004630
      30002C26260031242400423B4500798EB5003035AD00B6B6C300000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000038323200936F6F00E4CECE00ECDC
      DC00F2E6E600F1E5E500EBDADA00E4CCCC00DCBCBC00D3AAAA00CC9B9B00CC9B
      9B00CC9B9B00CA9A9A00724D4D00403D3D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000403B3B006A4C4C00C0A5A500DAB7B700D1A7A700CA99
      99009A717100251B1B009A98980023214300B4B4C30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000403B3B006A4C4C00C0A5A500DAB7B700D1A7A700CA99
      99009A717100251B1B009A98980023214300B4B4C30000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003A31310095717100E0C4C400E5D0
      D000E9D6D600E9D5D500E5CECE00DFC2C200D8B4B400D1A5A500CD9D9D00DFC2
      C200E4CCCC00D3ACAC0074505000413D3D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007A7878005B444400DBC8C800EBD9D900E4CCCC00DAB7B700CE9F
      9F00CC9B9B00A0777700221A1A00B6B6BA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007A7878005B444400DBC8C800EBD9D900E4CCCC00DAB7B700CE9F
      9F00CC9B9B00A0777700221A1A00B6B6BA000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003933330087626200DAB7B700DEC0
      C000E1C4C400E1C4C400DEBFBF00D9B6B600D3AAAA00CC9C9C00D5AEAE00EDDD
      DD00F5ECEC00C99F9F0068494900555252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000039343400A68C8C00F2E8E800F7F2F200EBDADA00DEBFBF00D1A5
      A500CC9B9B00CC9B9B00533C3C00959393000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000039343400A68C8C00F2E8E800F7F2F200EBDADA00DEBFBF00D1A5
      A500CC9B9B00CC9B9B00533C3C00959393000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000504C4C00674A4A00C59E9E00D6B0
      B000D8B4B400D8B3B300D5AEAE00D1A8A800CD9D9D00D1A6A600E6D0D000EFE2
      E200EBDADA00A67D7D004D3B3B00909090000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000038303000BFA7A700EFE2E200F3E8E800E9D5D500DDBEBE00D0A4
      A400CC9B9B00CC9B9B007E5C5C00646060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000038303000BFA7A700EFE2E200F3E8E800E9D5D500DDBEBE00D0A4
      A400CC9B9B00CC9B9B007E5C5C00646060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF0000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A2A2A2004035350097707000CE9F
      9F00D0A2A200D0A2A200CE9F9F00CE9F9F00E0C2C200E7D2D200EDDDDD00F2E6
      E600D1AAAA007E5D5D0035303000C1C1C1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003B333300B2979700E4CCCC00E5CFCF00E0C4C400D6B1B100CC9B
      9B00E5D0D000EFE2E2007B5A5A00676565000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003B333300B2979700E4CCCC00E5CFCF00E0C4C400D6B1B100CC9B
      9B00E5D0D000EFE2E2007B5A5A00676565000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF0000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4949005F454500A57C
      7C00CC9B9B00CC9B9B00CC9B9B00CFA2A200EBD9D900EEE0E000EEE0E000D3AC
      AC00906C6C004A3A3A007F7E7E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000494444008E6D6D00D7B3B300D8B5B500D5ADAD00D0A4A400D9B7
      B700EFE1E100DBBFBF00503E3E00969696000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000494444008E6D6D00D7B3B300D8B5B500D5ADAD00D0A4A400D9B7
      B700EFE1E100DBBFBF00503E3E00969696000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C1C1C100373434005F49
      490098737300C2959500CC9B9B00CD9E9E00E3CACA00D9B6B600B88F8F008867
      67004D3F3F005856560000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009D9D9D0043373700AE858500CC9B9B00CC9B9B00DEBFBF00ECDC
      DC00E4CCCC008664640036323200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009D9D9D0043373700AE858500CC9B9B00CC9B9B00DEBFBF00ECDC
      DC00E4CCCC008664640036323200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF004A49
      4900433939006D5353008C6B6B00987474009673730082636300624C4C003A34
      34006C6A6A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000706F6F0046393900936F6F00B38A8A00D0AAAA00B494
      94007A5D5D00332E2E00ADADAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000706F6F0046393900936F6F00B38A8A00D0AAAA00B494
      94007A5D5D00332E2E00ADADAD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A0A0A0004A46460038343400373232002F2A2A00393636005F5C5C00B4B4
      B400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000949393003E3A3A003A3434003B3333003C36
      36004E4D4D00B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000949393003E3A3A003A3434003B3333003C36
      36004E4D4D00B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000300000000100010000000000400200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF1FDFFFFFCFFFFFFFFFFFFFFE0F9
      FFFFFC7FFFFFFF03FFFFC0F1FFFFFC3FFFFFFF01FFFF80E007FF801FFFFFEF39
      FFFF01C007FF800FFFFFE739FFFE018007FF8007FFFEA301FFFC03C007FF800F
      FFFBE703FFF807E007FF801FFFFFEF39F8000FF1FFC7FC3FC7F7FF39E0001FF9
      FF87FC7F87FFFF01C0003FFDFF07FCFF07F7FF038000FFFFFE07FFFE07FFFFFF
      0000FFFFFC0FFFFC0FFFFFFF0000FFFF081FFF081F9F9FFF0000FFFC003FFC00
      3F9F9FFF0000FFFC007FFC007FC03FFF0000FFF800FFF800FFC03FFF0000FFF8
      00FFF800FFCF3FFF0000FFF800FFF800FFE67FFF0000FFF800FFF800FFE67FFF
      8001FFF800FFF800FFF0FFFF8003FFF801FFF801FFF0FFFFC007FFFC01FFFC01
      FFF9FFFFF00FFFFE03FFFE03FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object SearchActionList: TActionList
    Images = SearchImageList
    Left = 584
    Top = 320
    object SearchAction: TAction
      Caption = 'Search'
      ImageIndex = 0
      OnExecute = SearchActionExecute
    end
    object SearchPrevAction: TAction
      Caption = 'Prev'
      ImageIndex = 1
      OnExecute = SearchPrevActionExecute
    end
    object SearchNextAction: TAction
      Caption = 'Next'
      ImageIndex = 2
      OnExecute = SearchNextActionExecute
    end
    object SearchReplaceAction: TAction
      Caption = 'Replace'
      ImageIndex = 3
      OnExecute = SearchReplaceActionExecute
    end
  end
  object FilesRioImageList24: TImageList
    Height = 24
    Width = 24
    Left = 376
    Top = 488
    Bitmap = {
      494C01010E002800040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000006000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF00000000000000000000000000D3E5FA00D1E4FA00D1E4
      FA00D1E4FA00D1E4FA00D1E4FA00D1E4FA00D1E4FA00D1E4FA00D1E4FA00D1E4
      FA00D0E3FA00C6DDF900C6DDF900D0E3FA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000000000000000267DE7000A6CE4000A6C
      E4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6C
      E4000A6CE4000A6CE4000A6CE4003F8CEA000000000000000000000000000000
      000000000000000000000000000000000000F7E7EF00F7E7E700EFE7E700EFDE
      E700EFDEE700EFDEDE00E7DEDE00E7DEDE00E7D6DE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000067A4EE000A6CE4000A6C
      E4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6C
      E4000A6CE4000A6CE4000A6CE4007AAFF0000000000000000000000000000000
      00000000000000000000000000007B5A63007B5A63007B5A63007B5A63007B5A
      63007B5A63007B5A63007B5A63007B5A6300E7DEDE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000000000000000D8E8FB001070E5000A6C
      E4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6C
      E4000A6CE4000A6CE4001975E600E6F0FC000000000000000000000000000000
      00000000000000000000000000007B5A6300EFDEE700EFDEE700D6BDC600D6BD
      C600D6BDC600D6BDC600D6BDC6007B5A6300E7DEDE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF001010FF0000000000000000000000000000000000A4C9F5000C6D
      E4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6C
      E4000A6CE4001070E500B6D3F700000000000000000000000000000000000000
      00000000000000000000000000007B5A6300EFDEE700EFDEE700D6BDC600D6BD
      C600D6BDC600D6BDC600D6BDC6007B5A6300E7DEDE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000000000000000000000000000000000000000BBD6
      F700267DE7000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6C
      E4002F82E800C7DEF90000000000000000000000000000000000000000000000
      00000000000000000000000000007B5A63007B5A63007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A63007B5A63007B5A63000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9F9FF000000000000000000000000000000000000000000000000000000
      0000F8FBFE00ACCDF60066A3EE003586E900297FE7003787E9006CA7EF00B5D3
      F700FBFDFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300F7E7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B18E70009D704B009D704B009D70
      4B009D704B009D704B009D704B009D704B009D704B009D704B009D704B009D6F
      4A0098694200986942007F706D0063A2EE00438EEA005F9FED00C2DAF8000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300F7E7EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC9D840092603700926037009260
      3700926037009260370092603700926037009260370092603700926037009260
      370092603700626474000C6CE1000A6CE4000A6CE4000A6CE4000C6DE40097C1
      F400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300EFE7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7DCD30093613800926037009260
      3700926037009260370092603700926037009260370092603700926037009260
      370088614300116BDC000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4001170
      E500E2EEFC000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300F7E7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3A89100926037009260
      3700926037009260370092603700926037009260370092603700926037009260
      370066646F000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6C
      E4009CC3F4000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300F7E7EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFD00C5AA94009361
      3800926037009260370092603700926037009260370092603700926037009260
      3700727D95000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000A6C
      E40092BEF3000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300F7E7EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E8DD
      D400B695790096663F0092603700926037009260370094643B00B08C6F00E1D3
      C700DBE9FB000C6DE4000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4000B6C
      E400CADFF9000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300F7E7EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBF9F800D4C0AF00BC9D8400CAB19D00F6F3EF00000000000000
      0000000000006CA7EF000A6CE4000A6CE4000A6CE4000A6CE4000A6CE4005A9C
      ED00FEFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700EFDE
      E700EFDEE7007B5A6300F7E7EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5F1ED00AD8768009260370092603700926037009E714D00E5D9D0000000
      000000000000FAFCFE0086B7F2001B76E6000B6DE4001874E6007BB0F000F8FB
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A63007B5A63007B5A
      63007B5A63007B5A630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AF8A6C0092603700926037009260370092603700926037009A6B4500F6F1
      EE00000000000000000000000000FAFCFE00ECF3FD00F9FCFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFDEE700EFE7
      E700F7E7E7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEE6
      E00092603700926037009260370092603700926037009260370092603700CEB8
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B5A63007B5A
      63007B5A6300F7E7E70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E2D4
      C90092603700926037009260370092603700926037009260370092603700C2A6
      8E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300F7E7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1EB
      E60092603700926037009260370092603700926037009260370092603700D2BD
      AC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700D6BD
      C600D6BDC6007B5A6300EFE7E700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B7967B0092603700926037009260370092603700926037009E724D00F9F7
      F500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B5A6300EFDEE700EFDE
      E700EFDEE7007B5A6300EFDEE700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAF7F500B8987D00926037009260370092603700A67D5C00EDE5DF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B5A63007B5A
      63007B5A63000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F2ECE700E2D4C900EBE1DA00FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006468B7002027AE00575BB400000000000000000000000000000000000000
      0000000000000000000000000000FD7E7E00FE020200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FE02
      0200000000000000000000000000000000000000000000000000000000009E3F
      0A009E3F0A009B3D0A009B3D0A00993A0A0098380A0095360A0094350A009233
      0A0091310A008F300A008D2F0A008C2D0A008A2B0A00892B0A00872A0A008729
      0A0087290A00C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005F63
      B5001A32CD003B6FFC004C6DD7006065B5000000000000000000000000000000
      00000000000000000000FDB1B100FE010100FEDDDD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF02
      0200FDB5B500000000000000000000000000000000000000000000000000A142
      0A00FFFFFE00FFFFFE00FFFFF800FFFFF600FFFEF000FFFEED00FFFAE900FFFA
      E500FFFAE100FFF6DD00FFF4D900FFF2D600FFF0D200FFEECD00FFECC900FFEB
      C800872A0A00C0C0C00000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005F63B5001A32
      CD003B6FFC007EADFC00D6EEFC00303CB5000000000000000000000000000000
      00000000000000000000FE010100FEB9B900FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FE02
      0200FE010100000000000000000000000000000000000000000000000000A546
      0A00FFFFFE00FFFFFE00FFFFF800FFFFF600FFFCED00FFFCED00FFFCEA00FFFA
      E900FFF8E600FFFAE100FFF6DB00FFF4D900FFF2D600FFF0D200FFEECD00FFEC
      C900892B0A00C0C0C00000000000000000000000000000000000000000000000
      0000000000003333330033333300333333003333330033333300333333003333
      3300333333003333330033333300333333003333330033333300FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005F63B5001A32CD003B6F
      FC007EADFC00E1F2FC005979DD004B4FB1000000000000000000000000000000
      000000000000FE010100FE717100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEA5
      A500FE010100000000000000000000000000000000000000000000000000A748
      0A00FFFFFE00FFFFFE00FFFFFE00FFFEF000FFFAE900FFFAEC00FFFCED00FFFC
      EA00FFF8E600FFF8E100FFF8E100FFF4D900FFF3D800FFF0D200FFEDCF00FFEB
      C8008A2B0A00C0C0C00000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC009999990099999900999999006666660033333300FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F63B5001A32CD003B6FFC007EAD
      FC00E1F2FC005B7FE1004548AF00000000000000000000000000000000000000
      0000FEE5E500FE010100FED8D800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEC3
      C300FE010100000000000000000000000000000000000000000000000000AB4A
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFAEC00FFFAE900FFFAEC00FFFA
      EC00FFFAE900FFF8E600FFF6E100FFF8DF00FFF4D900FFF2D600FFEBCE00FFE2
      C4008B2D0A00C0C0C00000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005F63B5001A32CD003B6FFC007EADFC00E1F2
      FC005F84E4004145AE00C3C3C700000000000000000000000000000000000000
      0000FE010100FD717100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FED3
      D300FE010100000000000000000000000000000000000000000000000000AD4E
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFAE900FFF8E600FFF8
      E900FFFAE900FFFAE900FFF6E500FFF6E100FFF6DD00FFF3D800FFF1D600FFE4
      C7008D2F0A00C0C0C00000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005F63B5001A32CD003B6FFC007EADFC00E1F2FC006288
      E7003E40AD00C3C3C70000000000000000000000000000000000000000000000
      0000FE010100FED4D400FFFFFF00FFFFFF00FED8D800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEDC
      DC00FF000000000000000000000000000000000000000000000000000000AD4E
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFF8E900FFF4
      E500FFF8E900FFF8E900FFF8E600FFF6E500FFF4E200FFF6DD00FFF2D600FFEC
      D1008F300A00C0C0C00000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000676AB7001A32CD003B6FFC007EADFC00E1F2FC00658DEA003A3D
      AC00C1C1C600000000000000000000000000000000000000000000000000FE02
      0200FE6E6E00FFFFFF00FFFFFF00FEA9A900FD808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEE0
      E000FF000000000000000000000000000000000000000000000000000000B152
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFF6
      E800FFF2E100FFF6E800FFF8E900FFF8E600FFF4E200FFF4DD00FFF4DD00FFEB
      D10091320A00C0C0C00000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000959595005B5757004C4747004E4A4A005654540087878700BDBD
      BD008B898900191521002F54BC007EADFC00E1F2FC006893ED00383BAB00BDBD
      C50000000000000000000000000000000000000000000000000000000000FE01
      0100FE9E9E00FFFFFF00FEE9E900FF212100FE020200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEE3
      E300FF000000000000000000000000000000000000000000000000000000B354
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFF6E800FFEFDE00FFF6E500FFF6E500FFF6E500FFF4E200FFF3DE00FFED
      D40093340A00C0C0C00000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008E8C
      8C00332C2C00442D2D005D3636006C3D3D006C3D3D0062383800573E3E00332E
      2E00211A1A00765555002E2B3500A1BED1006995EF00383BAB00B8B8C5000000
      000000000000000000000000000000000000000000000000000000000000FE01
      0100FED6D600FFFFFF00FE787800FE010100FE020200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEE3
      E300FF000000000000000000000000000000000000000000000000000000B657
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFE00FFF5E800FDECDB00FFF4E500FFF6E500FFF6E500FFF2E100FFEA
      D50095360A00C0C0C00000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      000000000000000000000000000000000000000000000000000068646400402E
      2E00754A4A00A9848400CAA7A700D4ACAC00CFA2A200B4868600956666006F42
      4200482F2F00352F2F00D4D3D3001F1F28003B3FAA00B4B4C300000000000000
      000000000000000000000000000000000000000000000000000000000000FE00
      0000FD868600FEAEAE00FE010100FC6A6A00FE020200FFFFFF00FEF6F600FE02
      0200FFFFFF00FEEFEF00FE020200FFFFFF00FEF1F100FE020200FFFFFF00FEE0
      E000FF000000000000000000000000000000000000000000000000000000B759
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFE00FFFFFE00FFF5E800FBEBDA00FFF4E500FFF4E500FFF4E200FDEC
      DD0098380A00C0C0C00000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      000000000000000000000000000000000000000000007D7A7A00433030008D65
      6500DDC4C400E4CBCB00E1C4C400DBBBBB00D5ADAD00CE9F9F00CC9B9B00B88A
      8A00774C4C00533E3E00464343005F5E5E000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FD66
      6600FF000000FE010100FD9B9B00FF898900FE020200FFFFFF00FEDDDD00FF02
      0200FFFFFF00FEDBDB00FF020200FFFFFF00FEDBDB00FF020200FFFFFF00FEDC
      DC00FF000000000000000000000000000000000000000000000000000000B95C
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFE00FFFFFE00FFFFFE00FFF5E800FAEAD900FFF2E500FFF4E500FEF0
      E0009E3F0A00C0C0C00000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      000000000000000000000000000000000000BBBBBB00322A2A00815A5A00E3D0
      D000ECDCDC00ECDCDC00E7D2D200E1C6C600DAB7B700D1A8A800CC9B9B00CC9B
      9B00B98C8C0070464600211C1C00B7B7B7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDDDDD00FDE8E80000000000FC8A8A00FE020200FFFFFF00FEDCDC00FF02
      0200FFFFFF00FEDBDB00FF020200FFFFFF00FEDADA00FF010100FDC8C800FE01
      0100FE010100000000000000000000000000000000000000000000000000BC5E
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFF5E800F9E9D800FFF2E500FBEB
      DE00A1420A00C0C0C00000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000006867670057383800C4AAAA00EEE0
      E000F5ECEC00F4EBEB00EDDEDE00E5CECE00DDBEBE00D4ACAC00CC9B9B00CC9B
      9B00CC9B9B00996D6D0057404000838383000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FC8B8B00FE020200FFFFFF00FEDBDB00FF02
      0200FFFFFF00FED9D900FF020200FFFFFF00FDC4C400FE000000FE000000FE01
      0100FDC3C300000000000000000000000000000000000000000000000000BD60
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFF4E500F8E8D700F0E7
      DC00A5460A00C0C0C00000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      0000000000000000000000000000000000003B3737007C555500E7D2D200F0E4
      E400F8F5F500F7F3F300EFE2E200E6D0D000DEBFBF00D4ACAC00CC9C9C00CC9B
      9B00CC9B9B00B88A8A0068444400514E4E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FD8D8D00FF020200FFFFFF00FED9D900FF02
      0200FFFFFF00FEC0C000FF010100FE020200FF010100FD6B6B00000000000000
      000000000000000000000000000000000000000000000000000000000000BF62
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFF2E500EFE1
      D000A7480A00C0C0C00000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF0099999900CCCCCC0099999900CCCCCC006666
      6600CCCCCC003333330099999900333333006666660033333300FFFFFF000000
      00000000000000000000000000000000000038323200936F6F00E4CECE00ECDC
      DC00F2E6E600F1E5E500EBDADA00E4CCCC00DCBCBC00D3AAAA00CC9B9B00CC9B
      9B00CC9B9B00CA9A9A00724D4D00403D3D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FE909000FF020200FFFFFF00FED8D800FF01
      0100FF020200FF010100FC616100FD9B9B00FCB1B10000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C063
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00EFE3
      D800AB4A0A00C0C0C00000000000000000000000000000000000000000000000
      00000000000033333300FFFFFF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC009999990099999900999999006666660033333300FFFFFF00FFFF
      FF00000000000000000000000000000000003A31310095717100E0C4C400E5D0
      D000E9D6D600E9D5D500E5CECE00DFC2C200D8B4B400D1A5A500CD9D9D00DFC2
      C200E4CCCC00D3ACAC0074505000413D3D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FD919100FF020200FFFFFF00FED8D800FF00
      0000FEDBDB000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C265
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FBF4
      EE00AD4E0A00C0C0C00000000000000000000000000000000000000000000000
      0000333333003333330033333300333333003333330033333300333333003333
      330033333300333333003333330033333300333333003333330033333300FFFF
      FF00000000000000000000000000000000003933330087626200DAB7B700DEC0
      C000E1C4C400E1C4C400DEBFBF00D9B6B600D3AAAA00CC9C9C00D5AEAE00EDDD
      DD00F5ECEC00C99F9F0068494900555252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000FDA3A300FF020200FFFFFF00FED7D700FF00
      0000000000000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C568
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00AD4E0A00C0C0C00000000000000000000000000000000000000000000000
      000033333300FFFFFF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC0099999900999999009999990099999900999999006666660033333300FFFF
      FF0000000000000000000000000000000000504C4C00674A4A00C59E9E00D6B0
      B000D8B4B400D8B3B300D5AEAE00D1A8A800CD9D9D00D1A6A600E6D0D000EFE2
      E200EBDADA00A67D7D004D3B3B00909090000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000FEABAB00FF020200FFFFFF00FED6D600FE01
      0100000000000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C669
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00B1520A00C0C0C00000000000000000000000000000000000000000000000
      0000333333003333330033333300333333003333330033333300333333003333
      3300333333003333330033333300333333003333330033333300333333000000
      000000000000000000000000000000000000A2A2A2004035350097707000CE9F
      9F00D0A2A200D0A2A200CE9F9F00CE9F9F00E0C2C200E7D2D200EDDDDD00F2E6
      E600D1AAAA007E5D5D0035303000C1C1C1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000FEC6C600FF010100FEDFDF00FE010100FE01
      0100000000000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C76B
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00B3540A00C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CCCCCC00CCCC
      CC00CCCCCC000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4949005F454500A57C
      7C00CC9B9B00CC9B9B00CC9B9B00CFA2A200EBD9D900EEE0E000EEE0E000D3AC
      AC00906C6C004A3A3A007F7E7E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000FE010100FF000000FE050500FDA1
      A1000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C96D
      0A00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFF
      FE00B6570A00C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C1C1C100373434005F49
      490098737300C2959500CC9B9B00CD9E9E00E3CACA00D9B6B600B88F8F008867
      67004D3F3F005856560000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CA6D
      0A00C96D0A00C96B0A00C76B0A00C6690A00C5680A00C4650A00C0630A00C063
      0A00BF610A00BD600A00BC5E0A00B95C0A00B85A0A00B6570A00B1520A00B152
      0A00B7590A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF004A49
      4900433939006D5353008C6B6B00987474009673730082636300624C4C003A34
      34006C6A6A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A0A0A0004A46460038343400373232002F2A2A00393636005F5C5C00B4B4
      B400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C7C7FF00E7E7FF0000000000000000000000000000000000000000000000
      000000000000E7E7FF00C7C7FF0000000000000000003C3C3C00302F3100302F
      3100404040004040400040404000404040004040400040404000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      4000302F3100302F31003C3C3C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CBCB
      FF000C0CFF002828FF00E7E7FF00000000000000000000000000000000000000
      0000E7E7FF002828FF000C0CFF00CBCBFF003E3D3F003E3D3F003E3D3F003231
      3300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003231330032313300323133003E3D3F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C6EA1000C6EA1000C6EA1000C6E
      A1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6E
      A1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6EA1000C6E
      A1005C8CAA0000000000000000000000000000000000000000006F526F00271C
      2800412E3E00321925007C71780000000000000000000000000000000000F3F3
      FF003C3CFF000000FF002828FF00E7E7FF00000000000000000000000000E7E7
      FF002828FF000000FF003C3CFF00F3F3FF003333330065656500656565003333
      3300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000C8000000C8000000
      C8000000C8000000C8000000C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00333333003333330033333300333333000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE0018BEF5000ABBF8000AB8
      F6000AB6F4000AB3F1000AB1EE000AADEB000AACE8000AA9E5000AA7E4000AA5
      E1000AA1DD000A9FDB000A9CD8000A9AD6000A99D3000A96D1000A93CE000A91
      CB00266F9B000000000000000000000000000000000000000000000000000000
      0000000000000008160012261F00504241008F638300BB90A700000000000000
      0000F3F3FF003C3CFF000000FF002828FF00E7E7FF0000000000E7E7FF002828
      FF000000FF003C3CFF00F3F3FF00000000003534360035343600353436003534
      3600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000C8007070FF007070
      FF007070FF007070FF000000C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00353436003534360035343600353436000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE0023A0D0000ABEFC000ABC
      F9000AB9F7000AB7F5000AB5F2000AB2F0000AAEEC000AACE9000AABE7000AA8
      E4000AA6E2000AA2DF000AA0DC000A9ED9000A9BD7000A99D4000A96D1000A94
      CF001872A500C1C4C5000000000000000000000000000000000000000000221C
      170012202700619EC500294862000000000000030000282A1200A68493000000
      000000000000F3F3FF003C3CFF000000FF002828FF00D1D1FF002828FF000000
      FF003C3CFF00F3F3FF0000000000000000003636360036363600363636003636
      3600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000C8007070FF007070
      FF007070FF007070FF000000C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00383636003636360036363600363636000000000000000000000000000000
      0000000000000000000000C0200000C020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE001F87B60010C1FC000ABE
      FC000ABDFB000ABBF8000AB8F6000AB6F4000AB3F1000AB0ED000AADEB000AAC
      E8000AA9E5000AA7E4000AA3E0000AA1DD000A9FDB000A9CD8000A9AD6000A98
      D2000B85BE007A9DB30000000000000000000000000000000000000000009068
      850038504B0092E5ED0062A4C400395C89003F6180000008110029251600BA96
      A4000000000000000000F3F3FF003C3CFF000000FF000606FF000000FF003C3C
      FF00F3F3FF000000000000000000000000003A3739003A3739003A3739003A37
      3900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000C8007070FF007070
      FF007070FF007070FF000000C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003A3739003B383A003A3739003A3739000000000000000000000000000000
      0000000000000000000000C0200000E0200000C0200000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE001174A80028C7F8000ABE
      FC000ABEFC000ABEFC000ABCF9000AB9F7000AB7F5000AB3F1000AB1EE000AAE
      EC000AACE9000AABE7000AA8E4000AA5E1000AA2DF000AA0DC000A9ED9000A9B
      D7000B98D2003D7DA50000000000000000000000000000000000000000000000
      0000284E3E00A3FFFF00C5FFFF0054C7FF000088F50058372F007D250000815C
      4B00A98C9B000000000000000000DCDCFF000909FF000000FF000909FF00DCDC
      FF00000000000000000000000000000000003939390039393900393939003939
      3900FFFFFF00FFFFFF00FFFFFF000000C8000000C8000000C8007070FF007070
      FF007070FF007070FF000000C8000000C8000000C800FFFFFF00FFFFFF00FFFF
      FF00393939003939390039393900393939000000000000000000000000000000
      0000000000000000000000C0200000E0200000E0200000C02000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE000D74A9003CB8E2000ABE
      FC000ABEFC000ABEFC000ABEFC000ABDFB000ABBF8000AB8F6000AB5F2000AB2
      F0000AB0ED000AADEB000AACE8000AA9E5000AA6E2000AA3E0000AA1DD000A9F
      DB000B9DD8002479A800C1C4C500000000000000000000000000000000000000
      0000736F7B006EA09D0060DEFF0047D9FF005E98A500DD793200E65103008C3E
      1700704E2F00A8869400E7E7FF002828FF000000FF000E0EFF000000FF002828
      FF00E7E7FF000000000000000000000000003B3B3B003B3B3B003B3B3B003B3B
      3B00FFFFFF00FFFFFF00FFFFFF000000C8007070FF007070FF007070FF007070
      FF007070FF007070FF007070FF007070FF000000C800FFFFFF00FFFFFF00FFFF
      FF003B3B3B003B3B3B003B3B3B003B3B3B000000000000000000000000000000
      0000000000000000000000C0200000E0400000E0400000E0400000C020000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE001282B300369EC60011C2
      FC000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABCF9000AB9F7000AB6
      F4000AB3F1000AB1EE000AAEEC000AACE9000AA9E5000AA7E4000AA5E1000AA2
      DF000BA0DC000D87C00086A1B400000000000000000000000000000000000000
      00000000000062454A000068BC0061B3BB00FFB01100FC901900E16A1400C24E
      13009D472100000000001A15EE000000FF003C3CFF00E7E7FF003C3CFF000000
      FF002828FF00E7E7FF0000000000000000003F3D3D003F3D3D003F3D3D003F3D
      3D00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000C8007070FF007070FF007070
      FF007070FF007070FF007070FF000000C800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003F3D3D003F3D3D003F3D3D003F3D3D0000C0200000C0200000C0200000C0
      200000C0200000C0200000C0200000E0400000E0400000E0400000E0400000C0
      2000000000000000000000000000000000000000000000000000000000003434
      D1000808C7003030D00000000000000000000A78AE001487B8001B81AE0035CF
      FB000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABDFB000ABB
      F8000AB7F5000AB5F2000AB2F0000AB0ED000AADEB000AABE7000AA8E4000AA6
      E2000BA3E0000BA0DC004683A800000000000000000000000000000000000000
      00000000000000000000B5A77E00D2CE4400FFDE5200FFB02D00EE811600D860
      130000000000170ADB000000FF002821E800F3F3FF0000000000F3F3FF003C3C
      FF000000FF002828FF00E7E7FF00000000003E3E3E003E3E3E003F3F3F00403E
      3D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000C8007070FF007070
      FF007070FF007070FF000000C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00403E3D003F3F3F003E3E3E003E3E3E0000C0200000E0600000E0600000E0
      600000E0600000E0600000E0600000E0600000E0600000E0600000E0600000E0
      600000C0200000000000000000000000000000000000000000000000C6000000
      C6000000C6000000C6000000C600000000000A78AE00188DBD000F72A30055C9
      EB000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABEFC000ABE
      FC000ABCF9000AB8F6000AB6F4000AB3F1000AB1EE000AAEEC000AACE8000AA9
      E5000BA7E3000BA5E1002779A600000000000000000000000000000000000000
      0000000000000000000000000000FBC35B00E1CC2800FCDB4A00FFB738000000
      00002210D9000000FF00200EC70000000000A48696000000000000000000F3F3
      FF003C3CFF000000FF002828FF00E7E7FF004040400040404000404040004040
      4000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000C8007070
      FF007070FF000000C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF004040400040404000404040004040400000C0200000E0600000E0600000E0
      600000E0600000E0600000E0600000E0800000E0800000E0800000E0800000E0
      800000E0800000C020000000000000000000000000003838D2000000C6000000
      DF000000F9000000DF000000C6003030D0000A78AE001C93C000147FAE002C8D
      B800ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFCFC0068F1
      FC000ABEFC000ABCF9000AB9F7000AB7F5000AB5F2000AB2F0000AB0ED000AAC
      E9000BABE7000BA8E400108CC50096ABB8000000000000000000000000000000
      000000000000000000000000000000000000D8AE5000F0DB5500FFE04D000000
      00000B06F4003619C7000000000092421C0066462400A7849500000000000000
      0000F3F3FF003C3CFF000C0CFF00C7C7FF004442420044424200434141004442
      4200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      C8000000C800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF004442420043414100444242004442420000C0200000E0600000E0600000E0
      600000E0800000E0800000E0800000E0800000E0800000E0800000E0800000E0
      800000E0800000E0800000C0200000000000000000001010C9000000C6000000
      F9000000FF000000F9000000C6000808C7000A78AE00239EC9001785B300167A
      A9000A74AC000A74AC000A74AC000A74AC000A74AC000A74AC000A74AC002B92
      BC0068F1FC000ABEFC000ABDFB000ABBF8000AB8F6000AB6F4000AB3F1000AB1
      EE000BAEEB000BACE8000BA6E2004A84A8000000000000000000000000000000
      00000000000000000000000000000000000000000000EBBB6500F3DB46000000
      00000000000000000000DE661300BF4F15009D472100704B3500AA89A1000000
      000000000000F3F3FF00CBCBFF00000000004343430043434300434343004343
      4300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF004343430043434300434343004343430000C0200000E0600000E0600000E0
      600000E0800000E0800000E0800000E0800000E0800000E0800000E0800000E0
      800000E0800000C020000000000000000000000000003C3CD3000000C6000000
      DF000000F9000000DF000000C6003434D1000A78AE003CD3F20031C0E40030BB
      DF0032BCDF0034BDDF0035BEDF0038BEDF003ABFDF0035B3D4002592B9001A7E
      A90052C4E20068F1FC000ABEFC000ABEFC000ABCF9000AB9F7000AB7F5000AB5
      F2000BB1EE000BAEEC000BADE9002D7DA9000000000000000000000000000000
      000000000000BF4F1500BF4F1500000000000000000000000000DFB85E00E1C9
      1900FFDE5900FFB43400EE7E1400DA601200CC500D0089400D0074533F00B98A
      9E00000000000000000000000000000000004545450045454500454446004544
      4600454545004545450045454500454545004545450045454500454545004545
      4500454545004545450045454500454545004545450045454500454545004545
      45004544460045444600454545004545450000C0200000E0A00000E0A00000E0
      A00000E0A00000E0A00000E0A00000E0A00000E0A00000E0A00000E0A00000E0
      A00000C0200000000000000000000000000000000000000000000000C6000000
      C6000000C6000000C6000000C600000000000A78AE006BF2FC0047E2FC0048E4
      FC004BE4FC004EE5FC0050E7FC0053E8FC0056E9FC0058E9FC0042C1DD002A98
      BD00197BA9004DD6F600ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFCFC00ADFC
      FC00ADFCFC00ADFCFC0042CBE900297DAA000000000000000000000000000000
      0000BF4F1500E66C1200E66C1200BF4F1500000000000000000000000000DCB5
      5A00E6D03800FDDB4700FFB83700EC801500CE641B00884D25002B2E3C002B2E
      3C00644A5D000000000000000000000000004846460048464600484646004846
      4600484547004846460048464600484646004846460048464600484646004846
      4600484646004846460048464600484646004846460048464600494747004846
      46004947470048464600484646004846460000C0200000C0200000C0200000C0
      200000C0200000C0200000C0200000E0C00000E0C00000E0C00000E0C00000C0
      2000000000000000000000000000000000000000000000000000000000003C3C
      D3001010C9003838D20000000000000000000A78AE0083FBFC004EE5FC0050E7
      FC0053E8FC0056E9FC0059EBFC005BEBFC005EECFC0061EDFC0059DFF10035A5
      C5002487AE000A74AC000A74AC000A74AC000A74AC000A74AC000A74AC000A74
      AC000A74AC000A74AC000A74AC00B6BDC100000000000000000000000000BF4F
      1500E66C1200FBAB2B00FBAB2B00E66C1200BF4F150000000000000000000000
      0000D5AA4C00ECD85000FFE04800EFAC3E00A8866200687079004B708C00395A
      72002B2E3C0060465F000000000000000000494747004A4848004A4848004A48
      4800484547004846460048464600484646004846460048464600484646004846
      4600484646004846460048464600484646004846460048464600494747004846
      46004A4848004B4949004A4848004C4748000000000000000000000000000000
      0000000000000000000000C0200000E0C00000E0C00000E0C00000C020000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE00ADFCFC0056E9FC0059EB
      FC005CECFC005FEDFC0061EDFC0063EEFC0067F0FC006AF1FC006CF1FB005BD7
      E80043B3CF003CA9C6003CA8C6003DA9C6003FA9C60041ABC60042ABC6000A78
      AE00000000000000000000000000000000000000000000000000BF4F1500E66C
      1200FBAB2B00FBAB2B00FBAB2B00FBAB2B00E66C1200BF4F1500000000000000
      000000000000E4BD5B00F7D52900EDD67F009CABB2006595C5005795C8005D91
      BD005C799B002B2E3C0060465F00000000004C4A49004C4A49004C4A49004C4A
      4900393737003A38380039373700393737003737370037373700373737003737
      3700373737003737370038383800373737003737370037373700373737003737
      37004C4A49004C4A49004C4A49004C4A49000000000000000000000000000000
      0000000000000000000000C0200000E0E00000E0E00000C02000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE00ADFCFC005FEDFC0062EE
      FC0064F0FC0067F0FC006AF1FC006DF2FC0070F4FC0073F5FC0076F6FC0078F7
      FC007BF8FC007EF9FC0081FBFC0084FCFC0085FCFC0085FCFC0085FCFC000A78
      AE000000000000000000000000000000000000000000BF4F1500E66C1200FBAB
      2B00FBAB2B00FBAB2B00FBAB2B00FBAB2B00FBAB2B00E66C1200BF4F15000000
      00000000000000000000E0B98000C2C48A00B7D9EB009CCDF4007FC0E90073B9
      E90073A2D000444C52002B2E3C00000000004C4A4A004D4B4B004C4A4A004E4C
      4C003D3B3B004C4A49004C4A49004C4A49004A4B49003B3B3B00C1BFBF00C1BF
      BF00C1BFBF00C1BFBF00C0BEBE00C1BFBF00BFBFBF00C1BFBF00C1BFBF003A3A
      3A004D4B4B004D4B4B004D4B4B004D4B4B000000000000000000000000000000
      0000000000000000000000C0200000FFFF0000C0200000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE00ADFCFC0068F1FC006BF2
      FC006DF2FC0070F4FC0073F5FC0076F6FC0079F7FC007CF8FC007FF9FC0082FB
      FC0085FCFC0085FCFC0085FCFC0085FCFC0085FCFC0085FCFC0087FCFC000A78
      AE0000000000000000000000000000000000E66C1200BF4F1500BF4F1500BF4F
      1500FBAB2B00FBAB2B00FBAB2B00FBAB2B00BF4F1500BF4F1500BF4F1500E66C
      1200000000000000000000000000C0AFB800ABCDE100C5ECF900C1EBFF0092C4
      E10076979B002B2E3C00CA95AA00000000004F4D4D004F4D4D00504E4E004F4D
      4D00403D3F004E4C4C004D4B4B004D4B4B004D4B4A00413F3F00C0BBBC00C0BB
      BC00C0BBBC00C0BBBC00BEBCBC00C0BBBC00C0BBBC00BEBCBC00C0BBBC00403E
      3E004F4D4D004F4D4D004F4D4D004F4D4D000000000000000000000000000000
      0000000000000000000000C0200000C020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A78AE00ADFCFC0071F5FC0073F5
      FC0076F6FC0079F7FC007CF8FC007FF9FC0083FBFC0083FBFC000A78AE000A78
      AE000A78AE000A78AE000A78AE000A78AE000A78AE000A78AE000A78AE004C99
      B60000000000000000000000000000000000000000000000000000000000BF4F
      1500FBAB2B00FBAB2B00FBAB2B00FBAB2B00BF4F150000000000000000000000
      0000000000000000000000000000000000009CA9CC00BFD8E000D8E7EA00B1B7
      BD002B2E3C00DCABC5000000000000000000514F4E00514F4E00514F4E005250
      4F00434042004F4D4D004F4D4D004F4D4D004F4D4C0043414100BEB9B800BDB8
      B700BEB8B900BEB9B80047454500333333003533330047454500BDB8B7004141
      4100514F4E00514F4E00504E4D00514F4E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A78AE00ADFCFC007CF8
      FC007FF9FC0083FBFC0085FCFC0085FCFC0085FCFC000A78AE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BF4F
      1500FBAB2B00FBAB2B00FBAB2B00FBAB2B00BF4F150000000000000000000000
      00000000000000000000000000000000000000000000C8AEB200ABA178002B2E
      3C00E1B2D10000000000000000000000000052504F0052504F0052504F005250
      4F0048464600514F4E00514F4E00514F4E00514F4E0047454500BDB5B500BDB5
      B500BDB5B500BDB5B500474747003B383A003B383A0049474700BDB5B5004745
      440052504F0050514F0050514F008F9191000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000A78AE00ADFC
      FC00ADFCFC00ADFCFC00ADFCFC00ADFCFC000A78AE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BF4F
      1500FBAB2B00FBAB2B00FBAB2B00FBAB2B00BF4F150000000000000000000000
      0000000000000000000000000000000000000000000000000000D3A2AF00E7B2
      CC00000000000000000000000000000000005452510054525100545251005452
      51004E4C4C00545251005452510054525100545251004E4C4C00BBAFAF00BBAF
      AF00BCAFB100BBAFAF004F4D4D0048464600484646004F4D4D00B9AFAF004E4C
      4C00565251005553520094929100FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000A78
      AE000A78AE000A78AE000A78AE000A78AE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BF4F
      1500BF4F1500BF4F1500BF4F1500BF4F1500BF4F150000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F5D5D0055535300555353005553
      5300514F4F005553530055535300555353005553530052505000BAACAD00BAAC
      AD00B9ABAC00BAACAD00514F4F004F4D4D004E4C4C00514F4F00BAACAE004F4F
      4F005553530093939300FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBC9C80062605F00575554005755
      5400545251005755540057555400575554005654540055535300B6A8A900B9A9
      AA00B8A8A900B7A9AA0055535300535151005452520054525200B7A9AB005452
      520096949400FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD00F4F4F400E9E9E900E7E7E700E5E0DB00DFD3C700DCCEC000DDCC
      BA00DCCBBA00DDCFC100E0D6CD00E6E2DF00E7E7E700ECECEC00F7F7F700FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000D7E9EC00DCEFF300E7F3F600E6F3F500E6F3F500E6F3F500E6F3
      F500E6F3F500E6F3F500E6F3F500E6F3F500E7F3F600DBEEF100D7E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F8F800E8E0
      DB00C2BAB500E9E9E900FCFCFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBFBFB00F1F1F100E2D7CB00D8B59200D79F6500DC924000DE8F3400E086
      1F00DF872100DC8D3100D7914500D39F6900D6B69700E5DFD700F3F3F300FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000D7E9EC00E5EEEF00D1CFB500B8B69A00B8B69D00B6B49D00B5B39D00B5B3
      9D00B6B49D00B9B79D00BBB99D00BEBC9D00BFBC9A00DBDBC400DBEEF1000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F600D0BBAC00B775
      42009B5C2D0093837800D5D5D400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDF9F600F0C89F00E59B4E00EB9C3A00F1A53A00F1A32E00F1A12800EF9C
      2000EF9C1F00EF9D2300EF9D2800F09E3100E4912F00E09C5500F3DCC600FFFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000DAECED00DAE1DA003434FF000000C8000000C8000000C8000000C8000000
      C8000000C8000000C8000000C8000000C8000000C8003434FF00F0FFEA000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C7B2A400BE6B2F00E490
      4800DB7F35009E531C0086776D00DDDDDD000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006F526F00271C
      2800412E3E00321925007C717800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDF9
      F600EEBA8700E9973700F7B54D00F3A93300EE9C1C00EC991600EB971300EB95
      1000EA940F00EA930D00EA920C00EA920D00F2A02400F09F3200D9812300EFCE
      AD00FFFDFD000000000000000000000000000000000000000000000000000000
      0000DCEFEF00C1C9D2000000C800ABABFF00B4B4FF00C1C1FF00CACAFF00CFCF
      FF00CECEFF00C8C8FF00BEBEFF00B1B1FF00A4A4FF000000C800E6F7E6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F4F1EF00C1A38E00C4672400ECA16000FDBA
      7B00FCAD6800E7863700B0561200826B5900C5C3C100F9F9F900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000008160012261F00504241008F638300BB90A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFCFB00F3C9
      A000EA973400F6B54B00F1A42800EE9E1E00EE9D1C00EE9D1D00EE9C1D00EE9C
      1C00ED9A1A00EC981500EB941000E9910B00E9900900EF9A1A00F2A13100D97A
      1400EFCEAD00FEFDFC0000000000000000000000000000000000000000000000
      0000DCEFEF00C6CDD2000000C8007878FF008584FF009696FF00A6A6FF00B3B3
      FF00BABAFF00BBBBFF00B7B7FF00ABABFF009E9EFF000000C800E3F4E6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F3EFEC00C3997B00C56E2E00F1B07300FFC28600FEB6
      7600FFAB6400FDA25500EC832E00AF5613008A684E00BCBAB800000000000000
      000000000000000000000000000000000000000000000000000000000000221C
      170012202700619EC500294862000000000000030000282A1200A68493000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F6D7B700E996
      3700F6B54D00F2A83000F0A32500F0A32700F2A93300F4AB3D00F3A93E00F3A8
      4200F2A73F00F2A53800F2A52F00EF9D1F00EB940E00E9910A00EF9B1A00F2A2
      3200DB832500F3DCC40000000000000000000000000000000000000000000000
      0000DCEFEF00C6CED2000000C8007070FF007D7DFF008A8AFF009595FF009E9E
      FF00A3A3FF00A3A3FF009F9FFF009696FF008C8CFF000000C800E5F6E6000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BA886800C76E2D00EFB07500FFC88F00FFBC7E00FFB3
      6F00FFA96000FF9E4E00FF964200EB792000B4561000815C4100C3C3C3000000
      0000000000000000000000000000000000000000000000000000000000009068
      850038504B0092E5ED0062A4C400395C89003F6180000008110029251600BA96
      A400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBECDD00EB9A4500F6BA
      5900F4B03C00F2A82D00F2AA3200F7B84D00EFA64100E99C4400EBAD6B00EBB5
      7D00EAB17900E79F5300E48F2C00F1A43900F5AA3400EC961300EA910B00EF9C
      1C00F0A03400E19D5700FBF3EC00000000000000000000000000000000000000
      0000DCEFEF00C8CFD3000000C8006464FF007070FF007B7BFF008484FF008B8B
      FF008F8FFF008F8FFF008C8CFF008584FF007B7BFF000000C800E6F8E6000000
      000000000000000000000000000000000000000000000000000000000000FCFB
      FB00E0D7D200B27A5800D4783300F5BD8500FFC99000FFBE8000FEB67500FFAD
      6600FEA35600FF9B4900FF913A00FF882A00F1761800CA56040082543600A29B
      9600E5E5E5000000000000000000000000000000000000000000000000000000
      0000284E3E00A3FFFF00C5FFFF0054C7FF000088F50058372F007D250000815C
      4B00A98C9B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F1B47700F3B25600F7BC
      5100F3AD3500F3AE3800F9C15D00EB983600EDAE6D00F9EBDC00FCF7F200FDFA
      F800FDF9F700FBF4ED00F4D9BF00DF8B3400E8922B00F5AA3400EB961100EA93
      0D00F2A32A00E6943300F0D1B2000000000000000000D7E9EC00D6E9EC00D6E9
      EC00DBEFEF00C8D1D3000000C8005858FF006262FF006B6BFF007373FF007979
      FF007C7CFF007C7CFF007979FF007474FF006B6BFF000000C800E8FAE600D8EA
      EC0000000000000000000000000000000000000000000000000000000000D8CA
      C200B7744D00D1793D00F8BE8500FFC58C00FFBF8200FEB67500FFB06B00FFA9
      6100FF9E4F00FF954100FF8D3400FE842400FF7A1600F46C0800C44F07008D52
      2E00978E8800EBEBEB0000000000000000000000000000000000000000000000
      0000736F7B006EA09D0060DEFF0047D9FF005E98A500DD793200E65103008C3E
      1700704E2F00A886940000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBEDDF00EFA55300F8C96D00F5B2
      3E00F5B03A00F7BE5700EEA24000EDA96500FDFBF90000000000000000000000
      0000000000000000000000000000FCF3EB00E08C3500EFA03700F0A02300EB95
      1100EB961300F1A13500E8B17700FCF7F300D8EAEC00E1F1F400EBF4F500EAF4
      F500F0FAF800DAD8D7000000C8004949FF005151FF005B5BFF006262FF006666
      FF006A6AFF006A6AFF006868FF006363FF005A5AFF000000C800F1FFEA00E0F2
      F400E0F1F300E0F1F300DEF0F200D8EAEC000000000000000000D6CFCA00B363
      3900D47A3D00F6B87C00FFBF8500FFBB7B00FEB77500FFAF6900FFA96100FFA1
      5600FE9A4800FE913900FF892D00FF7F1D00FF760E00FD6E0800F05A0700C74A
      06008E4C220096918F00E4E4E400000000000000000000000000000000000000
      00000000000062454A000068BC0061B3BB00FFB01100FC901900E16A1400C24E
      13009D4721006C4A2500A8899700000000000000000000000000000000000000
      000000000000000000000000000000000000F9DABB00F4B66800F9C56700F6B5
      4200F7B74700F7BB5A00EB994300FCF5ED000000000000000000000000000000
      000000000000000000000000000000000000F4DAC000E6902E00F2A73400EC99
      1700EC971400F1A12E00E6A15400F9EFE500E1EFEA00BBB6A700B6B5A400B7B6
      A400BCBAA300A2A293000000C8004545FF004A4AFF005050FF005353FF005353
      FF005454FF005353FF005555FF005353FF004C4CFF000000C800C1BE9600BAB7
      A600B9B6A600B7B4A600C0C0B400E0EFEF00FAF9F800CEB6AC00B45A2B00E187
      4600FCB67500FFB77400FEB37000FFB16C00FFAD6600FFA75D00FFA15200FE9B
      4900FF923C00FF8A2E00FE832300FF771100FD6F0A00FB640800F9580500F44E
      0400D7440100944217008B786E00DEDDDC000000000000000000000000000000
      00000000000000000000B5A77E00D2CE4400FFDE5200FFB02D00EE811600D860
      1300BF4F150094421C0078574400AB90A1000000000000000000000000000000
      000000000000000000000000000000000000F8CCA000F7C27900FAC97600F9BE
      5A00F8C05900F2A94900F5C99C00FFFDFD000000000000000000000000000000
      000000000000000000000000000000000000FCF4ED00E8A15500F3AA3F00EE9D
      1D00EC991600F1A22B00E5943800F8E9DA00B0B6CF0000008A00000099000000
      A3000000AA000000B2000000C8005151FF005757FF005E5EFF006565FF006A6A
      FF006666FF005E5EFF004C4CFF003B3BFF003C3CFF000000C800000099000000
      990000008F000000830000007900D6E3E300EDDDD500B95F3400D26C2B00F09F
      5B00F09D5A00FBA76000FFAA6100FFA85E00FFA35600FF9D4E00FF994700FF94
      3E00FF8C3000FF852500FF7D1900FF730C00FC6A0800F9600800EB500400EA46
      0300E73E0100C53A010092492400BAB1AC000000000000000000000000000000
      0000000000000000000000000000FBC35B00E1CC2800FCDB4A00FFB73800EF7E
      1300DE661300C64D11008A3D130077564400A486960000000000000000000000
      000000000000000000000000000000000000F8C59100F8C88200FBCB7B00FBC7
      7200FACB7800F1A14400FCEAD900000000000000000000000000000000000000
      000000000000000000000000000000000000FCF9F600ECB37800F4AC4700F0A1
      2400ED9C1A00F1A42C00E48E2B00F7E6D500A3A9CD000000C8000000C8000000
      C8000000C8000000C8003434FF005454FF005757FF005E5EFF006363FF006767
      FF006D6DFF007070FF007474FF007070FF004D4DFF002525FB000000C8000000
      C8000000C8000000C8000000C800C4D2DA00F0DDD400BE613600B84D1C00BD55
      2100B94F1E00C1551F00D2672800FF9F5100FFA05000FF954100FF913900FF8C
      3200FE842500FF7E1B00FE760F00FC6A0800F85D0700CD430300B53F0900BA44
      0F00B7410F00B6421000AF644200E0D7D2000000000000000000000000000000
      000000000000000000000000000000000000D8AE5000F0DB5500FFE04D00FFB3
      3300F18B1D00E66C1200C64D110092421C0066462400A7849500000000000000
      000000000000000000000000000000000000F8C59100F9CB8700FCCE7F00FCCB
      7900FBD08500F3A44A00FCEDDF00000000000000000000000000000000000000
      000000000000000000000000000000000000FDFAF800EEB78000F4AF4C00F1A4
      2800EE9E1E00F2A72F00E6912D00F8E7D500B1C0DB000000C8004040FF003F3F
      FF004747FF004D4DFF005454FF005757FF005D5DFF006464FF006767FF006B6B
      FF006E6EFF007070FF007373FF007373FF007A7AFF007B7BFF003232FF000202
      FF000C0CFF000202FF000000C800E2EFE30000000000F8F1EE00F1E3DD00F1E3
      DD00F1E3DD00D3BDB500CA561900FEAB6B00FFB07800FFA96800FF964500FF85
      2600FF7B1700FF750D00FE6F0800FB660800F3540500BD380100947C7300E5DB
      D600F1E3DD00F1E3DD00F8F1EE00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EBBB6500F3DB4600FFDC
      5600FBAB2B00F18B1D00DE661300BF4F15009D472100704B3500AA89A1000000
      000000000000000000000000000000000000FACA9C00F9CB8700FCD28700FCCD
      7D00FCD28800F5B15D00FADDBE00FFFFFE000000000000000000000000000000
      0000FFFCFB00FDF8F4000000000000000000FDF7F200EDAF6C00F4B14C00F1A6
      2B00EFA12300F3A93500E7963800F9E9D900F1FFF000878BD0000000C8005252
      FF004F4FFF005656FF005A5AFF006161FF006565FF006969FF006F6FFF007171
      FF007474FF007676FF007878FF007979FF007A7AFF007B7BFF008A8AFF005959
      FF000000FF000000C800BAC9D800EDFAF0000000000000000000000000000000
      000000000000EAD7CF00C3511A00FEAF7600FFB88500FFB78500FFB68100FFA5
      6200FF842700FE700B00FA610600F95C0600F14F0400BC3301009A8C87000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BF4F1500BF4F1500000000000000000000000000DFB85E00E1C9
      1900FFDE5900FFB43400EE7E1400DA601200CC500D0089400D0074533F00B98A
      9E0000000000000000000000000000000000FBD8B500F8C68100FCD79300FCD0
      8300FCD28700F9C87E00F5B67500FEFBF8000000000000000000000000000000
      0000FCEEE100F5C89C00FDF8F30000000000FBECDD00ECA14A00F5B34A00F1A7
      2D00F1A52900F3AD3F00EAA45400FAEFE300D7E9EC00EEFFEE00A2AFD9000000
      C8006666FF006262FF006666FF006A6AFF007070FF007272FF007676FF007B7B
      FF007E7EFF007F7FFF008181FF008282FF008484FF008584FF008B8BFF009898
      FF000000C800CBD8DD00E8FBEF00D7E8EB000000000000000000000000000000
      000000000000EAD4CC00C14D1A00FDB37D00FFBF9200FFBF9200FFC09300FFC0
      9200FEB88500FD9C5A00FA6F2200F64F0200EF430100BA2F00009A8A85000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BF4F1500E66C1200E66C1200BF4F1500000000000000000000000000DCB5
      5A00E6D03800FDDB4700FFB83700EC801500CE641B00884D25002B2E3C002B2E
      3C00644A5D00000000000000000000000000FDEBDA00F9B96F00FBDEA200FDD3
      8900FDD28600FBD99500F5B36100F9CDA1000000000000000000000000000000
      0000FAE7D400EC8E3100F5C69700FDF9F300F1B27200F2AC4F00F6B54B00F3AA
      3400F3A93200F4B14B00EEB67B00FDF7F1000000000000000000EBFEEF00B6C2
      DD000000C8007979FF007676FF007777FF007A7AFF007E7EFF008181FF008484
      FF008787FF008A8AFF008C8CFF008E8EFF009191FF009898FF00908FFF000000
      C800DAE7E100E3F6EE0000000000000000000000000000000000000000000000
      000000000000E9D3CC00BF491C00FCB88700FEC8A000FEC8A100FEC8A100FFC9
      A200FEC8A100FFCCA500FECAA300FCA77700F1693600B92D0500998985000000
      000000000000000000000000000000000000000000000000000000000000BF4F
      1500E66C1200FBAB2B00FBAB2B00E66C1200BF4F150000000000000000000000
      0000D5AA4C00ECD85000FFE04800EFAC3E00A8866200687079004B708C00395A
      72002B2E3C0060465F000000000000000000FFFDFD00FBB97700F9D39300FCDC
      9A00FED48A00FCD58B00FADC9F00F5AD5800F8C69200FEF9F500000000000000
      0000FBE7D400F19C3E00ED923200ED953E00F1A44B00FAC67300F8BA5B00F7B6
      5400F9BC6000F1AB5400F5D3B000FFFEFE00000000000000000000000000E6F9
      EE00CCD8E3000000C8008988FF008A8AFF008988FF008C8CFF009090FF009191
      FF009494FF009797FF009998FF009B9BFF00A8A8FF008E8DFF00201FE000E3F4
      E600E0F2EC000000000000000000000000000000000000000000000000000000
      000000000000E9D3CC00BD451C00FCBC8F00FFD0AD00FFD0AD00FFCFAD00FFD0
      AD00FFCFAD00FFD0AD00FFD1AF00FFD3B200F8A98600B8321600998985000000
      0000000000000000000000000000000000000000000000000000BF4F1500E66C
      1200FBAB2B00FBAB2B00FBAB2B00FBAB2B00E66C1200BF4F1500000000000000
      000000000000E4BD5B00F7D52900EDD67F009CABB2006595C5005795C8005D91
      BD005C799B002B2E3C0060465F000000000000000000FEE7D000FAAE5A00FBE2
      AA00FED89000FDD58B00FCD79000FADFA400F6B66900FBE2C800000000000000
      0000FBE8D500F6B36000F8C17300F7BD6C00FCD08600F9C16800F8BC6000F8BD
      6000F9C47200EEA75B00FBEFE400000000000000000000000000000000000000
      0000E1F4ED00DBE8E4000000C8009493FF009F9FFF009D9DFF009E9EFF00A2A2
      FF00A3A3FF00A7A7FF00A8A8FF00BBBBFF008584FF002E2DE000EAFDE800DDEF
      ED00000000000000000000000000000000000000000000000000000000000000
      000000000000E9D3CC00BB401F00FCC09A00FFD7BA00FFD7BA00FFD7BA00FFD7
      BA00FFD7BA00FFD7BA00FFD7BA00FFD7BA00F8B19100B6311A00998985000000
      00000000000000000000000000000000000000000000BF4F1500E66C1200FBAB
      2B00FBAB2B00FBAB2B00FBAB2B00FBAB2B00FBAB2B00E66C1200BF4F15000000
      00000000000000000000E0B98000C2C48A00B7D9EB009CCDF4007FC0E90073B9
      E90073A2D000444C52002B2E3C00000000000000000000000000FCC69100FAC5
      7C00FCDFA200FED99200FDDA9500F9D59500F8BA7900FDF6EF00000000000000
      0000FBE8D500F6B56400FBD89500FBD18600FAC67100F9C16900F9C26A00F9C7
      7900F1A95300F5CDA50000000000000000000000000000000000000000000000
      000000000000DEF0ED00E2F4E8000000C8009998FF00B4B4FF00AEAEFF00B2B2
      FF00B3B3FF00B7B7FF00CCCCFF007C7AFF000000C800F1FFEA00DBEDEC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E8D0CC00B93B2100FBC5A600FFDFC900FFDFC900FFE0C900FFE0
      C900FFDFC900FFDFC900FFDFC900FFDFC900F8B89C00B42E1C00998885000000
      000000000000000000000000000000000000E66C1200BF4F1500BF4F1500BF4F
      1500FBAB2B00FBAB2B00FBAB2B00FBAB2B00BF4F1500BF4F1500BF4F1500E66C
      1200000000000000000000000000C0AFB800ABCDE100C5ECF900C1EBFF0092C4
      E10076979B002B2E3C00CA95AA00000000000000000000000000FEF8F300FDC7
      8F00FAC88100FBE1A500FBE2A900F9AD5700FCDCBB0000000000000000000000
      0000FCE8D500F7B86800FBD18700FBC97700FBC87300FAC87700F9CA7D00F1A8
      5000F4C28F00FDF9F50000000000000000000000000000000000000000000000
      00000000000000000000DBEDEC00EAFDE8000000C8009E9CFF00C9C9FF00C2C2
      FF00C4C4FF00DBDBFF00716FFF000000C800F0FFEA00D9EBEC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E8D0CC00B6372300FBCCB200FFE8D700FFE8D700FFE9D700FFE9
      D800FFE8D700FFE9D800FFE8D700FFE8D700F8BFA800B32C1E009A8A87000000
      000000000000000000000000000000000000000000000000000000000000BF4F
      1500FBAB2B00FBAB2B00FBAB2B00FBAB2B00BF4F150000000000000000000000
      0000000000000000000000000000000000009CA9CC00BFD8E000D8E7EA00B1B7
      BD002B2E3C00DCABC5000000000000000000000000000000000000000000FEF6
      F000FCC68D00F9C47C00FAB96800FBB16800FFFBF90000000000000000000000
      0000FCE9D600F8BA6B00FCD28800FCCC7D00FCCF8100FAD49000F3A44B00F2AC
      6500FDF9F4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D9EBEC00E9FBE9000000C800A3A0FF00E0E0
      FF00EAEAFF006B69FD000000C800EBFEEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ECD6D200AE2B1D00F8BEA600FFEAD900FFEAD900FFEAD900FFEA
      D900FFEADA00FFEAD900FFEADA00FFEADA00F3B29B00AC231700AB9E9C000000
      000000000000000000000000000000000000000000000000000000000000BF4F
      1500FBAB2B00FBAB2B00FBAB2B00FBAB2B00BF4F150000000000000000000000
      00000000000000000000000000000000000000000000C8AEB200ABA178002B2E
      3C00E1B2D1000000000000000000000000000000000000000000000000000000
      0000FFF9F400FDC79100FB9E4100FDE5CC000000000000000000000000000000
      0000FCE9D600F9BC6E00FBD78F00FCD18400FCD08300FCD99800F8C77D00F193
      3200F6C59400FFFBF90000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5F9E9000000C8009F9C
      FF006A66FD000000C800E4F8EA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BB635A00B42C1900BB301B00BB301B00BB301B00BB30
      1B00BB301B00BB301B00BB301B00BB301B00B32A1900A5514900E9E8E8000000
      000000000000000000000000000000000000000000000000000000000000BF4F
      1500FBAB2B00FBAB2B00FBAB2B00FBAB2B00BF4F150000000000000000000000
      0000000000000000000000000000000000000000000000000000D3A2AF00E7B2
      CC00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFEFDF00FFFFFE000000000000000000000000000000
      0000FDE9D600F9B36100FAD29000F9D08E00F9CF8B00F9CD8900F9CC8600F6B3
      6100F08E2B00F8CBA000FFFBF500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E0F3EA000000
      C8000000C800E0F2EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F5EBEA00D3A19F00CC929000CC929000CC929000CC92
      9000CC929000CC929000CC929000CC929000D1A09E00E7DBDA00000000000000
      000000000000000000000000000000000000000000000000000000000000BF4F
      1500BF4F1500BF4F1500BF4F1500BF4F1500BF4F150000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDF3E900FBC69100FBC69100FAC59000FAC59000F9C48F00F9C48F00F8C3
      8E00F8C38E00F8CCA000FDF4EA00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DBED
      EC00DAECED000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000600000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF00F7FFFFFFFFFF000000000000F38000FF
      FFFF000000000000018000FF007F000000000000008000FE007F000000000000
      018000FE007F000000000000F3C001FE007F000000000000F7E003FE00FF0000
      00000000F7F007FF81FF00000000000000001FFF81FF00000000000000000FFF
      81FF000000000000000007FF81FF000000000000800007FF81FF000000000000
      800007FF81FF000000000000E00007FF81FF000000000000F83807FF81FF0000
      00000000F0180FFF83FF000000000000F00E3FFFC7FF000000000000E00FFFFF
      C3FF000000000000E00FFFFF81FF000000000000E00FFFFF81FF000000000000
      F00FFFFF81FF000000000000F01FFFFFC7FF000000000000FC3FFFFFFFFF0000
      00000000FFFFFFFFFFFF000000000000F00003FFFFFFFFFFF1FE000FE00003FF
      FFFFFFFFE0FC0007E00003FC001FFFFFC0FC0007E00003F8001FFFFF80F80007
      E00003F8001FFFFF01F00007E00003F8001FFFFE01F00007E00003F8001FFFFC
      03F00007E00003F8001FFFF807E00007E00003F8001FF8000FE00007E00003F8
      001FE0001FE00007E00003F8001FC0003FE00007E00003F8001F8000FFE00007
      E00003F8001F0000FFF20007E00003F8001F0000FFFE0007E00003F8001F0000
      FFFE003FE00003F8001F0000FFFE007FE00003F8000F0000FFFE07FFE00003F0
      000F0000FFF209FFE00003F0000F0000FFF209FFE00003F0001F0000FFF209FF
      E00003FF83FF8001FFF903FFE00003FFC7FF8003FFF9F3FFE00007FFFFFFC007
      FFFC07FFFFFFFFFFFFFFF00FFFFE0FFFFFF3F9800001FFFFFFFFFFFFFFE1F000
      0000FFFFFF000007C1E0E0000000FFFFFF000007E03041000000FFFFFF000003
      E01803000000FCFFFF000003E00C07000000FC7FFF000003F0060F000000FC3F
      FF000001F00007000000FC1FFF000001F80403000000000FE3000001FC084100
      00000007C1000001FE1160000000000380000000FF1230000000000180000000
      FF9C19000000000380000000F9C00F0000000007C1000000F0E007000000000F
      E3000000E07003000000FC1FFF00000FC03801000000FC3FFF00000F801C0100
      0000FC7FFF00000F000E01000000FCFFFF00000FE07F03000000FFFFFF803FFF
      E07F87000000FFFFFFC07FFFE07FCF000000FFFFFFE0FFFFE07FFF000000FFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFFF0000FF8001FFFC1FFFFFFFFF0000FF0
      001FFF81FFFFFFFFF0000FF0001FFF80FFC1FFFFE00007F0001FFE003FE03FFF
      C00003F0001FFC003FE01FFFC00003F0001FFC001FE00FFF800001F0001FE000
      07F007FF80000180000FE00003F003FF007E00000000C00001F801FF00FF0000
      0000000000FC00FF00FF00000000000000FE007F01FF00000000000000FF003F
      01FF00000000800001FF801F00F300000000F8001FF9C00F00F100000000F800
      1FF0E00700F000C00003F8001FE07003003000E00007F8001FC03801803001F0
      000FF8001F801C01C03003F8001FF8001F000E01C07003FC003FF8001FE07F03
      E07007FE00FFF8001FE07F87F0F003FF81FFFC001FE07FCFFCF001FFC3FFFC00
      3FE07FFFFFF001FFE7FFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object FilesRioAction: TActionList
    Images = FilesRioImageList24
    Left = 584
    Top = 488
    object FilesRioRefreshAction: TAction
      Caption = 'Refresh'
      Hint = 'Refresh the list of files'
      ImageIndex = 0
      OnExecute = FilesRioRefreshActionExecute
    end
    object FilesRioDownloadAction: TAction
      Caption = 'Download'
      Hint = 'Download a selected file'
      ImageIndex = 2
      OnExecute = FilesRioDownloadActionExecute
    end
    object FilesRioUploadAction: TAction
      Caption = 'Upload'
      Hint = 'Upload one or more files'
      ImageIndex = 1
      OnExecute = FilesRioUploadActionExecute
    end
    object FilesRioCheckOutAction: TAction
      Caption = 'CheckOut'
      Hint = 'Check-Out a REMOTE file for editing'
      ImageIndex = 3
      OnExecute = FilesRioCheckOutActionExecute
    end
    object FilesRioCheckOutCancelAction: TAction
      Caption = 'Cancel'
      Hint = 'Cancel Check-Out'
      ImageIndex = 4
      OnExecute = FilesRioCheckOutCancelActionExecute
    end
    object FilesRioCheckInAction: TAction
      Caption = 'Check In'
      Hint = 'Check-In a modified file to REMOTE storage'
      ImageIndex = 5
      OnExecute = FilesRioCheckInActionExecute
    end
    object FilesRioSearchAction: TAction
      Caption = 'Search'
      Hint = 'Try to search files using filters'
      ImageIndex = 10
      Visible = False
      OnExecute = FilesRioSearchActionExecute
    end
    object FilesRioHttpLinkAction: TAction
      Caption = 'Link'
      Hint = 'Copy the link to download the selected file from Internet'
      ImageIndex = 11
      OnExecute = FilesRioHttpLinkActionExecute
    end
    object FilesRioMoveAction: TAction
      Caption = 'Move'
      Hint = 'Move the selected file to a different folder'
      ImageIndex = 6
      OnExecute = FilesRioMoveActionExecute
    end
    object FilesRioOwnershipTakeAction: TAction
      Caption = 'Take'
      Hint = 'Take ownership of the selected file'
      ImageIndex = 12
      Visible = False
      OnExecute = FilesRioOwnershipTakeActionExecute
    end
    object FilesRioPropertiesAction: TAction
      Caption = 'Properties'
      ImageIndex = 13
      Visible = False
      OnExecute = FilesRioPropertiesActionExecute
    end
    object FilesRioDeleteAction: TAction
      Caption = 'Remote'
      Hint = 'Delete the selected file from REMOTE folder'
      ImageIndex = 9
      OnExecute = FilesRioDeleteActionExecute
    end
    object FilesLocalDeleteAction: TAction
      Caption = 'Local'
      Hint = 'Delete the selected file from LOCAL folder'
      ImageIndex = 9
      OnExecute = FilesLocalDeleteActionExecute
    end
    object FilesLocalOpenAction: TAction
      Caption = 'Local'
      Hint = 'Open the selected file from LOCAL folder'
      ImageIndex = 8
      OnExecute = FilesLocalOpenActionExecute
    end
    object FilesLocalFolderOpenAction: TAction
      Caption = 'Local'
      Hint = 'Open the local working folder'
      ImageIndex = 7
      OnExecute = FilesLocalFolderOpenActionExecute
    end
  end
  object FilesRioPopup: TPopupMenu
    Left = 480
    Top = 488
    object FilesRioRefreshPopup: TMenuItem
      Action = FilesRioRefreshAction
    end
    object FilesRioDownloadPopup: TMenuItem
      Action = FilesRioDownloadAction
    end
    object FilesRioUploadPopup: TMenuItem
      Action = FilesRioUploadAction
    end
    object FilesRioCheckOutPopup: TMenuItem
      Action = FilesRioCheckOutAction
    end
    object FilesRioCheckOutCancelPopup: TMenuItem
      Action = FilesRioCheckOutCancelAction
      Caption = 'CheckOut Cancel'
    end
    object FilesRioCheckInPopup: TMenuItem
      Action = FilesRioCheckInAction
    end
    object FilesRioSearchPopup: TMenuItem
      Action = FilesRioSearchAction
    end
    object FilesRiohttpLinkPopup: TMenuItem
      Action = FilesRioHttpLinkAction
    end
    object FilesRioMovePopup: TMenuItem
      Action = FilesRioMoveAction
    end
    object FilesRioOwnershipTakePopup: TMenuItem
      Action = FilesRioOwnershipTakeAction
    end
    object FilesRioPropertyPopupFile: TMenuItem
      Action = FilesRioPropertiesAction
    end
    object FilesRioDeletePopup: TMenuItem
      Action = FilesRioDeleteAction
      Caption = 'Remote File Delete'
    end
    object FilesRioLocalDeletePopup: TMenuItem
      Action = FilesLocalDeleteAction
      Caption = 'Local File Delete'
    end
    object FilesRioLocalOpenPopup: TMenuItem
      Action = FilesLocalOpenAction
      Caption = 'Local File Open'
    end
    object FilesRioLocalFolderOpenPopup: TMenuItem
      Action = FilesLocalFolderOpenAction
      Caption = 'Local Folder Open'
    end
  end
  object FileKindImageList24: TImageList
    ColorDepth = cd32Bit
    Height = 24
    Width = 24
    Left = 208
    Top = 264
    Bitmap = {
      494C01010E001800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000006000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000060000001A0000
      0016000000140000001400000012000000100000002200010032000100300001
      003000010030000100300001003000010030000100320000001A000000100000
      001400000014000000140000001A000000160000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C0FFEAA064FF935A
      26FF935A26FF00000000935A26FF935A26FF935A26FF935A26FF935A26FF0000
      0000935A26FF935A26FFEAA064FFC0C0C0FF0F2506C5153409FF133008FF1330
      08FF133108FF133108FF133108FF133108FF133008FF0A27A4FF0F2FA4FF0D2C
      9BFF0D2C98FF0D2A95FF09218BFF0E2607FF112A07FF122E07FF133008FF1331
      08FF133008FF133108FF153509FF0F2707CB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EAA064FF935A26FFC69C
      63FF935A26FF935A26FF935A26FFD3873EFFFDEACFFFD2935DFF935A26FF935A
      26FF935A26FFD6A87CFF935A26FFEAA064FF16370BE5183D0BFF0E64B6FF0E65
      B7FF173C0AFF173C0AFF173C0AFF173C0AFF163909FF1645AEFF0A2F95FF0A2B
      82FF0A2979FF092469FF0E307AFF0C2305FF102806FF143208FF14390AFF173C
      0AFF173D0AFF173D0BFF183D0BFF16380BE50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C0FFEAA064FF935A
      26FF935A26FF00000000935A26FF935A26FF935A26FF935A26FF935A26FF0000
      0000935A26FF935A26FFEAA064FFC0C0C0FF285E14F7245B11FF168FEAFF1791
      EBFF256011FF256011FF256011FF256011FF225910FF2889D4FF1868C8FF165F
      C2FF1351B6FF124AACFF1C54B3FF102B06FF14370AFF1B480CFF205410FF245D
      11FF266011FF255F12FF245C11FF286014F70000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C0FFEAA064FF935A26FF935A26FF935A26FF935A26FF935A26FF935A26FF935A
      26FF935A26FF935A26FF00000000935A26FFCDB594FF935A26FF000000000000
      000000000000000000000000000000000000348219FF2E7416FF1EA8F4FF1DA9
      F5FF2F7B17FF307C17FF307C17FF307C17FF2C7215FF2F9CDEFF1B70D1FF1863
      C8FF124FB8FF114BB4FF1C57B9FF133609FF1B4A0DFF235C11FF296C14FF2E77
      16FF2F7B17FF2F7816FF2E7416FF348219FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EAA0
      64FF935A26FFD3873EFFD99054FFD3873EFFE99439FFEA9537FFF79E2FFFFFA9
      10FFFEAD03FFD3873EFF935A26FF935A26FF935A26FF935A26FF935A26FFEAA0
      64FF000000000000000000000000000000003E8124EF418925FF2DB5F7FF2EB6
      F7FF428E26FF428E26FF428E26FF428D26FF3D8323FF2FA0DEFF196ED0FF155A
      C2FF1353BAFF134EB7FF1E5CBCFF1C4010FF275817FF336D1DFF3C8122FF3F8A
      25FF428E26FF418C25FF418925FF3E8124EF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C0FFEAA064FF935A26FF935A26FF935A26FF935A26FF935A26FF935A26FF935A
      26FF935A26FFFEB414FFF7BB45FFFFEEBDFFFFF2E0FFDD965AFFDE9440FF935A
      26FF000000000000000000000000000000003B6E23D5519933FF3BC0F8FF3CC1
      F8FF519B32FF519B32FF519B32FF509831FF48892CFF277EBFFF1355B1FF104D
      A9FF0F449EFF0F4296FF1A4E9EFF224614FF30631EFF418428FF49912DFF4F99
      31FF529C32FF519A31FF529A33FF3B6E23D50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002565C9FF2565
      C9FF2565C9FF2565C9FF2565C9FF2565C9FF2565C9FF2565C9FF2565C9FF2657
      B7FF00000000935A26FFFECD56FFFFF0C2FFFEF2E0FFDF9E66FFE19A4DFF935A
      26FF00000000000000000000000000000000224214AB4C992EFF49952CFF4A97
      2DFF4A972DFF4A972DFF4A972DFF458D2AFF2F601DFF123564FF09275AFF0922
      50FF081E47FF071E45FF0C284DFF16350FFF2D5E1AFF3B7D23FF428B28FF4794
      2CFF4A972DFF48942CFF4C992EFF224214AB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002565C9FF3EFFFFFF2954
      D1FF0E2C73FF0E2C73FF0E2C73FF0E2D73FF0E2D73FF026FA3FF3AC9E7FF2565
      C9FF2A58A1FF00000000935A26FF935A26FF935A26FF935A26FF935A26FFEAA0
      64FF00000000000000000000000000000000381816AB692A28FF5F2523FF5E24
      23FF5E2423FF5E2323FF5E2323FF511E1EFFA09CB1FFF3F2FFFFDADEEBFF7C79
      76FF7D7975FFDADEEBFFF2F0FFFF9490A5FF321212FF4A1C1BFF54201FFF5B23
      22FF5E2423FF5F2523FF692A28FF381616AB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002565C9FF3EFFFFFF2954
      D1FF0ADCF6FF02ABD9FF02ABD9FF02AFDBFF03FFFFFF026FA3FF3AC9E7FF2565
      C9FF2E5AA0FF0000000000000000935A26FFECCE83FF935A26FF000000000000
      000000000000000000000000000000000000612726D57A2E2DFF1486DCFF1386
      DCFF772A2AFF772A2AFF772A2AFF622222FFFBFBFBFF8B8B8BFF686868FFAFAC
      AAFFAAA6A4FF686868FF8B8B8BFFF2F1F1FF3D1515FF5D2121FF6A2525FF7129
      29FF752A29FF752B2AFF782E2DFF612726D50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002565C9FF3EFFFFFF2954
      D1FF04D6EDFF0178C8FF0178C8FF0087CEFF03FDFFFF026FA3FF39C8E6FF2565
      C9FF2E5AA0FF0000000000000000935A26FFECCE83FF935A26FF000000000000
      000000000000000000000000000000000000843231EF82302EFF1595F3FF1596
      F3FF842F2DFF842F2DFF842F2DFF6B2725FFF1F0F0FF1A3E81FF0C3172FFBCBA
      BCFFA39F9EFF0C2C5BFF19365EFFE6E5E5FF471918FF692524FF782B29FF802E
      2CFF842F2DFF842F2DFF82302EFF843231EF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002565C9FF3EFFFFFF2954
      D1FF026FA3FF026FA3FF026FA3FF026FA3FF026FA3FF026FA3FF41D1EDFF2565
      C9FF2E5AA0FF00000000935A26FF935A26FF935A26FF935A26FF935A26FF0000
      000000000000000000000000000000000000B2504CFF99403EFF1DAAF6FF1CAB
      F6FF9D413EFF9D413EFF9E413FFF873634FFE8E5E5FF134294FF103B96FF9A98
      A0FF666065FF0E357AFF0F346CFFDEDADAFF622423FF8F3837FF953C3AFF9A3E
      3DFF9D413FFF9D413FFF9A403EFFB2504CFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002565C9FF3EFFFFFF3CF2
      FAFF3CF2FAFF3CF1FAFF3BE6F5FF3BE6F5FF38D9EDFF39DAEEFF37D4E9FF2565
      C9FF2E5AA0FF0000000000000000935A26FFECCE83FF935A26FF000000000000
      000000000000000000000000000000000000B5615BF7B25351FF28BCF7FF28BD
      F7FFB35451FFB35452FFB35452FFA24846FFC4B5C1FF226EC8FF1A6ECFFF1A63
      C7FF185FC4FF165DC2FF1B4EAFFFB6A8B4FF853533FFA74945FFAD4F4CFFB153
      50FFB45653FFB35552FFB25351FFB45E5BF70000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002565C9FF3EFFFFFF2954
      D1FF1D97EBFF1D97EBFF1D97EBFF1D97EBFF1C97EBFF026FA3FF39D8EDFF2565
      C9FF2E5AA0FF00000000935A26FF935A26FF935A26FF935A26FF935A26FF0000
      000000000000000000000000000000000000A05F5DE5BE6563FF36C7F8FF36C8
      F8FFBF6664FFBF6664FFBF6664FFB85D5BFF4A3941FF30A0DFFF28A2E1FF37B5
      E8FF35ACE4FF238FDDFF2671CFFF47343BFF964341FFB35755FFBB5E5DFFBF65
      63FFC06765FFBF6563FFBF6764FFA1605DE50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002565C9FF3EFFFFFF2954
      D1FF019AD6FF0E2C73FF0E2C73FF0E2C73FF04FFFFFF026FA3FF38D7ECFF2565
      C9FF2E5AA0FF0000000000000000935A26FFECCE83FF935A26FF000000000000
      000000000000000000000000000000000000784C4CC5C97573FFC76E6DFFC870
      6FFFC8706FFFC8706FFFC8706FFFC56D6CFFB46261FF2B8FD8FF1E83D6FF1B4F
      B0FF1B4FB0FF1B73D0FF2060C4FF994543FFA24C4AFFBC5F5CFFC66A67FFC86F
      6CFFC9726FFFC8706DFFCA7674FF794E4CC50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002565C9FF3EFFFFFF2954
      D1FF026FA3FF026FA3FF026FA3FF026FA3FF026FA3FF026FA3FF3BE4F3FF2565
      C9FF2E5AA0FF00000000935A26FF935A26FF935A26FF935A26FF935A26FF0000
      000000000000000000000000000000000000140A46C5190C61FF180D61FF1A0D
      63FF1A0D62FF1A0D61FF1A0D61FF1A0D61FF180C59FF2F9ADDFF218ADAFF1F89
      D9FF1C7BD2FF1B75D0FF2369CCFF10083EFF110842FF150C54FF170C5BFF180D
      60FF1A0D63FF190D61FF190C61FF140A46C50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002565C9FF26BDCCFF28C1
      CEFF28C1CEFF28C1CEFF27BDCBFF28B7C9FF28B7C9FF27B6C8FF39E0F0FF2565
      C9FF2E5AA0FF0000000000000000935A26FFE5B966FF935A26FF000000000000
      000000000000000000000000000000000000221273E522127EFF0F6ABCFF0F6B
      BDFF251486FF251486FF251486FF251484FF22127AFF319FE1FF218EDBFF2088
      D7FF1D7DD3FF1B77D0FF2471D4FF170C53FF1B0F63FF201276FF23137DFF2414
      83FF251487FF241384FF22127EFF221273E50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000466ACBFF2565C9FF2565
      C9FF2565C9FF2565C9FF2565C9FF2565C9FF2565C9FF2565C9FF2565C9FF2463
      C9FF2E5AA0FF00000000935A26FF935A26FF935A26FF935A26FF935A26FFEAA0
      64FF00000000000000000000000000000000321BAFF72E18ABFF1699E4FF179B
      E4FF331AB0FF3219B0FF3219B0FF3219AFFF2F17A2FF3DB6F8FF31AEE4FF27A3
      DFFF2698DDFF2792DAFF2F9FF7FF201080FF271496FF2C16A6FF3017ABFF331A
      AFFF331AB1FF311AAFFF2F18ABFF331BAFF70000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000036D9E7FF36E0
      EDFF35D6E8FF36CEE4FF35C7E1FF36B8DAFF34B0D6FF31A7D0FF319BCBFF298F
      C8FF00000000935A26FFEAB746FFF2E6B6FFF1E3D4FFDF9A5FFFE4953FFF935A
      26FF00000000000000000000000000000000391EC4FF2F19BAFF17A5F4FF17A8
      F5FF321ABFFF321ABFFF321BBEFF321BBDFF2E18AFFF2CABDBFF53D8FFFF3ABD
      ECFF36B7EAFF4ACFFFFF229DD0FF201191FF2816AAFF2D18B7FF311ABEFF321B
      BFFF341BC0FF331ABDFF2F19BBFF391EC6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C0FFEAA064FF935A26FF935A26FF935A26FF935A26FF935A26FF935A26FF935A
      26FF935A26FFFDBD0AFFFFC845FFFFF7CBFFFDF3E8FFE99F64FFEB9A40FF935A
      26FF00000000000000000000000000000000391FAFEF381EC2FF1AAEF6FF1BB1
      F6FF3C20C5FF3C20C4FF3C20C4FF3C20C3FF371DB5FF2172BAFF29A0D7FF60E9
      F9FF5CEAF8FF269CD1FF184EACFF261597FF311AB2FF3A1FC1FF3C20C4FF3C20
      C5FF3C20C5FF3A1FC2FF381EC3FF391FB1EF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EAA0
      64FF935A26FFD3873EFFEAA064FFEB974BFFFDA541FFFDA740FFFFB237FFFFBA
      13FFFFC209FFFFC006FF935A26FF935A26FF935A26FF935A26FF935A26FFEAA0
      64FF000000000000000000000000000000005A4397D57D5BDCFF53CFFAFF54D0
      FAFF7C5ADEFF7C5ADEFF7C5ADEFF7C5ADDFF7353CDFF54D0EEFF2A8EC6FF2071
      B5FF1F72B6FF2589C6FF3DB6E9FF523CB1FF6E4FD0FF7C5ADCFF7C5ADEFF7C5A
      DEFF7B5ADEFF7858DCFF7D5BDDFF5A4397D50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C0FFEAA064FF935A26FF935A26FF935A26FF935A26FF935A26FF935A26FF935A
      26FF935A26FF935A26FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000351E64ABA772EAFFB382EDFFB584
      EDFFB584EDFFB584EDFFB587EDFFB587EDFFAB80E0FF39C2EBFF53D0F0FF4FCB
      EFFF49C4EDFF47C1EAFF30A2E1FF966ACBFFAE82E5FFB486ECFFB587EDFFB587
      EDFFB587EDFFB283EDFFAC7BEBFF382464AB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083413EFF7D3734FF7C36
      32FF7A3531FF793430FF79332FFF78322EFF77322DFF76322CFF76302BFF752F
      2BFF752F2AFF742E2AFF742E29FF742E29FF732D28FF732D28FF732D28FF732D
      28FF732D28FF732D28FF834440FF00000000000000000000000000000000C1C1
      C1FF747474FF747474FF747474FF747474FF747474FF747474FF747474FF7474
      74FF747474FF747474FF747474FF747474FF747474FF747474FF747474FF7474
      74FFC1C1C1FF000000000000000000000000C0C0C0FF0000000000000000C0C0
      C0FFC0C0C0FFC0C0C0FF000000000000000000000000C0C0C0FFC0C0C0FFC0C0
      C0FF0000000000D2FCFF2ACBF6FF3AAAF1FF1ED5FAFF1FD0FBFF22BEFBFF0000
      0000000000000000000000000000C0C0C0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000803936FF823B38FF8039
      36FF7D3733FF7C3531FF7A342FFF79322EFF77312CFF76302BFF752D29FF742C
      28FF732C27FF732B26FF722A26FF712A25FF712924FF702824FF702823FF7028
      23FF702823FF702823FF783530FF000000000000000000000000000000007474
      74FFFEFEFEFFF6F6F6FFF2F2F2FFF1F1F1FFECECECFFE9E9E9FFE4E4E4FFE1E1
      E1FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FF747474FF000000000000000000000000C0C0C0FF0000000000000000C0C0
      C0FFC0C0C0FFC0C0C0FF000000000000000000000000C0C0C0FFC0C0C0FFC0C0
      C0FF0CCBFCFF11C7FCFF18CFFCFF1AD5FCFF15C5FCFF24C2FBFF25BDFBFF22C5
      FBFF22D9FBFF0000000000000000C0C0C0FF00000000000000000000FFFF0E0E
      FFFF2A2AFFFF1B1BFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF000000000000000000000000813C38FF843E3BFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF702823FF783530FF000000000000000000000000000000007474
      74FFFEFEFEFFF6F6F6FFCBCBCAFF979797FF949494FF9C9C9CFFE3E3E3FFE1E1
      E1FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FF747474FF000000000000000000000000C0C0C0FF0000000000000000C0C0
      C0FFC0C0C0FFC0C0C0FF000000000000000000000000C0C0C0FF00D2FCFF00D2
      FCFF2ACBF6FF3AAAF1FF1ED5FAFF1FD0FBFF22BEFBFF26BCFBFF21BFFBFF1ED3
      FCFF15C5FCFF0CCBFCFF00000000C0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF000000000000000000000000833E3AFF87413EFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF702823FF783530FF000000000000000000000000000000007474
      74FFFEFEFEFFF6F6F6FFC7C6C5FF956244FF6A6968FF656565FFCECECEFFE1E1
      E1FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FF747474FF000000000000000000000000C0C0C0FFC0C0C0FFC0C0C0FF0000
      00000000000000000000C0C0C0FFC0C0C0FFC0C0C0FF00D3FCFF00D2FCFF00D2
      FCFF2ACBF6FF3AAAF1FF1ED5FAFF1FD0FBFF22BEFBFF26BCFBFF21BFFBFF1ED3
      FCFF15C5FCFF0CCBFCFFDDF1FDFFC0C0C0FF00000000000000000000FFFF0000
      FFFF1414FFFF6060FFFF6262FFFF1111FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF00000000000000000000000085403CFF8A4441FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF712924FF793631FF000000000000000000000000000000007474
      74FFFEFEFEFFDCDADAFFDBD8D8FFDAD7D7FFEBEBEBFFD8D8D8FF616060FF7977
      77FFB5B2B2FFD0CCCCFFD0CCCCFFD1CCCCFFD1CCCCFFD0CDCCFFCDC7C7FFE1E1
      E1FF747474FF000000000000000000000000C0C0C0FFC0C0C0FFC0C0C0FF0000
      00000000000000000000C0C0C0FFC0C0C0FFC0C0C0FF00000000BBF9FEFF00D3
      FCFF08CDFCFF10C8FCFF22D0FAFF2CCAF9FF1B378DFF1A1779FF181875FF24BC
      FBFF1CC1FCFF27D0F8FF08D7FCFFC0C0C0FF00000000000000000000FFFF0000
      FFFF8C8CFFFFCDCDFFFFD1D1FFFFA2A2FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF00000000000000000000000087423FFF8D4745FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4D8DBFFAE7981FFA33C
      44FFA33C44FFAE7981FFE4D8DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF712924FF793631FF000000000000000000000000000000007474
      74FFFEFEFEFF1B0000FF1E0000FF180000FFDEDEDEFFD2D2D2FF8D8C8CFF3F33
      32FF120000FF200000FF2B0200FF290000FF2F0100FF2D0000FF2A0000FFE1E1
      E1FF747474FF000000000000000000000000C0C0C0FFC0C0C0FFC0C0C0FF0000
      0000000000004249B7FFC0C0C0FFC0C0C0FFE7F4FBFF0F0FADFF0E1AB2FF00D2
      FCFF0ACCFCFF14C6FCFF1FBFFBFF1E3797FF1D1A8CFF1E1B91FF1C1986FF1916
      76FF1FC0FBFF0CCAFCFF22D0F8FFC0C0C0FF00000000000000000000FFFF0000
      FFFFB7B7FFFFC5C5FFFF9696FFFFDCDCFFFF7777FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0D0DFFFF4242FFFF2E2EFFFF0000
      FFFF0000FFFF0000FFFF000000000000000000000000894442FF904B49FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFCFC2C5FFA36063FF9C26
      35FF9C2635FFA36063FFCFC2C5FFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF712A25FF793631FF000000000000000000000000000000007474
      74FFFEFEFEFF3A0700FF290000FF230000FF2E1A1AFFA4A1A1FFA7A7A7FFE0E0
      E0FF2317C0FF230300FF320600FF370000FF2E0000FF3B0000FF400000FFE1E1
      E1FF747474FF000000000000000000000000C0C0C0FF000000000F0FADFF7E8E
      C3FF1F21B1FF1010AEFF0000000000000000F4F9FAFF0F0FADFF0C37BDFF00D2
      FCFF0BCBFCFF15C5FCFF21BFFBFF1C1F88FF1F1C95FF221EA2FF1E1A8DFF1A17
      7BFF23C9FBFF25CDF9FF39ACF1FFC0C0C0FF00000000000000000000FFFF0000
      FFFF7D7DFFFFD2D2FFFFC6C6FFFFECECFFFFCACAFFFF4040FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF4F4FFFFFB3B3FFFFC9C9FFFFBEBEFFFF6A6A
      FFFF0000FFFF0000FFFF0000000000000000000000008B4644FF934F4DFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F0F1FFB19498FF9B3035FFA146
      54FFA14654FF9B3035FFB19498FFF2F0F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF722A26FF793632FF000000000000000000000000000000007474
      74FFFEFEFEFF45120BFF440800FF320000FF270000FF240000FF643A27FF2317
      C0FF2317C0FF2317C0FF2317C0FFDACCB8FFFDF9F0FFFFF6FBFFFBE2CBFFE1E1
      E1FF747474FF000000000000000000000000C0C0C0FF000000000F0FADFF0F0F
      AEFF1111B1FF1212B2FFB7D8FAFF5187EEFF9696DDFF1111B0FF348CEBFF3382
      EEFF15D4FBFF15C5FCFF1FBFFBFF29C8F7FF1E1A90FF201C97FF1D1989FF247A
      C1FF22CFFBFF14C6FCFF0ACCFCFFC0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF7979FFFFB6B6FFFFDBDBFFFFF0F0FFFFD4D4FFFFA7A7FFFF8787
      FFFF7676FFFF4646FFFF4A4AFFFFC3C3FFFFC8C8FFFF7979FFFFCBCBFFFFB4B4
      FFFF0000FFFF0000FFFF0000000000000000000000008D4A47FF975351FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFEFFDDD6D9FFA26A6DFF9E2431FFA35A
      67FFA35A67FF9E2431FFA26A6DFFDDD6D9FFFDFDFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF732B27FF7A3732FF000000000000000000000000000000007474
      74FFFEFEFEFF895B43FF7D4E31FF82523CFFD7C9C1FFDAB598FFE6C9BDFFE1CC
      C6FF69668CFF2317C0FF1E11CCFF2317C0FFB58B63FFFFFFFFFFEFC49AFFE1E1
      E1FF747474FF000000000000000000000000C0C0C0FF000000008FC7DFFF1215
      B3FF1313B5FF1414B8FF2124D0FF2121D0FF1414B7FF224ED1FF2525D7FF11C2
      FBFF1010B0FF0F0FAEFF1627B8FF25BCFBFF2BBDFBFF2BB9FBFF34B3FBFF28CE
      FCFF24BDFBFF1FD2FCFF64BCF3FFC0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF3B3BFFFF9B9BFFFFEBEBFFFFD6D6FFFFCBCB
      FFFFD1D1FFFFC1C1FFFFD5D5FFFFF4F4FFFFBCBCFFFFAAAAFFFFD1D1FFFF9A9A
      FFFF0000FFFF0000FFFF000000000000000000000000904C4AFF9A5756FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7F8FFBAA6AAFF9A3538FFA44551FFB98A
      92FFB98A92FFA44551FF9A3538FFBAA6AAFFF8F7F8FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF742C28FF7A3733FF000000000000000000000000000000007474
      74FFFEFEFEFFCA7937FFC26622FFBE590EFFC97534FFCC7838FFCB7434FFE1A5
      78FFDA884AFFC17A4CFF2317C0FF1F13C7FF2317C0FF8E5F40FFC9834DFFE0E0
      E0FF747474FF000000000000000000000000C0C0C0FFC0C0C0FF81C0E3FF2121
      D0FF1A2BC2FF1717BCFF1D1DC9FF1D1DC9FF1616BCFF2020CFFF2637D8FF1414
      B6FF1212B3FF1010B0FF15C9FAFF1CC1FCFF20DEFCFF20BFFBFF2EB7FBFF28BA
      FBFF20CAFBFF18C4FCFF14CCFCFFC0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF1111FFFFB8B8FFFFB9B9FFFF4747
      FFFF6161FFFFC9C9FFFFE4E4FFFFB6B6FFFFBABAFFFFBDBDFFFF9898FFFF2828
      FFFF0000FFFF0000FFFF000000000000000000000000924F4DFF9E5C5BFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFE7E3E5FFA07176FF9E222BFFA95D69FFC8AA
      AFFFC8AAAFFFA95D69FF9E222BFFA07176FFE7E3E5FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFF752D29FF7B3834FF000000000000000000000000000000007474
      74FFFEFEFEFFC97735FFBD5605FFCB7938FFCB7434FFC76926FFDA8F5EFFE19E
      72FFE8A883FFE8A67CFFE2A072FF2317C0FF2317C0FF2317C0FF80563AFFBBBB
      BBFF747474FF000000000000000000000000C0C0C0FF2D6AE4FF2F5CE1FF1E1E
      CAFF1C1CC6FF1C28C7FF1919C1FF1A1AC2FF191AC1FF1D1DC9FF1717BDFF285E
      DCFF1313B5FF28A7EAFF0CCBFCFF14C7FCFF1BD7FCFF15C5FCFF26C2FBFF23BD
      FBFF22D8FBFF13C7FCFF0ECAFCFFC0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF4D4DFFFFCFCFFFFF7D7D
      FFFF4F4FFFFFD0D0FFFF9090FFFF0000FFFF1B1BFFFF1414FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF000000000000000000000000955250FFA36060FFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFFC5B7BBFF983E42FFA5414BFFAD6D78FFD0B5
      BAFFD0B5BAFFAD6D78FFA5414BFF983E42FFC5B7BBFFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFF76302BFF7C3934FF000000000000000000000000000000007474
      74FFFEFEFEFFB14700FFB34F06FFB75310FFB95918FFBB5F20FFC76F39FFCB74
      40FFCD7944FFDC976AFFDE9669FFE2996BFFE0A27AFF2317C0FF2317C0FF2317
      C0FF818181FF000000000000000000000000C0C0C0FF1414B7FF1F1FCCFF1B1B
      C4FF2861DCFF1616BAFF171DBCFF1619BAFF1718BCFF1E2DC9FF1C1CC7FF1F20
      CDFF1313B4FF1111B1FF0F0FADFF3AA9F0FF0FD4FCFF09CCFCFF3AABF1FF1BC2
      FCFF16C5FCFF78C0E0FF34B6F0FFC0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF8D8DFFFFD2D2
      FFFFBFBFFFFFBABAFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF000000000000000000000000985554FFA76565FFFFFF
      FFFFFFFFFFFFFEFEFEFFEFEDEEFFA17D82FF9E292FFFA7535FFFB88991FFDDC8
      CCFFDDC8CCFFB88991FFA7535FFF9E292FFFA17D82FFEFEDEEFFFEFEFEFFFFFF
      FFFFFFFFFFFF78312DFF7C3935FF000000000000000000000000000000007474
      74FFFEFEFEFFAF4B07FFB15316FFB25517FFB96128FFBF6834FFCD8051FFD58C
      62FFDD9A73FFE4A17DFFE7A682FFDC8D5FFFD78654FF915437FF2317C0FF2A1F
      C4FF2317C0FF9A9A9AFF0000000000000000C0C0C0FF8ABFF7FF3F57D3FF1B23
      C4FF1515B9FF3093ECFF34C0FBFF36BAFBFF3AB0FBFF1717BDFF254DD7FF1616
      BCFF1313B6FF0F31BEFF2EC3F3FF3AA8EEFF0AD8FCFF02D1FCFF3AA9EFFF16C8
      FCFF11C8FCFF3BA7ECFFC0C0C0FFC0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFD9D9
      FFFFEDEDFFFF3030FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000000000000000000000009B5958FFAC6B6BFFFFFF
      FFFFFEFEFEFFFDFDFDFFCFC7CAFF964C4EFFA43C45FFA8626EFFC7A9AEFFE9DF
      E1FFE9DFE1FFC7A9AEFFA8626EFFA43C45FF964C4EFFCFC7CAFFFDFDFDFFFFFF
      FFFFFFFFFFFF79332EFF7D3A36FF000000000000000000000000000000007474
      74FFFEFEFEFFAB4B0DFFB76231FFB86231FFB05519FFBB6530FFCD855AFFDC9C
      77FFE6A88AFFF8D0BBFFF7D1BCFFEEBA9EFFE8B393FFDF966AFFC37950FF2317
      C0FF2317C0FF2317C0FFCFCFCFFF00000000C0C0C0FF1F1FCDFF1C1CC6FF1717
      BDFF1416B7FF2FCBFBFF29D9FCFF2DD0FCFF35BCFBFF2960DDFF213CCFFF202D
      CEFF242FD5FF2D5EE5FFB0D7DDFF3BA7ECFF13DEFAFF00D2FCFF3AA8EDFFEDF9
      FEFF0CCBFCFF3BA7EBFFC0C0C0FFC0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF1212FFFFDDDD
      FFFFE8E8FFFF4747FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000000000000000000000009E5C5BFFB07172FFFFFF
      FFFFFDFCFCFFFBFAFAFFAD9196FF9D3134FFA34451FFB7868EFFDCCACDFFF3EE
      EFFFF3EEEFFFDCCACDFFB7868EFFA34451FF9D3134FFAD9196FFFBFAFAFFFFFF
      FFFFFFFFFFFF7B3530FF7E3C37FF000000000000000000000000000000007474
      74FFFEFEFEFFB3693EFFB86A43FFB36235FFB9683CFFB76437FFCB8459FFE4A8
      8AFFEEB99FFFEFB89CFFF1B89DFFF8DACAFFF9E9DCFFFDF8F4FFFCF8F1FFE1E1
      E1FF9F9FA1FF2317C0FF2317C0FF808084FFC0C0C0FF1616BAFF1818BFFF275A
      DAFF1414B6FF29D8FCFF20EEFCFF27DFFCFF31C6FBFF2658D8FF1A1AC2FF1717
      BDFF1414B7FF1212B3FF6769C9FF0000000000000000C0C0C0FF3BA6EBFFC0C0
      C0FF000000007DC3F0FF00000000C0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF9999FFFFD3D3
      FFFFC6C6FFFFB3B3FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF000000000000000000000000A1605FFFB57677FFFFFF
      FFFFFCF9FAFFFBF9F9FFAF8588FFAC6064FFB0767EFFD6C1C6FFF6F2F3FFFEFE
      FFFFFEFEFFFFF6F2F3FFD6C1C6FFB0767EFFAC6064FFAF8588FFFBF9F9FFFFFF
      FFFFFFFFFFFF7D3633FF813C3AFF000000000000000000000000000000007474
      74FFFEFEFEFFBE7956FFB66D49FFAF6034FFAD592AFFB6683CFFC67B56FFDD9F
      81FFE6AC90FFF2BBA3FFF4C1A9FFF9EFE3FFFFFFFFFFFFFFFFFFFEFDFCFFE1E1
      E1FF747474FF000000002317C0FF2317C0FFC0C0C0FF1515BAFF1E23CAFF1818
      BFFF234ED1FF1634BEFF27DFFCFF2BD4FCFF31B2F5FF1616BBFF1A1AC2FF285D
      DCFF1414B6FF1212B2FF1010AEFF5A5AC7FF00000000C0C0C0FFC0C0C0FFC0C0
      C0FF000000000000000000000000C0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFCDCDFFFF9090
      FFFF8686FFFFCFCFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF000000000000000000000000A56464FFBB7D7EFFFFFF
      FFFFFCFBFBFFFDFDFDFFDFD1D5FFD0B7BAFFD8C7C9FFECE5E7FFF8F5F6FFFFFF
      FFFFFFFFFFFFF8F5F6FFECE5E7FFD8C7C9FFD0B7BAFFDFD1D5FFFDFDFDFFFFFF
      FFFFFFFFFFFF803935FF813E3AFF000000000000000000000000000000007474
      74FFFEFEFEFFB26C4CFFAE6742FFAD6641FFB46B47FFB0653EFFB56942FFBA6E
      47FFE0A68AFFEEB59AFFFAE3D4FFFCFBF4FFFEFFFFFFFBF4ECFFFBF2EAFFE1E1
      E1FF747474FF000000000000000000000000C0C0C0FF2121D1FF1F21CCFF2449
      D3FF1616BBFF295BDDFF192BBFFF1313B4FF1515B8FF244ED4FF285DDCFF1F1F
      CBFF2F62E1FF3034B7FF0F0FAEFFE3E3F5FF00000000C0C0C0FFC0C0C0FFC0C0
      C0FF000000000000000000000000C0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFC7C7FFFFA9A9
      FFFFA8A8FFFFC8C8FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF000000000000000000000000A86868FFC08588FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF823B38FF833F3CFF000000000000000000000000000000007474
      74FFFEFEFEFFA55B38FFA2542DFFAD6643FFD89F87FFDDA891FFBD7755FFC580
      5FFFD19272FFF2BBA3FFFAD7C9FFF9E9E0FFFBF5ECFFFFFFFFFFFFFFFFFFE1E1
      E1FF747474FF000000000000000000000000C0C0C0FF1414B6FF93C7F8FF1C1C
      C7FF2656D8FF254DD6FF213ECEFF1818BEFF1B1DC3FF1C1CC6FF202ACEFF1414
      B7FF1C1CB6FF00000000C0C0C0FFC0C0C0FFC0C0C0FF00000000000000000000
      0000C0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF8282FFFFCCCC
      FFFFCDCDFFFF8282FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF000000000000000000000000AC6C6CFFC68C8EFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF843F3BFF84403DFF000000000000000000000000000000007474
      74FFFEFEFEFF9B4B23FF9D5129FFAB6341FFCD9177FFCF9278FFC27D5FFFF3C4
      B2FFE1AA94FFEDB69FFFF8D2C3FFF6BBA7FFFCEFE7FFFFFFFFFFFFFFFFFFE1E1
      E1FF747474FF000000000000000000000000C0C0C0FF000000002222D2FF2964
      DDFF1717BCFF2753DAFF285ADAFF1C1FC6FF2759D9FF203ECBFF2121CFFF1F3D
      C8FF1111B0FF1A1AB2FFC0C0C0FFC0C0C0FFC0C0C0FF00000000000000000000
      0000C0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF4C4C
      FFFF4F4FFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF000000000000000000000000B07172FFCC9396FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF87413EFF85433FFF000000000000000000000000000000007474
      74FFFEFEFEFF8F3E19FF964E2EFF9E573AFF9F5839FFA35C3CFFD7A593FFFFFF
      FFFFF8DBD2FFF9E3DAFFFDFCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1
      E1FF747474FF000000000000000000000000C0C0C0FF00000000BDE4FDFF1414
      B6FF1515B8FF1F20CDFF1A26C1FF2B61E0FF2953DCFF1414B7FF1414B7FFC0C0
      C0FF6B6BCDFF0F0FADFFC0C0C0FFC0C0C0FFC0C0C0FF00000000000000000000
      0000C0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF000000000000000000000000B47677FFD39CA0FFCE95
      98FFC88F92FFC4898CFFBF8385FFBA7C7DFFB67779FFB17273FFAD6D6EFFA968
      68FFA56363FFA25F5FFF9E5C5BFF9B5756FF985452FF95514FFF924D4BFF8F4A
      48FF8C4745FF8A4442FF874541FF000000000000000000000000000000007474
      74FFFEFEFEFFF6F6F6FFF3F3F3FFF1F1F1FFECECECFFE9E9E9FFE4E4E4FFE1E1
      E1FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FF747474FF000000000000000000000000C0C0C0FF00000000000000000000
      00001414B6FF1515B8FF1F20CDFF1A26C1FF2B61E0FF2953DCFF00000000C0C0
      C0FFC0C0C0FFC0C0C0FF000000000000000000000000C0C0C0FFC0C0C0FFC0C0
      C0FF000000000000000000000000C0C0C0FF00000000000000000000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF000000000000000000000000A96F6EFFB67A7BFFB376
      77FFAF7272FFAC6F6FFFAB6B6BFFA76968FFA46564FFA16261FF9F605EFF9D5C
      5BFF9A5A58FF985856FF965553FF945351FF92504EFF904E4CFF8F4C4AFF8D4B
      48FF8B4946FF894744FF915552FF00000000000000000000000000000000C1C1
      C1FF747474FF747474FF747474FF747474FF747474FF747474FF747474FF7474
      74FF747474FF747474FF747474FF747474FF747474FF747474FF747474FF7474
      74FFC1C1C1FF000000000000000000000000C0C0C0FF00000000000000000000
      000000000000C0C0C0FFC0C0C0FFC0C0C0FF000000000000000000000000C0C0
      C0FFC0C0C0FFC0C0C0FF000000000000000000000000C0C0C0FFC0C0C0FFC0C0
      C0FF000000000000000000000000C0C0C0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
      C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000935433FF8E4C28FF8C49
      27FF8B4825FF8B4724FF8A4623FF894522FF884421FF884320FF87431FFF8742
      1EFF86411EFF86411DFF85401DFF85401CFF85401CFF85401CFF843F1BFF843F
      1BFF843F1BFF843F1BFF915332FF00000000000000003D8359FF337C51FF317B
      50FF30794FFF2F784EFF2E784DFF2D774CFF2C764CFF2B754CFF2A754AFF2A74
      49FF297449FF297348FF287348FF287348FF277247FF277247FF277247FF2772
      47FF277247FF277247FF3F835BFF00000000000000002747BDF3254CD1FD294C
      CEFA274ACFFB2548CEFB2346CEFB2245CEFB2144CDFB2042CDFB1F41CDFB1E40
      CDFB1D40CDFB1D3FCDFB1C3ECDFB1C3ECCFB1B3DCCFB1B3DCCFB1B3DCCFB1B3C
      CDFB193CCCFA0D38D3FF1B3AB6EE0000000000000000553175E75A2E7FF8572B
      7EF854277CF853257BF852247AF8512378F8512278F84F2177F84F2076F84E1F
      76F84E1F75F84D1F75F84D1E74F84C1C74F84C1C74F84C1B74F84B1B73F84B1B
      72F84C1E73F84D2074F850306ADB00000000000000008F4D2BFF924F2DFF904D
      2BFF8E4B28FF8D4926FF8C4724FF8A4522FF894420FF88421FFF87411DFF8640
      1CFF853F1BFF853E1AFF843D19FF833D18FF833C18FF823C17FF823B16FF823B
      16FF823B16FF823B16FF894724FF0000000000000000358053FF378255FF3580
      53FF327C51FF307B4FFF2E794EFF2D784CFF2B764BFF2A754AFF287448FF2773
      47FF267247FF257246FF257145FF247045FF237044FF236F43FF226F43FF226F
      43FF226F43FF226F43FF2F774EFF00000000000000002A50D2FD4168E3FF5383
      E4FF4E78E3FF4E75E2FF4E74E2FF4D71E2FF4D70E2FF4D6EE2FF4D6CE2FF4D6B
      E2FF4D69E2FF4D69E2FF4D67E2FF4D67E1FF4D66E1FF4C64E1FF4C63E1FF4C64
      E1FF4D6EE2FF2550DFFF143AC7F800000000000000005B3182F863368EFF653A
      8FFF673D90FF653C8FFF66418FFF67438FFF653F8DFF603689FF5E3488FF5D33
      87FF5C3286FF5C3185FF5B3085FF5A3084FF5A2F83FF5A2F83FF592F83FF592F
      83FF54267DFF4E1D78FF4E2771EE0000000000000000914F2DFF945230FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF823B16FF894724FF0000000000000000378155FF3A8457FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF226F43FF2F774EFF00000000000000003154D0FA638AE5FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4D67E2FF203FC5F500000000000000005B3283F8693F95FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA587BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF53237CFF4D2570ED0000000000000000935130FF975534FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF823B16FF894724FF0000000000000000398357FF3D875AFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF226F43FF2F774EFF00000000000000003458D1FB5286E4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4951E0FF2341C5F600000000000000005D3285F870489AFFFFFF
      FFFFFFFFFFFFDBD2E6FFA68BB8FF7C4D94FFA37CABFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF562881FF4C2370ED0000000000000000945332FF995838FFFFFF
      FFFFFFFFFFFFC8A18FFFB0795FFFAE795FFFE1C7BDFFFFFFFFFFFFFFFFFFAB76
      5CFFAA755BFFA9745AFFD3B3A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF833C17FF8A4725FF00000000000000003B8559FF408A5DFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFB5C1B3FFA7B7A6FFA7B7A6FFA7B7A6FFA7B6
      A5FF93B09AFF237044FF30784FFF0000000000000000385CD1FB608CE5FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4A53E0FF2240C5F600000000000000005F3587F8734A9CFFFFFF
      FFFFFFFFFFFFB09FC6FF550089FF5B2E8BFF661E7CFFBDA7C3FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF562881FF4D2570ED0000000000000000965535FF9C5C3CFFFFFF
      FFFFFFFFFFFFB2795FFF934621FF90441FFFA86D51FFFFFFFFFFFFFFFFFF863D
      18FF853D18FF843C17FF945535FFF1DED9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF833C17FF8A4725FF00000000000000003E875BFF448D60FFFFFF
      FFFFE2E4DEFF93AE99FF89A790FF89A78FFF89A78FFF88A68FFF88A68FFF87A4
      8CFF90A994FFFFFFFFFFFFFFFFFF64B280FF3A9A59FF3A9752FF3C944CFF327D
      43FF71987BFF237044FF30784FFF00000000000000003C5ED1FB6A90E6FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFDDE3F8FF95A8EBFF8194E2FFDDE3F8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4B57E0FF2241C5F60000000000000000603889F8764EA0FFFFFF
      FFFFFFFFFFFFB6A5CCFF642D94FF6A4095FF60328AFF671B7DFFB19AB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF562881FF4D2470ED0000000000000000985838FF9F5F40FFFFFF
      FFFFFFFFFFFFB57A5FFF9C4C27FF984A24FF944722FFD7B7AAFFFFFFFFFF8B40
      1BFF8A401BFF883F19FF863D18FFCCA797FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF833D18FF8A4825FF000000000000000041895DFF489064FFFFFF
      FFFFAAC4B0FF409749FF419C4FFF409F55FF3FA15BFF3EA360FF399B5CFF2B82
      4DFF257245FF74B58CFF81C998FF43A662FF41A157FF429E4FFF3C8D49FFA1B6
      A3FFFFFFFFFF247045FF30784FFF00000000000000004062D2FB7094E6FFFFFF
      FFFFFFFFFFFFFFFFFFFF9BADECFF163FD3FF1140D0FF0639CFFF113AD2FF7388
      DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4B58E0FF2341C5F60000000000000000633A8CF87952A3FFFFFF
      FFFFFFFFFFFFD3C7E2FF8B63B2FF6E439BFF6B4296FF63368FFF5C0079FFA187
      ADFFB09CBCFFC5B1CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF572982FF4D2570ED00000000000000009A5B3AFFA26344FFFFFF
      FFFFFFFFFFFFBA7D62FFA6532DFFA2502BFF9E4D28FFA76545FFFFFFFFFF9144
      1FFF90441FFF8D421DFF8B411BFF995939FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF843E19FF8A4826FF0000000000000000438B5FFF4C9367FFFFFF
      FFFFFFFFFFFF84B08EFF429A4AFF429E51FF41A156FF40A35DFF3EA461FF3593
      58FF74B58CFF81C998FF43A662FF41A157FF429E4FFF388C47FF2B643BFFDDDD
      D6FFFFFFFFFF257145FF31784FFF00000000000000004565D2FB7698E7FFFFFF
      FFFFFFFFFFFFDDE3F8FF163FD3FF0051D6FF446CDCFF335ED7FF0045D3FF0B34
      D1FFB7BFE6FFFFFFFFFF0D38D3FFFFFFFFFF0D38D3FF0D38D3FF0D38D3FFFFFF
      FFFFFFFFFFFF4B5BE1FF2342C5F60000000000000000663E8FF87D57A7FFFFFF
      FFFFFFFFFFFFFFFFFFFFCDBEDEFF916EB6FF70459CFF6B4296FF663B92FF5B19
      85FF53007AFF85588DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF582983FF4D2570ED00000000000000009C5D3EFFA56849FFFFFF
      FFFFFFFFFFFFC18466FFB35B35FFAE5832FFA9552FFFA4512CFFCBA391FF9849
      24FF984A24FF954722FF914520FF8E431EFFCEAA9AFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF853F1AFF8B4826FF0000000000000000468D62FF50976BFFFFFF
      FFFFFFFFFFFFFFFFFFFF74A981FF429B4BFF429F51FF41A157FF3C9C5AFF74B7
      8DFF81C998FF43A662FF41A157FF429E4FFF388D47FF22693FFF1D6238FFFFFF
      FFFFFFFFFFFF267246FF317950FF00000000000000004A69D3FB809DE8FFFFFF
      FFFFFFFFFFFF95A8EBFF2C56D6FF5989E6FF4778E0FF4370DDFF3D64D7FF0635
      D2FF556CD4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4B5DE1FF2443C6F60000000000000000694291F8835BABFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD2C4E2FF9574BAFF734A9FFF6B4296FF6A3F
      96FF60338CFF603081FF876999FF9477A2FFA88AB2FFD2C0DAFFFFFFFFFFFFFF
      FFFFFFFFFFFF592B84FF4E2670ED00000000000000009F6041FFA96C4FFFFFFF
      FFFFFFFFFFFFC68A6EFFBE6844FFBA623CFFB55D37FFB05934FFAA5E3BFFA250
      2BFFA2502AFF9E4D28FF9A4B25FF964823FFA05E3EFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF86401CFF8B4927FF0000000000000000499064FF559A6FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF68A374FF439C4CFF3E9951FF73B68BFF82C9
      98FF43A662FF41A157FF429E4FFF3C8E49FF6D9B7CFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF277347FF327950FF0000000000000000506ED4FB84A1E8FFFFFF
      FFFFFFFFFFFF8094E2FF405FD4FF939FDFFF8895D9FF5679DAFF4771DDFF063E
      D3FF4F67D3FFFFFFFFFF0D38D3FFFFFFFFFF0D38D3FF0D38D3FF0D38D3FFFFFF
      FFFFFFFFFFFF4B5FE1FF2544C6F600000000000000006C4494F88760AFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6CBE5FF9A79BCFF774FA3FF6C43
      96FF6B4197FF63368EFF551B82FF510D7BFF531779FF66337AFFBBA8C4FFFFFF
      FFFFFFFFFFFF5A2C85FF4E2670ED0000000000000000A16344FFAD7154FFFFFF
      FFFFFFFFFFFFCB947AFFC77959FFC3714FFFBE6A46FFBC6440FFB75F39FFB25B
      35FFAD5832FFA8542FFFA2502BFFA04F29FF9B4C26FFD1AC9DFFFFFFFFFFFFFF
      FFFFFFFFFFFF87411DFF8C4A28FF00000000000000004C9267FF5A9E73FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E8E3FF5A9C69FF72B589FF82C998FF43A6
      62FF41A157FF429E4FFF3A9049FF2C673DFFDBDCD5FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF287448FF337A51FF00000000000000005672D4FB89A4E9FFFFFF
      FFFFFFFFFFFFDDE3F8FF1A42D4FFD8D0F9FFE8DAF5FF7089D8FF4F77E0FF0B39
      D3FF8D98D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4C62E1FF2645C6F600000000000000006E4898F88B65B3FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1C3E2FF9572BAFF7D55
      A7FF774FA2FF6E439AFF653A91FF5D3089FF552682FF490C75FF610B73FFD2C5
      D9FFFFFFFFFF5B2D86FF4F2671ED0000000000000000A36648FFB1765AFFFFFF
      FFFFFFFFFFFFCF9C85FFD08C6DFFC67D5EFFC1886CFFC67654FFC26F4CFFBE68
      43FFBA613CFFB55D37FFB06D4FFFA8552FFFA6532DFFAB6647FFFFFFFFFFFFFF
      FFFFFFFFFFFF88421FFF8C4B29FF00000000000000004F956AFF5FA377FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD5DDD5FF86BD98FF82C998FF43A662FF41A1
      57FF429E4FFF3B924AFF37985AFF2B824BFF557B5CFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF2A754AFF337B52FF00000000000000005C78D5FB91AAEAFFFFFF
      FFFFFFFFFFFFFFFFFFFF8091DEFF1B42D5FF697DE3FF375CD6FF0F3CD3FF3456
      CFFFFFFFFFFFFFFFFFFF0D38D3FFFFFFFFFF0D38D3FF0D38D3FF0D38D3FFFFFF
      FFFFFFFFFFFF4C65E1FF2746C6F60000000000000000724D9AF88F6AB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB098CFFF8F6A
      B9FF855DAEFF7951A4FF70459BFF673B92FF5E318AFF572984FF420069FFAF95
      B6FFAB8FC2FF5F3689FF502772ED0000000000000000A66A4CFFB57B5FFFFFFF
      FFFFFFFFFFFFD3A48FFFD89B82FFCD8D6FFFE5D0C7FFC68465FFCB8261FFC779
      59FFC47250FFC06B47FFCB9781FFC08569FFB25B35FFAC5731FFD4B0A0FFFFFF
      FFFFFFFFFFFF894421FF8D4B2BFF000000000000000053986DFF64A77CFFFFFF
      FFFFFFFFFFFFFFFFFFFFD9E1D9FF87BD99FF82C998FF43A662FF41A157FF429E
      4FFF3B9149FF3B9B57FF3FA561FF3A9D5DFF23713FFF8AA18BFFFFFFFFFFFFFF
      FFFFFFFFFFFF2C774BFF347B52FF00000000000000006180D6FB96AEEAFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B9E5FF7186DBFF506BD3FF8796D9FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4D69E2FF2847C6F6000000000000000075509DF89470BCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9A2D9FF9D7A
      C7FF926DBBFF8760B0FF7B53A6FF71479DFF673C94FF5F328BFF50187BFF9266
      9CFFA282B9FF633C8CFF512972ED0000000000000000A96D50FFB98266FFFFFF
      FFFFFFFFFFFFD7AB98FFDFA992FFD39981FFFFFFFFFFDABAABFFD19072FFD08C
      6DFFCC8565FFC97C5DFFCF9D88FFE8D1C9FFB96642FFB9613CFFB76E4EFFFFFF
      FFFFFFFFFFFF8B4623FF8F4D2BFF0000000000000000579B70FF6AAC83FFFFFF
      FFFFFFFFFFFFDDE4DDFF88BD9AFF82C998FF43A662FF41A157FF429E4FFF3B91
      48FF3D974EFF41A156FF40A35CFF3EA461FF389A5CFF206436FFB8C2B4FFFFFF
      FFFFFFFFFFFF2D784DFF357C53FF00000000000000006685D7FB9BB2EBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4D6CE2FF2948C6F600000000000000007955A0F89976C1FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3AEE4FFAC8D
      D4FFA080C8FF9470BEFF8963B2FF7D56A8FF74499FFF6A3D96FF582586FF966C
      A1FFA384BAFF643D8DFF522A73ED0000000000000000AC7154FFBE886CFFFFFF
      FFFFFFFFFFFFD8AB97FFE5B5A1FFDBA791FFE5D0C8FFFFFFFFFFCF9F8AFFD89B
      81FFD59578FFD18F70FFD2A38FFFFFFFFFFFC68D72FFC3724FFFBF6A46FFD1AA
      98FFCEAC9DFF8C4825FF8F4E2CFF00000000000000005A9E73FF70B088FFFFFF
      FFFFE0E6E0FF88BD9AFF82C998FF43A662FF41A157FF429E4FFF3D8E49FF88AB
      91FF449751FF429E51FF41A157FF40A35DFF3EA461FF359458FF2E653DFFD9DB
      D4FFFFFFFFFF2F7A4FFF367D55FF00000000000000006D8BD7FBA0B7EBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4D6EE2FF2B49C6F600000000000000007C5AA4F89F7DC7FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7C8F1FFBCA1
      E4FFAF91D7FFA383CCFF9773C0FF875CADFF9D7DB2FF9D86BAFF550083FFB69E
      BFFFFFFFFFFF643B8DFF532B75ED0000000000000000AF7559FFC28E73FFC29B
      87FFE0B4A1FFEBC0AFFFEABEACFFE8BAA8FFDFAE9AFFD5AD9CFFFFFFFFFFD59F
      87FFDCA38BFFD99E85FFD4A996FFD5AF9FFFCD8869FFCC8564FFC97C5CFFC373
      52FFAD6F52FF8E4A28FF904F2DFF00000000000000005EA177FF75B58DFFFFFF
      FFFF87BC99FF82C998FF43A662FF41A157FF429D4FFF439251FFAABFADFFFFFF
      FFFFBACEBDFF439651FF429F52FF41A158FF3FA45EFF3DA361FF2E894FFF7191
      74FFFFFFFFFF327C50FF398155FF00000000000000007492D8FBA6BBECFFFFFF
      FFFFFFFFFFFF0D38D3FF0D38D3FF0D38D3FF0D38D3FF0D38D3FF0D38D3FF0D38
      D3FF0D38D3FF0D38D3FF0D38D3FF0D38D3FF0D38D3FF0D38D3FF0D38D3FFFFFF
      FFFFFFFFFFFF4D71E3FF2D4BC6F60000000000000000815DA7F8A485CCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBA
      F3FFBDA2E7FFB194DAFFA586CFFF8F64B3FFA88CB3FFAC97C3FF84529DFFDACF
      E2FFFFFFFFFF64388EFF542C77ED0000000000000000B2795DFFC7947AFFCFB1
      A2FFE3C9BDFFE2C8BCFFE2C7BBFFE1C6BAFFE1C4B8FFE6CFC6FFFFFFFFFFE4CC
      C2FFDDBDAFFFDCBBADFFE3C9BFFFE6CEC5FFD9B5A5FFD8B2A2FFD7B0A0FFD6AE
      9DFFC19682FF904D2AFF91502FFF000000000000000063A57AFF7CBB93FFFFFF
      FFFFB5CFBFFFACCAB7FFAAC8B4FFA9C7B2FFB0C9B7FFE4E7E2FFFFFFFFFFFFFF
      FFFFFFFFFFFFDAE1D9FFA9C4B0FFA6C3ADFFA5C3ADFFA5C2ADFFA6C2AEFFDCDE
      D7FFFFFFFFFF348053FF398157FF00000000000000007C97D8FBACC0EDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF4E75E3FF2E4DC6F600000000000000008562ABF8AA8DD2FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFD3C1F4FFC0A5E9FFB193DDFFA07CCBFF9061B5FFA281BAFFD0C1DAFFFFFF
      FFFFFFFFFFFF653990FF552F79ED0000000000000000B67D62FFCD9B84FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF924F2DFF925231FF000000000000000067A880FF85C098FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF378255FF3B8358FF0000000000000000879CD9FBB2C5EDFFFFFF
      FFFFFFFFFFFF0D38D3FF0D38D3FF0D38D3FF0D38D3FF0D38D3FF0D38D3FF0D38
      D3FF0D38D3FF0D38D3FF0D38D3FF0D38D3FF0D38D3FF0D38D3FF0D38D3FFFFFF
      FFFFFFFFFFFF4E78E4FF304EC6F600000000000000008A67B0F8B194D8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE2D7F4FFD7C9EEFFD2C4E8FFD5C9E5FFE1D7EAFFFFFFFFFFFFFF
      FFFFFFFFFFFF683C93FF573179ED0000000000000000B98367FFD2A18CFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF945231FF935332FF00000000000000006BAC84FF8CC69FFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3A8458FF3C8459FF00000000000000008FA4DAFBB6C8EEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF507CE4FF3251C7F600000000000000008F6DB5F8B79CDEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF6B3F95FF57327AED0000000000000000BD886CFFD8A994FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF975534FF945534FF000000000000000070B088FF93CCA5FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3D875AFF3E855BFF000000000000000095A9DAFABFD0EFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF5D8BE6FF3353C8F500000000000000009473BAF8BDA2E4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF6B4096FF59347CED0000000000000000C08D72FFDEB19DFFD9AA
      96FFD4A48FFFCF9E88FFCB9881FFC79379FFC38E73FFBE896DFFBB8468FFB77D
      62FFB3795DFFB07558FFAD7054FFA96C4FFFA6694BFFA36547FFA16243FF9E5F
      3FFF9C5B3BFF9A5938FF965737FF000000000000000075B48CFF9CD3ACFF95CE
      A7FF8FC8A1FF89C49CFF83BF97FF7BBA92FF76B68DFF71B189FF6CAD84FF67A9
      80FF62A57AFF5EA276FF5A9E73FF559B6FFF51986CFF4E9569FF4A9266FF478F
      63FF448C60FF418A5DFF40875DFF0000000000000000A4B9E4FFC1D6F2FFC0D1
      F0FFB8CBEEFFB4C7EEFFAFC3EDFFAABFEDFFA5BBECFFA0B7EBFF9BB3EBFF96B0
      EBFF92ACEAFF8DA8EAFF87A3E9FF82A0E9FF7B9DE8FF7599E8FF6D94E7FF638F
      E6FF6E92E7FF5074E4FF3054CDF90000000000000000997ABEF8C7AFEFFFBEA4
      E6FFB99EE1FFB497DBFFAE90D6FFA98AD1FFA484CCFF9F7CC7FF9A77C2FF9772
      BEFF926DBAFF8E68B6FF8A63B2FF865EAFFF835AABFF7D56A8FF7A52A4FF774F
      A1FF72489CFF6C4298FF5D3780EE0000000000000000B68368FFC29076FFBF8C
      71FFBC886DFFB98569FFB68165FFB47C61FFB1795EFFAF765AFFAC7357FFAB71
      55FFA86D50FFA66B4EFFA4684BFFA26648FFA06445FF9F6343FF9D5F40FF9B5D
      3EFF9A5B3CFF985A3AFF9E6547FF00000000000000006DA985FF79B690FF75B3
      8CFF71AF89FF6EAC86FF6AAB83FF67A781FF63A47BFF60A178FF5D9F76FF5A9D
      73FF579A71FF55986FFF52966CFF50946AFF4D9268FF4B9066FF498F64FF478D
      63FF458B61FF43895FFF51916BFF00000000000000008595C0EE9DB0D8F892A4
      D1F58EA1D3F6879BD2F68096D1F67A93D0F6748DCFF66D88CFF66883CEF6637E
      CDF65F7ACDF65A76CCF65571CCF6506DCBF64C69CBF64966CAF64663C9F64361
      C9F63F5CC8F53659CEF9344EB0E8000000000000000072588EDD8E73B0EF8B6E
      ABEE8769A8EE8466A5EE8162A3EE7E5D9FEE7A5B9DEE77589AEE745497EE7251
      95EE6F4E92EE6D4D90EE6A498EEE69458BEE66438AEE654188EE633F86EE603D
      84EE603B83EE5E3A82EF563C6ED2000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E
      3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E
      3EFF3E3E3EFF3E3E3EFF00000000000000000000000000000000000000000000
      00000000000000000000810900FF810900FF810900FF810900FF810900FF8109
      00FF810900FF810900FF810900FF810900FF810900FF810900FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3E3E3EFF00000000000000000000000000000000000000000000
      00000000000000000000810900FFC99C22FFC8A028FFC8A42EFFCA9E2FFFCC98
      30FFCC9931FFCC9931FFCC9931FFCC9931FFCC9931FF810900FF000000000000
      0000000000000000000000000000000000000000000000000000000000002D2D
      2DFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
      3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
      3CFF111111FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3E3E3EFF00000000000000000000000000000000C5C5C5FFC5C5
      C5FFC5C5C5FFC5C5C5FFC5C5C5FFC5C5C5FFC5C5C5FFC5C5C5FFC5C5C5FF9363
      34FFCC9931FFCC9931FFCC9931FFA67131FF9D6831FF810900FF000000000000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3B3B3BFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF000000FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      00003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3E3E3EFF0000000000000000000000004F4F4FFF4F4F4FFF4F4F
      4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF9363
      34FFD3A42FFFA77332FF975C2DFF975C2DFF57182FFF531032FF18253EFF0000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA0A0A0FFA0A0A0FFA0A0A0FFFFFFFFFFFFFFFFFFA0A0A0FFA0A0A0FFA0A0
      A0FF3B3B3BFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF000000FF00FFFFFF00FFFFFF00FFFFFF56C4
      C5FF629999FFFF2400FFFF2400FF6AAAAAFF5FCECEFF00FFFFFF00FFFFFF0000
      00FF000000FF000000FF0000000000000000000000003E3E3EFF3E3E3EFF3E3E
      3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E
      3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFFFFFF
      FFFFFFFFFFFF3E3E3EFF0000000000000000000000004F4F4FFFFFFFFFFF8B8B
      8BFFE8E8E8FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FFF9363
      34FFDAA832FF996431FF810900FF074A97FF3352B0FF4B58C0FF384DAEFF1825
      3EFF000000000000000000000000000000000000000000000000000000000C0C
      0CFFFFFFFFFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFFFFFFFFFFFFFFFF0000
      FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFFA0A0
      A0FF3B3B3BFF0000000000000000000000000000000000000000000000000000
      0000000000000B0B0BF3000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFFA0AE
      AEFFFF2400FFFF2400FFFF2400FFFF2400FF9D8282FF76B2B2FF00FFFFFF00FF
      FFFF00FFFFFF000000FF0000000000000000000000003E3E3EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3EFFFFFF
      FFFFFFFFFFFF3E3E3EFF0000000000000000000000004F4F4FFFFFFFFFFFFFFF
      FFFFF8F8F8FFFEFEFEFFF5F5F5FFFCFCFCFFF6F6F6FFFFFFFFFF4F4F4FFF9363
      34FF8C603AFF2D659CFF003DA1FF0091CFFF0087CCFF8199F7FF6B7AE0FF1B2A
      49FF000000000000000000000000000000000000000000000000000000000C0C
      0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000FFFFA0A0A0FFA0A0A0FFA0A0A0FFFFFFFFFF0000FFFFA0A0A0FFFFFF
      FFFF3B3B3BFF0000000000000000000000000000000000000000000000000000
      0000000000FF000000FF00FFFFFF00FFFFFF52B4C1FF57BFC8FF00FFFFFFA1A8
      A2FFFF2400FFFF2400FFFF2400FFFF2400FFBD3838FF69ACACFF00FFFFFF00FF
      FFFF00FFFFFF000000FF000000FF00000000000000003E3E3EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3EFFFFFF
      FFFFFFFFFFFF3E3E3EFF0000000000000000000000004F4F4FFFFFFFFFFFFFFF
      FFFFC9C9C9FFF8F8F8FFAEAEAEFFE4E4E4FFB5B5B5FFF9F9F9FF7089A0FF6053
      56FF0053AAFF008ECCFF00AADDFF00D0F7FF006FC6FF0084CBFF556FA5FF4646
      46FF000000000000000000000000000000000000000000000000000000000C0C
      0CFFFFFFFFFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFFFF
      FFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFA0A0A0FFFFFF
      FFFF3B3B3BFF0000000000000000000000000000000000000000000000000000
      00FF000000FF00FFFFFF00FFFFFF429CD1FF0000FFFF0000FFFF3FA2D2FF00FF
      FFFFB99394FFFF2400FFFF2400FFD67676FF9EB1B1FF5DCDCDFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF000000FF00000000000000003E3E3EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3EFFFFFF
      FFFFFFFFFFFF3E3E3EFF0000000000000000000000004F4F4FFFF7F7F7FFE8E8
      E8FFA4A4A4FFA4A4A4FFA4A4A4FFE1E1E1FFDCDCDCFF397CCAFF0D77BDFF0081
      C0FF00BFF2FF00E1FBFF00CFFFFF0089D9FF464646FF233B55FF404040FF0000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000FFFFA0A0A0FFFFFFFFFF0000FFFFA0A0A0FFFFFF
      FFFF3B3B3BFF0000000000000000000000000000000000000000000000FF0000
      00FF00FFFFFF00FFFFFF459ECFFF0000FFFF0000FFFF0000FFFF0000FFFF41B4
      D1FF00FFFFFFA1B1ADFFAA9696FF90ABABFF64CCCCFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF000000FF00000000000000003E3E3EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3EFFFFFF
      FFFFFFFFFFFF3E3E3EFF0000000000000000000000004F4F4FFFFBFBFBFFF5F5
      F5FFF5F5F5FFFEFEFEFFFAFBFDFF4C91D7FF003DA1FF009ED0FF00C1EFFF00CC
      FFFF00E7FBFF0785D3FF095CBBFF464646FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0CFFFFFFFFFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E
      4EFFFF4E4EFFFFFFFFFFFFFFFFFF0000FFFFA0A0A0FF0000FFFFA0A0A0FFFFFF
      FFFF3B3B3BFF00000000000000000000000000000000000000FF000000FF00FF
      FFFF00FFFFFF00FFFFFF3E8DE8FF0000FFFF0000FFFF0000FFFF1973CFFF41C7
      D9FF00FFFFFF00FFFFFF51C3C3FF34A7A7FF399999FF5AB6B6FF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF000000FF00000000000000003E3E3EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3EFFFFFF
      FFFFFFFFFFFF3E3E3EFF0000000000000000000000004F4F4FFFFFFFFFFFFFFF
      FFFFFFFFFFFFF8F8F8FF929AABFF4D6FB5FF0575BBFF00D5FFFF00D7F4FF00AD
      EEFF427599FF7B6A53FF810900FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF0000FFFFA0A0A0FFFFFF
      FFFF3B3B3BFF00000000000000000000000000000000000000FF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF5AB3EBFF3961FAFF0000FFFF0000FFFF45ADD5FF00FF
      FFFF00FFFFFF3CD2D2FF09A5A5FF000000FF000000FF406A6AFF59B4B4FF00FF
      FFFF00FFFFFF000000FF000000FF00000000000000003E3E3EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3EFFFFFF
      FFFFFFFFFFFF3E3E3EFF0000000000000000000000004F4F4FFFACACACFFA4A4
      A4FFE1E1E1FF8A8A8AFF242424FFD9D9D9FFC5D0E8FF0080D9FF296495FF6D63
      59FFCC9931FFAA7531FF810900FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0CFFFFFFFFFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E
      4EFFFF4E4EFFFF4E4EFFFF4E4EFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFF
      FFFF3B3B3BFF00000000000000000000000000000000000000FF00FFFFFF00FF
      FFFF00FFFFFF50D1C2FF4DB7B0FF4B9BC4FF4892D7FF4BA9DDFF59D1DFFF00FF
      FFFF00FFFFFF25B3B4FF000000FF000000FF000000FF000000FF557F7FFE00FF
      FFFF00FFFFFF000000FF0000000000000000000000003E3E3EFF3E3E3EFF3E3E
      3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E
      3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFFFFFF
      FFFFFFFFFFFF3E3E3EFF0000000000000000000000004F4F4FFFF6F6F6FFF5F5
      F5FFF5F5F5FF696969FF141414FF5D5D5DFF1C72CAFFD0D0D0FF4F4F4FFF9363
      34FFCC9931FFAA7531FF810900FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3B3B3BFF00000000000000000000000000000000000000FF00FFFFFF00FF
      FFFF56C2AFFF00C24AFF00C24AFF00C24AFF4EB598FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF57B2B2FF000000FF000000FF000000FF000000FF00FFFFFF00FF
      FFFF000000FF0000000000000000000000010000000000000000000000000000
      00003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3E3E3EFF0000000000000000000000004F4F4FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4FFF9363
      34FFCC9931FFAA7531FF810900FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0CFFFFFFFFFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E
      4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFFFFFFFFFFFF
      FFFF3B3B3BFF00000000000000000000000000000000000000FF00FFFFFF00FF
      FFFF45B692FF00C24AFF00C24AFF00C24AFF00C24AFF52C79DFF00FFFFFF00FF
      FFFF00FFFFFF70C7C6FF579D9DFF000000FF000000FF00FFFFFF00FFFFFF3F16
      16F7000000FF4645459E00000000000000000000000000000000000000000000
      00003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3E3E3EFF0000000000000000000000004F4F4FFFC5C5C5FFC5C5
      C5FFC5C5C5FFC5C5C5FFC5C5C5FFC5C5C5FFC5C5C5FFC5C5C5FF4F4F4FFF9363
      34FFCC9931FFAA7531FF810900FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3B3B3BFF00000000000000000000000000000000000000FF00FFFFFF00FF
      FFFF58C1ADFF00C24AFF00C24AFF00C24AFF00C24AFF37C79BFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF64D0D0FF4BC0C0FF00FFFFFF00FFFFFF472020FB0000
      00FF000000FF323232FF00000000000000000000000000000000000000000000
      00003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3E3E3EFF0000000000000000000000004F4F4FFF4F4F4FFF4F4F
      4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF4F4F4FFF59514FFF4F4F4FFFC394
      34FFCC9931FFAA7531FF810900FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0CFFFFFFFFFF969696FF969696FF969696FF969696FF969696FF969696FFFFFF
      FFFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFFFFFFFFFFFF
      FFFF3B3B3BFF00000000000000000000000000000000000000FF00FFFFFF00FF
      FFFF83D6D8FF56D696FF00C24AFF00C24AFF3AD7A7FF00FFFFFF55C2CAFF62AD
      C5FF5EC1CFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF0000
      00FF000000FF000000FF00000000000000000000000000000000000000000000
      00003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3E3E3EFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000810900FFDDBB53FFC394
      34FFCC9931FFAA7531FF810900FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0CFFFFFFFFFF969696FF4444F4FF4444F4FF00FFFFFF00FFFFFF969696FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3B3B3BFF00000000000000000000000000000000000000FF000000FF00FF
      FFFF00FFFFFF75E5C9FF4EDAA5FF40D8BDFF00FFFFFF81BCD8FFA87ACFFFDC00
      FFFF9774C3FF6FBED3FF00FFFFFF00FFFFFF000000FF000000FF000000000000
      00FF000000FF000000FF00000000000000000000000000000000000000000000
      00003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3E3E3EFF0000000000000000810900FF810900FF810900FF0000
      00000000000000000000000000000000000000000000810900FFDDBB53FFCC99
      31FFCC9931FFAA7531FF810900FF000000000000000000000000000000000000
      000000000000810900FF810900FF810900FF0000000000000000000000000C0C
      0CFFFFFFFFFF969696FF4444F4FF4444F4FF00FFFFFF00FFFFFF969696FFFFFF
      FFFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFF4E4EFFFFFFFFFFFFFF
      FFFF3B3B3BFF0000000000000000000000000000000000000000000000FF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF879CD8FFDC00FFFFDC00FFFFDC00
      FFFFDC00FFFF7D97C2FE00FFFFFF00FFFFFF000000FF00000000000000000000
      0000000000FF000000FF3B3B3BE4000000000000000000000000000000000000
      00003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF3E3E3EFF0000000000000000810900FFB97124FF810900FF0000
      00000000000000000000000000000000000000000000810900FFDDBB53FFCC99
      31FFCC9931FFAA7531FF810900FF000000000000000000000000000000000000
      000000000000810900FF934B24FF810900FF0000000000000000000000000C0C
      0CFFFFFFFFFF969696FFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF969696FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3B3B3BFF0000000000000000000000000000000000000000000000FF0000
      00FF00FFFFFF00FFFFFF00FFFFFF76BCECFFDC00FFFFDC00FFFFDC00FFFFDC00
      FFFFB18DD8FE6CB5C7FE00FFFFFF000000FF000000FF00000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      00003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E
      3EFF3E3E3EFF3E3E3EFF0000000000000000810900FFDDBB53FF810900FF8109
      00FF810900FF810900FF810900FF810900FF810900FF810900FFDCB850FFCC99
      31FFCC9931FFAA7531FF810900FF810900FF810900FF810900FF810900FF8109
      00FF810900FF810900FFAA7531FF810900FF0000000000000000000000000C0C
      0CFFFFFFFFFF969696FFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF969696FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C0C0CFF0B0B0BFF0B0B0BFF0B0B
      0BFF0D0D0DFD0000000000000000000000000000000000000000000000000000
      00FF000000FF00FFFFFF00FFFFFF90BBEDFFC071FAFFDC00FFFFDC00FFFFB988
      E3FF80C6DBFE00FFFFFF00FFFFFF000000FF0000000000000000000000000000
      00000000000040404089000000FF000000000000000000000000000000000000
      00003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3EFFFFFFFFFFFFFFFFFF3E3E
      3EFF3E3E3EFF000000000000000000000000810900FFDDBB53FFAD7831FFAA75
      31FFAA7531FFAA7531FFAA7531FFAA7531FFAA7531FFB38031FFCC9931FFCC99
      31FFCC9931FFB58231FFAA7531FFAA7531FFAA7531FFAA7531FFAA7531FFAA75
      31FFAA7531FFB38031FFAA7531FF810900FF0000000000000000000000000C0C
      0CFFFFFFFFFF969696FFFFFFFFFFFFFFFFFFFF4E4EFFFF4E4EFF969696FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C0C0CFFFFFFFFFFFFFFFFFF1212
      12FB000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000FF00FFFFFF00FFFFFFA8B6ECFFA8AFF0FFA5B0F0FF00FF
      FFFF00FFFFFF00FFFFFF000000FF000000000000000000000000000000000000
      00000000000000000000000000FF000000FF0000000000000000000000000000
      00003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3EFFFFFFFFFF3E3E3EFF3E3E
      3EFF00000000000000000000000000000000810900FFE3BA5BFFC69B2FFFC99C
      22FFC8A028FFC8A42EFFCA9E2FFFCC9830FFCB9933FFC99937FFD6A73BFFD3A4
      2FFFCE9B32FFC99135FFBF8F2AFFC59E2EFFC79F2BFFC9A129FFCBA02DFFCE9E
      31FFCD9C36FFCD9A3BFFB48537FF840600FF0000000000000000000000000C0C
      0CFFFFFFFFFF969696FF969696FF969696FF969696FF969696FF969696FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C0C0CFFFFFFFFFF101010FD0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF000000FF000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3EFF3E3E3EFF3E3E3EFF0000
      000000000000000000000000000000000000810900FFE2BD5FFFC69639FFCB8F
      33FFC99332FFC79932FFC99232FFCB8C33FFCA8F30FFC9922CFFD29D2FFFDAA8
      32FFD5A032FFCF9732FFCA9232FFC68D32FFC79230FFC8972DFFCC9532FFD092
      36FFD09532FFD0972EFFAC752FFF810900FF0000000000000000000000000C0C
      0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0B0B0BFF111111FB000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E3E3EFF3E3E3EFF000000000000
      000000000000000000000000000000000000810900FFE7D069FFDABC56FFDDB7
      53FFDBBA54FFD9BE55FFD9BB55FFDAB755FFD9B952FFD8BB50FFDDC051FFE1C6
      53FFDEC253FFDBBD53FFD9BA53FFD7B853FFD9BA53FFDABD52FFDBBC53FFDCBB
      55FFDBBC52FFD9BC4EFFB87A3EFF830400FF0000000000000000000000000B0B
      0BFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C
      0CFF0C0C0CFF0C0C0CFF0C0C0CFF0C0C0CFF0B0B0BFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E
      3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF3E3E3EFF00000000000000000000
      000000000000000000000000000000000000810900FF810900FF810900FF8109
      00FF810900FF810900FF810900FF810900FF810900FF810900FF810900FF8109
      00FF810900FF810900FF810900FF810900FF810900FF810900FF810900FF8109
      00FF810900FF810900FF810900FF85000BFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000600000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00
      0000000000000000FF8410000000000000000000FF8000000000000000000000
      FF8410000000000000000000E0023F000000000000000000E0000F0000000000
      00000000E0000F000000000000000000C0080F00000000000000000080040F00
      000000000000000080063F00000000000000000080063F000000000000000000
      80041F00000000000000000080063F00000000000000000080041F0000000000
      0000000080063F00000000000000000080041F00000000000000000080063F00
      000000000000000080040F000000000000000000C0080F000000000000000000
      E0000F000000000000000000E0000F000000000000000000E003FF0000000000
      00000000FFFFFF000000000000000000000000FFFFFF000000FFFFFF000000E0
      0007000000FFFFFF000000E00007000000C00003000000E00007000000C00003
      000000E00007000000C00003000000E00007000000C00003000000E000070000
      00C00003000000E00007000000C00003000000E00007000000C00003000000E0
      0007000000C00003000000E00007000000C00003000000E00007000000C00003
      000000E00007000000C00003000000E00003000000C00003000000E000010000
      00C00003000000E00000000000C00003000000E00004000000C00003000000E0
      0007000000C00003000000E00007000000C00003000000E00007000000C00003
      000000E00007000000C00003000000E00007000000C00003000000E000070000
      00FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80000180
      0001800001800001800001800001800001800001800001800001800001800001
      8000018000018000018000018000018000018000018000018000018000018000
      0180000180000180000180000180000180000180000180000180000180000180
      0001800001800001800001800001800001800001800001800001800001800001
      8000018000018000018000018000018000018000018000018000018000018000
      0180000180000180000180000180000180000180000180000180000180000180
      0001800001800001800001800001800001800001800001800001800001800001
      8000018000018000018000018000018000018000018000018000018000018000
      01800001FFFFFFFFFFFFFFFFFFFFFFFFF00003FC003FFFFFFFFFFFFFF00003FC
      003FE00007FF001FF00003C0003FE00007FE000FF0000380001FE00007FC0003
      80000380000FE00007F8000380000380000FE00007F0000180000380000FE000
      07E0000180000380001FE00007C000018000038000FFE0000780000180000380
      01FFE000078000018000038001FFE000078000038000038001FFE00007800006
      F000038001FFE00007800003F000038001FFE00007800003F000038001FFE000
      07800003F00003FF81FFE00007800023F000031F81F8E00007C00071F000031F
      81F8E00007C00079F00003000000E00007E000F9F00007000000E0000FF001FC
      F0000F000000E0001FF803FFF0001F000000E0003FFC07FFF0003F000000E000
      7FFFFFFFF0007F000000FFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
