unit WksMemberRoleLevelGradeFormUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.StdCtrls
  , Vcl.ExtCtrls
  , Vcl.Buttons
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TMemberRoleLevelGradeForm = class(TForm)
    RoleUserLabel: TLabel;
    RoleMemberLabel: TLabel;
    RoleSupervisorLabel: TLabel;
    RoleManagerLabel: TLabel;
    RoleDirectorLabel: TLabel;
    RoleHeadLabel: TLabel;
    RoleExecutiveLabel: TLabel;
    RoleAdministratorLabel: TLabel;
    RoleArchitectLabel: TLabel;
    RoleSystemLabel: TLabel;
    LevelGuestLabel: TLabel;
    LevelJuniorLabel: TLabel;
    LevelStaffLabel: TLabel;
    LevelSeniorLabel: TLabel;
    LevelPrincipalLabel: TLabel;
    RoleAxisLabel: TLabel;
    LevelAxisLabel: TLabel;
    RoleLevelGradeLabel: TLabel;
    OkButton: TButton;
    CancelButton: TButton;
    SpeedButton71: TSpeedButton;
    SpeedButton72: TSpeedButton;
    SpeedButton73: TSpeedButton;
    SpeedButton74: TSpeedButton;
    SpeedButton70: TSpeedButton;
    SpeedButton90: TSpeedButton;
    SpeedButton80: TSpeedButton;
    SpeedButton60: TSpeedButton;
    SpeedButton50: TSpeedButton;
    SpeedButton40: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton00: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    GradeShape: TShape;
    LevelShape: TShape;
    RoleShape: TShape;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure SpeedButton00Click(Sender: TObject);
  private
    { Private declarations }
    FRole : string;
    FLevel: string;
    FGrade: integer;
  public
    { Public declarations }
    class function  Execute(var IvRole, IvLevel: string; var IvGrade: integer; var IvFbk: string): boolean;
    function  IdxFromRole(IvRole: string): integer;
    function  IdxFromLevel(IvLevel: string): integer;
    function  RoleFromIdx(IvRoleIdx: integer): string;
    function  LevelFromIdx(IvLevelIdx: integer): string;
    function  GradeFromRoleLevel(IvRole, IvLevel: string): integer;
    function  RoleFromGrade(IvGrade: integer): string;
    function  LevelFromGrade(IvGrade: integer): string;
    procedure RoleLevelGradeSet;
  end;
{$ENDREGION}

{$REGION 'Var'}
//var
  //MemberRoleLevelGradeForm: TMemberRoleLevelGradeForm; // force to manually create, use and dispose
{$ENDREGION}

implementation

{$R *.dfm}

{$REGION 'Routine'}
class function TMemberRoleLevelGradeForm.Execute(var IvRole, IvLevel: string; var IvGrade: integer; var IvFbk: string): boolean;
var
  nam: string;
  but: TSpeedButton;
  frm: TMemberRoleLevelGradeForm;
begin
  frm := TMemberRoleLevelGradeForm.Create(nil);
  nam := Format('SpeedButton%.*d', [2, IvGrade]);
  but := frm.FindComponent(nam) as TSpeedButton;
  frm.SpeedButton00Click(but);
  try
    Result := frm.ShowModal = mrOk;
    if Result then begin
      IvRole  := frm.FRole ;
      IvLevel := frm.FLevel;
      IvGrade := frm.FGrade;
      IvFbk := Format('Role Level Grade set to "%s %s %d"', [IvRole, IvLevel, IvGrade]);
    end else
      IvFbk := Format('Role Level Grade "%s %s %d" not changed', [IvRole, IvLevel, IvGrade]);
  finally
  //FreeAndNil(frm);
    frm.Release;
  end;
end;

