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
  , System.Diagnostics
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
  , Data.DB
  , Data.Win.ADODB
  , JvExControls
  , JvExExtCtrls
  , JvExtComponent
  , JvNetscapeSplitter
  , JvScrollMax
  , SynEdit
  , SynEditHighlighter
  , SynEditCodeFolding
  , SynHighlighterSQL
  , SynHighlighterJSON
  , PythonEngine
  , VirtualTrees
  , WksLogFrameUnit
  , WksTextEditorFormUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TSqlEditorForm = class(TTextEditorForm)
    ResultADOConnection: TADOConnection;
    ResultADOQuery: TADOQuery;
    ResultDataSource: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure RunActionExecute(Sender: TObject);
    procedure LayoutActionExecute(Sender: TObject);
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

uses
    Wks000Unit
  ;
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
procedure TSqlEditorForm.LayoutActionExecute(Sender: TObject);
begin
  inherited;

  // override
  RightPageControl.ActivePage := LogFrame.GridTabSheet;
end;

procedure TSqlEditorForm.RunActionExecute(Sender: TObject);
{var
  wat: TStopwatch;
//tab: TTabSheet;
  sql, cos: string;
  rez, ems: integer; // recordcount}
begin
  inherited;
{
  // tab
//tab := TabCurrent;

  // script
  sql := Script;

  // connection
  ResultADOConnection.Close;
  ResultADOConnection.ConnectionString := DBA_CONNECTION_STR;

  // try
  Screen.Cursor := crHourGlass;
  try
    // query
    ResultADOQuery.Close;
    ResultADOQuery.SQL.Text := sql;
    try
      wat := TStopwatch.StartNew;
      ResultADOQuery.Open;
      wat.Stop;
      rez := ResultADOQuery.RecordCount;
      ems := wat.ElapsedMilliseconds;
      ResultDataSource.DataSet := ResultADOQuery;
      LogFrame.LogOne('affected records: %d in %d ms', [rez, ems], fmSuccess);
      LogFrame.GridDs(ResultDataSource);
    except
      on e: Exception do begin
        TMesRec.E(e);
        ResultADOQuery.Close;
        ResultADOConnection.Close;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;}
end;
{$ENDREGION}

end.

