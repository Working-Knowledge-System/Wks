inherited SqlEditorForm: TSqlEditorForm
  Caption = 'SqlEditorForm'
  ClientWidth = 1360
  ExplicitWidth = 1372
  ExplicitHeight = 799
  TextHeight = 15
  inherited RightJvNetscapeSplitter: TJvNetscapeSplitter
    Left = 1127
    ExplicitLeft = 1127
  end
  inherited BottomJvNetscapeSplitter: TJvNetscapeSplitter
    Width = 1360
    ExplicitWidth = 1360
  end
  inherited TopPageControl: TPageControl
    Width = 1354
    ExplicitWidth = 1350
    inherited TopMainTabSheet: TTabSheet
      ExplicitWidth = 1346
    end
  end
  inherited LeftPanel: TPanel
    ExplicitHeight = 506
    inherited LeftPageControl: TPageControl
      Height = 507
      ExplicitHeight = 506
      inherited JsonTabSheet: TTabSheet
        ExplicitHeight = 477
        inherited TreeSplitter: TSplitter
          Top = 412
        end
        inherited TreeVst: TVirtualStringTree
          Height = 390
        end
        inherited TreeNodeValueSynEdit: TSynEdit
          Top = 418
          ExplicitTop = 417
        end
      end
    end
  end
  inherited MainPanel: TPanel
    ExplicitHeight = 506
    inherited MainPageControl: TPageControl
      Height = 507
      ExplicitHeight = 508
    end
  end
  inherited RightPanel: TPanel
    Left = 1137
    ExplicitLeft = 1133
    inherited RightPageControl: TPageControl
      inherited OptionTabSheet: TTabSheet
        inherited OptionJvScrollMax: TJvScrollMax
          ExplicitHeight = 476
          inherited OptionGeneralJvScrollMaxBand: TJvScrollMaxBand
            inherited OptionDirDefaultLabel: TLabel
              Width = 184
            end
            inherited OptionTabWidthLabel: TLabel
              Width = 184
            end
          end
        end
      end
    end
  end
  inherited BottomPanel: TPanel
    Width = 1354
    inherited LogFrame: TLogFrame
      Width = 1354
      inherited LogPageControl: TPageControl
        Width = 1354
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
    ExplicitWidth = 1350
  end
  inherited PythonGUIInputOutput1: TPythonGUIInputOutput
    Output = LogFrame.OutputRichEdit
  end
end
