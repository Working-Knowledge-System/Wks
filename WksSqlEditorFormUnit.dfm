inherited SqlEditorForm: TSqlEditorForm
  Caption = 'SqlEditorForm'
  ExplicitWidth = 1372
  ExplicitHeight = 798
  TextHeight = 15
  inherited LeftJvNetscapeSplitter: TJvNetscapeSplitter
    ExplicitHeight = 506
  end
  inherited RightJvNetscapeSplitter: TJvNetscapeSplitter
    ExplicitLeft = 1127
    ExplicitHeight = 506
  end
  inherited BottomJvNetscapeSplitter: TJvNetscapeSplitter
    ExplicitTop = 588
    ExplicitWidth = 1360
  end
  inherited TopPageControl: TPageControl
    ExplicitWidth = 1350
    inherited TopMainTabSheet: TTabSheet
      ExplicitWidth = 1346
    end
  end
  inherited LeftPanel: TPanel
    ExplicitHeight = 505
    inherited LeftPageControl: TPageControl
      Height = 506
      ExplicitHeight = 505
      inherited JsonTabSheet: TTabSheet
        ExplicitHeight = 476
        inherited TreeSplitter: TSplitter
          Top = 411
          ExplicitTop = 412
        end
        inherited TreeVst: TVirtualStringTree
          Height = 389
        end
        inherited TreeNodeValueSynEdit: TSynEdit
          Top = 417
          ExplicitTop = 416
        end
      end
    end
  end
  inherited MainPanel: TPanel
    ExplicitHeight = 505
    inherited MainPageControl: TPageControl
      Height = 506
      ExplicitHeight = 505
    end
  end
  inherited RightPanel: TPanel
    ExplicitLeft = 1133
    ExplicitHeight = 505
    inherited RightPageControl: TPageControl
      ExplicitHeight = 505
      inherited OptionTabSheet: TTabSheet
        inherited OptionJvScrollMax: TJvScrollMax
          ExplicitHeight = 475
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
    ExplicitTop = 598
    ExplicitWidth = 1354
    inherited LogFrame: TLogFrame
      ExplicitWidth = 1354
      inherited LogPageControl: TPageControl
        ExplicitWidth = 1350
        inherited OutputTabSheet: TTabSheet
          inherited OutputRichEdit: TRichEdit
            ExplicitWidth = 1340
          end
        end
        inherited GridTabSheet: TTabSheet
          inherited GridDBGrid: TDBGrid
            Width = 626
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
      inherited LogToolBar: TToolBar
        inherited ClearToolButton: TToolButton
          ExplicitWidth = 43
        end
        inherited ClearAutoToolButton: TToolButton
          ExplicitWidth = 42
        end
        inherited WrapToolButton: TToolButton
          ExplicitWidth = 44
        end
      end
    end
  end
  inherited StatusBar: TStatusBar
    ExplicitTop = 737
    ExplicitWidth = 1350
  end
  inherited PythonGUIInputOutput1: TPythonGUIInputOutput
    Output = LogFrame.OutputRichEdit
  end
  object ResultADOConnection: TADOConnection
    LoginPrompt = False
    Left = 736
    Top = 376
  end
  object ResultADOQuery: TADOQuery
    Connection = ResultADOConnection
    Parameters = <>
    Left = 856
    Top = 376
  end
  object ResultDataSource: TDataSource
    DataSet = ResultADOQuery
    Left = 976
    Top = 376
  end
end
