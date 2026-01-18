unit WksRecordEditCtrlUnit;

interface

{$REGION 'Help'}
{

   -------------------------
  |  Label                  |
  |   -------------------   |
  |  |                   |  |
  |   -------------------   |
  |  Label                  |  |                  | TField
  |   -------------------   |  |___TWksFieldRow___| TLabel
  |  |                   |  |  |                  | TEdit/TMemo
  |   -------------------   |  |                  |
  |  Label                  |
  |   -------------------   |
  |  |                   |  |
  |  |                   |  |
  |  |                   |  |
  |  |                   |  |
  |   -------------------   |
  |                         |
  |                         |
  |                         |
   -------------------------

}
{$ENDREGION}

{$REGION 'Use'}
uses
    System.Classes
  , System.SysUtils
  , System.UITypes
  , System.Variants
  , System.Generics.Collections
  , System.Character
  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.StdCtrls
  , Vcl.ComCtrls // TDateTimePicker
  , Vcl.Forms
  , Data.DB
  , WksTextDialogFormUnit
  , WksListDialogFormUnit
//, WksDateDialogFormUnit (also time and datetime)
//, WksJsonDialogFormUnit
//, WksCsvDialogFormUnit
//, WksSparklineDialogFormUnit
  ;
{$ENDREGION}

{$REGION 'Type'}
type
  TWksRecordEditCtrl = class;

  TWksOfflineEditorEnum = (
    oekNone     // default TEdit with no label-click and dialog inline editor
  , oekMemo     // 4rows TMemo plus an inline TMemo dialod
  , oekDate     // default TDateTimePicker
  , oekTime     // idem
  , oekDateTime // idem
  , oekList     // single column
  , oekGrid     // multi columns, with authoritative column for return value
  , oekTree     // hierarchical, multi columns, with authoritative colum
  );

  TWksRecordEditCtrlLoadedEvent = procedure(Sender: TObject) of object;

  TWksDataLink = class(TDataLink)
  private
    FOwner: TWksRecordEditCtrl;
  protected
    procedure ActiveChanged; override;
    procedure DataSetChanged; override;
    procedure DataSetScrolled(Distance: Integer); override;
  public
    constructor Create(AOwner: TWksRecordEditCtrl);
  end;

  TWksFieldRow = class
  public
    Field: TField;
    LabelCtrl: TLabel;        // TLabel vector?
    EditorCtrl: TWinControl;  // TEdit or TMemo
    Source: string;           // Code, Report (these ones store the sql that get data from everywere, also from Item objects)
    SourceId: integer;        // id to select the query
    SourceField: string;      // field to us as "value-field" authoritative
    destructor Destroy; override;
  end;

  TWksRecordEditCtrl = class(TScrollBox)
  private
    FDataSource: TDataSource; // can be eliminated
    FDataLink: TWksDataLink;  // authoritative owner of the FDataSource reference
    FUpdating: boolean;
    FRows: TObjectList<TWksFieldRow>;
    FOnDataLoaded: TWksRecordEditCtrlLoadedEvent; // fires after the dataset becomes active and the grid has fully built its editor controls, may fire multiple times during the control’s lifetime if the dataset is closed and reopened.
    procedure SetDataSource(Value: TDataSource);
    procedure DoDataLoadedEvent;
    procedure ClearEditors;
    procedure BuildEditors;
    procedure LoadEditors;
    procedure ResizeEditors;
    function  OfflineEditorKind(Field: TField): TWksOfflineEditorEnum;
    procedure OpenOfflineEditor(Row: TWksFieldRow);
    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
    procedure LabelClick(Sender: TObject);
    procedure EditorChange(Sender: TObject);
  protected
    procedure Loaded; override; // is a design-time lifecycle hook, is the earliest safe point to touch the dataset after DFM loading, used to delay UI creation until the DataSource is fully wired
    procedure Notification(AComponent: TComponent; Operation: TOperation); override; // when a component is destroyed, it calls Notification on all components that registered interest in it
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Resize; override;
  published
    property DataSource: TDataSource read FDataSource write SetDataSource;
    property OnDataLoaded: TWksRecordEditCtrlLoadedEvent read FOnDataLoaded write FOnDataLoaded;
    property Align;
    property Anchors;
    property TabOrder;
  end;
{$ENDREGION}

procedure Register;

implementation

{$REGION 'Routine'}
function CamelToText(const IvString: string): string;
var
  i: integer;
  c: char;
