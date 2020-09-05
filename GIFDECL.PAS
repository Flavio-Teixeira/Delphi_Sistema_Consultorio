unit GifDecl;
{ Exports type declarations and constants that are used by the GifUnit.
That's the whole purpose of this unit: to reduce the size of GifUnit.

Reinier Sterkenburg, Delft, The Netherlands

17 Mar 97: - added TByteBuffer
18 Mar 97: - deleted BytesLeft field; it was not useful anymore
24 Mar 97: - made TEncodedBytes.CurrentByte Longint in stead of Integer;
             added Longint typecast in TEncodedBytes.AppendCode.
             This has solved a problem when compiled under Delphi 1.
           - added storing of all 89a extension data in field 'Extensions';
             enhanced TGraphicControlExtension, TPlainTextExtension and
             TApplicationExtension and create TExtensionType, TExtensionRecord
             and TExtension in order to achieve this.
28 Mar 97: - started work on method TExtension.Edit, see also FmGCE
 3 Apr 97: - didn't finish TExtension.Edit (yet?); but did add
             forms for viewing the attributes of GifFile and GifSubImage,
             see FmImInfo and FmSubImg
 5 Apr 97: - moved TExtension.Edit to separate unit ShowExt (renamed it
             to ShowExtension)
 2 Aug 97: - moved TGraphicFileType to this unit
14 Aug 97: - added methods to TByteBuffer:
             Clear, DeleteLastByte, FirstByte, LastByte
           - PixelString (in TCodeTable.IsInTable) is now a
             TByteBuffer in stead of a String
           - moved declaration of TByteBuffer to before TCodeTable
}

interface

uses
  Classes,         { Imports TStringlist }
  SysUtils;        { Imports Exception }

const
  { image descriptor bit masks }
  idLocalColorTable    = $80;    { set if a local color table follows }
  idInterlaced         = $40;    { set if image is interlaced }
  idSort               = $20;    { set if color table is sorted }
  idReserved           = $0C;    { reserved - must be set to $00 }
  idColorTableSize     = $07;    { size of color table as above }
  ExtensionIntroducer: Byte = Ord('!');
  ImageSeparator: Byte = Ord(',');
  Trailer: Byte        = Ord(';'); { indicates the end of the GIF data stream }

  { logical screen descriptor packed field masks }
  lsdGlobalColorTable = $80;  { set if global color table follows L.S.D. }
  lsdColorResolution = $70;   { Color resolution - 3 bits }
  lsdSort = $08;              { set if global color table is sorted - 1 bit }
  lsdColorTableSize = $07;    { size of global color table - 3 bits }
                              { Actual size = 2^value+1    - value is 3 bits }

const
  CodeTableSize = 4096;

  CodeMask: array[0..12] of Word = (  { bit masks for use with Next code }
  0, $0001, $0003, $0007, $000F,
     $001F, $003F, $007F, $00FF,
     $01FF, $03FF, $07FF, $0FFF);

type
  TGraphicFileType = (BMP, GIF, unknown);
  { Who knows JPG and others will be available some day }

type
  TDecodeRecord = record
    BitsLeft     : Integer;   { bits left in byte }
    CurrByte     : Longint;   { the current byte }
    CurrentY     : Integer;   { current screen locations }
    InterlacePass: Integer;   { interlace pass number }

    LZWCodeSize  : Byte;      { minimum size of the LZW codes in bits }
    CurrCodeSize : Integer;   { Current size of code in bits }
    ClearCode    : Integer;   { Clear code value }
    EndingCode   : Integer;   { ending code value }
    HighCode     : Word;      { highest code that does not require decoding }
  end; { TDecodeRecord }

type
  EGifException = class(Exception)
  end;

type
  TGifHeader = packed record
    Signature: array[0..2] of char; { contains 'GIF' }
    Version: array[0..2] of char;   { '87a' or '89a' }
  end; { TGifHeader }

  TLogicalScreenDescriptor = packed record
    ScreenWidth: word;              { logical screen width }
    ScreenHeight: word;             { logical screen height }
    PackedFields: byte;             { packed fields - see below }
    BackGroundColorIndex: byte;     { index to global color table }
    AspectRatio: byte;              { actual ratio = (AspectRatio + 15) / 64 }
  end; { TLogicalScreenDescriptor }

