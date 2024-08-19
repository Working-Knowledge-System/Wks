inherited OrganizationMainForm: TOrganizationMainForm
  Caption = 'OrganizationMainForm'
  TextHeight = 15
  inherited LeftJvNetscapeSplitter: TJvNetscapeSplitter
    ExplicitHeight = 696
  end
  inherited RightJvNetscapeSplitter: TJvNetscapeSplitter
    ExplicitLeft = 895
    ExplicitHeight = 696
  end
  inherited BottomJvNetscapeSplitter: TJvNetscapeSplitter
    ExplicitTop = 773
    ExplicitWidth = 1208
  end
  inherited TopPanel: TPanel
    inherited TopPageControl: TPageControl
      object OrganizationTabSheet2: TTabSheet
        Caption = 'Organization'
        ImageIndex = 2
        object OrganizationToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 51
          Height = 44
          Align = alLeft
          AutoSize = True
          ButtonHeight = 46
          ButtonWidth = 51
          Caption = 'OrganizationToolBar'
          Images = OrganizationImageList24
          ShowCaptions = True
          TabOrder = 0
          object OrganizationTestToolButton: TToolButton
            Left = 0
            Top = 0
            Action = OrganizationTestAction
          end
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
          ScrollPos = 130
          inherited ObjectIdJvScrollMaxBand: TJvScrollMaxBand
            ExplicitTop = -130
          end
          inherited ObjectDateJvScrollMaxBand: TJvScrollMaxBand
            ExplicitTop = -104
          end
          inherited ObjectFromJvScrollMaxBand: TJvScrollMaxBand
            ExplicitTop = -78
          end
          inherited ObjectToJvScrollMaxBand: TJvScrollMaxBand
            ExplicitTop = -52
          end
          inherited ObjectApprovalJvScrollMaxBand: TJvScrollMaxBand
            ExplicitTop = -26
          end
          inherited ObjectImageJvScrollMaxBand: TJvScrollMaxBand
            ExplicitTop = 0
          end
          inherited ObjectTypeJvScrollMaxBand: TJvScrollMaxBand
            ExplicitTop = 26
          end
          inherited ObjectGeneralJvScrollMaxBand: TJvScrollMaxBand
            ExplicitTop = 52
          end
          object OrganizationJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Organization'
            ExpandedHeight = 365
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object OrganizationObjectIdLabel: TLabel
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
            object OrganizationSloganLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 303
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Slogan'
              ExplicitWidth = 36
            end
            object OrganizationAboutLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 253
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'About'
              ExplicitWidth = 33
            end
            object OrganizationWwwLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 103
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Www'
              ExplicitWidth = 29
            end
            object OrganizationPhoneLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 153
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Phone'
              ExplicitWidth = 34
            end
            object OrganizationEmailLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 203
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Email'
              ExplicitWidth = 29
            end
            object OrganizationObjectIdDBEdit: TDBEdit
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
              DataSource = OrganizationDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
            end
            object OrganizationSloganDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 324
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldSlogan'
              DataSource = OrganizationDataSource
              TabOrder = 1
            end
            object OrganizationAboutDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 274
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldAbout'
              DataSource = OrganizationDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
            object OrganizationWwwDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 124
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              CharCase = ecLowerCase
              DataField = 'FldWww'
              DataSource = OrganizationDataSource
              TabOrder = 3
            end
            object OrganizationDBNavigator: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 275
              Height = 25
              DataSource = OrganizationDataSource
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alTop
              Flat = True
              TabOrder = 4
            end
            object OrganizationPhoneDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 174
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldPhone'
              DataSource = OrganizationDataSource
              TabOrder = 5
            end
            object OrganizationEmailDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 224
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldEmail'
              DataSource = OrganizationDataSource
              TabOrder = 6
            end
          end
          object OrganizationLogoJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 417
            Caption = 'Logo'
            ExpandedHeight = 417
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            DesignSize = (
              281
              417)
            object OrganizationLogoLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 53
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Logo (200x200)'
              ExplicitWidth = 80
            end
            object OrganizationLogoLongLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 288
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Logo Long (240x80)'
              ExplicitWidth = 104
            end
            object OrganizationLogoSaveLabel: TLabel
              Left = 242
              Top = 53
              Width = 24
              Height = 15
              Cursor = crHandPoint
              Anchors = [akTop, akRight]
              Caption = 'Save'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = OrganizationLogoSaveLabelClick
            end
            object OrganizationLogoLongSaveLabel: TLabel
              Left = 242
              Top = 288
              Width = 24
              Height = 15
              Cursor = crHandPoint
              Anchors = [akTop, akRight]
              Caption = 'Save'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = OrganizationLogoLongSaveLabelClick
            end
            object OrganizationLogoLoadLabel: TLabel
              Left = 202
              Top = 53
              Width = 26
              Height = 15
              Anchors = [akTop, akRight]
              Caption = 'Load'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = OrganizationLogoLoadLabelClick
            end
            object OrganizationLogoLongLoadLabel: TLabel
              Left = 202
              Top = 288
              Width = 26
              Height = 15
              Anchors = [akTop, akRight]
              Caption = 'Load'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = OrganizationLogoLongLoadLabelClick
            end
            object OrganizationLogoDBImage: TDBImage
              AlignWithMargins = True
              Left = 16
              Top = 74
              Width = 249
              Height = 208
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldLogo'
              DataSource = OrganizationDataSource
              Proportional = True
              TabOrder = 0
            end
            object OrganizationLogoLongDBImage: TDBImage
              AlignWithMargins = True
              Left = 16
              Top = 309
              Width = 249
              Height = 88
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldLogoLong'
              DataSource = OrganizationDataSource
              Proportional = True
              TabOrder = 1
            end
            object OrganizationDBNavigator2: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 275
              Height = 25
              DataSource = OrganizationDataSource
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alTop
              Flat = True
              TabOrder = 2
            end
          end
          object OrganizationThemeJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Theme'
            ExpandedHeight = 516
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object ThemeObjectIdLabel: TLabel
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
            object ThemeLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 103
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Theme'
              ExplicitWidth = 36
            end
            object ThemeGradeLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 153
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Grade'
              ExplicitWidth = 31
            end
            object ThemeHighlightJsLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 453
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'HighlightJs'
              ExplicitWidth = 59
            end
            object ThemeBorderedClassLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 403
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Bordered Class'
              ExplicitWidth = 78
            end
            object ThemePaddingClassLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 353
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Padding Class'
              ExplicitWidth = 74
            end
            object ThemeSizeClassLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 303
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Size Class'
              ExplicitWidth = 50
            end
            object ThemeFontFamilyLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 203
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Font Family'
              ExplicitWidth = 62
            end
            object ThemeFontWeightLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 253
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Font Weight'
              ExplicitWidth = 65
            end
            object ThemeObjectIdDBEdit: TDBEdit
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
              DataSource = ThemeDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
            end
            object ThemeDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 124
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldTheme'
              DataSource = ThemeDataSource
              TabOrder = 1
            end
            object ThemeGradeDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 174
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldGrade'
              DataSource = ThemeDataSource
              TabOrder = 2
            end
            object ThemeHighlightJsDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 474
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldHighlightJs'
              DataSource = ThemeDataSource
              TabOrder = 3
            end
            object ThemeBorderedClassDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 424
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldBorderedClass'
              DataSource = ThemeDataSource
              TabOrder = 4
            end
            object ThemePaddingClassDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 374
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldPaddingClass'
              DataSource = ThemeDataSource
              TabOrder = 5
            end
            object ThemeSizeClassDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 324
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldSizeClass'
              DataSource = ThemeDataSource
              TabOrder = 6
            end
            object ThemeFontFamilyDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 224
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldFontFamily'
              DataSource = ThemeDataSource
              TabOrder = 7
            end
            object ThemeDBNavigator: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 275
              Height = 25
              DataSource = ThemeDataSource
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alTop
              Flat = True
              TabOrder = 8
            end
            object ThemeFontWeightDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 274
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldFontWeight'
              DataSource = ThemeDataSource
              TabOrder = 9
            end
          end
          object ThemeColorJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Colors'
            ExpandedHeight = 457
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object ThemeSuccessColorLabel: TLabel
              Tag = 7
              AlignWithMargins = True
              Left = 16
              Top = 377
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Success Color'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ThemePrimary60BgColorLabelClick
              ExplicitWidth = 73
            end
            object ThemeInfoColorLabel: TLabel
              Tag = 6
              AlignWithMargins = True
              Left = 16
              Top = 327
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Info Color'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ThemePrimary60BgColorLabelClick
              ExplicitWidth = 53
            end
            object ThemeDangerColorLabel: TLabel
              Tag = 4
              AlignWithMargins = True
              Left = 16
              Top = 227
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Danger Color'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ThemePrimary60BgColorLabelClick
              ExplicitWidth = 70
            end
            object ThemeWarningColorLabel: TLabel
              Tag = 5
              AlignWithMargins = True
              Left = 16
              Top = 277
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Warning Color'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ThemePrimary60BgColorLabelClick
              ExplicitWidth = 77
            end
            object ThemeAccent10ColorLabel: TLabel
              Tag = 2
              AlignWithMargins = True
              Left = 16
              Top = 127
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Accent 10% Color'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ThemePrimary60BgColorLabelClick
              ExplicitWidth = 94
            end
            object ThemeErrorColorLabel: TLabel
              Tag = 3
              AlignWithMargins = True
              Left = 16
              Top = 177
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Error Color'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ThemePrimary60BgColorLabelClick
              ExplicitWidth = 57
            end
            object ThemePrimary60BgColorLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 27
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Primary 60% Background Color'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ThemePrimary60BgColorLabelClick
              ExplicitWidth = 165
            end
            object ThemeSecondary30FgColorLabel: TLabel
              Tag = 1
              AlignWithMargins = True
              Left = 16
              Top = 77
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Secondary 30% Foreground Color'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ThemePrimary60BgColorLabelClick
              ExplicitWidth = 177
            end
            object ThemeColorResetLabel: TLabel
              Left = 16
              Top = 432
              Width = 65
              Height = 15
              Caption = 'Reset Colors'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = ThemeColorResetLabelClick
            end
            object ThemeSuccessColorDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 398
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              BevelInner = bvSpace
              BevelOuter = bvSpace
              BevelKind = bkSoft
              BevelWidth = 2
              BorderStyle = bsNone
              CharCase = ecUpperCase
              DataField = 'FldSuccessColor'
              DataSource = ThemeDataSource
              TabOrder = 0
              StyleElements = [seFont, seClient]
              OnChange = ThemePrimary60BgColorDBEditChange
            end
            object ThemeInfoColorDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 348
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              BevelInner = bvSpace
              BevelOuter = bvSpace
              BevelKind = bkSoft
              BevelWidth = 2
              BorderStyle = bsNone
              CharCase = ecUpperCase
              DataField = 'FldInfoColor'
              DataSource = ThemeDataSource
              TabOrder = 1
              StyleElements = [seFont, seClient]
              OnChange = ThemePrimary60BgColorDBEditChange
            end
            object ThemeDangerColorDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 248
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              BevelInner = bvSpace
              BevelOuter = bvSpace
              BevelKind = bkSoft
              BevelWidth = 2
              BorderStyle = bsNone
              CharCase = ecUpperCase
              DataField = 'FldDangerColor'
              DataSource = ThemeDataSource
              TabOrder = 2
              StyleElements = [seFont, seClient]
              OnChange = ThemePrimary60BgColorDBEditChange
            end
            object ThemeWarningColorDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 298
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              BevelInner = bvSpace
              BevelOuter = bvSpace
              BevelKind = bkSoft
              BevelWidth = 2
              BorderStyle = bsNone
              CharCase = ecUpperCase
              DataField = 'FldWarningColor'
              DataSource = ThemeDataSource
              TabOrder = 3
              StyleElements = [seFont, seClient]
              OnChange = ThemePrimary60BgColorDBEditChange
            end
            object ThemeAccent10ColorDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 148
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              BevelInner = bvSpace
              BevelOuter = bvSpace
              BevelKind = bkSoft
              BevelWidth = 2
              BorderStyle = bsNone
              CharCase = ecUpperCase
              DataField = 'FldAccent10Color'
              DataSource = ThemeDataSource
              TabOrder = 4
              StyleElements = [seFont, seClient]
              OnChange = ThemePrimary60BgColorDBEditChange
            end
            object ThemeErrorColorDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 198
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              BevelInner = bvSpace
              BevelOuter = bvSpace
              BevelKind = bkSoft
              BevelWidth = 2
              BorderStyle = bsNone
              CharCase = ecUpperCase
              DataField = 'FldErrorColor'
              DataSource = ThemeDataSource
              TabOrder = 5
              StyleElements = [seFont, seClient]
              OnChange = ThemePrimary60BgColorDBEditChange
            end
            object ThemePrimary60BgColorDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 48
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              BevelInner = bvSpace
              BevelOuter = bvSpace
              BevelKind = bkSoft
              BevelWidth = 2
              BorderStyle = bsNone
              CharCase = ecUpperCase
              DataField = 'FldPrimary60BgColor'
              DataSource = ThemeDataSource
              TabOrder = 6
              StyleElements = [seFont, seClient]
              OnChange = ThemePrimary60BgColorDBEditChange
            end
            object ThemeSecondary30FgColorDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 98
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              BevelInner = bvSpace
              BevelOuter = bvSpace
              BevelKind = bkSoft
              BevelWidth = 2
              BorderStyle = bsNone
              CharCase = ecUpperCase
              DataField = 'FldSecondary30FgColor'
              DataSource = ThemeDataSource
              TabOrder = 7
              StyleElements = [seFont, seClient]
              OnChange = ThemePrimary60BgColorDBEditChange
            end
          end
        end
      end
    end
  end
  inherited StatusBar: TStatusBar
    ExplicitTop = 814
    ExplicitWidth = 1258
  end
  object OrganizationClientDataSet: TClientDataSet [14]
    Aggregates = <>
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    PacketRecords = 0
    Params = <>
    ProviderName = 'OrganizationDataSetProvider'
    RemoteServer = MainSoapConnection
    AfterInsert = OrganizationClientDataSetAfterInsert
    AfterPost = OrganizationClientDataSetAfterPost
    AfterDelete = OrganizationClientDataSetAfterDelete
    OnReconcileError = OrganizationClientDataSetReconcileError
    Left = 72
    Top = 432
  end
  object OrganizationDataSource: TDataSource [15]
    DataSet = OrganizationClientDataSet
    Left = 208
    Top = 432
  end
  object OrganizationImageList24: TImageList [24]
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
  object OrganizationAction: TActionList [25]
    Images = OrganizationImageList24
    Left = 568
    Top = 376
    object OrganizationTestAction: TAction
      Caption = '    Test    '
      ImageIndex = 0
      OnExecute = OrganizationTestActionExecute
    end
  end
  object ThemeClientDataSet: TClientDataSet [26]
    Aggregates = <>
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    PacketRecords = 0
    Params = <>
    ProviderName = 'ThemeDataSetProvider'
    RemoteServer = MainSoapConnection
    AfterPost = ThemeClientDataSetAfterPost
    Left = 72
    Top = 488
  end
  object ThemeDataSource: TDataSource [27]
    DataSet = ThemeClientDataSet
    Left = 208
    Top = 488
  end
end