begin
  Result := '';
  for i := 1 to Length(IvString) do begin
    c := IvString[i];
    if (i > 1) and IsUpper(c) and ((i = Length(IvString)) or not IvString[i + 1].IsUpper) then
      Result := Result + ' ';

    Result := Result + IvString[i];
  end;

  Result := Trim(Result);
  Result := LowerCase(Result);
  Result[1] := UpCase(Result[1]);
end;
{$ENDREGION}

{$REGION 'TWksDataLink'}
constructor TWksDataLink.Create(AOwner: TWksRecordEditCtrl);
begin
  inherited Create;
  FOwner := AOwner;
  VisualControl := true;
end;

procedure TWksDataLink.ActiveChanged;
begin
  inherited;
  FOwner.BuildEditors;
end;

procedure TWksDataLink.DataSetChanged;
begin
  inherited;
  FOwner.LoadEditors;
end;

procedure TWksDataLink.DataSetScrolled(Distance: Integer);
begin
  inherited;
  FOwner.LoadEditors;
end;
{$ENDREGION}

{$REGION 'TWksFieldRow'}
destructor TWksFieldRow.Destroy;
begin
//if Assigned(Field) then // *** nop, datasource will take care ***
//  Field.Free;

  if Assigned(LabelCtrl) then begin
    LabelCtrl.Parent := nil; // probably not really needed
    LabelCtrl.Free;
    LabelCtrl := nil;
  end;

  if Assigned(EditorCtrl) then begin
    EditorCtrl.Parent := nil; // probably not really needed
    EditorCtrl.Free;
    EditorCtrl := nil;
  end;

  inherited;
end;
{$ENDREGION}

{$REGION 'TWksRecordEditCtrl'}
constructor TWksRecordEditCtrl.Create(AOwner: TComponent);
begin
  inherited;
  FDataLink := TWksDataLink.Create(Self);
  FRows := TObjectList<TWksFieldRow>.Create(true); // owns objects, and will destroy/free them (also hierarchically) when calling .Clear;
  VertScrollBar.Visible := true;
  BorderStyle := bsNone; // bsSingle
end;

destructor TWksRecordEditCtrl.Destroy;
begin
  FDataLink.Free;
  FRows.Free; // destroys/free all row objects AND the list itself
  inherited;
end;

procedure TWksRecordEditCtrl.Loaded;
begin
  inherited;
  if csDesigning in ComponentState then Exit;
  if FDataLink.DataSource = nil then Exit;
  if FDataLink.DataSource.DataSet = nil then Exit;
  if not FDataLink.DataSource.DataSet.Active then Exit;

  // resolve rows info details from DbaSystem.dbo.TblField


  // build editors only after streaming is complete
  BuildEditors;
end;

procedure TWksRecordEditCtrl.DoDataLoadedEvent;
begin
  if Assigned(FOnDataLoaded) then
    FOnDataLoaded(Self);
end;

procedure TWksRecordEditCtrl.Resize;
begin
  inherited;
  if not (csDesigning in ComponentState) then
    ResizeEditors;
end;

procedure TWksRecordEditCtrl.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FDataSource) then begin
    DataSource := nil;
    ClearEditors;
  end;
end;

procedure TWksRecordEditCtrl.SetDataSource(Value: TDataSource);
begin
  if FDataSource <> Value then begin
    FDataSource := Value;
    FDataLink.DataSource := Value;
  //BuildEditors;
  end;
end;

function  TWksRecordEditCtrl.OfflineEditorKind(Field: TField): TWksOfflineEditorEnum;
begin
  if Field = nil then Exit(oekNone);

  if (Field.DataType in [ftMemo, ftWideMemo]) or Field.FieldName.EndsWith('Memo') or Field.FieldName.EndsWith('Note') then
    Result := oekMemo

  else if Field.DataType in [ftDate, ftTime, ftDateTime] then
    Result := oekDate

  else if Field.FieldName.Contains('State') then
    Result := oekList

  else
    Result := oekNone;
end;

procedure TWksRecordEditCtrl.LabelClick(Sender: TObject);
var
  row: TWksFieldRow;
begin
  row := TWksFieldRow(TLabel(Sender).Tag);
  if row = nil then Exit;

  OpenOfflineEditor(row);
end;

procedure TWksRecordEditCtrl.LabelMouseEnter(Sender: TObject);
begin
  if Sender is TLabel then
    TLabel(Sender).Font.Style := TLabel(Sender).Font.Style + [fsUnderline];
