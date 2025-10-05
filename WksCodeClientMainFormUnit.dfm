inherited CodeMainForm: TCodeMainForm
  Caption = 'CodeMainForm'
  ClientHeight = 847
  StyleElements = [seFont, seClient, seBorder]
  ExplicitHeight = 886
  TextHeight = 15
  inherited LeftJvNetscapeSplitter: TJvNetscapeSplitter
    Height = 601
    ExplicitHeight = 605
  end
  inherited RightJvNetscapeSplitter: TJvNetscapeSplitter
    Height = 601
    ExplicitLeft = 867
    ExplicitHeight = 605
  end
  inherited BottomJvNetscapeSplitter: TJvNetscapeSplitter
    Top = 675
    ExplicitTop = 688
    ExplicitWidth = 1180
  end
  inherited TopPanel: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited TopPageControl: TPageControl
      ActivePage = CodeTabSheet
      inherited TopSearchTabSheet: TTabSheet
        inherited SearchReplaceOutLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited SearchReplaceInLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited SearchReplaceSwapLabel2: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited SearchReplaceOutEdit: TEdit
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited SearchReplaceInEdit: TEdit
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      object CodeTabSheet: TTabSheet
        Margins.Right = 0
        Caption = 'Code'
        ImageIndex = 2
        object CodeTopPanel: TPanel
          Left = 0
          Top = 0
          Width = 585
          Height = 44
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'CodeTopPanel'
          ShowCaption = False
          TabOrder = 0
          object CodeSaveLabel: TLabel
            Left = 16
            Top = 14
            Width = 41
            Height = 15
            Caption = 'Save on'
          end
          object CodeToolBar: TToolBar
            Left = 357
            Top = 0
            Width = 228
            Height = 44
            Align = alRight
            AutoSize = True
            ButtonHeight = 46
            ButtonWidth = 55
            Caption = 'CodeToolBar'
            Images = CodeImageList24
            ShowCaptions = True
            TabOrder = 0
            object CodeSaveItemToolButton: TToolButton
              Left = 0
              Top = 0
              Action = CodeSaveItemAction
            end
            object CodeSaveChildsToolButton: TToolButton
              Left = 55
              Top = 0
              Action = CodeSaveChildsAction
            end
            object CodeSaveBranchToolButton: TToolButton
              Left = 110
              Top = 0
              Action = CodeSaveBranchAction
            end
            object CoseGapToolButton: TToolButton
              Left = 165
              Top = 0
              Width = 8
              Caption = 'CoseGapToolButton'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object CodeRunToolButton: TToolButton
              Left = 173
              Top = 0
              Action = CodeRunAction
            end
          end
          object CodeEnvComboBox: TComboBox
            Left = 69
            Top = 11
            Width = 62
            Height = 23
            TabOrder = 1
            Text = 'CodeEnvComboBox'
            Items.Strings = (
              'DEV'
              'TEST'
              'PROD')
          end
          object CodeSaveToComboBox: TComboBox
            Left = 146
            Top = 11
            Width = 207
            Height = 23
            TabOrder = 2
            Text = 'CodeSaveToComboBox'
            Items.Strings = (
              'Locally     (on pc or local network)'
              'Remotely (on server)')
          end
        end
      end
    end
    inherited TopPageControl3: TPageControl
      inherited TimeTabSheet: TTabSheet
        inherited YearLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited MonthLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited DayLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited TimerLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited WeekdayLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited WeekLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited TimerJvClock: TJvClock
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited PersonTabSheet: TTabSheet
        inherited PersonNameLabel2: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited PersonSurnameLabel2: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited PersonSurnameLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited PersonNameLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited UserTabSheet: TTabSheet
        inherited UserUsernameLabel2: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited UserPasswordLabel2: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited UserPasswordLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited UserUsernameLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited MemberTabSheet: TTabSheet
        inherited MemberMemberLabel2: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited MemberMemberLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited MemberRoleLevelLabel2: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited MemberRoleLevelLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited OrganizationTabSheet: TTabSheet
        inherited OrganizationOrganizationLabel2: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited OrganizationNameLabel2: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited OrganizationNameLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited OrganizationOrganizationLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
      end
    end
    inherited TopPageControl2: TPageControl
      inherited ObjectTabSheet: TTabSheet
        inherited ObjectIdDBText: TDBText
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited ObjectKindDBText: TDBText
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited ObjectStateDBText: TDBText
          StyleElements = [seFont, seClient, seBorder]
        end
      end
    end
  end
  inherited LeftPanel: TPanel
    Height = 601
    StyleElements = [seFont, seClient, seBorder]
    ExplicitHeight = 601
    inherited LeftPageControl: TPageControl
      Height = 601
      ExplicitHeight = 601
      inherited ObjectTreeTabSheet: TTabSheet
        ExplicitHeight = 571
        inherited ObjectNodeInfoLabel: TLabel
          Top = 556
          Width = 292
          StyleElements = [seFont, seClient, seBorder]
          ExplicitTop = 556
        end
        inherited ObjectDTClientTree: TDTClientTree
          Height = 531
          ExplicitHeight = 531
        end
        inherited ObjectDBNavigator: TDBNavigator
          Hints.Strings = ()
        end
      end
      inherited WordTabSheet: TTabSheet
        ExplicitHeight = 571
      end
    end
  end
  inherited BottomPanel: TPanel
    Top = 685
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 685
    inherited LogFrame: TLogFrame
      inherited LogPageControl: TPageControl
        inherited OutputTabSheet: TTabSheet
          inherited OutputRichEdit: TRichEdit
            StyleElements = [seFont, seClient, seBorder]
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
    end
  end
  inherited RightPanel: TPanel
    Height = 601
    StyleElements = [seFont, seClient, seBorder]
    ExplicitHeight = 601
    inherited RightPageControl: TPageControl
      Height = 601
      ExplicitHeight = 601
      inherited PropertyTabSheet: TTabSheet
        ExplicitHeight = 571
        inherited ObjectJvScrollMax: TJvScrollMax
          Height = 571
          StyleElements = [seFont, seClient, seBorder]
          ExplicitHeight = 571
          inherited ObjectIdJvScrollMaxBand: TJvScrollMaxBand
            inherited ObjectOrderLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectRevLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectPIdLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectIdLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectId8Label: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectOrderDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectPIdDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectRevDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectIdDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectId8DBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          inherited ObjectDateJvScrollMaxBand: TJvScrollMaxBand
            inherited ObjectCreatedLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectCreatedDBText: TDBText
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectUpdatedLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectUpdatedDBText: TDBText
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectUpdatedByDBText: TDBText
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectUpdatedByLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          inherited ObjectFromJvScrollMaxBand: TJvScrollMaxBand
            inherited ObjectFromOrganizationLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectFromMemberLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectFromTeamLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectFromAreaLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectFromDepartmentLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectFromOrganizationDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectFromMemberDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectFromTeamDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectFromAreaDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectFromDepartmentDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          inherited ObjectToJvScrollMaxBand: TJvScrollMaxBand
            inherited ObjectToOrganizationLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectToMemberLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectToTeamLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectToAreaLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectToDepartmentLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectJobGradeMinLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectJobGradeCalculateLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectToOrganizationDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectToMemberDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectToTeamDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectToAreaDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectToDepartmentDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectJobGradeMinDBComboBox: TDBComboBox
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          inherited ObjectApprovalJvScrollMaxBand: TJvScrollMaxBand
            inherited ObjectRouteLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectRouteDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          inherited ObjectImageJvScrollMaxBand: TJvScrollMaxBand
            inherited ObjectImageLoadLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectImageSaveLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectImageEditLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectImageFitLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectImageClearLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectImageDBImage: TDBImage
              Height = 0
            end
          end
          inherited ObjectTypeJvScrollMaxBand: TJvScrollMaxBand
            inherited ObjectContentKindLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectKindLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectDataKindLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectContentKindDBComboBox: TDBComboBox
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectKindDBComboBox: TDBComboBox
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectDataKindDBComboBox: TDBComboBox
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          inherited ObjectGeneralJvScrollMaxBand: TJvScrollMaxBand
            inherited ObjectStateLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectSpareLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectDescriptionLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectTitleLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectSubtitleLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectStateDBComboBox: TDBComboBox
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectSpareDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectDescriptionDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectTitleDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited ObjectSubtitleDBEdit: TDBEdit
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          object CodeJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Code'
            ExpandedHeight = 359
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object CodeObjectIdLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 53
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Object Id'
              ExplicitWidth = 48
            end
            object CodeReturnAsLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 103
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Return as'
              ExplicitWidth = 49
            end
            object CodeReturnMimeTypeLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 153
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Return Mime Type'
              ExplicitWidth = 96
            end
            object CodeRunCommandLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 203
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Run Command'
              ExplicitWidth = 81
            end
            object CodeObjectIdDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 74
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clMoneyGreen
              DataField = 'FldObjectId'
              DataSource = CodeDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
            end
            object CodeDBNavigator: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 275
              Height = 25
              DataSource = CodeDataSource
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alTop
              Flat = True
              TabOrder = 1
            end
            object CodeReturnAsDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 124
              Width = 249
              Height = 23
              Hint = 'State'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldReturnAs'
              DataSource = CodeDataSource
              Items.Strings = (
                ''
                'AsScript'
                'AsCsv'
                'AsHtml'
                'AsJson'
                'AsXml')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
            object CodeReturnMimeTypeDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 174
              Width = 249
              Height = 23
              Hint = 'State'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldReturnMimeType'
              DataSource = CodeDataSource
              Items.Strings = (
                ''
                'text/plain'
                'text/html'
                'text/css'
                'text/csv'
                'text/event-stream'
                'application/json'
                'application/javascript')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object CodeRunCommandDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 224
              Width = 249
              Height = 23
              Hint = 'Page'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldRunCommand'
              DataSource = CodeDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
            end
          end
          object CodeOutputJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 326
            Caption = 'Output'
            ExpandedHeight = 326
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            object CodeOutputDevDirectoryLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 72
              Width = 249
              Height = 15
              Cursor = crHandPoint
              Hint = 'Open the output directory'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Output DEV directory'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = CodeOutputDevDirectoryLabelClick
              ExplicitWidth = 112
            end
            object CodeOutputFileNameLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 22
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Output file name'
              ExplicitWidth = 90
            end
            object CodeOutputProdDirectoryLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 172
              Width = 249
              Height = 15
              Cursor = crHandPoint
              Hint = 'Open the output PROD directory'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Output PROD directory'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = CodeOutputProdDirectoryLabelClick
              ExplicitWidth = 122
            end
            object CodeOutputTestDirectoryLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 122
              Width = 249
              Height = 15
              Cursor = crHandPoint
              Hint = 'Open the output TEST directory'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Output TEST directory'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = CodeOutputTestDirectoryLabelClick
              ExplicitWidth = 115
            end
            object CodeOutputProdSaveLabel: TLabel
              Left = 240
              Top = 174
              Width = 24
              Height = 15
              Caption = 'Save'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = CodeOutputProdSaveLabelClick
            end
            object CodeOutputTestSaveLabel: TLabel
              Left = 240
              Top = 124
              Width = 24
              Height = 15
              Caption = 'Save'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = CodeOutputTestSaveLabelClick
            end
            object CodeOutputDevSaveLabel: TLabel
              Left = 240
              Top = 74
              Width = 24
              Height = 15
              Caption = 'Save'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = CodeOutputDevSaveLabelClick
            end
            object CodeOutputDevDirectoryDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 93
              Width = 249
              Height = 23
              Hint = 'Page'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clLime
              DataField = 'FldOutputDevDirectory'
              DataSource = CodeDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object CodeOutputFileNameDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 43
              Width = 249
              Height = 23
              Hint = 'Page'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clYellow
              DataField = 'FldOutputFileName'
              DataSource = CodeDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object CodeOutputProdDirectoryDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 193
              Width = 249
              Height = 23
              Hint = 'Page'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clTomato
              DataField = 'FldOutputProdDirectory'
              DataSource = CodeDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
            object CodeOutputTestDirectoryDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 143
              Width = 249
              Height = 23
              Hint = 'Page'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clOrange
              DataField = 'FldOutputTestDirectory'
              DataSource = CodeDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object CodeHeaderAndFooterOffDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 250
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Header and Footer off'
              DataField = 'FldHeaderAndFooterOff'
              DataSource = CodeDataSource
              TabOrder = 4
              ExplicitTop = 281
            end
            object CodeCommentRemoveDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 273
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Comments remove'
              DataField = 'FldCommentRemove'
              DataSource = CodeDataSource
              TabOrder = 5
              ExplicitTop = 304
            end
            object CodeLinesEmptyRemoveDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 296
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Empty lines remove'
              DataField = 'FldLinesEmptyRemove'
              DataSource = CodeDataSource
              TabOrder = 6
              ExplicitTop = 327
            end
            object CodeDescriptionBlockAddDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 227
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Add Description block'
              DataField = 'FldDescriptionBlockAdd'
              DataSource = CodeDataSource
              TabOrder = 7
              ExplicitLeft = 15
              ExplicitTop = 222
            end
          end
        end
      end
      inherited SearchTabSheet: TTabSheet
        ExplicitHeight = 571
        inherited SearchFilterPanel: TPanel
          StyleElements = [seFont, seClient, seBorder]
          inherited SearchLabel: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited ReplaceLabel: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited SearchReplaceSwapLabel: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited SearchInLabel: TLabel
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited SearchButtonedEdit: TButtonedEdit
            StyleElements = [seFont, seClient, seBorder]
          end
          inherited ReplaceButtonedEdit: TButtonedEdit
            StyleElements = [seFont, seClient, seBorder]
          end
        end
        inherited SearchResultListBox: TListBox
          Height = 434
          StyleElements = [seFont, seClient, seBorder]
          ExplicitHeight = 434
        end
      end
      inherited OptionTabSheet: TTabSheet
        ExplicitHeight = 571
        inherited OptionJvScrollMax: TJvScrollMax
          Height = 571
          StyleElements = [seFont, seClient, seBorder]
          ExplicitHeight = 571
          inherited OptionDateTimeJvScrollMaxBand: TJvScrollMaxBand
            inherited OptionWeekWorkOneStartLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionWorkWeekDayLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionWorkWeekTimeLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionWorkWeekDayEdit: TEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionWorkWeekTimeEdit: TEdit
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          inherited OptionInterfaceJvScrollMaxBand: TJvScrollMaxBand
            inherited OptionTabWidthLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionStateDefaultLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionFontSizeLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionTextRightEdgeLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionTabWidthJvSpinEdit: TJvSpinEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionStateDefaultComboBox: TComboBox
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionFontSizeJvSpinEdit: TJvSpinEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionTextRightEdgeComboBox: TComboBox
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          inherited OptionFoldersJvScrollMaxBand: TJvScrollMaxBand
            inherited OptionPersistRootFolderLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionTempFolderLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionPersistRootFolderEdit: TEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionTempFolderEdit: TEdit
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          inherited OptionSecurityJvScrollMaxBand: TJvScrollMaxBand
            inherited OptionCryptoKeyLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionCryptoKeyEdit: TEdit
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          inherited OptionPythonJvScrollMaxBand: TJvScrollMaxBand
            inherited OptionPythonVersionLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionPythonExePathLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionPythonVersionComboBox: TComboBox
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionPythonExePathEdit: TEdit
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          inherited OptionFilesJvScrollMaxBand: TJvScrollMaxBand
            inherited OptionFilesWorkingFolderLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionFilesOnDoubleClickLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionFilesWorkingFolderClearLabel: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionFilesOnDoubleClickComboBox: TComboBox
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited OptionFilesWorkingFolderSelectButtonedEdit: TButtonedEdit
              StyleElements = [seFont, seClient, seBorder]
            end
          end
          object OptionCodeJvScrollMaxBand: TJvScrollMaxBand
            Width = 286
            Height = 92
            Caption = 'Code'
            ExpandedHeight = 92
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object OptionCodeSaveAfterPostCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 58
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Save after post'
              TabOrder = 0
            end
            object OptionCodeDirCreateIfNotExixtsCheckBox: TCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 35
              Width = 254
              Height = 17
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = ' Create directory if not exists'
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  inherited StatusBar: TStatusBar
    Top = 825
    ExplicitTop = 825
  end
  inherited MainPanel: TPanel
    Height = 601
    StyleElements = [seFont, seClient, seBorder]
    ExplicitHeight = 601
    inherited MainPageControl: TPageControl
      Height = 601
      ExplicitHeight = 601
      inherited ObjectContentPrevTabSheet: TTabSheet
        ExplicitHeight = 571
        inherited ObjectContentPrevDBSynEdit: TDBSynEdit
          Height = 543
          ExplicitHeight = 543
        end
        inherited ObjectContentPrevTopPanel: TPanel
          inherited ObjectContentPrevCharCountLabel: TLabel
            Height = 22
          end
        end
      end
      inherited ObjectContentTabSheet: TTabSheet
        ExplicitHeight = 571
        inherited ObjectContentSplitter: TSplitter
          Height = 543
          ExplicitHeight = 543
        end
        inherited ObjectContentTopPanel: TPanel
          inherited ObjectContentCharCountLabel: TLabel
            Height = 22
          end
        end
        inherited ObjectContentSplitView: TSplitView
          Height = 543
          DoubleBuffered = True
          ExplicitHeight = 543
          inherited ObjectContentEdgeBrowser: TEdgeBrowser
            Height = 543
            ExplicitHeight = 543
          end
        end
        inherited ObjectContentLeftPanel: TPanel
          Height = 543
          ExplicitHeight = 543
          inherited ObjectContentDBSynEdit: TDBSynEdit
            Height = 425
          end
        end
      end
      inherited ObjectDataTabSheet: TTabSheet
        ExplicitHeight = 571
        inherited ObjectDataDBSynEdit: TDBSynEdit
          Height = 543
          ExplicitHeight = 543
        end
        inherited ObjectDataTopPanel: TPanel
          inherited ObjectDataCharCountLabel: TLabel
            Height = 22
          end
        end
      end
      inherited ObjectNoteTabSheet: TTabSheet
        ExplicitHeight = 571
        inherited ObjectNoteDBSynEdit: TDBSynEdit
          Height = 543
          ExplicitHeight = 543
        end
        inherited ObjectNoteTopPanel: TPanel
          inherited ObjectNoteCharCountLabel: TLabel
            Height = 22
          end
        end
      end
      inherited FilesRioTabSheet: TTabSheet
        ExplicitHeight = 571
        inherited FilesRioTopPanel: TPanel
          inherited FilesRioInfoLabel: TLabel
            Height = 31
          end
        end
        inherited FilesRioTree: TVirtualStringTree
          Height = 525
          ExplicitHeight = 525
        end
      end
    end
  end
  object CodeClientDataSet: TClientDataSet [15]
    Aggregates = <>
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    PacketRecords = 0
    Params = <>
    ProviderName = 'CodeDataSetProvider'
    RemoteServer = MainSoapConnection
    AfterInsert = CodeClientDataSetAfterInsert
    AfterPost = CodeClientDataSetAfterPost
    AfterDelete = CodeClientDataSetAfterDelete
    OnReconcileError = CodeClientDataSetReconcileError
    Left = 72
    Top = 432
  end
  object CodeDataSource: TDataSource [16]
    DataSet = CodeClientDataSet
    Left = 208
    Top = 432
  end
  object CodeImageList24: TImageList [26]
    ColorDepth = cd32Bit
    Height = 24
    Width = 24
    Left = 376
    Top = 544
    Bitmap = {
      494C010103000800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFB
      F700FFEFC500FFF6E300FFFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003059EFFF0011
      93DB000005290000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFDFB00FFE2
      9100FFD56900FFDB6E00FFFBF900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004D78F8FF0128
      E8FF0025E7FF0015BFFC00000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF0CD00FFD9
      5D00FFD54100FFE6A200FFFCFB00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000000000004E7AF8FF2C53
      EFFF0026E8FF0024E5FF0017C3FB000214520000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFC00FFFBF600FFF7ED00FFF8
      EE00FFFAF400FFFDFC00000000000000000000000000FFF7E700FFD95B00FFDC
      6A00FFF1D400FFFEFB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C0C000FFFFFF0000000000000000000000000000000000517DF9FF6392
      FEFF0931EBFF0025E7FF0024E4FF0023E2FF0017C7FE0000000B000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFAF700FFF1C400FFE77600FFE24900FFE03D00FFE0
      3D00FFE04A00FFE37700FFF0CB00FFF7EF00FFEFCD00FFDB5B00FFDF7200FFF4
      DE00FFFEFE00000000000000000000000000000000000000000000000000FFFF
      FF00CCCCCC0099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0099999900CCCCCC00FFFF
      FF0000000000FFFFFF00000000000000000000000000000000005481F9FF5E8E
      FFFF8EB6FCFF0027E9FF0025E6FF0024E4FF0023E1FF0021DEFF0018C7FC0002
      104A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFE00FFF8E600FFE37200FFDE4100FFE45E00FFE56500FFE46200FFE2
      6200FFE26500FFE16200FFDB4B00FFD84B00FFDB5600FFD95900FFEAB600FFFE
      FD0000000000000000000000000000000000000000000000000000000000FFFF
      FF00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00FFFF
      FF0000000000FFFFFF00000000000000000000000000000000005684F9FF6090
      FFFF6E9DFFFF0028EAFF0026E7FF0025E5FF0023E3FF0022E0FF0021DDFF001C
      D3FF000007330000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFEFD00FFF9
      F200FFECB800FFD84700FFDD5600FFE05500FFDC3E00FFDA3E00FFD93E00FFD8
      3D00FFD73C00FFD53C00FFD84E00FFD95800FFD24300FFD25000FFFBF5000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00CCCCCC0099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0099999900CCCCCC00FFFF
      FF0000000000FFFFFF00000000000000000000000000000000005987F9FF6394
      FFFF6293FFFF5E8BF7FF0027E9FF0026E7FF0024E4FF0023E2FF0022E0FF0021
      DDFF0020DBFF001BD1FF01063182000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFEFB00FFE69B00FFCB
      4300FFCF4200FFDB5F00FFDB4C00FFDA4700FFD94700FFD84600FFD74600FFD6
      4600FFD54500FFD44500FFD24400FFD04300FFCF4300FFD66C00FFFCF9000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00FFFF
      FF0000000000FFFFFF00000000000000000000000000000000005B8AFAFF6697
      FFFF6595FFFF9CC9FFFF0028EBFF0027E9FF0025E6FF0024E4FF0023E2FF0022
      DFFF0020DCFF0020DBFF001ED7FF0015C3FE0001114F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFDFB00FFDB7400FFDA
      6600FFDA5A00FFD85100FFD85100FFD85100FFD75000FFD64F00FFD64F00FFD5
      4E00FFD44E00FFD24D00FFD14D00FFCF4C00FFCE4B00FFCB4800FFF5E4000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00CCCCCC0099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0099999900CCCCCC00FFFF
      FF0000000000FFFFFF00000000000000000000000000000000005D8CFAFF6999
      FFFF6798FFFF75A5FFFF204BF0FF0028EBFF0026E8FF0025E5FF0024E3FF0022
      E1FF0021DDFF0020DCFF001FD9FF001DD6FF001BD1FF010B6FC3000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFECC000FFD4
      5000FFD75A00FFD75A00FFD75A00FFD75A00FFD75A00FFD65C00FFD65D00FFD4
      5A00FFD25600FFD15600FFD05500FFCF5500FFCD5400FFCE5600FFD68000FFFD
      FB0000000000000000000000000000000000000000000000000000000000FFFF
      FF00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000608FFAFF6C9C
      FFFF6B9BFFFF6899FFFF93C5FFFF022BEDFF0027EAFF0025E7FF0025E5FF0023
      E2FF0022DFFF0021DEFF0020DBFF001ED8FF001DD6FF001CD4FF0018CAFF020F
      91E0000000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF8F100FFCF
      4D00FFD66200FFD66300FFD66400FFD76700FFD76900FFD86C00FFD86F00FFD8
      7100FFD56C00FFD16000FFD05F00FFCF5E00FFCD5E00FFCC5E00FFC54500FFF0
      DB0000000000000000000000000000000000000000000000000000000000FFFF
      FF00CCCCCC0099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0099999900CCCCCC00FFFF
      FF0000000000FFFFFF00000000000000000000000000000000006292FAFF6FA0
      FFFF6E9FFFFF6C9DFFFF8DBFFFFF70A1FDFF0F3AEFFF022BEAFF0028E7FF0025
      E5FF0023E1FF0022E0FF0020DDFF001FDAFF001ED8FF001DD6FF001CD3FF001B
      D1FF0017CCFF030A59AF00000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF9F300FFCB
      5000FFD66F00FFD77200FFD87400FFD87700FFD97900FFD97C00FFD97E00FFDA
      8100FFDA8300FFD77E00FFD06A00FFCF6800FFCD6700FFCC6700FFC95A00FFD6
      8C00FFFEFD00000000000000000000000000000000000000000000000000FFFF
      FF00CCCCCC009999990099999900999999009999990099999900999999009999
      9900999999009999990099999900999999009999990099999900CCCCCC00FFFF
      FF0000000000FFFFFF00000000000000000000000000000000006594FBFF71A2
      FFFF70A1FFFF6E9EFFFF7EB0FFFF83B4FFFF6191FFFF4A78FFFF4B79FFFF4D7B
      FFFF4F7DFFFF507EFFFF5280FEFF4F7CFDFF4C78FBFF4470F7FF3860EFFF2D53
      E9FF1B3CDFFF0E2BD4FF0110B6FE000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF6E900FFC4
      4700FFD97F00FFD98100FFDA8400FFDA8600FFDB8900FFDC8B00FFDC8D00FFDC
      8F00FFDC9200FFDC9400FFD98D00FFCF7200FFCE7000FFCD7000FFCC7000FFCD
      7900FFFCFB00000000000000000000000000000000000000000000000000FFFF
      FF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC0000000000FFFFFF00000000000000000000000000000000006798FBFF74A5
      FFFF73A4FFFF71A2FFFF96C8FFFF4274FFFF194BFFFF1D4FFFFF2152FFFF2556
      FFFF2A5BFFFF2D5DFFFF3262FFFF3766FFFF3A6AFFFF3F6EFFFF4472FFFF4775
      FFFF2546DBFE0000001000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFEFD00FFDDA000FFC8
      6300FFDA8E00FFDB9000FFDC9200FFDD9500FFDD9700FFDE9900FFDE9B00FFDE
      9D00FFDF9F00FFDFA200FFDFA400FFD99500FFCF7A00FFCE7A00FFC76A00FFE5
      C00000000000000000000000000000000000000000000000000000000000FFFF
      FF00CCCCCC00CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCCCC00CCCCCC00CCCC
      CC0000000000FFFFFF00000000000000000000000000000000006A9AFBFF77A9
      FFFF76A7FFFF74A5FFFF7EB1FFFF1143FFFF1547FFFF1A4BFFFF1C4DFFFF2152
      FFFF2556FFFF295AFFFF2E5EFFFF3262FFFF3665FFFF3B6AFFFF1F41DFFE0005
      3282000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFD00FDE7C300FDBA5500FFDB
      9800FFDD9C00FFDE9E00FFDFA000FFDFA300FFE0A400FFE0A600FFE1A900FFE1
      AA00FFE2AD00FFE2AF00FFE2B000FFE2B200FED69300FDCB7A00FDD79E00FFFD
      FB0000000000000000000000000000000000000000000000000000000000FFFF
      FF00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC0066666600666666006666
      66006666660066666600666666006666660066666600FFFFFF00CCCCCC00CCCC
      CC0000000000FFFFFF00000000000000000000000000000000006C9DFCFF7AAB
      FFFF78AAFFFF81B1FFFF2A5CFFFF0E40FFFF1244FFFF1648FFFF1A4BFFFF1E4F
      FFFF2354FFFF2556FFFF2B5BFFFF2F5FFFFF3262FFFF0923C7F9000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFEDD200F8B45800FEDBA000FFDF
      A700FFE0A900FFE1AB00FFE2AD00FFE2AF00FFE3B100FFE3B300FFE4B500FFE4
      B600FFE4B800FEE5BA00FEE5BC00FDE5BE00FCE1B800F8B55100FDEFDD000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC0066666600666666006666
      660066666600CCCCCC00CCCCCC00CCCCCC0066666600FFFFFF00CCCCCC00CCCC
      CC0000000000FFFFFF00000000000000000000000000000000006FA0FCFF7DAF
      FFFF7BADFFFFA5D1FFFF0639FFFF093BFFFF0E40FFFF1244FFFF1547FFFF1A4B
      FFFF1E4FFFFF2152FFFF2556FEFF0722B6EA0000011700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFE5BF00FDC36400FFE3B500FFE3
      B400FFE3B500FFE4B700FFE4B900FFE5BB00FFE6BC00FEE6BE00FEE6C000FEE7
      C100FDE7C300FDE7C500FCE7C600FCE6C800FCE6CA00F8C98300F6BE7700FFFB
      F70000000000000000000000000000000000000000000000000000000000FFFF
      FF00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC0066666600666666006666
      660066666600CCCCCC00CCCCCC00CCCCCC0066666600FFFFFF00CCCCCC00CCCC
      CC0000000000FFFFFF000000000000000000000000000000000072A3FDFF81B2
      FFFF81B1FFFF2657FFFF0234FFFF0538FFFF093BFFFF0E40FFFF1042FFFF1547
      FFFF194AFDFF0C32E1FC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFBF700FDD9A100FCC47100FBC8
      7D00FBD09200FCDCAD00FDE7C500FDE7C600FDE8C800FDE8C900FDE8CB00FCE8
      CC00FCE8CE00FCE9CF00FCE9D000FBE9D200FBE9D400F8DEC100F2B66900F1AE
      6000F8DBBF00FFF8F100FFFEFD0000000000000000000000000000000000FFFF
      FF00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC0066666600666666006666
      660066666600CCCCCC00CCCCCC00CCCCCC0066666600FFFFFF00CCCCCC00CCCC
      CC0000000000FFFFFF000000000000000000000000000000000074A6FDFF83B5
      FFFF8BBAFFFF0134FFFF0032FFFF0234FFFF0739FFFF0B3DFFFF0E40FFFF1142
      FCFF000B4E990000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFE00FFFAF700FFF7
      ED00FCEAD200FBD8A800F7BC6F00FCE9D000FCE9D100FCEAD300FCEAD500FCEA
      D600FCEBD700FBEBD800FBEBDA00FAE7D400EFB47900F4C69700F6D3B000F1B9
      8000EC9F5300E58A3B00E9AD8100FFFAF500000000000000000000000000FFFF
      FF00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC0066666600666666006666
      660066666600CCCCCC00CCCCCC00CCCCCC0066666600FFFFFF00CCCCCC00CCCC
      CC0000000000FFFFFF000000000000000000000000000000000077A8FDFF86B8
      FFFF90B6FFFF0032FFFF0032FFFF0032FFFF0235FFFF0537FCFF001FBEE90000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFD00F6C79100FAE5CD00FCECDB00FCECDC00FCEDDD00FCED
      DE00FBEDDF00FBEEE100FBEEE200EFC09600FBE3CB00FFFEFD0000000000FFFB
      F700F0C6A300EAB99700D8753700F2D1BA00000000000000000000000000FFFF
      FF00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC0066666600666666006666
      660066666600CCCCCC00CCCCCC00CCCCCC0066666600FFFFFF00CCCCCC00CCCC
      CC0000000000FFFFFF00000000000000000000000000000000007AACFDFF97C3
      FFFF0033FFFF0032FFFF0032FFFF0031FEFF001BA9DA00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9DDC100F6D5B700FCEFE300FCEFE400FCF0E500F6DC
      C600EEBC9200F6DCC700FCF1E900F0C6A300FAE8D70000000000000000000000
      0000FFFBF900EEC2A500E0997200FBEFE500000000000000000000000000FFFF
      FF00FFFFFF0099999900FFFFFF00FFFFFF00FFFFFF0066666600666666006666
      66006666660066666600666666006666660066666600FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000007BAEFDFF4F7A
      FFFF0032FFFF0032FFFF002EF5FE001995CC0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCF0E300ECB48500FBF2EA00F5DDCA00E9AB7A00F0BC
      8F00F8DEC700EFBE9500F0CBB100FAECE200EDBB9600FFFEFD00000000000000
      000000000000FFFEFD00FFFEFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007EB1FEFF0032
      FFFF0031FDFF0003114400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFCF900E9AB7C00E3955C00ECB58900FCEFE300FFFE
      FD0000000000FFFEFB00F6D6BF00E9B79C00DC8F6400FFFBF700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004173FDFF000E
      5192000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFDFB00FFFCF900FFFEFD00000000000000
      00000000000000000000FFFEFD00F5D9C700E9B89E00FFFDFB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000105250000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF00FFFFE1FFFFFF000000000000FFFFC1FF
      FFFF000000000000FFFFC1F00007000000000000FF0383E00003000000000000
      FC0007C00003000000000000F0000FC00003000000000000C0001FC000030000
      0000000080001FC0000300000000000080001FC00003000000000000C0000FC0
      0003000000000000C0000FC00003000000000000C00007C00003000000000000
      C00007C0000300000000000080000FC0000300000000000000000FC000030000
      0000000000001FC0000300000000000000000FC00003000000000000000001C0
      0003000000000000800000C00003000000000000F80020C00003000000000000
      FC0070C00007000000000000FC0039E0000F000000000000FC083FFFFFFF0000
      00000000FE3C3FFFFFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object CodeAction: TActionList [27]
    Images = CodeImageList24
    Left = 584
    Top = 544
    object CodeSaveItemAction: TAction
      Caption = '    Item    '
      Hint = 'Save current item to the Destination Directory'
      ImageIndex = 1
      OnExecute = CodeSaveItemActionExecute
    end
    object CodeSaveChildsAction: TAction
      Caption = 'Childs'
      Hint = 
        'Save all childs under the current selected item to the Destinati' +
        'on Directory'
      ImageIndex = 1
      OnExecute = CodeSaveChildsActionExecute
    end
    object CodeSaveBranchAction: TAction
      Caption = 'Branch'
      Hint = 
        'Save current item and childs merging all them to a single file i' +
        'nto the Destination Directory'
      ImageIndex = 1
      OnExecute = CodeSaveBranchActionExecute
    end
    object CodeRunAction: TAction
      Caption = 'Run'
      Hint = 
        'Execute the code of the current object invoking a convenient com' +
        'piler or runtime'
      ImageIndex = 2
      OnExecute = CodeRunActionExecute
    end
  end
end
