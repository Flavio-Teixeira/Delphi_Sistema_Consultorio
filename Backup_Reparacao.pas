unit Backup_Reparacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComOBJ;

type
  TBackupReparacao = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    BT_Gravar: TBitBtn;
    BT_Sair: TBitBtn;
    Label1: TLabel;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_GravarClick(Sender: TObject);
  private
    { Private declarations }

    procedure Compacta_BD();

  public
    { Public declarations }
  end;

var
  BackupReparacao: TBackupReparacao;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TBackupReparacao.BT_SairClick(Sender: TObject);
begin
     BackupReparacao.Close;
end;

procedure TBackupReparacao.BT_GravarClick(Sender: TObject);
begin
    Compacta_BD();

    // Fecha o Aplicativo

    ShowMessage('O ConsulTEX será Fechado, para finalização do Processo !!!');

    BackupReparacao.Close;
end;

procedure TBackupReparacao.Compacta_BD();

var
   Caminho, Caminho_Resultado, DT_Arquivo: String;
   Dao: OLEVariant;

Begin
     Ampulheta();

     //*** Prepara a Conexão com as Tabelas e Querys ***

     ConexaoBD.Conexao_Principal.Connected := False;
     ConexaoBD.Conexao_Principal.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\ConsulTEX\Tabelas\ConsulTEX.mdb;Mode=Read|Write;Persist Security Info=False';
     ConexaoBD.Conexao_Principal.Connected := True;

     //*** Carrega a Connexão da Estação Local ***

     conexaoBD.SQL_Conexao.Close;
     conexaoBD.SQL_Conexao.SQL.Clear;
     conexaoBD.SQL_Conexao.SQL.Add('Select * from Conexao');
     conexaoBD.SQL_Conexao.Open;

     Caminho_Resultado  := conexaoBD.SQL_Conexao.FieldValues['Conexao_caminho'];
     Caminho := Caminho_Resultado;
     Caminho := Trim(Caminho);
     Caminho := Trim(Caminho[1]);

//*** Fecha as Conexões ***
     ConexaoBD.Conexao_Principal.Connected := False;

//*** Prepara a Compactação do BD ***

     If UpperCase(Caminho) = 'C' Then
        Begin
        DT_Arquivo := Trim(DateToStr(Date()));
        DT_Arquivo := DT_Arquivo[1]+DT_Arquivo[2]+DT_Arquivo[4]+DT_Arquivo[5]+DT_Arquivo[7]+DT_Arquivo[8]+DT_Arquivo[9]+DT_Arquivo[10];
        DT_Arquivo := Trim(DT_Arquivo);

        //*** Compactação do Arquivo ***

        Dao := CreateOleObject('DAO.DBEngine.36');
        Dao.CompactDatabase('C:\ConsulTEX\Tabelas\ConsulTEX.mdb','C:\ConsulTEX\Tabelas\ConsulTEX_Compact.mdb');
        Dao:=Unassigned;

        DeleteFile('C:\ConsulTEX\Tabelas\ConsulTEX.mdb');
        CopyFile(PChar('C:\ConsulTEX\Tabelas\ConsulTEX_Compact.mdb'),PChar('C:\ConsulTEX\Backup\ConsulTEX_'+DT_Arquivo+'.mdb'),True);
        RenameFile('C:\ConsulTEX\Tabelas\ConsulTEX_Compact.mdb','C:\ConsulTEX\Tabelas\ConsulTEX.mdb')
     End;

     Seta();
end;

end.
