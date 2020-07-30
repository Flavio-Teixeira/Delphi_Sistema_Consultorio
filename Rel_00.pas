unit Rel_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls;

type
  TRel_Horario = class(TForm)
    RPT_Horario: TQuickRep;
    BND_Detalhe: TQRBand;
    BND_Cabecalho: TQRBand;
    BND_Rodape: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRL_Nome_medico: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDB_Hora: TQRDBText;
    QRDB_Descricao: TQRDBText;
    QRDB_Tipo: TQRDBText;
    QRDB_Convenio: TQRDBText;
    QRLabel4: TQRLabel;
    QRSysData2: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_Horario: TRel_Horario;

implementation

uses Rotinas_Gerais, Conexao_BD;

{$R *.dfm}

end.
