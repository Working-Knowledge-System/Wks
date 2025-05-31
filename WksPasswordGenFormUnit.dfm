object PasswordGenForm: TPasswordGenForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Pasword Generator'
  ClientHeight = 729
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object PasswordPageControl: TPageControl
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 511
    Height = 657
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    ActivePage = PasswordTabSheet
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 507
    object PasswordTabSheet: TTabSheet
      Caption = 'Password'
      object SpokenLabel: TLabel
        Left = 16
        Top = 341
        Width = 112
        Height = 13
        Caption = 'Spoken &Representation'
        FocusControl = SpokenRichEdit
      end
      object EntropyLabel: TLabel
        Left = 390
        Top = 271
        Width = 66
        Height = 13
        Caption = 'Entropy (bits)'
        FocusControl = EntropyEdit
      end
      object EntropyGroupBox: TGroupBox
        Left = 16
        Top = 171
        Width = 190
        Height = 86
        Caption = ' Entropy to achieve by '
        TabOrder = 0
        object SizeByLengthLabel: TLabel
          Left = 143
          Top = 53
          Width = 26
          Height = 13
          Caption = 'chars'
        end
        object SizeByStrengthLabel: TLabel
          Left = 143
          Top = 25
          Width = 17
          Height = 13
          Caption = 'bits'
        end
        object SizeByLengthSpinEdit: TSpinEdit
          Left = 91
          Top = 50
          Width = 46
          Height = 22
          MaxValue = 64
          MinValue = 1
          TabOrder = 3
          Value = 8
        end
        object SizeByLengthRadioButton: TRadioButton
          Left = 16
          Top = 52
          Width = 69
          Height = 17
          Caption = ' &Length'
          TabOrder = 2
        end
        object SizeByStrengthSpinEdit: TSpinEdit
          Left = 91
          Top = 22
          Width = 46
          Height = 22
          MaxValue = 9999
          MinValue = 1
          TabOrder = 1
          Value = 128
        end
        object SizeByStrengthRadioButton: TRadioButton
          Left = 16
          Top = 24
          Width = 69
          Height = 17
          Caption = ' &Strength'
          TabOrder = 0
        end
      end
      object CharactersGroupBox: TGroupBox
        Left = 16
        Top = 8
        Width = 485
        Height = 149
        Caption = ' Characters Sets to use '
        TabOrder = 1
        object UseUppercaseCheckBox: TCheckBox
          Left = 16
          Top = 47
          Width = 85
          Height = 17
          Caption = ' &Uppercase'
          TabOrder = 0
        end
        object UseLowercaseCheckBox: TCheckBox
          Left = 16
          Top = 24
          Width = 85
          Height = 17
          Caption = ' &Lowercase'
          TabOrder = 1
        end
        object UseDigitCheckBox: TCheckBox
          Left = 16
          Top = 70
          Width = 85
          Height = 17
          Caption = ' &Numbers'
          TabOrder = 2
        end
        object UseSpaceCheckBox: TCheckBox
          Left = 16
          Top = 116
          Width = 85
          Height = 17
          Caption = ' &Space'
          TabOrder = 4
        end
        object UsePunctuationCheckBox: TCheckBox
          Left = 16
          Top = 93
          Width = 85
          Height = 17
          Caption = ' &Punctuation'
          TabOrder = 3
        end
        object UsePunctuationEdit: TEdit
          Left = 101
          Top = 91
          Width = 309
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier'
          Font.Pitch = fpFixed
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Text = 'UsePunctuationEdit'
        end
        object UsePunctuationResetButton: TButton
          Left = 416
          Top = 89
          Width = 51
          Height = 25
          Caption = '&Reset'
          TabOrder = 6
          OnClick = UsePunctuationResetButtonClick
        end
      end
      object RngGroupBox: TRadioGroup
        Left = 228
        Top = 171
        Width = 273
        Height = 86
        Caption = ' Random Number Generator will use '
        Items.Strings = (
          ' Mouse movement'
          ' Internal functions ( Microsoft CryptoAPI )')
        TabOrder = 2
      end
      object PasswordEdit: TEdit
        Left = 144
        Top = 290
        Width = 233
        Height = 21
        Alignment = taCenter
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Pitch = fpFixed
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = 'PasswordEdit'
      end
      object SpokenRichEdit: TRichEdit
        Left = 16
        Top = 360
        Width = 485
        Height = 249
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 4
      end
      object EntropyEdit: TEdit
        Left = 390
        Top = 290
        Width = 111
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 5
      end
      object GenerateButton: TButton
        Left = 17
        Top = 288
        Width = 111
        Height = 25
        Caption = 'Generate Password'
        Default = True
        TabOrder = 6
        OnClick = GenerateButtonClick
      end
    end
    object OptionTabSheet: TTabSheet
      Caption = 'Options'
      object OptionSpaceNoStartOrEndLabel: TLabel
        Left = 36
        Top = 44
        Width = 452
        Height = 39
        Caption = 
          'This reduces security slightly, as an attacker need not bother c' +
          'hecking passwords which *do* begin or end with a space. However,' +
          ' if the password is written down or emailled out (BAD!), it will' +
          ' be easier to read if this option is checked'
        WordWrap = True
      end
      object OptionConstraintsLabel: TLabel
        Left = 16
        Top = 189
        Width = 176
        Height = 13
        Caption = '&Generated passwords must contain :'
        FocusControl = OptionOneFromEachCharsetRadioButton
      end
      object OptionOneFromEachCharsetLabel: TLabel
        Left = 36
        Top = 239
        Width = 408
        Height = 26
        Caption = 
          'This forces the best mix, but if the "space" set is selected, an' +
          ' attacker *knows* that there is a space in the password'
        WordWrap = True
      end
      object OptionOneFromEachCharsetExceptSpaceLabel: TLabel
        Left = 36
        Top = 300
        Width = 242
        Height = 13
        Caption = 'This probably provides the best mix for most users'
        WordWrap = True
      end
      object OptionCharsetsNoConstrainLabel: TLabel
        Left = 36
        Top = 350
        Width = 400
        Height = 26
        Caption = 
          'This means passwords generated may not include characters from a' +
          'll charsets, but all charsets will have an '
        WordWrap = True
      end
      object OptionCharsetsNoConstrainLabel2: TLabel
        Left = 36
        Top = 388
        Width = 332
        Height = 39
        Caption = 
          'The above constraint will only be used to check password generat' +
          'ed. If a password is generated which does not fulfil the criteri' +
          'a selected above, it will be discarded and a new one generated.'
        WordWrap = True
      end
      object OptionCopyToClipboardCheckBox: TCheckBox
        Left = 16
        Top = 105
        Width = 281
        Height = 17
        Caption = ' Automatically copy generated passwords to clipboard'
        TabOrder = 0
        OnClick = OptionCopyToClipboardCheckBoxClick
      end
      object OptionSpaceNoStartOrEndCheckBox: TCheckBox
        Left = 16
        Top = 21
        Width = 257
        Height = 17
        Caption = '&Passwords may not start or end with "space"'
        TabOrder = 1
      end
      object OptionCopyToClipboardWarnCheckBox: TCheckBox
        Left = 36
        Top = 128
        Width = 281
        Height = 17
        Caption = ' Warn when password automatically copied to clipboard'
        TabOrder = 2
      end
      object OptionOneFromEachCharsetRadioButton: TRadioButton
        Left = 16
        Top = 216
        Width = 397
        Height = 17
        Caption = ' At least one character from each selected charset'
        TabOrder = 3
      end
      object OptionOneFromEachCharsetExceptSpaceRadioButton: TRadioButton
        Left = 16
        Top = 280
        Width = 445
        Height = 17
        Caption = 
          ' At least one character from each selected charset, with the exc' +
          'eption of the "space" set'
        TabOrder = 4
      end
      object OptionCharsetsNoConstrainRadioButton: TRadioButton
        Left = 16
        Top = 327
        Width = 113
        Height = 17
        Caption = ' No constraint'
        TabOrder = 5
      end
    end
  end
  object OkButton: TButton
    Left = 184
    Top = 687
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 272
    Top = 687
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object PrintButton: TButton
    Left = 23
    Top = 687
    Width = 75
    Height = 25
    Caption = 'Prin&t ...'
    TabOrder = 3
    OnClick = PrintButtonClick
  end
  object PrintRichEdit: TRichEdit
    Left = 393
    Top = 689
    Width = 75
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'PrintRichEdit')
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object PrintDialog: TPrintDialog
    Left = 472
    Top = 684
  end
end
