unit WksSpellcheckFormUnit;

interface

{$REGION 'Use'}
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Buttons,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ExtCtrls
  , System.Generics.Collections
  , Winapi.ActiveX
  , MsSpellCheckLib_TLB
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TSpellcheckForm = class(TForm)
    TextMemo: TMemo;
    TextImageList24: TImageList;
    TextActionList: TActionList;
    SpellcheckAction: TAction;
    DoneAction: TAction;
    CancelAction: TAction;
    TopMainToolBar: TToolBar;
    NewToolButton: TToolButton;
    OpenToolButton: TToolButton;
    RunToolButton: TToolButton;
    RightPanel: TPanel;
    ErrorListLabel: TLabel;
    ErrorListBox: TListBox;
    SuggestionListLabel: TLabel;
    SuggestionListBox: TListBox;
    TextLabel: TLabel;
    MainPanel: TPanel;
    RightSplitter: TSplitter;
    LanguageComboBox: TComboBox;
    LanguageLabel: TLabel;
    OptionListBox: TListBox;
    OptionLabel: TLabel;
    InfoPanel: TPanel;
    CorrectiveActionLabel: TLabel;
    LocalizedNameLabel: TLabel;
    ReplacementLabel: TLabel;
    TopPanel: TPanel;
    CorrectSpeedButton: TSpeedButton;
    CorrectionEdit: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure SpellcheckActionExecute(Sender: TObject);
    procedure DoneActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LanguageComboBoxChange(Sender: TObject);
    procedure ErrorListBoxClick(Sender: TObject);
    procedure CorrectSpeedButtonClick(Sender: TObject);
    procedure SuggestionListBoxClick(Sender: TObject);
  private
    { Private declarations }
    procedure SpellCheckerCreate;
  public
    { Public declarations }
    SpellFactory: ISpellCheckerFactory;
    SpellChecker: ISpellChecker;
    SpellErrorList: TList<ISpellingError>;
    class function  Execute(var IvText: string): boolean;
  end;
{$ENDREGION}

{$REGION 'Var'}
//var
//  SpellcheckForm: TSpellcheckForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    System.Rtti
  , System.UITypes
  ;
{$ENDREGION}

{$REGION 'Routine'}
class function TSpellcheckForm.Execute(var IvText: string): boolean;
var
  frm: TSpellcheckForm;
begin
  frm := TSpellcheckForm.Create(nil);
  try
    frm.TextMemo.Text := IvText;
    Result := frm.ShowModal = mrOk;
    if Result then
      IvText := frm.TextMemo.Text;
  finally
    frm.Free;
  end;
end;

procedure TSpellcheckForm.SpellCheckerCreate;
var
  PWC, PWC1: PWideChar;
  Options: IEnumString;
  Fetched: LongInt;
  OptionValue: Byte;
  Option: IOptionDescription;
begin
  if LanguageComboBox.Items.Count > 0 then begin
    CheckOSError(SpellFactory.CreateSpellChecker(
      PChar(LanguageComboBox.Items[LanguageComboBox.ItemIndex]), SpellChecker));

    CheckOSError(SpellChecker.Get_LocalizedName(PWC));
    LocalizedNameLabel.Caption := PWC;
    CheckOSError(SpellChecker.Get_OptionIds(Options));
    while Options.Next(1, PWC, @Fetched) = S_OK do begin
      CheckOSError(SpellChecker.GetOptionDescription(PWC, Option));
      CheckOSError(Option.Get_Heading(PWC1));
      CheckOSError(SpellChecker.GetOptionValue(PWC, OptionValue));
      OptionListBox.Items.Add(string(PWC1) + ' = ' + OptionValue.ToString);
      CoTaskMemFree(PWC);
    end;
  //SpellChecker.AutoCorrect('errror', 'error');
  end;
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TSpellcheckForm.FormCreate(Sender: TObject);
var
  Languages: IEnumString;
  lang: PChar;
  fetched: LongInt;
  idx: integer;
begin
  // gui
  Caption := 'WKS Spellcheck';
  Width := 800;
  Height := 640;
  CorrectionEdit.Clear;

  // spell
  SpellFactory := CoSpellCheckerFactory.Create;
  SpellFactory.Get_SupportedLanguages(Languages);

  SpellErrorList := TList<ISpellingError>.Create;
  while Languages.Next(1, lang, @fetched) = S_OK do begin
    LanguageComboBox.Items.Add(lang);
    CoTaskMemFree(lang);
  end;

  if LanguageComboBox.Items.Count > 0 then begin
    idx := LanguageComboBox.Items.IndexOf('en-US');
    LanguageComboBox.ItemIndex := idx;
    SpellCheckerCreate;
  end;
end;

procedure TSpellcheckForm.FormDestroy(Sender: TObject);
begin
  SpellErrorList.Destroy;
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TSpellcheckForm.CancelActionExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSpellcheckForm.DoneActionExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TSpellcheckForm.SpellcheckActionExecute(Sender: TObject);
var
  errs: IEnumSpellingError;
  err: ISpellingError;
  idx, len: LongWord; // startindex
begin
  ErrorListBox.Clear;
  SpellErrorList.Clear;
  SpellChecker.Check(PChar(TextMemo.Text), errs);
  while errs.Next(err) = S_OK do
    SpellErrorList.Add(err);

  for err in SpellErrorList do begin
    err.Get_StartIndex(idx);
    err.Get_Length(len);
    ErrorListBox.AddItem(Copy(TextMemo.Text, idx + 1, len), nil);
  end;
end;

procedure TSpellcheckForm.CorrectSpeedButtonClick(Sender: TObject);
var
  err, cor: string;
begin
  err := ErrorListBox.Items[ErrorListBox.ItemIndex];
  cor := CorrectionEdit.Text{SuggestionListBox.Items[SuggestionListBox.ItemIndex]};
  if MessageDlg(Format('Correct all "%s" with "%s" ?', [err, cor]), mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    TextMemo.Text := StringReplace(TextMemo.Text, err, cor, [rfReplaceAll]);
    SpellcheckAction.Execute;
    CorrectionEdit.Clear;
  end;
end;
{$ENDREGION}

{$REGION 'Gui'}
procedure TSpellcheckForm.LanguageComboBoxChange(Sender: TObject);
begin
  SpellCheckerCreate;
end;

procedure TSpellcheckForm.ErrorListBoxClick(Sender: TObject);
var
  err: ISpellingError;
  act: CORRECTIVE_ACTION;
  sugs: IEnumString;      // suggestions
  sug : PWideChar;        // suggestion
  rep: PWideChar;         // replacement
  fet: longint;           // fetched
begin
  if ErrorListBox.ItemIndex >= 0 then begin
    err := SpellErrorList[ErrorListBox.ItemIndex];
    CheckOSError(err.Get_CorrectiveAction(act));
    CorrectiveActionLabel.Caption := TRttiEnumerationType.GetName<TCorrectiveAction>(TCorrectiveAction(act));
    CheckOSError(err.Get_Replacement(rep));
    ReplacementLabel.Caption := rep;
    CheckOSError(SpellChecker.Suggest(PChar(ErrorListBox.Items[ErrorListBox.ItemIndex]), sugs));
    SuggestionListBox.Clear;
    while sugs.Next(1, sug, @fet) = S_OK do begin
      SuggestionListBox.Items.Add(sug);
      CoTaskMemFree(sug);
    end;
  end;
end;

procedure TSpellcheckForm.SuggestionListBoxClick(Sender: TObject);
begin
  CorrectionEdit.Text := SuggestionListBox.Items[SuggestionListBox.ItemIndex];
end;
{$ENDREGION}

end.
