unit Rel_03A;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TRel_Recibo = class(TForm)
    RPT_Recibo: TQuickRep;
    BND_Detalhe: TQRBand;
    BND_Cabecalho: TQRBand;
    BND_Rodape: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QR_recibo_numero: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QR_recibo_valor: TQRLabel;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QR_recibo_discriminacao: TQRMemo;
    QRShape4: TQRShape;
    QR_recibo_assinatura: TQRLabel;
    QRLabel8: TQRLabel;
    QR_recibo_data_emissao: TQRLabel;
    QR_Linha: TQRMemo;
    QRShape5: TQRShape;
    QR_recibo_paciente_nome: TQRLabel;
    QRLabel6: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_Recibo: TRel_Recibo;

implementation

{$R *.dfm}

end.