type
  TImageDescriptor = packed record
    {Separator: byte;      { fixed value of ImageSeparator }
    { I (RPS) think it's awkward to consider the separator char a
      part of the Image Descriptor, therefore commented it out }
    ImageLeftPos: word;   { Column in pixels in respect to left edge of logical screen }
    ImageTopPos: word;    { row in pixels in respect to top of logical screen }
    ImageWidth: word;     { width of image in pixels }
    ImageHeight: word;    { height of image in pixels }
    PackedFields: byte;   { see below }
  end; { TImageDescriptor }

type
  TExtensionType = (etGCE, etPTE, etAPPE, etCE);

  TGraphicControlExtension = packed record
    {Introducer: byte;}      { always $21 }
    {ExtensionLabel: byte;}  { always $F9 }
    BlockSize: byte;         { should be 4 }
    PackedFields: Byte;
    DelayTime: Word;         { in centiseconds }
    TransparentColorIndex: Byte;
    Terminator: Byte;
  end; { TGraphicControlExtension }

  TPlainTextExtension = packed record
    {Introducer: byte;}      { always $21 }
    {ExtensionLabel: byte;}  { always $01 }
    BlockSize: byte;         { should be 12 }
    Left, Top, Width, Height: Word;
    CellWidth, CellHeight: Byte;
    TextFGColorIndex,
    TextBGColorIndex: Byte;
    PlainTextData: TStringList;
  end; { TPlainTextExtension }

  TApplicationExtension = packed record
    {Introducer: byte;}      { always $21 }
    {ExtensionLabel: byte;}  { always $FF }
    BlockSize: Byte;         { should be 11 }
    ApplicationIdentifier: array[1..8] of Byte;
    AppAuthenticationCode: array[1..3] of Byte;
    AppData: TStringList;
  end; { TApplicationExtension }

  TExtensionRecord = record
    case ExtensionType: TExtensionType of
      etGCE: (GCE: TGraphicControlExtension);
      etPTE: (PTE: TPlainTextExtension);
      etAPPE: (APPE: TApplicationExtension);
      etCE: (Comment: TStringList);
  end; { TExtensionRecord }

  TExtension = class
    ExtRec: TExtensionRecord;
  end; { TExtension }
  { declared as class to make storage in a TList possible }

type
  TByteBuffer = class
  private
    FTotalSize: Longint;
    SL: TStringList;
    CurrString: String;
    CurrLength: Integer;
    CurrStringNo: Integer;
    NextByte: Integer;
    function GetString(Index: Longint): String;
  public
    constructor Create;
    procedure AddByte(ByteVal: Byte);
    procedure AddString(NewString: String);
    procedure Clear;
    procedure DeleteLastByte;
    procedure Finish;
    function  FirstByte: Byte;
    function  GetNextByte: Byte;
    function  LastByte: Byte;
    procedure Reset;
    function  StringCount: Integer;

    property  Strings[Index: Longint]: String read GetString;
    property  TotalSize: Longint read FTotalSize;
  end; { TByteBuffer }

type
  TCodeTable = class
    Suffix,
    Prefix: Array[1..CodeTableSize] of Word;
    CodeSize: Byte; { number of bits necessary to encode }
    TableFull: Boolean;
    FirstSlot,
    NextSlot: Word; { index where next string will be stored }
    procedure AddEntry(NewPrefix, NewSuffix: Integer);
    procedure Clear(StartingCodeSize: Byte);
    function  IsInTable(PixelString: TByteBuffer;
                        var PrevFoundIndex,
                            FoundIndex: Integer): Boolean;
  end; { TCodeTable }

type
  TEncodedBytes = class
    Value: TByteBuffer;   { contains the encoded bytes }
    UsedBits: Byte;
    CurrentByte: Longint; { not byte or even integer, to accommodate 'overflow' }
    constructor Create;
    procedure AppendCode(CodeValue, CodeSize: Integer);
    procedure Finish(EndCode: Word; CodeSize: Byte);
  end; { TEncodedBytes }

function CheckType(Filename: String): TGraphicFileType;
{ Finds out whether the file is a gif or bmp (or unknown) file }

function NextLineNo(LineNo, ImageHeight: Integer;
                    var InterlacePass: Integer): Integer;
{ Returns the next line number for an interlaced image }


implementation

(**** methods of TCodeTable *****)

procedure TCodeTable.Clear(StartingCodeSize: Byte);
var i: Integer;
begin { TCodeTable.Clear }
  for i := 1 to CodeTableSize
  do begin
    Suffix[i] := 0;
    Prefix[i] := 0;
  end;
  CodeSize := StartingCodeSize;
  FirstSlot := 1 shl (CodeSize-1) + 2;
  NextSlot := FirstSlot;
  TableFull := False;
end;  { TCodeTable.Clear }

procedure TCodeTable.AddEntry(NewPrefix, NewSuffix: Integer);
begin { TCodeTable.AddEntry }
  Prefix[NextSlot] := NewPrefix;
  Suffix[NextSlot] := NewSuffix;
  Inc(NextSlot);
  if NextSlot = 4096
  then TableFull := True
  else
    if NextSlot > (1 shl CodeSize)
    then Inc(CodeSize)
end;  { TCodeTable.AddEntry }

function TCodeTable.IsInTable(PixelString: TByteBuffer;
                              var PrevFoundIndex,
                                  FoundIndex: Integer): Boolean;
var
  Found: Boolean;
  Pixel: Byte;
  TryIndex: Integer;
begin { TCodeTable.IsInTable }
  if PrevFoundIndex < FirstSlot
  then TryIndex := FirstSlot
  else TryIndex := PrevFoundIndex+1;
  Pixel := PixelString.LastByte;
  Found := False;
  while not Found
        and (TryIndex < NextSlot)
  do begin
    Found := (Prefix[TryIndex] = PrevFoundIndex) and
             (Suffix[TryIndex] = Pixel);
    Inc(TryIndex)
  end;
  if Found
  then begin
    Dec(TryIndex);
    PrevFoundIndex := TryIndex;
    FoundIndex := TryIndex;
  end;
  Result := Found;
end;  { TCodeTable.IsInTable }

(**** end of methods of TCodeTable *****)
(**** methods of TByteBuffer *****)

constructor TByteBuffer.Create;
begin { TByteBuffer.Create }
  inherited Create;
  SL := TStringlist.Create;
  CurrString := '';
  CurrLength := 0;
end;  { TByteBuffer.Create }

procedure TByteBuffer.AddByte(ByteVal: Byte);
begin { TByteBuffer.AddByte }
  if CurrLength = 255
  then begin
    SL.Add(CurrString);
    CurrString := '';
    CurrLength := 0;
  end;
  CurrString := CurrString + Chr(ByteVal);
  Inc(CurrLength);
  Inc(FTotalSize);
end;  { TByteBuffer.AddByte }

procedure TByteBuffer.AddString(NewString: String);
begin { TByteBuffer.AddString }
  SL.Add(NewString);
  FTotalSize := FTotalSize + Length(NewString);
end;  { TByteBuffer.AddString }

procedure TByteBuffer.Clear;
begin { TByteBuffer.Clear }
  SL.Free;
  SL := TStringlist.Create;
  CurrString := '';
  CurrLength := 0;
end;  { TByteBuffer.Clear }

procedure TByteBuffer.DeleteLastByte;
begin { TByteBuffer.DeleteLastByte }
  if CurrLength = 0
  then begin
    CurrString := SL[SL.Count-1];
    SL.Delete(SL.Count-1);
    CurrLength := Length(CurrString);
  end;
  System.Delete(CurrString, CurrLength, 1);
  Dec(CurrLength);
  Dec(FTotalSize);
end;  { TByteBuffer.DeleteLastByte }

procedure TByteBuffer.Finish;
begin { TByteBuffer.AddString }
  SL.Add(CurrString);
end;  { TByteBuffer.AddString }

function TByteBuffer.FirstByte: Byte;
var FirstString: String;
begin { TByteBuffer.FirstByte }
  if SL.Count = 0
  then FirstString := CurrString
  else FirstString := SL[SL.Count-1];
  Result := Ord(FirstString[1]);
end;  { TByteBuffer.FirstByte }

function TByteBuffer.GetString(Index: Longint): String;
begin { TByteBuffer.GetString }
  Result := SL[Index-1];
end;  { TByteBuffer.GetString }

function TByteBuffer.GetNextByte: Byte;
begin { TByteBuffer.GetNextByte }
  if NextByte > Length(CurrString)
  then begin
    Inc(CurrStringNo);
    CurrString := Strings[CurrStringNo];
    NextByte := 1;
  end;
  Result := Ord(CurrString[NextByte]);
  Inc(NextByte);
end;  { TByteBuffer.GetNextByte }

function TByteBuffer.LastByte: Byte;
begin { TByteBuffer.LastByte }
  Result := Ord(CurrString[Length(CurrString)]);
end;  { TByteBuffer.LastByte }

procedure TByteBuffer.Reset;
begin { TByteBuffer.Reset }
  CurrStringNo := 1;
  CurrString := Strings[1];
  NextByte := 1;
end;  { TByteBuffer.Reset }

function TByteBuffer.StringCount: Integer;
begin { TByteBuffer.StringCount }
  Result := SL.Count;
end;  { TByteBuffer.StringCount }

(**** methods of TEncodedBytes *****)

constructor TEncodedBytes.Create;
begin { TEncodedBytes.Create }
  inherited Create;
  CurrentByte := 0;
  UsedBits := 0;
  Value := TByteBuffer.Create;
end;  { TEncodedBytes.Create }

procedure TEncodedBytes.AppendCode(CodeValue, CodeSize: Integer);
{ Adds the compression code to the bit stream }
var NewByte: Longint;
begin { TEncodedBytes.AppendCode }
  CurrentByte := CurrentByte + (Longint(CodeValue) shl UsedBits);
  UsedBits := UsedBits+CodeSize;
  while UsedBits >= 8
  do begin
    NewByte := CurrentByte shr 8;
    CurrentByte := CurrentByte and $ff;
    Value.AddByte(CurrentByte);
    CurrentByte := NewByte;
    UsedBits := UsedBits - 8;
  end
end;  { TEncodedBytes.AppendCode }

procedure TEncodedBytes.Finish(EndCode: Word; CodeSize: Byte);
begin { TEncodedBytes.Finish }
  AppendCode(EndCode, CodeSize);
  if UsedBits <> 0
  then Value.AddByte(CurrentByte);
  Value.Finish;
end;  { TEncodedBytes.Finish }

(**** end of methods of TEncodedBytes *****)

function CheckType(Filename: String): TGraphicFileType;
{ Finds out whether the file is a gif or bmp (or unknown) file }
var
  GraphicFile: File;
  Ext, TestStr: String; n: Integer;
begin { CheckType }
  Ext := ExtractFileExt(Filename);
  AssignFile(GraphicFile, Filename);
  Reset(GraphicFile, 1);
  try
    if UpperCase(Ext) = '.BMP'
    then begin
{$ifdef ver80}
      TestStr[0] := Chr(2);
{$else}
      SetLength(TestStr, 2);
{$endif ver80}
      BlockRead(GraphicFile, TestStr[1], 2);
      if UpperCase(TestStr) = 'BM'
      then Result := BMP
      else Result := unknown
    end
    else if UpperCase(Ext) = '.GIF'
    then begin
{$ifdef ver80}
      TestStr[0] := Chr(3);
{$else}
      SetLength(TestStr, 3);
{$endif ver80}
      BlockRead(GraphicFile, TestStr[1], 3, n);
      if UpperCase(TestStr) = 'GIF'
      then Result := GIF
      else Result := unknown
    end
    else Result := unknown;
  finally
    CloseFile(GraphicFile);
  end;
end;  { CheckType }

function NextLineNo(LineNo, ImageHeight: Integer;
                    var InterlacePass: Integer): Integer;
{ Interlace support }
begin { NextLineNo }
  case InterlacePass of
    1: Result := LineNo + 8;
    2: Result := LineNo + 8;
    3: Result := LineNo + 4;
    4: Result := LineNo + 2;
  end;
  if Result >= ImageHeight then
  begin
    Inc(InterLacePass);
    case InterLacePass of
      2: Result := 4;
      3: Result := 2;
      4: Result := 1;
    end;
  end;
end; { NextLineNo }

end.
