object LogFrame: TLogFrame
  Left = 0
  Top = 0
  Width = 640
  Height = 140
  ParentShowHint = False
  ShowHint = True
  TabOrder = 0
  object LogPageControl: TPageControl
    Left = 0
    Top = 0
    Width = 640
    Height = 140
    ActivePage = OutputTabSheet
    Align = alClient
    TabOrder = 0
    object OutputTabSheet: TTabSheet
      Caption = 'Output'
      ImageIndex = 1
      OnShow = OutputTabSheetShow
      object OutputRichEdit: TRichEdit
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 630
        Height = 108
        Hint = 'Output'
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'OutputRichEdit')
        ParentFont = False
        PlainText = True
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object LogTabSheet: TTabSheet
      Caption = '   Log'
      ImageIndex = 3
      OnShow = LogTabSheetShow
      object LogRichEdit: TRichEdit
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 630
        Height = 108
        Hint = 'Log'
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'LogRichEdit')
        ParentFont = False
        PlainText = True
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object GridTabSheet: TTabSheet
      Caption = '  Grid'
      ImageIndex = 4
      object GridDBGrid: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 626
        Height = 104
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object SoapTabSheet: TTabSheet
      Caption = ' Soap'
      ImageIndex = 3
      object SoapGridPanel: TGridPanel
        Left = 0
        Top = 0
        Width = 632
        Height = 110
        Align = alClient
        Caption = 'SoapGridPanel'
        ColumnCollection = <
          item
            Value = 50.000000000000000000
          end
          item
            Value = 50.000000000000000000
          end>
        ControlCollection = <
          item
            Column = 1
            Control = SoapResponseLabel
            Row = 0
          end
          item
            Column = 0
            Control = SoapRequestRichEdit
            Row = 1
          end
          item
            Column = 0
            Control = SoapRequestLabel
            Row = 0
          end
          item
            Column = 1
            Control = SoapResponseRichEdit
            Row = 1
          end>
        RowCollection = <
          item
            SizeStyle = ssAbsolute
            Value = 20.000000000000000000
          end
          item
            Value = 100.000000000000000000
          end>
        ShowCaption = False
        TabOrder = 0
        object SoapResponseLabel: TLabel
          AlignWithMargins = True
          Left = 320
          Top = 4
          Width = 50
          Height = 14
          Margins.Left = 4
          Align = alLeft
          Caption = 'Response'
          ExplicitHeight = 15
        end
        object SoapRequestRichEdit: TRichEdit
          AlignWithMargins = True
          Left = 4
          Top = 24
          Width = 309
          Height = 82
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Lines.Strings = (
            'SoapRequestRichEdit')
          ParentFont = False
          PlainText = True
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
        object SoapRequestLabel: TLabel
          AlignWithMargins = True
          Left = 5
          Top = 4
          Width = 42
          Height = 14
          Margins.Left = 4
          Align = alLeft
          Caption = 'Request'
          ExplicitHeight = 15
        end
        object SoapResponseRichEdit: TRichEdit
          AlignWithMargins = True
          Left = 319
          Top = 24
          Width = 309
          Height = 82
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Lines.Strings = (
            'SoapResponseRichEdit')
          ParentFont = False
          PlainText = True
          ScrollBars = ssBoth
          TabOrder = 1
          WordWrap = False
        end
      end
    end
    object OptionTabSheet: TTabSheet
      Caption = 'Options'
      ImageIndex = 2
      object OptionOutputLineWidthMaxLabel: TLabel
        Left = 1
        Top = 43
        Width = 119
        Height = 15
        Alignment = taRightJustify
        Caption = 'Output line max width'
      end
      object OptionOutputLinesMaxLabel: TLabel
        Left = 29
        Top = 16
        Width = 91
        Height = 15
        Alignment = taRightJustify
        Caption = 'Output max lines'
      end
      object OptionOutputLineWidthMaxEdit: TEdit
        Left = 134
        Top = 40
        Width = 67
        Height = 23
        NumbersOnly = True
        TabOrder = 0
        Text = 'OptionOutputLineWidthMaxEdit'
        OnChange = OptionOutputLineWidthMaxEditChange
      end
      object OptionOutputLinesMaxEdit: TEdit
        Left = 134
        Top = 13
        Width = 67
        Height = 23
        NumbersOnly = True
        TabOrder = 1
        Text = 'OptionOutputLineWidthMaxEdit'
        OnChange = OptionOutputLineWidthMaxEditChange
      end
      object OptionSoapShowCheckBox: TCheckBox
        Left = 3
        Top = 69
        Width = 148
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Show Soap Trafic'
        TabOrder = 2
        OnClick = OptionSoapShowCheckBoxClick
      end
      object OptionSaveButton: TButton
        Left = 248
        Top = 12
        Width = 93
        Height = 25
        Caption = 'Save Options'
        TabOrder = 3
        OnClick = OptionSaveButtonClick
      end
    end
  end
  object LogToolBar: TToolBar
    Left = 265
    Top = 1
    Width = 169
    Height = 21
    Align = alNone
    ButtonHeight = 21
    ButtonWidth = 40
    Caption = 'LogToolBar'
    List = True
    ShowCaptions = True
    TabOrder = 1
    object ClearToolButton: TToolButton
      Left = 0
      Top = 0
      Hint = 'Clear current tab'
      AutoSize = True
      Caption = 'Clear'
      ImageIndex = 0
      OnClick = ClearToolButtonClick
    end
    object ClearAllToolButton: TToolButton
      Left = 43
      Top = 0
      Hint = 'Clear both Output and Log'
      Caption = ' All'
      ImageIndex = 2
      OnClick = ClearAllToolButtonClick
    end
    object ClearAutoToolButton: TToolButton
      Left = 83
      Top = 0
      Hint = 'Clear the Output before Print'
      AutoSize = True
      Caption = 'Auto'
      ImageIndex = 2
      Style = tbsCheck
    end
    object WrapToolButton: TToolButton
      Left = 125
      Top = 0
      Hint = 'Words wrap in the Output and Log'
      AutoSize = True
      Caption = 'Wrap'
      ImageIndex = 1
      Style = tbsCheck
      OnClick = WrapToolButtonClick
    end
  end
  object LogOneStaticText: TStaticText
    Left = 450
    Top = 4
    Width = 97
    Height = 15
    AutoSize = False
    Caption = 'LogOneStaticText'
    TabOrder = 2
    Transparent = False
  end
  object LogOneTimer: TTimer
    Interval = 5000
    OnTimer = LogOneTimerTimer
    Left = 44
    Top = 66
  end
end
