unit WksJsonEditorFormUnit;

{ *** DERIVED FROM WksTextEditorFormUnit *** }

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.Actions
  , System.Classes
  , System.ImageList
  , System.SysUtils
  , System.Variants
  , Vcl.ActnList
  , Vcl.Buttons
  , Vcl.ComCtrls
  , Vcl.Controls
  , Vcl.Dialogs
  , Vcl.ExtCtrls
  , Vcl.ExtDlgs
  , Vcl.Forms
  , Vcl.Graphics
  , Vcl.ImgList
  , Vcl.Menus
  , Vcl.PythonGUIInputOutput
  , Vcl.StdCtrls
  , Vcl.ToolWin
  , JvExControls
  , JvExExtCtrls
  , JvExtComponent
  , JvNetscapeSplitter
  , JvScrollMax
  , SynEdit
  , SynEditHighlighter
  , SynEditCodeFolding
  , SynHighlighterJSON
  , PythonEngine
  , VirtualTrees
  , WksLogFrameUnit
  , WksTextEditorFormUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TJsonEditorForm = class(TTextEditorForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function  Execute(var IvJson: string; var IvFbk: string): boolean; // indicate text is changed or not
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  JsonEditorForm: TJsonEditorForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}
{$ENDREGION}

{$REGION 'Routine'}

  {$REGION 'Execute'}
class function TJsonEditorForm.Execute(var IvJson: string; var IvFbk: string): boolean;
var
  frm: TJsonEditorForm;
begin
  // form
  frm := TJsonEditorForm.Create(nil);

  // forismodalinvokedbyclient
  frm.FormIsModalInvoked := true;

  // temporarytransfer
  frm.Script := IvJson;

  // waitforclose
  try
    Result := frm.ShowModal = mrOk;
    if Result then begin
      IvFbk  := 'Json script changed';
      IvJson := frm.SynEditCurrent.Text;
    end else
      IvFbk  := 'Json script unchanged';
    //IvJson := should be unchanged;
  finally
  //FreeAndNil(frm);
    frm.Release;
  end;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Form'}
procedure TJsonEditorForm.FormCreate(Sender: TObject);
begin
  inherited;

  // specializeit
  Caption := Format('%s - [JSON Editor]', [Caption]);

  // custombutton: *** enable all necessary for sql editor ***
  // nothing for now
end;
{$ENDREGION}

{$REGION 'Action'}
{$ENDREGION}

end.


