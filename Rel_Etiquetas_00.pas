unit Rel_Etiquetas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  TRel_Etiquetas00 = class(TForm)
    qrEtiquetas: TQuickRep;
    DetailBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    dbtPaciente1: TQRDBText;
    dbtEndereco_Numero1: TQRDBText;
    dbtBairro_Cidade_Estado1: TQRDBText;
    dbtCEP1: TQRDBText;
    dbtCEP2: TQRDBText;
    dbtBairro_Cidade_Estado2: TQRDBText;
    dbtEndereco_Numero2: TQRDBText;
    dbtPaciente2: TQRDBText;
    dbtA1: TQRDBText;
    dbtA2: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_Etiquetas00: TRel_Etiquetas00;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
