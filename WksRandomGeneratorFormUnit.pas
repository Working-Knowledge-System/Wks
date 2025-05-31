unit WksRandomGeneratorFormUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MouseRNG, StdCtrls;

const
  BUFFER_SIZE = 1024*1024*8;  // 1MB of data

type
  TRandomGeneratorForm = class(TForm)
    pbOK: TButton;
    pbCancel: TButton;
    MouseRNG: TMouseRNG;
    lblStored: TLabel;
    lblRequired: TLabel;
    lblInstructions: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pbCancelClick(Sender: TObject);
    procedure pbOKClick(Sender: TObject);
    procedure MouseRNGByteGenerated(Sender: TObject; random: Byte);
  private
  protected
    FRequiredBits: integer;
    FBitsAlreadyGot: integer;
    FBitsCollected: integer;
    FData: array [1..BUFFER_SIZE] of byte;
    procedure UpdateDisplay();
  public
    property RequiredBits: integer write FRequiredBits;
    property BitsAlreadyGot: integer write FBitsAlreadyGot;
    property BitsCollected: integer read FBitsCollected;
    function  GetBitsCollected(count: integer; var buffer: array of byte): integer; // copy up to "count" bits into the buffer, return the number of bits copied, note: "buffer" is indexed from 0
    procedure Wipe();
  end;

implementation

{$R *.DFM}

uses
  SDUGeneral,
  Math;  // min(...)

procedure TRandomGeneratorForm.FormShow(Sender: TObject);
begin
  UpdateDisplay();
  MouseRNG.Enabled := true;
end;

procedure TRandomGeneratorForm.FormResize(Sender: TObject);
var
  twoButtonsFullWidth: integer;
  twoButtonsGap: integer;
begin
  // horizontally center the labels...
  lblInstructions.left := (self.width-lblInstructions.width) div 2;
  lblStored.left := (self.width-lblStored.width) div 2;
  lblRequired.left := (self.width-lblRequired.width) div 2;

  // nicely horizontally center the buttons ...
  twoButtonsGap := pbCancel.left - (pbOK.left + pbOK.width);
  twoButtonsFullWidth := pbOK.width + twoButtonsGap + pbCancel.width;

  pbOK.left := (self.width-twoButtonsFullWidth) div 2;
  pbCancel.left := pbOK.left + pbOK.width + twoButtonsGap;
end;

procedure TRandomGeneratorForm.UpdateDisplay();
var
  enoughGenerated: boolean;
begin
  if FRequiredBits>0 then begin
    lblRequired.visible := true;
    lblRequired.caption := 'Bits required: '+inttostr(FRequiredBits);
    enoughGenerated := (FBitsCollected>=FRequiredBits);
    SDUEnableControl(pbOK, enoughGenerated);
    if (enoughGenerated) then begin
      MouseRNG.Enabled := false;
      MouseRNG.Color := clBtnFace;
      SetFocusedControl(pbOK);
    end;
  end else begin
    lblRequired.visible := FALSE;
    SDUEnableControl(pbOK, TRUE);
  end;
  lblStored.caption := 'Bits generated: '+inttostr(FBitsAlreadyGot + FBitsCollected);
end;

procedure TRandomGeneratorForm.Wipe();
var
  i: integer;
begin
  MouseRNG.Enabled := FALSE;
  for i:=low(FData) to high(FData) do begin
    FData[i] := 0;
  end;
  FRequiredBits:= 0;
  FBitsCollected:= 0;
end;

procedure TRandomGeneratorForm.pbCancelClick(Sender: TObject);
begin
  MouseRNG.Enabled := FALSE;
  Wipe();
  ModalResult := mrCancel;
end;

procedure TRandomGeneratorForm.pbOKClick(Sender: TObject);
begin
  MouseRNG.Enabled := FALSE;
  ModalResult := mrOK;
end;

function  TRandomGeneratorForm.GetBitsCollected(count: integer; var buffer: array of byte): integer;
var
  copyCountBytes: integer;
  i: integer;
begin
  copyCountBytes := min((count div 8), (FBitsCollected div 8));
  for i:=0 to (copyCountBytes-1) do begin
    buffer[i] := FData[(FBitsCollected div 8) - i];
    FData[(FBitsCollected div 8) - i] := 0;
  end;
  FBitsCollected := FBitsCollected - (copyCountBytes * 8);
  Result := copyCountBytes * 8;
end;

procedure TRandomGeneratorForm.MouseRNGByteGenerated(Sender: TObject; random: Byte);
begin
  inc(FBitsCollected, 8);
  FData[(FBitsCollected div 8)] := random;
  UpdateDisplay();
end;

end.


