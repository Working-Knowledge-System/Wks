object ImageFrame: TImageFrame
  Left = 0
  Top = 0
  Width = 280
  Height = 280
  TabOrder = 0
  object ImageLoadLabel: TLabel
    Left = 16
    Top = 8
    Width = 23
    Height = 13
    Cursor = crHandPoint
    Caption = 'Load'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object ImageSaveLabel: TLabel
    Left = 53
    Top = 8
    Width = 24
    Height = 13
    Cursor = crHandPoint
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object ImageEditLabel: TLabel
    Left = 91
    Top = 8
    Width = 18
    Height = 13
    Cursor = crHandPoint
    Caption = 'Edit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object ImageFitLabel: TLabel
    Left = 157
    Top = 8
    Width = 12
    Height = 13
    Cursor = crHandPoint
    Caption = 'Fit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object ImageClearLabel: TLabel
    Left = 122
    Top = 8
    Width = 25
    Height = 13
    Cursor = crHandPoint
    Caption = 'Clear'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object ImageDBImage: TDBImage
    AlignWithMargins = True
    Left = 16
    Top = 24
    Width = 248
    Height = 240
    Margins.Left = 16
    Margins.Top = 24
    Margins.Right = 16
    Margins.Bottom = 16
    Align = alClient
    DataField = 'FldImage'
    TabOrder = 0
    ExplicitTop = 160
    ExplicitHeight = 161
  end
end
