unit Wks000AggUnit;

interface

uses
    Winapi.Windows
  , Vcl.Graphics
  , AggColor
  ;

function ColorToAggColor(IvColor: TColor): TAggColor;

implementation

function ColorToAggColor(IvColor: TColor): TAggColor;
begin
  if IvColor < 0 then
    IvColor := GetSysColor(IvColor and $000000FF);

  Result.Rgba8.R :=  IvColor and $FF            ;
  Result.Rgba8.G := (IvColor and $FF00  ) shr  8;
  Result.Rgba8.B := (IvColor and $FF0000) shr 16;
  Result.Rgba8.A := $FF;
end;

end.