function  TMemberRoleLevelGradeForm.IdxFromRole(IvRole: string): integer;
begin
       if IvRole = 'User'          then Result := 0
  else if IvRole = 'Member'        then Result := 1
  else if IvRole = 'Supervisor'    then Result := 2
  else if IvRole = 'Manager'       then Result := 3
  else if IvRole = 'Director'      then Result := 4
  else if IvRole = 'Head'          then Result := 5
  else if IvRole = 'Executive'     then Result := 6
  else if IvRole = 'Administrator' then Result := 7
  else if IvRole = 'Architect'     then Result := 8
  else if IvRole = 'System'        then Result := 9
  else                                  Result := 0;
end;

function  TMemberRoleLevelGradeForm.IdxFromLevel(IvLevel: string): integer;
begin
       if IvLevel = 'Guest'        then Result := 0
  else if IvLevel = 'Junior'       then Result := 1
  else if IvLevel = 'Senior'       then Result := 2
  else if IvLevel = 'Staff'        then Result := 3
  else if IvLevel = 'Principal'    then Result := 4
  else                                  Result := 0;
end;

function  TMemberRoleLevelGradeForm.RoleFromIdx(IvRoleIdx: integer): string;
begin
  case IvRoleIdx of
  0:   Result := 'User'         ;
  1:   Result := 'Member'       ;
  2:   Result := 'Supervisor'   ;
  3:   Result := 'Manager'      ;
  4:   Result := 'Director'     ;
  5:   Result := 'Head'         ;
  6:   Result := 'Executive'    ;
  7:   Result := 'Administrator';
  8:   Result := 'Architect'    ;
  9:   Result := 'System'       ;
  else Result := 'User'         ;
  end;
end;

function  TMemberRoleLevelGradeForm.LevelFromIdx(IvLevelIdx: integer): string;
begin
  case IvLevelIdx of
  0:   Result := 'Guest'    ;
  1:   Result := 'Junior'   ;
  2:   Result := 'Senior'   ;
  3:   Result := 'Staff'    ;
  4:   Result := 'Principal';
  else Result := 'Guest'    ;
  end;
end;

function  TMemberRoleLevelGradeForm.RoleFromGrade(IvGrade: integer): string;
var
  idx: integer;
begin
  idx := IvGrade mod 10;
  Result := RoleFromIdx(idx);
end;

function  TMemberRoleLevelGradeForm.LevelFromGrade(IvGrade: integer): string;
var
  idx: integer;
begin
  idx := IvGrade div 10;
  Result := LevelFromIdx(idx);
end;

function  TMemberRoleLevelGradeForm.GradeFromRoleLevel(IvRole, IvLevel: string): integer;
begin
  if 'UserDirectorHeadExecutiveArchitectSystem'.Contains(IvRole) then
    IvLevel := 'Guest';
  Result := 10 * IdxFromRole(IvRole) + IdxFromLevel(IvLevel);
end;

procedure TMemberRoleLevelGradeForm.RoleLevelGradeSet;
begin
  RoleLevelGradeLabel.Caption := Format('%s %s %d', [FRole, FLevel, FGrade]);
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TMemberRoleLevelGradeForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult := mrAbort; // ---> [ close form and Exit ]
end;

procedure TMemberRoleLevelGradeForm.OkButtonClick(Sender: TObject);
begin
  ModalResult := mrOk;    // ---> [ close form and Exit ]
end;
{$ENDREGION}

procedure TMemberRoleLevelGradeForm.SpeedButton00Click(Sender: TObject);
var
  nam: string;
  row, col: integer;
  but: TSpeedButton;
begin
  but := Sender as TSpeedButton;
  nam := but.Name;
  row := Copy(nam, 12, 1).ToInteger;
  col := Copy(nam, 13, 1).ToInteger;
  FRole  := RoleFromIdx(row);
  FLevel := LevelFromIdx(col);
  FGrade := GradeFromRoleLevel(FRole, FLevel);
  RoleLevelGradeSet;
  but.Down := true;

  GradeShape.Left := but.Left;
  GradeShape.Top  := but.Top ;
  RoleShape.Top   := but.Top ;
  LevelShape.Left := but.Left;
end;

end.
