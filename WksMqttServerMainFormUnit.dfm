inherited MainForm: TMainForm
  Caption = 'MainForm'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
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
      inherited LogTabSheet: TTabSheet
        inherited LogTopPanel: TPanel
          StyleElements = [seFont, seClient, seBorder]
        end
      end
    end
  end
end
