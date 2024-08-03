unit WksTextStatsFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TTextStatsForm = class(TForm)
    CharGroupBox: TGroupBox;
    CharTotalLabel: TLabel;
    CharTotalZLabel: TLabel;
    CharDigitLabel: TLabel;
    CharDigitZLabel: TLabel;
    CharLetterLabel: TLabel;
    CharLetterZLabel: TLabel;
    CharUpperLabel: TLabel;
    CharUpperZLabel: TLabel;
    CharLowerLabel: TLabel;
    CharLowerZLabel: TLabel;
    CharPunctuationLabel: TLabel;
    CharPunctuationZLabel: TLabel;
    CharSeparatorLabel: TLabel;
    CharSymbolLabel: TLabel;
    CharWhitespaceLabel: TLabel;
    CharSeparatorZLabel: TLabel;
    CharSymbolZLabel: TLabel;
    CharWhitespaceZLabel: TLabel;
    WordGroupBox: TGroupBox;
    LineGroupBox: TGroupBox;
    WordTotalLabel: TLabel;
    WordTotalZLabel: TLabel;
    LineTotalLabel: TLabel;
    LineTotalZLabel: TLabel;
    OkButton: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
    class function  Execute(const IvTextToAnalize: TStrings): boolean;
  end;

//var
  //TextStatsForm: TTextStatsForm;

implementation

{$R *.dfm}

uses
    Wks000Unit
  ;

class function  TTextStatsForm.Execute(const IvTextToAnalize: TStrings): boolean;
var
  f: TTextStatsForm;
  t, k: string;
  d{, n}, l, r, u, p, s, y, w: integer;
  wz, lz: integer; // words, lines
begin
  t := IvTextToAnalize.Text;
  f := TTextStatsForm.Create(nil);

  // chars
  TTxtRec.TxtCharsFrequency(IvTextToAnalize, d{, n}, l, r, u, p, s, y, w, k);
  f.CharTotalZLabel.Caption       := Length(t).ToString;
  f.CharDigitZLabel.Caption       := d.ToString;
  f.CharLetterZLabel.Caption      := l.ToString;
  f.CharLowerZLabel.Caption       := r.ToString;
  f.CharUpperZLabel.Caption       := u.ToString;
  f.CharPunctuationZLabel.Caption := p.ToString;
  f.CharSeparatorZLabel.Caption   := s.ToString;
  f.CharSymbolZLabel.Caption      := y.ToString;
  f.CharWhitespaceZLabel.Caption  := w.ToString;

  // words
  wz := TTxtRec.TxtWordsCount(IvTextToAnalize);
  f.WordTotalZLabel.Caption       := wz.ToString;

  // lines
  f.LineTotalZLabel.Caption       := IvTextToAnalize.Count.ToString;

  try
    Result := f.ShowModal = mrOk;
  finally
  //FreeAndNil(f);
    f.Release;
  end;
end;

end.
