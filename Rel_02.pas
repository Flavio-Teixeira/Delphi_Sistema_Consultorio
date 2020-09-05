unit Rel_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TRel_Envelope = class(TForm)
    RPT_Envelope: TQuickRep;
    BND_Cabecalho: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    BND_Rodape: TQRBand;
    BND_Detalhe: TQRBand;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_Envelope: TRel_Envelope;

implementation

uses Rotinas_Gerais, Conexao_BD;

{$R *.dfm}

end.
