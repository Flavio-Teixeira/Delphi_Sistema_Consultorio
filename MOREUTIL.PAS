unit Moreutil;
{
Exports some general purpose routines:
FindCommonStrings, FreeObject,
OpenIniFile, RunDOSCommand, RunProgram, ShowMessage

C.A. van Beest, R.P. Sterkenburg, TNO-PML, Rijswijk, The Netherlands

22 Aug 95: - added ChooseString
 4 Sep 95: - added ChooseStrings
28 Aug 96: - added OpenIniFile
10 Sep 96: - added RunDosCommand
13 Nov 96: - deleted ChooseString, ChooseStrings and EnterInteger;
             they weren't used (it's too easy to make a nicer one
             when needed)
           - added FindCommonStrings
30 Dec 96: - added ShowMessage
 6 Feb 97: - added FreeObject
12 Feb 97: - made compilable under Delphi 2 too
           - renamed from MoreUtils to MoreUtil
13 Feb 97: - replaced FreeObject with the original version of the code
             that came with The Delphi Magazine, issue 18
           - improved comments and layout a little bit
18 Feb 97: - added ErStop procedure
           - improved FreeObject to aceept one single passed parameter
28 Feb 97: - Added procedures FatalError and WarningMessage
           - Added some string constants and functions
           - Procedure ErStop removed from Interface
03 Mar 97: - Added functions Two- and ThreeDigitstr
05 Mar 97: - Added Sleep, GetIniPath, ForceBackslash, SplitStringAt
06 Mar 97: - Added ChangePath
13 Mar 97: - Added ClearDir, FileNameSplit, SpaceStr
14 Mar 97: - Added StartTime, StopTime, Elapsed
           - Added Trim (SysUtils' Trim has a bug)
19 Mar 97: - LeftStr and RightStr in stead of leftstr and rightstr
           - indentation; comments
24 Mar 97: - Added ExtractFileDir/Path for Delphi 1
04 Apr 97: - FatalError and WarningMessage changed; they now use
             a global (not exported) variable WarningForm
           - Initialization and Finalization added
 9 Apr 97: - 'uncommented' ChooseString again (used by program Analysis)
             and added usage of unit StrFunc again (temporarily)
           - StrFunc only used in Delphi 1
16 Apr 97: - added function WithoutBackslash
18 Apr 97: - added procedure GetIniString
21 Apr 97: - Added function VersionStr
23 Apr 97: - Added functions LeftAlign and RightAlign
           - Proc. warningMessage changed
24 Apr 97: - deleted ChooseString and ChooseStrings. They weren't used
             anywhere anymore.
           - added StrToDateTime because SysUtils' version
             doesn't work well with Delphi1
20 May 97: - added CountLines
27 May 97: - added FindString and type TFindOption and TFindOptions
}

(*************************) interface (*************************)

uses
  Classes,         { Imports TStringlist }
  IniFiles;        { Imports TIniFile }

const
  CR    = #13;     { carriage return character }
  LF    = #10;     { linefeed character }
  Space = #32;     { space character }
  Tab   = #9;      { Tab character }
  CRLF  = CR + LF;

type
  string2  = string[2];
  string4  = string[4];
  string8  = string[8];
  string12 = string[12];

  TFindOption = (foCaseSensitive, foWholeWord);
  TFindOptions = set of TFindOption;

{ For function Elapsed }
var
  StartTime, StopTime: TDateTime;

procedure ChangePath(oldfilespec: string; newpath: string;
                     var newfilespec: string);
{ changes the path of a filespecification into 'newpath' }

procedure ClearDir(Dir: string);
{ Deletes the files in an existing directory }

procedure CountLines(fname: String; var Nlines: Longint);
{ Counts the number of lines in a text file }

function DirectoryExists(dir: String): Boolean;
{ Checks whether or not a directory exists.
The current directory remains current }

function Elapsed: string;
{ Returns runtime in seconds }

{$ifdef ver80}
function ExtractFileDir( Spec: string): string;

function ExtractFilePath( Spec: string): string;
{$endif ver80}

procedure FatalError(MessageStr: string);
{ Produces window with Str as message.
  Stops calling program. }

procedure FileNameSplit(Spec: string; var path, name, ext:string);
{ Returns separate parts of a file specification }

procedure FindCommonStrings(List1, List2: TStringlist;
                            var CommonStrings: TStringlist);
{ Returns in CommonStrings the stings that are present in
both List1 and List2 }

