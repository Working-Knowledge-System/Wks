object ColorDialogForm: TColorDialogForm
  Left = 0
  Top = 0
  Caption = 'Color Picker'
  ClientHeight = 422
  ClientWidth = 720
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
    Left = 506
    Top = 133
    Width = 69
    Height = 13
    Caption = 'Color Selected'
  end
  object ColorPreviewLabel: TLabel
    Left = 506
    Top = 13
    Width = 66
    Height = 13
    Caption = 'Color Preview'
  end
  object ColorSelectedTrackBar: TTrackBar
    Left = 506
    Top = 258
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
    Left = 390
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 3
    OnClick = OkButtonClick
  end
  object CancelButton: TButton
    Left = 293
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
    OnClick = CancelButtonClick
  end
  object ColorUseRadioGroup: TRadioGroup
    Left = 506
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
    Left = 602
    Top = 340
    Width = 98
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    Text = 'COLORUSEHTMLEDIT'
  end
  object ColorUseRgbEdit: TEdit
    Left = 602
    Top = 313
    Width = 98
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
    Text = 'COLORUSERBGEDIT'
  end
  object ColorPageControl: TPageControl
    Left = 16
    Top = 8
    Width = 469
    Height = 361
    ActivePage = ColorHSLTabSheet
    TabOrder = 6
    object ColorHSLTabSheet: TTabSheet
      Caption = '  HSL'
      ImageIndex = 2
      object ColorHSLColorPicker: THSLColorPicker
        Left = 16
        Top = 16
        Width = 442
        Height = 305
        SelectedColor = 240
        HSPickerHintFormat = 'H: %h S: %hslS'#13'Hex: %hex'
        LPickerHintFormat = 'Luminance: %l'
        TabOrder = 0
        OnChange = ColorHSLColorPickerChange
        OnMouseMove = ColorHSLColorPickerMouseMove
        DesignSize = (
          442
          305)
      end
    end
    object ColorHSLRingTabSheet: TTabSheet
      Caption = 'HSL Ring'
      ImageIndex = 3
      object ColorHSLRingPicker: THSLRingPicker
        Left = 83
        Top = 16
        Width = 326
        Height = 297
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
        Left = 88
        Top = 16
        Width = 305
        Height = 305
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
        Top = 8
        Width = 111
        Height = 13
        Caption = 'Web Safe Named Color'
      end
      object ColorNamedSortByRadioGroup: TRadioGroup
        Left = 352
        Top = 20
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
        Left = 360
        Top = 248
        Width = 81
        Height = 17
        Caption = 'Reversed'
        TabOrder = 0
        OnClick = ColorNamedSortByReversedCheckBoxClick
      end
      object ColorNamedMbColorList: TmbColorList
        Left = 16
        Top = 27
        Width = 321
        Height = 292
        TabOrder = 2
        OnMouseUp = ColorNamedMbColorListMouseUp
      end
    end
  end
  object ColorPreviewMbColorPreview: TmbColorPreview
    Left = 506
    Top = 32
    Width = 194
    Height = 89
  end
  object ColorSelectedMbColorPreview: TmbColorPreview
    Left = 506
    Top = 152
    Width = 194
    Height = 89
  end
end
