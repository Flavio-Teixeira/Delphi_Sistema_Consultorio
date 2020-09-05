unit GifUnit;
{ Exports TGifFile and TGifSubImage classes.
Needs non-VCL units:
ColorTbl, DynArrB, GifDecl, MoreUtil, Progress, FmProgr
The latter three can be easily left out if necessary.

by Reinier Sterkenburg (February-August 1997)
   r.p.sterkenburg@dataweb.nl
   www.dataweb.nl/~r.p.sterkenburg

Known bugs / Left to do:
- Check for memory leaks
- Opening Read-Only gif files (at the Reset statement) gives error:
  File Access denied
- Handling of numbers of colors in TGifFile (global color map) and
  TGifSubImage (local color map) is not completely right, but it works
  in normal cases with just a global color map; ought to be completed someday
- Nicer implementation (using same data structures and identifiers in
  the Decode and Encode subroutines)

Before using the GIF format in any commercial application
be sure you know the legal issues for this format!

Versions (for older versions see the file versions.txt):
10 Mar 97: - first version (1.00) released by uploading it to
             the Delphi Super Page (freeware)
17 Mar 97: - moved the comments about older version
             to separate file (versions.txt)
           - added TGifSubImage.Destroy and TGifImage.Destroy
18 Mar 97: - made the unit also work under Delphi 1.0, by changing the type
             of the 'CompressedRasterData' from a huge string into
             a specially made TEncodedBytes/TByteBuffer (see unit GifDecl);
             also made some obvious D2-D1 modifications involving
             SetLength, Application.Initialize, and the use of Longint
 3 Apr 97: - renamed AsTBitmap to AsBitmap
           - Made AsBitmap also a method of TGifSubImage;
             added field FGifImage to TGifSubImage;
             moved SaveToStream from TGifFile to TGifSubImage
 5 Apr 97: - added FBitmap as field to TGifSubImage, for speed advantage
13 Apr 97: - Made animation extension work, through functions AnimateInterval;
             see also unit GifImgs (with TGifImage)
           - released this version as version 2.00
24 Jul 97: - added comment: two bugs found by users:
             - reset of read-only files
           - Corrected a bug: number of colors in Localcolormap
             now assigned
 2 Aug 97: - Solved two memory leaks (LineBytes objects were not freed)
           - added try-except block which catches EListError in
             TGifImage.DecodeRasterData. It seems that some Gif-creating
             software leaves out the rest of the pixels when they are all
             zero. Now these files can also be read and displayed successfully.
           - EStringlistError also caught to get it also to work in Delphi 3
14 Aug 97: - PixelString is now a TByteBuffer in stead of a string.
             This solves a bug that occurred in Delphi 1 when strings
             became longer than 255 characters
}

interface

uses
  WinProcs,        { Imports RGB }
  WinTypes,        { Imports TBitmapInfoHeader }
{ declared these Windows units before Graphics so
  TBitmap from Graphics is used }
  Classes,         { Imports TList }
  ColorTbl,        { Imports TColorTable }
  Controls,        { Imports Cursor values }
  Dialogs,         { Imports ShowMessage }
  DynArrB,         { Imports TByteArray2D }
  Forms,           { Imports Screen }
  GifDecl,         { Imports constant and type declarations }
  Graphics,        { Imports TColor }
  Progress,        { Imports ShowProgress }
  SysUtils;        { Imports UpperCase }

type
  TGifFile = class;
  TGifSubImage = class(TObject)
  private
    FGifFile: TGifFile;
    FBitmap: TBitmap;
    LZWCodeSize: Byte;
    CompressedRasterData: TByteBuffer;
    constructor Create(NColors: Word; Parent: TGifFile);
    destructor Destroy; override;
    function  Copy: TGifSubImage;

    procedure DecodeStatusbyte;
    procedure ReadImageDescriptor(var infile: File);
    procedure ReadLocalColorMap(var infile: File);
    procedure ReadRasterData(var infile: File);
    procedure DecodeRasterData;
    procedure LoadFromOpenInfile(var infile: File);

    procedure WriteImageDescriptor(var outfile: File);
    procedure WriteLocalColorMap(var outfile: File);
    procedure EncodeRasterdata;
    procedure WriteRasterData(var outfile: File);
  public
    ImageDescriptor: TImageDescriptor;
    Interlaced: Boolean;
    HasLocalColorMap: Boolean;
    Extensions: TList;
    BitsPerPixel: Byte;
    Pixels: TByteArray2D;
    LocalColorMap: TColorTable;
    function  AnimateInterval: Word;
    function  AsBitmap: TBitmap;
    procedure EncodeStatusbyte;
    procedure SaveToStream(Stream: TStream);
  end; { TGifSubImage }

  TGifFile = class(TObject)
  private
    procedure DecodeStatusByte;
    procedure ReadExtensionBlocks(var infile: File;
                                  var SeparatorChar: Char;
                                  var Extensions: TList);
    procedure ReadSignature(var infile: File);
    procedure ReadScreenDescriptor(var infile: File);
    procedure ReadGlobalColorMap(var infile: File);

    procedure EncodeStatusByte;
    procedure WriteSignature(var outfile: File);
    procedure WriteScreenDescriptor(var outfile: File);
    procedure WriteGlobalColorMap(var outfile: File);
  public
    Header: TGifHeader;
    ScreenDescriptor: TLogicalScreenDescriptor;
    HasGlobalColorMap: Boolean;
    GlobalColorMap: TColorTable;
    BitsPerPixel: Byte;
    SubImages: TList;
    constructor Create;
    destructor Destroy; override;
    procedure AddSubImage(Colormap: TColorTable;
                          PixelMatrix: TByteArray2D);
    function  AsBitmap: TBitmap;
    function  AnimateInterval: Word;
    function  GetSubImage(Index: Integer): TGifSubImage;
    procedure LoadFromFile(filename: String);
    procedure SaveToFile(filename: String);
  end; { TGifFile }


