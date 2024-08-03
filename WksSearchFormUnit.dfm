object SearchForm: TSearchForm
  Left = 0
  Top = 0
  ActiveControl = OkButton
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Search'
  ClientHeight = 230
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  TextHeight = 13
  object SearchLabel: TLabel
    Left = 16
    Top = 16
    Width = 33
    Height = 13
    Caption = 'Search'
  end
  object SearchComboBox: TComboBox
    Left = 63
    Top = 13
    Width = 398
    Height = 21
    TabOrder = 0
    Text = 'SearchComboBox'
  end
  object OptionGroupBox: TGroupBox
    Left = 69
    Top = 76
    Width = 234
    Height = 140
    Caption = ' Options '
    TabOrder = 1
    object WholeWordCheckBox: TCheckBox
      Left = 16
      Top = 40
      Width = 113
      Height = 17
      Caption = ' Match whole word '
      TabOrder = 0
    end
    object CaseSensitiveCheckBox: TCheckBox
      Left = 16
      Top = 17
      Width = 113
      Height = 17
      Caption = ' Match case'
      TabOrder = 1
    end
    object RegexCheckBox: TCheckBox
      Left = 16
      Top = 109
      Width = 113
      Height = 17
      Caption = ' Regular expression'
      TabOrder = 2
    end
    object SearchBackwardRadioButton: TRadioButton
      Left = 135
      Top = 17
      Width = 89
      Height = 17
      Caption = ' Search Up'
      TabOrder = 3
    end
    object SearchForwardRadioButton: TRadioButton
      Left = 135
      Top = 40
      Width = 89
      Height = 17
      Caption = ' Search Down'
      Checked = True
      TabOrder = 4
      TabStop = True
    end
    object SearchFromCaretCheckBox: TCheckBox
      Left = 16
      Top = 63
      Width = 113
      Height = 17
      Caption = 'Search from cursor'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object SelectionOnlyCheckBox: TCheckBox
      Left = 16
      Top = 86
      Width = 153
      Height = 17
      Caption = 'Search in selected text only'
      TabOrder = 6
    end
  end
  object SearchNextButton: TButton
    Left = 309
    Top = 81
    Width = 81
    Height = 25
    Caption = 'Search Next'
    TabOrder = 2
    Visible = False
  end
  object OkButton: TButton
    Left = 400
    Top = 81
    Width = 61
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object CancelButton: TButton
    Left = 400
    Top = 112
    Width = 61
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
end
