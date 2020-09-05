unit DynArrB;
{ Exports the TBigByteArray and TByteArray2D types.
The TBigByteArray type is a dynamic array type, with Singles as
elements.
Indexing the elements is done exactly like a normal array;
the differences with a 'normal' array type are:
- one MUST call the constructor to create the array
- the size (no. of elements) of the array is determined at run time

R.P. Sterkenburg,
TNO Prins Maurits Laboratory, Rijswijk, The Netherlands

 6 May 96: - created (unit name DynArrS)
 7 May 96: - renamed property N to Count
           - added CopyInto method
13 May 96  - added Min & Max functions
14 May 96  - added inherited Create in constructor
           - added function FindMax and FindMinMax
12 Jul 96: - added function Average
23 Aug 96: - added procedure SortAscending
26 Aug 96: - added procedure MultiplyWith
 9 Sep 96: - added various new procedures analogous to old unit bigarrays
 7 Oct 96: - added TSingleArray.Subtract
           - corrected TSingleArray.Sum (check for NoValue added)
15 Nov 96: - replaced procedure CopyInto with function Copy
 4 Dec 96: - added TSingleArray2D.Copy
16 Dec 96: - added TSingleArray2D.EqualTo
18 Dec 96: - added TSingleArray.Append
12 Feb 97: - corrected bugs in the Copy methods
           - added calls to inherited Create and Destroy in TSingleArray2D
21 Feb 97: - created as modified version of unit DynArrS which
             exported the TSingleArray (+2D) type
           - deleted methods CreateLinear, Average, GetMeanAndSigma,
             MultiplyWith
 5 Mar 97: - added TByteArray2D.SetRow
           - made CopyRow a function
11 May 97: - made CopyRow more efficient by copying a block of bytes in
             stead of each element separately
14 Aug 97: - Deleted the System. scope-designator in SetRow, so that
             HeapUnit's Move procedure is called when necessary (again).
}

interface

type
   TBigByteArray = class(TObject)
   private
      FAddress: Pointer;
      FCount: Longint;
      function  GetVal(index: Longint): Byte;
      procedure SetVal(index: Longint; value: Byte);
   public
      constructor Create(N: Longint);
      constructor Dim(N: Longint);
      constructor ReadBinary(var F: File);
      destructor  Destroy; override;

      procedure Append(appendarray: TBigByteArray);
      procedure Clear;
      function  Copy: TBigByteArray;
      function  EqualTo(OtherArray: TBigByteArray): Boolean;
      procedure FillWith(Value: Byte);
      procedure FindMax(var i: Longint; var max: Byte);
      procedure FindMinMax(var min, max: Byte);
      {procedure GetMeanAndSigma(var Mean, sd: Single);}
      function  Max: Byte;
      function  Min: Byte;
      {procedure MultiplyWith(Factor: Single);}
      {procedure ReDim(NewSize: Longint);}
      {procedure SortAscending;}
      procedure Subtract(other: TBigByteArray);
      {function  Sum: Single;}
      procedure WriteBinary( var F: File );

      property Address: Pointer read FAddress;
      property Count: Longint read FCount;
      property Value[i: Longint]: Byte read GetVal write SetVal; default;
   end; { TBigByteArray }

   TByteArray2D = class(TObject)
   { Not TBigByteArray as ancestor because that would make it impossible
   to declare a new default array property. It also hides the Count property,
   so it is more difficult to mistakenly use it as a TBigByteArray }
   private
      Values: TBigByteArray;
      FCount1, FCount2: Longint;
      function  GetTotalCount: Longint;
      function  GetVal(i1, i2: Longint): Byte;
      procedure SetVal(i1, i2: Longint; value: Byte);
   public
      constructor Create(N1, N2: Longint);
      destructor  Destroy; override;
      constructor Dim(N1, N2: Longint);
      constructor ReadBinary(var F: File);

      procedure Clear;
      function  Copy: TByteArray2D;
      {procedure CopyRow(RowNo: Longint; var Row: TBigByteArray);}
      function  CopyRow(RowNo: Longint): TBigByteArray;
      procedure FindMax(var i1, i2: Longint; var max: Byte);
      procedure FindMinMax(var min, max: Byte);
      function  Max: Byte;
      function  Min: Byte;
      procedure MirrorX;
      procedure MirrorY;
      {procedure MultiplyWith( Factor: Single);}
      procedure SetRow(ColNo: Integer; RowValues: TBigByteArray);
      {function  Sum: Single;}
      function  SumColumns: TBigByteArray;
      procedure Transpose;
      procedure WriteBinary( var F: File );

      property TotalCount: Longint read GetTotalCount;
      property Count1: Longint read FCount1;
      property Count2: Longint read FCount2;
      property Value[i, j: Longint]: Byte read GetVal write SetVal; default;
   end; { TByteArray2D }

