unit Rel_Controle_Pagamentos_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  TRel_Controle_Pagamentos00 = class(TForm)
    QR_Controle_Pagamentos: TQuickRep;
    Cabecalho: TQRBand;
    lblNomeMedico: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel6: TQRLabel;
    QRSysData2: TQRSysData;
    lblPeriodo: TQRLabel;
    Detalhe: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    Expressao_Valor: TQRExpr;
    QRExpr3: TQRExpr;
    Grupo: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr2: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr4: TQRExpr;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_Controle_Pagamentos00: TRel_Controle_Pagamentos00;

implementation

uses Conexao_BD;

{$R *.dfm}

procedure TRel_Controle_Pagamentos00.FormCreate(Sender: TObject);
begin
    {*** Trabalha com o Ano de 4 Dígitos ***}
    ShortDateFormat := 'dd/mm/yyyy';
end;

end.
