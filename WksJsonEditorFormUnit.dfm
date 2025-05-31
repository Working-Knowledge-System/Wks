inherited JsonEditorForm: TJsonEditorForm
  Caption = 'JsonEditorForm'
  ClientWidth = 1360
  ExplicitWidth = 1372
  TextHeight = 15
  inherited LeftJvNetscapeSplitter: TJvNetscapeSplitter
    ExplicitHeight = 507
  end
  inherited RightJvNetscapeSplitter: TJvNetscapeSplitter
    Left = 1127
    ExplicitLeft = 1135
    ExplicitHeight = 507
  end
  inherited BottomJvNetscapeSplitter: TJvNetscapeSplitter
    Width = 1360
    ExplicitTop = 589
    ExplicitWidth = 1368
  end
  inherited TopPageControl: TPageControl
    Width = 1354
    inherited TopMainTabSheet: TTabSheet
      ExplicitWidth = 1346
    end
  end
  inherited LeftPanel: TPanel
    inherited LeftPageControl: TPageControl
      Height = 503
      inherited JsonTabSheet: TTabSheet
        inherited TreeSplitter: TSplitter
          ExplicitTop = 412
        end
      end
    end
  end
  inherited MainPanel: TPanel
    inherited MainPageControl: TPageControl
      Height = 503
    end
  end
  inherited RightPanel: TPanel
    Left = 1137
    ExplicitLeft = 1133
    inherited RightPageControl: TPageControl
      inherited OptionTabSheet: TTabSheet
        inherited OptionJvScrollMax: TJvScrollMax
          inherited OptionGeneralJvScrollMaxBand: TJvScrollMaxBand
            inherited OptionDirDefaultLabel: TLabel
              Width = 168
            end
            inherited OptionTabWidthLabel: TLabel
              Width = 168
            end
          end
        end
      end
    end
  end
  inherited BottomPanel: TPanel
    Width = 1354
    ExplicitWidth = 1354
    inherited LogFrame: TLogFrame
      Width = 1354
      ExplicitWidth = 1354
      inherited LogPageControl: TPageControl
        Width = 1354
        ExplicitWidth = 1350
        inherited OutputTabSheet: TTabSheet
          ExplicitWidth = 1346
          inherited OutputRichEdit: TRichEdit
            Width = 1344
            ExplicitWidth = 1340
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
  inherited StatusBar: TStatusBar
    Width = 1354
  end
  inherited PythonGUIInputOutput1: TPythonGUIInputOutput
    Output = LogFrame.OutputRichEdit
  end
end
