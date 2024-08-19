object ColorForm: TColorForm
  Left = 0
  Top = 0
  Caption = 'Color Picker'
  ClientHeight = 422
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 13
  object ColorSelectedLabel: TLabel
    Left = 562
    Top = 133
    Width = 69
    Height = 13
    Caption = 'Color Selected'
  end
  object ColorPreviewLabel: TLabel
    Left = 562
    Top = 13
    Width = 66
    Height = 13
    Caption = 'Color Preview'
  end
  object ColorSelectedTrackBar: TTrackBar
    Left = 562
    Top = 250
    Width = 194
    Height = 20
    Hint = 'Opacity'
    Max = 100
    Position = 100
    TabOrder = 0
    ThumbLength = 15
    TickStyle = tsNone
    OnChange = ColorSelectedTrackBarChange
  end
  object OkButton: TButton
    Left = 410
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 3
    OnClick = OkButtonClick
  end
  object CancelButton: TButton
    Left = 313
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
    OnClick = CancelButtonClick
  end
  object ColorUseRadioGroup: TRadioGroup
    Left = 562
    Top = 295
    Width = 204
    Height = 74
    Caption = ' Use '
    ItemIndex = 0
    Items.Strings = (
      'Color RBG'
      'Color HTML')
    TabOrder = 1
  end
  object ColorUseHtmlEdit: TEdit
    Left = 658
    Top = 340
    Width = 98
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    Text = 'COLORUSEHTMLEDIT'
  end
  object ColorUseRgbEdit: TEdit
    Left = 658
    Top = 313
    Width = 98
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
    Text = 'COLORUSERBGEDIT'
  end
  object ColorPreviewMbColorPreview: TmbColorPreview
    Left = 562
    Top = 32
    Width = 204
    Height = 92
  end
  object ColorSelectedMbColorPreview: TmbColorPreview
    Left = 562
    Top = 152
    Width = 204
    Height = 92
  end
  object ColorPageControl: TPageControl
    Left = 16
    Top = 8
    Width = 521
    Height = 361
    ActivePage = ColorHSLTabSheet
    TabOrder = 8
    object ColorHSLTabSheet: TTabSheet
      Caption = '  HSL'
      ImageIndex = 2
      object ColorHSLColorPicker: THSLColorPicker
        AlignWithMargins = True
        Left = 8
        Top = 2
        Width = 505
        Height = 328
        Margins.Left = 8
        Margins.Top = 2
        Margins.Right = 0
        SelectedColor = 130817
        HSPickerHintFormat = 'H: %h S: %s'#13'Hex: %hex'
        LPickerHintFormat = 'Luminance: %l'
        Align = alClient
        TabOrder = 0
        OnChange = ColorHSLColorPickerChange
        OnMouseMove = ColorHSLColorPickerMouseMove
        ExplicitHeight = 313
        DesignSize = (
          505
          328)
      end
    end
    object ColorHSLRingTabSheet: TTabSheet
      Caption = 'HSL Ring'
      ImageIndex = 3
      object ColorHSLRingPicker: THSLRingPicker
        Left = 104
        Top = 8
        Width = 300
        Height = 300
        RingPickerHintFormat = 'Hue: %h'
        SLPickerHintFormat = 'S: %hslS L: %l'#13'Hex: %hex'
        TabOrder = 0
        OnChange = ColorHSLRingPickerChange
        OnMouseMove = ColorHSLRingPickerMouseMove
      end
    end
    object ColorHexTabSheet: TTabSheet
      Caption = 'Hexagon'
      object ColorHexaColorPicker: THexaColorPicker
        Left = 112
        Top = 3
        Width = 321
        Height = 311
        HintFormat = 'RGB(%r, %g, %b)'#13'Hex: #%hex'
        IntensityText = 'Intensity'
        TabOrder = 0
        Constraints.MinHeight = 85
        Constraints.MinWidth = 93
        OnChange = ColorHexaColorPickerChange
        OnMouseMove = ColorHexaColorPickerMouseMove
      end
    end
    object ColorWebTabSheet: TTabSheet
      Caption = ' Web'
      ImageIndex = 1
      object ColorNamedLabel: TLabel
        Left = 124
        Top = 9
        Width = 111
        Height = 13
        Caption = 'Web Safe Named Color'
      end
      object ColorNamedMbColorList: TmbColorList
        Left = 124
        Top = 23
        Width = 265
        Height = 292
        TabOrder = 0
        OnMouseUp = ColorNamedMbColorListMouseUp
      end
      object ColorNamedSortByRadioGroup: TRadioGroup
        Left = 408
        Top = 17
        Width = 89
        Height = 209
        Caption = ' Sort By '
        ItemIndex = 0
        Items.Strings = (
          'Name'
          'Hue'
          'Saturation'
          'Luminance'
          'Red'
          'Green'
          'Blue'
          'Combo')
        TabOrder = 1
        OnClick = ColorNamedSortByRadioGroupClick
      end
      object ColorNamedSortByReversedCheckBox: TCheckBox
        Left = 416
        Top = 240
        Width = 81
        Height = 17
        Caption = 'Reversed'
        TabOrder = 2
        OnClick = ColorNamedSortByReversedCheckBoxClick
      end
    end
  end
end
