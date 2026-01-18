object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 819
  ClientWidth = 902
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 605
    Top = 41
    Height = 778
    Align = alRight
    ExplicitLeft = 632
    ExplicitTop = 47
    ExplicitHeight = 554
  end
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 599
    Height = 772
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 902
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object HelpSpeedButton: TSpeedButton
      Left = 862
      Top = 8
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000520B0000520B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF003100003100FFFFFFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0031009C
        C69C9CC69C003100FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF003100FFFFFF9CC69C003100FFFFFFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        3100003100FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        3100003100FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF00310094BD949CC694003100FFFFFFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF003100FF
        FFFF84AD8494BD94003100FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF003100FFFFFF9CC69C9CC69C003100FFFF
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFF00FFFF
        00FF003100FFFFFF9CC69C9CC69C003100FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFFFFFF003100003100FFFFFFFF00FFFF00FF003100FFFFFF9CC69C0031
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0031009CC69C9CC69C003100FF
        FFFFFFFFFF003100FFFFFF9CC69C003100FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF003100FFFFFF9CC69C7BAD7B003100003100FFFFFF9CC69C9CC69C0031
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF003100FFFFFF9CC69C9C
        C69C9CC69C9CC69C7BAD7B003100FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF003100FFFFFF9CC69C9CC69CFFFFFF003100FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00310000
        3100003100003100FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Margin = 2
      OnClick = HelpSpeedButtonClick
    end
    object ConnectButton: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Connect'
      TabOrder = 0
      OnClick = ConnectButtonClick
    end
    object DisconnectButton: TButton
      Left = 89
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Disconnect'
      TabOrder = 1
      OnClick = DisconnectButtonClick
    end
  end
  object JvScrollMax1: TJvScrollMax
    Left = 608
    Top = 41
    Width = 294
    Height = 778
    ButtonFont.Charset = DEFAULT_CHARSET
    ButtonFont.Color = clWindowText
    ButtonFont.Height = -9
    ButtonFont.Name = 'Small Fonts'
    ButtonFont.Style = []
    AutoHeight = False
    ExpandedHeight = 100
    Align = alRight
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object JvScrollMaxBand1: TJvScrollMaxBand
      Width = 278
      Height = 321
      Caption = 'JvScrollMaxBand1'
      ExpandedHeight = 321
      object DBNavigator1: TDBNavigator
        AlignWithMargins = True
        Left = 6
        Top = 23
        Width = 266
        Height = 25
        DataSource = DataSource1
        Align = alTop
        TabOrder = 0
      end
      object WksRecordEditCtrl1: TWksRecordEditCtrl
        AlignWithMargins = True
        Left = 6
        Top = 54
        Width = 266
        Height = 261
        Align = alClient
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 1
        UseWheelForScrolling = True
        DataSource = DataSource1
        OnDataLoaded = WksRecordEditCtrl1DataLoaded
      end
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Persist Security Info=True;Data Source=LOC' +
      'ALHOST;User ID=sa;Password=31316@Wks;Initial Catalog=DbaEquipmen' +
      't'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 72
    Top = 280
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'TblEquipment'
    Left = 160
    Top = 280
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 240
    Top = 280
  end
end
