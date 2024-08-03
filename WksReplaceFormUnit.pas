unit WksReplaceFormUnit;

// replace form derived from ancestor TSearchForm

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
  , WksSearchFormUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TReplaceForm = class(TSearchForm)
    ReplaceComboBox: TComboBox;
    ReplaceLabel: TLabel;
    ReplaceButton: TButton;
    ReplaceAllButton: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
  private
    { Private declarations }
    function  ReplaceTextGet: string;
    procedure ReplaceTextSet(const Value: string);
    function  ReplaceHistoryGet: string;
    procedure ReplaceHistorySet(const Value: string);
  public
    { Public declarations }
    property ReplaceText   : string read ReplaceTextGet    write ReplaceTextSet   ;
    property ReplaceHistory: string read ReplaceHistoryGet write ReplaceHistorySet;
  end;
{$ENDREGION}

{$REGION 'Var'}
//var
//  ReplaceForm: TReplaceForm;
{$ENDREGION}

implementation

{$R *.dfm}

{$REGION 'TReplaceForm'}
function  TReplaceForm.ReplaceTextGet: string;
begin
  Result := ReplaceComboBox.Text;
end;

procedure TReplaceForm.ReplaceTextSet(const Value: string);
begin
  ReplaceComboBox.Text := Value;
end;

function  TReplaceForm.ReplaceHistoryGet: string;
var
  i: integer;
begin
  Result := '';
  for i := 0 to ReplaceComboBox.Items.Count - 1 do begin
    if i >= 16 then
      break;
    if i > 0 then
      Result := Result + #13#10;
    Result := Result + ReplaceComboBox.Items[i];
  end;
end;

procedure TReplaceForm.ReplaceHistorySet(const Value: string);
begin
  ReplaceComboBox.Items.Text := Value;
end;

procedure TReplaceForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  s: string;
  i: integer;
begin
  inherited;

  if ModalResult = mrOK then begin
    s := ReplaceComboBox.Text;
    if s <> '' then begin
      i := ReplaceComboBox.Items.IndexOf(s);
      if i > -1 then begin
        ReplaceComboBox.Items.Delete(i);
        ReplaceComboBox.Items.Insert(0, s);
        ReplaceComboBox.Text := s;
      end else
        ReplaceComboBox.Items.Insert(0, s);
    end;
  end;
end;
{$ENDREGION}

end.
