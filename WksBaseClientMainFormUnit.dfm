object BaseMainForm: TBaseMainForm
  Left = 0
  Top = 0
  Caption = 'BaseMainForm'
  ClientHeight = 837
  ClientWidth = 1268
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object LeftJvNetscapeSplitter: TJvNetscapeSplitter
    Left = 303
    Top = 77
    Height = 588
    Align = alLeft
    MinSize = 1
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
  end
  object RightJvNetscapeSplitter: TJvNetscapeSplitter
    Left = 955
    Top = 77
    Height = 588
    Align = alRight
    MinSize = 1
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
    ExplicitLeft = 875
  end
  object BottomJvNetscapeSplitter: TJvNetscapeSplitter
    Left = 0
    Top = 665
    Width = 1268
    Height = 10
    Cursor = crVSplit
    Align = alBottom
    MinSize = 1
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
    ExplicitWidth = 1188
  end
  object TopPanel: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1262
    Height = 74
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Caption = 'TopPanel'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 1258
    object TopPageControl: TPageControl
      Left = 0
      Top = 0
      Width = 890
      Height = 74
      ActivePage = TopSearchTabSheet
      Align = alClient
      TabOrder = 0
      object ClientTabSheet: TTabSheet
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
      object ActionTabSheet: TTabSheet
        Caption = 'Actions'
        ImageIndex = 1
        object ActionsToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 704
          Height = 44
          Align = alLeft
          AutoSize = True
          ButtonHeight = 46
          ButtonWidth = 64
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
            Left = 64
            Top = 0
            Action = ActionPostAction
          end
          object ActionGotoToolButton: TToolButton
            Left = 128
            Top = 0
            Action = ActionGotoAction
          end
          object ActionFitToolButton: TToolButton
            Left = 192
            Top = 0
            Action = ActionFitAction
          end
          object ActionBrowseToolButton: TToolButton
            Left = 256
            Top = 0
            Action = ActionBrowseAction
          end
          object ActionEditToolButton: TToolButton
            Left = 320
            Top = 0
            Action = ActionEditAction
          end
          object ActionZzzToolButton: TToolButton
            Left = 384
            Top = 0
            Action = ActionZzzAction
          end
          object ActionLoadFromFileToolButton: TToolButton
            Left = 448
            Top = 0
            Action = ActionLoadFromFileAction
          end
          object ActionSaveToFileToolButton: TToolButton
            Left = 512
            Top = 0
            Action = ActionSaveToFileAction
          end
          object ActionPersistedOpenToolButton: TToolButton
            Left = 576
            Top = 0
            Action = ActionPersistedOpenAction
          end
          object ActionMarkdownToolButton: TToolButton
            Left = 640
            Top = 0
            Action = ActionMarkdownAction
          end
        end
      end
      object TopTextTabSheet: TTabSheet
        Caption = '  Text'
        ImageIndex = 3
        object TextToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 865
          Height = 44
          Align = alLeft
          ButtonHeight = 46
          ButtonWidth = 57
          Caption = 'ClientToolBar'
          Images = TextImageList24
          ShowCaptions = True
          TabOrder = 0
          object TextSearchToolButton: TToolButton
            Left = 0
            Top = 0
            Action = TextSearchAction
          end
          object TextSearchPrevToolButton: TToolButton
            Left = 57
            Top = 0
            Action = TextSearchPrevAction
          end
          object TextSearchNextToolButton: TToolButton
            Left = 114
            Top = 0
            Action = TextSearchNextAction
          end
          object TextReplaceToolButton: TToolButton
            Left = 171
            Top = 0
            Action = TextReplaceAction
          end
          object TextSpecialCharsToolButton: TToolButton
            Left = 228
            Top = 0
            Action = TextSpecialCharsAction
          end
          object TextWordWrapToolButton: TToolButton
            Left = 285
            Top = 0
            Action = TextWordWrapAction
          end
          object TextFoldingToolButton: TToolButton
            Left = 342
            Top = 0
            Action = TextFoldingAction
          end
          object TextFoldToolButton: TToolButton
            Left = 399
            Top = 0
            Action = TextFoldAction
          end
          object TextCommentToolButton: TToolButton
            Left = 456
            Top = 0
            Action = TextCommentAction
          end
          object TextGutterToolButton: TToolButton
            Left = 513
            Top = 0
            Action = TextGutterAction
          end
          object TextLineNumbersToolButton: TToolButton
            Left = 570
            Top = 0
            Action = TextLineNumbersAction
          end
          object TextZeroStartToolButton: TToolButton
            Left = 627
            Top = 0
            Action = TextZeroStartAction
          end
          object TextTabToSpacesToolButton: TToolButton
            Left = 684
            Top = 0
            Action = TextTabToSpacesAction
          end
          object TextCompareToolButton: TToolButton
            Left = 741
            Top = 0
            Action = TextCompareAction
          end
          object TextUtilsToolButton: TToolButton
            Left = 798
            Top = 0
            Caption = 'Utils'
            DropdownMenu = TextUtilsPopup
            ImageIndex = 15
          end
        end
      end
      object TopSearchTabSheet: TTabSheet
        Caption = 'Search'
        ImageIndex = 2
        object TopReplaceOutLabel: TLabel
          Left = 16
          Top = 14
          Width = 35
          Height = 15
          Caption = 'Search'
        end
        object TopReplaceInLabel: TLabel
          Left = 200
          Top = 14
          Width = 41
          Height = 15
          Caption = 'Replace'
        end
        object TopReplaceSwapLabel: TLabel
          Left = 392
          Top = 14
          Width = 28
          Height = 15
          Caption = 'Swap'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = TopReplaceSwapLabelClick
        end
        object TopReplaceOutEdit: TEdit
          Left = 58
          Top = 11
          Width = 121
          Height = 23
          TabOrder = 0
          Text = 'TopReplaceOutEdit'
        end
        object TopReplaceInEdit: TEdit
          Left = 249
          Top = 11
          Width = 121
          Height = 23
          TabOrder = 1
          Text = 'TopReplaceInEdit'
        end
        object TopReplaceButton: TButton
          Left = 628
          Top = 10
          Width = 66
          Height = 25
          Caption = 'Replace'
          TabOrder = 2
          OnClick = TopReplaceButtonClick
        end
        object TopReplaceMatchCaseICheckBox: TCheckBox
          Left = 440
          Top = 14
          Width = 82
          Height = 17
          Caption = 'Match Case case'
          TabOrder = 3
        end
        object TopReplaceWholeCheckBox: TCheckBox
          Left = 528
          Top = 14
          Width = 83
          Height = 17
          Caption = 'Whole Word'
          TabOrder = 4
        end
        object TopReplaceNextButton: TButton
          Left = 716
          Top = 10
          Width = 61
          Height = 25
          Caption = 'Next'
          TabOrder = 5
          OnClick = TopReplaceNextButtonClick
        end
      end
      object TopUtilsTabSheet: TTabSheet
        Caption = ' Utils'
        ImageIndex = 4
        object UtilsToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 65
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
      Left = 962
      Top = 0
      Width = 300
      Height = 74
      ActivePage = TimeTabSheet
      Align = alRight
      TabOrder = 1
      ExplicitLeft = 958
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
      Left = 890
      Top = 0
      Width = 72
      Height = 74
      ActivePage = ObjectTabSheet
      Align = alRight
      TabOrder = 2
      ExplicitLeft = 886
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
      end
    end
  end
  object LeftPanel: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 77
    Width = 300
    Height = 588
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'LeftPanel'
    ShowCaption = False
    TabOrder = 1
    ExplicitHeight = 587
    object LeftPageControl: TPageControl
      Left = 0
      Top = 0
      Width = 300
      Height = 588
      ActivePage = ObjectTreeTabSheet
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 587
      object ObjectTreeTabSheet: TTabSheet
        Caption = 'Object'
        object ObjectNodeInfoLabel: TLabel
          Left = 0
          Top = 543
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
          Height = 518
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
    AlignWithMargins = True
    Left = 3
    Top = 675
    Width = 1262
    Height = 140
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'BottomPanel'
    ShowCaption = False
    TabOrder = 2
    ExplicitTop = 674
    ExplicitWidth = 1258
    inline LogFrame: TLogFrame
      Left = 0
      Top = 0
      Width = 1262
      Height = 140
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitWidth = 1258
      inherited LogPageControl: TPageControl
        Width = 1262
        ExplicitWidth = 1258
        inherited OutputTabSheet: TTabSheet
          ExplicitWidth = 1254
          inherited OutputRichEdit: TRichEdit
            Width = 1252
            ExplicitWidth = 1248
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
          end
        end
        inherited OptionTabSheet: TTabSheet
          ExplicitWidth = 1254
        end
      end
    end
  end
  object RightPanel: TPanel
    AlignWithMargins = True
    Left = 965
    Top = 77
    Width = 300
    Height = 588
    Margins.Left = 0
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alRight
    BevelOuter = bvNone
    Caption = 'RightPanel'
    ShowCaption = False
    TabOrder = 3
    ExplicitLeft = 961
    ExplicitHeight = 587
    object RightPageControl: TPageControl
      Left = 0
      Top = 0
      Width = 300
      Height = 588
      ActivePage = OptionTabSheet
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 587
      object PropertyTabSheet: TTabSheet
        Caption = 'Properties'
        object ObjectJvScrollMax: TJvScrollMax
          Left = 0
          Top = 0
          Width = 292
          Height = 558
          BorderWidth = 0
          Beveled = False
          ButtonFont.Charset = ANSI_CHARSET
          ButtonFont.Color = clWindowText
          ButtonFont.Height = -11
          ButtonFont.Name = 'Segoe UI'
          ButtonFont.Style = []
          AutoHeight = False
          ScrollBarWidth = 8
          OneExpanded = True
          Align = alClient
          BevelOuter = bvNone
          ParentColor = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object ObjectIdJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 26
            Expanded = False
            Caption = 'Ids'
            ExpandedHeight = 292
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -12
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object ObjectOrderLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 182
              Width = 249
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
              Top = 232
              Width = 249
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
              Top = 82
              Width = 249
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
              Top = 32
              Width = 249
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
              Top = 132
              Width = 249
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
              Top = 203
              Width = 249
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
              Top = 103
              Width = 249
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
              Top = 253
              Width = 249
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
              Top = 53
              Width = 249
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
              Top = 153
              Width = 249
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
            Width = 281
            Height = 26
            Expanded = False
            Caption = 'Dates'
            ExpandedHeight = 124
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -12
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object ObjectCreatedLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 32
              Width = 249
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
              Top = 53
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldCreated'
              DataSource = ObjectDataSource
              ExplicitTop = 47
            end
            object ObjectUpdatedLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 76
              Width = 249
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
              Top = 97
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldUpdated'
              DataSource = ObjectDataSource
              ExplicitTop = 88
            end
          end
          object ObjectFromJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 26
            Expanded = False
            Caption = 'From'
            ExpandedHeight = 292
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -12
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object ObjectFromOrganizationLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 32
              Width = 249
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
              Top = 232
              Width = 249
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
              Top = 182
              Width = 249
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
              Top = 132
              Width = 249
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
              Top = 82
              Width = 249
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
              Top = 53
              Width = 249
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
              Top = 253
              Width = 249
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
              Top = 203
              Width = 249
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
              Top = 153
              Width = 249
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
              Top = 103
              Width = 249
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
            Width = 281
            Height = 26
            Expanded = False
            Caption = 'To'
            ExpandedHeight = 341
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -12
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            DesignSize = (
              281
              26)
            object ObjectToOrganizationLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 32
              Width = 249
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
              Top = 232
              Width = 249
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
              Top = 182
              Width = 249
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
              Top = 132
              Width = 249
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
              Top = 82
              Width = 249
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
              Top = 282
              Width = 249
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
              Left = 216
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
            end
            object ObjectToOrganizationDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 53
              Width = 249
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
              Top = 253
              Width = 249
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
              Top = 203
              Width = 249
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
              Top = 153
              Width = 249
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
              Top = 103
              Width = 249
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
              Top = 303
              Width = 249
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
            Width = 281
            Height = 26
            Expanded = False
            Caption = 'Approval'
            ExpandedHeight = 92
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -12
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object ObjectRouteLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 32
              Width = 249
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
              Top = 53
              Width = 249
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
            Width = 281
            Height = 26
            Expanded = False
            Caption = 'Image'
            ExpandedHeight = 267
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -12
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
              Top = 48
              Width = 249
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
            Width = 281
            Height = 26
            Expanded = False
            Caption = 'Types'
            ExpandedHeight = 203
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -12
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object ObjectContentKindLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 87
              Width = 249
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
              Top = 32
              Width = 249
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
              Top = 142
              Width = 249
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
              Top = 108
              Width = 249
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
              Top = 53
              Width = 249
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
              Top = 163
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clBtnFace
              DataField = 'FldDataKind'
              DataSource = ObjectDataSource
              DropDownCount = 32
              TabOrder = 2
              OnChange = ObjectContentKindDBComboBoxChange
            end
          end
          object ObjectGeneralJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 26
            Expanded = False
            Caption = 'General'
            ExpandedHeight = 335
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -12
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object ObjectStateLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 27
              Width = 249
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
              Top = 227
              Width = 249
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
              Top = 177
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Description'
              ExplicitWidth = 60
            end
            object ObjectTitleLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 77
              Width = 249
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
              Top = 127
              Width = 249
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
              Top = 48
              Width = 249
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
              Top = 248
              Width = 249
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
              Top = 282
              Width = 249
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
              Top = 198
              Width = 249
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
            end
            object ObjectPersinstentDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 305
              Width = 249
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
              Top = 98
              Width = 249
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
              Top = 148
              Width = 249
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
            LeftButton.Hint = 'Clear text'
            LeftButton.ImageIndex = 0
            LeftButton.Visible = True
            RightButton.Hint = 'Search ALL'
            RightButton.ImageIndex = 1
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
            LeftButton.Hint = 'Clear text'
            LeftButton.ImageIndex = 0
            LeftButton.Visible = True
            RightButton.Hint = 'Replace ALL'
            RightButton.ImageIndex = 2
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
          Height = 421
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
          Height = 558
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
          ExplicitHeight = 557
          object OptionDateTimeJvScrollMaxBand: TJvScrollMaxBand
            Width = 286
            Height = 26
            Expanded = False
            Caption = 'Date and Time'
            ExpandedHeight = 129
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -12
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            DesignSize = (
              286
              26)
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
            Height = 26
            Expanded = False
            Caption = 'Interface'
            ExpandedHeight = 380
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -12
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            DesignSize = (
              286
              26)
            object OptionTabWidthLabel: TLabel
              Left = 16
              Top = 90
              Width = 53
              Height = 15
              Caption = 'Tab Width'
            end
            object OptionStateDefaultLabel: TLabel
              Left = 16
              Top = 36
              Width = 67
              Height = 15
              Caption = 'Default State'
            end
            object OptionFontSizeLabel: TLabel
              Left = 16
              Top = 63
              Width = 47
              Height = 15
              Caption = 'Font Size'
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
              Top = 212
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
              Top = 235
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
              Top = 258
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
              Top = 120
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Top = 96
              Margins.Right = 16
              Align = alTop
              Caption = ' Auto run'
              TabOrder = 4
            end
            object OptionBackupOnExitCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 304
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
              Top = 166
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
              Top = 281
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
              Top = 189
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
              Top = 143
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
              Top = 327
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
              Top = 350
              Width = 254
              Height = 17
              Hint = 'Show addtional info in the log panel'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Verbose messages'
              TabOrder = 13
            end
          end
          object OptionFoldersJvScrollMaxBand: TJvScrollMaxBand
            Width = 286
            Height = 26
            Expanded = False
            Caption = 'Folders'
            ExpandedHeight = 97
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -12
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            DesignSize = (
              286
              26)
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
            Height = 26
            Expanded = False
            Caption = 'Security'
            ExpandedHeight = 70
            ButtonVisible = True
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -12
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonVisible = False
            ParentButtonFont = False
            DesignSize = (
              286
              26)
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
            Height = 26
            Expanded = False
            Caption = 'Show'
            ExpandedHeight = 70
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -12
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object OptionFoldingLineShowCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 40
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Show folding division line'
              TabOrder = 0
              OnClick = OptionFoldingLineShowCheckBoxClick
            end
          end
          object OptionPythonJvScrollMaxBand: TJvScrollMaxBand
            Width = 286
            Height = 158
            Caption = 'Python'
            ExpandedHeight = 158
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -12
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = []
            Beveled = False
            ParentButtonFont = False
            object OptionPythonVersionLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 40
              Width = 254
              Height = 15
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Version:'
              ExplicitWidth = 41
            end
            object OptionPythonEnvInitSpeedButton: TSpeedButton
              AlignWithMargins = True
              Left = 16
              Top = 123
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
            object OptionPythonRawOutputCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 95
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
              Top = 61
              Width = 254
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Style = csDropDownList
              TabOrder = 1
              OnChange = OptionPythonVersionComboBoxChange
            end
          end
        end
      end
    end
  end
  object StatusBar: TStatusBar
    AlignWithMargins = True
    Left = 3
    Top = 815
    Width = 1262
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
    Left = 313
    Top = 77
    Width = 552
    Height = 588
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'MainPanel'
    ShowCaption = False
    TabOrder = 5
    ExplicitHeight = 587
    object MainPageControl: TPageControl
      Left = 0
      Top = 0
      Width = 552
      Height = 588
      ActivePage = ContentTabSheet
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 587
      object ContentPrevTabSheet: TTabSheet
        Caption = 'Previous'
        ImageIndex = 3
        object ObjectContentPrevDBSynEdit: TDBSynEdit
          Left = 0
          Top = 28
          Width = 544
          Height = 530
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
          BorderStyle = bsNone
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Consolas'
          Gutter.Font.Style = []
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
          SelectedColor.Alpha = 0.400000005960464500
          OnChange = ObjectContentPrevDBSynEditChange
        end
        object ObjectContentPrevTopPanel: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 543
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
        end
      end
      object ContentTabSheet: TTabSheet
        Caption = 'Content'
        object ObjectContentDBSynEdit: TDBSynEdit
          Left = 0
          Top = 28
          Width = 544
          Height = 530
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
          TabOrder = 0
          OnDragOver = ObjectContentDBSynEditDragOver
          OnKeyUp = ObjectContentDBSynEditKeyUp
          OnMouseDown = ObjectContentDBSynEditMouseDown
          OnMouseMove = ObjectContentDBSynEditMouseMove
          BorderStyle = bsNone
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Consolas'
          Gutter.Font.Style = []
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
          SelectedColor.Alpha = 0.400000005960464500
          OnChange = ObjectContentDBSynEditChange
          OnStatusChange = ObjectContentDBSynEditStatusChange
          ExplicitHeight = 529
        end
        object ObjectContentTopPanel: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 543
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
          TabOrder = 1
          object ObjectContentCharCountLabel: TLabel
            AlignWithMargins = True
            Left = 371
            Top = 3
            Width = 164
            Height = 22
            Margins.Right = 8
            Align = alRight
            Caption = 'ObjectContentCharCountLabel'
            Layout = tlCenter
            ExplicitHeight = 15
          end
          object ObjectDBEdit: TDBEdit
            AlignWithMargins = True
            Left = 16
            Top = 3
            Width = 349
            Height = 22
            Margins.Left = 16
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
      end
      object JsonTabSheet: TTabSheet
        Caption = '  Data'
        ImageIndex = 1
        object ObjectDataDBSynEdit: TDBSynEdit
          Left = 0
          Top = 28
          Width = 544
          Height = 530
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
          BorderStyle = bsNone
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Consolas'
          Gutter.Font.Style = []
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
          SelectedColor.Alpha = 0.400000005960464500
          OnChange = ObjectDataDBSynEditChange
        end
        object ObjectDataTopPanel: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 543
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
            Left = 390
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
      object NoteTabSheet: TTabSheet
        Caption = '  Note'
        ImageIndex = 2
        object ObjectNoteDBSynEdit: TDBSynEdit
          Left = 0
          Top = 28
          Width = 544
          Height = 530
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
          BorderStyle = bsNone
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Consolas'
          Gutter.Font.Style = []
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
          SelectedColor.Alpha = 0.400000005960464500
          OnChange = ObjectNoteDBSynEditChange
        end
        object ObjectNoteTopPanel: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 543
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
        end
      end
    end
  end
  object ClientImageList24: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 360
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
    Left = 568
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
    Left = 360
    Top = 264
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
    Left = 568
    Top = 264
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
    object ActionMarkdownAction: TAction
      AutoCheck = True
      Caption = 'Markdown'
      Hint = 'Show the Markdown view'
      ImageIndex = 10
      OnExecute = ActionMarkdownActionExecute
    end
  end
  object ObjectKindImageList16: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 72
    Top = 208
    Bitmap = {
      494C01013E009800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000000001000001002000000000000000
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000008000FF008000FF0080
      00FF008000FF008000FF008000FF008000FF008000FF008000FF008000FF0080
      00FF008000FF008000FF008000FF0000000000000000A84102FFA84102FFA841
      02FFA84102FFA84102FFA84102FFA84102FFA84102FFA84102FFA84102FFA841
      02FFA84102FFA84102FFA84102FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008000FF008000FF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF008000FF008000FFA84102FFA84102FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFA84102FFA84102FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008000FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF008000FFA84102FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFA84102FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008000FF00FFFFFF00FFFFFF0080
      00FF00FFFFFF00FFFFFF00FFFFFF008000FF00FFFFFF008000FF008000FF0080
      00FF00FFFFFF00FFFFFF00FFFFFF008000FFA84102FFFF9400FFFFFFFFFFFFFF
      FFFFFF9400FFFF9400FFFF9400FFFFFFFFFFFF9400FFFFFFFFFFFF9400FFFF94
      00FFFFFFFFFFFFFFFFFFFF9400FFA84102FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008000FF00FFFFFF00FFFFFF0080
      00FF00FFFFFF00FFFFFF00FFFFFF008000FF00FFFFFF008000FF00FFFFFF00FF
      FFFF008000FF00FFFFFF00FFFFFF008000FFA84102FFFF9400FFFFFFFFFFFF94
      00FFFFFFFFFFFF9400FFFFFFFFFFFF9400FFFFFFFFFFFF9400FFFFFFFFFFFF94
      00FFFF9400FFFF9400FFFFFFFFFFA84102FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008000FF00FFFFFF00FFFFFF0080
      00FF00FFFFFF008000FF00FFFFFF008000FF00FFFFFF008000FF00FFFFFF00FF
      FFFF008000FF00FFFFFF00FFFFFF008000FFA84102FFFF9400FFFFFFFFFFFF94
      00FFFFFFFFFFFF9400FFFFFFFFFFFF9400FFFFFFFFFFFF9400FFFFFFFFFFFF94
      00FFFFFFFFFFFFFFFFFFFF9400FFA84102FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008000FF00FFFFFF00FFFFFF0080
      00FF008000FF00FFFFFF008000FF008000FF00FFFFFF008000FF00FFFFFF00FF
      FFFF008000FF00FFFFFF00FFFFFF008000FFA84102FFFF9400FFFFFFFFFFFF94
      00FFFFFFFFFFFF9400FFFFFFFFFFFF9400FFFFFFFFFFFF9400FFFFFFFFFFFFFF
      FFFFFF9400FFFF9400FFFF9400FFA84102FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008000FF00FFFFFF00FFFFFF0080
      00FF00FFFFFF00FFFFFF00FFFFFF008000FF00FFFFFF008000FF008000FF0080
      00FF00FFFFFF00FFFFFF00FFFFFF008000FFA84102FFFF9400FFFFFFFFFFFFFF
      FFFFFF9400FFFF9400FFFFFFFFFFFF9400FFFF9400FFFF9400FFFFFFFFFFFF94
      00FFFFFFFFFFFFFFFFFFFF9400FFA84102FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008000FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF008000FFA84102FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFA84102FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008000FF008000FF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF008000FF008000FFA84102FFA84102FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFA84102FFA84102FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000008000FF008000FF0080
      00FF008000FF008000FF008000FF008000FF008000FF008000FF008000FF0080
      00FF008000FF008000FF008000FF0000000000000000A84102FFA84102FFA841
      02FFA84102FFA84102FFA84102FFA84102FFA84102FFA84102FFA84102FFA841
      02FFA84102FFA84102FFA84102FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F130000000000007F13
      0000000000007F130000000000007F130000000000007F130000000000007F13
      0000000000007F130000000000007F13000000000000000000007F1300007F13
      00007F1300007F1300007F1300007F1300007F1300007F1300007F1300007F13
      00007F1300007F130000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000000000000000007F13000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F1300007F130000BD8C
      5A00BD8C5A00B5845200B5845200B5845200B5845200B5845200B5845200B584
      5200B58452007F1300007F13000000000000000000000000FF000000FF006464
      FF006464FF006464FF006464FF006363FF006363FF006363FF006363FF006262
      FF006262FF000000FF000000FF000000000000000000008400000084000042E7
      5A0042E75A0042BD5A0073B57B005AC6630039DE5A0039E7520039E7520031E7
      520031E752000084000000840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F1300007F1300007F130000B5834A00B583
      4A00B5834A00B5834A00B5834A00B5834A00B5834A00B5834A00B5834A00B583
      4A00B5834A00B5834A007F1300007F1300000000FF000000FF006F6FFF006F6F
      FF006F6FFF006E6EFF006E6EFF006E6EFF006D6DFF006D6DFF006D6DFF006D6D
      FF006C6CFF006C6CFF000000FF000000FF00008400000084000021E7420021E7
      420021BD390084C68C00FFFFFF00DEEFDE0021C6390010DE310010DE310010DE
      310010DE310010DE310000840000008400007F13000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F130000B57C4A00B57C4A00B57C
      4A00B57C4A00B57C4A00B57C4A00B57C4A00B57C4A00B57C4A00B57C4A00B57C
      4A00B57C4A00B57C4A00B57C4A007F1300000000FF007A7AFF007979FF007979
      FF007979FF007979FF007878FF007878FF007777FF007777FF007777FF007777
      FF007676FF007676FF007575FF000000FF000084000010D6310010D6310010CE
      290084B58400FFFFFF00FFFFFF00FFFFFF009CCEA50010BD310010BD290010BD
      290010BD310010BD290010BD3100008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F1300007F130000BD834A00BD834A00BD83
      4A00BD834A00BD834A00BD834A00BD834A00BD834A00BD834A00BD834A00BD83
      4A00BD834A00BD834A00BD834A007F1300000000FF008484FF008383FF008383
      FF008383FF008383FF008282FF008282FF008181FF008181FF008181FF008181
      FF008080FF008080FF008080FF000000FF000084000018C6310018BD310084AD
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFF70042A54A0018AD310018AD
      310018AD310018AD310018AD3100008400007F13000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F130000BF864C00BF864C00BF86
      4C00BF864C00BF864C00BF864C00BF864C00BF864C00BF864C00BF864C00BF86
      4C00BF864C00BF864C00BF864C007F1300000000FF008E8EFF008D8DFF008D8D
      FF008D8DFF008D8DFF008C8CFF008C8CFF008C8CFF008C8CFF008B8BFF008B8B
      FF008A8AFF008A8AFF008A8AFF000000FF000084000021BD31007BBD8400FFFF
      FF00FFFFFF00F7FFF700A5CE9C00FFFFFF00FFFFFF00CEE7CE0029A5390021B5
      390021B5390021B5390021B53900008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F1300007F130000C8865400C8865400C886
      5400C8865400C8865400C8865400C8865400C8865400C8865400C8865400C886
      5400C8865400C8865400C88654007F1300000000FF009898FF009898FF009898
      FF009898FF009797FF009797FF009696FF009696FF009696FF009696FF009595
      FF009595FF009494FF009494FF000000FF000084000039AD4A00FFFFFF00FFFF
      FF00F7FFF70052BD630021AD3900D6E7D600FFFFFF00FFFFFF007BC6840029BD
      420029BD420029BD420029BD4200008400007F13000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F130000C8865400C8865400C886
      5400C8865400C8865400C8865400C8865400C8865400C8865400C8865400C886
      5400C8865400C8865400C88654007F1300000000FF00A2A2FF00A2A2FF00A2A2
      FF00A2A2FF00A1A1FF00A1A1FF00A0A0FF00A0A0FF00A0A0FF00A0A0FF009F9F
      FF009F9FFF009F9FFF009F9FFF000000FF000084000039BD5200BDDEBD00BDEF
      BD005ABD6B0031C64A0039C64A0063B56B00FFFFFF00FFFFFF00EFFFE7004AB5
      520031C64A0031C64A0031C64A00008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F1300007F130000D08E5400D08E5400D08E
      5400D08E5400D08E5400D08E5400D08E5400D08E5400D08E5400D08E5400D08E
      5400D08E5400D08E5400D08E54007F1300000000FF00ACACFF00ACACFF00ACAC
      FF00ACACFF00ABABFF00ABABFF00ABABFF00ABABFF00AAAAFF00AAAAFF00A9A9
      FF00A9A9FF00A9A9FF00A9A9FF000000FF000084000039CE520039CE4A0039C6
      4A0042CE520042CE520042CE520039C65200ADDEB500FFFFFF00FFFFFF00B5DE
      B50042C65A0042CE520042CE5200008400007F13000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F130000D0965C00D0965C00D096
      5C00D0965C00D0965C00D0965C00D0965C00D0965C00D0965C00D0965C00D096
      5C00D0965C00D0965C00D0965C007F1300000000FF00B7B7FF00B7B7FF00B6B6
      FF00B6B6FF00B5B5FF00B5B5FF00B5B5FF00B5B5FF00B4B4FF00B4B4FF00B4B4
      FF00B3B3FF00B3B3FF00B3B3FF000000FF000084000042D65A0042D65A0042D6
      5A0042D65A0042D65A0042D65A0042D65A0052B56300EFFFEF00FFFFFF00FFFF
      FF008CCE8C004ADE630042DE5A00008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F1300007F130000D89E6500D89E6500D89E
      6500D89E6500D89E6500D89E6500D89E6500D89E6500D89E6500D89E6500D89E
      6500D89E6500D89E6500D89E65007F1300000000FF00C1C1FF00C1C1FF00C1C1
      FF00C0C0FF00C0C0FF00BFBFFF00BFBFFF00BFBFFF00BFBFFF00BEBEFF00BEBE
      FF00BDBDFF00BDBDFF00BDBDFF000000FF000084000052DE630052DE630052DE
      63004ADE63004ADE63004AD663004AD6630052D6630084BD8C00FFFFFF00FFFF
      FF00FFFFFF006BC67B005AE77300008400007F13000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F130000D8A67500D8A67500D8A6
      7500D8A67500D8A67500D8A67500D8A67500D8A67500D8A67500D8A67500D8A6
      7500D8A67500D8A67D00D8A67D007F1300000000FF00CBCBFF00CBCBFF00CBCB
      FF00CACAFF00CACAFF00C9C9FF00C9C9FF00C9C9FF00C9C9FF00C8C8FF00C8C8
      FF00C8C8FF00C8C8FF00C7C7FF000000FF000084000063EF7B006BEF840073EF
      840073EF8C007BEF8C007BEF8C007BEF8C007BEF8C0073DE8400C6D6BD00FFFF
      FF00FFFFFF00DEEFDE007BD68C00008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F1300007F130000CEA57300CEA57300CEA5
      7300CEA57300CEA57300CEA57300CEA57300CEA57300CEA57300CEA57300CEA5
      7300CEA57300CEA57B00CEA57B007F1300000000FF00D5D5FF00D5D5FF00D5D5
      FF00D4D4FF00D4D4FF00D4D4FF00D4D4FF00D3D3FF00D3D3FF00D2D2FF00D2D2
      FF00D2D2FF00D2D2FF00D1D1FF000000FF00008400007BEF8C0084EF940084EF
      94008CEF9C008CEF9C0094EF9C0094EF9C008CEF9C008CEF9C0084D69400CEF7
      CE00FFFFFF00FFFFFF00ADEFB500008400007F13000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F1300007F130000D6AD8400D6AD
      8400D6AD8400D6AD8400D6AD8400D6AD8400D6AD8400D6AD8400D6AD8400D6AD
      8400D6AD8400D6AD84007F1300007F1300000000FF000000FF00DFDFFF00DFDF
      FF00DEDEFF00DEDEFF00DEDEFF00DEDEFF00DEDEFF00DDDDFF00DDDDFF00DCDC
      FF00DCDCFF00DCDCFF000000FF000000FF00008400000084000094EFA50094EF
      A5009CEFA5009CEFAD00A5EFAD00A5EFAD009CEFAD009CEFAD009CEFAD009CCE
      9400EFF7E700F7FFEF0000840000008400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F130000000000007F1300007F130000DEB5
      8C00DEB59400DEB59400DEB59400DEB59400DEB69400DEB89400DEB99400DEBB
      9400DEBC94007F1300007F13000000000000000000000000FF000000FF00E9E9
      FF00E9E9FF00E8E8FF00E8E8FF00E8E8FF00E8E8FF00E7E7FF00E7E7FF00E7E7
      FF00E7E7FF000000FF000000FF0000000000000000000084000000840000A5EF
      B500ADEFB500ADEFBD00ADEFBD00ADEFBD00ADEFB500ADEFB500ADEFB500ADEF
      B500A5EFB5000084000000840000000000007F130000000000007F1300000000
      00007F130000000000007F130000000000007F130000000000007F1300000000
      00007F130000000000007F1300000000000000000000000000007F1300007F13
      00007F1300007F1300007F1300007F1300007F1300007F1300007F1300007F13
      00007F1300007F130000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000000000000000
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
      00FF955F37FF955F37FFAF9171FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AF9171FF955F37FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FF955F37FFAF9171FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000955F37FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFFFFFFFFFF94
      00FFFF9400FFFF9400FFFF9400FF955F37FF00000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000030600311D3F
      01992F6701C32F6A00C62F6A00C62F6A00C62F6A00C62F6A00C62F6A00C62F67
      01C31D3F01990306003200000000000000000000000000000000000009320202
      5C99010195C3000099C6000099C6000099C6000099C6000099C6000099C60101
      96C401015C99000009320000000000000000955F37FFFF9400FFFFFFFFFFFFFF
      FFFFFFFFFFFFFF9400FFFF9400FFFFFFFFFFFFFFFFFFFFFFFFFFFF9400FFFF94
      00FFFFFFFFFFFFFFFFFFFF9400FF976038FF000000FF000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF000000FF000000FF00000000112401734EAD00FD4FB0
      00FF4FB000FF4FB000FF4FB000FF4FB000FF50B101FF90CD5DFFC5E5ABFFC8E6
      AFFF9AD16AFF53AF06FD112501750000000000000000010133730101FBFD5D5D
      FFFFABABFFFFAFAFFFFF6A6AFFFF0505FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FBFD0101357500000000955F37FFFF9400FFFF9400FFFF94
      00FFFFFFFFFFFF9400FFFFFFFFFFFF9400FFFFFFFFFFFFFFFFFFFF9400FFFFFF
      FFFFFF9400FFFF9400FFFF9400FF976038FF000000FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF060D00464FAE00FE5FB716FFFFFF
      FFFFFFFFFFFF53B204FF4FB000FF50B000FFC4E4A9FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFD5ECC1FF54B006FE060E0048000013460000FDFEA9A9FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C1FFFF0606FFFF0000FFFF0000FFFF8888
      FFFFFFFFFFFF0000FFFF0000FDFE00001448955F37FFFF9400FFFFFFFFFFFFFF
      FFFFFFFFFFFFFF9400FFFFFFFFFFFF9400FFFF9400FFFFFFFFFFFF9400FFFFFF
      FFFFFF9400FFFF9400FFFF9400FF976038FF000000FFFFFFFFFFFFFFFFFF0000
      00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
      FFFF000000FFFFFFFFFFFFFFFFFF000000FF2D6202BE4FB000FFFFFFFFFF4FB0
      00FF4FB000FFFFFFFFFF4FB000FF89CA53FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF9ED371FF2E6402C002028DBE5353FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7171FFFF0000FFFF0000FFFF7070
      FFFFFFFFFFFF0000FFFF0000FFFF020290C0955F37FFFF9400FFFFFFFFFFFF94
      00FFFF9400FFFF9400FFFFFFFFFFFF9400FFFF9400FFFFFFFFFFFF9400FFFFFF
      FFFFFF9400FFFF9400FFFF9400FF976038FF000000FFFFFFFFFFFFFFFFFF0000
      00FFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000FFFFFFFFFFFFFFFFFFFFFF
      FFFF000000FFFFFFFFFFFFFFFFFF000000FF4BA502F64FB000FFFFFFFFFF4FB0
      00FF4FB000FFFFFFFFFF4FB000FFBBE09CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFD0EABAFF4DA702F80202EDF69C9CFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABAFFFF0000FFFF0000FFFF7070
      FFFFFFFFFFFF0000FFFF0000FFFF0202F1F8955F37FFFF9400FFFFFFFFFFFFFF
      FFFFFFFFFFFFFF9400FFFF9400FFFFFFFFFFFFFFFFFFFF9400FFFF9400FFFFFF
      FFFFFF9400FFFF9400FFFF9400FF976038FF000000FFFFFFFFFFFFFFFFFF0000
      00FFFFFFFFFFFFFFFFFFFFFFFFFF808080FF808080FFFFFFFFFFFFFFFFFFFFFF
      FFFF000000FFFFFFFFFFFFFFFFFF000000FF4DA603F84FB000FFFFFFFFFF4FB0
      00FF4FB000FFFFFFFFFF4FB000FFBCE19EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFD1EABCFF4DA802F90303F0F89E9EFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCFFFF0000FFFF0000FFFF7070
      FFFFFFFFFFFF0000FFFF0000FFFF0202F2F9955F37FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FF976038FF000000FFFFFFFFFFFFFFFFFF0000
      00FFFFFFFFFFFFFFFFFFFFFFFFFF000000FF000000FFFFFFFFFFFFFFFFFFFFFF
      FFFF000000FFFFFFFFFFFFFFFFFF000000FF2F6702C24FB000FFFFFFFFFF4FB0
      00FF4FB000FFFFFFFFFF4FB000FF8DCB57FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFA1D575FF2E6701C2020293C25757FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7575FFFF0000FFFF8888FFFFFFFF
      FFFFFFFFFFFF0000FFFF0000FFFF020295C3955F37FFFF9400FFFF9400FF955F
      37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F
      37FFA1673DFFFF9400FFFF9400FF976038FF000000FFFFFFFFFF000000FF0000
      00FF000000FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFF0000
      00FF000000FF000000FFFFFFFFFF000000FF070F004C4FB000FF63B91DFFFFFF
      FFFFFFFFFFFF56B309FF4FB000FF50B101FFCAE7B1FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFDAEEC8FF55B308FF0710004E0000174D0101FFFFB1B1FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C8FFFF0808FFFF0000FFFF3939FFFF8888
      FFFFFFFFFFFF0000FFFF0000FFFF0000174E955F37FF955F37FF955F37FF955F
      37FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FF955F37FF955F37FF955F37FF905B35FF000000FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00000000122700794FAE00FE4FB0
      00FF4FB000FF4FB000FF4FB000FF4FB000FF51B103FF97D067FFCDE8B6FFD0EA
      BAFFA1D475FF55B108FE142A017D000000000000000001013B7B0303FDFE6767
      FFFFB6B6FFFFBABAFFFF7575FFFF0808FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FDFE01013F7F00000000955F37FF955F37FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FF955F37FF9A6B48FF000000FF000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF000000FF000000FF00000000000000000409003A2147
      01A3377702D1377B00D5377B00D5377B00D5377B00D5377B00D5377B00D53777
      02D1214901A40409003C0000000000000000000000000000000000000D3B0101
      69A40202ABD10000B2D50000B2D50000B2D50000B2D50000B2D50000B2D50202
      ABD1010169A400000E3D0000000000000000AF9171FF955F37FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FF955F37FFAF9171FF00000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AF9171FF955F37FF955F
      37FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FF955F37FF955F37FFA27758FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCF8F2FFE0AA5DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F2DBBCFFD9983BFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EAC797FFD28416FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FFFF0000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000FFFF0000FFFF00000000008000FF008000FF0080
      00FF008000FF008000FF008000FF008000FF008000FF008000FF008000FF0080
      00FF008000FF008000FF008000FF000000000000000000000000000000000000
      000000000000E9C491FFCD7501FFF6E7D2FF0000000000000000000000000000
      00000000000000000000000000000000000000000000008000FF008000FF0080
      00FF008000FF008000FF008000FF008000FF008000FF008000FF008000FF0080
      00FF008000FF008000FF008000FF000000000000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF008000FF008000FF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF008000FF008000FF0000000000000000000000000000
      000000000000EAC797FFCD7400FFE4B673FF0000000000000000000000000000
      000000000000000000000000000000000000008000FF008000FF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF008000FF008000FF0000FFFFFFFFFFFF0000FFFF0000
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000
      FFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFF008000FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF008000FF0000000000000000000000000000
      000000000000F1DABBFFCD7400FFD07B0DFFF8ECDCFF00000000000000000000
      00000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFF0000
      FFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFF008000FF00FFFFFF00FFFFFF00FF
      FFFF008000FF008000FF00FFFFFF00FFFFFF008000FF008000FF008000FF0080
      00FF00FFFFFF00FFFFFF00FFFFFF008000FF0000000000000000000000000000
      000000000000FCF6EEFFCF7908FFCD7400FFD9983AFFFDFAF5FF000000000000
      000000000000000000000000000000000000008000FF008000FF00FFFFFF00FF
      FFFF008000FF008000FF008000FF00FFFFFF008000FF008000FF008000FF00FF
      FFFF008000FF00FFFFFF00FFFFFF008000FF0000FFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFF0000
      FFFF0000FFFF0000FFFFFFFFFFFF0000FFFF008000FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF008000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080
      00FF00FFFFFF00FFFFFF00FFFFFF008000FF0000000000000000000000000000
      00000000000000000000DEA655FFCD7400FFCD7400FFDCA24DFFFDF9F4FF0000
      00000000000000000000000000000000000000FFFFFF008000FF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF008000FF00FFFFFF008000FF00FFFFFF008000FF00FF
      FFFF008000FF00FFFFFF008000FF008000FF0000FFFFFFFFFFFFFFFFFFFF0000
      FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFF
      FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFF008000FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF008000FF00FFFFFF00FFFFFF008000FF008000FF008000FF0080
      00FF00FFFFFF00FFFFFF00FFFFFF008000FFFFFEFEFFF7E8D5FFE6BC82FFDB9D
      44FFD58D27FFD48B22FFD48B23FFCD7400FFCD7400FFCD7400FFD58E29FFF1DA
      BBFFFEFDFBFF00000000000000000000000000FFFFFF008000FF00FFFFFF00FF
      FFFF008000FF008000FF008000FF00FFFFFF008000FF00FFFFFF008000FF00FF
      FFFF008000FF008000FF008000FF008000FF0000FFFFFFFFFFFF0000FFFF0000
      FFFF0000FFFFFFFFFFFF0000FFFF0000FFFF0000FFFFFFFFFFFF0000FFFFFFFF
      FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFF008000FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF008000FF00FFFFFF00FFFFFF008000FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF008000FFDFA95AFFD58F29FFD89637FFD895
      34FFD28416FFCD7400FFCD7400FFCD7400FFCD7400FFCD7400FFCD7400FFCD75
      00FFD58D27FFE1AD63FFE7BD84FFE7BE86FF00FFFFFF008000FF00FFFFFF00FF
      FFFF008000FF00FFFFFF00FFFFFF00FFFFFF008000FF00FFFFFF008000FF00FF
      FFFF008000FF008000FF00FFFFFF008000FF0000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF008000FF00FFFFFF00FFFFFF00FF
      FFFF008000FF008000FF008000FF00FFFFFF008000FF008000FF008000FF0080
      00FF00FFFFFF00FFFFFF00FFFFFF008000FFFCF8F1FFFFFEFDFF000000000000
      0000FEFBF8FFF4E0C6FFDEA553FFCD7501FFCD7400FFCD7500FFD18211FFCE77
      05FFCE7705FFD18212FFDA9B41FFEAC694FF008000FF008000FF008000FF00FF
      FFFF008000FF008000FF008000FF00FFFFFF008000FF008000FF008000FF00FF
      FFFF008000FF00FFFFFF00FFFFFF008000FF0000FFFF0000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000FFFF0000FFFF008000FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF008000FF000000000000000000000000FEFC
      F9FFF2E3CAFFF5EAD7FFFFFEFEFFF0D7B5FFD0800FFFCD7500FFF2DDBFFFFDF9
      F3FFFDF9F3FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF0000FFFF00000000008000FF008000FF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF008000FF008000FF0000000000000000FFFEFDFFD4A3
      4CFFC27903FFC37B06FFE3C48EFF00000000F1D8B7FFCE7602FFE6BD83FF0000
      000000000000000000000000000000000000008000FF008000FF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF008000FF008000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000008000FF008000FF0080
      00FF008000FF008000FF008000FF008000FF008000FF008000FF008000FF0080
      00FF008000FF008000FF008000FF000000000000000000000000F4E7D1FFC27A
      04FFC27903FFC27903FFC8891AFF0000000000000000DDA350FFE1AD63FF0000
      00000000000000000000000000000000000000000000008000FF008000FF0080
      00FF008000FF008000FF008000FF008000FF008000FF008000FF008000FF0080
      00FF008000FF008000FF008000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F2E7FFC481
      0BFFC27903FFC27903FFCF9938FF0000000000000000EFD5B0FFE2B068FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EBD4
      ACFFCF9938FFD3A148FFF5EAD6FF0000000000000000FBF4EAFFEFD3ACFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AF91
      71FF955F37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F
      37FFAF9171FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7B1A9FF9E9992FF9E99
      92FF9A958EFF9A958EFF9A958EFF9A958EFF9A958EFF9A958EFF9A958EFF9A95
      8EFF9A958EFF9A958EFF9A958EFFAAA49CFF00000000AF9171FF955F37FF955F
      37FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FF955F37FF955F37FFAF9171FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D79C6DFFB95832FFAB4D2AFFAB4D
      2AFFA94B29FFA94B29FFA94B29FFA94B29FFA94B29FFA94B29FFA94B29FFA94B
      29FFA94B29FFAA4D29FFA94B29FFA7724DFFAF9171FF955F37FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FF955F37FFAF9171FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D38147FF514438FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF514438FFD38147FF955F37FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FF955F37FF00000000008000FF008000FF0080
      00FF008000FF008000FF008000FF008000FF008000FF008000FF008000FF0080
      00FF008000FF008000FF008000FF0000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF00000000E78F51FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFD27A45FF955F37FFFF9400FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF9400FFFF9400FFFFFFFFFFFF9400FFFF9400FFFFFF
      FFFFFFFFFFFFFFFFFFFFFF9400FF976038FF008000FF008000FF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF008000FF008000FF000000FF000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF000000FF000000FFE58C4EFF000000FF000000FF4444
      44FFFFFFFFFFFFFFFFFF444444FF000000FF000000FF000000FF000000FF4444
      44FFFFFFFFFF000000FF000000FFD07742FF955F37FFFF9400FFFFFFFFFFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFFFFFFFFFF9400FFFF9400FFFFFF
      FFFFFF9400FFFF9400FFFF9400FF976038FF008000FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF008000FF000000FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFE4884CFF000000FF000000FFFFFF
      FFFF444444FF444444FFFFFFFFFF000000FFFFFFFFFF000000FF000000FFFFFF
      FFFF444444FF000000FF000000FFCF7340FF955F37FFFF9400FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF9400FFFF9400FFFFFFFFFFFF9400FFFF9400FFFFFF
      FFFFFF9400FFFF9400FFFF9400FF976038FF008000FF00FFFFFF008000FF00FF
      FFFF008000FF00FFFFFF00FFFFFF008000FF00FFFFFF00FFFFFF008000FF00FF
      FFFF00FFFFFF008000FF00FFFFFF008000FF000000FFFFFFFFFF000000FF0000
      00FF000000FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFF0000
      00FF000000FF000000FFFFFFFFFF000000FFE3854AFF000000FF000000FFFFFF
      FFFF000000FF000000FF000000FF000000FF000000FF000000FF444444FFFFFF
      FFFF000000FF000000FF000000FFCE703EFF955F37FFFF9400FFFFFFFFFFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFFFFFFFFFF9400FFFF9400FFFFFF
      FFFFFF9400FFFF9400FFFF9400FF976038FF008000FF00FFFFFF008000FF00FF
      FFFF008000FF00FFFFFF00FFFFFF008000FF00FFFFFF00FFFFFF008000FF00FF
      FFFF00FFFFFF008000FF00FFFFFF008000FF000000FFFFFFFFFFFFFFFFFF0000
      00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFF000000FF000000FFFFFFFFFFFFFF
      FFFF000000FFFFFFFFFFFFFFFFFF000000FFE28148FF000000FF000000FFFFFF
      FFFF444444FF444444FFFFFFFFFF000000FFFFFFFFFF000000FFFFFFFFFF4444
      44FF000000FF000000FF000000FFCD6C3CFF955F37FFFF9400FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF9400FFFFFFFFFFFFFFFFFFFFFFFFFFFF9400FFFFFF
      FFFFFF9400FFFF9400FFFF9400FF976038FF008000FF00FFFFFF008000FF0080
      00FF008000FF00FFFFFF00FFFFFF008000FF00FFFFFF00FFFFFF008000FF00FF
      FFFF00FFFFFF008000FF00FFFFFF008000FF000000FFFFFFFFFFFFFFFFFF0000
      00FFFFFFFFFFFFFFFFFF000000FF000000FF000000FF000000FFFFFFFFFFFFFF
      FFFF000000FFFFFFFFFFFFFFFFFF000000FFE07845FF000000FF000000FF4444
      44FFFFFFFFFFFFFFFFFF444444FF000000FF000000FF000000FFFFFFFFFF0000
      00FF000000FF000000FF000000FFCB6739FF955F37FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FF976038FF008000FF00FFFFFF008000FF00FF
      FFFF008000FF00FFFFFF00FFFFFF008000FF00FFFFFF00FFFFFF008000FF0080
      00FF008000FF008000FF00FFFFFF008000FF000000FFFFFFFFFFFFFFFFFF0000
      00FFFFFFFFFFFFFFFFFF000000FF000000FFFFFFFFFF000000FFFFFFFFFFFFFF
      FFFF000000FFFFFFFFFFFFFFFFFF000000FFDF7442FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFCA6336FF955F37FFFF9400FFFF9400FF955F
      37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F
      37FFA1673DFFFF9400FFFF9400FF976038FF008000FF00FFFFFF008000FF00FF
      FFFF008000FF00FFFFFF008000FF008000FF008000FF00FFFFFF008000FF00FF
      FFFF00FFFFFF008000FF00FFFFFF008000FF000000FFFFFFFFFF000000FF0000
      00FF000000FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFF0000
      00FF000000FF000000FFFFFFFFFF000000FFDD7040FF514438FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF514438FFC85F34FF955F37FF955F37FF955F37FF955F
      37FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FF955F37FF955F37FF955F37FF905B35FF008000FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF008000FF000000FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFDF6D3FFFDA693CFFCA5C33FFCA5C
      33FFC75A31FFC75A31FFC75A31FFC75A31FFC75A31FFC75A31FFC75A31FFC75A
      31FFC75A31FFC95C32FFC75A31FFC75A31FF955F37FF955F37FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FF955F37FF9A6B48FF008000FF008000FF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF008000FF008000FF000000FF000000FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF000000FF000000FFD57318FFE38D28FFE3871DFFE387
      1DFFE3861BFFE38719FFE3851AFFE3871CFFE3861BFFE38414FFE18111FFE385
      19FFE58618FFE08723FFCA792DFFC15D1DFFAF9171FF955F37FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FF955F37FFAF9171FF00000000008000FF008000FF0080
      00FF008000FF008000FF008000FF008000FF008000FF008000FF008000FF0080
      00FF008000FF008000FF008000FF0000000000000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF00000000EABCA7FFB36242FFB36142FFB361
      42FFB36142FFB36142FFB36142FFB36142FFB36142FFB36142FFB36142FFB361
      42FFB36142FFB36141FFD15A36FFE39984FF00000000AF9171FF955F37FF955F
      37FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FF955F37FF955F37FFA27758FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AF91
      71FF955F37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F37FF955F
      37FFAF9171FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000727CD6FF0014B5FF0014
      B6FF0015B6FF0014B6FF0014B6FF3642C3FF2E3BC0FF0015B6FF0015B6FF0015
      B6FF0014B7FF0114B5FF7985D9FF00000000000000000000000000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007686E0FF001DC5FF001D
      C5FF001DC5FF001DC5FF011CC6FF808CDFFF7484DDFF001DC5FF001DC5FF001D
      C5FF001DC5FF001DC6FF7A8AE0FF0000000000000000000000009E3F0A009B3D
      0A009B3D0A0098380A0095360A0092330A0091310A008D2F0A008C2D0A00892B
      0A00872A0A0087290A00C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000788CE8FF0025D4FF0026
      D3FF0026D3FF0026D3FF0427D4FFD3D8F3FFC0C9F0FF0025D4FF0026D3FF0026
      D3FF0026D3FF0025D4FF8091E8FF000000000000000000000000A1420A00FFFF
      FC00FFFFF800FFFFEF00FFFEEC00FFFAE500FFFAE200FFF5DA00FFF3D600FFEF
      CE00FFEDCB00872A0A00C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009BACF1FF0431E3FF0332
      E3FF0332E3FF0432E3FF3455E5FFE9EDF2FFECEFF2FF2347E4FF0631E2FF0332
      E3FF0332E3FF0531E4FFBBC7F6FF000000000000000000000000A7480A00FFFF
      FF00FFFFFF00FFFBEA00FFFBED00FFFCEA00FFF9E700FFF9E000FFF5DA00FFF0
      D300FFEDCF008A2B0A00C0C0C0000000000000000000008000FF008000FF0080
      00FF008000FF008000FF008000FF008000FF008000FF008000FF008000FF0080
      00FF008000FF008000FF008000FF0000000000000000085207FF085207FF0852
      07FF085207FF085207FF085207FF085207FF085207FF085207FF085207FF0852
      07FF085207FF085207FF085207FF0000000000000000ECEFFCFF3960F2FF3C65
      F4FF3C65F4FF3C65F2FF879CE8FFCDD5E2FFD8DCE2FF8298E7FF3C65F2FF3C65
      F4FF3B66F2FF456AF2FFF6F8FDFF000000000000000000000000AB4A0A00FFFF
      FF00FFFFFF00FFFBED00FFFAE900FFFBEB00FFFBE900FFF7E200FFF8DF00FFF2
      D700FFEBCE008B2D0A00C0C0C00000000000008000FF008000FF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF008000FF008000FF085207FF085207FF1DB200FF1DB2
      00FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB2
      00FF1DB200FF1DB200FF085207FF085207FF0000000000000000D5DDFDFF7B9B
      FAFF85A3FEFF7597FAFFD0D5E9FFB5C0D3FFC1C8D5FFCDD3E9FF7699FAFF85A3
      FEFF799BF8FFCDD8FCFF00000000000000000000000000000000AD4E0A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFF5E400FFF8EA00FFF9E700FFF6E400FFF6
      DD00FFF2D7008F300A00C0C0C00000000000008000FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF008000FF085207FF1DB200FF1DB200FF1DB2
      00FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB2
      00FF1DB200FF1DB200FF1DB200FF085207FF0000000000000000000000001415
      26FF141526FF899ACAFFB5C1D3FF93AACFFF93A9CFFFB3C0D7FF8697C7FF1415
      26FF141526FF0000000000000000000000000000000000000000B1520A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7E800FFF2E100FFF8E800FFF8E600FFF4
      DF00FFF5DC0091320A00C0C0C00000000000008000FF00FFFFFF008000FF0080
      00FF008000FF00FFFFFF008000FF008000FF008000FF008000FF00FFFFFF0080
      00FF008000FF008000FF00FFFFFF008000FF085207FF1DB200FFFFFFFFFFFBFF
      FFFFF1FEFCFF1DB200FFF3FFFDFFF9FBFFFFF4FFFFFF1DB200FF1DB200FFFFFF
      FFFFFFFFFFFF1DB200FF1DB200FF085207FF0000000000000000000000001415
      26FF141526FF90A3C9FFAAC3EFFFA9C1EEFFA3BDEAFF97B3E5FF738DB9FF0E11
      22FF141526FF0000000000000000000000000000000000000000B6570A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDECDB00FFF5E600FFF6
      E400FFF3E10095360A00C0C0C00000000000008000FF00FFFFFF008000FF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008000FF00FFFFFF00FF
      FFFF00FFFFFF008000FF00FFFFFF008000FF085207FF1DB200FFF6FFFFFF1DB2
      00FF1DB200FF1DB200FF1DB200FF1DB200FFFFFEFFFF1DB200FF1DB200FFFFFF
      FFFFFFFFFFFF1DB200FF1DB200FF085207FF0000000000000000000000001415
      26FF8293B4FFBACFF6FFC0D4F8FFBED3F8FFB5CAF3FFA7BFEDFF94B2E4FF667D
      A7FF333542FF0000000000000000000000000000000000000000B7590A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF5E800FBEBDA00FFF5
      E600FFF5E30098380A00C0C0C00000000000008000FF00FFFFFF008000FF00FF
      FFFF00FFFFFF00FFFFFF008000FF008000FF008000FF008000FF00FFFFFF0080
      00FF008000FF008000FF00FFFFFF008000FF085207FF1DB200FFFFFDFFFF1DB2
      00FF1DB200FF1DB200FFFFFBFFFFFEFDFFFFFFFFF9FF1DB200FFFBFDFFFF1DB2
      00FF1DB200FFFFFFFFFF1DB200FF085207FF0000000000000000000000001415
      26FFBAD0F5FFCEDFFCFFDDE8FDFFD7E5FCFFC5D7F9FFB2C8F2FF9EB9E8FF8EAD
      DFFF141526FF0000000000000000000000000000000000000000BC5E0A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9E9
      D800FFF2E400A1420A00C0C0C00000000000008000FF00FFFFFF008000FF00FF
      FFFF00FFFFFF00FFFFFF008000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080
      00FF00FFFFFF00FFFFFF00FFFFFF008000FF085207FF1DB200FFFAFFFFFF1DB2
      00FF1DB200FF1DB200FFF9FFFAFF1DB200FF1DB200FF1DB200FFFAFFFDFF1DB2
      00FF1DB200FFFFFFFFFF1DB200FF085207FF0000000000000000000000001415
      26FFC2D6F9FFE1EBFDFFF4F9FEFFEDF3FDFFD2E0FCFFB8CEF5FFA3BDEBFF92B0
      E2FF141526FF0000000000000000000000000000000000000000BD600A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF4
      E700F8E8D700A5460A00C0C0C00000000000008000FF00FFFFFF008000FF0080
      00FF008000FF00FFFFFF008000FF008000FF008000FF008000FF00FFFFFF0080
      00FF008000FF008000FF00FFFFFF008000FF085207FF1DB200FFFFFFFFFFFFFE
      FFFFE5FFF8FF1DB200FFFFFFF9FFFDFDFFFFFEFFFAFF1DB200FFFDFFFCFF1DB2
      00FF1DB200FFFFFFFFFF1DB200FF085207FF0000000000000000000000001415
      26FFC0D5F8FFDDE9FDFFF0F5FDFFE9F1FDFFD0DFFCFFB6CDF5FF98B0DBFF4755
      70FF141526FF0000000000000000000000000000000000000000C0630A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00AB4A0A00C0C0C00000000000008000FF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF008000FF085207FF1DB200FF1DB200FF1DB2
      00FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB2
      00FF1DB200FF1DB200FF1DB200FF085207FF000000000000000000000000A6A8
      AFFF141526FF8F9CB7FF98A1B5FFA8B4CCFFBDD1F4FF99ADD4FF1E253EFF1015
      2FFFC5C5CBFF0000000000000000000000000000000000000000C2650A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00AD4E0A00C0C0C00000000000008000FF008000FF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF
      FFFF00FFFFFF00FFFFFF008000FF008000FF085207FF085207FF1DB200FF1DB2
      00FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB200FF1DB2
      00FF1DB200FF1DB200FF085207FF085207FF000000000000000000000000F9F9
      F9FF585D73FF1E2445FF1E2445FF1D2444FF333B5CFF363E60FF1D2444FF565A
      71FFFDFDFDFF0000000000000000000000000000000000000000C6690A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B1520A00C0C0C0000000000000000000008000FF008000FF0080
      00FF008000FF008000FF008000FF008000FF008000FF008000FF008000FF0080
      00FF008000FF008000FF008000FF0000000000000000085207FF085207FF0852
      07FF085207FF085207FF085207FF085207FF085207FF085207FF085207FF0852
      07FF085207FF085207FF085207FF000000000000000000000000000000000000
      0000F0F0F2FF727689FF575C75FF595C76FF595C75FF575B74FF7B8292FFF0F1
      F2FF000000000000000000000000000000000000000000000000C76B0A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B3540A00C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFCFCFFD6D7DCFFBABBC5FFBABCC5FFD4D5D9FFFDFDFDFF0000
      0000000000000000000000000000000000000000000000000000CA6D0A00C96B
      0A00C76B0A00C5680A00C4650A00C0630A00BF610A00BC5E0A00B95C0A00B657
      0A00B1520A00B7590A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000FCFCFC00BABABA00BABABA00FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000370101019C020202DD010101FD010101FD020202DE0101019D0000
      00390000000000000000000000000000000000000000FFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFF
      FFFF00000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00B7B7B7005A5A5A0063636300636363005A5A5A00B7B7B700FCFC
      FC000000000000000000000000000000000000000000000000000000000F0202
      02A6000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF020202A80000000F0000000000000000000000FF000000FFFFFFFFFF0000
      0000000000FFFFFFFFFF00000000000000FFFFFFFFFF00000000000000FFFFFF
      FFFF00000000000000FF000000FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FCFCFC00B7B7
      B7005A5A5A0063636300C3C3C3000000000000000000C3C3C300636363005A5A
      5A00B7B7B700FCFCFC0000000000000000000000000000000010010101CC0000
      00FF000000FD020202A4010101490000001E0000001E00000047010101A20000
      00FD000000FF000000CC0000001100000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000FCFCFC00B7B7B7005A5A5A006363
      6300C3C3C300000000000000000000000000000000000000000000000000C3C3
      C300636363005A5A5A00B7B7B700FCFCFC0000000000020202AC000000FF0202
      02EE0000003E0000000000000000000000000000000000000000000000000000
      003E000000EB000000FF020202AF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF006E3D3D006E3D3D006E3D3D006E3D3D006E3D3D006E3D3D00FFFF
      FF0000000000000000000000000000000000A5A5A5005D5D5D00C3C3C3000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      000000000000C3C3C3005D5D5D00A2A2A20000000040000000FF000000FD0000
      003F0000000000000000000000070000003E0000003E00000003000000000000
      00000000003C000000FD000000FF00000041FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000FFFF
      FF006E3D3D000000000000000000000000000000000000000000000000006E3D
      3D00FFFFFF000000000000000000000000009F9F9F009F9F9F00000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      000000000000000000009F9F9F009F9F9F00020202A5000000FF020202A80000
      000000000000000000000000001C000000FF000000FF0000000E000000000000
      000000000000020202A5000000FF010101A6000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF00000000FFFFFF00FFFFFF006E3D
      3D006E3D3D00FFFFFF0000000000000000000000000000000000FFFFFF006E3D
      3D006E3D3D00FFFFFF00FFFFFF00000000009F9F9F009F9F9F00000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      000000000000000000009F9F9F009F9F9F00020202E2000000FF000000500000
      000000000000000000000000001C000000FF000000FF0000000E000000000000
      0000000000000101014E000000FF020202E40000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E3D3D006E3D3D006E3D
      3D006E3D3D006E3D3D006E3D3D0000000000000000006E3D3D006E3D3D006E3D
      3D006E3D3D006E3D3D006E3D3D00000000009F9F9F009F9F9F00000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      000000000000000000009F9F9F009F9F9F00020202FE000000FF0000002C0000
      000000000000000000000000001C000000FF000000FF0000000E000000000000
      0000000000000000002C000000FF010101FFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000006E3D
      3D006E3D3D000000000000000000000000000000000000000000000000006E3D
      3D006E3D3D000000000000000000000000009F9F9F009F9F9F00000000000000
      000000000000000000000000FF000000FF00000000000000FF000000FF000000
      000000000000000000009F9F9F009F9F9F00030303F6000000FF000000360000
      000000000000000000000000001C000000FF000000FF0000000E000000000000
      00000000000000000034000000FF030303F8000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      00006E3D3D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006E3D
      3D00000000000000000000000000000000009F9F9F009F9F9F00000000000000
      000000000000000000000000FF000000FF00000000000000FF000000FF000000
      000000000000000000009F9F9F009F9F9F00030303CC000000FF010101710000
      000000000000000000000000001C000000FF000000FF0000000E000000000000
      0000000000000101016E000000FF020202CD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006E3D3D006E3D3D006E3D3D006E3D3D006E3D3D006E3D3D000000
      0000000000000000000000000000000000009F9F9F009F9F9F00000000000000
      000000000000000000000000FF000000FF00000000000000FF000000FF000000
      000000000000000000009F9F9F009F9F9F000101017E000000FF020202DA0000
      000700000000000000000000001C000000FF000000FF0000000E000000000000
      000000000006020202D9000000FF0101017FFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A8A8A80057575700B7B7B700FCFC
      FC0000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000FCFCFC00B7B7B70057575700A8A8A80000000015010101EF000000FF0202
      029900000000000000000000001C000000FF000000FF0000000E000000000000
      000102020297000000FF000000F000000015000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3C3C300636363005A5A
      5A00B7B7B700FCFCFC0000000000000000000000000000000000FCFCFC00B7B7
      B7005A5A5A0063636300C3C3C300000000000000000001010158000000FF0000
      00FF00000000000000000000001C000000FF000000FF0000000E0000001B0202
      02AB000000FF000000FF0101015C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C3C3
      C300636363005A5A5A00B7B7B700FCFCFC00FCFCFC00B7B7B7005A5A5A006363
      6300C3C3C30000000000000000000000000000000000000000000101016B0000
      00FB00000000000000FF000000FF000000FF000000FF0000000E0000009C0000
      00FF000000FC0101016C0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C3C3C300636363005A5A5A005A5A5A0063636300C3C3C3000000
      0000000000000000000000000000000000000000000000000000000000000000
      003700000000000000FF000000FF000000FF000000FF0000000E0000009C0303
      03C800000039000000000000000000000000000000FFFFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFF
      FFFF00000000FFFFFFFF000000FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C3C3C300C3C3C30000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000031020202AF030303FD020202FF0000000E000000110000
      000000000000000000000000000000000000000000FF000000FFFFFFFFFF0000
      0000000000FFFFFFFFFF00000000000000FFFFFFFFFF00000000000000FFFFFF
      FFFF00000000000000FF000000FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000118000FF118000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CC2D00FFCC2D00FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000069FFFF0069FFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000118000FF118000FFCBCBCBFF118000FF118000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CC2D00FFCC2D00FFCBCBCBFFCC2D00FFCC2D00FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000069FFFF0069FFFFCBCBCBFF0069FFFF0069FFFF0000
      0000000000000000000000000000000000000679ADFF0679ADFF0679ADFF0679
      ADFF0679ADFF0679ADFF0679ADFF0679ADFF0679ADFF0679ADFF0679ADFF0679
      ADFF0679ADFF27719CFF00000000000000000000000000000000000000000000
      000000000000118000FF118000FF118000FFCBCBCBFFCBCBCBFFCBCBCBFF1180
      00FF118000FF0000000000000000000000000000000000000000000000000000
      000000000000CC2D00FFCC2D00FFCC2D00FFCBCBCBFFCBCBCBFFCBCBCBFFCC2D
      00FFCC2D00FF0000000000000000000000000000000000000000000000000000
      0000000000000069FFFF0069FFFF0069FFFFCBCBCBFFCBCBCBFFCBCBCBFF0069
      FFFF0069FFFF0000000000000000000000000679ADFF06BDF7FF06BDF7FF06B5
      F7FF06B5EFFF06ADEFFF06ADE7FF06A5E7FF06A5DEFF069CDEFF069CD6FF069C
      D6FF0694CEFF0E699CFF00000000000000000000000000000000000000000000
      0000118000FF118000FF118000FF118000FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF118000FF118000FF000000000000000000000000000000000000
      0000CC2D00FFCC2D00FFCC2D00FFCC2D00FFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCC2D00FFCC2D00FF000000000000000000000000000000000000
      00000069FFFF0069FFFF0069FFFF0069FFFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFF0069FFFF0069FFFF000000000679ADFF16A5D6FF06BDFFFF06BD
      FFFF06B5F7FF06B5F7FF06B5EFFF06ADEFFF06ADE7FF06A5E7FF06A5DEFF069C
      DEFF069CD6FF0679BDFF94ADBDFF000000000000000000000000000000001180
      00FF118000FF118000FF118000FF118000FFFFCC61FFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFF118000FF000000000000000000000000CC2D
      00FFCC2D00FFCC2D00FFCC2D00FFCC2D00FFFFCC60FFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFFCC2D00FF0000000000000000000000000069
      FFFF0069FFFF0069FFFF0069FFFF0069FFFFFFCC61FFCBCBCBFFCBCBCBFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFF0069FFFF0679ADFF1F8CBDFF06BDFFFF06BD
      FFFF06BDFFFF06BDF7FF06B5F7FF06B5EFFF06ADEFFF06ADE7FF06A5E7FF06A5
      DEFF069CDEFF069CD6FF4884A5FF000000000000000000000000118000FF1180
      00FF118000FF118000FF118000FFFFCC61FF09CC00FF118000FF118000FFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFF000000000000000000000000CC2D00FFCC2D
      00FFCC2D00FFCC2D00FFCC2D00FFFFCC60FFFF6000FFCC2D00FFCC2D00FFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFF0000000000000000000000000069FFFF0069
      FFFF0069FFFF0069FFFF0069FFFFFFCC61FF00D8FFFF0069FFFF0069FFFFCBCB
      CBFFCBCBCBFFCBCBCBFFCBCBCBFF000000000679ADFF1684B5FF0EC6FFFF06BD
      FFFF06BDFFFF06BDFFFF06BDFFFF06B5F7FF06B5F7FF06ADEFFF06ADEFFF06AD
      E7FF06A5E7FF06A5DEFF2779A5FF0000000000000000118000FF118000FF1180
      00FF118000FF118000FFFFCC61FF09CC00FF09CC00FF09CC00FF09CC00FF1180
      00FF118000FFCBCBCBFFCBCBCBFF0000000000000000CC2D00FFCC2D00FFCC2D
      00FFCC2D00FFCC2D00FFFFCC60FFFF6000FFFF6000FFFF6000FFFF6000FFCC2D
      00FFCC2D00FFCBCBCBFFCBCBCBFF00000000000000000069FFFF0069FFFF0069
      FFFF0069FFFF0069FFFFFFCC61FF00D8FFFF00D8FFFF00D8FFFF00D8FFFF0069
      FFFF0069FFFFCBCBCBFFCBCBCBFF000000000679ADFF0671A5FF61EFFFFF61EF
      FFFF61EFFFFF61EFFFFF61EFFFFF61EFFFFF06BDF7FF06B5F7FF06B5EFFF06AD
      EFFF06ADE7FF06A5E7FF0E84BDFFA5B5BDFF118000FF118000FF118000FF1180
      00FF118000FFFFCC61FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC
      00FF09CC00FF118000FF118000FF00000000CC2D00FFCC2D00FFCC2D00FFCC2D
      00FFCC2D00FFFFCC60FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF60
      00FFFF6000FFCC2D00FFCC2D00FF000000000069FFFF0069FFFF0069FFFF0069
      FFFF0069FFFFFFCC61FF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8
      FFFF00D8FFFF0069FFFF0069FFFF000000000679ADFF0E79ADFF0679ADFF0679
      ADFF0679ADFF0679ADFF0679ADFF0679ADFF61EFFFFF06BDFFFF06B5F7FF06B5
      F7FF06ADEFFF06ADE7FF06A5DEFF508CADFF118000FF118000FF118000FF1180
      00FFFFCC61FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC
      00FF09CC00FF09CC00FF09CC00FF118000FFCC2D00FFCC2D00FFCC2D00FFCC2D
      00FFFFCC60FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF60
      00FFFF6000FFFF6000FFFF6000FFCC2D00FF0069FFFF0069FFFF0069FFFF0069
      FFFFFFCC61FF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8
      FFFF00D8FFFF00D8FFFF00D8FFFF0069FFFF0679ADFF58EFFFFF40BDD6FF40BD
      D6FF40BDD6FF40BDD6FF40BDD6FF40BDD6FF0679ADFF61EFFFFF61EFFFFF61EF
      FFFF61EFFFFF61EFFFFF06ADEFFF2F79ADFF118000FF118000FF118000FFFFCC
      61FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC
      00FF09CC00FF09CC00FF09CC00FF00000000CC2D00FFCC2D00FFCC2D00FFFFCC
      60FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF60
      00FFFF6000FFFF6000FFFF6000FF000000000069FFFF0069FFFF0069FFFFFFCC
      61FF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8
      FFFF00D8FFFF00D8FFFF00D8FFFF000000000679ADFFADFFFFFF58EFFFFF58EF
      FFFF58EFFFFF58EFFFFF58EFFFFF50DEEFFF40BDD6FF0679ADFF0679ADFF0679
      ADFF0679ADFF0679ADFF0679ADFF2784ADFF118000FF118000FFFFCC61FF09CC
      00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC
      00FF09CC00FF09CC00FF0000000000000000CC2D00FFCC2D00FFFFCC60FFFF60
      00FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF60
      00FFFF6000FFFF6000FF00000000000000000069FFFF0069FFFFFFCC61FF00D8
      FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8
      FFFF00D8FFFF00D8FFFF00000000000000000679ADFFADFFFFFF50EFFFFF58EF
      FFFF58EFFFFF61EFFFFF61F7FFFF58EFFFFF50DEEFFF40BDD6FF40BDD6FF40BD
      D6FF40BDD6FF0679ADFFBDBDC6FFC6C6C6FF118000FFFFCC61FF09CC00FF09CC
      00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC
      00FF09CC00FF000000000000000000000000CC2D00FFFFCC60FFFF6000FFFF60
      00FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF60
      00FFFF6000FF0000000000000000000000000069FFFFFFCC61FF00D8FFFF00D8
      FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8
      FFFF00D8FFFF0000000000000000000000000679ADFFADFFFFFF61F7FFFF69F7
      FFFF69F7FFFF71F7FFFF71F7FFFF79FFFFFF79FFFFFF84FFFFFF84FFFFFF84FF
      FFFF84FFFFFF0679ADFF0000000000000000FFCC61FF09CC00FF09CC00FF09CC
      00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC
      00FF00000000000000000000000000000000FFCC60FFFF6000FFFF6000FFFF60
      00FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF60
      00FF00000000000000000000000000000000FFCC61FF00D8FFFF00D8FFFF00D8
      FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8
      FFFF000000000000000000000000000000000679ADFFADFFFFFF71F7FFFF71F7
      FFFF79FFFFFF79F7FFFF79F7FFFF0679ADFF0679ADFF0679ADFF0679ADFF0679
      ADFF0679ADFF79ADC6FF0000000000000000000000000000000009CC00FF09CC
      00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF0000
      0000000000000000000000000000000000000000000000000000FF6000FFFF60
      00FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FF0000
      000000000000000000000000000000000000000000000000000000D8FFFF00D8
      FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF0000
      000000000000000000000000000000000000000000000679ADFFADFFFFFFADFF
      FFFFADFFFFFFADFFFFFF0679ADFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000009CC00FF09CC00FF09CC00FF09CC00FF09CC00FF09CC00FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF6000FFFF6000FFFF6000FFFF6000FFFF6000FFFF6000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF00D8FFFF000000000000
      000000000000000000000000000000000000C6C6C6FF000000000679ADFF0679
      ADFF0679ADFF0679ADFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000009CC00FF09CC00FF09CC00FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF6000FFFF6000FFFF6000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000D8FFFF00D8FFFF00D8FFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FF000000000000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DADAFEFF7474FEFF3131FEFF0F0FFEFF0F0FFEFF3131FEFF7474FEFFD9D9
      FEFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000180080FF180080FF00000000000000000000
      000000000000000000000000000000000000C27A00FFC27A00FFC27A00FFC27A
      00FFCE9634FFEEDABAFFEDDBB9FFCB8F27FFC27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FF0000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000F9F9FFFF7474
      FEFF0202FEFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0202
      FEFF7474FEFFF9F9FFFF00000000000000000000000000000000000000000000
      00000000000000000000180080FF180080FFC6C6C6FF180080FF180080FF0000
      000000000000000000000000000000000000C27A00FFC27A00FFC27A00FFC27A
      00FFD3A048FFFEFFFFFFFFFFFEFFCD9638FFC27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FF0000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000000000
      00000000000000000000000000000000000000000000F9F9FFFF4C4CFEFF0000
      FFFF0000FFFF1D1DFEFF7979FEFFA8A8FEFFA8A8FEFF7A7AFEFF1E1EFEFF0000
      FFFF0000FFFF4A4AFEFFF9F9FFFF000000000000000000000000000000000000
      000000000000180080FF0000C6FF180080FFC6C6C6FFC6C6C6FFC6C6C6FF1800
      80FF180080FF000000000000000000000000C27A00FFC27A00FFC27A00FFC27A
      00FFD2A046FFFDFFFFFFFFFFFEFFCD9639FFC27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FF000000FF000000FF000000FF0000
      00FF000000000000000000000000000000FF000000FF00000000000000000000
      0000000000FF000000FF000000FF000000FF000000007676FEFF0000FFFF0000
      FFFF7575FEFFF8F8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0FFFF0202
      FEFF0000FFFF0000FFFF7474FEFF000000000000000000000000000000000000
      0000180080FF0000C6FF0000C6FF180080FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
      C6FFC6C6C6FF180080FF180080FF00000000C27A00FFC27A00FFC27A00FFC27A
      00FFD2A046FFFDFFFDFFFFFFFEFFCD9639FFC27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FF000000FF000000FF000000FF0000
      00FF000000000000000000000000000000FF000000FF00000000000000000000
      0000000000FF000000FF000000FF000000FFDBDBFEFF0101FEFF0000FFFF7575
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4FEFF1414FEFF0000
      FFFF0303FEFF0000FFFF0202FEFFDADAFEFF0000000000000000000000001800
      80FF0000C6FF0000C6FF0000C6FF0000C6FF00D8FFFFC6C6C6FFC6C6C6FFC6C6
      C6FFC6C6C6FFC6C6C6FFC6C6C6FF180080FFC27A00FFC27A00FFC27A00FFC27A
      00FFD19F44FFFEFFFDFFFEFEFEFFDBB372FFD2A04BFFD19E43FFC5820BFFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF030303FF010101FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF7676FEFF0000FFFF1C1CFEFFF8F8
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4FEFF1414FEFF0000FFFF1616
      FEFFD0D0FEFF1E1EFEFF0000FFFF7474FEFF0000000000000000180080FF0000
      C6FF0000C6FF0000C6FF0000C6FF00D8FFFF0000CEFF180080FF180080FFC6C6
      C6FFC6C6C6FFC6C6C6FFC6C6C6FF00000000C27A00FFC27A00FFC27A00FFC27A
      00FFD19F43FFFFFFFDFFFEFFFFFFFFFFFFFFFFFEFFFFFFFEFFFFFBF6EEFFD7A8
      55FFC27A00FFC27A00FFC27A00FFC27A00FF0000000000000006010101290000
      0002000000FF0C0C0CFF000000FF000000FF000000FF000000FF0B0B0BFF0000
      00FF000000010101012800000006000000003434FEFF0000FFFF7575FEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4FEFF1414FEFF0000FFFF1616FEFFD6D6
      FEFFFFFFFFFF7878FEFF0000FFFF3232FEFF00000000180080FF0000C6FF0000
      C6FF0000C6FF0000C6FF00D8FFFF0000CEFF0000CEFF0000CEFF0000CEFF1800
      80FF180080FFC6C6C6FFC6C6C6FF00000000C27A00FFC27A00FFC27A00FFC27A
      00FFD19F43FFFEFFFDFFFEFFFFFFEFE6DBFFEDE1D0FFF5EEE8FFFEFFFCFFFDFD
      F9FFCE9533FFC27A00FFC27A00FFC27A00FF0000000000000000000000000000
      0000010101280D0D0DFD000000FF000000FF000000FF000000FF0D0D0DFD0101
      0128000000000000000000000000000000001212FEFF0000FFFFA5A5FEFFFFFF
      FFFFFFFFFFFFFFFFFFFFD4D4FEFF1414FEFF0000FFFF1616FEFFD6D6FEFFFFFF
      FFFFFFFFFFFFA8A8FEFF0000FFFF1010FEFF180080FF0000C6FF0000C6FF0000
      C6FF0000C6FF00D8FFFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000
      CEFF0000CEFF180080FF180080FF00000000C27A00FFC27A00FFC27A00FFC27A
      00FFD19F43FFFFFFFDFFFDFFFFFFD1963CFFC27B01FFBF8008FFECDBC1FFFEFF
      FFFFEAD2A8FFC27A00FFC27A00FFC27A00FF0000000000000000000000000000
      0000010101280D0C0CFD000000FF000000FF000000FF000000FF0D0C0CFD0101
      0128000000000000000000000000000000001212FEFF0000FFFFA6A6FEFFFFFF
      FFFFFFFFFFFFD4D4FEFF1414FEFF0000FFFF1616FEFFD6D6FEFFFFFFFFFFFFFF
      FFFFFFFFFFFFA8A8FEFF0000FFFF1010FEFF180080FF0000C6FF0000C6FF0000
      C6FF00D8FFFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000
      CEFF0000CEFF0000CEFF0000CEFF180080FFC27A00FFC27A00FFC27A00FFC27A
      00FFD19F43FFFEFFFDFFFCFFFFFFCF9739FFC27B00FFC27B00FFDDB989FFFEFF
      FFFFF6EBD8FFC27A00FFC27A00FFC27A00FF0000000000000006010101290000
      0005000000FF0F0F0FFF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000050000002700000006000000003434FEFF0000FFFF7474FEFFFFFF
      FFFFD4D4FEFF1414FEFF0000FFFF1616FEFFD6D6FEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF7777FFFF0000FFFF3333FFFF180080FF0000C6FF0000C6FF00D8
      FFFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000
      CEFF0000CEFF0000CEFF0000CEFF00000000C27A00FFC27A00FFC27A00FFC27A
      00FFD19F43FFFFFFFDFFFEFEFFFFCD953CFFBF7900FFC6790AFFEFDDC1FFFFFF
      FFFFF2E4CBFFC27A00FFC27A00FFC27A00FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF020202FF010101FF000000FF000000FF0000
      00FF000000FF050505FC000000FF000000FF7777FFFF0000FFFF1A1AFEFFCECE
      FEFF1414FEFF0000FFFF1616FEFFD6D6FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF8F8FEFF1C1CFEFF0000FFFF7575FEFF180080FF0000C6FF00D8FFFF0000
      CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000
      CEFF0000CEFF0000CEFF0000000000000000C27A00FFC27A00FFC27A00FFC27A
      00FFD19F43FFFFFFFDFFFEFFFFFFF4E5D5FFF2DFCBFFF5ECE0FFFEFFFEFFFDFE
      FEFFDFBB79FFC27A00FFC27A00FFC27A00FF000000FF000000FF000000FF0000
      00FF000000000000000000000000000000FF000000FF00000000000000000000
      0000000000FF000000FF000000FF000000FFDDDDFFFF0202FEFF0000FFFF0202
      FEFF0000FFFF1616FEFFD6D6FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF7575FEFF0000FFFF0202FEFFDCDCFEFF180080FF00D8FFFF0000CEFF0000
      CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000
      CEFF0000CEFF000000000000000000000000C27A00FFC27A00FFC27A00FFC27A
      00FFD39F43FFFCFEFCFFFCFFFFFFFCFFFFFFFFFFFFFFFFFFFFFFFBFFFDFFEBD7
      B3FFC48007FFC27A00FFC27A00FFC27A00FF000000FF000000FF000000FF0000
      00FF000000000000000000000000000000FF000000FF00000000000000000000
      0000000000FF000000FF000000FF000000FF000000007878FFFF0000FFFF0000
      FFFF0303FEFFD0D0FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFFF7272
      FEFF0000FFFF0000FFFF7575FEFF0000000000D8FFFF0000CEFF0000CEFF0000
      CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000
      CEFF00000000000000000000000000000000C27A00FFC27A00FFC27A00FFC27A
      00FFCA8D22FFE2BF85FFE2C086FFE2BF85FFE1BF84FFDFBC80FFD19C3FFFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FF0000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000000000
      00000000000000000000000000000000000000000000FBFBFFFF4E4EFEFF0000
      FFFF0000FFFF1A1AFEFF7474FEFFA5A5FEFFA5A5FEFF7474FEFF1B1BFEFF0000
      FFFF0000FFFF4D4DFEFFFBFBFFFF0000000000000000000000000000CEFF0000
      CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000
      000000000000000000000000000000000000C27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FF0000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000FBFBFFFF7878
      FEFF0202FEFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0202
      FEFF7777FFFFFBFBFFFF00000000000000000000000000000000000000000000
      00000000CEFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF000000000000
      00000000000000000000000000000000000000000000C27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A00FFC27A
      00FFC27A00FFC27A00FFC27A00FF000000000000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DFDFFFFF7878FEFF3636FEFF1313FEFF1313FEFF3535FEFF7777FEFFDCDC
      FEFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000CEFF0000CEFF0000CEFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000061C6DEFF58CEE7FF61C6D6FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000002F00FF002F00FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000F7F7F7FF0A0A
      0AFFE3E3E3FF000000000000000000000000000000000000000000000000F3F3
      F3FF0A0A0AFFF3F3F3FF0000000000000000000000000F3371FF103876FF1139
      78FF426399FF4B6B9CFF4F2525FF4F2525FF4F2525FF2F3D66FF1A3C78FF262B
      4DFF402731FF402731FF192E5EFF284278FF0000000000000000000000000000
      0000000000000000000061C6DEFF2F2F58FF2F2F58FF58CEE7FF61C6D6FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000002F00FF9CC69CFF9CC69CFF002F00FFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000004E4E
      4EFF8F8F8FFF000000000000000000000000000000000000000000000000A3A3
      A3FF424242FF00000000000000000000000010306DFF12458AFF14478FFF1649
      94FF9BB2D2FFD4D9E4FF4F2525FF4F2525FF4F2525FF9BADCEFF96B2DCFF634E
      5EFF4F2525FF522D31FF608AC6FF193C7BFF0000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF48ADC6FF2F2F58FF58CEE7FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000002F00FFFFFFFFFF9CC69CFF002F00FFFFFFFFFF0000
      000000000000000000000000000000000000000000000000000000000000A3A3
      A3FF3A3A3AFF0000000000000000000000000000000000000000000000004E4E
      4EFF9B9B9BFF0000000000000000000000001F3C74FF15468FFF174B98FF1A4D
      9CFFA0BDDCFFE4EBF5FFD4E0F0FFC5D4EBFFB7CBE5FFA8C0E2FF9AB6DDFF6651
      60FF583A40FF626181FF5983BEFF1D3B73FF0000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF58CEE7FF2F2F58FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000002F00FF002F00FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000F3F3
      F3FF060606FFDFDFDFFFCFCFCFFF9B9B9BFF9B9B9BFFCFCFCFFFEFEFEFFF0A0A
      0AFFEBEBEBFF0000000000000000000000002C477AFF174893FF1C4EA0FF1F51
      A5FFA6C0DFFFE9EEF6FFD9E4F1FFCBD9EDFFBCCEE8FFADC4E4FF9FB9DFFF92AE
      D9FF85A5D4FF759AD0FF3E65A3FF50658EFF0000000000000000000000000000
      00000000000000000000000000002F2F58FF2F2F58FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000E3E3
      E3FF171717FF070707FF323232FF6A6A6AFF6A6A6AFF323232FF080808FF1414
      14FFE3E3E3FF0000000000000000000000003F5786FF194795FF2053A8FF2356
      ADFFA8C1E1FFEEF2F8FFDFE7F4FFD0DCEEFFC0D1E9FFB2C7E4FFA3BDE0FF96B2
      DCFF89A8D7FF7A9FD2FF264A89FF8893A9FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000002F00FF002F00FFFFFFFFFF000000000000
      00000000000000000000000000000000000000000000000000009F9F9FFF1616
      16FF575757FF3A3A3AFF000000000000000000000000000000004D4D4DFF5252
      52FF161616FF939393FF00000000000000006E809DFF133572FF183E8FFF2351
      ADFFA5B0DCFFF4F6F9FFBBC9E2FF87A6D0FF5F8AC9FFA5BFE0FFA8C0E2FF9AB6
      DDFF8DACD8FF799CD0FF143572FFBBBEC1FF0000000000000000000000000000
      000000000000000000000000000048ADC6FF58CEE7FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000002F00FF94BD94FF9CC694FF002F00FFFFFFFFFF0000
      00000000000000000000000000000000000000000000000000002A2A2AFFD7D7
      D7FFF3F3F3FF060606FFE3E3E3FF0000000000000000F3F3F3FF0A0A0AFFEBEB
      EBFFD7D7D7FF262626FF939393FF0000000000000000B0B5BCFF495791FF0A11
      89FF436BBCFF11138CFF0C2A81FF1B4E9FFF285AB1FFB9CBE7FFADC4E4FF8CA9
      D2FF4A6DA5FF1F417DFF445A88FF000000000000000000000000000000000000
      0000000000000000000048ADBDFF2F2F58FF2F2F58FF58CEE7FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000002F00FFFFFFFFFF84AD84FF94BD94FF002F00FFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000004E4E4EFF8F8F8FFF0000000000000000A3A3A3FF424242FF0000
      000000000000D7D7D7FF161616FFE3E3E3FF0000000000000000ADADBFFF1013
      89FF214CACFF0E0F87FF182C77FF143A7CFF2955A0FF718EB8FF30538CFF0F2D
      6FFF314384FF9BA3B2FF00000000000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF61C6DEFF2F2F58FF58CEE7FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000002F00FFFFFFFFFF9CC69CFF9CC69CFF002F
      00FFFFFFFFFF0000000000000000000000000000000000000000000000000000
      000000000000A3A3A3FF3A3A3AFF00000000000000004E4E4EFF9B9B9BFF0000
      000000000000000000008B8B8BFF525252FF0000000000000000B2B2C0FF1012
      89FF214CACFF121289FFA3A4BAFF7D8CA5FF2D487CFF0F2575FF1C4699FF1315
      8AFF9999B8FF0000000000000000000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF48ADC6FF2F2F58FF58CEE7FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFF0000000000000000002F00FFFFFFFFFF9CC69CFF9CC6
      9CFF002F00FF0000000000000000000000000000000000000000000000000000
      000000000000EFEFEFFF060606FF181818FF191919FF070707FFE7E7E7FF0000
      0000000000000000000000000000000000000000000000000000BDBDC4FF0D0E
      87FF214CACFF0F0F88FFB6B6C1FF00000000B4B4C1FF0D0F88FF1E46A9FF0D0D
      86FFC1C1C5FF0000000000000000000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF61C6DEFF2F2F58FF58CEE7FF0000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFF002F00FF002F00FFFFFFFFFF0000000000000000002F00FFFFFFFFFF9CC6
      9CFF002F00FF0000000000000000000000000000000000000000000000000000
      000000000000767676FF000000FF000000FF000000FF000000FF767676FF0000
      0000000000000000000000000000000000000000000000000000BFBFC5FF0B0B
      86FF214DACFF0B0B85FFC1C1C5FF00000000BDBDC4FF0B0B87FF152C9CFF2C2C
      91FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF48ADBDFF2F2F58FF58CEE7FF0000
      000000000000000000000000000000000000000000000000000000000000002F
      00FF9CC69CFF9CC69CFF002F00FFFFFFFFFFFFFFFFFF002F00FFFFFFFFFF9CC6
      9CFF002F00FF0000000000000000000000000000000000000000000000000000
      0000000000001A1A1AFF000000FF0000000000000000000000FF1A1A1AFF0000
      000000000000000000000000000000000000C9C1B8FFCA9152FFCA8942FF0B0B
      84FF16309EFF0B0B85FF0000000000000000C19B74FF080985FF111A93FF6464
      A5FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF61C6DEFF2F2F58FF58CEE7FF0000
      000000000000000000000000000000000000000000000000000000000000002F
      00FFFFFFFFFF9CC69CFF79AD79FF002F00FF002F00FFFFFFFFFF9CC69CFF9CC6
      9CFF002F00FF0000000000000000000000000000000000000000000000000000
      0000000000001A1A1AFF000000FF0000000000000000000000FF1A1A1AFF0000
      000000000000000000000000000000000000D59A4DFFF6DAB2FFF9E5C6FF9993
      BCFF22208CFF584059FFC9BEB4FFCE9C5BFFE0A656FF4747A8FF100E79FFA9A9
      BDFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF409CB5FF2F2F58FF58CEE7FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000002F00FFFFFFFFFF9CC69CFF9CC69CFF9CC69CFF9CC69CFF79AD79FF002F
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000007A7A7AFF000000FF000000FF000000FF000000FF7A7A7AFF0000
      000000000000000000000000000000000000D5B07CFFEDCC9DFFFCFCFCFFFCFB
      F8FFE5B269FFE2AA5DFFD48D2CFFF9ECD6FFFCF9F6FFEDCC98FFD0A266FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002F2F58FF58CEE7FF58CEE7FF2F2F58FF4094A5FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000002F00FFFFFFFFFF9CC69CFF9CC69CFFFFFFFFFF002F00FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFBFF7A7A7AFF1A1A1AFF1A1A1AFF767676FFFBFBFBFF0000
      000000000000000000000000000000000000C9C9C9FFE5BF87FFECCC9CFFF4E0
      C1FFFCFCFBFFFCFCFCFFF7E2C4FFE7BD80FFEBC693FFD9AF73FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000058A5B5FF2F2F58FF2F2F58FF408CA5FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCC3F00FFC9490000000000000000FF000000FFFFFFFFFF0000
      0000000000FFFFFFFFFF00000000000000FFFFFFFFFF00000000000000FFFFFF
      FFFF00000000000000FF000000FFFFFFFFFF0000000000000000000000000000
      000000000000DDDDDDFF727272FF737373FF707070FF838383FFE1E1E1FF0000
      0000000000000000000000000000000000000000000000000000000000003B3B
      3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B
      3BFF3B3B3BFFFFFFFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFC94400FFD43A00FFCC3E0000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF000000000000000000000000F9F9
      F9FFB2B2B2FF4E4E4EFF4E4E4EFF717171FF737373FF6A6A6AFF656565FFBBBB
      BBFFFAFAFAFF0000000000000000000000000000000000000000000000003B3B
      3BFFFFFFFFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF9E9E9EFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000FFCC6600FFBB6600FFC46200FFBF5F000000000000000000FFC3
      5200FFD23A00FFC64900FFBF3F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8FF7C7C
      7CFF373737FF3C3C3CFF414141FF656565FF666666FF606060FF606060FF5858
      58FF8F8F8FFFEBEBEBFF00000000000000000000000000000000000000003B3B
      3BFFFFFFFFFF9E9E9EFFCFCFCFFF6C6C6CFFCFCFCFFF3B3B3BFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF0000000000000000000000000000000000000000FFCC
      5000FFD83500FFE45E00FFE56500FFE26200FFE26500FFDB4900FFD63E00FFD9
      5900FFCA4300000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF00000000D4D4D4FF4D4D4DFF2525
      25FF292929FF2E2E2EFF333333FF595959FF5A5A5AFF535353FF535353FF5252
      52FF4E4E4EFF656565FFDBDBDBFF000000000000000000000000000000003B3B
      3BFFFFFFFFFF9E9E9EFFCFCFCFFF6C6C6CFFCFCFCFFF3B3B3BFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF000000000000000000000000FFAA5500FFBB5D00FFD3
      2E00FFDD5600FFDC3E00FFDA3E00FFD83D00FFD73C00FFD84E00FFD95800FFCC
      3800FFC36900000000000000000000000000000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF00000000989898FF282828FF2424
      24FF242424FF252525FF262626FF4D4D4DFF4E4E4EFF464646FF464646FF4545
      45FF434343FF444444FFAFAFAFFF000000000000000000000000000000003B3B
      3BFFFFFFFFFF9E9E9EFFCFCFCFFF6C6C6CFFCFCFCFFF3B3B3BFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF000000000000000000000000FFCD3B00FFDA6600FFD8
      5100FFD85100FFD75000FFD64F00FFD54E00FFD44E00FFD14D00FFCF4C00FFC8
      3C00FFC250000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000959595FF282828FF2424
      24FF242424FF242424FF242424FF4B4B4BFF4B4B4BFF404040FF404040FF4040
      40FF404040FF434343FFAFAFAFFF000000000000000000000000000000003B3B
      3BFFFFFFFFFF9E9E9EFFCFCFCFFF6C6C6CFFCFCFCFFF3B3B3BFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF000000000000000000000000FFC84200FFD45000FFD7
      5A00FFD75A00FFD75A00FFD65C00FFD45A00FFD25600FFD05500FFCF5500FFCE
      5600FFBE3200000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF00000000969696FF282828FF2424
      24FF242424FF242424FF4C4C4CFF797979FF757575FF555555FF404040FF4040
      40FF404040FF434343FFAFAFAFFF000000000000000000000000000000003B3B
      3BFFFFFFFFFF9E9E9EFFCFCFCFFF6C6C6CFFCFCFCFFF3B3B3BFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF000000000000000000000000FFB86300FFC74000FFD7
      7200FFD87400FFD97900FFD97C00FFDA8100FFDA8300FFD06A00FFCF6800FFCC
      6700FFC95A00FF7F00000000000000000000000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF00000000989898FF292929FF2424
      24FF323232FF767676FF7B7B7BFF757575FF717171FF787878FF757575FF4242
      42FF404040FF434343FFB2B2B2FF000000000000000000000000000000003B3B
      3BFFFFFFFFFF9E9E9EFFCFCFCFFF6C6C6CFFCFCFCFFF3B3B3BFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF000000000000000000000000FFC15C00FFC34300FFD9
      8100FFDA8400FFDB8900FFDC8B00FFDC8F00FFDC9200FFD98D00FFCF7200FFCD
      7000FFCC7000FF7F3F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000999999FF292929FF4B4B
      4BFF858585FF6A6A6AFF6D6D6DFF6D6D6DFF6B6B6BFF656565FF666666FF8686
      86FF4F4F4FFF434343FFB2B2B2FF000000000000000000000000000000003B3B
      3BFFFFFFFFFF9E9E9EFFCFCFCFFF6C6C6CFFCFCFCFFF3B3B3BFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFF0000000000000000FFAA5500FDB64B00FFDB9800FFDE
      9E00FFDFA000FFE0A400FFE0A600FFE1AA00FFE2AD00FFE2B000FFE2B200FDCB
      7A00FDB14100000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF000000009E9E9EFF535353FF6161
      61FF5E5E5EFF6C6C6CFF707070FF6F6F6FFF6D6D6DFF6B6B6BFF686868FF6363
      63FF6D6D6DFF545454FFB4B4B4FF000000000000000000000000000000003B3B
      3BFFFFFFFFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF9E9E9EFF9E9E9EFF6C6C
      6CFF3B3B3BFFFFFFFFFFFFFFFFFF00000000FFB43D00FEDBA000FFDFA700FFE1
      AB00FFE2AD00FFE3B100FFE3B300FFE4B600FFE4B800FEE5BC00FDE5BE00F8B5
      5100F9AF4F00000000000000000000000000000000FFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FFFFFFFFFF00000000C3C3C3FF4F4F4FFF5B5B
      5BFF6B6B6BFF707070FF717171FF737373FF737373FF737373FF737373FF6F6F
      6FFF636363FF5A5A5AFFCECECEFF0000000000000000000000003B3B3BFF3B3B
      3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B
      3BFF3B3B3BFF3B3B3BFFFFFFFFFF00000000FFB24C00FCB64E00FBC67700FCDC
      AD00FDE7C500FDE8C800FDE8C900FCE8CC00FCE8CE00FCE9D000FBE9D200F8DE
      C100F2B66900EB8F3300FFAA5500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D5D5D5FF7171
      71FF6C6C6CFF717171FF737373FF737373FF737373FF747474FF737373FF6A6A
      6AFF727272FFD9D9D9FF000000000000000000000000000000003B3B3BFFFFFF
      FFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF9E9E9EFF9E9E9EFF9E9E9EFF9E9E
      9EFF6C6C6CFF3B3B3BFFFFFFFFFF0000000000000000FFA25C00FFBC5E00F7A5
      3300F7B76300FCE9D100FCEAD300FCEAD600FCEBD700FBEBDA00FAE7D400EB8F
      3100EA923A00EC9F5200E37D2400FFAA5500FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000F7F7
      F7FF9F9F9FFF676767FF747474FF747474FF747474FF737373FF6A6A6AFFA4A4
      A4FFF9F9F9FF00000000000000000000000000000000000000003B3B3BFF3B3B
      3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B3BFF3B3B
      3BFF3B3B3BFF3B3B3BFF00000000000000000000000000000000000000000000
      0000EE913400FCEFE300FCEFE400F6DCC600EEBC9200FCF1E900F0C6A2000000
      000000000000FF9F5F00DC7D3E00E7873700000000FFFFFFFFFFFFFFFFFF0000
      0000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF00000000FFFFFFFFFFFF
      FFFF00000000FFFFFFFF000000FFFFFFFFFF0000000000000000000000000000
      000000000000D4D4D4FF727272FF737373FF757575FF797979FFD9D9D9FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000B0B0BFFCFCFCFFFCFCFCFFFCFCFCFFF0B0B0BFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1A14900FBF2EA00F5DDCA00E4802A00E98C3900F0C9AE00FAECE200FFAA
      55000000000000000000FF7F000000000000000000FF000000FFFFFFFFFF0000
      0000000000FFFFFFFFFF00000000000000FFFFFFFFFF00000000000000FFFFFF
      FFFF00000000000000FF000000FFFFFFFFFF0000000000000000000000000000
      00000000000000000000F7F7F7FF9B9B9BFFA4A4A4FFF9F9F9FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000B0B0BFF0B0B0BFF0B0B0BFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFAA5500FF7F00000000000000000000FFAA5500DD742D00FFAA
      550000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000000100000100010000000000000800000000000000000000
      000000000000000000000000FFFFFF000000FFFF000000000000FFFF00000000
      0000FFFF00000000000080010000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800100000000
      0000FFFF000000000000FFFF00000000AAAAC003C003C0037FFF800180018001
      FFFE0000000000007FFF000000000000FFFE0000000000007FFF000000000000
      FFFE0000000000007FFF000000000000FFFE0000000000007FFF000000000000
      FFFE0000000000007FFF000000000000FFFE0000000000007FFF000000000000
      FFFE8001800180015555C003C003C003FBFFFFFFFFFF0C30F07FE00700030C30
      E03FE00700030C30C00FC00300030C308003C0030001FFFF000380010001FFFF
      0003800100010C300003000000000C300003000000000C300003800100000C30
      000380010003FFFF0003C0030003FFFF0003C00300070C300007E00781FF0C30
      001FE007C3FF0C30F07FFFFFFFFF0C3092489248F00FFE7F12481248D81BFC3F
      7FFC7FFC8C31F81FFFFFFFFF07E0F00F3FFC3FFC04E0F00F3FFC3FFC0CF0F81F
      FFFFFFFF0CF0F81F3FFC3FFCFC3FF00F3FFC3FFCFC9FC183FFFFFFFF0CD083C1
      3FFC3FFC0C9003C03FFC3FFC04200000FFFFFFFF07E000003FFC3FFC8C310000
      12481248D81B87E112481248F00FCFF3E007FFFF000000008001FFFF00000000
      0000FFFF00000000000080010000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800100000000
      8001FFFF00000000E007FFFF00000000C3C3C003F0CFFFFF0180C003F007FE71
      0000E000E000FE710000E000F010F0031818C000F03FC0070F08C0003C1F8001
      0308E000C20F060083B9F000C3070E70E19FF00080070E70F18FF80000070E00
      F18FC000800F0E00F18FC000C01F87E0F18F0000C0FF8001F00F0003C0FFC003
      F81F8003E0FFE00FFC3FE00FF5FFFFFFFFFFFFFFF9FFFFFFFFFFFFFFF9FFFFFF
      8001FFFFF9FFFFFF00008001F8FF800100000000F8FF000000000000F87F0000
      00000000F83F000000000000FC1F000000000000000700000000000000000000
      000000003000000000000000E007000080010000C11F0000FFFF8001C19F8001
      FFFFFFFFC19FFFFFFFFFFFFFE19FFFFFFFFFE007FFFFFFFF80008001FFFFFFFF
      00000000FFFFFFFF000000008001800100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080018001
      00008001FFFFFFFFFFFFE007FFFFFFFF8001E001FFFFFFFF8001C001FFFFFFFF
      8001C001FFFFFFFF8001C001800180018001C00100000000C003C00100000000
      E007C00100000000E007C00100000000E007C00100000000E007C00100000000
      E007C00100000000E007C00100000000E007C00100000000E007C00180018001
      F00FC001FFFFFFFFF81FC003FFFFFFFFFFFFFFFFFFFF80011111082183838001
      111108218383800111110821838380011111082183838001BBBBBEFBEFEFC003
      BBBBBEFBEFEFE00780038003E00FF00FFEFFFEFFFEFFF00FFEFFFEFFFEFFE007
      E00FE00FE00FE007E00FE00FE00FE007E00FE00FE00FE007E00FE00FE00FE007
      E00FE00FE00FF00FFFFFFFFFFFFFF81FFFFFFC3FF00F0000FFFFFC3FE0070000
      FFFFFC3FC0030000FFFFFC3F800100003084FC3F00000000B6B5F42F00000000
      8631F42F00008001CE31F42F0000C003CEB5F42F0000C0078484F00F0000C107
      B7FFF00F0000C10F33FFF00F0000030FFFFFFC3F8001000FFFFFF81FC003001F
      FFFFF81FE007003FFFFFFC3FF00FE0FFFFFFFC3F00009248FFFFF00F00001248
      FFFFC18300007FFCF81F07E00000FFFFF00F1CF800003FFCE0073CFC00003FFC
      83C13CFC0000FFFF81813C3C00003FFC81813C9C00003FFCE0073C9C0000FFFF
      F00F3C9C00003FFCF81F0C3000003FFCFFFF83C10000FFFFFFFFE00700003FFC
      FFFFF81F00001248FFFFFE7F000012480000FE7F0000FFFF0000FC1F00000003
      0000F807000000030000F001000000010000E000000000010000C00100000001
      0000800100000000000000010000000000000000000000000000000100000000
      000000030000000000000007000000030000000F000000030000C01F000081FF
      0000F03F000043FF0000FC7F0000FFFF80010000F00F000000000000C0030000
      0000000080010000000000008001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800100000000000080010000
      00000000C003000080010000F00F0000FE3FFE3FC7E38000FC1FFC1FE7E70000
      FC1FFC1FE7E70000FC3FFE7FE0070000FE7FFE7FE0070000FFFFFE3FC3C30000
      FE7FFC1FC1818001FC3FFC0FF998C003FC1FFE07F99CC007FC1FF307F81FC107
      FC1FE187F81FC10FFC1FE007F99F030FFC1FE007F99F000FFC1FF00FF81F001F
      FC1FF81FF81F003FFC3FFC3FFE7FE0FF9248FC3FE003FFF91248F81FE003FFF1
      7FFCE007E003F861FFFFC003E003E0073FFC8001E00380073FFC8001E0038007
      FFFF8001E00380073FFC8001E00380033FFC8001E0038003FFFF8001E0030007
      3FFC8001E00100073FFC8001C0010001FFFFC003C00180003FFCE007C003F018
      1248F81FF83FF00D1248FC3FFC7FF98F00000000000000000000000000000000
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
    Connected = True
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
    BeforeInsert = ObjectClientDataSetBeforeInsert
    AfterInsert = ObjectClientDataSetAfterInsert
    BeforePost = ObjectClientDataSetBeforePost
    AfterPost = ObjectClientDataSetAfterPost
    BeforeDelete = ObjectClientDataSetBeforeDelete
    AfterDelete = ObjectClientDataSetAfterDelete
    AfterScroll = ObjectClientDataSetAfterScroll
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
      494C010103000800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A1D7AA0037AE4C0050CB73004AD174004BCF72005ECD760061C470004CAB
      5900ABD6B1000000000000000000000000000000000000000000000000000000
      0000B190870091391A00F4C99300FBD9A500F4C48700D196600084321700B8A2
      9B00000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A1D7
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
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFC10000E3E3FFFFFDCC0000
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
  object SysEditImageList24: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 359
    Top = 320
    Bitmap = {
      494C010103001100040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF696969FF696969FF696969FF696969FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF696969FF696969FF696969FF696969FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF696969FF696969FF696969FF696969FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000696969FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FF696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FF696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FF696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FF696969FF696969FF6969
      69FF696969FF696969FF696969FF696969FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FF696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FF696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FF696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000696969FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
      F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF696969FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFF000000FFF03FFF
      F03FFFF03F000000FFF7FFFFF7FFFFF7FF000000FFF7FFFFF7FFFFF7FF000000
      FFF7FFFFF7FFFFF7FF000000FFF7FFFFF7FFFFF7FF000000FFF7FFFFF7FFFFF7
      FF000000FFF7FFFFF7FFFFF7FF000000FFF7FFFFF7FFFFF7FF000000FFF7FFFF
      F7FFFFF7FF000000FFF7FFFFF7FFFFF7FF000000FFF7FFFFF7FFFFF7FF000000
      FE003FFE003FFE003F000000FE003FFE003FFE003F000000FE003FFE003FFE00
      3F000000FE003FFE003FFE003F000000FE003FFE003FFE003F000000FE003FFE
      003FFE003F000000FE003FFE003FFE003F000000FE003FFE003FFE003F000000
      FE003FFE003FFE003F000000FE003FFE003FFE003F000000FE003FFE003FFE00
      3F000000FFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000
      000000000000}
  end
  object SynEditPopup: TPopupMenu
    Left = 464
    Top = 320
    object SynEditRegionInsertPopup: TMenuItem
      Action = SynEditRegionInsertAction
    end
    object SynEditInsertRegionPopup: TMenuItem
      Action = SynEditRegionCollapseAction
    end
    object RegionExpand1: TMenuItem
      Action = SynEditRegionExpandAction
    end
  end
  object SysEditAction: TActionList
    Images = SysEditImageList24
    Left = 568
    Top = 320
    object SynEditRegionInsertAction: TAction
      Caption = 'Region Insert'
      ImageIndex = 0
      OnExecute = SynEditRegionInsertActionExecute
    end
    object SynEditRegionCollapseAction: TAction
      Caption = 'Region Collapse'
      ImageIndex = 1
      OnExecute = SynEditRegionCollapseActionExecute
    end
    object SynEditRegionExpandAction: TAction
      Caption = 'Region Expand'
      ImageIndex = 2
      OnExecute = SynEditRegionExpandActionExecute
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'xml'
    Filter = 'XML files (*.xml)|*.xml|CDS files (*.cds)|*.cds'
    Left = 672
    Top = 152
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xml'
    Filter = 'XML files (*.xml)|*.xml|CDS files (*.cds)|*.cds'
    Left = 776
    Top = 152
  end
  object TextImageList24: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 360
    Top = 208
    Bitmap = {
      494C010115002800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000006000000090000000010020000000000000D8
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
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
      FF000000FF00000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
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
      00000000FF00000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
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
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
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
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF00000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
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
      00000000FF00000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
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
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
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
      FF0000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
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
      FF0000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
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
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
    Left = 568
    Top = 208
    object TextSearchAction: TAction
      Caption = 'Search'
      Hint = 'Search a string'
      ImageIndex = 0
      OnExecute = TextSearchActionExecute
    end
    object TextSearchPrevAction: TAction
      Caption = 'Prev'
      Hint = 'Go to previous find'
      ImageIndex = 1
      OnExecute = TextSearchPrevActionExecute
    end
    object TextSearchNextAction: TAction
      Caption = 'Next'
      Hint = 'Go to next find'
      ImageIndex = 2
      OnExecute = TextSearchNextActionExecute
    end
    object TextReplaceAction: TAction
      Caption = 'Replace'
      Hint = 'Replace all occurrences of a string with another one'
      ImageIndex = 3
      OnExecute = TextReplaceActionExecute
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
    object TextLineNumbersAction: TAction
      AutoCheck = True
      Caption = 'Line No'
      Hint = 'Show or hide the lines numbers'
      ImageIndex = 11
      OnExecute = TextLineNumbersActionExecute
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
    object TextUtilsStatsAction: TAction
      Caption = 'Text statistics'
      Hint = 'Show text statistics'
      ImageIndex = 16
      OnExecute = TextUtilsStatsActionExecute
    end
    object TextUtilsSortAscAction: TAction
      Caption = 'Selected lines sort ascending'
      Hint = 'Order selected lines in ascending order'
      ImageIndex = 17
      OnExecute = TextUtilsSortAscActionExecute
    end
    object TextUtilsSortDescAction: TAction
      Caption = 'Selected lines sort descending'
      Hint = 'Order selected lines in descending order'
      ImageIndex = 18
      OnExecute = TextUtilsSortDescActionExecute
    end
    object TextUtilsLinePrefixWithAction: TAction
      Caption = 'Selected lines prefixed with a string'
      Hint = 'Prefix selected lines with the given string'
      ImageIndex = 19
      OnExecute = TextUtilsLinePrefixWithActionExecute
    end
    object TextUtilsLineNumbersAction: TAction
      Caption = 'Selected lines prefixed with numbers'
      Hint = 'Prefix selected lines with ascendin numbers'
      ImageIndex = 20
      OnExecute = TextUtilsLineNumbersActionExecute
    end
  end
  object TextUtilsPopup: TPopupMenu
    Images = TextImageList24
    Left = 464
    Top = 208
    object TextUtilsTextStatsPopup: TMenuItem
      Action = TextUtilsStatsAction
    end
    object TextUtilsSortAscPopup: TMenuItem
      Action = TextUtilsSortAscAction
    end
    object TextUtilsSortDescPopup: TMenuItem
      Action = TextUtilsSortDescAction
    end
    object TextUtilsLineBeginWithPopup: TMenuItem
      Action = TextUtilsLinePrefixWithAction
    end
    object TextUtilsLineNumbersPopup: TMenuItem
      Action = TextUtilsLineNumbersAction
    end
  end
  object UtilsImageList: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 359
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
    Left = 568
    Top = 376
    object UtilsPythonExecAction: TAction
      Caption = 'Py Exec'
      ImageIndex = 0
      OnExecute = UtilsPythonExecActionExecute
    end
  end
end
