inherited ReplaceForm: TReplaceForm
  Caption = 'Replace'
  PixelsPerInch = 96
  TextHeight = 13
  object ReplaceLabel: TLabel [1]
    Left = 16
    Top = 43
    Width = 38
    Height = 13
    Caption = 'Replace'
  end
  object ReplaceComboBox: TComboBox [5]
    Left = 63
    Top = 40
    Width = 398
    Height = 21
    TabOrder = 3
    Text = 'ReplaceComboBox'
  end
  object ReplaceButton: TButton [6]
    Left = 309
    Top = 112
    Width = 81
    Height = 25
    Caption = 'Replace'
    TabOrder = 4
    Visible = False
  end
  object ReplaceAllButton: TButton [7]
    Left = 309
    Top = 143
    Width = 81
    Height = 25
    Caption = 'Replace All'
    TabOrder = 5
    Visible = False
  end
  inherited OkButton: TButton
    TabOrder = 6
  end
  inherited CancelButton: TButton
    TabOrder = 7
  end
end
