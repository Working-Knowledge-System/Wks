inherited MainForm: TMainForm
  Caption = 'MainForm'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited RightJvNetscapeSplitter: TJvNetscapeSplitter
    Left = 578
    ExplicitLeft = 578
  end
  inherited TopPanel: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited TopPageControl: TPageControl
      inherited XxxTabSheet: TTabSheet
        Caption = 'Server'
        object ServerPortLabel: TLabel [0]
          Left = 112
          Top = 12
          Width = 22
          Height = 15
          Caption = 'Port'
        end
        inherited XxxExitButton: TButton
          Top = 70
          ExplicitTop = 70
        end
        object ServerPortEdit: TEdit
          Left = 140
          Top = 9
          Width = 59
          Height = 23
          TabOrder = 1
          Text = 'ServerPortEdit'
        end
        object ServerStopButton: TButton
          Left = 16
          Top = 39
          Width = 75
          Height = 25
          Caption = 'Stop'
          TabOrder = 2
          OnClick = ServerStopButtonClick
        end
        object ServerStartButton: TButton
          Left = 16
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Start'
          TabOrder = 3
          OnClick = ServerStartButtonClick
        end
      end
    end
  end
  inherited MainPanel: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited MainPageControl: TPageControl
      ExplicitWidth = 531
      inherited LogTabSheet: TTabSheet
        inherited LogTopPanel: TPanel
          StyleElements = [seFont, seClient, seBorder]
          ExplicitWidth = 523
        end
        inherited LogSynEdit: TSynEdit
          ExplicitWidth = 523
        end
      end
    end
  end
  inherited RightPanel: TPanel
    Left = 588
    Width = 420
    StyleElements = [seFont, seClient, seBorder]
    ExplicitLeft = 588
    ExplicitWidth = 420
    inherited RightPageControl: TPageControl
      Width = 414
      ActivePage = TcpTabSheet
      ExplicitWidth = 414
      object TcpTabSheet: TTabSheet
        Caption = '  Tcp'
        object TcpDBGrid: TDBGrid
          Left = 0
          Top = 31
          Width = 406
          Height = 330
          Align = alClient
          BorderStyle = bsNone
          DataSource = TcpDataSource
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
        object TcpTopPanel: TPanel
          Left = 0
          Top = 0
          Width = 406
          Height = 31
          Align = alTop
          BevelOuter = bvNone
          Caption = 'TcpTopPanel'
          ShowCaption = False
          TabOrder = 1
          object TcpCountLabel: TLabel
            AlignWithMargins = True
            Left = 356
            Top = 3
            Width = 79
            Height = 25
            Margins.Left = 16
            Align = alLeft
            Caption = 'TcpCountLabel'
            Layout = tlCenter
            ExplicitHeight = 15
          end
          object TcpDBNavigator: TDBNavigator
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 200
            Height = 25
            DataSource = TcpDataSource
            Align = alLeft
            Flat = True
            TabOrder = 0
          end
          object TcpClearButton: TButton
            AlignWithMargins = True
            Left = 222
            Top = 3
            Width = 51
            Height = 25
            Margins.Left = 16
            Align = alLeft
            Caption = 'Clear'
            TabOrder = 1
            OnClick = TcpClearButtonClick
          end
          object TcpRefreshButton: TButton
            AlignWithMargins = True
            Left = 279
            Top = 3
            Width = 58
            Height = 25
            Align = alLeft
            Caption = 'Refresh'
            TabOrder = 2
            OnClick = TcpRefreshButtonClick
          end
        end
      end
    end
  end
  object MqttADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=secret@123;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=DbaMqtt;Data Source=LOCALHOST'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 280
    Top = 280
  end
  object TcpADOTable: TADOTable
    Connection = MqttADOConnection
    IndexFieldNames = 'FldDateTime DESC'
    TableName = 'TblTcp'
    Left = 280
    Top = 336
  end
  object TcpDataSource: TDataSource
    DataSet = TcpADOTable
    Left = 384
    Top = 336
  end
end
