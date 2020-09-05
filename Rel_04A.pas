unit Rel_04A;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls;

type
  TRel_Faturamento = class(TForm)
    RPT_Faturamento: TQuickRep;
    BND_Detalhe: TQRBand;
    BND_Cabecalho: TQRBand;
    BND_Rodape: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRL_Nome_medico: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRL_Dt_Inicio: TQRLabel;
    QRLabel7: TQRLabel;
    QRL_Dt_Final: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRL_Convenio: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRL_Consulta_Qtde: TQRLabel;
    QRL_Consulta_CH: TQRLabel;
    QRL_Total_Consulta: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRL_Cirurgia_Qtde: TQRLabel;
    QRLabel20: TQRLabel;
    QRL_Cirurgia_CH: TQRLabel;
    QRLabel22: TQRLabel;
    QRL_Total_Cirurgia: TQRLabel;
    QRShape1: TQRShape;
    QRLabel24: TQRLabel;
    QRL_Total_Geral: TQRLabel;
    QRLabel3: TQRLabel;
    QRL_Adicionais_Qtde: TQRLabel;
    QRLabel19: TQRLabel;
    QRL_Total_Adicionais: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRL_Total_Material: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_Faturamento: TRel_Faturamento;

implementation

{$R *.dfm}

end.
