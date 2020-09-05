unit Ajuda_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TAjuda00 = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    BT_Sair: TBitBtn;
    Ajuda_ConsulTEX: TMemo;
    procedure BT_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ajuda00: TAjuda00;

implementation

{$R *.dfm}

procedure TAjuda00.BT_SairClick(Sender: TObject);
begin
     Ajuda00.Close;
end;

end.
