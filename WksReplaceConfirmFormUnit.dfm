object ReplaceConfirmForm: TReplaceConfirmForm
  Left = 176
  Top = 158
  BorderStyle = bsDialog
  Caption = 'Replace Confirm'
  ClientHeight = 98
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object QuestionLabel: TLabel
    Left = 60
    Top = 12
    Width = 261
    Height = 44
    AutoSize = False
    WordWrap = True
  end
  object Image: TImage
    Left = 16
    Top = 16
    Width = 32
    Height = 32
  end
  object YesButton: TButton
    Left = 8
    Top = 67
    Width = 75
    Height = 23
    Caption = '&Yes'
    Default = True
    ModalResult = 6
    TabOrder = 0
  end
  object NoButton: TButton
    Left = 87
    Top = 67
    Width = 75
    Height = 23
    Caption = '&No'
    ModalResult = 7
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 166
    Top = 67
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object ReplaceAllButton: TButton
    Left = 245
    Top = 67
    Width = 75
    Height = 23
    Caption = 'Yes to &all'
    ModalResult = 14
    TabOrder = 3
  end
end