function FindString(substr, s: String; options: TFindOptions): Integer;
{ Finds substring in a string; options e.g.: whole word; case-sensitive }

procedure FreeObject(var o);
{ Frees the object that's pointed to by o AND sets o to nil, so
that it can't be Destroyed a second time (which would cause a GPF) }

function ForceBackslash(const DirName: String): String;
{ Adds a default backslash to a directory name if not already present }

procedure GetIniPath(section, varname: String; var dir: String);
{ Finds path in .INI file.
See GetIniString, but the found string must be a path. }

procedure GetIniString(section, varname: String; var result: String);
{ Finds string value in .INI file }

function LeftAlign(s: String; count: Integer): String;
{ Returns a string with length Count, with s at the left and
padded with spaces to the right }

function LeftStr(s: String; count: Integer): String;
{ Returns a string with the first 'count' characters of s }

procedure OpenIniFile(var Inifile: TIniFile);
{ Opens the ini file of the 'current application'.
It is assumed to be at the same location as the executable }

function RightAlign(s: String; count: Integer): String;
{ Returns a string with length Count, with s at the right and
padded with spaces to the left }

function RightStr(s: String; count: Integer): String;
{ Returns a string with the last 'count' characters of s }

procedure RunDosCommand(CmdLine: String);
{ Runs Dos command as if it were started from the command line,
explicitly calling command.com }

procedure RunProgram(CmdLine: String);
{ Runs program as if it were started from the command line }

procedure ShowMessage(message: String);
{ Same as Dialogs' ShowMessage, but sets the cursor to crDefault
before displaying the dialog and sets it back to what it was
afterwards }

{$ifdef ver80}
procedure Sleep(msec: Longint);
{$endif ver80}

function SpaceStr(n: longint): string;
{ returns string containing n spaces (#32) }

procedure SplitStringAt(str: String; splitchar: Char;
                        var firstpart, secondpart: String);
{ Splits string at first splitchar;
  if splitchar is not found, firstpart:=str; secondpart:='' }

function StrToDateTime(const S: string): TDateTime;
{ Same as SysUtils.StrToDateTime, but this one also
works under Delphi 1 for date of format YY/MM/DD. }

function ThreeDigitStr(n: Integer): String;
{ Makes a string of three digits representing the number 'n';
the number ought to lie in the interval [0, 999] }

procedure Trim(var s: String);
{ Eliminates leading and trailing spaces from a string }

function TwoDigitStr(n: Integer): String;
{ Makes a string of two digits representing the number 'n';
the number ought to lie in the interval [0, 99] }

function VersionStr: String;
{ Returns a string that represents the date of creation of the
  executable file of the program that's being executed }

procedure WarningMessage(Str: string);
{ Produces window with Str as message.
  Calling program keeps running. }

function WithoutBackslash(const DirName: String): String;
{ Makes sure that a directory is not followed by a backslash,
with one exception: drive letter + ':\' is left unchanged }

(*************************) implementation (*************************)

uses
  Controls,        { Imports TCursor }
  FmWarErr,        { Imports TWarningForm }
  Dialogs,         { Imports ShowMessage }
  Forms,           { Imports Application }
  SysUtils,        { Imports ChangeFileExt }
  WinProcs,        { Imports WinExec }
  WinTypes;        { Imports sw_restore }

var
  WarningForm: TWarningForm;

procedure ChangePath(OldfileSpec: string; Newpath: string;
                     var NewfileSpec: string);
{ changes the path of a filespecification into 'newpath' }
var
  Name: string;
begin { ChangePath }
  Name := ExtractFileName(OldfileSpec);
  NewfileSpec := ForceBackslash(Newpath) + Name;
end;  { ChangePath }

procedure ClearDir(Dir: string);
{ Deletes the files in an existing directory }
var
  CurrentDir: string;
  sr: TSearchRec;
  Result: longint;
begin { ClearDir }
  Getdir(0, CurrentDir);
  Chdir(Dir);
  Result := FindFirst(Dir + '\*.*', faAnyFile, sr);
  while Result = 0 do begin
    SysUtils.DeleteFile(sr.name);
    Result := FindNext(sr);
  end;
  SysUtils.FindClose(sr);
  Chdir(CurrentDir);
end; { ClearDir }

procedure CountLines(fname: String; var Nlines: Longint);
{ Counts the number of lines in a text file }
var infile: Text;
begin { CountLines }
   AssignFile(infile, fname);
   Reset(infile);
   Nlines := 0;
   while not Eof(infile)
   do begin
      Readln(infile);
      Inc(Nlines);
   end;
   Close(infile);
end;  { CountLines }

function DirectoryExists(dir: String): Boolean;
{ Checks whether or not a directory exists.
The current directory remains current }
var
  currentdir: String;
begin { DirectoryExists }
  GetDir( 0, currentdir);
  {$I-}
  ChDir( dir);
  {$I+}
  if IOresult = 0
  then DirectoryExists := True
  else DirectoryExists := False;
  ChDir(currentdir);
end; { DirectoryExists }

function Elapsed: string;
{ Returns runtime in seconds }
var
  Period: double;
begin { Elapsed }
  Period := 86400 * (StopTime - StartTime);
  Elapsed := IntToStr(Round(Period));
end;  { Elapsed }

{$ifdef ver80}
function ExtractFileDir( Spec: string): string;
begin
  result := SysUtils.ExtractFilePath( Spec);
end;

function ExtractFilePath( Spec: string): string;
begin
  result := ForceBackSlash(SysUtils.ExtractFilePath( Spec));
end;
{$endif ver80}

procedure FatalError(MessageStr: string);
{ Shows window with Str as message.
  Stops calling program. }
var
  ErrorForm: TWarningForm;
begin { FatalError }
  ErrorForm := TWarningForm.Create(nil);
  ErrorForm.Error(MessageStr);
  ErrorForm.Free;
end;  { FatalError }

procedure FileNameSplit(Spec: string; var path, name, ext:string);
{ Returns separate parts of a file specification }
var
  len: longint;
  FullName: string;
begin { FileNameSplit }
  path := ExtractFilePath(Spec);
  ext := ExtractFileExt(Spec);
  FullName := ExtractFileName(Spec);
  len := length(FullName) - length(ext);
  name := copy(FullName, 1, len);
end; { FileNameSplit }

procedure FindCommonStrings(List1, List2: TStringlist;
                            var CommonStrings: TStringlist);
{ Returns in CommonStrings the stings that are present in
both List1 and List2 }
var Value: String;
    i: Integer;
begin { FindCommonStrings }
  CommonStrings := TStringlist.Create;
  for i := 1 to List1.Count
  do begin
    Value := List1[i-1];
    if List2.IndexOf(Value) <> -1
    then if CommonStrings.IndexOf(Value) = -1
    then CommonStrings.Add(Value);
  end;
  for i := 1 to List2.Count
  do begin
    Value := List2[i-1];
    if List1.IndexOf(Value) <> -1
    then if CommonStrings.IndexOf(Value) = -1
    then CommonStrings.Add(Value);
  end;
end;  { FindCommonStrings }

function FindString(substr, s: String; options: TFindOptions): Integer;
{ Finds substring in a string; options e.g.: whole word; case-sensitive }
const
  WordChars = ['a'..'z', 'A'..'Z', #128..#168];
var
  p, l: Integer;
  Found: Boolean;
begin { FindString }
  if not (foCaseSensitive in options)
  then begin
    substr := UpperCase(substr);
    s := UpperCase(s);
  end;
  if not (foWholeWord in options)
  then FindString := Pos(substr, s)
  else begin
    repeat
      Found := False;
      l := length(substr);
      p := Pos(substr, s);
      if p <> 0
      then begin
        Found := True;
        if p > 1
        then if s[p-1] in WordChars
             then Found := False;
        if p+l <= Length(s)
        then if s[p+l] in WordChars
             then Found := False;
        if not Found
        then s[p] := Chr(Ord(s[p])+1); { this trick makes Pos find the next
                                        occurrence when called next time }
      end
    until Found or (p=0);
    FindString := p;
  end;
end;  { FindString }

(*procedure FreeObject(var o; q: TObject);
{ This code came with The Delphi Magazine, Issue 18, TipTrix }
var p: TObject absolute o;
begin { FreeObject }
  if p <> q  { check if both parameters point to the same instance }
  then raise exception.Create('"FreeObject": different params');
  p.free;
  p := nil;
end;  { FreeObject }*)
procedure FreeObject(var o);
{ Frees object p AND sets it to nil }
var p: TObject absolute o;
begin { FreeObject }
  p.Free;
  p := nil;
end;  { FreeObject }

function ForceBackslash(const DirName: String): String;
{ Adds a default backslash to a directory name if not already present }
begin { ForceBackslash }
  if (DirName = '') or not (DirName[Length(DirName)] in ['\', ':'])
  then ForceBackSlash := DirName + '\'
  else ForceBackslash := Dirname
end;  { ForceBackslash }

procedure GetIniPath(section, varname: String; var dir: String);
{ Finds path in .INI file }
var
  IniFile: TIniFile;
begin { GetIniPath }
  OpenIniFile(IniFile);
  dir := IniFile.ReadString(section, varname, '');
  dir := ForceBackSlash(dir);
  IniFile.Free;
end;  { GetIniPath }

procedure GetIniString(section, varname: String; var result: String);
{ Finds string value in .INI file }
var
  IniFile: TIniFile;
begin { GetIniPath }
  OpenIniFile(IniFile);
  Result := IniFile.ReadString(section, varname, '');
  IniFile.Free;
end;  { GetIniPath }

function LeftAlign(s: String; count: Integer): String;
{ Returns a string with length Count, with s at the left and
padded with spaces to the right }
begin { LeftAlign }
   if Length(s) > count
   then LeftAlign := Copy(s, 1, count)
   else LeftAlign := s + SpaceStr(count - Length(s))
end;  { LeftAlign }

function LeftStr(s: String; count: Integer): String;
begin
  LeftStr := Copy(s, 1, count)
end;  { LeftStr }


procedure OpenIniFile(var Inifile: TIniFile);
{ Opens the ini file of the 'current application'.
It is assumed to be at the same location as the executable }
var IniFilename: String;
begin { OpenIniFile }
  IniFilename := Application.Exename;
  IniFilename := ChangeFileExt(Inifilename, '.ini');
  IniFile := TIniFile.Create(IniFilename);
end;  { OpenIniFile }

function RightAlign(s: String; count: Integer): String;
{ Returns a string with length Count, with s at the right and
padded with spaces to the left }
begin { RightAlign }
   if Length(s) > count
   then RightAlign := Copy(s, count, Length(s)-count)
   else RightAlign := SpaceStr(count - Length(s)) + s
end;  { RightAlign }

function RightStr(s: String; count: Integer): String;
begin
  RightStr := Copy(s, Length(s)-count+1, count)
end;  { RightStr }

procedure RunDosCommand(CmdLine: String);
{ Runs Dos command as if it were started from the command line,
explicitly calling command.com }
var Result: Integer;
begin { RunDosCommand }
  CmdLine := 'command.com' + ' /C ' + Cmdline + Chr(0);
  Result := WinExec(@CmdLine[1], sw_minimize);
  if Result < 32
  then ShowMessage('Execution of command line' + CRLF +
                   LeftStr(CmdLine, Length(CmdLine)-1) + CRLF +
                   'failed. Error code:' + IntToStr(result));
end;  { RunDosCommand }

procedure RunProgram(CmdLine: String);
{ Runs program as if it were started from the command line }
var
  ExecResult: Integer;
  Filename: array[0..100] of Char;
  p, H: Integer;
begin { RunProgram }
  CmdLine := Cmdline + Chr(0);
  ExecResult := WinExec(@CmdLine[1], sw_restore);
  if ExecResult < 32
  then ShowMessage('Execution of command line' + CRLF +
                   LeftStr(CmdLine, Length(CmdLine)-1) + CRLF +
                   'failed. Error code:' + IntToStr(ExecResult));
  {p := Pos(' ', CmdLine);
  CmdLine := LeftStr(CmdLine, p-1) + Chr(0);}
  Application.ProcessMessages;
  H := GetModuleHandle(@CmdLine[1]);
end;  { RunProgram }

procedure ShowMessage(message: String);
{ Same as Dialogs' ShowMessage, but sets the cursor to crDefault
before displaying the dialog and sets it back to what it was
afterwards }
var oldCursor: TCursor;
begin { ShowMessage }
  OldCursor := Screen.Cursor;
  Screen.Cursor := crDefault;
  Dialogs.ShowMessage(message);
  Screen.Cursor := OldCursor;
end;  { ShowMessage }

function SpaceStr(n: longint): string;
{ returns string containing n spaces (#32) }
var
  j: longint;
begin { SpaceStr }
  Result := '';
  for j := 1 to n do Result := Result + Space;
end; { SpaceStr }

procedure SplitStringAt(str: String; splitchar: Char;
                       var firstpart, secondpart: String);
{ Splits string at first splitchar;
 if splitchar is not found, firstpart:=str; secondpart:='' }
var p: Integer;
begin { SplitStringAt }
  p := Pos(splitchar, str);
  if p <> 0
  then begin
    firstpart := LeftStr(str, p-1);
    secondpart := RightStr(str, length(str)-p)
  end
  else begin
    firstpart := str;
    secondpart := ''
  end
end;  { SplitStringAt }

function StrToDateTime(const S: string): TDateTime;
{ Same as SysUtils.StrToDateTime, but this one also
works under Delphi 1 for date of format YY/MM/DD. }
var p: Integer;
    YStr, RestStr: String;
begin { StrToDateTime }
{$ifndef ver80}
  Result := SysUtils.StrToDateTime(S);
{$else}
  if Copy({ShortDateFormat}ShortTimeFormat, 1, 2) = 'yy'
  then begin
    DateSeparator := '/';
    p := Pos(DateSeparator, S);
    Ystr := Copy(S, 1, p-1);
    RestStr := Copy(S, p+1, Length(S)-p);
    p := Pos(' ', RestStr);
    if p = 0
    then p := Length(RestStr)+1;
    System.Insert(DateSeparator+YStr, RestStr, p);
    Result := SysUtils.StrToDateTime(RestStr);
    RestStr := FormatDateTime('yy-mm-dd', Result); { for debugging }
  end
  else Result := SysUtils.StrToDateTime(S)
{$endif}
end;  { StrToDateTime }


function ThreeDigitStr(n: Integer): String;
{ Makes a string of three digits representing the number 'n';
the number ought to lie in the interval [0, 999] }
var s: String;
begin { threedigitstr }
  Str(n, s);
  while Length(s) < 3
  do s := '0' + s;
  threedigitstr := s
end;  { threedigitstr }

procedure Trim(var s: String);
{ Eliminates leading and trailing spaces from a string }
begin { Trim }
  while Pos(' ', s) = 1
  do system.Delete(s, 1, 1);
  while (s <> '') and (s[Length(s)] = ' ')
  do system.Delete(s, Length(s), 1);
end;  { Trim }

function TwoDigitStr(n: Integer): String;
{ Makes a string of two digits representing the number 'n';
the number ought to lie in the interval [0, 99] }
var s: String;
begin { Twodigitstr }
  Str(n, s);
  if n < 10
  then TwoDigitStr := '0' + s
  else TwoDigitStr := s
end;  { Twodigitstr }

{$ifdef ver80}
procedure Sleep(msec: Longint);
const
  msecperday = 86400000; { = 24 * 3600 * 1000 }
var
  Start: TDateTime;
begin { Sleep }
  Start := Now;
  repeat Application.ProcessMessages
  until Now-Start > msec/msecperday
end;  { Sleep }
{$endif ver80}

function VersionStr: String;
{ Returns a string that represents the date of creation of the
  executable file of the program that's being executed }
const
  Month: array[1..12] of string =
    ('January', 'February', 'March', 'April', 'May', 'June', 'July',
     'August', 'September', 'October', 'November', 'December');
var
  DateTime: TDateTime;
  Filehandle, Filedate: longint;
  yy, mm, dd: word;
begin { VersionStr }
  Filehandle := FileOpen( ParamStr( 0), fmShareDenyNone);
  Filedate := FileGetDate( Filehandle);
  FileClose( Filehandle);
  DateTime := FileDateTodateTime( FileDate);
  DecodeDate( DateTime, yy, mm, dd);
  Result := IntToStr( dd) + ' ' + Month[mm] + ' ' + IntToStr( yy);
end;  { VersionStr }

procedure WarningMessage( Str: string);
{ Shows window with Str as message during 1 second.
  Calling program keeps running. }
begin { WarningMessage }
  if WarningForm = nil
  then WarningForm := TWarningForm.Create( nil);
  WarningForm.Warning( 1, Str);
end;  { WarningMessage }

function WithoutBackslash(const DirName: String): String;
{ Makes sure that a directory is not followed by a backslash,
with one exception: drive letter + ':\' is left unchanged }
begin { WithoutBackslash }
  if (Length(Dirname) = 0)
     or ((Length(Dirname) = 3) and (DirName[2]=':'))
     or (DirName[Length(Dirname)] <> '\')
  then Result := Dirname
  else Result := Copy(Dirname, 1, Length(Dirname)-1)
end;  { WithoutBackslash }

initialization
  WarningForm := nil;
{$ifndef ver80}
finalization
  WarningForm.Free;
{$endif ver80}
end.  { Unit MoreUtil }
