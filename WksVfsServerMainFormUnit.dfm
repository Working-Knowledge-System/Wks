object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 635
  ClientWidth = 1021
  Color = 15790320
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object BottomJvNetscapeSplitter: TJvNetscapeSplitter
    Left = 0
    Top = 338
    Width = 1021
    Height = 10
    Cursor = crVSplit
    Align = alBottom
    MinSize = 1
    Maximized = False
    Minimized = False
    ButtonCursor = crDefault
    ExplicitTop = 250
    ExplicitWidth = 906
  end
  object TopPanel: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1015
    Height = 318
    Align = alTop
    BevelOuter = bvNone
    Color = 15790320
    ParentBackground = False
    TabOrder = 0
    object TopPageControl: TPageControl
      Left = 0
      Top = 0
      Width = 1015
      Height = 318
      ActivePage = HttpServerTabSheet
      Align = alClient
      TabOrder = 0
      object HttpServerTabSheet: TTabSheet
        Caption = ' Http'
        ImageIndex = 2
        object HttpServerStartedJvLED: TJvLED
          Left = 8
          Top = 24
          Width = 32
          Height = 21
          ColorOn = clRed
          ColorOff = clLime
          Status = False
        end
        object HttpServerLabel: TLabel
          Left = 8
          Top = 8
          Width = 32
          Height = 13
          Caption = 'Server'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7947776
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object HttpPortLabel: TLabel
          Left = 56
          Top = 8
          Width = 22
          Height = 13
          Caption = 'Port'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7947776
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object HttpPortEdit: TEdit
          Left = 56
          Top = 24
          Width = 41
          Height = 21
          TabOrder = 0
          Text = '8081'
        end
        object HttpServerStartButton: TButton
          Left = 111
          Top = 22
          Width = 50
          Height = 25
          Caption = 'Start'
          TabOrder = 1
          OnClick = HttpServerStartButtonClick
        end
        object HttpServerStopButton: TButton
          Left = 175
          Top = 22
          Width = 50
          Height = 25
          Caption = 'Stop'
          TabOrder = 2
          OnClick = HttpServerStopButtonClick
        end
      end
      object WsServerTabSheet: TTabSheet
        Caption = '  Ws'
        DesignSize = (
          1007
          290)
        object WsServerPortLabel: TLabel
          Left = 56
          Top = 8
          Width = 22
          Height = 13
          Caption = 'Port'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7947776
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object WsServerLabel: TLabel
          Left = 8
          Top = 8
          Width = 32
          Height = 13
          Caption = 'Server'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7947776
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object WsServerStartedJvLED: TJvLED
          Left = 8
          Top = 24
          Width = 32
          Height = 21
          ColorOn = clRed
          ColorOff = clLime
          Status = False
        end
        object WsServerPortEdit: TEdit
          Left = 56
          Top = 24
          Width = 41
          Height = 21
          TabOrder = 0
          Text = '8080'
        end
        object WsServerStopButton: TButton
          Left = 175
          Top = 22
          Width = 50
          Height = 25
          Caption = 'Stop'
          TabOrder = 1
          OnClick = WsServerStopButtonClick
        end
        object WsServerStartButton: TButton
          Left = 111
          Top = 22
          Width = 50
          Height = 25
          Caption = 'Start'
          TabOrder = 2
          OnClick = WsServerStartButtonClick
        end
        object WsMessageEdit: TEdit
          AlignWithMargins = True
          Left = 8
          Top = 78
          Width = 644
          Height = 21
          Margins.Left = 8
          Margins.Right = 124
          Margins.Bottom = 8
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Text = 'WsMessageEdit'
        end
        object WsMessageSendButton: TButton
          Left = 662
          Top = 76
          Width = 50
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Send'
          TabOrder = 4
          OnClick = WsMessageSendButtonClick
        end
        object WsMessageSendToAllButton: TButton
          Left = 718
          Top = 76
          Width = 50
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'To All'
          TabOrder = 5
          OnClick = WsMessageSendToAllButtonClick
        end
        object WsMessagesSynEdit: TSynEdit
          AlignWithMargins = True
          Left = 8
          Top = 130
          Width = 760
          Height = 152
          Margins.Left = 8
          Margins.Right = 8
          Margins.Bottom = 8
          Anchors = [akLeft, akTop, akRight, akBottom]
          ActiveLineColor = clYellow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Pitch = fpFixed
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          TabOrder = 6
          UseCodeFolding = False
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.Font.Quality = fqClearTypeNatural
          Gutter.Visible = False
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
          Lines.Strings = (
            'WsMessagesSynEdit')
          ScrollbarAnnotations = <>
          TabWidth = 4
        end
        object WsMessagesCheckBox: TCheckBox
          AlignWithMargins = True
          Left = 8
          Top = 110
          Width = 140
          Height = 17
          Margins.Left = 8
          Margins.Right = 8
          Margins.Bottom = 0
          Caption = 'Messages (one per line)'
          TabOrder = 7
        end
        object WsMessageCheckBox: TCheckBox
          AlignWithMargins = True
          Left = 8
          Top = 58
          Width = 140
          Height = 17
          Margins.Left = 8
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 0
          Caption = 'Message (single line)'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 8
        end
        object LeftPageControl: TPageControl
          AlignWithMargins = True
          Left = 779
          Top = 8
          Width = 220
          Height = 274
          Margins.Top = 8
          Margins.Right = 8
          Margins.Bottom = 8
          ActivePage = WsClientTabSheet
          Align = alRight
          TabOrder = 9
          object WsClientTabSheet: TTabSheet
            Caption = 'Clients'
            object WsClientListBox: TListBox
              AlignWithMargins = True
              Left = 3
              Top = 34
              Width = 206
              Height = 209
              Margins.Top = 34
              Align = alClient
              BorderStyle = bsNone
              ItemHeight = 13
              TabOrder = 0
            end
            object WsClientDisconnectButton: TButton
              Left = 3
              Top = 3
              Width = 75
              Height = 25
              Caption = 'Disconnect'
              TabOrder = 1
              OnClick = WsClientDisconnectButtonClick
            end
            object WsClientDisconnectAllButton: TButton
              Left = 84
              Top = 3
              Width = 37
              Height = 25
              Caption = 'All'
              TabOrder = 2
              OnClick = WsClientDisconnectAllButtonClick
            end
            object WsClientDataButton: TButton
              Left = 127
              Top = 3
              Width = 42
              Height = 25
              Caption = 'Data'
              TabOrder = 3
              OnClick = WsClientDataButtonClick
            end
          end
          object WsMessageTabSheet: TTabSheet
            Caption = 'Messages'
            object WsMessageListBox: TListBox
              AlignWithMargins = True
              Left = 3
              Top = 34
              Width = 206
              Height = 209
              Margins.Top = 34
              Align = alClient
              BorderStyle = bsNone
              ItemHeight = 13
              TabOrder = 0
              OnDblClick = WsMessageListBoxDblClick
            end
            object WsMessageNewButton: TButton
              Left = 3
              Top = 3
              Width = 50
              Height = 25
              Caption = 'New'
              TabOrder = 1
            end
            object WsMessageEditButton: TButton
              Left = 59
              Top = 3
              Width = 50
              Height = 25
              Caption = 'Edit'
              TabOrder = 2
            end
          end
        end
      end
      object MarqueeTabSheet: TTabSheet
        Caption = 'Marquee'
        ImageIndex = 1
        DesignSize = (
          1007
          290)
        object MarqueeAreaLabel: TLabel
          Left = 16
          Top = 8
          Width = 23
          Height = 13
          Caption = 'Area'
        end
        object MarqueeAreaComboBox: TComboBox
          Left = 16
          Top = 24
          Width = 145
          Height = 21
          DropDownCount = 12
          TabOrder = 0
          Text = 'MarqueeAreaComboBox'
          OnChange = MarqueeAreaComboBoxChange
        end
        object MarqueeDBNavigator: TDBNavigator
          Left = 782
          Top = 24
          Width = 210
          Height = 21
          DataSource = MarqueeDataSource
          Anchors = [akTop, akRight]
          Flat = True
          TabOrder = 2
          ExplicitLeft = 778
        end
        object MarqueeSendToAllButton: TButton
          Left = 167
          Top = 23
          Width = 26
          Height = 23
          Caption = '...'
          TabOrder = 1
          OnClick = MarqueeSendToAllButtonClick
        end
        object MarqueeDBGrid: TDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 64
          Width = 1001
          Height = 223
          Margins.Top = 64
          Align = alClient
          DataSource = MarqueeDataSource
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object DataTabSheet: TTabSheet
        Caption = ' Data'
        ImageIndex = 2
        DesignSize = (
          1007
          290)
        object DatalLabel: TLabel
          Left = 16
          Top = 8
          Width = 52
          Height = 13
          Caption = 'Data (title)'
        end
        object DataIdLabel: TLabel
          Left = 627
          Top = 8
          Width = 10
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Id'
          ExplicitLeft = 631
        end
        object DataKindLabel: TLabel
          Left = 688
          Top = 8
          Width = 20
          Height = 13
          Caption = 'Kind'
        end
        object DataDBNavigator: TDBNavigator
          Left = 782
          Top = 24
          Width = 210
          Height = 21
          DataSource = DataDataSource
          Anchors = [akTop, akRight]
          Flat = True
          TabOrder = 0
        end
        object DataDBEdit: TDBEdit
          Left = 16
          Top = 24
          Width = 597
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'FldData'
          DataSource = DataDataSource
          TabOrder = 1
        end
        object DataCodeDBSynEdit: TDBSynEdit
          Left = 16
          Top = 64
          Width = 975
          Height = 209
          Cursor = crIBeam
          DataField = 'FldCode'
          DataSource = DataDataSource
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Font.Quality = fqClearTypeNatural
          ParentColor = False
          ParentFont = False
          TabOrder = 2
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
          Highlighter = SynHTMLSyn1
        end
        object DataIdDBEdit: TDBEdit
          Left = 627
          Top = 24
          Width = 43
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'FldId'
          DataSource = DataDataSource
          TabOrder = 3
        end
        object DataKindDBComboBox: TDBComboBox
          Left = 684
          Top = 24
          Width = 81
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'FldKind'
          DataSource = DataDataSource
          Items.Strings = (
            ''
            'Md'
            'Js'
            'Css'
            'Html'
            'Json'
            'Txt')
          TabOrder = 4
        end
      end
    end
  end
  object BottomPanel: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 351
    Width = 1015
    Height = 281
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'BottomPanel'
    ShowCaption = False
    TabOrder = 1
    object BottomPageControl: TPageControl
      Left = 0
      Top = 0
      Width = 1015
      Height = 281
      ActivePage = LogTabSheet
      Align = alClient
      TabOrder = 0
      object LogTabSheet: TTabSheet
        Caption = '  Log'
        object LogListBox: TListBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 1001
          Height = 247
          Align = alClient
          BorderStyle = bsNone
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7947776
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemHeight = 17
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object LogClearButton: TButton
      Left = 43
      Top = 0
      Width = 46
      Height = 21
      Caption = 'Clear'
      TabOrder = 1
      OnClick = LogClearButtonClick
    end
  end
  object GeniusTimer: TTimer
    Enabled = False
    OnTimer = GeniusTimerTimer
    Left = 80
    Top = 384
  end
  object MarqueeDataSource: TDataSource
    DataSet = MarqueeADOQuery
    Left = 296
    Top = 440
  end
  object DataDataSource: TDataSource
    DataSet = DataADOTable
    Left = 400
    Top = 440
  end
  object SynHTMLSyn1: TSynHTMLSyn
    Brackets = '<>()[]{}'
    Left = 80
    Top = 440
  end
  object IdHTTPServer: TIdHTTPServer
    Bindings = <>
    DefaultPort = 8081
    OnCommandGet = IdHTTPServerCommandGet
    Left = 80
    Top = 496
  end
  object VfsADOConnection: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Password=secret@123;Persist Security Info=' +
      'True;User ID=sa;Initial Catalog=DbaVfs;Data Source=LOCALHOST'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 191
    Top = 384
  end
  object DataADOTable: TADOTable
    Connection = VfsADOConnection
    CursorType = ctStatic
    TableName = 'TblData'
    Left = 399
    Top = 384
  end
  object MarqueeADOQuery: TADOQuery
    Connection = VfsADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'AreaParam'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select'
      '    FldArea'
      '  , FldType'
      '  , FldMessage'
      '  , FldState'
      '  , FldOrder'
      'from'
      '    DbaVfs.dbo.TblMarquee'
      'where'
      '    FldArea like :AreaParam'
      'order by'
      '    FldOrder')
    Left = 295
    Top = 384
  end
end