end;

procedure TWksRecordEditCtrl.LabelMouseLeave(Sender: TObject);
begin
  if Sender is TLabel then
    TLabel(Sender).Font.Style := TLabel(Sender).Font.Style - [fsUnderline];
end;

procedure TWksRecordEditCtrl.OpenOfflineEditor(Row: TWksFieldRow);
var
  str: string;
  oek: TWksOfflineEditorEnum;
begin
  oek := OfflineEditorKind(Row.Field);

  if oek = oekMemo then begin
    str := TMemo(Row.EditorCtrl).Text;
    if TTextDialogForm.Execute(Row.LabelCtrl.Caption, str) then
      TMemo(Row.EditorCtrl).Text := str;

  end else if oek = oekList then begin
    str := TEdit(Row.EditorCtrl).Text;
    if TListDialogForm.Execute(Row.LabelCtrl.Caption, str, Row.Source, Row.SourceId, Row.SourceField) then
      TEdit(Row.EditorCtrl).Text := str;
  end;
end;

procedure TWksRecordEditCtrl.ClearEditors;
begin
  FRows.Clear;       // will destroys/free all row objects but keeps the list alive
//DestroyComponents; // will try destroys/free again?
  Realign;
  Invalidate;
end;

procedure TWksRecordEditCtrl.ResizeEditors;
var
  row: TWksFieldRow;
  lbl: TLabel;
  edt: TWinControl;
begin
  for row in FRows do begin
    lbl := row.LabelCtrl;
    lbl.Width := ClientWidth - lbl.Left - 16;
    edt := row.EditorCtrl;
    edt.Width := ClientWidth - edt.Left - 16;
  end;
  HorzScrollBar.Range := ClientWidth - 1;
end;

procedure TWksRecordEditCtrl.BuildEditors;
var
  i, top: integer;
  dst: TDataSet;
  fld: TField;
  fna: string;
  typ: TFieldType;
  oek: TWksOfflineEditorEnum;
  lbl: TLabel;
  edt: TWinControl; // editor: TEdit or TMemo
  row: TWksFieldRow;
begin
  ClearEditors;

  if csDesigning in ComponentState then begin
    lbl := TLabel.Create(Self);
    lbl.Parent := Self;
    lbl.Caption := 'TWksRecordEditCtrl (design-time)';
    lbl.Left := 8;
    lbl.Top := 8;
    Exit;
  end;
  if FDataLink.DataSource = nil then Exit;
  if FDataLink.DataSource.DataSet = nil then Exit;
  if not FDataLink.DataSource.DataSet.Active then Exit;

  dst := FDataLink.DataSource.DataSet;

  top := 8;
  for i := 0 to dst.FieldCount - 1 do begin
    // field
    fld := dst.Fields[i];
    fna := fld.FieldName;
    typ := fld.DataType;
    oek := OfflineEditorKind(fld);
    if not fld.Visible then
      Continue;

    // row
    row := TWksFieldRow.Create;
    row.Field := fld;

    // label
    lbl := TLabel.Create(Self);
    lbl.Parent := Self;
    lbl.Caption := CamelToText(fld.DisplayLabel.Substring(3));
    lbl.Left := 16;
    lbl.Top := top;
  if oek in [oekMemo, oekList] then begin
    lbl.Font.Color := clBlue;
    lbl.Font.Style := []; // no underline initially
  //lbl.Font.Style := lbl.Font.Style + [fsUnderline];
    lbl.Cursor := crHandPoint;
    lbl.OnMouseEnter := LabelMouseEnter;
    lbl.OnMouseLeave := LabelMouseLeave;
    lbl.OnClick := LabelClick
  end;
    lbl.Tag := NativeInt(row); // needed if labelclick
    row.LabelCtrl := lbl;

    // row extra info
  if oek in [oekList, oekGrid, oekTree] then begin
    row.Source      := 'Code';
    row.SourceId    := 297;
    row.SourceField := 'FldData2';
  end;

    // editor
    Inc(top, lbl.Height + 0);

    if oek = oekMemo then begin
      edt := TMemo.Create(Self);
      with TMemo(edt) do begin
        ReadOnly := fld.ReadOnly;
        Height := 66;
        ScrollBars := ssNone;
        OnChange := EditorChange;
      end;

    end else if oek = oekDate then begin
      edt := TDateTimePicker.Create(Self);
      with TDateTimePicker(edt) do begin
        Enabled := not fld.ReadOnly;
        Kind := dtkDate;
        ShowCheckbox := true;
        OnChange := EditorChange;
      end;

    end else if typ in [ftBoolean] then begin
      edt := TCheckBox.Create(Self);
      with TCheckBox(edt) do begin
        Enabled := not fld.ReadOnly;
        OnClick := EditorChange;
      end;

    end else begin
      edt := TEdit.Create(Self);
      with TEdit(edt) do begin
        ReadOnly := fld.ReadOnly;
        OnChange := EditorChange;
        if fna.EndsWith('ObjectId') then begin
          Color := clMoneyGreen;
          ReadOnly := true;
        end;
      end;
    end;

    edt.Parent := Self;
    edt.Left := 16;
    edt.Top := top;
    edt.Width := ClientWidth - 16 - 16; if typ in [ftDate, ftDateTime] then edt.Width := edt.Width - 2;
    edt.Tag := NativeInt(row); // needed if editchange
    row.EditorCtrl := edt;

    // collects
    FRows.Add(row);

    // next
    Inc(top, edt.Height + 4);
  end;

  HorzScrollBar.Range := ClientWidth - 1;
  VertScrollBar.Range := top + 12;

  LoadEditors;

  DoDataLoadedEvent;
