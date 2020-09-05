unit Rel_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TRel_Ficha_Paciente = class(TForm)
    RPT_Ficha_Paciente: TQuickRep;
    BND_Cabecalho: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QR_Descricao_Convenio: TQRLabel;
    QRL_Nome_medico: TQRLabel;
    QRLabel34: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel7: TQRLabel;
    QR_Idade: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel17: TQRLabel;
    BND_Detalhe: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    Paciente_RG: TQRDBText;
    Paciente_Nascimento: TQRDBText;
    Paciente_Cadastro: TQRDBText;
    Paciente_Naturalidade: TQRDBText;
    QRLabel14: TQRLabel;
    Paciente_Matricula: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel27: TQRLabel;
    QR_Sexo: TQRLabel;
    QR_Estado_Civil: TQRLabel;
    QR_Indicacao: TQRLabel;
    QR_Tipo_Residencia: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_Ficha_Paciente: TRel_Ficha_Paciente;

implementation

uses Rotinas_Gerais, Conexao_BD;

{$R *.dfm}

end.
