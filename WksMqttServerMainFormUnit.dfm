inherited MainForm: TMainForm
  Caption = 'MainForm'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited TopPanel: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited TopPageControl: TPageControl
      inherited XxxTabSheet: TTabSheet
        Caption = 'Server'
        object PortLabel: TLabel [0]
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
        object PortEdit: TEdit
          Left = 140
          Top = 9
          Width = 59
          Height = 23
          TabOrder = 1
          Text = 'PortEdit'
        end
        object StopButton: TButton
          Left = 16
          Top = 39
          Width = 75
          Height = 25
          Caption = 'Stop'
          TabOrder = 2
          OnClick = StopButtonClick
        end
        object StartButton: TButton
          Left = 16
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Start'
          TabOrder = 3
          OnClick = StartButtonClick
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
          inherited LogLineLabel: TLabel
            Height = 33
            StyleElements = [seFont, seClient, seBorder]
          end
        end
        inherited LogRichEdit: TRichEdit
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited RequestTabSheet: TTabSheet
        inherited RequestTxtRichEdit: TRichEdit
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited RequestHexRichEdit: TRichEdit
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited RequestTopPanel: TPanel
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited ResponseTabSheet: TTabSheet
        inherited ResponseHexRichEdit: TRichEdit
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited ResponseTxtRichEdit: TRichEdit
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited ResponseTopPanel: TPanel
          StyleElements = [seFont, seClient, seBorder]
        end
      end
    end
  end
end
