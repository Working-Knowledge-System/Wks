object TextStatsForm: TTextStatsForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Text Statistics'
  ClientHeight = 306
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object CharGroupBox: TGroupBox
    Left = 24
    Top = 20
    Width = 169
    Height = 213
    Caption = ' Characters '
    TabOrder = 0
    object CharTotalLabel: TLabel
      Left = 26
      Top = 28
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object CharTotalZLabel: TLabel
      Left = 106
      Top = 28
      Width = 5
      Height = 13
      Caption = '?'
    end
    object CharDigitLabel: TLabel
      Left = 26
      Top = 47
      Width = 26
      Height = 13
      Caption = 'Digits'
    end
    object CharDigitZLabel: TLabel
      Left = 106
      Top = 47
      Width = 5
      Height = 13
      Caption = '?'
    end
    object CharLetterLabel: TLabel
      Left = 26
      Top = 66
      Width = 34
      Height = 13
      Caption = 'Letters'
    end
    object CharLetterZLabel: TLabel
      Left = 106
      Top = 66
      Width = 5
      Height = 13
      Caption = '?'
    end
    object CharUpperLabel: TLabel
      Left = 42
      Top = 104
      Width = 34
      Height = 13
      Caption = 'Uppers'
    end
    object CharUpperZLabel: TLabel
      Left = 106
      Top = 104
      Width = 5
      Height = 13
      Caption = '?'
    end
    object CharLowerLabel: TLabel
      Left = 42
      Top = 85
      Width = 34
      Height = 13
      Caption = 'Lowers'
    end
    object CharLowerZLabel: TLabel
      Left = 106
      Top = 85
      Width = 5
      Height = 13
      Caption = '?'
    end
    object CharPunctuationLabel: TLabel
      Left = 26
      Top = 123
      Width = 62
      Height = 13
      Caption = 'Punctuations'
    end
    object CharPunctuationZLabel: TLabel
      Left = 106
      Top = 123
      Width = 5
      Height = 13
      Caption = '?'
    end
    object CharSeparatorLabel: TLabel
      Left = 26
      Top = 142
      Width = 53
      Height = 13
      Caption = 'Separators'
    end
    object CharSymbolLabel: TLabel
      Left = 26
      Top = 161
      Width = 39
      Height = 13
      Caption = 'Symbols'
    end
    object CharWhitespaceLabel: TLabel
      Left = 26
      Top = 180
      Width = 65
      Height = 13
      Caption = 'White Spaces'
    end
    object CharSeparatorZLabel: TLabel
      Left = 106
      Top = 142
      Width = 5
      Height = 13
      Caption = '?'
    end
    object CharSymbolZLabel: TLabel
      Left = 106
      Top = 161
      Width = 5
      Height = 13
      Caption = '?'
    end
    object CharWhitespaceZLabel: TLabel
      Left = 106
      Top = 180
      Width = 5
      Height = 13
      Caption = '?'
    end
  end
  object WordGroupBox: TGroupBox
    Left = 208
    Top = 20
    Width = 169
    Height = 213
    Caption = ' Words '
    TabOrder = 1
    object WordTotalLabel: TLabel
      Left = 26
      Top = 28
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object WordTotalZLabel: TLabel
      Left = 106
      Top = 28
      Width = 5
      Height = 13
      Caption = '?'
    end
  end
  object LineGroupBox: TGroupBox
    Left = 392
    Top = 20
    Width = 169
    Height = 213
    Caption = ' Lines '
    TabOrder = 2
    object LineTotalLabel: TLabel
      Left = 26
      Top = 28
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object LineTotalZLabel: TLabel
      Left = 106
      Top = 28
      Width = 5
      Height = 13
      Caption = '?'
    end
  end
  object OkButton: TButton
    Left = 256
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 3
  end
end
