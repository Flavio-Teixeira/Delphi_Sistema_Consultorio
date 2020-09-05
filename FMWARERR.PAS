unit FmWarErr;
{
Exports TWarningBox which can display warnings while the application
keeps running. and terminate the application when its method
Error is called.

C.A. van Beest, R.P. Sterkenburg, TNO-PML, Rijswijk, The Netherlands

28 Feb 97: - replaced Windows with Wintypes, WinProcs in uses clause
             to make compilation under Delphi 1 possible
23 Apr 97: - Form changed
           - Proc. ModalWarning added
           - Proc. Warning changed
           - Unnecessary button related procedures deleted
24 Apr 97: - added use of unit MoreUtil (imports Sleep for Delphi1)
           - added comments
           - ShowTime now rounded to msec in stead of seconds
}

interface

uses
  WinProcs, WinTypes, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TWarningForm = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Memo1: TMemo;
    procedure ModalWarning( MessageStr: string);
    procedure Warning( ShowTime: single; MessageStr: string);
    procedure Error( MessageStr: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WarningForm: TWarningForm;

implementation

{$R *.DFM}

uses
  MoreUtil;   { Imports Sleep }

procedure TWarningForm.Error( MessageStr: string);
begin { TWarningForm.Error }
  Caption := 'Fatal error';
  Memo1.Lines.Add( MessageStr);
  OKBtn.Show;
  ShowModal;
  Halt;
end;  { TWarningForm.Error }

procedure TWarningForm.ModalWarning( MessageStr: string);
begin { TWarningForm.ModalWarning }
  Memo1.Lines.Add( MessageStr);
  CancelBtn.Show;
  ShowModal;
  CancelBtn.Hide;
end;  { TWarningForm.ModalWarning }

procedure TWarningForm.Warning( ShowTime: single; MessageStr: string);
{ ShowTime supposed to be in seconds }
begin { TWarningForm.Warning }
  Memo1.Lines.Add( MessageStr);
  Show;
  Application.ProcessMessages;
  Sleep( Round(1000 * ShowTime));
  Hide;
end;  { TWarningForm.Warning }

end.