end;

procedure TWksRecordEditCtrl.LoadEditors;
var
  row: TWksFieldRow;
  fld: TField;
  edt: TWinControl;
begin
  if csDesigning in ComponentState then Exit;
  if FDataLink.DataSource = nil then Exit;
  if FDataLink.DataSource.DataSet = nil then Exit;
  if not FDataLink.DataSource.DataSet.Active then Exit;

  // guarded OnChange (no onchange logic at 1st editors loading)
  FUpdating := true;
  try
    for row in FRows do begin
      fld := TField(row.Field);
      if fld = nil then
        Continue;

      edt := row.EditorCtrl;

      if edt is TMemo then begin
        with TMemo(edt) do begin
          Text := fld.AsString;
        end;

      end else if edt is TDateTimePicker then begin
        with TDateTimePicker(edt) do begin
          if fld.IsNull then begin
          //Checked := false; // any value ignored, field set to null
            Date := 0.0;
            Format := ' ';    // simulate a null value
          end else begin
          //Checked := true;
            Date := fld.AsDateTime;
            Format := EmptyStr;
          end;
        end;

      end else if edt is TCheckBox then begin
        with TCheckBox(edt) do begin
          Checked := fld.AsBoolean;
        end;

      end else begin
        with TEdit(edt) do begin
          Text := fld.AsString;
        end;
      end;
    end;
  finally
    FUpdating := false;
  end;
end;

procedure TWksRecordEditCtrl.EditorChange(Sender: TObject);
var
  row: TWksFieldRow;
  fld: TField;
  dst: TDataSet;
  edt: TWinControl;
begin
  if FUpdating then Exit;
  if csDesigning in ComponentState then Exit;

  edt := Sender as TWinControl;

  row := TWksFieldRow(edt.Tag);

  fld := row.Field;
  if fld = nil then Exit;
  if fld.ReadOnly then Exit;

  dst := fld.DataSet;
  if dst = nil then Exit;
  if not dst.Active then Exit;

  if dst.State = dsBrowse then
    dst.Edit;

  if edt is TMemo then begin
    with TMemo(edt) do begin
      if Text = '' then begin // Text = 'NULL'
        fld.Clear;
      end else begin
        if fld.AsString <> Text then
          fld.AsString := Text;
      end;
    end;

  end else if edt is TDateTimePicker then begin
    with TDateTimePicker(edt) do begin
      Format := EmptyStr;
      if not Checked then begin
        fld.Clear;
      end else begin
        if fld.AsDateTime <> Date then
          fld.AsDateTime := Date
      end;
    end;

  end else if edt is TCheckBox then begin
    with TCheckBox(edt) do begin
      if not Checked then begin
        fld.Clear;
      end else begin
        if fld.AsBoolean <> Checked then
          fld.AsBoolean := Checked
      end;
    end;

  end else begin
    with TEdit(edt) do begin
      if Text = '' then begin
        fld.Clear;
      end else begin
        if fld.AsString <> Text then
          fld.AsString := Text;
      end;
    end;
  end;
end;
{$ENDREGION}

procedure Register;
begin
  RegisterComponents('WKS', [TWksRecordEditCtrl]);
end;

end.
