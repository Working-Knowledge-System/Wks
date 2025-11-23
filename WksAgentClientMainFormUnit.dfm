inherited AgentMainForm: TAgentMainForm
  Margins.Top = 8
  Caption = 'AgentMainForm'
  StyleElements = [seFont, seClient, seBorder]
  OnCloseQuery = FormCloseQuery
  TextHeight = 15
  inherited LeftJvNetscapeSplitter: TJvNetscapeSplitter
    ExplicitHeight = 605
  end
  inherited RightJvNetscapeSplitter: TJvNetscapeSplitter
    ExplicitLeft = 867
    ExplicitHeight = 605
  end
  inherited BottomJvNetscapeSplitter: TJvNetscapeSplitter
    ExplicitTop = 688
    ExplicitWidth = 1180
  end
  inherited TopPanel: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited TopPageControl: TPageControl
      ActivePage = AgentTabSheet
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
      inherited TopUtilsTabSheet: TTabSheet
        inherited UtilsToolBar: TToolBar
          ButtonWidth = 46
          inherited UtilsPythonExecToolButton: TToolButton
            ExplicitWidth = 46
          end
        end
      end
      object AgentTabSheet: TTabSheet
        Caption = 'Agent'
        ImageIndex = 2
        object AgentToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 432
          Height = 44
          Align = alLeft
          AutoSize = True
          ButtonHeight = 46
          ButtonWidth = 72
          Caption = 'AgentToolBar'
          Images = AgentImageList24
          ShowCaptions = True
          TabOrder = 0
          object AgentTestToolButton: TToolButton
            Left = 0
            Top = 0
            Action = AgentTestAction
          end
          object AgentResultToolButton: TToolButton
            Left = 72
            Top = 0
            Action = AgentResultAction
          end
          object AgentRunToolButton: TToolButton
            Left = 144
            Top = 0
            Action = AgentRunAction
          end
          object AgentActiveToolButton: TToolButton
            Left = 216
            Top = 0
            Action = AgentActiveAction
          end
          object AgentCsAdoTestToolButton: TToolButton
            Left = 288
            Top = 0
            Action = AgentCsAdoTestAction
          end
          object ToolButton2: TToolButton
            Left = 360
            Top = 0
            Action = AgentCsFdTestAction
          end
        end
        object AgentMonitorPanel: TPanel
          Left = 432
          Top = 0
          Width = 720
          Height = 44
          Align = alClient
          BevelOuter = bvNone
          Caption = 'AgentMonitorPanel'
          ShowCaption = False
          TabOrder = 1
          object AgentRunningLabel: TLabel
            Left = 11
            Top = 24
            Width = 39
            Height = 13
            Hint = 
              'this shows up only when the thread associated with the Agent is ' +
              'actually executing'
            Caption = 'Running'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object AgentRunningCountLabel: TLabel
            AlignWithMargins = True
            Left = 63
            Top = 24
            Width = 6
            Height = 13
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object AgentActiveLabel: TLabel
            Left = 11
            Top = 8
            Width = 30
            Height = 13
            Hint = 
              'this shows up only when the thread associated with the Agent is ' +
              'actually executing'
            Caption = 'Active'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object AgentActiveCountLabel: TLabel
            AlignWithMargins = True
            Left = 63
            Top = 8
            Width = 6
            Height = 13
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
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
    StyleElements = [seFont, seClient, seBorder]
    OnResize = LeftPanelResize
    inherited LeftPageControl: TPageControl
      ActivePage = RunningTabSheet
      inherited ObjectTreeTabSheet: TTabSheet
        inherited ObjectNodeInfoLabel: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited ObjectDBNavigator: TDBNavigator
          Hints.Strings = ()
        end
      end
      object AgentActiveTabSheet: TTabSheet
        Hint = 'Active Agents'
        Caption = 'Active'
        ImageIndex = 2
        OnShow = AgentActiveTabSheetShow
        object AgentActiveDBNavigator: TDBNavigator
          Left = 0
          Top = 0
          Width = 292
          Height = 25
          DataSource = AgentActiveDataSource
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          Align = alTop
          Flat = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object AgentActiveDBCtrlGrid: TDBCtrlGrid
          Left = 0
          Top = 25
          Width = 292
          Height = 537
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          Color = clWhite
          DataSource = AgentActiveDataSource
          Orientation = goHorizontal
          PanelBorder = gbNone
          PanelHeight = 52
          PanelWidth = 292
          ParentColor = False
          TabOrder = 1
          RowCount = 10
          SelectedColor = clYellow
          ShowFocus = False
          ExplicitHeight = 541
          object AgentActiveObjectIdDBText: TDBText
            AlignWithMargins = True
            Left = 8
            Top = 8
            Width = 48
            Height = 17
            Margins.Left = 8
            Margins.Top = 8
            Margins.Right = 8
            DataField = 'FldId'
            DataSource = AgentActiveDataSource
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object AgentActiveObjectDBText: TDBText
            AlignWithMargins = True
            Left = 72
            Top = 8
            Width = 213
            Height = 17
            Margins.Left = 8
            Margins.Top = 8
            Margins.Right = 8
            Alignment = taRightJustify
            DataField = 'FldObject'
            DataSource = AgentActiveDataSource
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object AgentActiveRunAtHourDBText: TDBText
            Left = 95
            Top = 31
            Width = 67
            Height = 17
            Hint = 'Hour(s)'
            Alignment = taRightJustify
            DataField = 'FldRunAtHour'
            DataSource = AgentActiveDataSource
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object AgentActiveRunAtMinuteDBText: TDBText
            Left = 173
            Top = 31
            Width = 53
            Height = 17
            Hint = 'Minute(s)'
            Alignment = taRightJustify
            DataField = 'FldRunAtMinute'
            DataSource = AgentActiveDataSource
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object AgentActiveRunAtSecondDBText: TDBText
            Left = 232
            Top = 31
            Width = 53
            Height = 17
            Hint = 'Second(s)'
            Alignment = taRightJustify
            DataField = 'FldRunAtSecond'
            DataSource = AgentActiveDataSource
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object AgentActiveRunAtLabel: TLabel
            Left = 8
            Top = 31
            Width = 69
            Height = 15
            Caption = 'run at h:m:s :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object RunningTabSheet: TTabSheet
        Caption = 'Running'
        ImageIndex = 3
        object RunningPanel: TPanel
          Left = 0
          Top = 0
          Width = 292
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          Caption = 'RunListPanel'
          ShowCaption = False
          TabOrder = 0
          ExplicitTop = 8
          object RunningPauseLabel: TLabel
            Left = 8
            Top = 6
            Width = 31
            Height = 15
            Cursor = crHandPoint
            Caption = 'Pause'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = RunningPauseLabelClick
          end
          object RunningStopLabel: TLabel
            Left = 120
            Top = 6
            Width = 24
            Height = 15
            Cursor = crHandPoint
            Caption = 'Stop'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = RunningStopLabelClick
          end
          object RunningContinueLabel: TLabel
            Left = 56
            Top = 6
            Width = 49
            Height = 15
            Cursor = crHandPoint
            Caption = 'Continue'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = RunningContinueLabelClick
          end
        end
        object RunningListBox: TListBox
          AlignWithMargins = True
          Left = 3
          Top = 33
          Width = 286
          Height = 530
          Margins.Top = 8
          Align = alClient
          BorderStyle = bsNone
          ItemHeight = 15
          TabOrder = 1
          OnClick = RunListBoxClick
        end
      end
      object RunListTabSheet: TTabSheet
        Caption = '  Runs'
        ImageIndex = 2
        object RunListBox: TListBox
          AlignWithMargins = True
          Left = 3
          Top = 33
          Width = 286
          Height = 530
          Margins.Top = 8
          Align = alClient
          BorderStyle = bsNone
          ItemHeight = 15
          TabOrder = 0
          OnClick = RunListBoxClick
        end
        object RunListPanel: TPanel
          Left = 0
          Top = 0
          Width = 292
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          Caption = 'RunListPanel'
          ShowCaption = False
          TabOrder = 1
          object RunListClearLabel: TLabel
            Left = 8
            Top = 6
            Width = 27
            Height = 15
            Caption = 'Clear'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = RunListClearLabelClick
          end
        end
      end
    end
  end
  inherited BottomPanel: TPanel
    StyleElements = [seFont, seClient, seBorder]
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
    StyleElements = [seFont, seClient, seBorder]
    inherited RightPageControl: TPageControl
      inherited PropertyTabSheet: TTabSheet
        inherited ObjectJvScrollMax: TJvScrollMax
          StyleElements = [seFont, seClient, seBorder]
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
          object AgentJvScrollMaxBand: TJvScrollMaxBand
            Width = 279
            Height = 21
            Expanded = False
            Caption = 'Agent'
            ExpandedHeight = 124
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object AgentObjectIdLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 53
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Object Id'
              ExplicitWidth = 48
            end
            object AgentObjectIdDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 74
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clMoneyGreen
              DataField = 'FldObjectId'
              DataSource = AgentDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
            end
            object AgentDBNavigator: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 273
              Height = 25
              DataSource = AgentDataSource
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alTop
              Flat = True
              TabOrder = 1
            end
          end
          object AgentRunAtJvScrollMaxBand: TJvScrollMaxBand
            Width = 279
            Height = 21
            Expanded = False
            Caption = 'RunAt'
            ExpandedHeight = 465
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object AgentRunAtYearLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 35
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Year (empty or * or csv of years)'
              ExplicitWidth = 167
            end
            object AgentRunAtQuarterLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 85
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Quarter (empty or * or csv of quarters)'
              ExplicitWidth = 201
            end
            object AgentRunAtMonthLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 135
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Month (empty or * or csv of months)'
              ExplicitWidth = 195
            end
            object AgentRunAtWeekLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 185
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Week (empty or * or csv of weeks)'
              ExplicitWidth = 179
            end
            object AgentRunAtDayLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 235
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Day (empty or * or csv of days)'
              ExplicitWidth = 162
            end
            object AgentRunAtSecondLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 398
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Second (empty or * or csv of seconds)'
              ExplicitWidth = 200
            end
            object AgentRunAtMinuteLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 348
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Minute (empty or * or csv of minutes)'
              ExplicitWidth = 199
            end
            object AgentRunAtHourLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 298
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Hour (empty or * or csv of hours)'
              ExplicitWidth = 175
            end
            object AgentRunAtYearDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 56
              Width = 247
              Height = 23
              Hint = 'Id'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldRunAtYear'
              DataSource = AgentDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object AgentRunAtQuarterDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 106
              Width = 247
              Height = 23
              Hint = 'Id'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldRunAtQuarter'
              DataSource = AgentDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object AgentRunAtMonthDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 156
              Width = 247
              Height = 23
              Hint = 'Id'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldRunAtMonth'
              DataSource = AgentDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
            object AgentRunAtWeekDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 206
              Width = 247
              Height = 23
              Hint = 'Id'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldRunAtWeek'
              DataSource = AgentDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object AgentRunAtDayDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 256
              Width = 247
              Height = 23
              Hint = 'Id'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldRunAtDay'
              DataSource = AgentDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
            end
            object AgentRunAtSecondDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 419
              Width = 247
              Height = 23
              Hint = 'Id'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldRunAtSecond'
              DataSource = AgentDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
            end
            object AgentRunAtMinuteDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 369
              Width = 247
              Height = 23
              Hint = 'Id'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldRunAtMinute'
              DataSource = AgentDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
            end
            object AgentRunAtHourDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 319
              Width = 247
              Height = 23
              Hint = 'Id'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldRunAtHour'
              DataSource = AgentDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
            end
          end
          object AgentEventsJvScrollMaxBand: TJvScrollMaxBand
            Width = 279
            Height = 21
            Expanded = False
            Caption = 'Events'
            ExpandedHeight = 205
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object AgentOnSuccessLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 35
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'On Success (empty or csv of agent-ids)'
              ExplicitWidth = 206
            end
            object AgentOnFailLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 85
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'On Fail (empty or csv of agent-ids)'
              ExplicitWidth = 183
            end
            object AgentOnEmptyLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 135
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'On Empty Run (empty or csv of agent-ids)'
              ExplicitWidth = 223
            end
            object AgentOnSuccessDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 56
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldOnSuccess'
              DataSource = AgentDataSource
              TabOrder = 0
            end
            object AgentOnFailDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 106
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldOnFail'
              DataSource = AgentDataSource
              TabOrder = 1
            end
            object AgentOnEmptyDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 156
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldOnEmpty'
              DataSource = AgentDataSource
              TabOrder = 2
            end
          end
        end
      end
      inherited SearchTabSheet: TTabSheet
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
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited OptionTabSheet: TTabSheet
        inherited OptionJvScrollMax: TJvScrollMax
          StyleElements = [seFont, seClient, seBorder]
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
          object OptionJclJvScrollMaxBand: TJvScrollMaxBand
            Width = 286
            Height = 21
            Expanded = False
            Caption = 'Jmp'
            ExpandedHeight = 70
            Beveled = False
            DesignSize = (
              286
              21)
            object OptionJmpExePathLabel: TLabel
              Left = 16
              Top = 36
              Width = 82
              Height = 15
              Hint = 'JMP Executable path'
              Caption = 'JMP Executable'
            end
            object OptionJmpExePathEdit: TEdit
              Left = 104
              Top = 33
              Width = 161
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Text = 'OptionJmpExePathEdit'
            end
          end
        end
      end
    end
  end
  inherited MainPanel: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited MainPageControl: TPageControl
      ActivePage = ObjectContentTabSheet
      inherited ObjectContentTabSheet: TTabSheet
        inherited ObjectContentSplitter: TSplitter
          ExplicitHeight = 536
        end
        inherited ObjectContentSplitView: TSplitView
          DoubleBuffered = True
        end
      end
      inherited ObjectDataTabSheet: TTabSheet
        inherited ObjectDataDBSynEdit: TDBSynEdit
          PopupMenu = SynEditDataPopup
        end
      end
      inherited FilesRioTabSheet: TTabSheet
        inherited FilesRioTree: TVirtualStringTree
          DefaultNodeHeight = 25
        end
      end
      object RunInfoTabSheet: TTabSheet
        Caption = '   Run'
        ImageIndex = 4
        OnShow = RunInfoTabSheetShow
        object RunInfoPanel: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 893
          Height = 48
          Align = alTop
          BevelOuter = bvNone
          Caption = 'RunInfoPanel'
          ShowCaption = False
          TabOrder = 0
          object RunInfoStartedLabel: TLabel
            Left = 8
            Top = 8
            Width = 43
            Height = 15
            Caption = 'Started :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object RunInfoStartedValueLabel: TLabel
            Left = 66
            Top = 8
            Width = 135
            Height = 15
            Caption = 'RunInfoStartedValueLabel'
          end
          object RunInfoEndedValueLabel: TLabel
            Left = 261
            Top = 8
            Width = 131
            Height = 15
            Caption = 'RunInfoEndedValueLabel'
          end
          object RunInfoEndedLabel: TLabel
            Left = 216
            Top = 8
            Width = 39
            Height = 15
            Caption = 'Ended :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object RunInfoMessageLabel: TLabel
            Left = 8
            Top = 29
            Width = 52
            Height = 15
            Caption = 'Message :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object RunInfoMessageValueLabel: TLabel
            Left = 66
            Top = 29
            Width = 152
            Height = 15
            Caption = 'RunInfoMessageValueLabel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RunInfoElapsedLabel: TLabel
            Left = 424
            Top = 8
            Width = 73
            Height = 15
            Caption = 'Elapsed (ms) :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object RunInfoElapsedValueLabel: TLabel
            Left = 503
            Top = 8
            Width = 138
            Height = 15
            Caption = 'RunInfoElapsedValueLabel'
          end
          object RunInfoAffectedLabel: TLabel
            Left = 663
            Top = 8
            Width = 51
            Height = 15
            Caption = 'Affected :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object RunInfoAffectedValueLabel: TLabel
            Left = 717
            Top = 8
            Width = 143
            Height = 15
            Caption = 'RunInfoAffectedValueLabel'
          end
        end
        object RunInfoGridPanel: TGridPanel
          AlignWithMargins = True
          Left = 3
          Top = 57
          Width = 893
          Height = 440
          Align = alTop
          BevelOuter = bvNone
          Caption = 'RunInfoGridPanel'
          ColumnCollection = <
            item
              Value = 50.000000000000000000
            end
            item
              Value = 50.000000000000000000
            end>
          ControlCollection = <
            item
              Column = 0
              Control = RunInfoOutputLabel
              Row = 0
            end
            item
              Column = 1
              Control = RunInfoReportLabel
              Row = 0
            end
            item
              Column = 1
              Control = RunInfoReportRichEdit
              Row = 1
            end
            item
              Column = 0
              Control = RunInfoOutputRichEdit
              Row = 1
            end>
          RowCollection = <
            item
              SizeStyle = ssAuto
              Value = 50.000000000000000000
            end
            item
              Value = 100.000000000000000000
            end>
          ShowCaption = False
          TabOrder = 1
          object RunInfoOutputLabel: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 435
            Height = 23
            Margins.Right = 8
            Align = alTop
            AutoSize = False
            Caption = '  Agent Output'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
            ExplicitLeft = 5
            ExplicitWidth = 256
          end
          object RunInfoReportLabel: TLabel
            AlignWithMargins = True
            Left = 449
            Top = 3
            Width = 436
            Height = 23
            Margins.Right = 8
            Align = alTop
            AutoSize = False
            Caption = '  Thread Report'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
            Layout = tlCenter
            ExplicitLeft = 277
            ExplicitWidth = 253
          end
          object RunInfoReportRichEdit: TRichEdit
            AlignWithMargins = True
            Left = 454
            Top = 32
            Width = 431
            Height = 405
            Margins.Left = 8
            Margins.Right = 8
            Align = alClient
            BorderStyle = bsNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            Lines.Strings = (
              'RunInfoReportRichEdit')
            ParentFont = False
            PlainText = True
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
          end
          object RunInfoOutputRichEdit: TRichEdit
            AlignWithMargins = True
            Left = 8
            Top = 32
            Width = 430
            Height = 405
            Margins.Left = 8
            Margins.Right = 8
            Align = alClient
            BorderStyle = bsNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            Lines.Strings = (
              'RunInfoOutputRichEdit')
            ParentFont = False
            PlainText = True
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 1
          end
        end
      end
      object ResultTabSheet: TTabSheet
        Caption = 'Result'
        ImageIndex = 6
        object ResultDBGrid: TDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 893
          Height = 560
          Align = alClient
          BorderStyle = bsNone
          DataSource = ResultDataSource
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
      end
    end
  end
  object AgentClientDataSet: TClientDataSet [15]
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'FldObjectId'
        DataType = ftInteger
      end
      item
        Name = 'FldRunAtYear'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'FldRunAtQuarter'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'FldRunAtMonth'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'FldRunAtWeek'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'FldRunAtWeekMode'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'FldRunAtDay'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'FldRunAtHour'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'FldRunAtMinute'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'FldRunAtSecond'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'FldOnSuccess'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'FldOnFail'
        DataType = ftString
        Size = 256
      end
      item
        Name = 'FldOnEmpty'
        DataType = ftString
        Size = 256
      end>
    IndexDefs = <>
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    PacketRecords = 0
    Params = <>
    ProviderName = 'AgentDataSetProvider'
    RemoteServer = MainSoapConnection
    StoreDefs = True
    AfterInsert = AgentClientDataSetAfterInsert
    AfterPost = AgentClientDataSetAfterPost
    AfterDelete = AgentClientDataSetAfterDelete
    OnReconcileError = AgentClientDataSetReconcileError
    Left = 72
    Top = 432
  end
  object AgentDataSource: TDataSource [16]
    DataSet = AgentClientDataSet
    Left = 208
    Top = 432
  end
  inherited MainSoapConnection: TSoapConnection
    URL = 'http://localhost/WksAgentSoapProject.dll/soap'
  end
  inherited ObjectClientDataSet: TClientDataSet
    StoreDefs = True
  end
  object AgentImageList24: TImageList [20]
    ColorDepth = cd32Bit
    Height = 24
    Width = 24
    Left = 376
    Top = 544
    Bitmap = {
      494C010106000800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000003000000001002000000000000048
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000517F22D6478108F6448103FB4580
      01FD447D00FF448103FB438002FC55703AA30000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A8315E70CE500FF00FA00FF00FC
      00FF00FF00FF00FF00FF16D100FF547736AF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004B8317E509EA00FF00FF00FF00FF
      00FF00FF00FF00FF00FF15D300FF537934B50000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D831CDE0BE600FF00FF00FF00FF
      00FF00FF00FF00FF00FF13D600FF527C30BD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004F821FDA0CE400FF00FF00FF00FF
      00FF00FF00FF00FF00FF12D900FF527E2DC30000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001A181A1B744F7475935D9195AE67A7B68A59898C4737
      4748010001010000000000000000000000000000000000000000000000000000
      000032352E3D434B3A5C454E3C6048513D674B8115E70DE200FF00FF00FF00FF
      00FF00FF00FF00FF00FF11DB00FF4A8214E955713AA2557538AA557238A93B40
      354C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000040404057E547E7F963C25FE822A34FF531B6EFF4C1881FF622158FF9331
      1BFFBC649CDB362D363700000000000000000000000000000000000000000000
      000016161518537D28CC437D00FF32A608F62DAE06F807ED00FF00FF00FF00FF
      00FF00FF00FF00FF00FF05F000FF1CC700FF23B900FF447F00FE52643F880000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A2629EA68B2E26FF270AB8FF0000FDFF0000FFFF0000FFFF0000FFFF0600
      EAFF581D67FFA94C55F43A2F3A3B000000000000000000000000000000000000
      0000000000000505050655703AA2408E0AF407ED00FF00FF00FF00FF00FF00FF
      00FF00FF00FF00FF00FF00FF00FF0CE400FF448609F548523D67000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001D1A1D1E8A59898CB369
      AABFB369AABFB369AABFB369AABFB369AABFB369AABFB369AABFB369AABFBA66
      A6D18D2F23FF1102D9FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FEFF4F1A74FFBB6197DC010101020000000000000000000000000000
      0000000000000000000000000000818A3EFF438400FF10DC00FF00FF00FF00FF
      00FF00FF00FF00FF00FF12D900FF438200FF8F8B4DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002A242A2BB35671EC833F3FFF6051
      80FF5D5385FF5D5385FF5D5385FF5D5385FF5D5385FF5D5385FF5D5181FF9132
      19FF3C1299FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000F6FF872C2CFF694A696A0000000000000000000000000000
      000000000000AF916FFF955D35FF955D35FFD28E00FF4C8400FF20C300FF00FF
      00FF00FF00FF1ACA00FF4C8500FFD88F00FF955D35FF955D35FFAF916FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AA64A4B16E485AFF2976F2FF2877
      F5FF2877F5FF2877F5FF2877F5FF2877F5FF2877F5FF2877F5FF3669CEFF9632
      17FF0200EFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF491786FFAE66A6B70000000000000000000000000000
      0000AF916FFF955D35FFFF9400FFFF9400FFFF9400FFE99100FF5C8700FF33A9
      00FF28BA00FF538600FFE59100FFFF9400FFFF9400FFFF9400FF955D35FFAF91
      6FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C3F2FFC3E68C6FF2877F5FF2877
      F5FF2877F5FF2877F5FF2877F5FF2877F5FF2877F5FF2877F5FF4461B3FF832B
      32FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF2B0CB3FFB965A3CF0000000000000000000000000000
      0000955D35FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFF89300FF7B89
      00FF618700FFEF9200FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FF955D
      35FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AB4C58F34265BFFF2877F5FF2877
      F5FF2877F5FF2877F5FF2877F5FF2877F5FF2877F5FF2877F5FF4362B7FF892D
      29FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF300EABFFB965A4CF0000000000000000000000000000
      0000955D35FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFE93
      00FFF99300FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FF975E
      36FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B60999F764249FF2C74EDFF2877
      F5FF2877F5FF2877F5FF2877F5FF2877F5FF2877F5FF2877F5FF336EDBFF9532
      17FF0A00E3FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0000FFFF521B70FFA564A0AA0000000000000000000000000000
      0000955D35FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FF975E
      36FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000015141516BB65A1D48C392BFF6C49
      5EFF674C68FF674C68FF674C68FF674C68FF674C68FF674C68FF674C67FF9234
      1DFF4F1975FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000FFFF0800E7FF8F2F20FF4939494A0000000000000000000000000000
      0000955D35FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FF975E
      36FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000050505064A394A4B8457
      84868D5B8C8F8D5B8C8F8D5B8C8F8D5B8C8F8D5B8C8F8D5B8C8F8D5B8C8F8D5B
      8C8F933621FE290BB6FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
      FFFF0000F6FF69244DFFB167A7BA010000010000000000000000000000000000
      0000955D35FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FF975E
      36FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005B435B5C9B3B29FD4A1884FF0500EBFF0000FFFF0000FFFF0000FCFF2007
      C3FF74283EFFB866A6C90D0D0D0E000000000000000000000000000000000000
      0000955D35FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FF975E
      36FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000342B3435B567A7C293311BFF772938FF6F2645FF8A2D28FFAD4F
      61F0855784870E0E0E0F00000000000000000000000000000000000000000000
      0000955D35FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FF975E
      36FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001D1A1D1E5B435B5C5F455F604A394A4B0E0E
      0E0F000000000000000000000000000000000000000000000000000000000000
      0000955D35FFFF9400FFFF9400FF955D35FF955D35FF955D35FF955D35FF955D
      35FF955D35FF955D35FF955D35FF955D35FFA1653BFFFF9400FFFF9400FF975E
      36FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000955D35FF955D35FF955D35FF955D35FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FF955D35FF955D35FF955D35FF9059
      33FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000955D35FF955D35FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FF955D35FF9A69
      46FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AF916FFF955D35FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FFFF9400FF955D35FFAF91
      6FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AF916FFF955D35FF955D35FFFF9400FFFF9400FFFF9400FFFF94
      00FFFF9400FFFF9400FFFF9400FFFF9400FF955D35FF955D35FFA27556FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AF916FFF955D35FF955D35FF955D35FF955D
      35FF955D35FF955D35FF955D35FF955D35FFAF916FFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFB
      F700FFEFC500FFF6E300FFFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000955E999B4E3C
      4E4F030303040000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000000000009D63CBD5674F
      D8EBA062A8AC352C353600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF0CD00FFD9
      5D00FFD54100FFE6A200FFFCFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009964D0DB365D
      F1FE3337DDF68756D0DE8C5B8E90201D20210000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFC00FFFBF600FFF7ED00FFF8
      EE00FFFAF400FFFDFC00000000000000000000000000FFF7E700FFD95B00FFDC
      6A00FFF1D400FFFEFB0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000000000009964D0DB5084
      FBFF0F36EAFF0724E1FD5442D8EF9E5FC5CE734F737411101112000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFAF700FFF1C400FFE77600FFE24900FFE03D00FFE0
      3D00FFE04A00FFE37700FFF0CB00FFF7EF00FFEFCD00FFDB5B00FFDF7200FFF4
      DE00FFFEFE000000000000000000000000000000000000000000000000006633
      3300663333006633330066333300663333006633330066333300663333006633
      3300663333006633330066333300663333006633330066333300663333006633
      3300FFFFFF0000000000000000000000000000000000000000009964D1DB558B
      FDFF436BF3FF001EE7FF001CE4FF0E26DCFC764ED4E5A463B3B8574157580606
      0607000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFE00FFF8E600FFE37200FFDE4100FFE45E00FFE56500FFE46200FFE2
      6200FFE26500FFE16200FFDB4B00FFD84B00FFDB5600FFD95900FFEAB600FFFE
      FD00000000000000000000000000000000000000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF00CC99
      9900FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF006633
      3300FFFFFF0000000000000000000000000000000000000000009965D1DB578E
      FEFF6498FBFF0E36EBFF001DE6FF001CE3FF001FDFFE282DD9F89159CCD99B60
      A1A43F333F400202020300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      0203473747488C5A8B8EAE67A7B6915C8F936B4B6B6C11101112000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFEFD00FFF9
      F200FFECB800FFD84700FFDD5600FFE05500FFDC3E00FFDA3E00FFD93E00FFD8
      3D00FFD73C00FFD53C00FFD84E00FFD95800FFD24300FFD25000FFFBF5000000
      0000000000000000000000000000000000000000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF00CC99
      9900FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF006633
      3300FFFFFF0000000000000000000000000000000000000000009265D4DF5A92
      FFFF6096FEFF4772F4FF001EE8FF001DE5FF001CE3FF001AE0FF001DDCFE3D35
      D4F4A05FC2CB865887892C262C2D000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002D262D2EBC64
      9CDB943615FF81560DFF6F6609FF735F0BFF8E4012FFAB4C58F3744F74750000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFEFB00FFE69B00FFCB
      4300FFCF4200FFDB5F00FFDB4C00FFDA4700FFD94700FFD84600FFD74600FFD6
      4600FFD54500FFD44500FFD24400FFD04300FFCF4300FFD66C00FFFCF9000000
      0000000000000000000000000000000000000000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF00CC99
      9900FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF006633
      3300FFFFFF0000000000000000000000000000000000000000009165D6E15C94
      FFFF5C93FFFF70A5FAFF0932ECFF001EE7FF001DE5FF001BE2FF001ADFFF0019
      DDFF001AD7FE6948D1E9A463B5BA704D70711816181900000000000000000000
      000000000000000000000000000000000000000000003C313C3DA74A4DF6745D
      0BFF4EA700FF48B000FF48B000FF48B000FF49AE00FF618603FF933815FF8256
      8284000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFDFB00FFDB7400FFDA
      6600FFDA5A00FFD85100FFD85100FFD85100FFD75000FFD64F00FFD64F00FFD5
      4E00FFD44E00FFD24D00FFD14D00FFCF4C00FFCE4B00FFCB4800FFF5E4000000
      0000000000000000000000000000000000000000000000000000000000006633
      3300663333006633330066333300663333006633330066333300663333006633
      3300663333006633330066333300663333006633330066333300663333006633
      3300FFFFFF0000000000000000000000000000000000000000009165D6E15F97
      FFFF5D95FFFF6EA5FDFF406DF3FF001FE9FF001DE6FF001CE3FF001BE1FF001A
      DEFF0018DCFF0017D9FF0E21D1FC8653CCDF9C61A3A6584158590F0F0F100000
      00000000000000000000000000000000000005050506BA6090E0706409FF48AF
      00FF48B000FF48B000FF48B000FF48B000FF48B000FF48B000FF589500FF9436
      16FFB668AAC8B369AABFB369AABFB369AABFB369AABFB369AABFB369AABFB369
      AABFB369AABF775177780E0E0E0F000000000000000000000000FFECC000FFD4
      5000FFD75A00FFD75A00FFD75A00FFD75A00FFD75A00FFD65C00FFD65D00FFD4
      5A00FFD25600FFD15600FFD05500FFCF5500FFCD5400FFCE5600FFD68000FFFD
      FB00000000000000000000000000000000000000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF00CC99
      9900FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF006633
      3300FFFFFF0000000000000000000000000000000000000000009165D7E1629A
      FFFF6098FFFF639BFEFF71A9FBFF0730ECFF001EE8FF001DE5FF001CE3FF001B
      E0FF0019DEFF0018DBFF0017D9FF0015D6FF1C26D0FA9D5EC4D08E5B90924335
      434404040405000000000000000000000000694A696A8E4012FF4AAD00FF48B0
      00FF48B000FF48B000FF48B000FF48B000FF48B000FF48B000FF48B000FF6D6A
      08FF8D391CFF6C814DFF6C824EFF6C824EFF6C824EFF6C824EFF6C824EFF6C82
      4EFF6F754AFF8D4525FFBA64A2D2100F10110000000000000000FFF8F100FFCF
      4D00FFD66200FFD66300FFD66400FFD76700FFD76900FFD86C00FFD86F00FFD8
      7100FFD56C00FFD16000FFD05F00FFCF5E00FFCD5E00FFCC5E00FFC54500FFF0
      DB00000000000000000000000000000000000000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF00CC99
      9900FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF006633
      3300FFFFFF0000000000000000000000000000000000000000009166D7E1669E
      FFFF649BFFFF629AFFFF81B2FEFF3462F3FF0028EBFF0023E8FF0020E6FF001E
      E3FF001CE0FF001BDDFF0019DBFF0017D8FF0016D6FF0018D1FE3D32CEF4A462
      B8BF7A527A7B302830310202020300000000AE66A6B76E6808FF48B000FF48B0
      00FF48B000FF48B000FF48B000FF48B000FF48B000FF48B000FF48B000FF51A0
      00FF943418FF4AC288FF48D092FF48D092FF48D092FF48D092FF48D092FF48D0
      92FF48D092FF4BC98CFF894E2CFF8C5A8B8E0000000000000000FFF9F300FFCB
      5000FFD66F00FFD77200FFD87400FFD87700FFD97900FFD97C00FFD97E00FFDA
      8100FFDA8300FFD77E00FFD06A00FFCF6800FFCD6700FFCC6700FFC95A00FFD6
      8C00FFFEFD000000000000000000000000000000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF00CC99
      9900FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF006633
      3300FFFFFF0000000000000000000000000000000000000000009B67D4DC69A1
      FFFF679EFFFF659DFFFF6FA8FFFF67A0FBFF315EF5FF204BF4FF1D47F2FF1B45
      F0FF1A43EEFF1941ECFF173FEAFF163CE8FF1439E6FF1337E3FF1134E0FF1532
      DAFE674ED4EDA163A8AC4838484900000000B965A4CF618603FF48B000FF48B0
      00FF48B000FF48B000FF48B000FF48B000FF48B000FF48B000FF48B000FF48B0
      00FF963316FF52B273FF48D092FF48D092FF48D092FF48D092FF48D092FF48D0
      92FF48D092FF48D092FF63955DFFB965A4CF0000000000000000FFF6E900FFC4
      4700FFD97F00FFD98100FFDA8400FFDA8600FFDB8900FFDC8B00FFDC8D00FFDC
      8F00FFDC9200FFDC9400FFD98D00FFCF7200FFCE7000FFCD7000FFCC7000FFCD
      7900FFFCFB000000000000000000000000000000000000000000000000006633
      3300663333006633330066333300663333006633330066333300663333006633
      3300663333006633330066333300663333006633330066333300663333006633
      3300FFFFFF000000000000000000000000000000000000000000A46CCDD36BA3
      FFFF69A1FFFF679FFFFF71AAFFFF69A3FFFF3B6CFEFF2D5DFEFF2C5BFDFF2D5D
      FDFF2D5DFCFF2F5EFCFF305EFBFF315FFAFF315EF9FF325EF8FF325EF5FF355C
      F0FE6557DBF0A564B1B64E3C4E4F00000000B965A4CF638203FF48B000FF48B0
      00FF48B000FF48B000FF48B000FF48B000FF48B000FF48B000FF48B000FF48B0
      00FF963216FF51B676FF48D092FF48D092FF48D092FF48D092FF48D092FF48D0
      92FF48D092FF48D092FF659159FFBA66A5CE00000000FFFEFD00FFDDA000FFC8
      6300FFDA8E00FFDB9000FFDC9200FFDD9500FFDD9700FFDE9900FFDE9B00FFDE
      9D00FFDF9F00FFDFA200FFDFA400FFD99500FFCF7A00FFCE7A00FFC76A00FFE5
      C000000000000000000000000000000000000000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF00CC99
      9900FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF006633
      3300FFFFFF000000000000000000000000000000000000000000A86DC9CE6EA6
      FFFF6CA4FFFF6AA3FFFF86B6FFFF3B6DFFFF1143FFFF1445FFFF1748FFFF1B4C
      FFFF1F50FFFF2354FFFF2858FFFF2C5CFFFF3060FFFF3A66FCFE5B62ECF6AA6B
      C3C784578587382E383903030304000000009D619AA172610AFF48B000FF48B0
      00FF48B000FF48B000FF48B000FF48B000FF48B000FF48B000FF48B000FF5797
      00FF93381AFF4AC98DFF48D092FF48D092FF48D092FF48D092FF48D092FF48D0
      92FF48D092FF4FC186FF8D4525FF78517879FFFEFD00FDE7C300FDBA5500FFDB
      9800FFDD9C00FFDE9E00FFDFA000FFDFA300FFE0A400FFE0A600FFE1A900FFE1
      AA00FFE2AD00FFE2AF00FFE2B000FFE2B200FED69300FDCB7A00FDD79E00FFFD
      FB00000000000000000000000000000000000000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF00CC99
      9900FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF006633
      3300FFFFFF000000000000000000000000000000000000000000A86DC9CE71AA
      FFFF6FA8FFFF71A9FFFF74ADFFFF1244FFFF0A3CFFFF0E40FFFF1243FFFF1647
      FFFF1B4CFFFF1F50FFFF2454FFFF2858FEFF3C5BF5FB9F68D0D6975F9A9C4C3A
      4C4D070707080000000000000000000000004B3A4B4C923914FF4EA600FF48B0
      00FF48B000FF48B000FF48B000FF48B000FF48B000FF48B000FF48B000FF765A
      0CFF903D1FFF736B42FF736B42FF736B42FF736B42FF736B42FF736B42FF736B
      42FF80613BFF913C1EFFAA64A4B104040405FFEDD200F8B45800FEDBA000FFDF
      A700FFE0A900FFE1AB00FFE2AD00FFE2AF00FFE3B100FFE3B300FFE4B500FFE4
      B600FFE4B800FEE5BA00FEE5BC00FDE5BE00FCE1B800F8B55100FDEFDD000000
      0000000000000000000000000000000000000000000000000000000000006633
      3300FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF00CC99
      9900FFFFFF00FFFFFF00FFFFFF00CC999900FFFFFF00FFFFFF00FFFFFF006633
      3300FFFFFF000000000000000000000000000000000000000000A86DC9CE74AD
      FFFF72ABFFFF85B4FFFF4273FFFF0335FFFF0638FFFF0A3CFFFF0F40FFFF1344
      FFFF1748FFFF1B4CFEFF2A53F8FD8863DBE4A365ADB062476263131213140000
      00000000000000000000000000000000000002020203B267A8BC854F0FFF4BAB
      00FF48B000FF48B000FF48B000FF48B000FF48B000FF48B000FF638204FFAB4A
      55F38D5B8C8F8D5B8C8F8D5B8C8F8D5B8C8F8D5B8C8F8D5B8C8F8D5B8C8F8D5B
      8C8F7D537D7E473747480000000000000000FFE5BF00FDC36400FFE3B500FFE3
      B400FFE3B500FFE4B700FFE4B900FFE5BB00FFE6BC00FEE6BE00FEE6C000FEE7
      C100FDE7C300FDE7C500FCE7C600FCE6C800FCE6CA00F8C98300F6BE7700FFFB
      F700000000000000000000000000000000000000000000000000000000006633
      3300663333006633330066333300663333006633330066333300663333006633
      3300663333006633330066333300663333006633330066333300663333006633
      3300FFFFFF000000000000000000000000000000000000000000A86EC9CE77B0
      FFFF75AFFFFF82B0FFFF0A3DFFFF0031FFFF0234FFFF0638FFFF0A3CFFFF0E40
      FEFF1845FBFE685AE5EDA767BFC37B527B7C1D1A1D1E00000000000000000000
      000000000000000000000000000000000000000000000F0F0F10B866A6CB8948
      10FF599200FF49AF00FF48B000FF48B000FF4FA400FF716309FFA34341F85942
      595A000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFBF700FDD9A100FCC47100FBC8
      7D00FBD09200FCDCAD00FDE7C500FDE7C600FDE8C800FDE8C900FDE8CB00FCE8
      CC00FCE8CE00FCE9CF00FCE9D000FBE9D200FBE9D400F8DEC100F2B66900F1AE
      6000F8DBBF00FFF8F100FFFEFD00000000000000000000000000000000006633
      3300C0C0C000C0C0C000C0C0C00066333300C0C0C000C0C0C000C0C0C0006633
      3300C0C0C000C0C0C000C0C0C00066333300C0C0C000C0C0C000C0C0C0006633
      3300FFFFFF000000000000000000000000000000000000000000A86EC9CE81B3
      FFFF84B4FFFF4A80FFFF002BFFFF002DFFFF0031FFFF0235FEFF0D3CFCFE3F4B
      F1F69D65CED3905C929431293132000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000E0E0E0F8557
      8487AD4F61F0903C13FF874B10FF8C4312FF953416FFB467A8C0312931320000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFE00FFFAF700FFF7
      ED00FCEAD200FBD8A800F7BC6F00FCE9D000FCE9D100FCEAD300FCEAD500FCEA
      D600FCEBD700FBEBD800FBEBDA00FAE7D400EFB47900F4C69700F6D3B000F1B9
      8000EC9F5300E58A3B00E9AD8100FFFAF5000000000000000000000000006633
      3300C0C0C000C0C0C000C0C0C00066333300C0C0C000C0C0C000C0C0C0006633
      3300C0C0C000C0C0C000C0C0C00066333300C0C0C000C0C0C000C0C0C0006633
      3300FFFFFF000000000000000000000000000000000000000000A96FC9CE84B6
      FFFF84B1FFFF0D3FFFFF002BFFFF002BFFFF0232FDFE2740F5F9875DD8DFA163
      ABAE473747480404040500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000E0E0E0F4A394A4B5F455F605942595A1D1A1D1E00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFD00F6C79100FAE5CD00FCECDB00FCECDC00FCEDDD00FCED
      DE00FBEDDF00FBEEE100FBEEE200EFC09600FBE3CB00FFFEFD0000000000FFFB
      F700F0C6A300EAB99700D8753700F2D1BA000000000000000000000000006633
      3300C0C0C000C0C0C000C0C0C00066333300C0C0C000C0C0C000C0C0C0006633
      3300C0C0C000C0C0C000C0C0C00066333300C0C0C000C0C0C000C0C0C0006633
      3300FFFFFF000000000000000000000000000000000000000000A96FC9CE88B9
      FFFF5085FFFF002BFFFF002AFEFF0E35FAFC6650E5EAA465BDC1604660610707
      0708000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9DDC100F6D5B700FCEFE300FCEFE400FCF0E500F6DC
      C600EEBC9200F6DCC700FCF1E900F0C6A300FAE8D70000000000000000000000
      0000FFFBF900EEC2A500E0997200FBEFE5000000000000000000000000006633
      3300663333006633330066333300663333006633330066333300663333006633
      3300663333006633330066333300663333006633330066333300663333006633
      3300000000000000000000000000000000000000000000000000AA6FC9CE82B2
      FFFF1243FEFF002EFDFE4144F0F3945ED1D77C537C7D14131415000000000000
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
      0000000000000000000000000000000000000000000000000000AA6FC9CE5280
      FDFE283EF6F87355E0E6935D9698231F23240000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000A86DC7CB5753
      EDF1A364B2B53A2F3A3B00000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000000000009A609FA15640
      5657050506060000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000300000000100010000000000400200000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00FF000000000000FFFFFFFF
      00FF000000000000FFFFFFFF00FF000000000000FFFFFFFF00FF000000000000
      FFFFFFFF00FF000000000000FFFC07F0000F000000000000FFF003F0000F0000
      00000000FFF001F8003F000000000000800000FE007F000000000000000000F8
      001F000000000000000000F0000F000000000000000000F0000F000000000000
      000000F0000F000000000000000000F0000F000000000000000000F0000F0000
      00000000800000F0000F000000000000FFF001F0000F000000000000FFF803F0
      000F000000000000FFFE0FF0000F000000000000FFFFFFF0000F000000000000
      FFFFFFF0000F000000000000FFFFFFF0000F000000000000FFFFFFF8001F0000
      00000000FFFFFFFE007F000000000000FFFFE1FFFFFFC7FFFFFFFFFFFFFFC1FF
      FFFFC3FFFFFFFFFFFFFFC1FFFFFFC0FFFFFFFFFFFF0383F00007C03FFFFFFFFF
      FC0007E00007C00FFFFFFFFFF0000FE00007C003FFE03FFFC0001FE00007C001
      FFC01FFF80001FE00007C0007F800FFF80001FE00007C0001F000001C0000FE0
      0007C00007000000C0000FE00007C00001000000C00007E00007C00001000000
      C00007E00007C0000100000080000FE00007C0000100000000000FE00007C000
      0700000000001FE00007C0001F00000300000FE00007C0007F800FFF000001E0
      0007C001FFC01FFF800000E00007C003FFF07FFFF80020E00007C00FFFFFFFFF
      FC0070E0000FC03FFFFFFFFFFC0039FFFFFFC0FFFFFFFFFFFC083FFFFFFFC3FF
      FFFFFFFFFE3C3FFFFFFFC7FFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object AgentAction: TActionList [21]
    Images = AgentImageList24
    Left = 584
    Top = 544
    object AgentTestAction: TAction
      Caption = '    Test    '
      Hint = 'Tests the suource and target connection strings'
      ImageIndex = 0
      OnExecute = AgentTestActionExecute
    end
    object AgentResultAction: TAction
      AutoCheck = True
      Caption = 'Result'
      Hint = 'Run current agent'#39's query and display the result in a table'
      ImageIndex = 1
      OnExecute = AgentResultActionExecute
    end
    object AgentRunAction: TAction
      Caption = 'Run'
      Hint = 'Execute the current agent'
      ImageIndex = 2
      OnExecute = AgentRunActionExecute
    end
    object AgentActiveAction: TAction
      AutoCheck = True
      Caption = 'Inactive'
      Hint = 
        'Activate the scheduler that execute active agents at their speci' +
        'fic execution time'
      ImageIndex = 3
      OnExecute = AgentActiveActionExecute
    end
    object AgentCsAdoTestAction: TAction
      Caption = 'Cs ADO Test'
      Hint = 'Connection string ADO test'
      ImageIndex = 5
      OnExecute = AgentCsAdoTestActionExecute
    end
    object AgentCsFdTestAction: TAction
      Caption = 'Cs FD Test'
      Hint = 'Connection string FD test'
      ImageIndex = 5
      OnExecute = AgentCsFdTestActionExecute
    end
  end
  object AgentActiveClientDataSet: TClientDataSet [32]
    Aggregates = <>
    Params = <>
    ProviderName = 'AgentActiveDataSetProvider'
    RemoteServer = MainSoapConnection
    AfterOpen = AgentActiveClientDataSetAfterOpen
    AfterScroll = AgentActiveClientDataSetAfterScroll
    AfterRefresh = AgentActiveClientDataSetAfterRefresh
    Left = 71
    Top = 487
  end
  object AgentActiveDataSource: TDataSource [33]
    DataSet = AgentActiveClientDataSet
    Left = 207
    Top = 487
  end
  object ResultDataSource: TDataSource
    Left = 960
    Top = 488
  end
  object ResultADOQuery: TADOQuery
    Connection = ResultADOConnection
    Parameters = <>
    Left = 856
    Top = 488
  end
  object ResultADOConnection: TADOConnection
    LoginPrompt = False
    Left = 736
    Top = 488
  end
  object ResultFDConnection: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL')
    FetchOptions.AssignedValues = [evMode, evUnidirectional]
    LoginPrompt = False
    Left = 736
    Top = 544
  end
  object ResultFDQuery: TFDQuery
    Connection = ResultFDConnection
    Left = 856
    Top = 544
  end
  object SynEditDataPopup: TPopupMenu
    Left = 480
    Top = 544
    object SynEditDataJsonBaseTemplate: TMenuItem
      Caption = 'Insert JSON Template'
      OnClick = SynEditDataJsonBaseTemplateClick
    end
    object JsonDivPopup: TMenuItem
      Caption = '-'
    end
    object SynEditDataJsonDatasourceBlock: TMenuItem
      Caption = 'Insert JSON <DataSource> block'
      OnClick = SynEditDataJsonDatasourceBlockClick
    end
    object SynEditDataJsonDatatargetBlock: TMenuItem
      Caption = 'Insert JSON <DataTarget> block'
      OnClick = SynEditDataJsonDatatargetBlockClick
    end
    object SynEditDataJsonEtlBlock: TMenuItem
      Caption = 'Insert JSON <Etl> block'
      OnClick = SynEditDataJsonEtlBlockClick
    end
    object SynEditDataJsonTimeframeBlock: TMenuItem
      Caption = 'Insert JSON <TimeFrame> block'
      Enabled = False
      OnClick = SynEditDataJsonTimeframeBlockClick
    end
    object SynEditDataJsonSaveBlock: TMenuItem
      Caption = 'Insert JSON <Save> block'
      Enabled = False
      OnClick = SynEditDataJsonSaveBlockClick
    end
    object SynEditDataJsonEmailBlock: TMenuItem
      Caption = 'Insert JSON <Email> block'
      Enabled = False
      OnClick = SynEditDataJsonEmailBlockClick
    end
    object SynEditDataJsonOptionBlock: TMenuItem
      Caption = 'Insert JSON <Option> block'
      Enabled = False
      OnClick = SynEditDataJsonOptionBlockClick
    end
    object SynEditDataJsonParamsBlock: TMenuItem
      Caption = 'Insert JSON <Params> block'
      Enabled = False
      OnClick = SynEditDataJsonParamsBlockClick
    end
    object SynEditDataJsonRunAtBlock: TMenuItem
      Caption = 'Insert JSON <RunAt> block'
      Enabled = False
      OnClick = SynEditDataJsonRunAtBlockClick
    end
    object JsonDiv2Popup: TMenuItem
      Caption = '-'
    end
    object SynEditDataJsonAdoMsSqlCsPopup: TMenuItem
      Caption = 'Insert ADO Sql Server connection string'
      OnClick = SynEditDataJsonAdoMsSqlCsPopupClick
    end
    object SynEditDataJsonAdoMsMdbCsPopup: TMenuItem
      Caption = 'Insert ADO Access (.mdb) connection string'
      OnClick = SynEditDataJsonAdoMsMdbCsPopupClick
    end
    object SynEditDataJsonAdoMsAccdbCsPopup: TMenuItem
      Caption = 'Insert ADO Access (.accdb) connection string'
      OnClick = SynEditDataJsonAdoMsAccdbCsPopupClick
    end
    object SynEditDataJsonAdoMsXlsCsPopup: TMenuItem
      Caption = 'Insert ADO Excel (.xls) connection string'
      OnClick = SynEditDataJsonAdoMsXlsCsPopupClick
    end
    object SynEditDataJsonAdoMsXlsxCsPopup: TMenuItem
      Caption = 'Insert ADO Excel (.xlsx) connection string'
      OnClick = SynEditDataJsonAdoMsXlsxCsPopupClick
    end
    object JsonDiv3Popup: TMenuItem
      Caption = '-'
    end
    object SynEditDataJsonFdMsSqlCsPopup: TMenuItem
      Caption = 'Insert FD Sql Server connection string'
      OnClick = SynEditDataJsonFdMsSqlCsPopupClick
    end
    object SynEditDataJsonFdOracleCsPopup: TMenuItem
      Caption = 'Insert FD Oracle connection string'
      OnClick = SynEditDataJsonFdOracleCsPopupClick
    end
    object SynEditDataJsonFdMongodbCsPopup: TMenuItem
      Caption = 'Insert FD MongoDb connection string'
      OnClick = SynEditDataJsonFdMongodbCsPopupClick
    end
  end
end
