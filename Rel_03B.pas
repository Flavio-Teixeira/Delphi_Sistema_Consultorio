unit Rel_03B;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables;

type
  TRel_Ctrl_Recibo = class(TForm)
    RPT_Ctrl_Recibo: TQuickRep;
    BND_Detalhe: TQRBand;
    BND_Cabecalho: TQRBand;
    BND_Rodape: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRL_Nome_medico: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRSysData2: TQRSysData;
    QRDB_Numero: TQRDBText;
    QRDB_Data: TQRDBText;
    QRDB_Nome: TQRDBText;
    QRDB_Discriminacao: TQRDBText;
    QRDB_Assinatura: TQRDBText;
    QRDB_Valor: TQRDBText;
    QRLabel11: TQRLabel;
    QR_Total: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRL_Dt_Inicio: TQRLabel;
    QRL_Dt_Final: TQRLabel;
    procedure BND_DetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_Ctrl_Recibo: TRel_Ctrl_Recibo;

implementation

uses Rotinas_Gerais, Conexao_BD, Rel_03;

{$R *.dfm}

procedure TRel_Ctrl_Recibo.BND_DetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

var Str_Total: String;

begin
     RPT_Total := RPT_Total + QRDB_Valor.DataSet.FieldValues['Recibo_valor'];

     Str(RPT_Total:13:2,Str_Total);
     QR_Total.Caption := Ponto_Virgula(Str_Total);
end;

end.