procedure BitmapToPixelmatrix(Bitmap: TBitmap;
                              var Colormap: TColorTable;
                              var Pixels: TByteArray2D);
{ Converts the pixels of a TBitmap into a matrix of pixels (PixelArray)
and constructs the Color table in the same process. }


implementation


procedure BitmapToPixelmatrix(Bitmap: TBitmap;
                              var Colormap: TColorTable;
                              var Pixels: TByteArray2D);
{ Converts the pixels of a TBitmap into a matrix of pixels (PixelArray)
and constructs the Color table in the same process. }
var
  i, j: Integer;
  PixelVal: TColor;
  ColorIndex: Integer;
begin { BitmapToPixelmatrix }
  Colormap.Count := 0;
  with Bitmap
  do begin
    Pixels := TByteArray2D.Create(Width, Height);
    ShowProgress(0);
    for j := 1 to Height
    do begin
      for i := 1 to Width
      do begin
        PixelVal := Canvas.Pixels[i-1, j-1];
        ColorIndex := TColorTable_GetColorIndex(ColorMap, PixelVal);
        if ColorIndex = -1
        then begin
          Colormap.Colors[Colormap.Count] := DecodeColor(PixelVal);
          ColorIndex := Colormap.Count;
          Inc(Colormap.Count); { no check on > 256 yet }
        end;
        Pixels[i, j] := ColorIndex;
      end;
      ShowProgress(j/Height)
    end;
  end; { with }
  if Colormap.Count > 2
  then if Colormap.Count <= 16
  then Colormap.Count := 16
  else if Colormap.Count < 256
  then Colormap.Count := 256;
end;  { BitmapToPixelmatrix }


procedure MakeFlat(PixelMatrix: TByteArray2D;
                   Interlaced: Boolean;
                   var PixelArray: TBigByteArray);
{ Convert a matrix of pixels into a linear array of pixels,
taking interlacing into account if necessary }
var
  InterlacePass: Integer;
  i, j, Index, LineNo: Longint;
begin { MakeFlat }
  InterlacePass := 1;
  with PixelMatrix
  do begin
    PixelArray := TBigByteArray.Create(Count1 * Count2);
    Index := 1;
    LineNo := 0;
    for j := 1 to Count2
    do begin
      for i := 1 to Count1
      do begin
        PixelArray[Index] := PixelMatrix[i, LineNo+1];
        Inc(Index);
      end;
      if not Interlaced
      then Inc(LineNo)
      else LineNo := NextLineNo(LineNo, Count2, InterlacePass);
    end;
  end; { with }
end;  { MakeFlat }


procedure ReadColor(var infile: File; var Color: TColor);
var r, g, b: Byte;
begin { ReadColor }
  BlockRead(infile, r, 1);
  BlockRead(infile, g, 1);
  BlockRead(infile, b, 1);
  Color := RGB(r, g, b)
end;  { ReadColor }

procedure WriteColor(var outfile: File; Color: TColor);
var r, g, b: Byte;
begin { WriteColor }
  r := (Color shr 4) and $FF;
  g := (Color shr 2) and $FF;
  b := Color and $FF;
  BlockWrite(outfile, r, 1);
  BlockWrite(outfile, g, 1);
  BlockWrite(outfile, b, 1);
end;  { WriteColor }

(***** TGifSubImage *****)

constructor TGifSubImage.Create(NColors: Word; Parent: TGifFile);
begin { TGifSubImage.Create }
  inherited Create;
  FGifFile := Parent;
  Extensions := TList.Create;
  CompressedRasterData := TByteBuffer.Create;
  Pixels := TByteArray2D.Create(0, 0);
  ImageDescriptor.ImageLeftPos := 0;
  ImageDescriptor.ImageTopPos := 0;
  ImageDescriptor.ImageWidth := 0;
  ImageDescriptor.ImageHeight := 0;
  ImageDescriptor.PackedFields := 0;
  HasLocalColorMap := False;
  Interlaced := False;
  case NColors of
    2: BitsPerPixel := 1;
    4: BitsPerPixel := 2;
    8: BitsPerPixel := 3;
    16: BitsPerPixel := 4;
    32: BitsPerPixel := 5;
    64: BitsPerPixel := 6;
    128: BitsPerPixel := 7;
    256: BitsPerPixel := 8;
    else raise EGifException.Create('Number of colors ('+IntToStr(NColors)+') wrong; must be a power of 2');
  end;  { case }
  LZWCodeSize := BitsPerPixel;
  if LZWCodeSize = 1
  then Inc(LZWCodeSize);
  TColorTable_Create(LocalColorMap, NColors);
  EncodeStatusByte;
end;  { TGifSubImage.Create }

destructor TGifSubImage.Destroy;
begin { TGifSubImage.Destroy }
  Pixels.Free;
  CompressedRasterData.Free;
  Extensions.Free;
  FBitmap.Free;
  inherited Destroy;
end;  { TGifSubImage.Destroy }

function TGifSubImage.AnimateInterval: Word;
var ExtNo: Integer;
    Extension: GifDecl.TExtension;
begin { TGifSubImage.AnimateInterval }
  if Extensions.Count = 0
  then Result := 0
  else begin
    Result := 0;
    for ExtNo := 1 to Extensions.Count
    do begin
      Extension := Extensions[ExtNo-1];
      if Extension.Extrec.ExtensionType = etGCE
      then Result := Extension.ExtRec.GCE.DelayTime;
    end;
  end;
