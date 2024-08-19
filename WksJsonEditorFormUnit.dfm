inherited JsonEditorForm: TJsonEditorForm
  Caption = 'JsonEditorForm'
  ClientWidth = 1364
  ExplicitWidth = 1376
  TextHeight = 15
  inherited LeftJvNetscapeSplitter: TJvNetscapeSplitter
    ExplicitHeight = 507
  end
  inherited RightJvNetscapeSplitter: TJvNetscapeSplitter
    Left = 1131
    ExplicitLeft = 1135
    ExplicitHeight = 507
  end
  inherited BottomJvNetscapeSplitter: TJvNetscapeSplitter
    Width = 1364
    ExplicitTop = 589
    ExplicitWidth = 1368
  end
  inherited TopPageControl: TPageControl
    Width = 1358
    ExplicitWidth = 1354
    inherited TopMainTabSheet: TTabSheet
      ExplicitWidth = 1350
    end
  end
  inherited LeftPanel: TPanel
    ExplicitHeight = 506
    inherited LeftPageControl: TPageControl
      ExplicitHeight = 506
      inherited JsonTabSheet: TTabSheet
        inherited TreeSplitter: TSplitter
          ExplicitTop = 412
        end
        inherited TreeNodeValueSynEdit: TSynEdit
          ExplicitTop = 417
        end
      end
    end
  end
  inherited MainPanel: TPanel
    ExplicitHeight = 506
    inherited MainPageControl: TPageControl
      ExplicitHeight = 506
    end
  end
  inherited RightPanel: TPanel
    Left = 1141
    ExplicitLeft = 1137
    ExplicitHeight = 506
    inherited RightPageControl: TPageControl
      ExplicitHeight = 506
      inherited OptionTabSheet: TTabSheet
        inherited OptionJvScrollMax: TJvScrollMax
          ExplicitHeight = 476
        end
      end
    end
  end
  inherited BottomPanel: TPanel
    Width = 1358
    ExplicitTop = 598
    ExplicitWidth = 1354
    inherited LogFrame: TLogFrame
      Width = 1358
      inherited LogPageControl: TPageControl
        ExplicitWidth = 1354
        inherited LogTabSheet: TTabSheet
          inherited LogRichEdit: TRichEdit
            ExplicitWidth = 1344
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
    Width = 1358
    ExplicitTop = 738
    ExplicitWidth = 1354
  end
  inherited PythonGUIInputOutput1: TPythonGUIInputOutput
    Output = LogFrame.OutputRichEdit
  end
end
