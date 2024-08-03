inherited PageMainForm: TPageMainForm
  Margins.Top = 8
  Caption = 'PageMainForm'
  ExplicitWidth = 1200
  ExplicitHeight = 875
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
    inherited TopPageControl: TPageControl
      Width = 810
      inherited ClientTabSheet: TTabSheet
        ExplicitWidth = 802
      end
      inherited ActionTabSheet: TTabSheet
        ExplicitWidth = 802
      end
      inherited TopTextTabSheet: TTabSheet
        ExplicitWidth = 802
      end
      inherited TopSearchTabSheet: TTabSheet
        ExplicitWidth = 802
      end
      object PageTabSheet: TTabSheet
        Caption = 'Page'
        ImageIndex = 2
        object PageToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 51
          Height = 44
          Align = alLeft
          AutoSize = True
          ButtonHeight = 46
          ButtonWidth = 51
          Caption = 'PageToolBar'
          Images = PageImageList24
          ShowCaptions = True
          TabOrder = 0
          object PageTestToolButton: TToolButton
            Left = 0
            Top = 0
            Action = PageTestAction
          end
        end
      end
    end
    inherited TopPageControl3: TPageControl
      Left = 882
    end
    inherited TopPageControl2: TPageControl
      Left = 810
    end
  end
  inherited LeftPanel: TPanel
    inherited LeftPageControl: TPageControl
      Height = 588
      inherited ObjectTreeTabSheet: TTabSheet
        ExplicitHeight = 558
        inherited ObjectNodeInfoLabel: TLabel
          Top = 543
          Width = 292
          ExplicitTop = 543
        end
        inherited ObjectDTClientTree: TDTClientTree
          Height = 518
        end
        inherited ObjectDBNavigator: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited BottomPanel: TPanel
    ExplicitWidth = 1178
    inherited LogFrame: TLogFrame
      ExplicitWidth = 1178
      inherited LogPageControl: TPageControl
        ExplicitWidth = 1178
        inherited OutputTabSheet: TTabSheet
          inherited OutputRichEdit: TRichEdit
            ExplicitWidth = 1168
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
    inherited RightPageControl: TPageControl
      inherited PropertyTabSheet: TTabSheet
        inherited ObjectJvScrollMax: TJvScrollMax
          ExplicitHeight = 557
          inherited ObjectImageJvScrollMaxBand: TJvScrollMaxBand
            inherited ObjectImageDBImage: TDBImage
              Height = 0
            end
          end
          object PageJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Page'
            ExpandedHeight = 340
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object PageObjectIdLabel: TLabel
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
            object PagePopupLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 203
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Popup'
              ExplicitWidth = 35
            end
            object PageMenuLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 153
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Menu'
              ExplicitWidth = 31
            end
            object PageLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 103
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Page'
              ExplicitWidth = 26
            end
            object PageIconLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 253
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Icon (Font Awesome)'
              ExplicitWidth = 113
            end
            object PageObjectIdDBEdit: TDBEdit
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
              DataSource = PageDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
            end
            object PagePopupDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 224
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldPopup'
              DataSource = PageDataSource
              TabOrder = 1
            end
            object PageMenuDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 174
              Width = 249
              Height = 23
              Hint = 'Id'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldMenu'
              DataSource = PageDataSource
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
            object PageDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 124
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldPage'
              DataSource = PageDataSource
              TabOrder = 3
            end
            object PageIconDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 274
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldIcon'
              DataSource = PageDataSource
              TabOrder = 4
            end
            object PageDBNavigator: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 275
              Height = 25
              DataSource = PageDataSource
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alTop
              Flat = True
              TabOrder = 5
            end
            object PageAuthenticationNeededDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 308
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Authentication Needed'
              DataField = 'FldAuthenticationNeeded'
              DataSource = PageDataSource
              TabOrder = 6
            end
          end
          object PageFlagsJvScrollMaxBand1: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Flags'
            ExpandedHeight = 223
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object PageContainerOnDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 35
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Container On'
              DataField = 'FldContainerOn'
              DataSource = PageDataSource
              TabOrder = 0
            end
            object PageContentFixedDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 63
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Content Fixed Width'
              DataField = 'FldContentFixed'
              DataSource = PageDataSource
              TabOrder = 1
            end
            object PageCenteredDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 86
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Content Centered'
              DataField = 'FldCentered'
              DataSource = PageDataSource
              TabOrder = 2
            end
            object PageTitleShowDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 114
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'Title Show'
              DataField = 'FldTitleShow'
              DataSource = PageDataSource
              TabOrder = 3
            end
            object PageSubtitleShowDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 137
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Subtitle Show'
              DataField = 'FldSubtitleShow'
              DataSource = PageDataSource
              TabOrder = 4
            end
            object PageTopNavOffDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 165
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Top = 8
              Margins.Right = 16
              Align = alTop
              Caption = 'TopNav Hide'
              DataField = 'FldTopNavOff'
              DataSource = PageDataSource
              TabOrder = 5
            end
            object PageSystemInfoOffDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 188
              Width = 249
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'System Info Hide'
              DataField = 'FldSystemInfoOff'
              DataSource = PageDataSource
              TabOrder = 6
            end
          end
          object PageMarginJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Margins'
            ExpandedHeight = 166
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object PageSpacesResetLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 22
              Width = 249
              Height = 13
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Reset Spaces'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsUnderline]
              ParentColor = False
              ParentFont = False
              Transparent = True
              ExplicitWidth = 65
            end
            object PageLeftRightSpaceLabel: TLabel
              Left = 48
              Top = 87
              Width = 20
              Height = 15
              Caption = 'Left'
            end
            object PageTopSpaceLabel: TLabel
              Left = 130
              Top = 35
              Width = 19
              Height = 15
              Caption = 'Top'
            end
            object PageBottomSpaceLabel: TLabel
              Left = 121
              Top = 140
              Width = 40
              Height = 15
              Caption = 'Bottom'
            end
            object PageRightSpaceLabel: TLabel
              Left = 215
              Top = 85
              Width = 28
              Height = 15
              Caption = 'Right'
            end
            object PageLeftSpaceJvDBSpinEdit: TJvDBSpinEdit
              Left = 74
              Top = 84
              Width = 41
              Height = 23
              CheckMinValue = True
              TabOrder = 0
              DataField = 'FldLeftSpace'
              DataSource = PageDataSource
            end
            object PageRightSpaceJvDBSpinEdit: TJvDBSpinEdit
              Left = 168
              Top = 82
              Width = 41
              Height = 23
              CheckMinValue = True
              TabOrder = 1
              DataField = 'FldRightSpace'
              DataSource = PageDataSource
            end
            object PageBottomSpaceJvDBSpinEdit: TJvDBSpinEdit
              Left = 121
              Top = 111
              Width = 41
              Height = 23
              CheckMinValue = True
              TabOrder = 2
              DataField = 'FldBottomSpace'
              DataSource = PageDataSource
            end
            object PageTopSpaceJvDBSpinEdit: TJvDBSpinEdit
              Left = 121
              Top = 55
              Width = 41
              Height = 23
              CheckMinValue = True
              TabOrder = 3
              DataField = 'FldTopSpace'
              DataSource = PageDataSource
            end
          end
        end
      end
    end
  end
  inherited MainPanel: TPanel
    inherited MainPageControl: TPageControl
      Height = 588
      inherited ContentPrevTabSheet: TTabSheet
        ExplicitHeight = 558
      end
      inherited ContentTabSheet: TTabSheet
        ExplicitHeight = 558
        inherited ObjectContentDBSynEdit: TDBSynEdit
          Height = 530
        end
        inherited ObjectContentTopPanel: TPanel
          inherited ObjectContentCharCountLabel: TLabel
            Height = 22
          end
        end
      end
      inherited JsonTabSheet: TTabSheet
        ParentFont = False
        ExplicitHeight = 558
      end
      inherited NoteTabSheet: TTabSheet
        ExplicitHeight = 558
      end
      object PageHeaderTabSheet: TTabSheet
        Caption = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ImageIndex = 4
        ParentFont = False
        object PageHeaderDBSynEdit: TDBSynEdit
          Left = 0
          Top = 28
          Width = 544
          Height = 530
          Cursor = crIBeam
          DataField = 'FldHeader'
          DataSource = PageDataSource
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
          OnKeyUp = PageHeaderDBSynEditKeyUp
          BorderStyle = bsNone
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
          Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoSpecialLineDefaultFg, eoTabIndent, eoTabsToSpaces, eoTrimTrailingSpaces]
          SelectedColor.Alpha = 0.400000005960464500
          WantTabs = True
          OnChange = PageHeaderDBSynEditChange
          ExplicitHeight = 531
        end
        object CodeHeaderTopPanel: TPanel
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
          Caption = 'CodeHeaderTopPanel'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
        end
      end
      object PageFooterTabSheet: TTabSheet
        Caption = 'Footer'
        ImageIndex = 5
        object PageFooterDBSynEdit: TDBSynEdit
          Left = 0
          Top = 28
          Width = 544
          Height = 530
          Cursor = crIBeam
          DataField = 'FldFooter'
          DataSource = PageDataSource
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
          OnKeyUp = PageFooterDBSynEditKeyUp
          BorderStyle = bsNone
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
          Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoSpecialLineDefaultFg, eoTabIndent, eoTabsToSpaces, eoTrimTrailingSpaces]
          SelectedColor.Alpha = 0.400000005960464500
          WantTabs = True
          OnChange = PageFooterDBSynEditChange
          ExplicitHeight = 531
        end
        object CodeFooterTopPanel: TPanel
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
          Caption = 'CodeFooterTopPanel'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
        end
      end
      object PageHeadTabSheet: TTabSheet
        Caption = 'Head'
        ImageIndex = 6
        object PageHeadDBSynEdit: TDBSynEdit
          Left = 0
          Top = 28
          Width = 544
          Height = 530
          Cursor = crIBeam
          DataField = 'FldHead'
          DataSource = PageDataSource
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
          OnKeyUp = PageHeadDBSynEditKeyUp
          BorderStyle = bsNone
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
          Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoSpecialLineDefaultFg, eoTabIndent, eoTabsToSpaces, eoTrimTrailingSpaces]
          SelectedColor.Alpha = 0.400000005960464500
          WantTabs = True
          OnChange = PageHeadDBSynEditChange
          ExplicitHeight = 531
        end
        object CodeHeadTopPanel: TPanel
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
          Caption = 'CodeHeadTopPanel'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
        end
      end
      object PageCssTabSheet: TTabSheet
        Caption = '   Css'
        ImageIndex = 7
        object PageCssDBSynEdit: TDBSynEdit
          Left = 0
          Top = 28
          Width = 544
          Height = 530
          Cursor = crIBeam
          DataField = 'FldCss'
          DataSource = PageDataSource
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
          OnKeyUp = PageCssDBSynEditKeyUp
          BorderStyle = bsNone
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
          Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoSpecialLineDefaultFg, eoTabIndent, eoTabsToSpaces, eoTrimTrailingSpaces]
          SelectedColor.Alpha = 0.400000005960464500
          WantTabs = True
          OnChange = PageCssDBSynEditChange
          ExplicitHeight = 531
        end
        object CodeCssTopPanel: TPanel
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
          Caption = 'CodeCssTopPanel'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
        end
      end
      object PageJsTabSheet: TTabSheet
        Caption = 'Js Before'
        ImageIndex = 8
        object PageJsDBSynEdit: TDBSynEdit
          Left = 0
          Top = 28
          Width = 544
          Height = 530
          Cursor = crIBeam
          DataField = 'FldJs'
          DataSource = PageDataSource
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
          OnKeyUp = PageJsDBSynEditKeyUp
          BorderStyle = bsNone
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
          Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoSpecialLineDefaultFg, eoTabIndent, eoTabsToSpaces, eoTrimTrailingSpaces]
          SelectedColor.Alpha = 0.400000005960464500
          WantTabs = True
          OnChange = PageJsDBSynEditChange
          ExplicitHeight = 531
        end
        object CodeJsTopPanel: TPanel
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
          Caption = 'CodeJsTopPanel'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
          object PageJsLabel: TLabel
            Left = 384
            Top = 0
            Width = 159
            Height = 15
            Align = alRight
            Alignment = taCenter
            Caption = 'javascript before page loading'
            Layout = tlCenter
          end
        end
      end
      object PageJsAfterTabSheet: TTabSheet
        Caption = 'Js After'
        ImageIndex = 9
        object CodeJsAfterTopPanel: TPanel
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
          Caption = 'CodeJsAfterTopPanel'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          object PageJsAfterLabel: TLabel
            Left = 394
            Top = 0
            Width = 149
            Height = 15
            Align = alRight
            Alignment = taCenter
            Caption = 'javascript after page loading'
            Layout = tlCenter
          end
        end
        object PageJsAfterDBSynEdit: TDBSynEdit
          Left = 0
          Top = 28
          Width = 544
          Height = 530
          Cursor = crIBeam
          DataField = 'FldJsAfter'
          DataSource = PageDataSource
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
          TabOrder = 1
          OnKeyUp = PageJsAfterDBSynEditKeyUp
          BorderStyle = bsNone
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
          Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoSpecialLineDefaultFg, eoTabIndent, eoTabsToSpaces, eoTrimTrailingSpaces]
          SelectedColor.Alpha = 0.400000005960464500
          WantTabs = True
          OnChange = PageJsAfterDBSynEditChange
          ExplicitHeight = 531
        end
      end
    end
  end
  object PageClientDataSet: TClientDataSet [14]
    Aggregates = <>
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    PacketRecords = 0
    Params = <>
    ProviderName = 'PageDataSetProvider'
    RemoteServer = MainSoapConnection
    AfterInsert = PageClientDataSetAfterInsert
    AfterPost = PageClientDataSetAfterPost
    AfterDelete = PageClientDataSetAfterDelete
    OnReconcileError = PageClientDataSetReconcileError
    Left = 72
    Top = 432
  end
  object PageDataSource: TDataSource [15]
    DataSet = PageClientDataSet
    Left = 208
    Top = 432
  end
  object PageImageList24: TImageList [19]
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
  object PageAction: TActionList [20]
    Images = PageImageList24
    Left = 568
    Top = 320
    object PageTestAction: TAction
      Caption = '    Test    '
      ImageIndex = 0
      OnExecute = PageTestActionExecute
    end
  end
end
