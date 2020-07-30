unit FmProgr;
{ Exports procedure ShowProgress, which can show a small window
with a Gauge in it. This procedure can be used in conjunction with
unit Progress.

 4 Dec 96: - Put variable ProgessForm in implementation
           - now ProgressForm is created in the initialization
 9 Dec 96: - Put variable PorgessForm in interface again, to make
             it possible to access its caption
 6 Mar 97: - improved TProgressForm.ShowProgress slightly (more robust now)
}

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Gauges;

type
  TProgressForm = class(TForm)
    Gauge1: TGauge;
  private
    { Private declarations }
    procedure ShowProgress(frac: Single);
  public
    { Public declarations }
  end; { TProgressForm }

procedure ShowProgress(frac: Single);

var
  ProgressForm: TProgressForm;

implementation

{$R *.DFM}

procedure TProgressForm.ShowProgress(frac: single);
begin { TProgressForm.ShowProgress }
  if frac > 0.9999
  then Visible := False
  else begin
    if not Visible
    then Visible := True;
    Gauge1.progress := Round(frac*100);
  end;
end;  { TProgressForm.ShowProgress }

{$F+}
procedure ShowProgress(frac: Single);
begin
  ProgressForm.ShowProgress(frac);
  Application.ProcessMessages;
end;
{$F-}

initialization
  ProgressForm := TProgressForm.Create(nil);
end. { unit FmProgr }
