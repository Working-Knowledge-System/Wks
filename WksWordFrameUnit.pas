unit WksWordFrameUnit;

interface

{$REGION 'Use'}
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  VirtualTrees, DTDBTreeView, DTClientTree, Vcl.DBCtrls, Data.DB,
  Datasnap.DBClient, Soap.SOAPConn, Vcl.StdCtrls, Vcl.ToolWin, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, JvExExtCtrls, JvNetscapeSplitter, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, Vcl.Buttons;
{$ENDREGION}

{$REGION 'Type'}
type
  TWordFrame = class(TFrame)
    TopPanel: TPanel;
    WordInfoLabel: TLabel;
    WordSoapConnection: TSoapConnection;
    WordClientDataSet: TClientDataSet;
    WordDataSource: TDataSource;
    ActionsImageList24: TImageList;
    WordJvDBUltimGrid: TJvDBUltimGrid;
    WordSearchLabel: TLabel;
    WordSearchEdit: TEdit;
    WordSearchFieldComboBox: TComboBox;
    WordSearchFieldLabel: TLabel;
    WordCaseSensitiveCheckBox: TCheckBox;
    WordSearchPartialCheckBox: TCheckBox;
    WordSearchClearSpeedButton: TSpeedButton;
    WordEditCheckBox: TCheckBox;
    WordSoapRefreshSpeedButton: TSpeedButton;
    WordDBNavigator: TDBNavigator;
    procedure WordSearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure WordSearchFieldComboBoxChange(Sender: TObject);
    procedure WordSearchPartialCheckBoxClick(Sender: TObject);
    procedure WordCaseSensitiveCheckBoxClick(Sender: TObject);
    procedure WordClientDataSetAfterScroll(DataSet: TDataSet);
    procedure WordSearchClearSpeedButtonClick(Sender: TObject);
    procedure WordEditCheckBoxClick(Sender: TObject);
    procedure WordSoapRefreshSpeedButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure SoapClose;
    procedure SoapOpen;
    procedure SoapRefresh;
    procedure WordFilterApply(IvCds: TClientDataSet; const IvField, IvFilter: string; IvCaseSensitive: boolean = false);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure WordReload;
  end;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    System.UITypes
  , Wks000Unit
  ;
{$ENDREGION}

{$REGION 'Routines'}
procedure TWordFrame.SoapClose;
begin
  // clientdatasetsclose
  WordClientDataSet.Close;

  // soapclose
  WordSoapConnection.Close;
end;

procedure TWordFrame.SoapOpen;
begin
  // soapopen
  WordSoapConnection.Open;

  // clientdatasetsopen
  WordClientDataSet.Open;
end;

procedure TWordFrame.SoapRefresh;
begin
  SoapClose;
  SoapOpen;
end;

procedure TWordFrame.WordReload;
begin
  Screen.Cursor := crHourGlass;
  try
    SoapRefresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;
{$ENDREGION}

{$REGION 'Frame'}
constructor TWordFrame.Create(AOwner: TComponent);
var
//suc: boolean;
  fbk: string;
  fds: TSortFields;
begin
  inherited Create(AOwner);

  // simulate OnCreate event here
//ShowMessage('Frame created!');

  // ini
  WordInfoLabel.Caption := '';
  WordSearchEdit.Clear; // ensure
  WordSearchEdit.Text               :=     gini.StrGet('Words/SearchText'          , ''   );
  WordSearchFieldComboBox.ItemIndex := abs(gini.IntGet('Words/SearchFieldItemIndex', 1    ));
  WordSearchPartialCheckBox.Checked :=     gini.BooGet('Words/SearchPartial'       , true );
  WordCaseSensitiveCheckBox.Checked :=     gini.BooGet('Words/CaseSensitive'       , false);

  // soap
  {suc :=} TSopRec.SoapConnectionAgentSet(fbk, WordSoapConnection, true);
  {suc :=} TSopRec.SoapConnectionUrlSet(fbk, WordSoapConnection, 'Word'); // http://localhost/WksWordSoapProject.dll/soap
  if gpxy.Use then
    {suc :=} TSopRec.SoapConnectionProxySet(fbk, WordSoapConnection, gpxy.UrlOrAddress, gpxy.Port, gpxy.Username, gpxy.Password);

  // load
  WordReload;

  // gui
  SetLength(fds, 1);
  fds[0].Name  := 'FldItalian';   // name of the field (or column)
  fds[0].Order := JvGridSort_ASC;
  WordJvDBUltimGrid.Sort(fds);
