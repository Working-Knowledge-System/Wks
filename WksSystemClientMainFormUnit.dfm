inherited SystemMainForm: TSystemMainForm
  Caption = 'SystemMainForm'
  TextHeight = 15
  inherited LeftJvNetscapeSplitter: TJvNetscapeSplitter
    ExplicitHeight = 702
  end
  inherited RightJvNetscapeSplitter: TJvNetscapeSplitter
    ExplicitLeft = 939
    ExplicitHeight = 702
  end
  inherited BottomJvNetscapeSplitter: TJvNetscapeSplitter
    ExplicitTop = 785
    ExplicitWidth = 1252
  end
  inherited TopPanel: TPanel
    inherited TopPageControl: TPageControl
      inherited TopTextTabSheet: TTabSheet
        inherited TextToolBar: TToolBar
          Width = 785
          ExplicitWidth = 785
        end
      end
      object SystemTabSheet: TTabSheet
        Caption = 'System'
        ImageIndex = 2
        object SystemToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 582
          Height = 44
          Align = alLeft
          AutoSize = True
          ButtonHeight = 46
          ButtonWidth = 97
          Caption = 'SystemToolBar'
          Images = SystemImageList24
          ShowCaptions = True
          TabOrder = 0
          object SystemTestToolButton: TToolButton
            Left = 0
            Top = 0
            Action = SystemTestAction
          end
          object SystemDbaDefinitionRebuildToolButton: TToolButton
            Left = 97
            Top = 0
            Action = SystemDbaDefinitionRebuildAction
          end
          object SystemDbaCreateDdlToolButton: TToolButton
            Left = 194
            Top = 0
            Action = SystemDbaCreateDdlAction
          end
          object SystemDbaDeleteDdlToolButton: TToolButton
            Left = 291
            Top = 0
            Action = SystemDbaDeleteDdlAction
          end
          object SystemDbaBackupDdlToolButton: TToolButton
            Left = 388
            Top = 0
            Action = SystemDbaBackupDdlAction
          end
          object SystemDbaRestoreDdlToolButton: TToolButton
            Left = 485
            Top = 0
            Action = SystemDbaRestoreDdlAction
          end
        end
      end
      object TopDeployTabSheet: TTabSheet
        Caption = 'Deploy'
        ImageIndex = 6
        object DeployToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 481
          Height = 44
          Align = alLeft
          ButtonHeight = 46
          ButtonWidth = 44
          Caption = 'DeployToolBar'
          Images = DeployImageList
          ShowCaptions = True
          TabOrder = 0
          object DeployClientsToolButton: TToolButton
            Left = 0
            Top = 0
            Action = DeployClientsAction
          end
          object DeployServersToolButton: TToolButton
            Left = 44
            Top = 0
            Action = DeployServersAction
          end
        end
      end
      object TopServiceTabSheet: TTabSheet
        Caption = 'Services'
        ImageIndex = 5
        object TopServiceLabel: TLabel
          Left = 16
          Top = 14
          Width = 37
          Height = 15
          Caption = 'Service'
        end
        object TopServiceComboBox: TComboBox
          Left = 64
          Top = 11
          Width = 145
          Height = 23
          TabOrder = 0
          Text = 'TopServiceComboBox'
          Items.Strings = (
            ''
            'Agent')
        end
        object TopServiceInstallButton: TButton
          Left = 247
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Install'
          TabOrder = 1
          OnClick = TopServiceInstallButtonClick
        end
        object TopServiceUninstallButton: TButton
          Left = 328
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Uninstall'
          TabOrder = 2
          OnClick = TopServiceUninstallButtonClick
        end
        object TopServicePauseButton: TButton
          Left = 632
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Pause'
          TabOrder = 3
        end
        object TopServiceContinueButton: TButton
          Left = 713
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Continue'
          TabOrder = 4
          OnClick = TopServiceContinueButtonClick
        end
        object TopServiceStartButton: TButton
          Left = 440
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Start'
          TabOrder = 5
          OnClick = TopServiceStartButtonClick
        end
        object TopServiceStopButton: TButton
          Left = 521
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Stop'
          TabOrder = 6
          OnClick = TopServiceStopButtonClick
        end
      end
    end
  end
  inherited LeftPanel: TPanel
    inherited LeftPageControl: TPageControl
      inherited ObjectTreeTabSheet: TTabSheet
        inherited ObjectDBNavigator: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited BottomPanel: TPanel
    inherited LogFrame: TLogFrame
      inherited LogPageControl: TPageControl
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
      end
    end
  end
  inherited RightPanel: TPanel
    inherited RightPageControl: TPageControl
      inherited PropertyTabSheet: TTabSheet
        inherited ObjectJvScrollMax: TJvScrollMax
          object SystemJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'System'
            ExpandedHeight = 217
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object SystemObjectIdLabel: TLabel
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
            object SystemValue1Label: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 103
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Value 1'
              ExplicitWidth = 37
            end
            object SystemValue2Label: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 153
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Value 2'
              ExplicitWidth = 37
            end
            object SystemObjectIdDBEdit: TDBEdit
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
              DataSource = SystemDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
            end
            object SystemValue1DBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 124
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldValue1'
              DataSource = SystemDataSource
              TabOrder = 1
            end
            object SystemValue2DBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 174
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldValue2'
              DataSource = SystemDataSource
              TabOrder = 2
            end
            object SystemDBNavigator: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 275
              Height = 25
              DataSource = SystemDataSource
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alTop
              Flat = True
              TabOrder = 3
            end
          end
          object ClientsJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Client'
            ExpandedHeight = 364
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object ClientsObjectLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 103
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Object'
              ExplicitWidth = 35
            end
            object ClientsClientLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 153
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Client'
              ExplicitWidth = 31
            end
            object ClientsOsLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 203
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'OS Bitness'
              ExplicitWidth = 55
            end
            object ClientsImageUrlLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 253
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Image URL'
              ExplicitWidth = 57
            end
            object ClientsStateLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 53
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'State'
              ExplicitWidth = 26
            end
            object ClientsObjectDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 124
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clMoneyGreen
              DataField = 'FldObject'
              DataSource = ClientsDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
            end
            object ClientsDBNavigator: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 275
              Height = 25
              DataSource = ClientsDataSource
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alTop
              Flat = True
              TabOrder = 1
            end
            object ClientsClientDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 174
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clMoneyGreen
              DataField = 'FldClient'
              DataSource = ClientsDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 2
            end
            object ClientsOsDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 224
              Width = 249
              Height = 23
              Hint = 'State'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldOs'
              DataSource = ClientsDataSource
              DropDownCount = 48
              Items.Strings = (
                ''
                'Win32'
                'Win64')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object ClientsImageUrlDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 274
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Color = clMoneyGreen
              DataField = 'FldImageUrl'
              DataSource = ClientsDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 4
            end
            object ClientsDownloadDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 331
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Download'
              DataField = 'FldDownload'
              DataSource = ClientsDataSource
              TabOrder = 5
            end
            object ClientsDeployDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 308
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Deploy'
              DataField = 'FldDeploy'
              DataSource = ClientsDataSource
              TabOrder = 6
            end
            object ClientsStateDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 74
              Width = 249
              Height = 23
              Hint = 'State'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldState'
              DataSource = ClientsDataSource
              DropDownCount = 48
              Items.Strings = (
                ''
                'Active'
                'Inactive')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
            end
          end
        end
      end
    end
  end
  inherited MainPanel: TPanel
    inherited MainPageControl: TPageControl
      object SysLogTabSheet: TTabSheet
        Caption = 'SysLog'
        ImageIndex = 6
        object SysLogPanel: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 521
          Height = 30
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 1
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Caption = 'LogTopPanel'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object SysLogLabel: TLabel
            AlignWithMargins = True
            Left = 415
            Top = 3
            Width = 98
            Height = 24
            Margins.Right = 8
            Align = alRight
            Caption = 'SysLogCountLabel'
            Layout = tlCenter
            ExplicitHeight = 15
          end
          object SystemSyslogStartSpeedButton: TSpeedButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 70
            Height = 24
            Action = SystemSyslogStartAction
            Align = alLeft
            Images = SystemSyslogImageList
            Flat = True
          end
          object SystemSyslogCleanSpeedButton: TSpeedButton
            AlignWithMargins = True
            Left = 79
            Top = 3
            Width = 70
            Height = 24
            Action = SystemSyslogCleanAction
            Align = alLeft
            ExplicitLeft = 76
            ExplicitTop = 0
            ExplicitHeight = 30
          end
        end
        object SystemSyslogRichEdit: TRichEdit
          AlignWithMargins = True
          Left = 3
          Top = 33
          Width = 516
          Height = 522
          Align = alClient
          BorderStyle = bsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Lines.Strings = (
            'SyslogRichEdit')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 1
          OnChange = SystemSyslogRichEditChange
        end
      end
      object DbLogTabSheet: TTabSheet
        Caption = 'DbLog'
        ImageIndex = 4
        object LogTopPanel: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 521
          Height = 30
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 1
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Caption = 'LogTopPanel'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object LogCountLabel: TLabel
            AlignWithMargins = True
            Left = 432
            Top = 3
            Width = 81
            Height = 24
            Margins.Right = 8
            Align = alRight
            Caption = 'LogCountLabel'
            Layout = tlCenter
            ExplicitHeight = 15
          end
          object LogRefreshSpeedButton: TSpeedButton
            AlignWithMargins = True
            Left = 16
            Top = 3
            Width = 53
            Height = 24
            Margins.Left = 16
            Align = alLeft
            Caption = 'Refresh'
            Flat = True
            OnClick = LogRefreshSpeedButtonClick
            ExplicitLeft = 28
            ExplicitTop = 6
            ExplicitHeight = 22
          end
        end
        object LogJvDBUltimGrid: TJvDBUltimGrid
          AlignWithMargins = True
          Left = 3
          Top = 33
          Width = 516
          Height = 522
          Align = alClient
          BorderStyle = bsNone
          DataSource = LogDataSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = [fsBold]
          TitleButtons = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 19
          TitleRowHeight = 19
          SortWith = swClient
        end
      end
      object AuditTabSheet: TTabSheet
        Caption = 'Audit'
        ImageIndex = 5
        object AuditTopPanel: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 521
          Height = 30
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 1
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Caption = 'AuditTopPanel'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object AuditCountLabel: TLabel
            AlignWithMargins = True
            Left = 423
            Top = 3
            Width = 90
            Height = 24
            Margins.Right = 8
            Align = alRight
            Caption = 'AuditCountLabel'
            Layout = tlCenter
            ExplicitHeight = 15
          end
          object AuditRefreshSpeedButton: TSpeedButton
            AlignWithMargins = True
            Left = 16
            Top = 3
            Width = 53
            Height = 24
            Margins.Left = 16
            Align = alLeft
            Caption = 'Refresh'
            Flat = True
            OnClick = AuditRefreshSpeedButtonClick
            ExplicitLeft = 28
            ExplicitTop = 6
            ExplicitHeight = 22
          end
        end
        object AuditJvDBUltimGrid: TJvDBUltimGrid
          AlignWithMargins = True
          Left = 3
          Top = 33
          Width = 516
          Height = 522
          Align = alClient
          BorderStyle = bsNone
          DataSource = AuditDataSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = [fsBold]
          TitleButtons = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 19
          TitleRowHeight = 19
          SortWith = swClient
        end
      end
      object ClientsTabSheet: TTabSheet
        Caption = 'Clients'
        ImageIndex = 7
        object ClientsPanel: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 521
          Height = 30
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 1
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Caption = 'AuditTopPanel'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object ClientsCountLabel: TLabel
            AlignWithMargins = True
            Left = 416
            Top = 3
            Width = 97
            Height = 24
            Margins.Right = 8
            Align = alRight
            Caption = 'ClientsCountLabel'
            Layout = tlCenter
            ExplicitHeight = 15
          end
          object ClientsRefreshSpeedButton: TSpeedButton
            AlignWithMargins = True
            Left = 16
            Top = 3
            Width = 53
            Height = 24
            Margins.Left = 16
            Align = alLeft
            Caption = 'Refresh'
            Flat = True
            OnClick = ClientsRefreshSpeedButtonClick
            ExplicitLeft = 28
            ExplicitTop = 6
            ExplicitHeight = 22
          end
        end
        object ClientsJvDBUltimGrid: TJvDBUltimGrid
          AlignWithMargins = True
          Left = 3
          Top = 33
          Width = 516
          Height = 329
          Align = alClient
          BorderStyle = bsNone
          DataSource = ClientsDataSource
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = [fsBold]
          TitleButtons = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 19
          TitleRowHeight = 19
          SortWith = swClient
        end
        object PageControl1: TPageControl
          Left = 0
          Top = 365
          Width = 522
          Height = 193
          ActivePage = ClientsMessageWhenInactiveTabSheet
          Align = alBottom
          TabOrder = 2
          object ClientsDescriptionTabSheet: TTabSheet
            Caption = 'Description'
            object ClientsDescriptionDBMemo: TDBMemo
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 508
              Height = 157
              Align = alClient
              BorderStyle = bsNone
              DataField = 'FldDescription'
              DataSource = ClientsDataSource
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
          object ClientsOverviewTabSheet: TTabSheet
            Caption = 'Overview'
            ImageIndex = 1
            object ClientsOverviewDBMemo: TDBMemo
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 508
              Height = 157
              Align = alClient
              BorderStyle = bsNone
              DataField = 'FldOverview'
              DataSource = ClientsDataSource
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
          object ClientsNoteTabSheet: TTabSheet
            Caption = 'Note'
            ImageIndex = 2
            object ClientsNoteDBMemo: TDBMemo
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 508
              Height = 157
              Align = alClient
              BorderStyle = bsNone
              DataField = 'FldNote'
              DataSource = ClientsDataSource
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
          object ClientsMessageWhenInactiveTabSheet: TTabSheet
            Caption = 'Message when inactive'
            ImageIndex = 3
            object ClientsMessageWhenInactiveDBMemo: TDBMemo
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 508
              Height = 157
              Align = alClient
              BorderStyle = bsNone
              DataField = 'FldMessageWhenInactive'
              DataSource = ClientsDataSource
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object SystemClientDataSet: TClientDataSet [15]
    Aggregates = <>
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    PacketRecords = 0
    Params = <>
    ProviderName = 'SystemDataSetProvider'
    RemoteServer = MainSoapConnection
    AfterInsert = SystemClientDataSetAfterInsert
    AfterPost = SystemClientDataSetAfterPost
    AfterDelete = SystemClientDataSetAfterDelete
    OnReconcileError = SystemClientDataSetReconcileError
    Left = 72
    Top = 432
  end
  object SystemDataSource: TDataSource [16]
    DataSet = SystemClientDataSet
    Left = 208
    Top = 432
  end
  object SystemImageList24: TImageList [27]
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 360
    Top = 376
    Bitmap = {
      494C010105000800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000003000000001002000000000000048
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000002000000080000000E0000001300000017000000190000
      001B0000001C0000001B0000001A00000017000000130000000E000000090000
      0002000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00060000000E000000160000001E000000250000002A00000030000000340000
      0036000000370000003600000034000000300000002B000000250000001E0000
      00170000000F0000000600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000090000
      00130000001C000000250000002F00000038004250B0A3E8F1FF74CBDEFF00A0
      C4FF009CC0FE000000510000004D0000004700000040000000380000002F0000
      00260000001D0000001300000009000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000050000000F0000
      001A000000250000002F000000390000004377DEEBFF00A2C5FF52D5E6FF00A0
      C4FF4FD4E5FFA3E8F1FF00A0C4FF000000580000004E00000044000000390000
      002F000000250000001B00000010000000060000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000040000000E0000
      0019000000230000002D0000003700A0C4FF52D5E6FF02C2DAFF53D6E6FF07C6
      DDFF54D7E7FF00A0C4FF52D5E6FF2EB4D1FF00A0C4FF00000041000000380000
      002D00000024000000190000000F000000050000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000060000
      001000000019000000220000002B77DEEBFF00ACCCFF09C6DEFF00A1C5FF13CD
      E5FF5ADAEBFF02C2DAFF53D5E6FF02C2DAFF77DEEBFF009DC2FF0000002B0000
      00230000001A0000001000000007000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000080000001000A0C4FF00C1D9FF07BAD6FF64DFF0FF20D5EDFF63E2
      F2FF00A0C4FF53D6E6FF01C0D9FF02C2DAFF52D5E6FF00A0C4FFA1E7F0FF0007
      083B000000090000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000A0C4FF09C7DEFF1BD2EAFF0DB4D4FF2CDDF4FF02A5
      C8FF18D0E8FF00A5C7FF02C2DAFF52D5E6FF00A2C5FF52D5E6FFA3E8F1FF00A0
      C4FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000076DFECFF13C7E1FF2ADCF4FF1DC5E1FF36E4FBFF12B8
      D7FF08B0CFFF04C3DBFF52D5E6FF00A8C9FF52D5E6FF92D8E7FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000081E4F1FF27D8F0FF3CE6FDFF49E8FDFF14B7D6FF2DDE
      F6FF17D0E8FF52D5E6FF00AFCDFFA4E8F1FF00A0C4FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000088E9F6FF38E5FCFF3ED7EFFF58EAFDFF44E7FDFF1CC7
      E3FF13CDE5FF01C2DAFFA3E8F1FF00A0C4FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000005FFE000068FF90EEFAFF4DE9FDFF67ECFEFF3FD1EAFF36DBF3FF26DA
      F1FF0CC9E0FF76DEEBFF00A0C4FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000CAFF0000C3FF1212D4FF000062FF78ECFCFF5CEAFDFF38E5FCFF1ED4
      ECFF77DFECFF009DC1FE00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000009FC3FF000068FF1F1FD8FF3F3FEDFF000068FFA0F1FDFF83EBF9FF86E8
      F4FF000101140000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000140D1
      E2FF14C9E0FF46DEF1FF000063FF5252FCFF4949F0FF2828D5FF000068FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000A0C4FF8BEFFCFF71EDFDFF7CEFFDFF000068FF1919C9FF0202073E0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001E77AEFF0581B1FF2EB4D2FF9FF3FDFF9DF3FDFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000158
      8FFF0D71B0FF0D6EABFF01588FFF00A0C4FFA2F7FDFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000002588DFE509F
      D0FF0E78BAFF368CC1FF00000004000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006EB1DAFF0F7C
      C1FF0F7CC1FF0D6199FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001588FFF0F7CC1FF0F7C
      C1FF6DB0DAFF01588CFE00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000074B4DBFFFDFEFEFF0158
      8FFF76B5DCFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001588FFF1A689CFF74B4
      DBFF01588FFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000163952B70000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000F7F7F700E2E2E200C8C8C800B6B6B600B1B1B000A9A9A800A4A3
      A200A2A2A100AAAAAA00B5B5B500C8C8C800E2E2E200F7F7F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E9E1D8FFD7C8B7FFCAB7A0FFCAB7
      A0FFCAB7A0FFCAB7A0FFCAB7A0FFCAB7A0FFCAB7A0FFCAB7A0FFCAB7A0FFCAB7
      A0FFCAB7A0FFCAB7A0FFCAB7A0FFCAB7A0FF00000000000000000D951BFF000A
      004A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFDFB00FFE2
      9100FFD56900FFDB6E00FFFBF90000000000000000000000000000000000E9E9
      E900B6B6B600ACABAA00C4C3C200D9D8D700D8D7D600C7C6C400B3B3B000A2A1
      9E009A999600A7A7A400C1C0BE00CACAC900B9B9B800ADACAC00B8B8B700E9E9
      E900000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BBA285FF93683BFF926738FF926638FF8D6031FF8D60
      31FF8D6031FF8C5F2EFF8C5F2EFF8C5F2EFF8C5F2EFF8C5F2EFF8C5F2EFF8C5F
      2EFF8C5F2EFF8C5F2EFF8C5F2EFF8C5E2DFF000000000000000035CF67FF008F
      00FF008800FF001A007100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF0CD00FFD9
      5D00FFD54100FFE6A200FFFCFB000000000000000000FDFDFD00C4C4C3008E8D
      8C00A7A6A200D2D1CD00EDEDEC00EDEDED00DFDFDE00CACAC800B5B4B200A2A2
      9F009A999600ADACAA00CECECC00E3E3E200DEDEDD00D0D0CE00BCBBB9009F9F
      9D00C5C5C500FDFDFD0000000000000000000000000000000000000000000000
      0000C2AC93FF8D6030FF8F6333FFAD8F69FFD7C9B8FFEEE8E1FFF1EBE5FFF1EB
      E5FFF1EBE5FFF1EBE5FFF1EBE5FFF1EBE5FFF1EBE5FFF1EBE5FFF1EBE5FFF1EB
      E5FFF1EBE5FFF1EBE5FFF1EBE5FF8C5E2DFF000000000000000037CF66FF0995
      09FF008F00FF008A00FF002B0096000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFC00FFFBF600FFF7ED00FFF8
      EE00FFFAF400FFFDFC00000000000000000000000000FFF7E700FFD95B00FFDC
      6A00FFF1D400FFFEFB00000000000000000000000000D0D0D00091908E009796
      9300AEADA900D9D8D400F6F6F500F5F5F500E4E4E300CDCDCB00B6B5B300A3A2
      9F009B9A9700B2B1AF00D9D9D800F0EFEF00E8E8E700D5D5D300C1C0BE00AFAE
      AC0091908E00D0D0D0000000000000000000000000000000000000000000AE91
      6CFF8E6131FFA58359FFEFE9E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC
      FBFFFFFFFFFFFFFFFFFFE1D6CAFF8C5E2DFF000000000000000039D169FF61E4
      88FF008E00FF008E00FF008D00FF008B00FF004200BC00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFAF700FFF1C400FFE77600FFE24900FFE03D00FFE0
      3D00FFE04A00FFE37700FFF0CB00FFF7EF00FFEFCD00FFDB5B00FFDF7200FFF4
      DE00FFFEFE0000000000000000000000000000000000A5A5A400A1A09E009E9D
      9A00B0AFAB00DDDCD800FBFBFA00F8F8F800E5E5E400CDCDCB00B7B7B400A6A5
      A2009E9E9B00B5B5B300E0E0DF00F6F6F500EEEEED00D8D8D700C2C1BF00AFAE
      AC0093928F00A1A1A00000000000000000000000000000000000B29571FF8F62
      32FFC5AF97FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFE1D6CAFF8C5E2DFF00000000000000003CD46BFF3ED8
      71FF61DA75FF008F00FF008E00FF008D00FF008C00FF008600FF005B00E00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFE00FFF8E600FFE37200FFDE4100FFE45E00FFE56500FFE46200FFE2
      6200FFE26500FFE16200FFDB4B00FFD84B00FFDB5600FFD95900FFEAB600FFFE
      FD000000000000000000000000000000000000000000B0B0AE00ABAAA900A3A2
      9F00AFAEAA00D5D4D100D7D7D600BFBEBD00A8A8A7009F9E9D009E9D9B009D9D
      9B009F9F9D00A6A6A400B5B5B400CACACA00D9D8D800D4D4D300C0C0BE00AFAE
      AC0093928F00AAA9A800000000000000000000000000C9B69FFF8D6030FFC4AE
      95FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F5F2FFFFFF
      FFFFFFFFFFFFFFFFFFFFE1D6CAFF8C5E2DFF00000000000000003CD56DFF3FD9
      72FF6BED95FF009000FF008E00FF008E00FF008C00FF008B00FF008B00FF006A
      00EF0000000C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFEFD00FFF9
      F200FFECB800FFD84700FFDD5600FFE05500FFDC3E00FFDA3E00FFD93E00FFD8
      3D00FFD73C00FFD53C00FFD84E00FFD95800FFD24300FFD25000FFFBF5000000
      00000000000000000000000000000000000000000000C2C2C100AAAAA800A3A3
      A1009C9B9900A09F9D00B8B7B600CCCCCB00D2D1D000C6C6C400B3B2B000A2A1
      9E0099999600A6A6A300BCBBB900C2C2C000B7B6B500AEAEAC00AFAFAE00ADAD
      AB0091908D00BCBCBA000000000000000000000000008F6333FFA5845AFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA482
      58FF8C5E2DFF8C5E2DFF8C5E2DFF8C5E2DFF00000000000000003ED76DFF41DB
      74FF40DB74FF18A71FFF008F00FF008F00FF008D00FF008C00FF008B00FF008A
      00FF008900FF007100F900000003000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFEFB00FFE69B00FFCB
      4300FFCF4200FFDB5F00FFDB4C00FFDA4700FFD94700FFD84600FFD74600FFD6
      4600FFD54500FFD44500FFD24400FFD04300FFCF4300FFD66C00FFFCF9000000
      00000000000000000000000000000000000000000000BFBEBD00939291008684
      8200A3A29E00D1D0CC00ECECEB00ECECEB00DEDEDD00CAC9C800B5B4B100A2A2
      9F009A999600ACABA900CDCCCB00E1E1E000DDDCDB00CFCFCD00BAB9B700A1A0
      9E0092929000BBBBBA000000000000000000BDA488FF8F6333FFF0EAE3FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8DF
      D6FF8D6130FFAB8D66FFE1D6CAFFE1D6CAFF000000000000000040D970FF44DE
      77FF43DD76FF80FEA7FF009000FF008F00FF008E00FF008D00FF008C00FF008B
      00FF008A00FF008900FF008600FF004A01C90001001D00000000000000000000
      00000000000000000000000000000000000000000000FFFDFB00FFDB7400FFDA
      6600FFDA5A00FFD85100FFD85100FFD85100FFD75000FFD64F00FFD64F00FFD5
      4E00FFD44E00FFD24D00FFD14D00FFCF4C00FFCE4B00FFCB4800FFF5E4000000
      00000000000000000000000000000000000000000000BBBBBA00878684009695
      9200ADACA900D9D8D300F5F5F400F4F4F400E4E3E300CDCCCB00B6B5B300A3A2
      9F009B9A9700B1B0AE00D8D8D700EEEEEE00E7E7E600D4D4D300C1C0BE00AFAE
      AC00908F8C00BDBDBB000000000000000000946A3DFFAD8F69FFFFFFFFFFFDFC
      FCFFFDFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFCFFFEFE
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAD8F69FF926739FF0000000000000000000000000000000041DA72FF45DF
      78FF44DE77FF60EE8DFF039405FF009000FF008F00FF008D00FF008D00FF008B
      00FF008A00FF008A00FF008900FF008900FF007D00FF00060035000000000000
      0000000000000000000000000000000000000000000000000000FFECC000FFD4
      5000FFD75A00FFD75A00FFD75A00FFD75A00FFD75A00FFD65C00FFD65D00FFD4
      5A00FFD25600FFD15600FFD05500FFCF5500FFCD5400FFCE5600FFD68000FFFD
      FB000000000000000000000000000000000000000000BDBDBC009F9E9C009D9C
      9900B0AFAB00DDDCD800FAFAFA00F7F7F700E4E4E300CBCAC900B2B2AF009F9F
      9C0099989500B2B2AF00DEDEDD00F5F5F400EDEDED00D8D8D600C2C1BF00AFAE
      AC0093928F00BBBBB9000000000000000000926738FFD6C7B5FFFFFFFFFFFFFF
      FFFF8C5E2DFF8C5E2DFF926739FF8C5E2DFFFFFFFFFFFFFFFFFF8C5E2DFF8C5E
      2DFF926739FF8C5E2DFFFFFFFFFFFFFFFFFF8C5E2DFF8D6030FF8C5E2DFFFFFF
      FFFFD8CAB9FF926738FFE9E1D8FF00000000000000000000000043DC73FF47E1
      7AFF46E079FF45DF78FF5DF38CFF009100FF009000FF008E00FF008E00FF008C
      00FF008B00FF008A00FF008900FF008800FF008700FF008600FF006B01F00015
      0166000000000000000000000000000000000000000000000000FFF8F100FFCF
      4D00FFD66200FFD66300FFD66400FFD76700FFD76900FFD86C00FFD86F00FFD8
      7100FFD56C00FFD16000FFD05F00FFCF5E00FFCD5E00FFCC5E00FFC54500FFF0
      DB000000000000000000000000000000000000000000C2C1C000AAAAA800A2A1
      9E00AEADA900D3D2CE00D7D7D600BEBEBD00A4A4A300949493008E8D8C008D8C
      8B0090908F009A999800ADADAD00C6C6C600D4D4D400D0D0CF00BFBFBD00AFAE
      AB0093928F00BCBBBA000000000000000000926638FFECE5DEFFFFFFFFFFFFFF
      FFFF8C5E2DFFFFFFFFFFFFFFFFFF8C5E2DFF8C5E2DFFFFFFFFFF8C5E2DFFFFFF
      FFFFFFFFFFFF8C5E2DFF8C5E2DFFFFFFFFFF8C5E2DFFFFFFFFFFFFFFFFFFFFFF
      FFFFEEE8E1FF926638FFD7C8B7FF00000000000000000000000046DE75FF49E3
      7CFF48E27BFF47E17AFF68FE9AFF33C84EFF019303FF008F00FF008E00FF008C
      00FF008C00FF008B00FF008A00FF008900FF008800FF008700FF008600FF0086
      00FF007500FC0001001900000000000000000000000000000000FFF9F300FFCB
      5000FFD66F00FFD77200FFD87400FFD87700FFD97900FFD97C00FFD97E00FFDA
      8100FFDA8300FFD77E00FFD06A00FFCF6800FFCD6700FFCC6700FFC95A00FFD6
      8C00FFFEFD0000000000000000000000000000000000C2C2C100AAAAA8009D9C
      9A00949391008E8E8C00A4A3A200B9B8B700C3C2C100BFBEBD00B1B1AE00A2A1
      9E0098979400A1A19E00B0B0AE00B2B2B000A6A5A4009C9C9B00A4A4A300A7A6
      A40091908D00BCBCBA0000000000000000008D6031FFF9F7F4FFFFFFFFFFFFFF
      FFFF8C5E2DFFFFFFFFFFFFFFFFFFFFFFFFFF8C5E2DFFFFFFFFFF8C5E2DFFFFFF
      FFFFFFFFFFFFFFFFFFFF8C5E2DFFFFFFFFFF8C5E2DFFFFFFFFFFFFFFFFFFFFFF
      FFFFFAF8F6FF8D6031FFCAB7A0FF00000000000000000000000047E077FF4BE5
      7EFF4AE47DFF48E27BFF5EF691FF5DF792FF4AE47EFF43DD76FF40DA73FF3DD7
      6FFF3BD46BFF38D269FF35CD63FF31C95CFF2BC153FF22B442FF19A830FF119E
      22FF028904FF007C00FE003D02B6000000000000000000000000FFF6E900FFC4
      4700FFD97F00FFD98100FFDA8400FFDA8600FFDB8900FFDC8B00FFDC8D00FFDC
      8F00FFDC9200FFDC9400FFD98D00FFCF7200FFCE7000FFCD7000FFCC7000FFCD
      7900FFFCFB0000000000000000000000000000000000BEBEBD008F8E8D007C7B
      790099989500D0CFCB00EBEAE900EBEBEA00DDDDDC00CAC9C700B4B4B100A2A2
      9E009A999600ABABA800CBCBC900DFDFDE00DBDBDA00CFCECC00AFAFAD009292
      900089888600BBBAB90000000000000000008D6031FFF9F7F4FFFFFFFFFFFFFF
      FFFF8C5E2DFFFFFFFFFFFFFFFFFFFFFFFFFF8C5E2DFFFFFFFFFF8C5E2DFFFFFF
      FFFFFFFFFFFFFFFFFFFF8C5E2DFFFFFFFFFF8C5E2DFFFFFFFFFFFFFFFFFFFFFF
      FFFFFAF8F6FF8D6031FFCAB7A0FF00000000000000000000000049E278FF4CE6
      80FF4BE57EFF4AE47DFF6BFE9BFF38D25AFF0FA921FF12AC26FF13AD2AFF17B1
      30FF18B234FF1AB437FF1CB63BFF1FB940FF20BA43FF22BC47FF25BF4CFF27C1
      50FF17A231FD000B004E000000000000000000000000FFFEFD00FFDDA000FFC8
      6300FFDA8E00FFDB9000FFDC9200FFDD9500FFDD9700FFDE9900FFDE9B00FFDE
      9D00FFDF9F00FFDFA200FFDFA400FFD99500FFCF7A00FFCE7A00FFC76A00FFE5
      C0000000000000000000000000000000000000000000B8B8B7007E7D7B009494
      9100ADACA800D8D7D300F4F4F300F3F3F300E3E3E200CDCCCA00B6B5B200A3A2
      9F009B9A9700B1B0AE00D7D7D500EDEDEC00E6E6E500D4D3D200C1C0BE00AFAE
      AC0089888600B9B9B8000000000000000000926638FFECE5DEFFFFFFFFFFFFFF
      FFFF8C5E2DFFFFFFFFFFFFFFFFFFFFFFFFFF8C5E2DFFFFFFFFFF8C5E2DFFFFFF
      FFFFFFFFFFFFFFFFFFFF8C5E2DFFFFFFFFFF8C5E2DFFFFFFFFFFFFFFFFFFFFFF
      FFFFEEE8E1FF926638FFD7C8B7FF0000000000000000000000004CE47BFF4FE9
      83FF4EE882FF4DE680FF61F48DFF0EA81FFF11AB24FF14AE29FF15AF2CFF17B1
      31FF19B334FF1BB538FF1DB73CFF1FB941FF20BA44FF23BD48FF0E901CFC002F
      00A100000000000000000000000000000000FFFEFD00FDE7C300FDBA5500FFDB
      9800FFDD9C00FFDE9E00FFDFA000FFDFA300FFE0A400FFE0A600FFE1A900FFE1
      AA00FFE2AD00FFE2AF00FFE2B000FFE2B200FED69300FDCB7A00FDD79E00FFFD
      FB000000000000000000000000000000000000000000BBBBBA009D9C9B009C9B
      9900AFAFAB00DDDCD700FAFAFA00F8F8F800E7E6E600CFCECC00B6B6B300A3A2
      9F009C9B9800B5B4B200E0E0DF00F5F5F500EDEDEC00D8D7D600C2C1BF00AFAE
      AC0093928F00BAB9B8000000000000000000926738FFD4C4B2FFFFFFFFFFFFFF
      FFFF8C5E2DFFFFFFFFFFFFFFFFFF8C5E2DFF8C5E2DFFFFFFFFFF8C5E2DFFFFFF
      FFFFFFFFFFFF966B3FFF8C5E2DFFFFFFFFFF8C5E2DFFFFFFFFFFFFFFFFFFFFFF
      FFFFD7C9B8FF926738FFE9E1D8FF0000000000000000000000004CE57CFF50EA
      84FF4FE983FF55EB88FF1BB42FFF0FA920FF11AB25FF14AE2AFF15AF2DFF18B2
      32FF19B335FF1BB539FF1DB73DFF1FB941FF21BC46FF0A8714F70000000E0000
      000000000000000000000000000000000000FFEDD200F8B45800FEDBA000FFDF
      A700FFE0A900FFE1AB00FFE2AD00FFE2AF00FFE3B100FFE3B300FFE4B500FFE4
      B600FFE4B800FEE5BA00FEE5BC00FDE5BE00FCE1B800F8B55100FDEFDD000000
      00000000000000000000000000000000000000000000C2C2C100A9A9A700A2A1
      9E00B0AFAB00DEDDD900F7F6F600EAEAEA00DCDBDA00D2D1D000CFCFCD00CFCF
      CD00D0CFCE00D6D6D500E6E6E500F3F3F300F0F0EF00DADAD800C2C1BF00AFAE
      AC0093928F00BDBCBB000000000000000000966B3FFFAC8D67FFFFFFFFFFFFFF
      FFFF8C5E2DFF8C5E2DFF8C5E2DFF8C5E2DFFFCFBFAFFFFFFFFFF8C5E2DFF8C5E
      2DFF8C5E2DFF8C5E2DFFFCFBFAFFFFFFFFFF8C5E2DFFFFFFFFFFFFFFFFFFFFFF
      FFFFAD8F69FF93683BFF000000000000000000000000000000004FE77EFF52EC
      86FF51EB85FF8CFEACFF0EA81EFF0FA921FF12AC26FF14AE2BFF15AF2EFF18B2
      32FF1AB436FF1BB539FF1DB73EFF017404F10006003A00000000000000000000
      000000000000000000000000000000000000FFE5BF00FDC36400FFE3B500FFE3
      B400FFE3B500FFE4B700FFE4B900FFE5BB00FFE6BC00FEE6BE00FEE6C000FEE7
      C100FDE7C300FDE7C500FCE7C600FCE6C800FCE6CA00F8C98300F6BE7700FFFB
      F7000000000000000000000000000000000000000000C3C2C100ADACAB00A9A8
      A600BFBFBC00CCCBC800C7C5C200C9C7C400CCCAC700CFCECB00D4D2CF00D7D6
      D300DAD8D600DDDCD900DFDEDC00E1E0DF00E4E3E100E5E4E300D3D3D200B4B3
      B10093928F00BCBCBA000000000000000000C1AB91FF8F6333FFEFE9E2FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE6
      DEFF8F6232FFBBA285FF0000000000000000000000000000000051EA81FF55EF
      89FF54EE88FF22B633FF0EA81FFF10AA22FF12AC27FF15AF2BFF16B02FFF18B2
      33FF1BB539FF078E0FFE00010016000000000000000000000000000000000000
      000000000000000000000000000000000000FFFBF700FDD9A100FCC47100FBC8
      7D00FBD09200FCDCAD00FDE7C500FDE7C600FDE8C800FDE8C900FDE8CB00FCE8
      CC00FCE8CE00FCE9CF00FCE9D000FBE9D200FBE9D400F8DEC100F2B66900F1AE
      6000F8DBBF00FFF8F100FFFEFD000000000000000000C1C1C000ADADAB00B7B5
      B200B4B3AF00B9B7B300BEBCB900C4C2BE00C9C7C400CECCC900D1D0CD00D5D4
      D100D8D7D500DBD9D700DDDBD900DEDDDA00DFDEDC00E0DFDD00E1E0DE00D7D6
      D500A3A29F00BDBDBB000000000000000000000000008F6333FFA48258FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA483
      59FF8D6030FF000000000000000000000000000000000000000052EB82FF56F0
      8AFF69F496FF0BA619FF0EA81FFF10AA22FF12AC27FF15AF2CFF16B02FFF17B0
      30FF005200CA0000000D00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFE00FFFAF700FFF7
      ED00FCEAD200FBD8A800F7BC6F00FCE9D000FCE9D100FCEAD300FCEAD500FCEA
      D600FCEBD700FBEBD800FBEBDA00FAE7D400EFB47900F4C69700F6D3B000F1B9
      8000EC9F5300E58A3B00E9AD8100FFFAF50000000000C7C7C500A7A5A100AAA8
      A400B0AEA900B5B3AF00BBB9B500C0BEBB00C6C4C100CBC9C600CFCECB00D3D1
      CF00D6D5D200D8D6D400D9D8D600DBD9D700DCDBD800DDDCDA00DEDDDB00DFDE
      DC00D0CFCD00C8C7C600000000000000000000000000C9B69FFF8D6030FFC3AD
      93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5AF97FF8E61
      31FFC4AE95FF000000000000000000000000000000000000000054EE85FF58F2
      8CFF72E084FF0CA61BFF0FA920FF10AA23FF13AD28FF13AC29FF008002F50000
      0003000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFD00F6C79100FAE5CD00FCECDB00FCECDC00FCEDDD00FCED
      DE00FBEDDF00FBEEE100FBEEE200EFC09600FBE3CB00FFFEFD0000000000FFFB
      F700F0C6A300EAB99700D8753700F2D1BA0000000000D0CFCE00A19E9A00A7A5
      A100ADAAA600B2B0AC00B8B6B200BDBBB800C3C1BD00C8C6C300CDCBC800D0CF
      CC00D3D1CE00D4D3D000D6D5D200D7D6D300D8D7D500DAD8D600DBDAD700DCDB
      D800DDDCDA00D3D3D20000000000000000000000000000000000B29571FF8E61
      31FFC3AD93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4AE95FF8F6232FFAE91
      6CFF00000000000000000000000000000000000000000000000056EF86FF76F8
      9EFF09A416FF0DA71CFF0FA921FF11AB25FF016702D900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9DDC100F6D5B700FCEFE300FCEFE400FCF0E500F6DC
      C600EEBC9200F6DCC700FCF1E900F0C6A300FAE8D70000000000000000000000
      0000FFFBF900EEC2A500E0997200FBEFE50000000000E6E6E500A19F9B00A5A3
      9E00ABA8A400B0AEA900B5B3AF00BBB8B400BFBDBA00C4C2BF00C8C7C400CCCA
      C700CFCDCA00D0CFCC00D2D0CE00D3D2CF00D5D3D000D6D5D200D7D6D400D9D7
      D600CECDCA00E5E5E4000000000000000000000000000000000000000000B295
      71FF8D6030FFA48258FFEFE9E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE9E2FFA48359FF8D6030FFB29571FF0000
      000000000000000000000000000000000000000000000000000057F187FF51CA
      5CFF0BA518FF0DA71DFF089F15FF005800C90000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCF0E300ECB48500FBF2EA00F5DDCA00E9AB7A00F0BC
      8F00F8DEC700EFBE9500F0CBB100FAECE200EDBB9600FFFEFD00000000000000
      000000000000FFFEFD00FFFEFC00000000000000000000000000D8D8D700A8A6
      A200A8A6A100AEABA700B3B0AC00B8B5B100BCBAB600C0BEBB00C4C2BE00C6C5
      C100C9C7C400CCCAC700CECCC900CFCECB00D0CFCC00D2D1CE00D4D2D000CAC9
      C600D8D8D6000000000000000000000000000000000000000000000000000000
      0000C9B69FFF8F6333FF8F6333FFAC8D67FFD4C4B2FFECE5DEFFF9F7F4FFF9F7
      F4FFECE5DEFFD5C5B4FFAD8E68FF8F6232FF8F6333FFC9B69FFF000000000000
      00000000000000000000000000000000000000000000000000005AF48CFF0AA4
      16FF09A315FF0038009C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFCF900E9AB7C00E3955C00ECB58900FCEFE300FFFE
      FD0000000000FFFEFB00F6D6BF00E9B79C00DC8F6400FFFBF700000000000000
      000000000000000000000000000000000000000000000000000000000000F1F1
      F000CECDCB00B6B4B000B1AEAA00B4B2AE00B9B7B300BCBAB600BEBCB900C1BF
      BB00C4C2BE00C6C4C100C9C7C400CBC9C600CBCAC700C8C7C500D1D0CE00ECEC
      EB00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C1AB91FF966B3FFF926738FF926638FF8D6031FF8D60
      31FF926638FF926738FF946A3DFFBDA488FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000002EC747FF0034
      0098000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFDFB00FFFCF900FFFEFD00000000000000
      00000000000000000000FFFEFD00F5D9C700E9B89E00FFFDFB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F9F9F900EFEFEE00E1E0DF00D3D2D000CBCAC700C5C4C100C3C2
      C000C6C5C300CDCCCA00D6D6D400E1E0DF00EAEAE900F8F8F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EBE3DBFFD7C8B7FFCAB7A0FFCAB7
      A0FFD7C8B7FFEBE3DBFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000A00410000
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
      00000000000000000000000000000000FFFFE1F8003FFF0000000000FFFFC1E0
      000FFC0000000000FFFFC1800003F00000000000FF0383800003E00000000000
      FC0007800003C00000000000F0000F800003800000000000C0001F8000038000
      0000000080001F80000300000000000080001F800003000003000000C0000F80
      0003000001000000C0000F800003000001000000C00007800003000001000000
      C0000780000300000100000080000F80000300000100000000000F8000030000
      0100000000001F80000300000300000000000F80000300000300000000000180
      0003800007000000800000800003800007000000F80020800003C0000F000000
      FC0070800003E0001F000000FC0039C00007F0003F000000FC083FE0000FFC00
      FF000000FE3C3FF8003FFF03FF00000000000000000000000000000000000000
      000000000000}
  end
  object SystemAction: TActionList [28]
    Images = SystemImageList24
    Left = 568
    Top = 376
    object SystemTestAction: TAction
      Caption = '    Test    '
      ImageIndex = 0
      OnExecute = SystemTestActionExecute
    end
    object SystemDbaDefinitionRebuildAction: TAction
      Caption = 'Dba Defs Rebuild'
      Hint = 'Rebuild the definitions of all databases'
      ImageIndex = 1
      OnExecute = SystemDbaDefinitionRebuildActionExecute
    end
    object SystemDbaCreateDdlAction: TAction
      Caption = 'Dba Create DDL'
      Hint = 'Export the DDL script to create all databases'
      ImageIndex = 2
      OnExecute = SystemDbaCreateDdlActionExecute
    end
    object SystemDbaDeleteDdlAction: TAction
      Caption = 'Dba Delete DDL'
      ImageIndex = 2
      OnExecute = SystemDbaDeleteDdlActionExecute
    end
    object SystemDbaBackupDdlAction: TAction
      Caption = 'Dba Backup DDL'
      ImageIndex = 2
      OnExecute = SystemDbaBackupDdlActionExecute
    end
    object SystemDbaRestoreDdlAction: TAction
      Caption = 'Dba Restore DDL'
      ImageIndex = 2
      OnExecute = SystemDbaRestoreDdlActionExecute
    end
  end
  object LogClientDataSet: TClientDataSet [29]
    Aggregates = <>
    Params = <>
    ProviderName = 'LogDataSetProvider'
    ReadOnly = True
    RemoteServer = MainSoapConnection
    AfterRefresh = LogClientDataSetAfterRefresh
    Left = 72
    Top = 488
  end
  object LogDataSource: TDataSource [30]
    DataSet = LogClientDataSet
    Left = 208
    Top = 488
  end
  object AuditDataSource: TDataSource [31]
    DataSet = AuditClientDataSet
    Left = 208
    Top = 544
  end
  object AuditClientDataSet: TClientDataSet [32]
    Aggregates = <>
    Params = <>
    ProviderName = 'AuditDataSetProvider'
    ReadOnly = True
    RemoteServer = MainSoapConnection
    AfterRefresh = AuditClientDataSetAfterRefresh
    Left = 72
    Top = 544
  end
  object SystemSyslogIdSyslogServer: TIdSyslogServer [33]
    Bindings = <>
    ThreadedEvent = True
    OnSyslog = SystemSyslogIdSyslogServerSyslog
    Left = 776
    Top = 432
  end
  object SystemSyslogImageList: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 360
    Top = 432
    Bitmap = {
      494C010102000800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      00000000000000000000000000000000000000000000000000000D951BFF000A
      004A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000002000000080000000E0000001300000017000000190000
      001B0000001C0000001B0000001A00000017000000130000000E000000090000
      0002000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000035CF67FF008F
      00FF008800FF001A007100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00060000000E000000160000001E000000250000002A00000030000000340000
      0036000000370000003600000034000000300000002B000000250000001E0000
      00170000000F0000000600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000037CF66FF0995
      09FF008F00FF008A00FF002B0096000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000090000
      00130000001C000000250000002F00000038004250B0A3E8F1FF74CBDEFF00A0
      C4FF009CC0FE000000510000004D0000004700000040000000380000002F0000
      00260000001D0000001300000009000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000039D169FF61E4
      88FF008E00FF008E00FF008D00FF008B00FF004200BC00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000050000000F0000
      001A000000250000002F000000390000004377DEEBFF00A2C5FF52D5E6FF00A0
      C4FF4FD4E5FFA3E8F1FF00A0C4FF000000580000004E00000044000000390000
      002F000000250000001B00000010000000060000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003CD46BFF3ED8
      71FF61DA75FF008F00FF008E00FF008D00FF008C00FF008600FF005B00E00000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000040000000E0000
      0019000000230000002D0000003700A0C4FF52D5E6FF02C2DAFF53D6E6FF07C6
      DDFF54D7E7FF00A0C4FF52D5E6FF2EB4D1FF00A0C4FF00000041000000380000
      002D00000024000000190000000F000000050000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003CD56DFF3FD9
      72FF6BED95FF009000FF008E00FF008E00FF008C00FF008B00FF008B00FF006A
      00EF0000000C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000060000
      001000000019000000220000002B77DEEBFF00ACCCFF09C6DEFF00A1C5FF13CD
      E5FF5ADAEBFF02C2DAFF53D5E6FF02C2DAFF77DEEBFF009DC2FF0000002B0000
      00230000001A0000001000000007000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003ED76DFF41DB
      74FF40DB74FF18A71FFF008F00FF008F00FF008D00FF008C00FF008B00FF008A
      00FF008900FF007100F900000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000080000001000A0C4FF00C1D9FF07BAD6FF64DFF0FF20D5EDFF63E2
      F2FF00A0C4FF53D6E6FF01C0D9FF02C2DAFF52D5E6FF00A0C4FFA1E7F0FF0007
      083B000000090000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000040D970FF44DE
      77FF43DD76FF80FEA7FF009000FF008F00FF008E00FF008D00FF008C00FF008B
      00FF008A00FF008900FF008600FF004A01C90001001D00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000A0C4FF09C7DEFF1BD2EAFF0DB4D4FF2CDDF4FF02A5
      C8FF18D0E8FF00A5C7FF02C2DAFF52D5E6FF00A2C5FF52D5E6FFA3E8F1FF00A0
      C4FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000041DA72FF45DF
      78FF44DE77FF60EE8DFF039405FF009000FF008F00FF008D00FF008D00FF008B
      00FF008A00FF008A00FF008900FF008900FF007D00FF00060035000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000076DFECFF13C7E1FF2ADCF4FF1DC5E1FF36E4FBFF12B8
      D7FF08B0CFFF04C3DBFF52D5E6FF00A8C9FF52D5E6FF92D8E7FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000043DC73FF47E1
      7AFF46E079FF45DF78FF5DF38CFF009100FF009000FF008E00FF008E00FF008C
      00FF008B00FF008A00FF008900FF008800FF008700FF008600FF006B01F00015
      0166000000000000000000000000000000000000000000000000000000000000
      0000000000000000000081E4F1FF27D8F0FF3CE6FDFF49E8FDFF14B7D6FF2DDE
      F6FF17D0E8FF52D5E6FF00AFCDFFA4E8F1FF00A0C4FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000046DE75FF49E3
      7CFF48E27BFF47E17AFF68FE9AFF33C84EFF019303FF008F00FF008E00FF008C
      00FF008C00FF008B00FF008A00FF008900FF008800FF008700FF008600FF0086
      00FF007500FC0001001900000000000000000000000000000000000000000000
      0000000000000000000088E9F6FF38E5FCFF3ED7EFFF58EAFDFF44E7FDFF1CC7
      E3FF13CDE5FF01C2DAFFA3E8F1FF00A0C4FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000047E077FF4BE5
      7EFF4AE47DFF48E27BFF5EF691FF5DF792FF4AE47EFF43DD76FF40DA73FF3DD7
      6FFF3BD46BFF38D269FF35CD63FF31C95CFF2BC153FF22B442FF19A830FF119E
      22FF028904FF007C00FE003D02B6000000000000000000000000000000000000
      000000005FFE000068FF90EEFAFF4DE9FDFF67ECFEFF3FD1EAFF36DBF3FF26DA
      F1FF0CC9E0FF76DEEBFF00A0C4FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000049E278FF4CE6
      80FF4BE57EFF4AE47DFF6BFE9BFF38D25AFF0FA921FF12AC26FF13AD2AFF17B1
      30FF18B234FF1AB437FF1CB63BFF1FB940FF20BA43FF22BC47FF25BF4CFF27C1
      50FF17A231FD000B004E00000000000000000000000000000000000000000000
      00000000CAFF0000C3FF1212D4FF000062FF78ECFCFF5CEAFDFF38E5FCFF1ED4
      ECFF77DFECFF009DC1FE00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004CE47BFF4FE9
      83FF4EE882FF4DE680FF61F48DFF0EA81FFF11AB24FF14AE29FF15AF2CFF17B1
      31FF19B334FF1BB538FF1DB73CFF1FB941FF20BA44FF23BD48FF0E901CFC002F
      00A1000000000000000000000000000000000000000000000000000000000000
      0000009FC3FF000068FF1F1FD8FF3F3FEDFF000068FFA0F1FDFF83EBF9FF86E8
      F4FF000101140000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004CE57CFF50EA
      84FF4FE983FF55EB88FF1BB42FFF0FA920FF11AB25FF14AE2AFF15AF2DFF18B2
      32FF19B335FF1BB539FF1DB73DFF1FB941FF21BC46FF0A8714F70000000E0000
      00000000000000000000000000000000000000000000000000000000000140D1
      E2FF14C9E0FF46DEF1FF000063FF5252FCFF4949F0FF2828D5FF000068FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004FE77EFF52EC
      86FF51EB85FF8CFEACFF0EA81EFF0FA921FF12AC26FF14AE2BFF15AF2EFF18B2
      32FF1AB436FF1BB539FF1DB73EFF017404F10006003A00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000A0C4FF8BEFFCFF71EDFDFF7CEFFDFF000068FF1919C9FF0202073E0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000051EA81FF55EF
      89FF54EE88FF22B633FF0EA81FFF10AA22FF12AC27FF15AF2BFF16B02FFF18B2
      33FF1BB539FF078E0FFE00010016000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001E77AEFF0581B1FF2EB4D2FF9FF3FDFF9DF3FDFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000052EB82FF56F0
      8AFF69F496FF0BA619FF0EA81FFF10AA22FF12AC27FF15AF2CFF16B02FFF17B0
      30FF005200CA0000000D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000158
      8FFF0D71B0FF0D6EABFF01588FFF00A0C4FFA2F7FDFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000054EE85FF58F2
      8CFF72E084FF0CA61BFF0FA920FF10AA23FF13AD28FF13AC29FF008002F50000
      0003000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000002588DFE509F
      D0FF0E78BAFF368CC1FF00000004000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000056EF86FF76F8
      9EFF09A416FF0DA71CFF0FA921FF11AB25FF016702D900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006EB1DAFF0F7C
      C1FF0F7CC1FF0D6199FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000057F187FF51CA
      5CFF0BA518FF0DA71DFF089F15FF005800C90000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001588FFF0F7CC1FF0F7C
      C1FF6DB0DAFF01588CFE00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005AF48CFF0AA4
      16FF09A315FF0038009C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000074B4DBFFFDFEFEFF0158
      8FFF76B5DCFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002EC747FF0034
      0098000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001588FFF1A689CFF74B4
      DBFF01588FFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000A00410000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000163952B70000
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
  object SystemSyslogAction: TActionList
    Images = SystemSyslogImageList
    Left = 568
    Top = 432
    object SystemSyslogStartAction: TAction
      AutoCheck = True
      Caption = 'Start'
      ImageIndex = 0
      OnExecute = SystemSyslogStartActionExecute
    end
    object SystemSyslogCleanAction: TAction
      Caption = 'Clean'
      ImageIndex = 1
      OnExecute = SystemSyslogCleanActionExecute
    end
  end
  object DeployImageList: TImageList
    ColorDepth = cd32Bit
    Height = 24
    Width = 24
    Left = 360
    Top = 488
    Bitmap = {
      494C010101000800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000400000000000000000504032A2E1E0F7F653D08BE8E5713E1B672
      2CFDB5712AFD8E5713E1663D0ABF2F1F10800604032C00000000000000000000
      0004000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00030000000003020222533619ABB87329FFC5936FFFD6B8A6FFE3CFC5FFE9DB
      D4FFE9DBD4FFE3CFC5FFD6B8A7FFC59370FFB8732AFF58391DAF030302230000
      0000000000030000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000030000
      00001B130E60B47026FCC79979FFEADDD5FFF6F5F5FBF9F9F9FCFBFBFBFDFFFF
      FFFFFFFFFFFFFBFBFBFDF9F9F9FCF6F5F5FBE8DBD4FEC89A7AFFB57026FD1C14
      0E62000000000000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000003000000002A1E
      1478B9742FFFDBC1B3FFF5F5F5FAFFFFFFFFFFFFFFFFFEFEFEFFFEFEFDFFFEFE
      FDFFFEFEFDFFFEFEFDFFFEFEFEFFFFFFFFFFFFFFFFFFF5F5F5FADBC2B4FFB975
      2FFF2B1E147A0000000000000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000004000000001B130D5FB974
      2FFFDDCAC0FCFBFBFBFDFFFFFFFFFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFFFFFFFFFFFBFBFBFDDDCC
      C2FCB9742FFF1C140E6200000000000000040000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003020222B47025FCDBC1
      B2FFFBFBFBFDFEFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFF
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFEFFFEFDFDFFFBFB
      FBFDDBC2B3FFB57025FD04030224000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000053361AABC79978FFF5F5
      F5FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFF
      FFFFF5F5F5FAC79A7AFF593A1DB0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000005040329B87328FFEADCD4FFFFFF
      FFFFFEFDFDFFF8F4F2FFF8F4F1FFFFFFFFFFFFFFFFFFFEFDFDFFF7F1EFFFFAF7
      F6FFFFFFFFFFFFFFFFFFFCFAF9FFF6F1EEFFFDFBFAFFFFFFFFFFFEFDFDFFF5EF
      ECFFFCFAF9FFE9DCD5FEB87329FF0604032C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002C1D0F7DC4926EFFF5F4F4FBFFFF
      FFFFF7F1EFFFBE8556FFBE8352FFF5EFECFFFFFFFFFFEBDDD6FFB56A00FFCFA9
      92FFFFFFFFFFFFFFFFFFE8D9D1FFB46500FFEEE3DDFFFFFFFFFFD6B8A7FFB466
      00FFE9DBD3FFF7F7F7FBC4916CFF2E1E0F7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000633C0ABCD5B6A4FFF9F9F9FCFFFF
      FFFFE8D9D1FFB97634FFB97634FFE6D5CCFFFFFFFFFFD8BBABFFB87122FFC088
      5CFFF7F2EFFFFFFFFFFFE7D7CFFFB15B00FFF2EBE7FFEFE4DEFFB05700FFD7B9
      A8FFFFFFFFFFF9F9F9FCD6B8A6FF653D0BBE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008A5412DEE2CEC3FFFBFBFBFDFFFF
      FFFFD5B6A3FFC59572FFCCA48AFFD3B29EFFFFFFFFFFC59470FFD0AC95FFC089
      5DFFE8D9D1FFFFFFFFFFE6D6CDFFB56900FFE9DAD2FFC4916CFFC3916BFFFDFC
      FBFFFFFFFFFFFBFBFBFDE3CFC5FF8E5715E10000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B67430FCE8D9D1FFFFFFFFFFFEFD
      FCFFC18C62FFD6B7A5FFE6D4CBFFC28E67FFF6F0EDFFB87228FFEADDD5FFCA9F
      83FFD5B6A4FFFFFFFFFFE6D5CCFFB97530FFC4936FFFB97634FFF3EBE7FFFFFF
      FFFFFDFCFCFFFFFFFFFFE9DBD3FFB6722DFD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1712DFAE8D8D0FFFFFFFFFFF4ED
      E9FFB56800FFE3D0C6FFF7F3F0FFBE8351FFD9BEAEFFBA793DFFFBF8F6FFD7BA
      A9FFC28E66FFFFFFFFFFE7D7CFFFB76F19FFD9BFAFFFBB7A3FFFE4D2C8FFFFFF
      FFFFFDFCFCFFFFFFFFFFE9DBD3FFB6722DFD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008A5411DEE1CCC0FFFBFBFBFDE6D5
      CCFFB36300FFEEE4DEFFFFFFFFFFC89A7AFFBC7D46FFC89C7DFFFFFFFFFFE5D3
      C9FFB66D08FFFBF9F7FFEADDD6FFB26100FFF3ECE8FFDCC3B4FFB36200FFF3EC
      E8FFFFFFFFFFFBFBFBFDE2CFC4FF8D5615E00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000633C0BBCD4B4A2FFF9F9F9FCCDA7
      8EFFB56800FFF8F3F1FFFFFFFFFFD8BBABFFAA4000FFD7BAA9FFFFFFFFFFF0E7
      E2FFAC4900FFE9DBD3FFEBDDD6FFA93B00FFEEE3DEFFFFFFFFFFC0885BFFBD81
      4DFFF8F4F2FFF9F9F9FCD5B6A4FF653D0BBE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002B1C0E7BC4926DFFF5F4F4FBEBDE
      D7FFE9DBD4FFFEFEFDFFFFFFFFFFF6F0EDFFE4D2C8FFF5EFECFFFFFFFFFFFCFB
      FAFFE6D5CCFFF3EBE7FFF8F3F1FFE4D2C9FFF8F3F1FFFFFFFFFFF4EEEAFFE3D0
      C5FFF5EEEBFFF7F7F7FBC4916CFF2C1D0E7D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000005030228B87227FFE9DBD3FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFEADBD4FFB87329FF050403290000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000053361BAAC69876FFF5F4
      F4FAFFFEFEFFFFFEFEFFFFFFFFFFFFFEFEFFFEFDFDFFFFFEFEFFFFFFFFFFFFFF
      FFFFFEFDFDFFFFFEFEFFFFFFFEFFFEFDFDFFFFFFFEFFFFFFFFFFFEFEFDFFFEFE
      FEFFF5F5F5FAC79979FF53371AAC000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003020220B06E25FADABF
      B0FFFBFBFBFDFEFEFEFFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFEFEFDFFFBFB
      FBFDDBC1B2FFB47026FC03020222000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000040000000019120C5CB974
      2DFFDECABEFDFBFBFBFDFFFFFFFFFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFFFFFFFFFFFBFBFBFDDECB
      C0FDB9742EFF1A130D5E00000000000000040000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000400000000271C
      1374B9742DFFDABFB0FFF5F5F5FAFFFFFFFFFFFFFFFFFEFEFEFFFEFEFDFFFEFE
      FDFFFEFEFDFFFEFEFDFFFEFEFEFFFFFFFFFFFFFFFFFFF5F5F5FADAC0B1FFB974
      2FFF2A1E15780000000000000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000030000
      000018120C5BB06C23F9C69776FFE9DBD3FFF6F5F4FBF9F9F9FCFBFBFBFDFFFF
      FFFFFFFFFFFFFBFBFBFDF9F9F9FCF6F5F4FBEADBD4FFC79877FFB06E25FA1A13
      0D5E000000000000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0004000000000302021F52361BA9B87227FFC4916CFFD5B6A3FFE2CDC2FFE8D9
      D0FFE8D9D0FFE2CEC2FFD5B6A4FFC4926DFFB87227FF53361BAA030202200000
      0000000000030000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000040000000000000000050303282C1D0F7C623B0ABB88520CDCB272
      2FFAB27230FA88520CDC623B0ABB2C1D0F7C0503022800000000000000000000
      0004000000000000000000000000000000000000000000000000000000000000
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
  object DeployAction: TActionList
    Images = DeployImageList
    Left = 568
    Top = 488
    object DeployClientsAction: TAction
      Caption = 'Clients'
      Hint = 'Deploy clients executables so can be downloaded from the website'
      ImageIndex = 0
      OnExecute = DeployClientsActionExecute
    end
    object DeployServersAction: TAction
      Caption = 'Servers'
      Hint = 
        'Deploy ISAPI, SOAP and REST servers to the  IIS web server direc' +
        'tory'
      ImageIndex = 0
      OnExecute = DeployServersActionExecute
    end
    object DeployServicesAction: TAction
      Caption = 'Services'
      ImageIndex = 0
      OnExecute = DeployServicesActionExecute
    end
  end
  object ClientsClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ClientsDataSetProvider'
    RemoteServer = MainSoapConnection
    AfterRefresh = ClientsClientDataSetAfterRefresh
    Left = 72
    Top = 600
  end
  object ClientsDataSource: TDataSource
    DataSet = ClientsClientDataSet
    Left = 208
    Top = 600
  end
end
