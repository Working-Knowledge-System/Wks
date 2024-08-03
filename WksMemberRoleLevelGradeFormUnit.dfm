object MemberRoleLevelGradeForm: TMemberRoleLevelGradeForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'RoleL Level and Grade'
  ClientHeight = 505
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object RoleUserLabel: TLabel
    Left = 36
    Top = 361
    Width = 80
    Height = 25
    AutoSize = False
    Caption = 'User'
    Layout = tlCenter
  end
  object RoleMemberLabel: TLabel
    Left = 36
    Top = 330
    Width = 80
    Height = 25
    AutoSize = False
    Caption = 'Member'
    Layout = tlCenter
  end
  object RoleSupervisorLabel: TLabel
    Left = 36
    Top = 299
    Width = 80
    Height = 25
    AutoSize = False
    Caption = 'Supervisor'
    Layout = tlCenter
  end
  object RoleManagerLabel: TLabel
    Left = 36
    Top = 268
    Width = 80
    Height = 25
    AutoSize = False
    Caption = 'Manager'
    Layout = tlCenter
  end
  object RoleDirectorLabel: TLabel
    Left = 36
    Top = 237
    Width = 80
    Height = 25
    AutoSize = False
    Caption = 'Director'
    Layout = tlCenter
  end
  object RoleHeadLabel: TLabel
    Left = 36
    Top = 206
    Width = 80
    Height = 25
    AutoSize = False
    Caption = 'Head'
    Layout = tlCenter
  end
  object RoleExecutiveLabel: TLabel
    Left = 36
    Top = 175
    Width = 80
    Height = 25
    AutoSize = False
    Caption = 'Executive'
    Layout = tlCenter
  end
  object RoleAdministratorLabel: TLabel
    Left = 36
    Top = 144
    Width = 80
    Height = 25
    AutoSize = False
    Caption = 'Administrator'
    Layout = tlCenter
  end
  object RoleArchitectLabel: TLabel
    Left = 36
    Top = 113
    Width = 80
    Height = 25
    AutoSize = False
    Caption = 'Architect'
    Layout = tlCenter
  end
  object RoleSystemLabel: TLabel
    Left = 36
    Top = 82
    Width = 80
    Height = 25
    AutoSize = False
    Caption = 'System'
    Layout = tlCenter
  end
  object LevelGuestLabel: TLabel
    Left = 122
    Top = 54
    Width = 67
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Guest'
  end
  object LevelJuniorLabel: TLabel
    Left = 195
    Top = 54
    Width = 67
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Junior'
  end
  object LevelStaffLabel: TLabel
    Left = 341
    Top = 54
    Width = 67
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Staff'
  end
  object LevelSeniorLabel: TLabel
    Left = 268
    Top = 54
    Width = 67
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Senior'
  end
  object LevelPrincipalLabel: TLabel
    Left = 414
    Top = 54
    Width = 67
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Principal'
  end
  object RoleAxisLabel: TLabel
    Left = 36
    Top = 49
    Width = 34
    Height = 21
    Caption = 'Role'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LevelAxisLabel: TLabel
    Left = 279
    Top = 20
    Width = 40
    Height = 21
    Caption = 'Level'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RoleLevelGradeLabel: TLabel
    Left = 122
    Top = 411
    Width = 359
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = 'Grade'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton71: TSpeedButton
    Left = 195
    Top = 144
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '71'
    OnClick = SpeedButton00Click
  end
  object SpeedButton72: TSpeedButton
    Left = 268
    Top = 144
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '72'
    OnClick = SpeedButton00Click
  end
  object SpeedButton73: TSpeedButton
    Left = 341
    Top = 144
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '73'
    OnClick = SpeedButton00Click
  end
  object SpeedButton74: TSpeedButton
    Left = 414
    Top = 144
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '74'
    OnClick = SpeedButton00Click
  end
  object SpeedButton70: TSpeedButton
    Left = 122
    Top = 144
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '70'
    OnClick = SpeedButton00Click
  end
  object SpeedButton90: TSpeedButton
    Left = 122
    Top = 82
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '90'
    OnClick = SpeedButton00Click
  end
  object SpeedButton80: TSpeedButton
    Left = 122
    Top = 113
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '80'
    OnClick = SpeedButton00Click
  end
  object SpeedButton60: TSpeedButton
    Left = 122
    Top = 175
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '60'
    OnClick = SpeedButton00Click
  end
  object SpeedButton50: TSpeedButton
    Left = 122
    Top = 206
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '50'
    OnClick = SpeedButton00Click
  end
  object SpeedButton40: TSpeedButton
    Left = 122
    Top = 237
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '40'
    OnClick = SpeedButton00Click
  end
  object SpeedButton30: TSpeedButton
    Left = 122
    Top = 268
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '30'
    OnClick = SpeedButton00Click
  end
  object SpeedButton20: TSpeedButton
    Left = 122
    Top = 299
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '20'
    OnClick = SpeedButton00Click
  end
  object SpeedButton10: TSpeedButton
    Left = 122
    Top = 330
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '10'
    OnClick = SpeedButton00Click
  end
  object SpeedButton00: TSpeedButton
    Left = 122
    Top = 361
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '00'
    OnClick = SpeedButton00Click
  end
  object SpeedButton31: TSpeedButton
    Left = 195
    Top = 268
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '31'
    OnClick = SpeedButton00Click
  end
  object SpeedButton32: TSpeedButton
    Left = 268
    Top = 268
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '32'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton00Click
  end
  object SpeedButton33: TSpeedButton
    Left = 341
    Top = 268
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '33'
    OnClick = SpeedButton00Click
  end
  object SpeedButton34: TSpeedButton
    Left = 414
    Top = 268
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '34'
    OnClick = SpeedButton00Click
  end
  object SpeedButton21: TSpeedButton
    Left = 195
    Top = 299
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '21'
    OnClick = SpeedButton00Click
  end
  object SpeedButton22: TSpeedButton
    Left = 268
    Top = 299
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '22'
    OnClick = SpeedButton00Click
  end
  object SpeedButton23: TSpeedButton
    Left = 341
    Top = 299
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '23'
    OnClick = SpeedButton00Click
  end
  object SpeedButton24: TSpeedButton
    Left = 414
    Top = 299
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '24'
    OnClick = SpeedButton00Click
  end
  object SpeedButton11: TSpeedButton
    Left = 195
    Top = 330
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '11'
    OnClick = SpeedButton00Click
  end
  object SpeedButton12: TSpeedButton
    Left = 268
    Top = 330
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '12'
    OnClick = SpeedButton00Click
  end
  object SpeedButton13: TSpeedButton
    Left = 341
    Top = 330
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '13'
    OnClick = SpeedButton00Click
  end
  object SpeedButton14: TSpeedButton
    Left = 414
    Top = 330
    Width = 67
    Height = 25
    AllowAllUp = True
    Caption = '14'
    OnClick = SpeedButton00Click
  end
  object GradeShape: TShape
    Left = 122
    Top = 361
    Width = 67
    Height = 25
    Brush.Style = bsClear
    Pen.Color = clRed
    Pen.Width = 3
  end
  object LevelShape: TShape
    Left = 122
    Top = 49
    Width = 67
    Height = 25
    Brush.Style = bsClear
    Pen.Color = clRed
  end
  object RoleShape: TShape
    Left = 31
    Top = 361
    Width = 85
    Height = 25
    Brush.Style = bsClear
    Pen.Color = clRed
  end
  object OkButton: TButton
    Left = 192
    Top = 460
    Width = 89
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TButton
    Left = 319
    Top = 460
    Width = 89
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = CancelButtonClick
  end
end
