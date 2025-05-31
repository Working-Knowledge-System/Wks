object RandomGeneratorForm: TRandomGeneratorForm
  Left = 298
  Top = 214
  Caption = 'Random Data Generator'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    624
    441)
  PixelsPerInch = 96
  TextHeight = 13
  object lblStored: TLabel
    Left = 169
    Top = 352
    Width = 41
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'lblStored'
  end
  object lblRequired: TLabel
    Left = 169
    Top = 371
    Width = 53
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'lblRequired'
  end
  object lblInstructions: TLabel
    Left = 144
    Top = 16
    Width = 329
    Height = 26
    Alignment = taCenter
    Caption = 
      'In order to generate sufficient random data, please waggle the m' +
      'ouse randomly over the area below until it changes color, then c' +
      'lick "OK":'
    WordWrap = True
  end
  object pbOK: TButton
    Left = 106
    Top = 398
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = pbOKClick
  end
  object pbCancel: TButton
    Left = 194
    Top = 398
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = pbCancelClick
  end
  object MouseRNG: TMouseRNG
    Left = 16
    Top = 56
    Width = 592
    Height = 280
    TrailLines = 5
    LineWidth = 3
    LineColor = clRed
    Anchors = [akLeft, akTop, akRight, akBottom]
    UseDockManager = False
    Enabled = False
    ParentColor = False
    OnByteGenerated = MouseRNGByteGenerated
  end
end
