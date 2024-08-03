inherited MemberMainForm: TMemberMainForm
  Cursor = crHandPoint
  Caption = 'MemberMainForm'
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
      object MemberTabSheet2: TTabSheet
        Caption = 'Member'
        ImageIndex = 2
        object MemberToolBar: TToolBar
          Left = 0
          Top = 0
          Width = 51
          Height = 44
          Align = alLeft
          AutoSize = True
          ButtonHeight = 46
          ButtonWidth = 51
          Caption = 'MemberToolBar'
          Images = MemberImageList24
          ShowCaptions = True
          TabOrder = 0
          object MemberTestToolButton: TToolButton
            Left = 0
            Top = 0
            Action = MemberTestAction
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
          object MemberJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Member'
            ExpandedHeight = 518
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object MemberObjectIdLabel: TLabel
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
            object MemberPIdLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 153
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'PId'
              ExplicitWidth = 17
            end
            object MemberIdLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 103
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Id'
              ExplicitWidth = 10
            end
            object MemberLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 203
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Member'
              ExplicitWidth = 45
            end
            object MemberEmailLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 253
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Email'
              ExplicitWidth = 29
            end
            object MemberStateLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 303
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'State'
              ExplicitWidth = 26
            end
            object MemberJobTitleLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 353
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Job Title'
              ExplicitWidth = 43
            end
            object MemberJobRoleLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 403
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Job Role'
              ExplicitWidth = 44
            end
            object MemberJobLevelLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 453
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Job Level'
              ExplicitWidth = 48
            end
            object MemberIdentifierSetLabel: TLabel
              Left = 150
              Top = 203
              Width = 116
              Height = 15
              Cursor = crHandPoint
              Caption = 'Set = Person identifier'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = MemberIdentifierSetLabelClick
            end
            object MemberJobSetLabel: TLabel
              Left = 131
              Top = 353
              Width = 135
              Height = 15
              Cursor = crHandPoint
              Caption = 'Set job title, role and level'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = MemberJobSetLabelClick
            end
            object MemberEmailGenerateLabel: TLabel
              Left = 219
              Top = 253
              Width = 47
              Height = 15
              Cursor = crHandPoint
              Caption = 'Generate'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = MemberEmailGenerateLabelClick
            end
            object MemberObjectIdDBEdit: TDBEdit
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
              DataSource = MemberDataSource
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
            end
            object MemberPIdDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 174
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldPId'
              DataSource = MemberDataSource
              TabOrder = 1
            end
            object MemberIdDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 124
              Width = 249
              Height = 23
              Hint = 'Id'
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldId'
              DataSource = MemberDataSource
              Enabled = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 2
            end
            object MemberDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 224
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldMember'
              DataSource = MemberDataSource
              TabOrder = 3
            end
            object MemberDBNavigator: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 275
              Height = 25
              DataSource = MemberDataSource
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alTop
              Flat = True
              TabOrder = 4
            end
            object MemberEmailDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 274
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldEmail'
              DataSource = MemberDataSource
              TabOrder = 5
            end
            object MemberJobTitleDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 374
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldJobTitle'
              DataSource = MemberDataSource
              TabOrder = 6
            end
            object MemberJobRoleDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 424
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldJobRole'
              DataSource = MemberDataSource
              TabOrder = 7
            end
            object MemberJobLevelDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 474
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldJobLevel'
              DataSource = MemberDataSource
              TabOrder = 8
            end
            object MemberStateDBComboBox: TDBComboBox
              AlignWithMargins = True
              Left = 16
              Top = 324
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldState'
              DataSource = MemberDataSource
              Items.Strings = (
                ''
                'Active'
                'Inactive')
              TabOrder = 9
            end
          end
          object MemberLocationJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Location'
            ExpandedHeight = 269
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object MemberOrganizationLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 53
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Organization'
              ExplicitWidth = 68
            end
            object MemberAreaLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 103
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Area'
              ExplicitWidth = 24
            end
            object MemberSiteLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 153
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Site'
              ExplicitWidth = 19
            end
            object MemberWorkstationLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 203
              Width = 249
              Height = 15
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Workstation'
              ExplicitWidth = 64
            end
            object MemberOrganizationDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 74
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldOrganization'
              DataSource = MemberDataSource
              TabOrder = 0
            end
            object MemberAreaDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 124
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldArea'
              DataSource = MemberDataSource
              TabOrder = 1
            end
            object MemberDBNavigator3: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 275
              Height = 25
              DataSource = MemberDataSource
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alTop
              Flat = True
              TabOrder = 2
            end
            object MemberSiteDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 174
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldSite'
              DataSource = MemberDataSource
              TabOrder = 3
            end
            object MemberWorkstationDBEdit: TDBEdit
              AlignWithMargins = True
              Left = 16
              Top = 224
              Width = 249
              Height = 23
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldWorkstation'
              DataSource = MemberDataSource
              TabOrder = 4
            end
          end
          object MemberBadgeJvScrollMaxBand: TJvScrollMaxBand
            Width = 281
            Height = 21
            Expanded = False
            Caption = 'Badge'
            ExpandedHeight = 302
            ButtonFont.Charset = ANSI_CHARSET
            ButtonFont.Color = clWindowText
            ButtonFont.Height = -11
            ButtonFont.Name = 'Segoe UI'
            ButtonFont.Style = [fsBold]
            Beveled = False
            ParentButtonFont = False
            object MemberBadgeLabel: TLabel
              AlignWithMargins = True
              Left = 16
              Top = 53
              Width = 249
              Height = 15
              Cursor = crHandPoint
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              Caption = 'Badge'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 33
            end
            object MemberBadgeSaveLabel: TLabel
              Left = 242
              Top = 53
              Width = 24
              Height = 15
              Cursor = crHandPoint
              Caption = 'Save'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = MemberBadgeSaveLabelClick
            end
            object MemberBadgeGenerateLabel: TLabel
              Left = 189
              Top = 53
              Width = 47
              Height = 15
              Cursor = crHandPoint
              Caption = 'Generate'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = MemberBadgeGenerateLabelClick
            end
            object MemberBadgeDBImage: TDBImage
              AlignWithMargins = True
              Left = 16
              Top = 74
              Width = 249
              Height = 208
              Margins.Left = 16
              Margins.Right = 16
              Align = alTop
              DataField = 'FldBadge'
              DataSource = MemberDataSource
              Proportional = True
              TabOrder = 0
            end
            object MemberDBNavigator2: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 22
              Width = 275
              Height = 25
              DataSource = MemberDataSource
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates, nbCancelUpdates]
              Align = alTop
              Flat = True
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  inherited MainPanel: TPanel
    inherited MainPageControl: TPageControl
      inherited ContentPrevTabSheet: TTabSheet
        inherited ObjectContentPrevDBSynEdit: TDBSynEdit
          ExplicitWidth = 522
        end
        inherited ObjectContentPrevTopPanel: TPanel
          ExplicitWidth = 521
        end
      end
      inherited JsonTabSheet: TTabSheet
        inherited ObjectDataDBSynEdit: TDBSynEdit
          ExplicitWidth = 522
        end
        inherited ObjectDataTopPanel: TPanel
          ExplicitWidth = 521
          inherited ObjectDataCharCountLabel: TLabel
            Height = 22
          end
        end
      end
      inherited NoteTabSheet: TTabSheet
        inherited ObjectNoteDBSynEdit: TDBSynEdit
          ExplicitWidth = 522
        end
        inherited ObjectNoteTopPanel: TPanel
          ExplicitWidth = 521
        end
      end
    end
  end
  object MemberClientDataSet: TClientDataSet [15]
    Aggregates = <>
    IndexFieldNames = 'FldObjectId'
    MasterFields = 'FldId'
    MasterSource = ObjectDataSource
    PacketRecords = 0
    Params = <>
    ProviderName = 'MemberDataSetProvider'
    RemoteServer = MainSoapConnection
    AfterInsert = MemberClientDataSetAfterInsert
    AfterPost = MemberClientDataSetAfterPost
    AfterDelete = MemberClientDataSetAfterDelete
    OnReconcileError = MemberClientDataSetReconcileError
    Left = 72
    Top = 432
  end
  object MemberDataSource: TDataSource [16]
    DataSet = MemberClientDataSet
    Left = 208
    Top = 432
  end
  inherited MainSoapConnection: TSoapConnection
    URL = 'http://localhost/WksMemberSoapProject.dll/soap'
  end
  object MemberImageList24: TImageList [27]
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
  object MemberAction: TActionList [28]
    Images = MemberImageList24
    Left = 568
    Top = 376
    object MemberTestAction: TAction
      Caption = '    Test    '
      ImageIndex = 0
      OnExecute = MemberTestActionExecute
    end
  end
end