end;  { TGifSubImage.AnimateInterval }

function TGifSubImage.AsBitmap: TBitmap;
var Stream: TMemoryStream;
begin { TGifSubImage.AsBitmap }
  if FBitmap = nil
  then begin
    Stream := TMemoryStream.Create;
    try
      SaveToStream(Stream);
      FBitmap := TBitmap.Create;
      FBitmap.LoadFromStream(Stream);
    finally
      Stream.Free;
    end;
  end;
  Result := FBitmap;
end;  { TGifSubImage.AsBitmap }

function TGifSubImage.Copy: TGifSubImage;
begin { TGifSubImage.Copy }
  Result := TGifSubImage.Create(LocalColormap.Count, FGifFile);
  Result.Pixels := Pixels.Copy;
  Result.ImageDescriptor := ImageDescriptor;
  Result.HasLocalColorMap := HasLocalColorMap;
  Result.Interlaced := Interlaced;
  Result.BitsPerPixel := BitsPerPixel;
  Result.LZWCodeSize := LZWCodeSize;
  Result.LocalColorMap := LocalColorMap;
  {Result.CompressedRasterData := CompressedRasterData.Copy;}
end;  { TGifSubImage.Copy }

(***** read routines *****)
procedure TGifSubImage.DecodeStatusByte;
begin { TGifSubImage.DecodeStatusByte }
  with ImageDescriptor
  do begin
    HasLocalColorMap := (PackedFields and idLocalColorTable) = idLocalColorTable;
    Interlaced := (ImageDescriptor.PackedFields and idInterlaced) = idInterlaced;
    BitsPerPixel := 1 + ImageDescriptor.PackedFields and $07;
    LocalColorMap.Count := 1 shl BitsPerPixel;
  end;
end;  { TGifSubImage.DecodeStatusByte }

procedure TGifSubImage.ReadImageDescriptor(var infile: File);
begin { TGifSubImage.ReadImageDescriptor }
  BlockRead(infile, ImageDescriptor, SizeOf(ImageDescriptor));
  DecodeStatusByte;
end;  { TGifSubImage.ReadImageDescriptor }

procedure TGifSubImage.ReadLocalColorMap(var infile: File);
begin { TGifSubImage.ReadLocalColorMap }
  if HasLocalColorMap
  then
    with LocalColorMap
    do BlockRead(infile, Colors[0], Count*SizeOf(TColorItem));
end;  { TGifSubImage.ReadLocalColorMap }

procedure TGifSubImage.ReadRasterData(var infile: File);
var
  NewString: String;
  BlokByteCount: Byte;
begin { TGifSubImage.ReadRasterData }
  BlockRead(infile, LZWCodeSize, 1);
  BlockRead(infile, BlokByteCount, 1);
  while BlokByteCount <> 0
  do begin
{$ifdef ver80}
    NewString[0] := Chr(BlokByteCount);
{$else}
    SetLength(NewString, BlokByteCount);
{$endif ver80}
    BlockRead(infile, NewString[1], BlokByteCount);
    CompressedRasterData.AddString(NewString);
    BlockRead(infile, BlokByteCount, 1);
  end;
end;  { TGifSubImage.ReadRasterData }

procedure InitCompressionStream(InitLZWCodeSize: Byte;
                                var DecodeRecord: TDecodeRecord);
begin { InitCompressionStream }
  with DecodeRecord
  do begin
    LZWCodeSize := InitLZWCodeSize;
    if not (LZWCodeSize in [2..9])    { valid code sizes 2-9 bits }
    then raise EGifException.Create('Bad code Size');
    CurrCodeSize := succ(LZWCodeSize);
    ClearCode := 1 shl LZWCodeSize;
    EndingCode := succ(ClearCode);
    HighCode := pred(ClearCode);      { highest code not needing decoding }
    BitsLeft := 0;
    CurrentY := 0;
    InterlacePass := 1;
  end;
end;  { InitCompressionStream }

function NextCode(CompressedRasterData: TByteBuffer;
                  var DecodeRecord: TDecodeRecord): word;
{ returns a code of the proper bit size }
var LongResult: Longint;
begin { NextCode }
  with DecodeRecord
  do begin
    if BitsLeft = 0 then       { any bits left in byte ? }
    begin                      { any bytes left }
      CurrByte := CompressedRasterData.GetNextByte;   { get a byte }
      BitsLeft := 8;                 { set bits left in the byte }
    end;
    LongResult := CurrByte shr (8 - BitsLeft); { shift off any previously used bits}
    while CurrCodeSize > BitsLeft do          { need more bits ? }
    begin
      CurrByte := CompressedRasterData.GetNextByte;      { get another byte }
      LongResult := LongResult or (CurrByte shl BitsLeft);
                                 { add the remaining bits to the return value }
      BitsLeft := BitsLeft + 8;               { set bit counter }
    end;
    BitsLeft := BitsLeft - CurrCodeSize;      { subtract the code size from bitsleft }
    Result := LongResult and CodeMask[CurrCodeSize];{ mask off the right number of bits }
  end;
end;  { NextCode }

procedure UpdateBitsPerPixel(const ColorCount: Integer;
                             var BitsPerPixel: Byte);
begin { UpdateBitsPerPixel }
  while ColorCount > 1 shl BitsPerPixel
  do Inc(BitsPerPixel)
end;  { UpdateBitsPerPixel }