end;

destructor TWordFrame.Destroy;
begin
  // simulate OnDestroy event here
//ShowMessage('Frame destroyed!');

  // ini
  gini.StrSet('Words/SearchText'          , WordSearchEdit.Text              );
//gini.IntSet('Words/SearchFieldItemIndex', WordSearchFieldComboBox.ItemIndex); // *** items disappeared so returs -1 allways ***
  gini.BooSet('Words/SearchPartial'       , WordSearchPartialCheckBox.Checked);
  gini.BooSet('Words/CaseSensitive'       , WordCaseSensitiveCheckBox.Checked);

  // soap
  SoapClose;

  inherited Destroy;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TWordFrame.WordFilterApply(IvCds: TClientDataSet; const IvField, IvFilter: string; IvCaseSensitive: boolean);
begin
  WordClientDataSet.DisableControls;
  try
    // reset
    IvCds.Filtered := false;
    IvCds.FilterOptions := [];

    // exit
    if IvFilter.IsEmpty then
      Exit;

    // filter
    if IvCaseSensitive then
      IvCds.Filter := Format('%s LIKE ''%s''', [IvField, IvFilter])
    else
      IvCds.Filter := Format('UPPER(%s) LIKE ''%s''', [IvField, UpperCase(IvFilter)]);

    // exec
    IvCds.Filtered := true;
  finally
    IvCds.EnableControls;
  end;
end;

procedure TWordFrame.WordSearchEditKeyPress(Sender: TObject; var Key: Char);
var
  fld, src: string;
begin
  if Key = #13 then begin // #13 is the ASCII code for ENTER
    // suppress the default beep
    Key := #0;
    // fieldtosearch
    if WordSearchFieldComboBox.ItemIndex = 0 then begin
      ShowMessage('Not implemented');
      Exit;
    end;
    fld := Format('Fld%s', [WordSearchFieldComboBox.Text]);
    // texttosearch
    src := WordSearchEdit.Text;
    if WordSearchPartialCheckBox.Checked then
      src := Format('%%%s%%', [src]);
    // filter
    WordFilterApply(WordClientDataSet, fld, src, WordCaseSensitiveCheckBox.Checked);
    // fit
    //WordJvDBUltimGrid.AutoSizeColumns;
  end;
end;

procedure TWordFrame.WordSearchClearSpeedButtonClick(Sender: TObject);
var cha: char;
begin
  WordSearchEdit.Clear;
  cha := #13;
  WordSearchEditKeyPress(Sender, cha);
end;

procedure TWordFrame.WordSearchFieldComboBoxChange(Sender: TObject);
var cha: char;
begin
  cha := #13;
  WordSearchEditKeyPress(Sender, cha);
  gini.IntSet('Words/SearchFieldItemIndex', WordSearchFieldComboBox.ItemIndex);
end;

procedure TWordFrame.WordSearchPartialCheckBoxClick(Sender: TObject);
var cha: char;
begin
  cha := #13;
  WordSearchEditKeyPress(Sender, cha);
end;

procedure TWordFrame.WordCaseSensitiveCheckBoxClick(Sender: TObject);
var cha: char;
begin
  cha := #13;
  WordSearchEditKeyPress(Sender, cha);
end;

procedure TWordFrame.WordEditCheckBoxClick(Sender: TObject);
begin
  if WordEditCheckBox.Checked then begin
    WordJvDBUltimGrid.Options := WordJvDBUltimGrid.Options - [dgRowSelect] + [dgEditing];
    WordDBNavigator.Visible := true;
  //WordEditCheckBox.Font.Color := clRed;
    WordEditCheckBox.Font.Style := WordEditCheckBox.Font.Style + [fsBold];
  end else begin
    WordJvDBUltimGrid.Options := WordJvDBUltimGrid.Options - [dgEditing] + [dgRowSelect];
    WordDBNavigator.Visible := false;
  //WordEditCheckBox.Font.Color := clGreen;
    WordEditCheckBox.Font.Style := WordEditCheckBox.Font.Style - [fsBold];
  end;
end;

procedure TWordFrame.WordSoapRefreshSpeedButtonClick(Sender: TObject);
begin
  WordReload;
end;
{$ENDREGION}

{$REGION 'Cds'}
procedure TWordFrame.WordClientDataSetAfterScroll(DataSet: TDataSet);
begin
  WordInfoLabel.Caption := Format('%d records', [DataSet.RecordCount]);
end;
{$ENDREGION}

end.
