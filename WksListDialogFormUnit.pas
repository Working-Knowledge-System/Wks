unit WksListDialogFormUnit;

interface

{$REGION 'Use'}
uses
    Winapi.Windows
  , Winapi.Messages
  , System.SysUtils
  , System.Variants
  , System.Classes
  , System.ImageList
  , System.Actions
  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.ExtCtrls
  , Vcl.StdCtrls
  , Vcl.ComCtrls
  , Vcl.Buttons
  , Vcl.ActnList
  , Vcl.ImgList
  , Data.DB
  , Vcl.Grids
  , Vcl.DBGrids
  , Vcl.ToolWin
  , Datasnap.DBClient
  , Soap.SOAPConn
  , Soap.SOAPHTTPClient
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TListDialogForm = class(TForm)
    TopToolBar: TToolBar;
    OkToolButton: TToolButton;
    NewToolButton: TToolButton;
    CancelToolButton: TToolButton;
    MainImageList24: TImageList;
    MainActionList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    NewAction: TAction;
    TopPanel: TPanel;
    ValueListBox: TListBox;
    HelpAction: TAction;
    HelpSpeedButton: TSpeedButton;
    procedure NewActionExecute(Sender: TObject);
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure ValueListBoxDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure HelpActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function  Execute(const IvCaption: string; var IvValue: string; IvSource: string; IvSourceId: integer; IvField: string): boolean;
    function CodeSqlResultRioGet(const IvObjectId: integer; const IvParam2: string): TClientDataSet; // not convenient to move to Wks000Unit otherwise a lot of stuff will be imported into the component itself!
  end;                                                                                               // or create a small WksAllDialogUnit where to centralize the minimum used by all dialogs
{$ENDREGION}

{$REGION 'Var'}
//var
//  ListDialogForm: TListDialogForm;
{$ENDREGION}

implementation

{$REGION 'Use'}
{$R *.dfm}

uses
    WksHelpDialogFormUnit
  ;
{$ENDREGION}

{$REGION 'Routines'}
function TListDialogForm.CodeSqlResultRioGet(const IvObjectId: integer; const IvParam2: string): TClientDataSet;
var
  rio: THTTPRIO;
  con: TSoapConnection;
  cds: TClientDataset;
begin
  // clientdataset
  cds := TClientDataSet.Create(nil);
  try
    // soap connection (MIDAS over SOAP)
    con := TSoapConnection.Create(cds); //<--ownership!

    // soap transport (HTTP)
    rio := THTTPRIO.Create(con); //<--ownership!
    rio.URL := 'https://www.wks.cloud/WksCodeSoapProject.dll/soap';
    rio.HTTPWebNode.UseUTF8InHeader := true;

  //con.RIO := rio;
    con.URL := rio.URL;
    con.Connected := true;

    // cds
    cds.RemoteServer := con;
    cds.ProviderName := 'CodeSqlResultDataSetProvider';

    // parameters
    cds.Params.Clear;
    cds.Params.CreateParam(ftInteger, 'PObjectId', ptInput).AsInteger := IvObjectId;
  //cds.Params.CreateParam(ftString, 'Param2', ptInput).AsString := IvParam2;

    // opendataset
    cds.Open;

    Result := cds; // caller owns it now, and when disposed also the owned objects are disposed (rio, con)
  except
    cds.Free;
    raise;
  end;
end;
{$ENDREGION}

{$REGION 'Execute'}
class function TListDialogForm.Execute(const IvCaption: string; var IvValue: string; IvSource: string; IvSourceId: integer; IvField: string): boolean;
var
  cds: TClientDataset;
  i: integer;
begin
  with TListDialogForm.Create(nil) do
    try
      Caption := IvCaption;

      // dst&load
      cds := CodeSqlResultRioGet(IvSourceId, 'Param2');
      try
        ValueListBox.Items.Add('');
        while not cds.Eof do begin
          ValueListBox.Items.Add(cds.FieldByName(IvField).AsString);
          cds.Next;
        end;
      finally
        cds.Free;
      end;

      // selectcurrent
      for i := 0 to ValueListBox.Items.Count - 1 do begin
        if SameText(ValueListBox.Items[i], IvValue) then begin
          ValueListBox.ItemIndex := i;
          Break;
        end;
      end;

      // end
      Result := ShowModal = mrOk;
      if not Result then
        IvValue := ''
      else
        IvValue := ValueListBox.Items[ValueListBox.ItemIndex];
    finally
      Free;
    end;
end;
{$ENDREGION}

{$REGION 'Form'}
procedure TListDialogForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    CancelAction.Execute // ModalResult := mrCancel
  else if (Key = VK_RETURN) and (ssCtrl in Shift) then // Ctrl+Enter
    OkAction.Execute     // ModalResult := mrOk;
end;
{$ENDREGION}

{$REGION 'Action'}
procedure TListDialogForm.HelpActionExecute(Sender: TObject);
begin
  THelpDialogForm.Execute('Page', '788');
end;

procedure TListDialogForm.OkActionExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TListDialogForm.ValueListBoxDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TListDialogForm.CancelActionExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TListDialogForm.NewActionExecute(Sender: TObject);
begin
  ShowMessage('Not implemented');
end;
{$ENDREGION}

end.

