unit WksSearchFormUnit;

{*** SEARCH FORM ANCESTOR for replace form ***}

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
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TSearchForm = class(TForm)
    SearchLabel: TLabel;
    SearchComboBox: TComboBox;
    OptionGroupBox: TGroupBox;
    WholeWordCheckBox: TCheckBox;
    CaseSensitiveCheckBox: TCheckBox;
    RegexCheckBox: TCheckBox;
    SearchBackwardRadioButton: TRadioButton;
    SearchForwardRadioButton: TRadioButton;
    SearchNextButton: TButton;
    OkButton: TButton;
    CancelButton: TButton;
    SearchFromCaretCheckBox: TCheckBox;
    SelectionOnlyCheckBox: TCheckBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function  BackwardsGet: boolean;
    procedure BackwardsSet(const Value: boolean);
    function  CaseSensitiveGet: boolean;
    procedure CaseSensitiveSet(const Value: boolean);
    function  RegExGet: boolean;
    procedure RegExSet(const Value: boolean);
    function  SearchTextGet: string;
    procedure SearchTextSet(const Value: string);
    function  SearchHistoryGet: string;
    procedure SearchHistorySet(const Value: string);
    function  WholeWordGet: boolean;
    procedure WholeWordSet(const Value: boolean);
    function  SearchFromCaretGet: boolean;
    procedure SearchFromCaretSet(const Value: boolean);
    function  SelectionOnlyGet: boolean;
    procedure SelectionOnlySet(const Value: boolean);
  public
    { Public declarations }
    property SearchText     : string  read SearchTextGet      write SearchTextSet       ;
    property SearchHistory  : string  read SearchHistoryGet   write SearchHistorySet    ;
    property CaseSensitive  : boolean read CaseSensitiveGet   write CaseSensitiveSet    ;
    property WholeWord      : boolean read WholeWordGet       write WholeWordSet        ;
    property RegEx          : boolean read RegExGet           write RegExSet            ;
    property Backwards      : boolean read BackwardsGet       write BackwardsSet        ; // or forward
    property SearchFromCaret: boolean read SearchFromCaretGet write SearchFromCaretSet  ;
    property SelectionOnly  : boolean read SelectionOnlyGet   write SelectionOnlySet    ;
  end;
{$ENDREGION}

{$REGION 'Var'}
//var
//  SearchForm: TSearchForm;
{$ENDREGION}

implementation

{$R *.dfm}

{$REGION 'TSearchForm'}
procedure TSearchForm.FormShow(Sender: TObject);
begin
  SearchComboBox.SetFocus;
  SearchForwardRadioButton.Checked := true;
end;

function  TSearchForm.SearchTextGet: string;
begin
  Result := SearchComboBox.Text;
end;

procedure TSearchForm.SearchTextSet(const Value: string);
begin
  SearchComboBox.Text := Value;
end;

function  TSearchForm.SearchHistoryGet: string;
var
  i: integer;
begin
  Result := '';
  for i := 0 to SearchComboBox.Items.Count - 1 do begin
    if i >= 16 then
      break;
    if i > 0 then
      Result := Result + #13#10;
    Result := Result + SearchComboBox.Items[i];
  end;
end;

procedure TSearchForm.SearchHistorySet(const Value: string);
begin
  SearchComboBox.Items.Text := Value;
end;

function  TSearchForm.CaseSensitiveGet: boolean;
begin
  Result := CaseSensitiveCheckBox.Checked;
end;

procedure TSearchForm.CaseSensitiveSet(const Value: boolean);
begin
  CaseSensitiveCheckBox.Checked := Value;
end;

function  TSearchForm.RegExGet: boolean;
begin
  Result := RegexCheckBox.Checked;
end;

procedure TSearchForm.RegExSet(const Value: boolean);
begin
  RegexCheckBox.Checked := Value;
end;

function  TSearchForm.BackwardsGet: boolean;
begin
  Result := SearchBackwardRadioButton.Checked;
end;

procedure TSearchForm.BackwardsSet(const Value: boolean);
begin
  SearchBackwardRadioButton.Checked := Value;
end;

function  TSearchForm.WholeWordGet: boolean;
begin
  Result := WholeWordCheckBox.Checked;
end;

procedure TSearchForm.WholeWordSet(const Value: boolean);
begin
  WholeWordCheckBox.Checked := Value;
end;

function  TSearchForm.SearchFromCaretGet: boolean;
begin
  Result := SearchFromCaretCheckBox.Checked;
end;

procedure TSearchForm.SearchFromCaretSet(const Value: boolean);
begin
  SearchFromCaretCheckBox.Checked := Value;
end;

function  TSearchForm.SelectionOnlyGet: boolean;
begin
  Result := SelectionOnlyCheckBox.Checked;
end;

procedure TSearchForm.SelectionOnlySet(const Value: boolean);
begin
  SelectionOnlyCheckBox.Checked := Value;
end;

procedure TSearchForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  s: string;
  i: integer;
begin
  if ModalResult = mrOK then begin
    s := SearchComboBox.Text;
    if s <> '' then begin
      i := SearchComboBox.Items.IndexOf(s);
      if i > -1 then begin
        SearchComboBox.Items.Delete(i);
        SearchComboBox.Items.Insert(0, s);
        SearchComboBox.Text := s;
      end else
        SearchComboBox.Items.Insert(0, s);
    end;
  end;
end;
{$ENDREGION}

end.