{const
   {MaxSingle: Single = 3.4E38;
   NoValue: Single = -1e20;}

procedure ReDim(var AnArray: TBigByteArray; NewSize: Longint);

implementation

uses
{$ifdef ver80}
   {avlobjs,        { Imports avltreetype }
   HeapUnit,       { Imports BigGetMem }
{$endif}
   MoreUtil,       { Imports CRLF }
   SysUtils;       { Imports IntToStr }

type
   EIndexOutOfBounds = class(Exception);
   ENotEnoughMemory = class(Exception);

procedure Error(msg: String);
begin
   raise Exception.Create(msg);
end;

procedure AddToAddress(var P: Pointer; Count: Longint);
begin { AddToAddress }
{$ifdef ver80}
  if Count > 64000
  then heapunit.AddToAddress(P, Count)
  else P := Pointer(Longint(P)+Count);
{$else}
  P := Pointer(Longint(P)+Count);
{$endif}
end;  { AddToAddress }

procedure ReDim(var AnArray: TBigByteArray; NewSize: Longint);
var Result: TBigByteArray;
    TotalSize: Longint;
begin { TBigByteArray.ReDim }
  TotalSize := AnArray.Count * SizeOf(Byte);
  Result := TBigByteArray.Create(NewSize);
  Move(AnArray.FAddress^, Result.FAddress^, TotalSize);
  AnArray.Free;
  AnArray := Result;
end;  { TBigByteArray.ReDim }

(***** methods of TBigByteArray *****)

constructor TBigByteArray.Create(N: Longint);
{ Creates one dimensional array }
var
   TotalSize: Longint;
   ErrorMessage: String;
begin { TBigByteArray.Create }
   inherited create;
   FCount := N;
   TotalSize := Longint(Count) * SizeOf(Byte);
{$ifdef ver80}
   BigGetMem(FAddress, TotalSize);
{$else}
   GetMem(FAddress, TotalSize);
{$endif}
   if (Address = nil) and (TotalSize <> 0)
   then begin
      ErrorMessage :=
        'error in TBigByteArray.create: '+
        'Not enough contiguous memory available' + CRLF +
        ' requested memory block: '+ IntToStr(TotalSize) +' bytes'{+ CRLF +
        ' largest memory block: '+ IntToStr(maxavail) +' bytes'+ CRLF +
        ' total free memory: '+ IntToStr(memavail) +' bytes'};
      raise ENotEnoughMemory.Create(ErrorMessage)
   end;
end;  { TBigByteArray.Create }

destructor TBigByteArray.Destroy;
{ Disposes array }
var
   TotalSize: Longint;
begin { TBigByteArray.Destroy }
   TotalSize := Count * SizeOf(Byte);
{$ifdef ver80}
   BigFreeMem(FAddress, TotalSize);
{$else}
   FreeMem(FAddress, TotalSize);
{$endif ver80}
   FCount := 0;
   inherited Destroy;
end;  { TBigByteArray.Destroy }

constructor TBigByteArray.Dim(N: Longint);
{ Creates one dimensional array, sets values to zero }
begin { TBigByteArray.Dim }
   Create(N);
   Clear;
end;  { TBigByteArray.Dim }

(***** end of constructors and destructors *****)

(***** field access methods *****)

function TBigByteArray.GetVal(index: Longint): Byte;
{ Gets value of array element }
var
   p: Pointer;
   value: Byte;
begin { TBigByteArray.GetVal }
   if (index < 1) or (index > Count)
   then raise EIndexOutOfBounds.Create('Dynamic array index out of bounds');
   p := Address;
   AddToAddress(p, (index-1) * SizeOf(Byte));
   system.Move(p^, value, SizeOf(Byte));
   GetVal := value;
end;  { TBigByteArray.GetVal }

procedure TBigByteArray.SetVal(index: Longint; value: Byte);
{ Sets value of array element }
var
   p: Pointer;
begin { TBigByteArray.SetVal }
   if (index < 1) or (index > Count)
   then raise EIndexOutOfBounds.Create('Dynamic array index out of bounds');
   p := FAddress;
   AddToAddress(p, (index-1) * SizeOf(Byte));
   Move(value, p^, SizeOf(Byte));
end;  { TBigByteArray.SetVal }

(***** end of the field access methods *****)

procedure TBigByteArray.Append(AppendArray: TBigByteArray);
{ Append AppendArray at the end of 'self'.
Note that the implementation can be a lot optimized for speed
by moving blocks of memory in stead of one element at a time }
var TempArray: TBigByteArray;
    i: Longint;
begin { TBigByteArray.Append }
   TempArray := Self.Copy;
   Self.Free;
   Create(Count + appendarray.Count);
   for i := 1 to Count
   do Self[i] := TempArray[i];
   for i := 1 to AppendArray.Count
   do Self[Count+i] := AppendArray[i];
   TempArray.Free;
end;  { TBigByteArray.Append }

(*function TBigByteArray.Average: Single;
var sum: Single;
    i, N: Longint;
begin { TBigByteArray.Average }
   sum := 0;
   N := 0;
   for i := 1 to count
   do begin
     if Value[i] <> NoValue
     then begin
       Inc(N);
       sum := sum + Value[i];
     end;
   end;
   if N <> 0
   then Average := sum / N
   else Average := NoValue
end;  { TBigByteArray.Average }*)

procedure TBigByteArray.Clear;
{ Assigns zero to all elements }
var
   TotalSize: Longint;
begin { TBigByteArray.Clear }
   TotalSize := Count * SizeOf(Byte);
{$ifdef ver80}
   BigFillChar(FAddress, TotalSize, chr(0));
{$else}
   FillChar(FAddress^, TotalSize, chr(0));
{$endif ver80}
end;  { TBigByteArray.Clear }

function TBigByteArray.Copy: TBigByteArray;
{ Creates a copy of the array }
begin { TBigByteArray.Copy }
   Result := TBigByteArray.Create(Count);
{$ifdef ver80}
   BigMove(FAddress, Result.FAddress, Count * SizeOf(Byte));
{$else}
   Move(FAddress^, Result.FAddress^, Count * SizeOf(Byte));
{$endif ver80}
end;  { TBigByteArray.Copy }

function TBigByteArray.EqualTo(OtherArray: TBigByteArray): Boolean;
var index: Longint;
begin { TBigByteArray.EqualTo }
  Result := True;
  if Count <> OtherArray.Count
  then Result := False
  else begin
    Index := 1;
    while (Result = True) and (index <= Count)
    do begin
      if GetVal(Index) <> OtherArray[Index]
      then Result := False
      else Inc(Index);
    end
  end;
end;  { TBigByteArray.EqualTo }

procedure TBigByteArray.FillWith(Value: Byte);
var i: Longint;
begin { TBigByteArray.FillWith }
   for i := 1 to Count
   do Self[i] := Value;
end;  { TBigByteArray.FillWith }

procedure TBigByteArray.FindMax(var i: Longint; var max: Byte);
var j: Longint;
    value: Byte;
begin { TBigByteArray.FindMax }
   max := 0;
   for j := 1 to Count
   do begin
      value := GetVal(j);
      if value > max
      then begin
         i := j;
         max := value;
      end;
   end;
end;  { TBigByteArray.FindMax }

procedure TBigByteArray.FindMinMax(var min, max: Byte);
var j: Longint;
    value: Byte;
begin { TBigByteArray.FindMinMax }
   min := 255;
   max := 0;
   for j := 1 to Count
   do begin
      value := GetVal(j);
      if value < min
      then min := value;
      if value > max
      then max := value;
   end;
end;  { TBigByteArray.FindMinMax }

(*procedure TBigByteArray.GetMeanAndSigma(var Mean, sd: Single);
{ calculates mean and standard deviation of elements }
var
  i, N: longint;
  value, Sum, SumOfSquares, MeanOfSquares: single;
begin { TBigByteArray.GetMeanAndSigma }
  SumOfSquares := 0;
  Sum := 0;
  N := 0;
  for i := 1 to Count
  do begin
    value := GetVal(i);
    if Value <> NoValue
    then begin
      Inc(N);
      Sum := Sum + value;
      SumOfSquares := SumOfSquares + sqr(value);
    end;
  end;
  if N = 0
  then begin
    Mean := NoValue;
    Sd := NoValue;
  end
  else begin
    Mean := Sum / N;
    MeanOfSquares := SumOfSquares / N;
    if (MeanOfSquares - Sqr(Mean)) < 0  { should only be possible }
    then sd := 0                    {in case of rounding off errors }
    else sd := Sqrt( MeanOfSquares - Sqr(Mean) );
  end
end;  { TBigByteArray.GetMeanAndSigma }*)

function TBigByteArray.Max: Byte;
var maximum: Byte;
    i: Longint;
begin { TBigByteArray.Max }
   maximum := 0;
   for i := 1 to count
   do if Value[i] > maximum
      then maximum := Value[i];
   Max := maximum;
end;  { TBigByteArray.Max }

function TBigByteArray.Min: Byte;
var minimum, v: Byte;
    i: Longint;
begin { TBigByteArray.Min }
   minimum := 255;
   for i := 1 to count
   do begin
      v := Value[i];
      if v < minimum
      then minimum := v;
   end;
   Min := minimum;
end;  { TBigByteArray.Min }

(*procedure TBigByteArray.MultiplyWith(Factor: Single);
{ Multiplies all elements values with factor }
var i: Longint;
    v: Single;
begin { TBigByteArray.MultiplyWith }
   for i := 1 to Count
   do begin
      v := Value[i];
      if v <> NoValue
      then Value[i] := v * Factor;
   end;
end;  { TBigByteArray.MultiplyWith }*)

constructor TBigByteArray.ReadBinary(var F: File);
{ reads TBigByteArray from untyped file }
var
   size, result: longint;
   wresult: Integer;
begin { TBigByteArray.ReadBinary }
   BlockRead(F, FCount, SizeOf(FCount), wresult);
   Create(Count);
   size := Count * SizeOf(Byte);
{$ifdef ver80}
   BigBlockRead(F, FAddress^, size, result);
{$else}
   BlockRead(F, FAddress^, size, result);
{$endif ver80}
   if size <> result
   then Error('Error in TBigByteArray.ReadBinary: ' +
               'read number of bytes <> size');
end;  { TBigByteArray.ReadBinary }

(*procedure TBigByteArray.ReDim(NewSize: Longint);
var SelfCopy: TBigByteArray;
    TotalSize: Longint;
begin { TBigByteArray.ReDim }
  TotalSize := Count * SizeOf(Byte);
  SelfCopy := Self.Copy;
  Self.Free;
  Create(NewSize);
  Move(SelfCopy.FAddress^, FAddress^, TotalSize);
  SelfCopy.Free;
end;  { TBigByteArray.ReDim }*)

(*
procedure TBigByteArray.SortAscending;
{ sorts the array ascending; may also be used for more than one-dimensional
dynamicarrays }

   PROCEDURE store_tree( root: nodepointer;
                         destination: TBigByteArray;
                         VAR currentindex: longint);
   BEGIN { store_tree }
      IF root <> Nil
      THEN BEGIN
         store_tree(root^.ltree, destination, currentindex);
         destination[currentindex] := root^.value;
         Inc(currentindex);
         store_tree(root^.rtree, destination, currentindex);
      END;
   END;  { store_tree }

VAR tree: avltreetype;
    i: longint;
    newvalue, treeval: nodepointer;
begin { TBigByteArray.SortAscending }
   tree.init;
   FOR i := 1 TO Count
   DO BEGIN
      tree.insert(Value[i]);
      {progressproc(0.8*i/nr_of_elements);}
      { Not up to 100% because tree.done requires some time too }
      { Tested: progressproc can take 50% of total time! }
   END;
   i := 1; { must be a var-parameter for store_tree }
   store_tree(tree.root, self, i);
   tree.done;
   {progressproc(1);}
end;  { TBigByteArray.SortAscending }
*)

procedure TBigByteArray.Subtract(other: TBigByteArray);
{ Subtracts the values of 'other' from the values of 'self' }
var i: Longint;
begin { TBigByteArray.Subtract }
   for i := 1 to Count
   do SetVal(i, Self[i] - other[i])
end;  { TBigByteArray.Subtract }

(*function TBigByteArray.Sum: Single;
{ Returns the sum of the values of the elements }
var i: Longint;
    s: Single;
begin { TBigByteArray.Sum }
   s := 0;
   for i := 1 to Count
   do if GetVal(i) <> NoValue
      then s := s + GetVal(i);
   Sum := s;
end;  { TBigByteArray.Sum }*)

procedure TBigByteArray.WriteBinary( var F: File );
{ writes TBigByteArray to untyped file }
var
   size, result: longint;
   wresult: Integer;
begin { TBigByteArray.WriteBinary }
   size := SizeOf(FCount);
   BlockWrite(F, FCount, size, wresult);
   size := Count * SizeOf(Byte);
{$ifdef ver80}
   BigBlockWrite(F, FAddress^, size, result);
{$else}
   BlockWrite(F, FAddress^, size, result);
{$endif ver80}
   if size <> result
   then Error('Error in TBigByteArray.WriteBinary: ' +
               'written number of bytes <> size');
end;  { TBigByteArray.WriteBinary }

(***** end of TBigByteArray *****)

constructor TByteArray2D.Create(N1, N2: Longint);
begin { TByteArray2D.Create }
  inherited Create;
  values := TBigByteArray.Create(N1*N2);
  FCount1 := N1;
  FCount2 := N2;
end;  { TByteArray2D.Create }

destructor TByteArray2D.Destroy;
begin { TByteArray2D.Destroy }
  Values.Free;
  FCount1 := 0;
  FCount2 := 0;
  inherited Destroy;
end;  { TByteArray2D.Destroy }

constructor TByteArray2D.Dim(N1, N2: Longint);
begin { TByteArray2D.Dim }
  inherited Create;
  values := TBigByteArray.Dim(N1*N2);
  FCount1 := N1;
  FCount2 := N2;
end;  { TByteArray2D.Dim }

(***** end of constructors and destructors *****)

procedure TByteArray2D.Clear;
{ Assigns zero to all elements }
begin { TByteArray2D.Clear }
   Values.Clear;
end;  { TByteArray2D.Clear }

function TByteArray2D.Copy: TByteArray2D;
begin { TByteArray2D.Copy }
   Result := TByteArray2D.Create(Count1, Count2);
{$ifdef ver80}
   BigMove(Values.FAddress, Result.Values.FAddress, Values.Count * SizeOf(Byte));
{$else}
   Move(Values.FAddress^, Result.Values.FAddress^, Values.Count * SizeOf(Byte));
{$endif ver80}
end;  { TByteArray2D.Copy }

function TByteArray2D.CopyRow(RowNo: Longint): TBigByteArray;
var
  FSource: Pointer;
begin { TByteArray2D.CopyRow }
  Result := TBigByteArray.Create(Count1);
  FSource := Values.FAddress;
  AddToAddress(FSource, ((RowNo-1)*Count1)*SizeOf(Byte) );
{$ifdef ver80}
  BigMove(FSource, Result.FAddress, Count1*SizeOf(Byte));
{$else}
  Move(FSource^, Result.FAddress^, Count1*SizeOf(Byte));
{$endif ver80}
end;  { TByteArray2D.CopyRow }

function TByteArray2D.GetTotalCount: Longint;
begin
   Result := Values.Count;
end;

function TByteArray2D.GetVal(i1, i2: Longint): Byte;
begin
   Result := Values[i1+(i2-1)*Count1];
end;

procedure TByteArray2D.SetVal(i1, i2: Longint; value: Byte);
begin
   Values[i1+(i2-1)*Count1] := Value;
end;

procedure TByteArray2D.FindMax(var i1, i2: Longint; var max: Byte);
var i: Longint;
begin
   Values.FindMax(i, max);
   i1 := (i-1) mod Count1 + 1;
   i2 := (i-1) div Count1 + 1;
end;

procedure TByteArray2D.FindMinMax(var min, max: Byte);
begin
   Values.FindMinMax(min, max);
end;

function TByteArray2D.Max: Byte;
begin
   Result := Values.Max;
end;

function TByteArray2D.Min: Byte;
begin
   Result := Values.Min;
end;

procedure TByteArray2D.MirrorX;
{ Inverses order of elements in y-direction }
var SelfCopy: TByteArray2D;
    ix, iy: longint;
begin { TByteArray2D.MirrorX }
   SelfCopy := Self.Copy;
   Self.Free;
   Create(SelfCopy.Count1, SelfCopy.Count2);
   for ix := 1 to Count1
   do for iy := 1 to Count2
      do Self[ix, iy] := SelfCopy[Count1-ix+1, iy];
   SelfCopy.Free;
end;  { TByteArray2D.MirrorX }

procedure TByteArray2D.MirrorY;
{ Inverses order of elements in x-direction }
var SelfCopy: TByteArray2D;
    ix, iy: longint;
begin { TByteArray2D.MirrorY }
   SelfCopy := Self.Copy;
   Self.Free;
   Create(SelfCopy.Count1, SelfCopy.Count2);
   for ix := 1 to Count1
   do for iy := 1 to Count2
      do Self[ix, iy] := SelfCopy[ix, Count2-iy+1];
   SelfCopy.Free;
end;  { TByteArray2D.MirrorY }

(*procedure TByteArray2D.MultiplyWith( Factor: Single);
begin { TByteArray2D.MultiplyWith }
   Values.MultiplyWith( Factor);
end; { TByteArray2D.MultiplyWith }*)

constructor TByteArray2D.ReadBinary( var F: File );
{ reads TByteArray2D from untyped fyle }
var
   size, result: longint;
   wresult: Integer;
begin { TByteArray2D.ReadBinary }
   BlockRead( F, FCount1, SizeOf(FCount1), wresult );
   BlockRead( F, FCount2, SizeOf(FCount2), wresult );
   Create( Count1, Count2);
   size := TotalCount * SizeOf( Byte);
{$ifdef ver80}
   BigBlockRead(F, Values.FAddress^, size, result);
{$else}
   BlockRead(F, Values.FAddress^, size, result);
{$endif}
   if size <> result
   then Error('Error in TByteArray2D.ReadBinary: ' +
               'read number of bytes <> size');
end;  { TByteArray2D.ReadBinary }

procedure TByteArray2D.SetRow(ColNo: Integer; RowValues: TBigByteArray);
var
  RowSize: Longint;
  InsertAddress: Pointer;
begin { TByteArray2D.SetRow }
  if (ColNo < 1) or (ColNo > Count2)
  then raise EIndexOutOfBounds.Create('Dynamic array index out of bounds');
  if RowValues.Count <> Count1
  then Error('Row doesn''t have equal number of elements as Matrix row');
  RowSize := Count1*SizeOf(Byte);
  InsertAddress := Values.FAddress;
  AddToAddress(InsertAddress, (ColNo-1)*RowSize);
  Move(RowValues.FAddress^, InsertAddress^, RowSize);
end;  { TByteArray2D.SetRow }

(*function TByteArray2D.Sum: Byte;
begin
end;*)

function TByteArray2D.SumColumns: TBigByteArray;
var sum: Byte;
    Row, Column: Longint;
begin { TByteArray2D.SumColumns }
  Result := TBigByteArray.Create(FCount1);
  for Row := 1 to FCount1
  do begin
    sum := 0;
    for Column := 1 to FCount2
    do begin
      sum := sum + Self[Row, Column];
    end;
    Result[Row] := sum;
  end;
end;  { TByteArray2D.SumColumns }

procedure TByteArray2D.Transpose;
{ Inverts rows and columns }
var SelfCopy: TByteArray2D;
    i1, i2: longint;
begin { TByteArray2D.Transpose }
   SelfCopy := Self.Copy;
   Self.Free;
   Create(SelfCopy.Count2, SelfCopy.Count1);
   for i1 := 1 to Count1
   do for i2 := 1 to Count2
      do Self[i1, i2] := SelfCopy[i2, i1];
   SelfCopy.Free;
end;  { TByteArray2D.Transpose }

procedure TByteArray2D.WriteBinary( var F: File );
{ writes TByteArray2D to untyped file }
var
   size, result: longint;
   wresult: Integer;
begin { TByteArray2D.WriteBinary }
   BlockWrite( F, FCount1, SizeOf(FCount1), wresult );
   BlockWrite( F, FCount2, SizeOf(FCount2), wresult );
   size := TotalCount * SizeOf( Byte);
{$ifdef ver80}
   BigBlockWrite( F, Values.FAddress^, size, result );
{$else}
   BlockWrite( F, Values.FAddress^, size, result );
{$endif}
   if size <> result
   then Error('Error in TByteArray2D.WriteBinary: ' +
               'written number of bytes <> size')
end;  { TByteArray2D.WriteBinary }

(***** end of TByteArray2D *****)

end. { UNIT DynArrs }
