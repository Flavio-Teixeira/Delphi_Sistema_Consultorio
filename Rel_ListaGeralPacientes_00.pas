unit Rel_ListaGeralPacientes_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TRel_ListaGeralPacientes00 = class(TForm)
    QR_ListaGeralPacientes: TQuickRep;
    Cabecalho: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel6: TQRLabel;
    QRSysData2: TQRSysData;
    Detalhe: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel8: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel_ListaGeralPacientes00: TRel_ListaGeralPacientes00;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

end.
