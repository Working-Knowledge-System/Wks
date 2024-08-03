unit WksSqlEditorFormUnit;

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
  , SynHighlighterSQL
  , PythonEngine
  , VirtualTrees
  , WksLogFrameUnit
  , WksTextEditorFormUnit, SynHighlighterJSON
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TSqlEditorForm = class(TTextEditorForm)
    procedure FormCreate(Sender: TObject);
    procedure RunActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function  Execute(var IvSql: string; const IvConnectionJson: string; var IvFbk: string): boolean; // indicate sql is changed or not
  end;
{$ENDREGION}

{$REGION 'Var'}
var
  SqlEditorForm: TSqlEditorForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}
{$ENDREGION}

{$REGION 'Routine'}

  {$REGION 'Execute'}
class function TSqlEditorForm.Execute(var IvSql: string; const IvConnectionJson: string; var IvFbk: string): boolean;
var
  frm: TSqlEditorForm;
begin
  // form
  frm := TSqlEditorForm.Create(nil);

  // forismodalinvokedbyclient
  frm.FormIsModalInvoked := true;

  // temporarytransfer
  frm.Script := IvSql;

  // waitforclose
  try
    Result := frm.ShowModal = mrOk;
    if Result then begin
      IvFbk := 'Sql script changed';
      IvSql := frm.SynEditCurrent.Text;
    end else
      IvFbk := 'Sql script unchanged';
    //IvSql := should be unchanged;
  finally
  //FreeAndNil(frm);
    frm.Release;
  end;
end;
  {$ENDREGION}

{$ENDREGION}

{$REGION 'Form'}
procedure TSqlEditorForm.FormCreate(Sender: TObject);
begin
  inherited;

  // specializeit
  Caption := Format('%s - [SQL Editor]', [Caption]);

  // custombutton: *** enable all necessary for sql editor ***
  RunToolButton.Visible             := true;
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TSqlEditorForm.RunActionExecute(Sender: TObject);
//var
//  tab: TTabSheet;
//  sql, opt: string;
begin
  inherited;

  // continue from parent form: tabcurrent
//  tab := TabCurrent;

//  sql := Script;
end;
{$ENDREGION}

end.

