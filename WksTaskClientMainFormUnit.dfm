inherited TaskMainForm: TTaskMainForm
  Caption = 'TaskMainForm'
  ExplicitWidth = 1588
  ExplicitHeight = 879
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
    ExplicitWidth = 1572
    inherited TopPageControl: TPageControl
      Width = 1156
      ExplicitWidth = 1152
      inherited TopClientTabSheet: TTabSheet
        ExplicitWidth = 1148
      end
      inherited TopActionTabSheet: TTabSheet
        ExplicitWidth = 1148
      end
      inherited TopTextTabSheet: TTabSheet
        ExplicitWidth = 1148
      end
      inherited TopSearchTabSheet: TTabSheet
        ExplicitWidth = 1148
      end
      inherited TopUtilsTabSheet: TTabSheet
        ExplicitWidth = 1148
      end
      object TaskTabSheet: TTabSheet
        Caption = 'Task'
        ImageIndex = 2
        object TaskToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 415
          Height = 44
          Align = alLeft
          AutoSize = True
          ButtonHeight = 46
          ButtonWidth = 83
          Caption = 'TaskToolBar'
          Images = TaskImageList24
          ShowCaptions = True
          TabOrder = 0
          object TaskDatesResetToolButton: TToolButton
            Left = 0
            Top = 0
            Action = TaskDatesResetAction
          end
          object TaskMoveToolButton: TToolButton
            Left = 83
            Top = 0
            Hint = 'Move the task 7 days earlier or later'
            Action = TaskMoveEarlierAction
            OnMouseLeave = TaskMoveToolButtonMouseLeave
            OnMouseMove = TaskMoveToolButtonMouseMove
          end
          object TaskStartChangeToolButton: TToolButton
            Left = 166
            Top = 0
            Action = TaskStartEarlierAction
            OnMouseLeave = TaskStartChangeToolButtonMouseLeave
            OnMouseMove = TaskStartChangeToolButtonMouseMove
          end
          object TaskEtaChangeToolButton: TToolButton
            Left = 249
            Top = 0
            Action = TaskEtaLaterAction
            OnMouseLeave = TaskEtaChangeToolButtonMouseLeave
            OnMouseMove = TaskEtaChangeToolButtonMouseMove
          end
          object TaskParentsUpdateToolButton: TToolButton
            Left = 332
            Top = 0
            Action = TaskParentsUpdateAction
          end
        end
      end
    end
    inherited TopPageControl3: TPageControl
      Left = 1276
      ExplicitLeft = 1272
    end
    inherited TopPageControl2: TPageControl
      Left = 1156
      ExplicitLeft = 1152
    end
  end
  inherited LeftPanel: TPanel
    ExplicitHeight = 594
    inherited LeftPageControl: TPageControl
      Height = 595
      ExplicitHeight = 594
      inherited ObjectTreeTabSheet: TTabSheet
        ExplicitHeight = 565
        inherited ObjectNodeInfoLabel: TLabel
          Top = 550
          Width = 292
          ExplicitTop = 549
        end
        inherited ObjectDTClientTree: TDTClientTree
          Height = 525
          ExplicitHeight = 525
        end
        inherited ObjectDBNavigator: TDBNavigator
          Hints.Strings = ()
        end
      end
      inherited WordTabSheet: TTabSheet
        ExplicitHeight = 565
      end
    end
  end
  inherited BottomPanel: TPanel
    ExplicitTop = 679
    ExplicitWidth = 1576
    inherited LogFrame: TLogFrame
      ExplicitWidth = 1576
      inherited LogPageControl: TPageControl
        ExplicitWidth = 1572
        inherited OutputTabSheet: TTabSheet
          inherited OutputRichEdit: TRichEdit
            ExplicitWidth = 1562
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
      end
    end
  end
  inherited RightPanel: TPanel
    ExplicitLeft = 1272
    ExplicitHeight = 594
    inherited RightPageControl: TPageControl
      ExplicitHeight = 594
      inherited PropertyTabSheet: TTabSheet
        inherited ObjectJvScrollMax: TJvScrollMax
          ExplicitHeight = 564
          inherited ObjectImageJvScrollMaxBand: TJvScrollMaxBand
            inherited ObjectImageDBImage: TDBImage
              Height = 0
            end
          end
          object TaskJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Task'
            ExpandedHeight = 260
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object TaskObjectIdLabel: TLabel
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
            object TaskEtaLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 149
              Width = 249
              Height = 13
              Hint = 
                'Expected Time Action (the date when the task is expected to be c' +
                'ompleted)'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Stop (ETA)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = TaskEtaLabelClick
              ExplicitWidth = 52
            end
            object TaskStartLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 103
              Width = 249
              Height = 13
              Hint = 'The task begin planned date'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Start'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = TaskStartLabelClick
              ExplicitWidth = 24
            end
            object TaskDurationLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 202
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Top = 10
              Margins.Right = 16
              Align = alTop
              Caption = 'TaskDurationLabel'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 96
            end
            object TaskObjectIdDBEdit: TDBEdit
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
              DataSource = TaskDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
            end
            object TaskDBNavigator: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 275
              Height = 25
              DataSource = TaskDataSource
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alTop
              Flat = True
              TabOrder = 1
            end
            object TaskIsMilestoneDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 228
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Is Milestone'
              DataField = 'FldIsMilestone'
              DataSource = TaskDataSource
              TabOrder = 2
            end
            object TaskEtaJvDBDateTimePicker: TJvDBDateTimePicker
              AlignWithMargins = True
              Left = 16
              Top = 168
              Width = 249
              Height = 21
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Date = 45478.000000000000000000
              Format = 'MM/dd/yyyy'
              Time = 0.946308032398519600
              DateFormat = dfLong
              TabOrder = 3
              OnChange = TaskStartJvDBDateTimePickerChange
              DropDownDate = 45478.000000000000000000
              NullText = 'No Date'
              WeekNumbers = True
              DataField = 'FldEta'
              DataSource = TaskDataSource
            end
            object TaskStartJvDBDateTimePicker: TJvDBDateTimePicker
              AlignWithMargins = True
              Left = 16
              Top = 122
              Width = 249
              Height = 21
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Date = 45478.000000000000000000
              Format = 'MM/dd/yyyy'
              Time = 0.946308032398519600
              DateFormat = dfLong
              TabOrder = 4
              OnChange = TaskStartJvDBDateTimePickerChange
              DropDownDate = 45478.000000000000000000
              NullText = 'No Date'
              WeekNumbers = True
              DataField = 'FldStart'
              DataSource = TaskDataSource
            end
          end
          object TaskPeopleJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'People'
            ExpandedHeight = 194
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object TaskRequestorLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 27
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Requestor'
              ExplicitWidth = 53
            end
            object TaskStakeholderCsvLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 77
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Stakeholders (csv)'
              ExplicitWidth = 95
            end
            object TaskOwnerLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 127
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Owner (csv)'
              ExplicitWidth = 63
            end
            object TaskRequestorDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 48
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldRequestor'
              DataSource = TaskDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object TaskStakeholderCsvDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 98
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldStakeholderCsv'
              DataSource = TaskDataSource
              TabOrder = 1
            end
            object TaskOwnerDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 148
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldOwner'
              DataSource = TaskDataSource
              TabOrder = 2
            end
          end
          object TaskProgressJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Progress'
            ExpandedHeight = 353
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object TaskProgressLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 27
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Progress (%)'
              ExplicitWidth = 66
            end
            object TaskProgressJvDBRadioPanel: TJvDBRadioPanel
              AlignWithMargins = True
              Left = 8
              Top = 48
              Width = 265
              Height = 302
              Margins.Left = 8
              Margins.Right = 8
              Align = alClient
              BevelOuter = bvNone
              DataField = 'FldProgress'
              DataSource = TaskDataSource
              Items.Strings = (
                '0'
                '10'
                '20'
                '30'
                '40'
                '50'
                '60'
                '70'
                '80'
                '90'
                '100')
              TabOrder = 0
              Values.Strings = (
                '0'
                '10'
                '20'
                '30'
                '40'
                '50'
                '60'
                '70'
                '80'
                '90'
                '100')
            end
          end
          object TaskResourceJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Resources'
            ExpandedHeight = 140
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object TaskCostLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 27
              Width = 249
              Height = 15
              Hint = 'Total cost assocated to the task'
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Cost'
              ExplicitWidth = 24
            end
            object TaskHourLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 77
              Width = 249
              Height = 15
              Hint = 'Effective hours duration of task'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Hours'
              ExplicitWidth = 32
            end
            object TaskCostDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 48
              Width = 249
              Height = 23
              Hint = 'Page'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldCost'
              DataSource = TaskDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object TaskHourDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 98
              Width = 249
              Height = 23
              Hint = 'Page'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldHour'
              DataSource = TaskDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
        end
      end
      inherited OptionTabSheet: TTabSheet
        inherited OptionJvScrollMax: TJvScrollMax
          inherited OptionFilesJvScrollMaxBand: TJvScrollMaxBand
            Height = 21
            Expanded = False
            ExplicitHeight = 21
          end
          object OptionTaskJvScrollMaxBand: TJvScrollMaxBand
            Width = 286
            Height = 21
            Expanded = False
            Caption = 'Task'
            ExpandedHeight = 70
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object OptionTaskUpdateUpToLevelLabel: TLabel
              Left = 16
              Top = 36
              Width = 96
              Height = 15
              Caption = 'Update up to level'
            end
            object OptionTaskUpdateUpToLevelComboBox: TComboBox
              Left = 128
              Top = 33
              Width = 142
              Height = 23
              TabOrder = 0
              Text = 'OptionTaskUpdateUpToLevelComboBox'
              Items.Strings = (
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10')
            end
          end
        end
      end
    end
  end
  inherited StatusBar: TStatusBar
    ExplicitTop = 818
    ExplicitWidth = 1566
  end
  inherited MainPanel: TPanel
    ExplicitHeight = 594
    inherited MainPageControl: TPageControl
      Height = 595
      ExplicitHeight = 594
      inherited ObjectContentPrevTabSheet: TTabSheet
        ExplicitHeight = 565
        inherited ObjectContentPrevDBSynEdit: TDBSynEdit
          Height = 537
          ExplicitHeight = 537
        end
        inherited ObjectContentPrevTopPanel: TPanel
          inherited ObjectContentPrevCharCountLabel: TLabel
            Height = 22
          end
        end
      end
      inherited ObjectContentTabSheet: TTabSheet
        ExplicitHeight = 565
        inherited ObjectContentSplitter: TSplitter
          Height = 537
          ExplicitHeight = 536
        end
        inherited ObjectContentTopPanel: TPanel
          inherited ObjectContentCharCountLabel: TLabel
            Height = 22
          end
        end
        inherited ObjectContentSplitView: TSplitView
          Height = 537
          ExplicitHeight = 536
          inherited ObjectContentEdgeBrowser: TEdgeBrowser
            Height = 537
            ExplicitHeight = 536
          end
        end
        inherited ObjectContentLeftPanel: TPanel
          Height = 537
          ExplicitHeight = 536
          inherited ObjectContentDBSynEdit: TDBSynEdit
            Height = 429
            ExplicitHeight = 428
          end
        end
      end
      inherited ObjectDataTabSheet: TTabSheet
        ExplicitHeight = 565
        inherited ObjectDataDBSynEdit: TDBSynEdit
          Height = 537
          ExplicitHeight = 537
        end
        inherited ObjectDataTopPanel: TPanel
          inherited ObjectDataCharCountLabel: TLabel
            Height = 22
          end
        end
      end
      inherited ObjectNoteTabSheet: TTabSheet
        ExplicitHeight = 565
        inherited ObjectNoteDBSynEdit: TDBSynEdit
          Height = 537
          ExplicitHeight = 537
        end
        inherited ObjectNoteTopPanel: TPanel
          inherited ObjectNoteCharCountLabel: TLabel
            Height = 22
          end
        end
      end
      inherited FilesRioTabSheet: TTabSheet
        ExplicitHeight = 565
        inherited FilesRioTopPanel: TPanel
          inherited FilesRioInfoLabel: TLabel
            Height = 31
          end
        end
        inherited FilesRioTree: TVirtualStringTree
          Height = 519
          ExplicitHeight = 519
        end
      end
    end
  end
  object TaskClientDataSet: TClientDataSet [15]
    Aggregates = <>
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    PacketRecords = 0
    Params = <>
    ProviderName = 'TaskDataSetProvider'
    RemoteServer = MainSoapConnection
    AfterInsert = TaskClientDataSetAfterInsert
    AfterPost = TaskClientDataSetAfterPost
    AfterDelete = TaskClientDataSetAfterDelete
    OnReconcileError = TaskClientDataSetReconcileError
    Left = 72
    Top = 432
  end
  object TaskDataSource: TDataSource [16]
    DataSet = TaskClientDataSet
    Left = 208
    Top = 432
  end
  object TaskImageList24: TImageList [27]
    ColorDepth = cd32Bit
    Height = 24
    Width = 24
    Left = 376
    Top = 544
    Bitmap = {
      494C010108001800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000060000000480000000100200000000000006C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7FFEF00EFF7E700FFFFF700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000010A10431182C7EA0006095E00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5DE940052B5000052B5000073BD3100ADD68400EFF7EF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00C6C6FF007373FF004242FF002929FF00BDBD
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      00000000000000000000010D104218B5FFFF107CBEE700000008000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDE79C0052B5000052B5000052B5000052B5000052B50800A5D67B00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00B5B5FF002929FF000000FF000000FF000000FF000000FF00B5B5
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70084848400000000000000000000000000000000000000
      000000000000000000000005052820DDFFFF17B1FFFF0002034C000000060000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6EFBD007BC642005AB5100052B5000052B5000052B5000052B5000073C6
      3100F7FFEF00000000000000000000000000000000000000000000000000F7F7
      FF005A5AFF000000FF000000FF000000FF000000FF000000FF000808FF00C6C6
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70084848400000000000000000000000000000000000000
      0000000000000000000000000000105A69A522DFFFFF16A7FFFF0C5B95D40001
      0240000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00DEEFCE008CCE5A0052B5000052B5000052B5
      00006BBD2900F7FFEF0000000000000000000000000000000000F7F7FF003939
      FF000000FF000000FF000000FF003939FF00ADADFF00EFEFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70084848400000000000000000000000000000000000000
      0000000000000000000000000000072126651EDAFFFF2FE6FDFF15A1FEFF0A4E
      84CB000000030000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6EFBD005AB5100052B5
      000052B500007BC64200FFFFFF000000000000000000FFFFFF005252FF000000
      FF000000FF000808FF00ADADFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70084848400000000000000000000000000000000000000
      0000000000000000000000000000000304232BDAFFFF33E0FEFF31E2FCFF149A
      FEFF000000340000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEF7D6005AB5
      100052B5000052B50000BDDE9C000000000000000000ADADFF000000FF000000
      FF000808FF00CECEFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000084
      000000840000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F7000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000001C5562A01CD3FFFF1DD4FFFF58E2
      FFFF138FFDFE07335CB400000028000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFF7EF00DEEFCE0000000000C6E7
      AD0052B5000052B5000063BD1800FFFFFF00FFFFFF002121FF000000FF000000
      FF00ADADFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6D6FF00F7F7FF0000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000084
      000000840000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700ADADAD00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F7000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000300010235152E368C1CCFFFFF1CD0FFFF1ED1
      FFFF29C0FFFF138BFBFE052A4CAA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6E7A5005AB510007BC6390000000000FFFF
      FF0073C6310052B5000052B50000CEE7B500BDBDFF000000FF000000FF003939
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7FF006363FF000000FF00BDBDFF0000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000084
      000000840000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700848484009C9C9C00E7E7E700F7F7F700F7F7F700F7F7F7000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000114107CE1F31487EAF81CCDFFFF1CCDFFFF1CCD
      FFFF81E6FFFF27B5FFFF128AF9FD000000200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFF7EF0084CE520052B5000094CE6300F7FFF700000000000000
      0000BDDE9C0052B5000052B500009CD66B007373FF000000FF000000FF00A5A5
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00B5B5FF001818FF001818FF00B5B5FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000840000008400000084
      000000840000F7F7F700F7F7F700B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B50084848400848484008C8C8C00DEDEDE00F7F7F700F7F7F7000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000001031CEFDFE48D3FFFF1BC6FFFF1BC6FFFF1BC7
      FFFF1BC7FFFF43D0FFFF9FE7FFFF083D74BB0000000900000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008CCE
      5A00F7FFF7000000000000000000000000000000000000000000000000000000
      0000C6E7A5005AB5100063BD1800CEEFBD000000000000000000000000000000
      0000EFF7DE0052B5000052B500007BC639004242FF000000FF000000FF00E7E7
      FF00000000000000000000000000000000000000000000000000EFEFFF005A5A
      FF000000FF006B6BFF00F7F7FF0000000000000000000000000000000000F7F7
      FF005252FF00FFFFFF0000000000000000000000000000840000008400000084
      000000840000F7F7F700F7F7F700848484008484840084848400848484008484
      84008484840084848400848484008484840084848400CECECE00F7F7F7000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000107EA8D01AC0FFFF1AC2FFFF1AC3FFFF1AC3
      FFFF1AC3FFFF1AC3FFFF5DD4FFFF0E4773B90000000800000000000000000000
      0000000000000000000000000000000000000000000000000000B5DE940052B5
      00009CD673000000000000000000000000000000000000000000000000000000
      000052B508008CCE5200F7FFF700000000000000000000000000000000000000
      0000FFFFFF0052B5000052B500006BBD21002929FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000ADADFF000808
      FF00C6C6FF000000000000000000000000000000000000000000000000007B7B
      FF000000FF007B7BFF0000000000000000000000000000840000008400000084
      000000840000F7F7F700F7F7F700848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400BDBDBD000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000052735761ABCFFFF1ABEFFFF1ABFFFFF1AC0
      FFFF1AC0FFFF1ABFFFFF19B5FFFF082029770000000100000000000000000000
      00000000000000000000000000000000000000000000EFF7E7005AB5080052B5
      000052B50000DEEFCE0000000000000000000000000000000000000000000000
      000052B50800C6E7AD0000000000000000000000000000000000000000000000
      0000FFFFFF0052B5000052B500006BBD21002929FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000ADADFF001010
      FF00000000000000000000000000000000000000000000000000D6D6FF000000
      FF000000FF000000FF00D6D6FF00000000000000000000840000008400000084
      000000840000F7F7F700F7F7F700848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400C6C6C6000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000013A000000350F6D98CF19B8FFFF19B8FFFF19B8
      FFFF24BCFFFF35C1FFFF4BC7FFFF0C5EB9E40000003500000000000000000000
      000000000000000000000000000000000000FFFFFF0084C64A0052B5000052B5
      000052B5000073BD3100FFFFFF00000000000000000000000000000000000000
      000052B50800C6E7AD0000000000000000000000000000000000000000000000
      0000EFF7E70052B5000052B5000073C631004242FF000000FF000000FF00E7E7
      FF00000000000000000000000000000000000000000000000000ADADFF001010
      FF000000000000000000000000000000000000000000FFFFFF003131FF000000
      FF000000FF000000FF003131FF00FFFFFF000000000000840000008400000084
      000000840000F7F7F700F7F7F700848484008484840084848400848484008484
      8400848484008484840084848400848484008C8C8C00D6D6D600F7F7F7000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000E69D4EF0D65CBEC1187E4F619B4FFFF19B5FFFF19B5
      FFFF36BEFFFF40C1FFFF49C4FFFF1F8BFFFF0420419F00000011000000000000
      000000000000000000000000000000000000C6E7AD0052B5000052B5000052B5
      000052B5000052B50000B5DE8C00000000000000000000000000000000000000
      000052B50800C6E7AD0000000000000000000000000000000000000000000000
      0000C6E7A50052B5000052B5000094CE63007373FF000000FF000000FF009C9C
      FF00000000000000000000000000000000000000000000000000ADADFF001010
      FF0000000000000000000000000000000000000000008C8CFF000000FF000000
      FF000000FF000000FF000000FF008C8CFF000000000000840000008400000084
      000000840000F7F7F700F7F7F700B5B5B500B5B5B500B5B5B500B5B5B500B5B5
      B500B5B5B500848484008484840094949400E7E7E700F7F7F700F7F7F7000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000117DFFFF117DFFFF1182FFFF18B1FFFF18B1FFFF28B7
      FFFF3FBFFFFF48C2FFFF52C4FFFF68BAFFFF0E6FDFF400020544000000000000
      000000000000000000000000000000000000D6EFBD00BDE7A50052B5000052B5
      000052B50000C6E7AD00D6EFC600000000000000000000000000000000000000
      000052B50800C6E7AD0000000000000000000000000000000000000000000000
      00007BC6420052B5000052B50000C6E7AD00C6C6FF000000FF000000FF003939
      FF00000000000000000000000000000000000000000000000000ADADFF001010
      FF000000000000000000000000000000000000000000EFEFFF009494FF000000
      FF000000FF004A4AFF00E7E7FF00EFEFFF000000000000840000008400000084
      000000840000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700848484009C9C9C00EFEFEF00F7F7F700F7F7F700F7F7F7000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000017A7FFFF17A8FFFF17A9FFFF1EADFFFF35B5FFFF3EB9
      FFFF51C0FFFF5AC3FFFF63C6FFFF93D6FFFFA3D2FFFF02112372000000000000
      000000000000000000000000000000000000000000000000000084C64A0052B5
      000052B50000A5D6730000000000000000000000000000000000000000000000
      000052B50800C6E7AD000000000000000000000000000000000000000000D6EF
      BD0052B5000052B500005AB51000FFFFFF00FFFFFF002929FF000000FF000000
      FF009C9CFF000000000000000000000000000000000000000000ADADFF001010
      FF000000000000000000000000000000000000000000EFEFFF002121FF000000
      FF000000FF00B5B5FF0000000000000000000000000000840000008400000084
      000000840000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700ADADAD00EFEFEF00F7F7F700F7F7F700F7F7F700F7F7F7000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000016A3FFFF16A4FFFF16A5FFFF32B1FFFF3EB6FFFF48BA
      FFFF5AC1FFFF64C4FFFF5AC0FFFF3DA0E5F6659DC2E1080F1552000000000000
      0000000000000000000000000000000000000000000000000000DEEFCE0052B5
      000052B5000052B50000CEE7B500000000000000000000000000000000000000
      000052B50800C6E7AD0000000000000000000000000000000000EFF7E70063B5
      100052B5000052B50000ADDE8C000000000000000000B5B5FF000000FF000000
      FF000808FF00C6C6FF0000000000000000000000000000000000B5B5FF001010
      FF0000000000000000000000000000000000FFFFFF004242FF000000FF000000
      FF004242FF000000000000000000000000000000000000840000008400000084
      000000840000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F7000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000001184D0E816A1FFFF16A2FFFF3EB3FFFF48B7FFFF51BB
      FFFF64C2FFFF6DC5FFFF80CDFFFF0E6CE4F60003064F00000002000000000000
      0000000000000000000000000000000000000000000000000000000000009CD6
      730052B5000052B5000052B50800C6E7A5000000000000000000000000000000
      0000ADDE8400E7F7DE00000000000000000000000000E7F7D60063BD210052B5
      000052B5000073BD3100FFFFFF000000000000000000000000006363FF000000
      FF000000FF000000FF009C9CFF00000000000000000000000000FFFFFF00CECE
      FF00000000000000000000000000DEDEFF003131FF000000FF000000FF001010
      FF00DEDEFF000000000000000000000000000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70084848400000000000000000000000000000000000000
      0000000000000000000002121E59159AFFFF199DFFFF51B5FFFF5AB9FFFF64BD
      FFFF76C5FFFF80C9FFFF89CDFFFF54ABFFFF0F6EF3FB00060E62000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF007BC6390052B5000052B5000052B500008CCE5200E7F7D600000000000000
      0000000000000000000000000000F7FFEF00A5D67B0052B5080052B5000052B5
      00005AB51000E7F7DE0000000000000000000000000000000000F7F7FF004242
      FF000000FF000000FF000000FF003939FF00A5A5FF00EFEFFF00FFFFFF000000
      0000F7F7FF00C6C6FF006B6BFF000808FF000000FF000000FF000808FF00C6C6
      FF00000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70084848400000000000000000000000000000000000000
      00000000000000000000000001131492F7FC259FFFFF5AB7FFFF63BBFFFF6CBF
      FFFF80C7FFFF89CBFFFF92CFFFFFB1DDFFFF2284FFFF083C88CD000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7FFF70084C64A0052B5000052B5000052B5000052B500006BBD29008CCE
      5A009CD6730094CE63007BC6390052B5000052B5000052B5000052B5000063BD
      1800E7F7D600000000000000000000000000000000000000000000000000F7F7
      FF006363FF000000FF000000FF000000FF000000FF000000FF001010FF001010
      FF000808FF000000FF000000FF000000FF000000FF002121FF00D6D6FF000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70084848400000000000000000000000000000000000000
      00000000000000000000000000000C5798C632A2FFFF63B9FFFF6CBDFFFF76C1
      FFFF89CAFFFF92CEFFFF9CD2FFFFC8E6FFFF7CBCFFFF0E70FDFE000000070000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00ADDE8C0052B5080052B5000052B5000052B5000052B5
      000052B5000052B5000052B5000052B5000052B5000052B500008CCE5A00F7FF
      EF00000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDFF003131FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF001010FF008484FF00F7F7FF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70084848400000000000000000000000000000000000000
      000000000000000000000000000000050A3446AAFFFF75BFFFFF7EC4FFFF89C8
      FFFF9BD0FFFFA4D5FFFFAED9FFFFBFE1FFFFE0F0FFFFA7D1FFFF00050D500000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFF7EF00ADDE840063BD210052B5000052B5
      000052B5000052B5000052B500005AB5100094CE6300DEEFCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CECEFF007B7BFF004A4AFF003131FF002929
      FF003939FF006363FF00ADADFF00F7F7FF000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      000000000000000000000000000000000002378CD3E980C4FFFF89C8FFFF92CC
      FFFFA5D5FFFFAED9FFFFB7DDFFFFC8E5FFFFD6EBFFFFF0F8FFFF00050C4B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFF7E700D6EF
      BD00CEE7B500D6EFBD00E7F7DE00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000D3253923983C3DF3D84C3DF4488
      C3DF4F8FC3E05AA2DEEF5FA4DEEF68A8DEEF76AFDEEF8DB9DEEF000206320000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFB
      F700FFEFC500FFF6E300FFFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFDFB00FFE2
      9100FFD56900FFDB6E00FFFBF9000000000000000000D1D1D100D1D1D100D0D0
      D000CFCFCF00CFCFCF00CECECE00CECECE00CECECE00CDCDCD00CDCDCD00CCCC
      CC00CCCCCC00CBCBCB00CBCBCB00CBCBCB00CACACA00C8C8C800C7C7C700C8C8
      C800CACACA00CBCBCB00CACACA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF0CD00FFD9
      5D00FFD54100FFE6A200FFFCFB000000000000000000D7D7D700D5D5D500D8D8
      D800DADADA00DADADA00DADADA00DADADA00DADADA00DADADA00DADADA00DADA
      DA00DADADA00DADADA00DADADA00DADADA00DADADA00D7D7D700B5B5B500C3C3
      C300C6C6C600BDBDBD00B0B0B000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFC00FFFBF600FFF7ED00FFF8
      EE00FFFAF400FFFDFC00000000000000000000000000FFF7E700FFD95B00FFDC
      6A00FFF1D400FFFEFB00000000000000000000000000DEDEDE00D9D9D900D8D8
      D800DADADA00DFDFDF00E8E8E800C7C7C700BCBCBC00E8E8E800E8E8E8008484
      84008E8E8E00E8E8E800E8E8E8009090900095959500E8E8E800D6D6D600BFBF
      BF00D9D9D900E9E9E900C8C8C800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFAF700FFF1C400FFE77600FFE24900FFE03D00FFE0
      3D00FFE04A00FFE37700FFF0CB00FFF7EF00FFEFCD00FFDB5B00FFDF7200FFF4
      DE00FFFEFE0000000000000000000000000000000000DDDDDD00D6D6D600D2D2
      D200D3D3D300DBDBDB00EBEBEB00BFBFBF00B7B7B700EBEBEB00EBEBEB00BFBF
      BF00BFBFBF00EBEBEB00EBEBEB00C0C0C000C0C0C000EBEBEB00E5E5E500E4E4
      E400C4C4C400E9E9E900C7C7C700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFE00FFF8E600FFE37200FFDE4100FFE45E00FFE56500FFE46200FFE2
      6200FFE26500FFE16200FFDB4B00FFD84B00FFDB5600FFD95900FFEAB600FFFE
      FD000000000000000000000000000000000000000000DCDCDC00D2D2D200CECE
      CE00CFCFCF00D9D9D900EEEEEE00EEEEEE00EEEEEE00EEEEEE00DCDCDC00B1B1
      B100ABABAB00BEBEBE00EAEAEA00EEEEEE00EEEEEE00EEEEEE00EBEBEB00FBFB
      FB00E9E9E900CDCDCD00CCCCCC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFEFD00FFF9
      F200FFECB800FFD84700FFDD5600FFE05500FFDC3E00FFDA3E00FFD93E00FFD8
      3D00FFD73C00FFD53C00FFD84E00FFD95800FFD24300FFD25000FFFBF5000000
      00000000000000000000000000000000000000000000F1F1F100F1F1F100F1F1
      F100F1F1F100F1F1F100F1F1F100F1F1F100F1F1F100D6D6D600606060005959
      59005A5A5A005959590082828200F1F1F100F1F1F100F1F1F100F0F0F000F3F3
      F300F2F2F200E3E3E300C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFEFB00FFE69B00FFCB
      4300FFCF4200FFDB5F00FFDB4C00FFDA4700FFD94700FFD84600FFD74600FFD6
      4600FFD54500FFD44500FFD24400FFD04300FFCF4300FFD66C00FFFCF9000000
      00000000000000000000000000000000000000000000F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400A0A0A0004C4C4C005F5F
      5F00BBBBBB004C4C4C004D4D4D00E7E7E700F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F400D0D0D000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6E7AD00A5D67B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF008484FF009C9CFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFDFB00FFDB7400FFDA
      6600FFDA5A00FFD85100FFD85100FFD85100FFD75000FFD64F00FFD64F00FFD5
      4E00FFD44E00FFD24D00FFD14D00FFCF4C00FFCE4B00FFCB4800FFF5E4000000
      00000000000000000000000000000000000000000000F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800F8F8F800F8F8F800F8F8F80092929200434343006262
      6200C8C8C8004343430043434300E1E1E100F8F8F800F8F8F800F8F8F800F8F8
      F800F8F8F800F8F8F800E0E0E000000000000000000000000000000000000000
      000052B500000000000000000000000000000000000000000000000000000000
      000000000000EFFFEF008CCE5A0052B5000084CE4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CECEFF002929FF000000FF009494FF0000000000FFFFFF000000
      FF00000000000000000000000000000000000000000000000000FFECC000FFD4
      5000FFD75A00FFD75A00FFD75A00FFD75A00FFD75A00FFD65C00FFD65D00FFD4
      5A00FFD25600FFD15600FFD05500FFCF5500FFCD5400FFCE5600FFD68000FFFD
      FB000000000000000000000000000000000000000000FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00969696003A3A3A005353
      5300BFBFBF003A3A3A003B3B3B00E9E9E900FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00E2E2E200000000000000000000000000F7FFEF0052B5
      000052B500000000000000000000000000000000000000000000000000000000
      0000C6E7AD005AB5100052B50800B5DE94000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF008484FF000000FF002929FF00CECEFF000000000000000000F7F7FF002121
      FF007B7BFF00F7F7FF0000000000000000000000000000000000FFF8F100FFCF
      4D00FFD66200FFD66300FFD66400FFD76700FFD76900FFD86C00FFD86F00FFD8
      7100FFD56C00FFD16000FFD05F00FFCF5E00FFCD5E00FFCC5E00FFC54500FFF0
      DB000000000000000000000000000000000000000000FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00CCCCCC00373737003333
      3300383838003333330064646400FCFCFC00FDFDFD00FDFDFD00FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00E4E4E4000000000000000000BDE79C005AB5100052B5
      000052B5000052B5000052B5000052B50000E7F7D60000000000F7FFF7008CCE
      520052B500007BC642000000000000000000C6E7A500C6E7A500C6E7A500C6E7
      A500C6E7A500C6E7A500C6E7A500C6E7A500A5A5FF00A5A5FF00A5A5FF00A5A5
      FF00A5A5FF00A5A5FF00A5A5FF00C6C6FF000000000000000000D6D6FF003131
      FF000000FF007B7BFF00F7F7FF00A5A5FF00A5A5FF00A5A5FF009C9CFF000808
      FF000000FF002929FF00BDBDFF00000000000000000000000000FFF9F300FFCB
      5000FFD66F00FFD77200FFD87400FFD87700FFD97900FFD97C00FFD97E00FFDA
      8100FFDA8300FFD77E00FFD06A00FFCF6800FFCD6700FFCC6700FFC95A00FFD6
      8C00FFFEFD0000000000000000000000000000000000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00DFDFDF003A3A3A002D2D
      2D00515151002B2B2B007E7E7E00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00E6E6E600000000007BC6420052B5000052B5000052B5
      000052B5000052B5000052B5000052B50000ADDE840000000000CEE7B50052B5
      0000B5DE9400000000000000000052B5000052B5000052B5000052B5000052B5
      000052B5000052B5000052B5000052B500000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF005252FF0000000000000000009494FF000808
      FF00CECEFF0000000000FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF006363FF000000000000000000FFF6E900FFC4
      4700FFD97F00FFD98100FFDA8400FFDA8600FFDB8900FFDC8B00FFDC8D00FFDC
      8F00FFDC9200FFDC9400FFD98D00FFCF7200FFCE7000FFCD7000FFCC7000FFCD
      7900FFFCFB0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009A9A9A00252525003D3D
      3D00B8B8B8002525250027272700F6F6F600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E6E6E6000000000052B5000052B5000052B5000052B5
      000052B5000052B5000052B5000052B50000ADDE840000000000CEE7B50052B5
      0000F7FFF7000000000063BD180052B5000052B5000052B5000052B5000052B5
      000052B5000052B5000052B5000052B500000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF005252FF0000000000000000009494FF001818
      FF000000000000000000FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF002929FF0000000000FFFEFD00FFDDA000FFC8
      6300FFDA8E00FFDB9000FFDC9200FFDD9500FFDD9700FFDE9900FFDE9B00FFDE
      9D00FFDF9F00FFDFA200FFDFA400FFD99500FFCF7A00FFCE7A00FFC76A00FFE5
      C0000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C001E1E1E002D2D
      2D009A9A9A001E1E1E0024242400F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E6E6E60000000000DEEFC6006BBD290052B5000052B5
      000052B500005AB508005AB508005AB50800ADDE8C0000000000CEE7B50052B5
      0000F7FFF700000000006BBD21005AB508005AB508005AB508005AB508005AB5
      08005AB508005AB508005AB508005AB508006363FF006363FF006363FF006363
      FF006363FF006363FF006363FF009494FF0000000000000000009494FF001818
      FF000000000000000000000000006363FF006363FF006363FF005A5AFF000808
      FF000000FF000808FF007B7BFF00F7F7FF00FFFEFD00FDE7C300FDBA5500FFDB
      9800FFDD9C00FFDE9E00FFDFA000FFDFA300FFE0A400FFE0A600FFE1A900FFE1
      AA00FFE2AD00FFE2AF00FFE2B000FFE2B200FED69300FDCB7A00FDD79E00FFFD
      FB000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5E5E500282828001111
      1100111111001111110070707000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E6E6E6000000000000000000FFFFF700ADDE840052B5
      080052B500000000000000000000000000000000000000000000CEE7B50052B5
      0000F7FFF7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009494FF001818
      FF00000000000000000000000000000000000000000000000000F7F7FF001818
      FF004242FF00CECEFF000000000000000000FFEDD200F8B45800FEDBA000FFDF
      A700FFE0A900FFE1AB00FFE2AD00FFE2AF00FFE3B100FFE3B300FFE4B500FFE4
      B600FFE4B800FEE5BA00FEE5BC00FDE5BE00FCE1B800F8B55100FDEFDD000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00AFAF
      AF00A4A4A400C4C4C400FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E6E6E60000000000000000000000000000000000E7F7
      DE0052B500000000000000000000000000000000000000000000CEE7B50052B5
      0000F7FFF7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009494FF001818
      FF00000000000000000000000000000000000000000000000000F7F7FF000000
      FF00FFFFFF00000000000000000000000000FFE5BF00FDC36400FFE3B500FFE3
      B400FFE3B500FFE4B700FFE4B900FFE5BB00FFE6BC00FEE6BE00FEE6C000FEE7
      C100FDE7C300FDE7C500FCE7C600FCE6C800FCE6CA00F8C98300F6BE7700FFFB
      F7000000000000000000000000000000000000000000FFFFFF00FFFFFF00EFEF
      EF00F7F7F700FFFFFF00FFFFFF00F7F7F700F7F7F700FFFFFF00FFFFFF00F8F8
      F800F7F7F700FFFFFF00FFFFFF00F3F3F300F5F5F500FFFFFF00FFFFFF00F8F8
      F800F8F8F800FFFFFF00E6E6E600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEE7B50052B5
      0000F7FFF7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009494FF001818
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFBF700FDD9A100FCC47100FBC8
      7D00FBD09200FCDCAD00FDE7C500FDE7C600FDE8C800FDE8C900FDE8CB00FCE8
      CC00FCE8CE00FCE9CF00FCE9D000FBE9D200FBE9D400F8DEC100F2B66900F1AE
      6000F8DBBF00FFF8F100FFFEFD000000000000000000FFFFFF00FFFFFF00BFBF
      BF00D1D1D100FFFFFF00FFFFFF00D5D5D500E3E3E300FFFFFF00FFFFFF00CECE
      CE00D9D9D900FFFFFF00FFFFFF00DADADA00E6E6E600FFFFFF00FFFFFF00D9D9
      D900D8D8D800FFFFFF00E6E6E600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEE7B50052B5
      0000F7FFF7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009494FF001818
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFE00FFFAF700FFF7
      ED00FCEAD200FBD8A800F7BC6F00FCE9D000FCE9D100FCEAD300FCEAD500FCEA
      D600FCEBD700FBEBD800FBEBDA00FAE7D400EFB47900F4C69700F6D3B000F1B9
      8000EC9F5300E58A3B00E9AD8100FFFAF50000000000EFE4C700EFE2C600EFE2
      C600EFE2C600EFE0C600EFE0C600EEDEC500EEDEC500EEDEC500EEDDC400EDDC
      C400EDDAC300EDDAC300ECD8C200ECD8C200ECD6C200ECD6C200ECD5C100EBD4
      C100EBD4C100EBD3C100D9C1AF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6EFBD0052B5
      0000FFFFF7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADFF003131
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFD00F6C79100FAE5CD00FCECDB00FCECDC00FCEDDD00FCED
      DE00FBEDDF00FBEEE100FBEEE200EFC09600FBE3CB00FFFEFD0000000000FFFB
      F700F0C6A300EAB99700D8753700F2D1BA0000000000EBCF5100EBCC5000EAC9
      4F00E9C64E00E8C24D00E7BE4B00E7C97900DEC38300E3B14600E3C28000DAB4
      7200DFA24100E2BF8B00D7A46000DB953C00D8A97300D98C3800D8883700D784
      3500D6813400D67E3300D47C3300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7F7
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9DDC100F6D5B700FCEFE300FCEFE400FCF0E500F6DC
      C600EEBC9200F6DCC700FCF1E900F0C6A300FAE8D70000000000000000000000
      0000FFFBF900EEC2A500E0997200FBEFE50000000000EDD36200ECD16100ECCE
      6000EBCB5F00EAC85E00E9C45C00E9C97600DECA9D00E6B85700E6D5B500E5D3
      B400E2AC5400E6D8C400E2C6A100DF9E4E00E2CBAF00DC964A00DC934A00DB90
      4800DA8D4700D98A460000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCF0E300ECB48500FBF2EA00F5DDCA00E9AB7A00F0BC
      8F00F8DEC700EFBE9500F0CBB100FAECE200EDBB9600FFFEFD00000000000000
      000000000000FFFEFD00FFFEFC000000000000000000F5E6A800F5E6A800F5E4
      A700F4E3A700F4E1A600F3DFA500EFE2C100E4DCC900F0D7A200EAE0CC00E9DD
      C600EFD1A000E9E1D400E9D5BB00ECCCA300E8DFD300E7C19800ECC39B00EBC0
      9A00EBC09A00EBBE9900E8BB9600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFCF900E9AB7C00E3955C00ECB58900FCEFE300FFFE
      FD0000000000FFFEFB00F6D6BF00E9B79C00DC8F6400FFFBF700000000000000
      00000000000000000000000000000000000000000000EAD89F00EAD69E00EAD6
      9E00E9D49D00E9D39D00E8D19D00E8CF9B00E7CE9B00E7CB9A00E6C99900E6C7
      9800E5C59700E5C39700E4C19600E4BF9500E3BD9400E3BB9400E2B89200E2B8
      9200E1B69200E1B59100E0B39000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000480000000100010000000000600300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFF1FFFFFFFFFFFFFF000000FFF03FFC
      0FFF800001000000FFF00FF00FFF800001000000FFF007E00FFF800001000000
      FFFC03C03FFF800001000000FFFF8181FFFF800001000000FFFFC183FFFF8000
      01000000FFFF2007FE7F800001000000FFFE200FF87F800001000000FFF8300F
      E0FF800001000000C7F0F00FC1E3800001000000C7F1F01FC7E3800001000000
      83F3F01FCFC180000100000001F3F00FCF8080000100000001F3F00FCF808000
      0100000001F3F00FCF80800001000000C3F3E007CF83800001000000C1F3C183
      CF07800001000000E0F381C1CE07800001000000E03E03C0100F800001000000
      F00007E0001F800001000000F8000FF8003F800001000000FE003FFE00FF8000
      01000000FFC0FFFFFFFFFFFFFF000000FFFFE1FFFFFFFFFFFFFFFFFFFFFFC180
      0001FFFFFFFFFFFFFFFFC1800001FFFFFFFFFFFFFF0383800001FFFFFFFFFFFF
      FC0007800001FFFFFFFFFFFFF0000F800001FFFFFFFFFFFFC0001F800001FFFF
      FFFFFFFF80001F800001FFFE7FFFFC7F80001F800001F7F87FFFF84FC0000F80
      0001C7F0FFFFE0C3C0000F80000180430000C001C0000780000100460000C400
      C0000780000100440000CC0080000F80000100440000CE0000000F80000187C7
      FFFFCFC300001F800001E7C7FFFFCFC700000F800001FFC7FFFFCFFF00000180
      0001FFC7FFFFCFFF800000800001FFC7FFFFCFFFF80020800001FFEFFFFFEFFF
      FC0070800003FFFFFFFFFFFFFC0039800001FFFFFFFFFFFFFC083F800001FFFF
      FFFFFFFFFE3C3FFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object TaskAction: TActionList [28]
    Images = TaskImageList24
    Left = 584
    Top = 544
    object TaskDatesResetAction: TAction
      Caption = '        Reset        '
      Hint = 'Reset Start and Stop/ETA dates to today date'
      ImageIndex = 1
      OnExecute = TaskDatesResetActionExecute
    end
    object TaskMoveEarlierAction: TAction
      Caption = '-7 days'
      Hint = 'Anticipate the task 7 days earlier'
      ImageIndex = 2
      OnExecute = TaskMoveEarlierActionExecute
    end
    object TaskMoveLaterAction: TAction
      Caption = '+7 days'
      Hint = 'Posticipate the task 7 days later'
      ImageIndex = 3
      OnExecute = TaskMoveLaterActionExecute
    end
    object TaskStartEarlierAction: TAction
      Caption = 'Start Earlier '
      ImageIndex = 4
      OnExecute = TaskStartEarlierActionExecute
    end
    object TaskStartLaterAction: TAction
      Caption = 'Start Later'
      ImageIndex = 5
      OnExecute = TaskStartLaterActionExecute
    end
    object TaskEtaEarlierAction: TAction
      Caption = 'ETA Earlier'
      ImageIndex = 4
      OnExecute = TaskEtaEarlierActionExecute
    end
    object TaskEtaLaterAction: TAction
      Caption = 'ETA Later'
      ImageIndex = 5
      OnExecute = TaskEtaLaterActionExecute
    end
    object TaskParentsUpdateAction: TAction
      Caption = 'Update'
      Hint = 
        'Update all action "parents actions" up to level indicated in Opt' +
        'ions Task'
      ImageIndex = 7
      OnExecute = TaskParentsUpdateActionExecute
    end
  end
end