procedure TGifSubImage.DecodeRasterData;
{ decodes the LZW encoded raster data }
var
  SP: integer; { index to the decode stack }
  DecodeStack: array[0..CodeTableSize-1] of byte;
               { stack for the decoded codes }
  DecodeRecord: TDecodeRecord;
  Prefix: array[0..CodeTableSize-1] of integer; { array for code prefixes }
  Suffix: array[0..CodeTableSize-1] of integer; { array for code suffixes }
  LineBytes: TBigByteArray;
  CurrBuf: word;  { line buffer index }

  procedure DecodeCode(var Code: word);
  { decodes a code and puts it on the decode stack }
  begin { DecodeCode }
    while Code > DecodeRecord.HighCode do
            { rip thru the prefix list placing suffixes }
    begin                    { onto the decode stack }
      DecodeStack[SP] := Suffix[Code]; { put the suffix on the decode stack }
      inc(SP);                         { increment decode stack index }
      Code := Prefix[Code];            { get the new prefix }
    end;
    DecodeStack[SP] := Code;           { put the last code onto the decode stack }
    Inc(SP);                           { increment the decode stack index }
  end;  { DecodeCode }

  procedure PopStack;
  { pops off the decode stack and puts into the line buffer }
  begin { PopStack }
    with DecodeRecord do
    while SP > 0 do
    begin
      dec(SP);
      LineBytes[CurrBuf] := DecodeStack[SP];
      inc(CurrBuf);
      if CurrBuf > ImageDescriptor.ImageWidth       { is the line full ? }
      then begin
        Application.ProcessMessages;
        Pixels.SetRow(CurrentY+1, LineBytes);
        { addition of one necessary because CurrentY is
          zero-based while ImagePixels is one-based }
        if not InterLaced
        then Inc(CurrentY)
        else CurrentY := NextLineNo(CurrentY, ImageDescriptor.ImageHeight,
                                              InterlacePass);
        CurrBuf := 1;
      end;
    end; { while SP > 0 }
  end;  { PopStack }

  procedure CheckSlotValue(var Slot, TopSlot: Word; var MaxVal: Boolean);
  begin { CheckSlotValue }
    if Slot >= TopSlot then      { have reached the top slot for bit size }
    begin                        { increment code bit size }
      if DecodeRecord.CurrCodeSize < 12 then  { new bit size not too big? }
      begin
        TopSlot := TopSlot shl 1;  { new top slot }
        inc(DecodeRecord.CurrCodeSize)       { new code size }
      end else
        MaxVal := True;       { Must check next code is a start code }
    end;
  end;  { CheckSlotValue }

var
  TempOldCode, OldCode: word;
  Code, C: word;
  MaxVal: boolean;
  Slot     : Word;     { position that the next new code is to be added }
  TopSlot  : Word;     { highest slot position for the current code size }
