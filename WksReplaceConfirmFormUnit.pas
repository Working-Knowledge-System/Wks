unit WksReplaceConfirmFormUnit;

// replace confirmation form

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
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TReplaceConfirmForm = class(TForm)
    YesButton: TButton;
    QuestionLabel: TLabel;
    NoButton: TButton;
    CancelButton: TButton;
    ReplaceAllButton: TButton;
    Image: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  public
    procedure PrepareShow(IvEditorRect: TRect; IvX, IvY1, IvY2: integer; IvSearchText, IvReplaceText: string);
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  ReplaceConfirmForm: TReplaceConfirmForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.DFM}
{$ENDREGION}

{$REGION 'TReplaceConfirmForm'}
procedure TReplaceConfirmForm.FormCreate(Sender: TObject);
begin
  Image.Picture.Icon.Handle := LoadIcon(0, IDI_QUESTION);
end;

procedure TReplaceConfirmForm.FormDestroy(Sender: TObject);
begin
  ReplaceConfirmForm := nil; // ?
end;

procedure TReplaceConfirmForm.PrepareShow(IvEditorRect: TRect; IvX, IvY1, IvY2: integer; IvSearchText, IvReplaceText: string);
var
  w, h: integer;
begin
  QuestionLabel.Caption := Format('Replace this occurence of "%s" with %s""?', [IvSearchText, IvReplaceText]);

  w := IvEditorRect.Right - IvEditorRect.Left;
  h := IvEditorRect.Bottom - IvEditorRect.Top;

  // x
  if w <= Width then
    IvX := IvEditorRect.Left - (Width - w) div 2
  else if IvX + Width > IvEditorRect.Right then
    IvX := IvEditorRect.Right - Width
  else
    IvX := 0;

  // y
  if IvY2 > IvEditorRect.Top + MulDiv(h, 2, 3) then
    IvY2 := IvY1 - Height - 4
  else
    Inc(IvY2, 4);

  // bounds
  SetBounds(IvX, IvY2, Width, Height);
end;
{$ENDREGION}

end.

