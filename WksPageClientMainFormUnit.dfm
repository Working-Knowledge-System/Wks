inherited PageMainForm: TPageMainForm
  Margins.Top = 8
  Caption = 'PageMainForm'
  StyleElements = [seFont, seClient, seBorder]
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
    inherited LeftPageControl: TPageControl
      inherited ObjectTreeTabSheet: TTabSheet
        inherited ObjectNodeInfoLabel: TLabel
          Width = 292
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited ObjectDBNavigator: TDBNavigator
          Hints.Strings = ()
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
      ExplicitTop = 51
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
          object PageJvScrollMaxBand: TJvScrollMaxBand
            Width = 279
            Height = 21
            Expanded = False
            Caption = 'Page'
            ExpandedHeight = 372
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
              Width = 247
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
              Top = 153
              Width = 247
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
              Top = 103
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Menu'
              ExplicitWidth = 31
            end
            object PageIconLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 203
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Icon (Font Awesome)'
              ExplicitWidth = 113
            end
            object PageClassLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 253
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Class'
              ExplicitWidth = 27
            end
            object PageStyleLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 303
              Width = 247
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Style'
              ExplicitWidth = 25
            end
            object PageObjectIdDBEdit: TDBEdit
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
              DataSource = PageDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
            end
            object PagePopupDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 174
              Width = 247
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
              Top = 124
              Width = 247
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
            object PageIconDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 224
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldIcon'
              DataSource = PageDataSource
              TabOrder = 3
            end
            object PageDBNavigator: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 273
              Height = 25
              DataSource = PageDataSource
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alTop
              Flat = True
              TabOrder = 4
            end
            object PageClassDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 274
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldClass'
              DataSource = PageDataSource
              TabOrder = 5
            end
            object PageStyleDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 324
              Width = 247
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldStyle'
              DataSource = PageDataSource
              TabOrder = 6
            end
          end
          object PageFlagsJvScrollMaxBand1: TJvScrollMaxBand
            Width = 279
            Height = 21
            Expanded = False
            Caption = 'Flags'
            ExpandedHeight = 284
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
              Top = 68
              Width = 247
              Height = 17
              Margins.Left = 16
              Margins.Top = 13
              Margins.Right = 16
              Align = alTop
              Caption = 'Container On'
              DataField = 'FldContainerOn'
              DataSource = PageDataSource
              TabOrder = 0
              ExplicitTop = 35
            end
            object PageContentFixedDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 91
              Width = 247
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Content Fixed Width'
              DataField = 'FldContentFixed'
              DataSource = PageDataSource
              TabOrder = 1
              ExplicitTop = 63
            end
            object PageCenteredDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 114
              Width = 247
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Content Centered'
              DataField = 'FldCentered'
              DataSource = PageDataSource
              TabOrder = 2
              ExplicitTop = 86
            end
            object PageTitleShowDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 146
              Width = 247
              Height = 17
              Margins.Left = 16
              Margins.Top = 12
              Margins.Right = 16
              Align = alTop
              Caption = 'Title Show'
              DataField = 'FldTitleShow'
              DataSource = PageDataSource
              TabOrder = 3
              ExplicitTop = 114
            end
            object PageSubtitleShowDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 169
              Width = 247
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Subtitle Show'
              DataField = 'FldSubtitleShow'
              DataSource = PageDataSource
              TabOrder = 4
              ExplicitTop = 137
            end
            object PageTopNavOffDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 224
              Width = 247
              Height = 17
              Margins.Left = 16
              Margins.Top = 12
              Margins.Right = 16
              Align = alTop
              Caption = 'TopNav Hide'
              DataField = 'FldTopNavOff'
              DataSource = PageDataSource
              TabOrder = 5
              ExplicitTop = 188
            end
            object PageSystemInfoOffDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 247
              Width = 247
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'System Info Hide'
              DataField = 'FldSystemInfoOff'
              DataSource = PageDataSource
              TabOrder = 6
              ExplicitTop = 211
            end
            object PageImageShowDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 192
              Width = 247
              Height = 17
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Image Show'
              DataField = 'FldImageShow'
              DataSource = PageDataSource
              TabOrder = 7
              ExplicitTop = 160
            end
            object PageAuthenticationNeededDBCheckBox: TDBCheckBox
              AlignWithMargins = True
              Left = 16
              Top = 35
              Width = 247
              Height = 17
              Margins.Left = 16
              Margins.Top = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Authentication Needed'
              DataField = 'FldAuthenticationNeeded'
              DataSource = PageDataSource
              TabOrder = 8
              ExplicitTop = 27
            end
          end
          object PageMarginJvScrollMaxBand: TJvScrollMaxBand
            Width = 279
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
              Width = 247
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
        end
      end
    end
  end
  inherited MainPanel: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited MainPageControl: TPageControl
      inherited ObjectContentPrevTabSheet: TTabSheet
        inherited ObjectContentPrevTopPanel: TPanel
          inherited ObjectContentPrevCharCountLabel: TLabel
            Height = 22
          end
        end
      end
      inherited ObjectContentTabSheet: TTabSheet
        inherited ObjectContentTopPanel: TPanel
          inherited ObjectContentCharCountLabel: TLabel
            Height = 22
          end
        end
        inherited ObjectContentSplitView: TSplitView
          DoubleBuffered = True
        end
      end
      inherited ObjectDataTabSheet: TTabSheet
        ParentFont = False
        inherited ObjectDataTopPanel: TPanel
          inherited ObjectDataCharCountLabel: TLabel
            Height = 22
          end
        end
      end
      inherited ObjectNoteTabSheet: TTabSheet
        inherited ObjectNoteTopPanel: TPanel
          inherited ObjectNoteCharCountLabel: TLabel
            Height = 22
          end
        end
      end
      inherited FilesRioTabSheet: TTabSheet
        inherited FilesRioTopPanel: TPanel
          inherited FilesRioInfoLabel: TLabel
            Height = 31
          end
        end
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
          Width = 899
          Height = 538
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
          WantTabs = True
          OnChange = PageHeaderDBSynEditChange
        end
        object CodeHeaderTopPanel: TPanel
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
          Width = 899
          Height = 538
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
          WantTabs = True
          OnChange = PageFooterDBSynEditChange
        end
        object CodeFooterTopPanel: TPanel
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
          Width = 899
          Height = 538
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
          WantTabs = True
          OnChange = PageHeadDBSynEditChange
        end
        object CodeHeadTopPanel: TPanel
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
          Width = 899
          Height = 538
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
          WantTabs = True
          OnChange = PageCssDBSynEditChange
        end
        object CodeCssTopPanel: TPanel
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
          Width = 899
          Height = 538
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
          WantTabs = True
          OnChange = PageJsDBSynEditChange
        end
        object CodeJsTopPanel: TPanel
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
          Caption = 'CodeJsTopPanel'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
          object PageJsLabel: TLabel
            Left = 739
            Top = 0
            Width = 159
            Height = 28
            Align = alRight
            Alignment = taCenter
            Caption = 'javascript before page loading'
            Layout = tlCenter
            ExplicitLeft = 782
            ExplicitHeight = 15
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
          Width = 898
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
            Left = 749
            Top = 0
            Width = 149
            Height = 28
            Align = alRight
            Alignment = taCenter
            Caption = 'javascript after page loading'
            Layout = tlCenter
            ExplicitLeft = 792
            ExplicitHeight = 15
          end
        end
        object PageJsAfterDBSynEdit: TDBSynEdit
          Left = 0
          Top = 28
          Width = 899
          Height = 538
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
          WantTabs = True
          OnChange = PageJsAfterDBSynEditChange
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
    BeforeInsert = PageClientDataSetBeforeInsert
    AfterInsert = PageClientDataSetAfterInsert
    BeforePost = PageClientDataSetBeforePost
    AfterPost = PageClientDataSetAfterPost
    AfterCancel = PageClientDataSetAfterCancel
    BeforeDelete = PageClientDataSetBeforeDelete
    AfterDelete = PageClientDataSetAfterDelete
    BeforeScroll = PageClientDataSetBeforeScroll
    AfterScroll = PageClientDataSetAfterScroll
    BeforeRefresh = PageClientDataSetBeforeRefresh
    AfterRefresh = PageClientDataSetAfterRefresh
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
    Left = 376
    Top = 544
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
    Left = 584
    Top = 544
  end
end
