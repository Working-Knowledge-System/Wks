object PasswordAskForm: TPasswordAskForm
  Left = 441
  Top = 279
  BorderStyle = bsNone
  Caption = 'Password'
  ClientHeight = 99
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PasswordLabel: TLabel
    Left = 32
    Top = 24
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object EnterButton: TButton
    Left = 143
    Top = 41
    Width = 74
    Height = 25
    Caption = 'Enter'
    Default = True
    TabOrder = 0
    OnClick = EnterButtonClick
  end
  object PasswordEdit: TEdit
    Left = 32
    Top = 43
    Width = 105
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = 'PasswordEdit'
  end
end
