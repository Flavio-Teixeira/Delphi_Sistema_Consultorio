unit ColorTbl;
{ Exports type TColorTable and a few subroutines that work
on/with it.
The TColorTable is meant to be used for palette like data structures
of max. 256 entries, which are used in GIF files and BMP files.
The entries in the TColorTable (TColorItem) are three bytes
with r,g,b values.
The TColorTable was designed to be a class, but for some reason it didnt
work in combination with the GIF unit.

Reinier Sterkenburg, Delft, The Netherlands
 March 97: - created
22 Apr 97: - corrected a very stupid bug: the shifts for
             DecodeColor were wrong (4, 2 in stead of 16, 8)
}

interface

uses
  Graphics,
  SysUtils;

type
  TColorItem = packed record      { one item a a color table }
    Red: byte;
    Green: byte;
    Blue: byte;
  end; { TColorItem }

  TColorTable = packed record
    Colors: packed array[0..255] of TColorItem;  { the color table }
    Count: Integer;                      { Actual number of colors }
  end; { TColorTable }
  procedure TColorTable_Create(var CT: TColorTable; NColors: Word);
  {procedure TColorTable_CreateBW(var CT: TColorTable);}
  function  TColorTable_GetColorIndex(var CT: TColorTable;
                                      Color: TColor): Integer;
  {procedure TColorTable_Create16(var CT: TColorTable);}


function DecodeColor(Color: TColor): TColorItem;

implementation

function DecodeColor(Color: TColor): TColorItem;
begin { DecodeColor }
  Result.Blue   := (Color shr 16) and $FF;
  Result.Green := (Color shr 8) and $FF;
  Result.Red  := Color and $FF;
end;  { DecodeColor }

function EncodeColorItem(r, g, b: Byte): TColorItem;
begin { EncodeColorItem }
  Result.Red := r;
  Result.Green := g;
  Result.Blue := b;
end;  { EncodeColorItem }

(***** TColorTable *****)

procedure TColorTable_CreateBW(var CT: TColorTable);
begin { TColorTable_CreateBW }
  CT.Count := 2;
  CT.Colors[0] := EncodeColorItem(0, 0, 0);
  CT.Colors[1] := EncodeColorItem($FF, $FF, $FF);
end;  { TColorTable_CreateBW }

procedure TColorTable_Create16(var CT: TColorTable);
begin { TColorTable_Create16 }
  CT.Count := 16;
  CT.Colors[ 0] := EncodeColorItem($00, $00, $00); { black }
  CT.Colors[ 1] := EncodeColorItem($80, $00, $00); { maroon }
  CT.Colors[ 2] := EncodeColorItem($00, $80, $00); { darkgreen }
  CT.Colors[ 3] := EncodeColorItem($80, $80, $00); { army green }
  CT.Colors[ 4] := EncodeColorItem($00, $00, $80); { dark blue }
  CT.Colors[ 5] := EncodeColorItem($80, $00, $80); { purple }
  CT.Colors[ 6] := EncodeColorItem($00, $80, $80); { blue green }
  CT.Colors[ 7] := EncodeColorItem($80, $80, $80); { dark gray }
  CT.Colors[ 8] := EncodeColorItem($C0, $C0, $C0); { light gray }
  CT.Colors[ 9] := EncodeColorItem($FF, $00, $00); { red }
  CT.Colors[10] := EncodeColorItem($00, $FF, $00); { green }
  CT.Colors[11] := EncodeColorItem($FF, $FF, $00); { yellow }
  CT.Colors[12] := EncodeColorItem($00, $00, $FF); { blue }
  CT.Colors[13] := EncodeColorItem($FF, $00, $FF); { magenta }
  CT.Colors[14] := EncodeColorItem($00, $FF, $FF); { lt blue green }
  CT.Colors[15] := EncodeColorItem($FF, $FF, $FF); { white }
end;  { TColorTable_Create16 }

procedure TColorTable_Create256(var CT: TColorTable);
var ColorNo: Byte;
begin { TColorTable_Create256 }
  CT.Count := 256;
  for ColorNo := 0 to 255
  do CT.Colors[ColorNo] := EncodeColorItem(ColorNo, ColorNo, ColorNo);
end;  { TColorTable_Create256 }

procedure TColorTable_Create(var CT: TColorTable; NColors: Word);
begin { TColorTable_Create }
  CT.Count := NColors;
  case NColors of
    2: TColorTable_CreateBW(CT);
    16: TColorTable_Create16(CT);
    256: TColorTable_Create256(CT);
  end;
end;  { TColorTable_Create }

function TColorTable_GetColorIndex(var CT: TColorTable;
                                   Color: TColor): Integer;
var DecodedColor: TColorItem;
    Found: Boolean;
    Index: Integer;
begin { TColorTable_GetColorIndex }
  DecodedColor := DecodeColor(Color);
  Index := 0;
  Found := False;
  while not Found and (Index <= CT.Count-1)
  do begin
    Found := (DecodedColor.Red = CT.Colors[Index].Red) and
             (DecodedColor.Green = CT.Colors[Index].Green) and
             (DecodedColor.Blue = CT.Colors[Index].Blue);
    if not Found
    then Inc(Index)
  end;
  if not Found
  then Result := -1
  else Result := Index;
end;  { TColorTable_GetColorIndex }

end.
 