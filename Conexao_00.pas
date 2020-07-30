unit Conexao_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TConexao = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    conexao_caminho: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Conexao: TConexao;

implementation

uses Rotinas_Gerais, Conexao_BD;

{$R *.dfm}

procedure TConexao.Button2Click(Sender: TObject);
begin
     Conexao.Close;
end;

procedure TConexao.Button1Click(Sender: TObject);
begin
     If Trim(conexao_caminho.Text) <> '' Then
        Begin
        Fecha_Tudo();

        ConexaoBD.Conexao_Principal.Connected := False;
        ConexaoBD.Conexao_Principal.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\ConsulTEX\Tabelas\ConsulTEX.mdb;Mode=Read|Write;Persist Security Info=False';
        ConexaoBD.Conexao_Principal.Connected := True;

        conexaoBD.SQL_Conexao.Close;
        conexaoBD.SQL_Conexao.SQL.Clear;
        conexaoBD.SQL_Conexao.SQL.Add('update Conexao '+
        'Set Conexao_caminho = "'+Trim(conexao_caminho.Text)+'"');
        conexaoBD.SQL_Conexao.ExecSQL;

        Conexao.Close;
     End;
end;

end.
