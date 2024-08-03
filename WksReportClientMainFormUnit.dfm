inherited ReportMainForm: TReportMainForm
  Caption = 'ReportMainForm'
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
    ExplicitWidth = 1182
    inherited TopPageControl: TPageControl
      ExplicitWidth = 810
      object ReportTabSheet: TTabSheet
        Caption = 'Report'
        ImageIndex = 2
        object ReportToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 51
          Height = 44
          Align = alLeft
          AutoSize = True
          ButtonHeight = 46
          ButtonWidth = 51
          Caption = 'ReportToolBar'
          Images = ReportImageList24
          ShowCaptions = True
          TabOrder = 0
          object ReportTestToolButton: TToolButton
            Left = 0
            Top = 0
            Action = ReportTestAction
          end
        end
      end
    end
    inherited TopPageControl3: TPageControl
      ExplicitLeft = 882
    end
    inherited TopPageControl2: TPageControl
      ExplicitLeft = 810
    end
  end
  inherited LeftPanel: TPanel
    ExplicitHeight = 588
    inherited LeftPageControl: TPageControl
      ExplicitHeight = 588
      inherited ObjectTreeTabSheet: TTabSheet
        inherited ObjectNodeInfoLabel: TLabel
          Top = 544
          Width = 292
        end
        inherited ObjectDTClientTree: TDTClientTree
          Height = 519
          ExplicitHeight = 519
        end
        inherited ObjectDBNavigator: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited BottomPanel: TPanel
    ExplicitTop = 675
    ExplicitWidth = 1182
    inherited LogFrame: TLogFrame
      ExplicitWidth = 1182
      inherited LogPageControl: TPageControl
        ExplicitWidth = 1182
        inherited OutputTabSheet: TTabSheet
          inherited OutputRichEdit: TRichEdit
            ExplicitWidth = 1172
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
    ExplicitLeft = 885
    ExplicitHeight = 588
    inherited RightPageControl: TPageControl
      ExplicitHeight = 588
      inherited PropertyTabSheet: TTabSheet
        inherited ObjectJvScrollMax: TJvScrollMax
          ExplicitHeight = 558
          inherited ObjectToJvScrollMaxBand: TJvScrollMaxBand
            inherited ObjectJobGradeMinDBComboBox: TDBComboBox
              ExplicitTop = 298
            end
          end
          inherited ObjectImageJvScrollMaxBand: TJvScrollMaxBand
            inherited ObjectImageDBImage: TDBImage
              Height = 0
            end
          end
          inherited ObjectTypeJvScrollMaxBand: TJvScrollMaxBand
            inherited ObjectContentKindDBComboBox: TDBComboBox
              ExplicitTop = 103
            end
            inherited ObjectKindDBComboBox: TDBComboBox
              ExplicitTop = 48
            end
            inherited ObjectDataKindDBComboBox: TDBComboBox
              ExplicitTop = 158
            end
          end
          inherited ObjectGeneralJvScrollMaxBand: TJvScrollMaxBand
            inherited ObjectStateDBComboBox: TDBComboBox
              ExplicitTop = 43
            end
          end
          object ReportJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Report'
            ExpandedHeight = 616
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object ReportObjectIdLabel: TLabel
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
            object ReportExportLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 103
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Export'
              ExplicitWidth = 34
            end
            object ReportSourceLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 153
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Source'
              ExplicitWidth = 36
            end
            object ReportStoreLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 203
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Store'
              ExplicitWidth = 27
            end
            object ReportEnvironmentLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 253
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Environment'
              ExplicitWidth = 68
            end
            object ReportValidatorCsvLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 303
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Validator (csv)'
              ExplicitWidth = 74
            end
            object ReportViewerCsvLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 353
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Viewer (csv)'
              ExplicitWidth = 63
            end
            object ReportLinkLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 403
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Link'
              ExplicitWidth = 22
            end
            object ReportAliasLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 453
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Alias'
              ExplicitWidth = 25
            end
            object ReportClassLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 503
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Class'
              ExplicitWidth = 27
            end
            object ReportStyleLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 553
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Style'
              ExplicitWidth = 25
            end
            object ReportObjectIdDBEdit: TDBEdit
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
              DataSource = ReportDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
            end
            object ReportDBNavigator: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 275
              Height = 25
              DataSource = ReportDataSource
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alTop
              Flat = True
              TabOrder = 1
            end
            object ReportExportDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 124
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldExport'
              DataSource = ReportDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
            object ReportSourceDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 174
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldSource'
              DataSource = ReportDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object ReportStoreDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 224
              Width = 249
              Height = 23
              Hint = 'Page'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldStore'
              DataSource = ReportDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
            end
            object ReportEnvironmentDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 274
              Width = 249
              Height = 23
              Hint = 'Page'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldEnvironment'
              DataSource = ReportDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
            end
            object ReportValidatorCsvDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 324
              Width = 249
              Height = 23
              Hint = 'Page'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldValidatorCsv'
              DataSource = ReportDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
            end
            object ReportViewerCsvDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 374
              Width = 249
              Height = 23
              Hint = 'Page'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldViewerCsv'
              DataSource = ReportDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
            end
            object ReportLinkDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 424
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldLink'
              DataSource = ReportDataSource
              TabOrder = 8
            end
            object ReportAliasDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 474
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldAlias'
              DataSource = ReportDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
            end
            object ReportClassDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 524
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldClass'
              DataSource = ReportDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 10
            end
            object ReportStyleDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 574
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldStyle'
              DataSource = ReportDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 11
            end
          end
          object ReportFlagsJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Flags'
            ExpandedHeight = 255
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object ReportReportTitleOnDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 35
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Report Title Show'
              DataField = 'FldReportTitleOn'
              DataSource = ReportDataSource
              TabOrder = 0
            end
            object ReportReportPanelOnDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 58
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Report Panel Show'
              DataField = 'FldReportPanelOn'
              DataSource = ReportDataSource
              TabOrder = 1
            end
            object ReportReportPanelClosedDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 81
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Report Panel Closed'
              DataField = 'FldReportPanelClosed'
              DataSource = ReportDataSource
              TabOrder = 2
            end
            object ReportParamsTitleDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 117
              Width = 249
              Height = 17
              Hint = 'Show or hide the title of "Params" panel'
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Params Title Show'
              DataField = 'FldParamsTitleOn'
              DataSource = ReportDataSource
              TabOrder = 3
            end
            object ReportParamsPanelOnDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 140
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Params Panel Show'
              DataField = 'FldParamsPanelOn'
              DataSource = ReportDataSource
              TabOrder = 4
            end
            object ReportParamsPanelClosedDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 163
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Params Panel Closed'
              DataField = 'FldParamsPanelClosed'
              DataSource = ReportDataSource
              TabOrder = 5
              ExplicitLeft = 15
              ExplicitTop = 157
            end
            object ReportDsHeaderOffDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 199
              Width = 249
              Height = 17
              Hint = 'Hide the header table that renders the dataset'
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Dataset header hide'
              DataField = 'FldDsHeaderOff'
              DataSource = ReportDataSource
              TabOrder = 6
              ExplicitLeft = 32
              ExplicitTop = 235
            end
            object ReportDsRecordCountOffDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 222
              Width = 249
              Height = 17
              Hint = 'Hide the records  count for the dataset'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Dataset records count hide'
              DataField = 'FldDsRecordCountOff'
              DataSource = ReportDataSource
              TabOrder = 7
              ExplicitLeft = 32
            end
          end
          object ReportParamJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Param'
            ExpandedHeight = 798
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object ReportParamLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 122
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Param'
              ExplicitWidth = 34
            end
            object ReportParamStateLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 72
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'State'
              ExplicitWidth = 26
            end
            object ReportParamOrderLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 22
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Order'
              ExplicitWidth = 30
            end
            object ReportParamDefaultCsvLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 172
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Default (csv)'
              ExplicitWidth = 66
            end
            object ReportParamCaptionLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 222
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Caption'
              ExplicitWidth = 42
            end
            object ReportParamDescriptionLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 322
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Description'
              ExplicitWidth = 60
            end
            object ReportParamKindLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 472
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Kind'
              ExplicitWidth = 24
            end
            object ReportParamHelpLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 372
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Help'
              ExplicitWidth = 25
            end
            object ReportParamPlaceholderLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 272
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Placeholder'
              ExplicitWidth = 62
            end
            object ReportParamClassLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 522
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Class'
              ExplicitWidth = 27
            end
            object ReportParamStyleLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 572
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Style'
              ExplicitWidth = 25
            end
            object ReportParamLineGrid12Label: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 622
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Line N/12'
              ExplicitWidth = 51
            end
            object ReportParamEnvLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 422
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Environment'
              ExplicitWidth = 68
            end
            object ReportParamDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 143
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldParam'
              DataSource = ParamDataSource
              TabOrder = 0
            end
            object ReportParamStateDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 93
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldState'
              DataSource = ParamDataSource
              Items.Strings = (
                ''
                'Active'
                'Inactive'
                'Testing')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object ReportParamOrderDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 43
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldOrder'
              DataSource = ParamDataSource
              TabOrder = 2
            end
            object ReportParamDefaultCsvDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 193
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldDefault'
              DataSource = ParamDataSource
              TabOrder = 3
            end
            object ReportParamCaptionDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 243
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldCaption'
              DataSource = ParamDataSource
              TabOrder = 4
            end
            object ReportParamDescriptionDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 343
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldDescription'
              DataSource = ParamDataSource
              TabOrder = 5
            end
            object ReportParamKindDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 493
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldKind'
              DataSource = ParamDataSource
              DropDownCount = 16
              Items.Strings = (
                ''
                'Button'
                'Caption'
                'Checkbox'
                'Checkboxes'
                'Email'
                'File'
                'Hidden'
                'Password'
                'Radio'
                'Radios'
                'Select'
                'Submit'
                'Text'
                'TextArea'
                '')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
            end
            object ReportParamRequiredDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 695
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Required'
              DataField = 'FldRequired'
              DataSource = ParamDataSource
              TabOrder = 7
            end
            object ReportParamDisabledDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 718
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Disabled'
              DataField = 'FldDisabled'
              DataSource = ParamDataSource
              TabOrder = 8
            end
            object ReportParamHiddenDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 672
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Hidden'
              DataField = 'FldHidden'
              DataSource = ParamDataSource
              TabOrder = 9
            end
            object ReportParamHelpDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 393
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldHelp'
              DataSource = ParamDataSource
              TabOrder = 10
            end
            object ReportParamPlaceholderDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 293
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldPlaceholder'
              DataSource = ParamDataSource
              TabOrder = 11
            end
            object ReportParamClassDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 543
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldClass'
              DataSource = ParamDataSource
              TabOrder = 12
            end
            object ReportParamStyleDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 593
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldStyle'
              DataSource = ParamDataSource
              TabOrder = 13
            end
            object ReportParamLineGrid12DBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 643
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldLineGrid12'
              DataSource = ParamDataSource
              DropDownCount = 16
              Items.Strings = (
                ''
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9'
                '10'
                '11'
                '12')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 14
            end
            object ReportParamEnvDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 443
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldEnv'
              DataSource = ParamDataSource
              DropDownCount = 16
              Items.Strings = (
                ''
                'Dev'
                'Test'
                'Prod')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 15
            end
            object ReportParamFromQueryDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 741
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'From query string'
              DataField = 'FldFromQuery'
              DataSource = ParamDataSource
              TabOrder = 16
            end
            object ReportFromContentDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 764
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'From content'
              DataField = 'FldFromContent'
              DataSource = ParamDataSource
              TabOrder = 17
            end
          end
          object ReportDatasetJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Dataset'
            ExpandedHeight = 890
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object ReportDatasetLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 122
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Dataset'
              ExplicitWidth = 39
            end
            object ReportDatasetStateLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 72
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'State'
              ExplicitWidth = 26
            end
            object ReportDatasetOrderLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 22
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Order'
              ExplicitWidth = 30
            end
            object ReportDatasetViewerCsvLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 472
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Viewer (csv)'
              Layout = tlCenter
              ExplicitWidth = 63
            end
            object ReportDatasetEditorCsvLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 522
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Editor (csv)'
              Layout = tlCenter
              ExplicitWidth = 59
            end
            object ReportDatasetLanguageLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 372
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Language (for query)'
              ExplicitWidth = 111
            end
            object ReportDatasetConnStrLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 272
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Connection String'
              Layout = tlCenter
              ExplicitWidth = 96
            end
            object ReportDatasetMaxRecordsLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 422
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Max Records'
              Layout = tlCenter
              ExplicitWidth = 68
            end
            object ReportDatasetDescriptionLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 222
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Description'
              ExplicitWidth = 60
            end
            object ReportDatasetTitleLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 172
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Title (or csv if dataset has sub-records)'
              ExplicitWidth = 202
            end
            object ReportDatasetConnLibLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 322
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Connection Library (ADO, FD)'
              Layout = tlCenter
              ExplicitWidth = 157
            end
            object ReportDatasetTimeoutSecLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 572
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Timeout (seconds)'
              Layout = tlCenter
              ExplicitWidth = 98
            end
            object ReportDatasetSwitchLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 722
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Switch'
              Layout = tlCenter
              ExplicitWidth = 35
            end
            object ReportDatasetClassLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 622
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Class'
              ExplicitWidth = 27
            end
            object ReportDatasetStyleLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 672
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Style'
              ExplicitWidth = 25
            end
            object ReportDatasetDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 143
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldDataset'
              DataSource = DatasetDataSource
              TabOrder = 0
            end
            object ReportDatasetStateDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 93
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldState'
              DataSource = DatasetDataSource
              Items.Strings = (
                ''
                'Active'
                'Inactive'
                'Testing')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object ReportDatasetOrderDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 43
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldOrder'
              DataSource = DatasetDataSource
              TabOrder = 2
            end
            object ReportDatasetViewerCsvDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 493
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldViewerCsv'
              DataSource = DatasetDataSource
              TabOrder = 3
            end
            object ReportDatasetEditorCsvDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 543
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldEditorCsv'
              DataSource = DatasetDataSource
              TabOrder = 4
            end
            object ReportDatasetLanguageDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 393
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldLanguage'
              DataSource = DatasetDataSource
              Items.Strings = (
                ''
                'Sql'
                'Mql')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
            end
            object ReportDatasetConnStrDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 293
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldConnStr'
              DataSource = DatasetDataSource
              TabOrder = 6
            end
            object ReportDatasetMaxRecordsDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 443
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldMaxRecords'
              DataSource = DatasetDataSource
              TabOrder = 7
            end
            object ReportDatasetDescriptionDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 243
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldDescription'
              DataSource = DatasetDataSource
              TabOrder = 8
            end
            object ReportDatasetTitleDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 193
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldTitle'
              DataSource = DatasetDataSource
              TabOrder = 9
            end
            object ReportDatasetConnLibDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 343
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldConnLib'
              DataSource = DatasetDataSource
              Items.Strings = (
                ''
                'ADO'
                'FD')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 10
            end
            object ReportDatasetTimeoutSecDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 593
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldTimeoutSec'
              DataSource = DatasetDataSource
              TabOrder = 11
            end
            object ReportDatasetEditableDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 777
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Dataset Editable'
              DataField = 'FldEditable'
              DataSource = DatasetDataSource
              TabOrder = 12
            end
            object ReportDatasetSwitchDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 743
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldSwitch'
              DataSource = DatasetDataSource
              TabOrder = 13
            end
            object ReportDatasetClassDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 643
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldClass'
              DataSource = DatasetDataSource
              TabOrder = 14
            end
            object ReportDatasetStyleDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 693
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldStyle'
              DataSource = DatasetDataSource
              TabOrder = 15
            end
            object ReportDatasetPanelClosedDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 856
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Dataset Panel Closed'
              DataField = 'FldPanelClosed'
              DataSource = DatasetDataSource
              TabOrder = 16
            end
            object ReportDatasetPanelOnDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 833
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Dataset Panel Show'
              DataField = 'FldPanelOn'
              DataSource = DatasetDataSource
              TabOrder = 17
            end
            object ReportDatasetTitleOnDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 810
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Dataset Title Show'
              DataField = 'FldTitleOn'
              DataSource = DatasetDataSource
              TabOrder = 18
            end
          end
          object ReportChartJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Chart'
            ExpandedHeight = 656
            ButtonFont.Charset = DEFAULT_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Tahoma'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object ReportChartChartLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 22
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Chart'
              ExplicitWidth = 29
            end
            object ReportChartStateLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 72
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'State'
              ExplicitWidth = 26
            end
            object ReportChartTitleLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 172
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Title'
              ExplicitWidth = 22
            end
            object ReportChartDescriptionLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 222
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Description'
              ExplicitWidth = 60
            end
            object ReportChartWidthLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 272
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Width'
              Layout = tlCenter
              ExplicitWidth = 32
            end
            object ReportChartHeightLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 322
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Height'
              Layout = tlCenter
              ExplicitWidth = 36
            end
            object ReportChartXCaptionLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 372
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'X Caption'
              Layout = tlCenter
              ExplicitWidth = 52
            end
            object ReportChartYCaptionLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 422
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Y Caption'
              Layout = tlCenter
              ExplicitWidth = 52
            end
            object ReportChartXLabelAngleDegLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 472
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'X Label Angle Deg'
              Layout = tlCenter
              ExplicitWidth = 96
            end
            object ReportChartYLabelAngleDegLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 522
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Y Label Angle Deg'
              Layout = tlCenter
              ExplicitWidth = 96
            end
            object ReportChartOrderLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 122
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Order'
              ExplicitWidth = 30
            end
            object ReportChartChartDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 43
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldChart'
              DataSource = ChartDataSource
              TabOrder = 0
            end
            object ReportChartStateDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 93
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldState'
              DataSource = ChartDataSource
              Items.Strings = (
                ''
                'Active'
                'Inactive'
                'Testing')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object ReportChartTitleDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 193
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldTitle'
              DataSource = ChartDataSource
              TabOrder = 2
            end
            object ReportChartDescriptionDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 243
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldDescription'
              DataSource = ChartDataSource
              TabOrder = 3
            end
            object ReportChartWidthDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 293
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldWidth'
              DataSource = ChartDataSource
              TabOrder = 4
            end
            object ReportChartHeightDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 343
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldHeight'
              DataSource = ChartDataSource
              TabOrder = 5
            end
            object ReportChartXCaptionDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 393
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldXCaption'
              DataSource = ChartDataSource
              TabOrder = 6
            end
            object ReportChartYCaptionDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 443
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldYCaption'
              DataSource = ChartDataSource
              TabOrder = 7
            end
            object ReportChartXLabelAngleDegDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 493
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldXLabelAngleDeg'
              DataSource = ChartDataSource
              TabOrder = 8
            end
            object ReportChartYLabelAngleDegDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 543
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldYLabelAngleDeg'
              DataSource = ChartDataSource
              TabOrder = 9
            end
            object ReportChartOrderDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 143
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldOrder'
              DataSource = ChartDataSource
              TabOrder = 10
            end
            object ReportChartPanelOnDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 600
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Chart Panel On'
              DataField = 'FldPanelOn'
              DataSource = ChartDataSource
              TabOrder = 11
            end
            object ReportChartPanelClosedDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 623
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Chart Panel Closed'
              DataField = 'FldPanelClosed'
              DataSource = ChartDataSource
              TabOrder = 12
            end
            object ReportChartTitleOnDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 577
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Chart Title On'
              DataField = 'FldTitleOn'
              DataSource = ChartDataSource
              TabOrder = 13
            end
          end
        end
      end
      inherited SearchTabSheet: TTabSheet
        inherited SearchResultListBox: TListBox
          ExplicitHeight = 422
        end
      end
      inherited OptionTabSheet: TTabSheet
        inherited OptionJvScrollMax: TJvScrollMax
          ExplicitHeight = 559
        end
      end
    end
  end
  inherited StatusBar: TStatusBar
    ExplicitTop = 815
    ExplicitWidth = 1182
  end
  inherited MainPanel: TPanel
    ExplicitHeight = 588
    inherited MainPageControl: TPageControl
      ExplicitHeight = 588
      inherited ContentPrevTabSheet: TTabSheet
        inherited ObjectContentPrevDBSynEdit: TDBSynEdit
          Height = 531
          ExplicitHeight = 531
        end
      end
      inherited ContentTabSheet: TTabSheet
        inherited ObjectContentDBSynEdit: TDBSynEdit
          Height = 529
          ExplicitTop = 30
          ExplicitHeight = 528
        end
        inherited ObjectContentTopPanel: TPanel
          inherited ObjectContentCharCountLabel: TLabel
            Height = 24
          end
          inherited ObjectDBEdit: TDBEdit
            ExplicitHeight = 24
          end
        end
      end
      inherited JsonTabSheet: TTabSheet
        inherited ObjectDataDBSynEdit: TDBSynEdit
          Height = 529
          ExplicitTop = 30
          ExplicitHeight = 529
        end
        inherited ObjectDataTopPanel: TPanel
          inherited ObjectDataCharCountLabel: TLabel
            Height = 24
          end
        end
      end
      inherited NoteTabSheet: TTabSheet
        inherited ObjectNoteDBSynEdit: TDBSynEdit
          Height = 529
          ExplicitTop = 30
          ExplicitHeight = 529
        end
      end
      object ReportParamTabSheet: TTabSheet
        Caption = 'Params'
        ImageIndex = 4
        object ReportParamSplitter3: TSplitter
          AlignWithMargins = True
          Left = 8
          Top = 322
          Width = 506
          Height = 3
          Cursor = crVSplit
          Margins.Left = 8
          Margins.Right = 8
          Align = alBottom
          ExplicitTop = 358
          ExplicitWidth = 528
        end
        object ReportParamSplitter2: TSplitter
          AlignWithMargins = True
          Left = 8
          Top = 205
          Width = 506
          Height = 3
          Cursor = crVSplit
          Margins.Left = 8
          Margins.Right = 8
          Align = alBottom
          ExplicitTop = 41
          ExplicitWidth = 528
        end
        object ReportParamSplitter: TSplitter
          AlignWithMargins = True
          Left = 8
          Top = 88
          Width = 506
          Height = 3
          Cursor = crVSplit
          Margins.Left = 8
          Margins.Right = 8
          Align = alBottom
          ExplicitTop = 41
          ExplicitWidth = 528
        end
        object ReportParamTopPanel: TPanel
          AlignWithMargins = True
          Left = 8
          Top = 8
          Width = 506
          Height = 74
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Align = alClient
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 0
          object ReportParamParamsLabel: TLabel
            Left = 259
            Top = 7
            Width = 43
            Height = 13
            Caption = 'Params'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object ReportParamDBNavigator: TDBNavigator
            AlignWithMargins = True
            Left = 0
            Top = 3
            Width = 240
            Height = 21
            Margins.Left = 0
            DataSource = ParamDataSource
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
            TabOrder = 0
          end
          object ReportParamDBGrid: TDBGrid
            AlignWithMargins = True
            Left = 3
            Top = 32
            Width = 500
            Height = 39
            Margins.Top = 32
            Align = alClient
            DataSource = ParamDataSource
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        object ReportParamOptionQueryPanel: TPanel
          AlignWithMargins = True
          Left = 8
          Top = 331
          Width = 506
          Height = 225
          Margins.Left = 8
          Margins.Right = 8
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'ReportParamOptionQueryPanel'
          ShowCaption = False
          TabOrder = 1
          object ReportParamOptionQueryLabel: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 500
            Height = 15
            Align = alTop
            Caption = 
              'Options Query (option Value and Caption can be different: select' +
              ' Fld1 as FldValue, Fld2 as FldCaption from ...)'
            ExplicitWidth = 574
          end
          object ReportParamOptionQueryConnStrLabel: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 178
            Width = 500
            Height = 15
            Align = alBottom
            Caption = 'Option Query Connection String (explicit or Source Id)'
            ExplicitWidth = 286
          end
          object ReportParamOptionQueryDBSynEdit: TDBSynEdit
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 500
            Height = 148
            Cursor = crIBeam
            DataField = 'FldOptionQuery'
            DataSource = ParamDataSource
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
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
            Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
            SelectedColor.Alpha = 0.400000005960464500
            TabWidth = 3
            WantTabs = True
          end
          object ReportParamOptionQueryConnStrDBEdit: TDBEdit
            AlignWithMargins = True
            Left = 3
            Top = 199
            Width = 500
            Height = 23
            Align = alBottom
            DataField = 'FldConnStr'
            DataSource = ParamDataSource
            TabOrder = 1
          end
        end
        object ReportParamOptionJsonPanel: TPanel
          AlignWithMargins = True
          Left = 8
          Top = 214
          Width = 506
          Height = 102
          Margins.Left = 8
          Margins.Right = 8
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'ReportParamOptionJsonPanel'
          ShowCaption = False
          TabOrder = 2
          object ReportParamOptionJsonLabel: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 500
            Height = 15
            Align = alTop
            Caption = 
              'Options Json (option Value and Caption can be different: {"value' +
              '": "caption", "value2": "caption2", ...})'
            ExplicitWidth = 534
          end
          object ReportParamOptionJsonDBSynEdit: TDBSynEdit
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 500
            Height = 75
            Cursor = crIBeam
            DataField = 'FldOptionJson'
            DataSource = ParamDataSource
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
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
            Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
            SelectedColor.Alpha = 0.400000005960464500
            TabWidth = 3
            WantTabs = True
          end
        end
        object ReportParamOptionCsvPanel: TPanel
          AlignWithMargins = True
          Left = 8
          Top = 97
          Width = 506
          Height = 102
          Margins.Left = 8
          Margins.Right = 8
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'ReportParamOptionCsvPanel'
          ShowCaption = False
          TabOrder = 3
          object ReportParamOptionCsvLabel: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 500
            Height = 15
            Align = alTop
            Caption = 'Options Csv (option Value and Caption will be the same)'
            ExplicitWidth = 297
          end
          object ReportParamOptionCsvDBSynEdit: TDBSynEdit
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 500
            Height = 75
            Cursor = crIBeam
            DataField = 'FldOptionCsv'
            DataSource = ParamDataSource
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Pitch = fpFixed
            Font.Style = []
            Font.Quality = fqClearTypeNatural
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
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
            Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
            SelectedColor.Alpha = 0.400000005960464500
            TabWidth = 3
            WantTabs = True
          end
        end
      end
      object ReportDatasetTabSheet: TTabSheet
        Caption = 'Datasets'
        ImageIndex = 5
        object ReportDatasetSplitter: TSplitter
          AlignWithMargins = True
          Left = 8
          Top = 88
          Width = 506
          Height = 3
          Cursor = crVSplit
          Margins.Left = 8
          Margins.Right = 8
          Align = alBottom
          ExplicitTop = 203
          ExplicitWidth = 528
        end
        object ReportDatasetTopPanel: TPanel
          AlignWithMargins = True
          Left = 8
          Top = 8
          Width = 506
          Height = 74
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Align = alClient
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 0
          object ReportDatasetDatasetsLabel: TLabel
            Left = 259
            Top = 7
            Width = 51
            Height = 13
            Caption = 'Datasets'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object ReportDatasetDBNavigator: TDBNavigator
            AlignWithMargins = True
            Left = 0
            Top = 3
            Width = 240
            Height = 21
            Margins.Left = 0
            DataSource = DatasetDataSource
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
            TabOrder = 0
          end
          object ReportDatasetDBGrid: TDBGrid
            AlignWithMargins = True
            Left = 3
            Top = 32
            Width = 500
            Height = 39
            Margins.Top = 32
            Align = alClient
            DataSource = DatasetDataSource
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        object DatasetAndChartPageControl: TPageControl
          AlignWithMargins = True
          Left = 8
          Top = 97
          Width = 506
          Height = 454
          Margins.Left = 8
          Margins.Right = 8
          Margins.Bottom = 8
          ActivePage = ReportDatasetSelectTabSheet
          Align = alBottom
          TabOrder = 1
          object ReportDatasetSelectTabSheet: TTabSheet
            Caption = 'Select'
            object ReportDatasetSelectDBSynEdit: TDBSynEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 492
              Height = 418
              Cursor = crIBeam
              DataField = 'FldSelect'
              DataSource = DatasetDataSource
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Pitch = fpFixed
              Font.Style = []
              Font.Quality = fqClearTypeNatural
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              Gutter.Font.Charset = DEFAULT_CHARSET
              Gutter.Font.Color = clWindowText
              Gutter.Font.Height = -11
              Gutter.Font.Name = 'Courier New'
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
              Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
              SelectedColor.Alpha = 0.400000005960464500
              TabWidth = 3
              WantTabs = True
            end
          end
          object ReportDatasetInsertTabSheet: TTabSheet
            Caption = 'Insert'
            ImageIndex = 3
            object ReportDatasetInsertDBSynEdit: TDBSynEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 492
              Height = 418
              Cursor = crIBeam
              DataField = 'FldInsert'
              DataSource = DatasetDataSource
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Pitch = fpFixed
              Font.Style = []
              Font.Quality = fqClearTypeNatural
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              Gutter.Font.Charset = DEFAULT_CHARSET
              Gutter.Font.Color = clWindowText
              Gutter.Font.Height = -11
              Gutter.Font.Name = 'Courier New'
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
              Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
              SelectedColor.Alpha = 0.400000005960464500
              TabWidth = 3
              WantTabs = True
            end
          end
          object ReportDatasetUpdateTabSheet: TTabSheet
            Caption = 'Update'
            ImageIndex = 4
            object ReportDatasetUpdateDBSynEdit: TDBSynEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 492
              Height = 418
              Cursor = crIBeam
              DataField = 'FldUpdate'
              DataSource = DatasetDataSource
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Pitch = fpFixed
              Font.Style = []
              Font.Quality = fqClearTypeNatural
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              Gutter.Font.Charset = DEFAULT_CHARSET
              Gutter.Font.Color = clWindowText
              Gutter.Font.Height = -11
              Gutter.Font.Name = 'Courier New'
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
              Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
              SelectedColor.Alpha = 0.400000005960464500
              TabWidth = 3
              WantTabs = True
            end
          end
          object ReportDatasetDeleteTabSheet: TTabSheet
            Caption = 'Delete'
            ImageIndex = 5
            object ReportDatasetDeleteDBSynEdit: TDBSynEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 492
              Height = 418
              Cursor = crIBeam
              DataField = 'FldDelete'
              DataSource = DatasetDataSource
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Pitch = fpFixed
              Font.Style = []
              Font.Quality = fqClearTypeNatural
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              Gutter.Font.Charset = DEFAULT_CHARSET
              Gutter.Font.Color = clWindowText
              Gutter.Font.Height = -11
              Gutter.Font.Name = 'Courier New'
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
              Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
              SelectedColor.Alpha = 0.400000005960464500
              TabWidth = 3
              WantTabs = True
            end
          end
          object ReportDatasetJsonTabSheet: TTabSheet
            Caption = ' Json'
            ImageIndex = 6
            object ReportDatasetJsonValidateLabel: TLabel
              AlignWithMargins = True
              Left = 53
              Top = 3
              Width = 38
              Height = 13
              Caption = 'Validate'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ReportDatasetJsonValidateLabelClick
            end
            object ReportDatasetJsonTemplateLabel: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 44
              Height = 13
              Caption = 'Template'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ReportDatasetJsonTemplateLabelClick
            end
            object ReportDatasetJsonDBSynEdit: TDBSynEdit
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 492
              Height = 399
              Cursor = crIBeam
              Margins.Top = 22
              DataField = 'FldJson'
              DataSource = DatasetDataSource
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Pitch = fpFixed
              Font.Style = []
              Font.Quality = fqClearTypeNatural
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              Gutter.Font.Charset = DEFAULT_CHARSET
              Gutter.Font.Color = clWindowText
              Gutter.Font.Height = -11
              Gutter.Font.Name = 'Courier New'
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
              Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoHideShowScrollbars, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
              SelectedColor.Alpha = 0.400000005960464500
              TabWidth = 3
              WantTabs = True
            end
          end
          object ReportChartTabSheet: TTabSheet
            Caption = 'Charts'
            ImageIndex = 6
            object ReportChartSplitter: TSplitter
              AlignWithMargins = True
              Left = 3
              Top = 168
              Width = 492
              Height = 3
              Cursor = crVSplit
              Align = alTop
              ExplicitLeft = 8
              ExplicitTop = 150
              ExplicitWidth = 459
            end
            object ReportChartTopPanel: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 492
              Height = 27
              Align = alTop
              BevelOuter = bvNone
              ShowCaption = False
              TabOrder = 0
              object ReportChartLabel: TLabel
                Left = 256
                Top = 7
                Width = 37
                Height = 13
                Caption = 'Charts'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ReportChartDBNavigator: TDBNavigator
                AlignWithMargins = True
                Left = 0
                Top = 3
                Width = 240
                Height = 21
                Margins.Left = 0
                DataSource = ChartDataSource
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
                Align = alLeft
                TabOrder = 0
              end
            end
            object ReportChartDBGrid: TDBGrid
              AlignWithMargins = True
              Left = 3
              Top = 36
              Width = 492
              Height = 126
              Align = alTop
              DataSource = ChartDataSource
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
            end
            object ReportSeriePanel: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 177
              Width = 492
              Height = 27
              Align = alTop
              BevelOuter = bvNone
              ShowCaption = False
              TabOrder = 2
              object ReportSerieLabel2: TLabel
                Left = 256
                Top = 7
                Width = 35
                Height = 13
                Caption = 'Series'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ReportSerieDBNavigator: TDBNavigator
                AlignWithMargins = True
                Left = 0
                Top = 3
                Width = 240
                Height = 21
                Margins.Left = 0
                DataSource = SerieDataSource
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
                Align = alLeft
                TabOrder = 0
              end
            end
            object ReportSerieDBGrid: TDBGrid
              AlignWithMargins = True
              Left = 3
              Top = 210
              Width = 492
              Height = 211
              Align = alClient
              DataSource = SerieDataSource
              TabOrder = 3
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
            end
          end
        end
      end
    end
  end
  object ReportClientDataSet: TClientDataSet [15]
    Aggregates = <>
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    PacketRecords = 0
    Params = <>
    ProviderName = 'ReportDataSetProvider'
    RemoteServer = MainSoapConnection
    AfterInsert = ReportClientDataSetAfterInsert
    AfterPost = ReportClientDataSetAfterPost
    AfterDelete = ReportClientDataSetAfterDelete
    OnReconcileError = ReportClientDataSetReconcileError
    Left = 72
    Top = 432
  end
  object ReportDataSource: TDataSource [16]
    DataSet = ReportClientDataSet
    Left = 208
    Top = 432
  end
  object ReportImageList24: TImageList [27]
    ColorDepth = cd32Bit
    Height = 24
    Width = 24
    Left = 360
    Top = 376
    Bitmap = {
      494C010101000800040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
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
      9100FFD56900FFDB6E00FFFBF900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFAF700FFF1C400FFE77600FFE24900FFE03D00FFE0
      3D00FFE04A00FFE37700FFF0CB00FFF7EF00FFEFCD00FFDB5B00FFDF7200FFF4
      DE00FFFEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFE00FFF8E600FFE37200FFDE4100FFE45E00FFE56500FFE46200FFE2
      6200FFE26500FFE16200FFDB4B00FFD84B00FFDB5600FFD95900FFEAB600FFFE
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFEFD00FFF9
      F200FFECB800FFD84700FFDD5600FFE05500FFDC3E00FFDA3E00FFD93E00FFD8
      3D00FFD73C00FFD53C00FFD84E00FFD95800FFD24300FFD25000FFFBF5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFEFB00FFE69B00FFCB
      4300FFCF4200FFDB5F00FFDB4C00FFDA4700FFD94700FFD84600FFD74600FFD6
      4600FFD54500FFD44500FFD24400FFD04300FFCF4300FFD66C00FFFCF9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFDFB00FFDB7400FFDA
      6600FFDA5A00FFD85100FFD85100FFD85100FFD75000FFD64F00FFD64F00FFD5
      4E00FFD44E00FFD24D00FFD14D00FFCF4C00FFCE4B00FFCB4800FFF5E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFECC000FFD4
      5000FFD75A00FFD75A00FFD75A00FFD75A00FFD75A00FFD65C00FFD65D00FFD4
      5A00FFD25600FFD15600FFD05500FFCF5500FFCD5400FFCE5600FFD68000FFFD
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF8F100FFCF
      4D00FFD66200FFD66300FFD66400FFD76700FFD76900FFD86C00FFD86F00FFD8
      7100FFD56C00FFD16000FFD05F00FFCF5E00FFCD5E00FFCC5E00FFC54500FFF0
      DB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF9F300FFCB
      5000FFD66F00FFD77200FFD87400FFD87700FFD97900FFD97C00FFD97E00FFDA
      8100FFDA8300FFD77E00FFD06A00FFCF6800FFCD6700FFCC6700FFC95A00FFD6
      8C00FFFEFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFF6E900FFC4
      4700FFD97F00FFD98100FFDA8400FFDA8600FFDB8900FFDC8B00FFDC8D00FFDC
      8F00FFDC9200FFDC9400FFD98D00FFCF7200FFCE7000FFCD7000FFCC7000FFCD
      7900FFFCFB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFEFD00FFDDA000FFC8
      6300FFDA8E00FFDB9000FFDC9200FFDD9500FFDD9700FFDE9900FFDE9B00FFDE
      9D00FFDF9F00FFDFA200FFDFA400FFD99500FFCF7A00FFCE7A00FFC76A00FFE5
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFD00FDE7C300FDBA5500FFDB
      9800FFDD9C00FFDE9E00FFDFA000FFDFA300FFE0A400FFE0A600FFE1A900FFE1
      AA00FFE2AD00FFE2AF00FFE2B000FFE2B200FED69300FDCB7A00FDD79E00FFFD
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFEDD200F8B45800FEDBA000FFDF
      A700FFE0A900FFE1AB00FFE2AD00FFE2AF00FFE3B100FFE3B300FFE4B500FFE4
      B600FFE4B800FEE5BA00FEE5BC00FDE5BE00FCE1B800F8B55100FDEFDD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFE5BF00FDC36400FFE3B500FFE3
      B400FFE3B500FFE4B700FFE4B900FFE5BB00FFE6BC00FEE6BE00FEE6C000FEE7
      C100FDE7C300FDE7C500FCE7C600FCE6C800FCE6CA00F8C98300F6BE7700FFFB
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFBF700FDD9A100FCC47100FBC8
      7D00FBD09200FCDCAD00FDE7C500FDE7C600FDE8C800FDE8C900FDE8CB00FCE8
      CC00FCE8CE00FCE9CF00FCE9D000FBE9D200FBE9D400F8DEC100F2B66900F1AE
      6000F8DBBF00FFF8F100FFFEFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFE00FFFAF700FFF7
      ED00FCEAD200FBD8A800F7BC6F00FCE9D000FCE9D100FCEAD300FCEAD500FCEA
      D600FCEBD700FBEBD800FBEBDA00FAE7D400EFB47900F4C69700F6D3B000F1B9
      8000EC9F5300E58A3B00E9AD8100FFFAF5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFEFD00F6C79100FAE5CD00FCECDB00FCECDC00FCEDDD00FCED
      DE00FBEDDF00FBEEE100FBEEE200EFC09600FBE3CB00FFFEFD0000000000FFFB
      F700F0C6A300EAB99700D8753700F2D1BA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9DDC100F6D5B700FCEFE300FCEFE400FCF0E500F6DC
      C600EEBC9200F6DCC700FCF1E900F0C6A300FAE8D70000000000000000000000
      0000FFFBF900EEC2A500E0997200FBEFE5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
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
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF00FFFFE1000000000000000000FFFFC100
      0000000000000000FFFFC1000000000000000000FF0383000000000000000000
      FC0007000000000000000000F0000F000000000000000000C0001F0000000000
      0000000080001F00000000000000000080001F000000000000000000C0000F00
      0000000000000000C0000F000000000000000000C00007000000000000000000
      C0000700000000000000000080000F00000000000000000000000F0000000000
      0000000000001F00000000000000000000000F00000000000000000000000100
      0000000000000000800000000000000000000000F80020000000000000000000
      FC0070000000000000000000FC0039000000000000000000FC083F0000000000
      00000000FE3C3F00000000000000000000000000000000000000000000000000
      000000000000}
  end
  object ReportAction: TActionList [28]
    Images = ReportImageList24
    Left = 568
    Top = 376
    object ReportTestAction: TAction
      Caption = '    Test    '
      ImageIndex = 0
      OnExecute = ReportTestActionExecute
    end
  end
  object ParamClientDataSet: TClientDataSet [29]
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    PacketRecords = 0
    Params = <>
    ProviderName = 'ParamDataSetProvider'
    RemoteServer = MainSoapConnection
    AfterInsert = ParamClientDataSetAfterInsert
    Left = 72
    Top = 488
  end
  object DatasetClientDataSet: TClientDataSet [30]
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    PacketRecords = 0
    Params = <>
    ProviderName = 'DatasetDataSetProvider'
    RemoteServer = MainSoapConnection
    StoreDefs = True
    AfterInsert = DatasetClientDataSetAfterInsert
    Left = 72
    Top = 544
  end
  object ChartClientDataSet: TClientDataSet [31]
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'FldObjectId;FldDataset'
    MasterFields = 'FldObjectId;FldDataset'
    MasterSource = DatasetDataSource
    PacketRecords = 0
    Params = <>
    ProviderName = 'ChartDataSetProvider'
    RemoteServer = MainSoapConnection
    StoreDefs = True
    AfterInsert = ChartClientDataSetAfterInsert
    Left = 72
    Top = 600
  end
  object SerieClientDataSet: TClientDataSet [32]
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    IndexFieldNames = 'FldObjectId;FldDataset;FldChart'
    MasterFields = 'FldObjectId;FldDataset;FldChart'
    MasterSource = ChartDataSource
    PacketRecords = 0
    Params = <>
    ProviderName = 'SerieDataSetProvider'
    RemoteServer = MainSoapConnection
    AfterInsert = SerieClientDataSetAfterInsert
    Left = 72
    Top = 656
  end
  object ParamDataSource: TDataSource [33]
    DataSet = ParamClientDataSet
    Left = 208
    Top = 488
  end
  object DatasetDataSource: TDataSource [34]
    DataSet = DatasetClientDataSet
    Left = 208
    Top = 544
  end
  object ChartDataSource: TDataSource [35]
    DataSet = ChartClientDataSet
    Left = 208
    Top = 600
  end
  object SerieDataSource: TDataSource [36]
    DataSet = SerieClientDataSet
    Left = 208
    Top = 656
  end
end