begin { TGifSubImage.DecodeRasterData }
  InitCompressionStream(LZWCodeSize, DecodeRecord); { Initialize decoding parameters }
  CompressedRasterData.Reset;
  LineBytes := TBigByteArray.Create(ImageDescriptor.ImageWidth);
  OldCode := 0;
  SP := 0;
  CurrBuf := 1;
  MaxVal := False;
  try
    C := NextCode(CompressedRasterData, DecodeRecord);  { get the initial code - should be a clear code }
    while C <> DecodeRecord.EndingCode do  { main loop until ending code is found }
    begin
      if C = DecodeRecord.ClearCode then   { code is a clear code - so clear }
      begin
        DecodeRecord.CurrCodeSize := DecodeRecord.LZWCodeSize + 1;  { reset the code size }
        Slot := DecodeRecord.EndingCode + 1;           { set slot for next new code }
        TopSlot := 1 shl DecodeRecord.CurrCodeSize;    { set max slot number }
        while C = DecodeRecord.ClearCode do
          C := NextCode(CompressedRasterData, DecodeRecord);
            { read until all clear codes gone - shouldn't happen }
        if C = DecodeRecord.EndingCode then
          raise EGifException.Create('Bad code');     { ending code after a clear code }
        if C >= Slot then { if the code is beyond preset codes then set to zero }
          C := 0;
        OldCode := C;
        DecodeStack[SP] := C;   { output code to decoded stack }
        inc(SP);                { increment decode stack index }
      end else   { the code is not a clear code or an ending code so  }
      begin      { it must be a code code - so decode the code }
        Code := C;
        if Code < Slot then     { is the code in the table? }
        begin
          DecodeCode(Code);            { decode the code }
          if Slot <= TopSlot then
          begin                        { add the new code to the table }
            Suffix[Slot] := Code;      { make the suffix }
            Prefix[Slot] := OldCode;   { the previous code - a link to the data }
            inc(Slot);                 { increment slot number }
            CheckSlotValue(Slot, TopSlot, MaxVal);
            OldCode := C;              { set oldcode }
          end;
        end else
        begin  { the code is not in the table }
          if Code <> Slot then
            raise EGifException.Create('Bad code'); { so error out }
            { the code does not exist so make a new entry in the code table
              and then translate the new code }
          TempOldCode := OldCode;  { make a copy of the old code }
          while OldCode > DecodeRecord.HighCode { translate the old code and }
          do begin                              { place it on the decode stack }
            DecodeStack[SP] := Suffix[OldCode]; { do the suffix }
            OldCode := Prefix[OldCode];         { get next prefix }
          end;
          DecodeStack[SP] := OldCode;  { put the code onto the decode stack }
                                    { but DO NOT increment stack index }
              { the decode stack is not incremented because we are }
              { only translating the oldcode to get the first character }
          if Slot <= TopSlot then
          begin   { make new code entry }
            Suffix[Slot] := OldCode;       { first char of old code }
            Prefix[Slot] := TempOldCode;   { link to the old code prefix }
            inc(Slot);                     { increment slot }
            CheckSlotValue(Slot, TopSlot, MaxVal);
          end;
          DecodeCode(Code); { now that the table entry exists decode it }
          OldCode := C;     { set the new old code }
        end;
      end; { else (if code < slot) }
      PopStack;  { the decoded string is on the decode stack; put in linebuffer }
      C := NextCode(CompressedRasterData, DecodeRecord);  { get the next code and go at is some more }
      if (MaxVal = True) and (C <> DecodeRecord.ClearCode) then
        raise EGifException.Create('Code size overflow');
      MaxVal := False;
    end; { while C <> EndingCode }
  except
    on E: EListError do;
    on E: EStringListError do;
  end;
  LineBytes.Free;
end;  { TGifSubImage.DecodeRasterData }

procedure TGifSubImage.LoadFromOpenInfile(var infile: File);
begin { TGifSubImage.LoadFromOpenInfile }
  ReadImageDescriptor(infile);
  ReadLocalColorMap(infile);
  Pixels := TByteArray2d.Create(ImageDescriptor.ImageWidth,
                                ImageDescriptor.ImageHeight);
  ReadRasterData(infile);
  DecodeRasterData;
end;  { TGifSubImage.LoadFromOpenInfile }

(***** write routines *****)

procedure AppendPixel(var PixelString: TByteBuffer;
                      Pixels: TBigByteArray;
                      var NextPixelNo: Longint);
begin { AppendPixel }
  PixelString.AddByte(Pixels[NextPixelNo]);
  Inc(NextPixelNo);
end;  { AppendPixel }

procedure GoBackPixel(var PixelString: TByteBuffer;
                      var NextPixelNo: Longint);
begin { GoBackPixel }
  PixelString.DeleteLastByte;
  Dec(NextPixelNo);
end;  { GoBackPixel }

procedure TGifSubImage.EncodeStatusbyte;
begin { TGifSubImage.EncodeStatusbyte }
  with ImageDescriptor
  do begin
    PackedFields := 0;
    if HasLocalColorMap
    then PackedFields := PackedFields or idLocalColorTable;
    if Interlaced
    then PackedFields := PackedFields or idInterlaced;
    if HasLocalColorMap
    then PackedFields := PackedFields or (BitsperPixel-1);
  end;
end;  { TGifSubImage.EncodeStatusbyte }

procedure TGifSubImage.WriteImageDescriptor(var outfile: File);
var OldStatusByte: Byte;
begin { TGifSubImage.WriteImageDescriptor }
  OldStatusByte := ImageDescriptor.PackedFields;
  EncodeStatusByte;
  {if ImageDescriptor.PackedFields <> OldStatusByte
  then ShowMessage('PackedFields value has been changed');}
  BlockWrite(outfile, ImageDescriptor, SizeOf(ImageDescriptor));
end;  { TGifSubImage.WriteImageDescriptor }

procedure TGifSubImage.WriteLocalColorMap(var outfile: File);
begin { TGifSubImage.WriteLocalColorMap }
  if HasLocalColorMap
  then
    with LocalColorMap
    do BlockWrite(outfile, Colors[0], Count*SizeOf(TColorItem))
end;  { TGifSubImage.WriteLocalColorMap }

procedure TGifSubImage.EncodeRasterdata;
var
  PixelArray: TBigByteArray;
  CodeTable: TCodeTable;
  ClearCode: Word;
  EndCode: Word;
  FirstPixel: Byte;
  OldCode, Code: Integer;
  PixelString: TByteBuffer;
  NextPixelNo: Longint;
  Found: Boolean;
  PrevFoundIndex, FoundIndex: Integer;
  EncodedBytes: TEncodedBytes;
begin { TGifSubImage.EncodeRasterdata }
  MakeFlat(Pixels, Interlaced, PixelArray);
  CodeTable := TCodeTable.Create;
  CodeTable.Clear(LZWCodeSize+1);
  PixelString := TByteBuffer.Create;
  ClearCode := 1 shl LZWCodeSize;
  EndCode := ClearCode + 1;
  EncodedBytes := TEncodedBytes.Create;
  EncodedBytes.AppendCode(ClearCode, CodeTable.CodeSize);
  NextPixelNo := 1;
  FirstPixel := PixelArray[NextPixelNo];
  EncodedBytes.AppendCode(FirstPixel, CodeTable.CodeSize);
  OldCode := FirstPixel;
  Inc(NextPixelNo);
  ShowProgress(0);
  repeat
    PixelString.Clear;
    AppendPixel(PixelString, PixelArray, NextPixelNo);
    CodeTable.AddEntry(OldCode, PixelString.FirstByte);
    Found := True;
    PrevFoundIndex := PixelString.FirstByte;
    while Found and (NextPixelNo <= PixelArray.Count)
    do begin
      AppendPixel(PixelString, PixelArray, NextPixelNo);
      Found := CodeTable.IsInTable(PixelString, PrevFoundIndex, FoundIndex)
    end;
    if not Found
    then begin
      GoBackPixel(PixelString, NextPixelNo);
      Code := PrevFoundIndex
    end
    else Code := FoundIndex;
    EncodedBytes.AppendCode(Code, CodeTable.CodeSize);
    if CodeTable.TableFull and (NextPixelNo <= PixelArray.Count)
    then begin
      EncodedBytes.AppendCode(ClearCode, CodeTable.CodeSize);
      CodeTable.Clear(LZWCodeSize+1);
      FirstPixel := PixelArray[NextPixelNo];
      EncodedBytes.AppendCode(FirstPixel, CodeTable.CodeSize);
      OldCode := FirstPixel;
      Inc(NextPixelNo);
      ShowProgress(NextPixelNo/PixelArray.Count);
    end
    else OldCode := Code;
  until (NextPixelNo > PixelArray.Count);
  EncodedBytes.Finish(EndCode, CodeTable.CodeSize);
  CompressedRasterData := EncodedBytes.Value;
  PixelString.Free;
  CodeTable.Free;
  EncodedBytes.Free;
  PixelArray.Free;
  ShowProgress(1);
end;  { TGifSubImage.EncodeRasterdata }

procedure TGifSubImage.WriteRasterData(var outfile: File);
var
  StringNo: Integer;
  Block: String;
  BlokByteCount: Byte;
begin { TGifSubImage.WriteRasterData }
  BlockWrite(outfile, LZWCodeSize, 1);
  for StringNo := 1 to CompressedRasterData.StringCount
  do begin
    Block := CompressedRasterData.Strings[StringNo];
    BlokByteCount := Length(Block);
    BlockWrite(outfile, BlokByteCount, 1);
    BlockWrite(outfile, Block[1], BlokByteCount);
  end;
  BlokByteCount := 0;
  BlockWrite(outfile, BlokByteCount, 1);
end;  { TGifSubImage.WriteRasterData }

procedure TGifSubImage.SaveToStream(Stream: TStream);
{ Saves it as a .bmp! }

  procedure CreateBitHeader(Image: TGifSubImage;
                            var bmHeader: TBitmapInfoHeader);
  { This routine takes the values from the GIF image
    descriptor and fills in the appropriate values in the
    bit map header struct. }
  begin { CreateBitHeader }
    with BmHeader do
    begin
      biSize           := Sizeof(TBitmapInfoHeader);
      biWidth          := Image.ImageDescriptor.ImageWidth;
      biHeight         := Image.ImageDescriptor.ImageHeight;
      biPlanes         := 1;            {Arcane and rarely used}
      biBitCount       := 8;            {Hmmm Should this be hardcoded ?}
      biCompression    := BI_RGB;       {Sorry Did not implement compression in this version}
      biSizeImage      := 0;            {Valid since we are not compressing the image}
      biXPelsPerMeter  :=143;           {Rarely used very arcane field}
      biYPelsPerMeter  :=143;           {Ditto}
      biClrUsed        := 0;            {all colors are used}
      biClrImportant   := 0;            {all colors are important}
    end;
  end;  { CreateBitHeader }

var
  BitFile: TBitmapFileHeader;
  BmHeader: TBitmapInfoHeader; {File Header for bitmap file}
  i: integer;
  Line: integer;
  ch: char;
  x: integer;
  LineBytes: TBigByteArray;
begin { TGifSubImage.SaveToStream }
  with BitFile do begin
    with ImageDescriptor do
    bfSize := (3*255) + Sizeof(TBitmapFileHeader) +
              Sizeof(TBitmapInfoHeader) + (Longint(ImageHeight)*
                                           Longint(ImageWidth));
    bfReserved1 := 0; {not currently used}
    bfReserved2 := 0; {not currently used}
    bfOffBits := (4*256)+ Sizeof(TBitmapFileHeader)+
                          Sizeof(TBitmapInfoHeader);
  end;
  CreateBitHeader(Self, bmHeader);
  {Write the file header}
  with Stream do begin
    Position:=0;
    ch:='B';
    Write(ch,1);
    ch:='M';
    Write(ch,1);
    Write(BitFile.bfSize,sizeof(BitFile.bfSize));
    Write(BitFile.bfReserved1,sizeof(BitFile.bfReserved1));
    Write(BitFile.bfReserved2,sizeof(BitFile.bfReserved2));
    Write(BitFile.bfOffBits,sizeof(BitFile.bfOffBits));
    {Write the bitmap image header info}
    Write(BmHeader,sizeof(BmHeader));
    {Write the BGR palete information to this file}
    if HasLocalColorMap then {Use the local color table}
    begin
      for i:= 0 to 255 do
      begin
        Write(LocalColormap.Colors[i].Blue,1);
        Write(LocalColormap.Colors[i].Green,1);
        Write(LocalColormap.Colors[i].Red,1);
        Write(ch,1); {Bogus palette entry required by windows}
      end;
    end else {Use the global table}
    begin
      with FGifFile do
      for i := 0 to 255 do
      begin
        Write(GlobalColormap.Colors[i].Blue,1);
        Write(GlobalColormap.Colors[i].Green,1);
        Write(GlobalColormap.Colors[i].Red,1);
        Write(ch,1); {Bogus palette entry required by windows}
      end;
    end;
    for Line := ImageDescriptor.ImageHeight downto 1
    do begin
 {Use reverse order since gifs are stored top to bottom.
  Bmp file need to be written bottom to top}
      LineBytes := Pixels.CopyRow(Line);
      x := ImageDescriptor.ImageWidth;
      Write(LineBytes.Address^, x);
      ch := chr(0);
      while (x and 3) <> 0 do { Pad up to 4-byte boundary with zeroes }
      begin
        Inc(x);
        Write(ch, 1);
      end;
      LineBytes.Free;
    end;
    Position := 0; { reset memory stream}
  end;
end;  { TGifSubImage.SaveToStream }

(***** end of TGifSubImage *****)

(***** TGifFile *****)

constructor TGifFile.Create;
begin { TGifFile.Create }
  inherited Create;
  Header.Signature := 'GIF';
  Header.Version := '87a';
  ScreenDescriptor.ScreenWidth := 0;
  ScreenDescriptor.ScreenHeight := 0;
  ScreenDescriptor.PackedFields := 0;
  ScreenDescriptor.BackGroundcolorIndex := 0;
  ScreenDescriptor.AspectRatio := 0;
  HasGlobalColorMap := True;
  BitsPerPixel := 1;  { arbitrary; other choices would be 4 or 8 }
  {GlobalColorMap := TColorTable.Create;}
  TColorTable_Create(GlobalColormap, 2);
  SubImages := TList.Create;
end;  { TGifFile.Create }

destructor TGifFile.Destroy;
var
  SubImageNo: Integer;
  SubImage: TGifSubImage;
begin { TGifFile.Destroy }
  for SubImageNo := 1 to SubImages.Count
  do begin
    SubImage := SubImages[SubImageNo-1];
    SubImage.Free;
  end;
  SubImages.Free;
  inherited Destroy;
end;  { TGifFile.Destroy }

procedure TGifFile.AddSubImage(Colormap: TColorTable;
                               PixelMatrix: TByteArray2D);
var NewSubImage: TGifSubImage;
begin { TGifFile.AddSubImage }
  NewSubImage := TGifSubImage.Create(Colormap.Count, Self);
  if SubImages.Count = 0
  then GlobalColormap := Colormap
  else begin
    NewSubImage.HasLocalColorMap := True;
    NewSubImage.LocalColormap := Colormap;
  end;
  UpdateBitsPerPixel(GlobalColormap.Count, BitsPerPixel);
  NewSubImage.EncodeStatusByte;
  NewSubImage.Pixels := PixelMatrix.Copy;
  NewSubImage.ImageDescriptor.ImageWidth := PixelMatrix.Count1;
  NewSubImage.ImageDescriptor.ImageHeight := PixelMatrix.Count2;
  SubImages.Add(NewSubImage);
  if ScreenDescriptor.ScreenWidth < PixelMatrix.Count1
  then ScreenDescriptor.ScreenWidth := PixelMatrix.Count1;
  if ScreenDescriptor.ScreenHeight < PixelMatrix.Count2
  then ScreenDescriptor.ScreenHeight := PixelMatrix.Count2;
  EncodeStatusByte;
end;  { TGifFile.AddSubImage }

function TGifFile.AnimateInterval: Word;
var SubImage: TGifSubImage;
    SubImageNo: Integer;
    Interval: Word;
begin { TGifFile.AnimateInterval }
  if SubImages.Count < 2
  then Result := 0
  else begin
    Result := 0;
    for SubImageNo := 1 to SubImages.Count
    do begin
      SubImage := SubImages[SubImageNo-1];
      Interval := SubImage.AnimateInterval;
      if Interval = 0
      then ShowMessage('Multiple subimages; no animation time interval found');
      if (Result <> 0) and (Result <> Interval)
      then ShowMessage('Multiple subimages; animation time intervals not equal');;
      if Interval <> 0
      then Result := Interval
    end;
  end;
end;  { TGifFile.AnimateInterval }

function TGifFile.AsBitmap: TBitmap;
var Stream: TMemoryStream;
begin { TGifFile.AsBitmap }
  Stream := TMemoryStream.Create;
  try
    TGifSubImage(Self.SubImages[0]).SaveToStream(Stream);
    Result := TBitmap.Create;
    Result.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;  { TGifFile.AsBitmap }

function TGifFile.GetSubImage(Index: Integer): TGifSubImage;
begin
  Result := SubImages[Index-1]
end;  { TGifFile.GetSubImage }

(***** Read routines *****)

procedure TGifFile.ReadSignature(var infile: File);
begin { TGifFile.ReadSignature }
  BlockRead(infile, Header, SizeOf(TGifHeader));
  if (Header.Version <> '87a') and (Header.Version <> '89a') and
     (Header.Version <> '87A') and (Header.Version <> '89A')
  then raise EGifException.Create('Gif Version must be 87a or 89a');
end;  { TGifFile.ReadSignature }

procedure TGifFile.DecodeStatusByte;
var
  ColorResolutionBits: Byte;
begin { TGifFile.DecodeStatusByte }
  HasGlobalColorMap := (ScreenDescriptor.PackedFields and lsdGlobalColorTable) = lsdGlobalColorTable;  { M=1 }
  ColorResolutionbits := 1 + (ScreenDescriptor.PackedFields and lsdColorResolution) shr 4;
  {GlobalColorMap.Count := 1 shl ColorResolutionbits;}
  BitsPerPixel := 1 + ScreenDescriptor.PackedFields and $07;
  GlobalColorMap.Count := 1 shl BitsPerPixel;
end;  { TGifFile.DecodeStatusByte }

procedure TGifFile.ReadScreenDescriptor(var infile: File);
begin { TGifFile.ReadScreenDescriptor }
  BlockRead(infile, ScreenDescriptor, SizeOf(ScreenDescriptor));
  DecodeStatusByte;
end;  { TGifFile.ReadScreenDescriptor }

procedure TGifFile.ReadGlobalColorMap(var infile: File);
begin { TGifFile.ReadGlobalColorMap }
  if HasGlobalColorMap
  then
    with GlobalColorMap
    do BlockRead(infile, Colors[0], Count*SizeOf(TColorItem));
end;  { TGifFile.ReadGlobalColorMap }

procedure TGifFile.ReadExtensionBlocks(var infile: File;
                                       var SeparatorChar: Char;
                                       var Extensions: TList);
{ The '!' has alrady been read before calling }

  procedure ReadDataBlocks(var infile: File; var Data: TStringList);
  { data not yet stored }
  var
    BlockSize: Byte;
    NewString: String;
  begin { ReadDataBlocks }
    Data := TStringlist.Create;
    repeat
      BlockRead(infile, BlockSize, 1);
      if BlockSize <> 0
      then begin
    {$ifdef ver80}
        NewString[0] := Chr(BlockSize);
    {$else}
        SetLength(NewString, BlockSize);
    {$endif ver80}
        BlockRead(infile, NewString[1], BlockSize);
        Data.Add(NewString);
      end;
    until BlockSize = 0;
  end;  { ReadDataBlocks }

var
  NewExtension: GifDecl.TExtension;
  ExtensionLabel: Byte;
begin { TGifFile.ReadExtensionBlocks }
  Extensions := TList.Create;
  while SeparatorChar = '!'
  do begin
    NewExtension := GifDecl.TExtension.Create;
    Extensions.Add(NewExtension);
    BlockRead(infile, ExtensionLabel, 1);
    with NewExtension.ExtRec do
    case ExtensionLabel of
      $F9: ExtensionType := etGCE;  { graphic control extension }
      $FE: ExtensionType := etCE;   { comment extension }
      $01: ExtensionType := etPTE;  { plain text extension }
      $FF: ExtensionType := etAPPE; { application extension }
      else raise EGifException.Create('Unrecognized extension block.'+
                 #13+#10 + 'Code = $' + IntToHex(ExtensionLabel, 2));
    end; { case }
    with NewExtension.ExtRec do
    case ExtensionLabel of
      $F9: BlockRead(infile, GCE, SizeOf(GCE));
      $FE: ReadDataBlocks(infile, Comment);
      $01: begin
             BlockRead(infile, PTE, SizeOf(PTE)-SizeOf(PTE.PlainTextData));
             ReadDataBlocks(infile, PTE.PlainTextData);
           end;
      $FF: begin
             BlockRead(infile, APPE, SizeOf(APPE)-SizeOf(APPE.AppData));
             ReadDataBlocks(infile, APPE.AppData);
           end;
    end; { case }
    BlockRead(infile, SeparatorChar, 1);
  end;
end;  { TGifFile.ReadExtensionBlocks }

procedure TGifFile.LoadFromFile(filename: String);
var
  infile: File;
  SeparatorChar: Char;
  NewSubImage: TGifSubimage;
  Extensions: TList;
begin { TGifFile.LoadFromFile }
  Screen.Cursor := crHourGlass;
  SubImages := TList.Create;
  AssignFile(infile, filename);
  Reset(infile, 1);
  ReadSignature(infile);
  ReadScreenDescriptor(infile);
  ReadGlobalColorMap(infile);
  BlockRead(infile, SeparatorChar, 1);
  while SeparatorChar <> ';'
  do begin
    ReadExtensionBlocks(infile, SeparatorChar, Extensions);
    if SeparatorChar = ','
    then begin
      NewSubImage := TGifSubImage.Create(GlobalColormap.Count, Self);
      NewSubImage.Extensions := Extensions;
      NewSubImage.LoadFromOpenInfile(infile);
      SubImages.Add(NewSubImage);
      BlockRead(infile, SeparatorChar, 1);
    end;
  end;
  CloseFile(infile);
  Screen.Cursor := crDefault;
end;  { TGifFile.LoadFromFile }

(***** write routines *****)

procedure TGifFile.EncodeStatusByte;
var
  ColorResolutionBits: Byte;
begin { TGifFile.EncodeStatusByte }
  with ScreenDescriptor
  do begin
    PackedFields := 0;
    if HasGlobalColorMap
    then PackedFields := PackedFields + lsdGlobalColorTable;
    case GlobalColorMap.Count of
      2: ColorResolutionBits := 1;
      16: ColorResolutionBits := 4;
      256: ColorResolutionBits := 8;
      else raise EGifException.Create('unexpected number of colors')
    end;
    PackedFields := PackedFields + (ColorResolutionBits-1) shl 4;
    PackedFields := PackedFields + (BitsPerPixel-1);
  end;
end;  { TGifFile.EncodeStatusByte }

procedure TGifFile.WriteSignature(var outfile: File);
begin { TGifFile.WriteSignature }
  BlockWrite(outfile, Header, SizeOf(TGifHeader));
end;  { TGifFile.WriteSignature }

procedure TGifFile.WriteScreenDescriptor(var outfile: File);
begin { TGifFile.WriteScreenDescriptor }
  EncodeStatusByte;
  BlockWrite(outfile, ScreenDescriptor, SizeOf(ScreenDescriptor));
end;  { TGifFile.WriteScreenDescriptor }

procedure TGifFile.WriteGlobalColorMap(var outfile: File);
begin { TGifFile.WriteGlobalColorMap }
  if HasGlobalColorMap
  then
    with GlobalColorMap
    do BlockWrite(outfile, Colors[0], Count*SizeOf(TColorItem))
end;  { TGifFile.WriteGlobalColorMap }

procedure TGifFile.SaveToFile(filename: String);
var
  outfile: File;
  ImageSeparator: Char;
  ImageNo: Integer;
  SubImage: TGifSubimage;
begin { TGifFile.SaveToFile }
  Screen.Cursor := crHourGlass;
  AssignFile(outfile, filename);
  Rewrite(outfile, 1);
  WriteSignature(outfile);
  WriteScreenDescriptor(outfile);
  WriteGlobalColorMap(outfile);
  ImageSeparator := ',';
  for ImageNo := 1 to SubImages.Count
  do begin
    BlockWrite(outfile, ImageSeparator, 1);
    SubImage := SubImages[ImageNo-1];
    SubImage.EncodeRasterdata;
    SubImage.WriteImageDescriptor(outfile);
    SubImage.WriteLocalColorMap(outfile);
    SubImage.WriteRasterData(outfile);
  end;
  ImageSeparator := ';';
  BlockWrite(outfile, ImageSeparator, 1);
  CloseFile(outfile);
  Screen.Cursor := crDefault;
end;  { TGifFile.SaveToFile }

(***** end of methods of TGifFile *****)

end. { unit GifUnit }
