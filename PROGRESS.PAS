unit progress;
{ Exports procedure ShowProgress and type TProgressProc.
Useful for giving user feedback during lengthy operations.
The programmer can assign his own progress procedure to ShowProgress
when he wants. By default, under DOS, procedure EmptyProgressProc
is assigned to progressproc and under Delphi ProgressForm.ShowProgress
(see unit FmProgr),
Another procedure which can be used is available: WritePercentage

R.P. Sterkenburg, TNO PML Rijswijk, The Netherlands

30 Aug 95: - created
12 Nov 96: - converted all keywords to lowercase
 4 Dec 96: - renamed progressproc to ShowProgress
           - added Delphi compiler directives to let it
             automatically use ShowProgress from FmProgr
11 Dec 96: - improved comments
           - default EmptyProgressPorc in stead of WritePercentage
 9 Feb 97: - changed compiler directives so that the unit also works under
             Delphi 2
}
interface

{$IFDEF ver70}
uses
   Crt;     { Imports GotoXY }
{$ELSE}
uses
  FmProgr;     { Imports ShowProgress }
{$ENDIF ver70}

type
  TProgressProc = procedure(frac: single);

var
  ShowProgress: TProgressProc;

procedure EmptyProgressProc(frac: single);

{$IFNDEF ver70}
procedure ShowAsGauge(frac: single);
{$ENDIF}

{$IFDEF ver70}
procedure WritePercentage(frac: single);
{$ENDIF}


implementation


{$F+}
procedure EmptyProgressProc(frac: single);
begin end;
{$F-}

{$IFDEF ver70}
{$F+}
procedure WritePercentage(frac: single);
begin
   GotoXY(1, WhereY);
   write('Finished: ', frac*100:6:2, ' %  ');
   if frac >= 1
   then Writeln;
end;
{$F-}
{$ENDIF ver70}

{$IFNDEF ver70}
{$F+}
procedure ShowAsGauge(frac: single);
begin
  FmProgr.ShowProgress(frac)
end;
{$F-}
{$ENDIF ver70}

begin
{$IFDEF ver70}
   ShowProgress := EmptyProgressProc;
{$ELSE}
   ShowProgress := ShowAsGauge;
{$ENDIF ver70}
end.
