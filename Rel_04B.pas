unit Rel_04B;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRel_Faturamento_Detalhado = class(TForm)
    RPT_Detalhado: TQuickRep;
    Cabecalho: TQRBand;
    Detalhe: TQRBand;
    Rodape: TQRBand;
    Grupo: TQRGroup;
    Total_Grupo: TQRBand;
    QRL_Nome_medico: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel6: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRL_Dt_Inicio: TQRLabel;
    QRLabel7: TQRLabel;
    QRL_Dt_Final: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText6: TQRDBText;
    Expressao_Valor: TQRExpr;
    QRLabel14: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel13: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel15: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_Faturamento_Detalhado: TRel_Faturamento_Detalhado;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
