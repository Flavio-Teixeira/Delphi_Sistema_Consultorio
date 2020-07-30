unit Cons_05;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Mask, DBCtrls;

type
  TIndicacao = class(TFrame)
    GroupBox1: TGroupBox;
    GRD_Indicacao: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    indicacao_numero: TEdit;
    indicacao_nome: TEdit;
    indicacao_endereco: TEdit;
    indicacao_complemento: TEdit;
    indicacao_bairro: TEdit;
    indicacao_cidade: TEdit;
    indicacao_fone: TEdit;
    indicacao_celular: TEdit;
    indicacao_fax: TEdit;
    indicacao_email: TEdit;
    indicacao_uf: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DB_indicacao_numero: TDBEdit;
    DB_indicacao_nome: TDBEdit;
    DB_indicacao_endereco: TDBEdit;
    DB_indicacao_complemento: TDBEdit;
    DB_indicacao_bairro: TDBEdit;
    DB_indicacao_cidade: TDBEdit;
    DB_indicacao_cep: TDBEdit;
    DB_indicacao_uf: TDBEdit;
    DB_indicacao_fone: TDBEdit;
    DB_indicacao_celular: TDBEdit;
    DB_indicacao_fax: TDBEdit;
    DB_indicacao_email: TDBEdit;
    indicacao_cep: TMaskEdit;
    procedure Button1Click(Sender: TObject);
    procedure GRD_IndicacaoCellClick(Column: TColumn);
    procedure indicacao_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure indicacao_enderecoKeyPress(Sender: TObject; var Key: Char);
    procedure indicacao_complementoKeyPress(Sender: TObject;
      var Key: Char);
    procedure indicacao_bairroKeyPress(Sender: TObject; var Key: Char);
    procedure indicacao_cidadeKeyPress(Sender: TObject; var Key: Char);
    procedure indicacao_cepKeyPress(Sender: TObject; var Key: Char);
    procedure indicacao_ufKeyPress(Sender: TObject; var Key: Char);
    procedure indicacao_foneKeyPress(Sender: TObject; var Key: Char);
    procedure indicacao_celularKeyPress(Sender: TObject; var Key: Char);
    procedure indicacao_faxKeyPress(Sender: TObject; var Key: Char);
    procedure indicacao_emailKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Rotinas_Gerais, Conexao_BD, Cons_02;

{$R *.dfm}

procedure TIndicacao.Button1Click(Sender: TObject);
begin
     Fecha_Indicacao();
end;

procedure TIndicacao.GRD_IndicacaoCellClick(Column: TColumn);
begin
     indicacao_numero.Text      := DB_indicacao_numero.Text;
     indicacao_nome.Text        := DB_indicacao_nome.Text;
     indicacao_endereco.Text    := DB_indicacao_endereco.Text;
     indicacao_complemento.Text := DB_indicacao_complemento.Text;
     indicacao_bairro.Text      := DB_indicacao_bairro.Text;
     indicacao_cidade.Text      := DB_indicacao_cidade.Text;
     indicacao_cep.Text         := DB_indicacao_cep.Text;

     if DB_indicacao_uf.Text = 'AC' then
        begin
        indicacao_uf.ItemIndex := 0;
        end
     else if DB_indicacao_uf.Text = 'AL' then
        begin
        indicacao_uf.ItemIndex := 1;
        end
     else if DB_indicacao_uf.Text = 'AP' then
        begin
        indicacao_uf.ItemIndex := 2;
        end
     else if DB_indicacao_uf.Text = 'AM' then
        begin
        indicacao_uf.ItemIndex := 3;
        end
     else if DB_indicacao_uf.Text = 'BA' then
        begin
        indicacao_uf.ItemIndex := 4;
        end
     else if DB_indicacao_uf.Text = 'CE' then
        begin
        indicacao_uf.ItemIndex := 5;
        end
     else if DB_indicacao_uf.Text = 'DF' then
        begin
        indicacao_uf.ItemIndex := 6;
        end
     else if DB_indicacao_uf.Text = 'ES' then
        begin
        indicacao_uf.ItemIndex := 7;
        end
     else if DB_indicacao_uf.Text = 'GO' then
        begin
        indicacao_uf.ItemIndex := 8;
        end
     else if DB_indicacao_uf.Text = 'MA' then
        begin
        indicacao_uf.ItemIndex := 9;
        end
     else if DB_indicacao_uf.Text = 'MT' then
        begin
        indicacao_uf.ItemIndex := 10;
        end
     else if DB_indicacao_uf.Text = 'MS' then
        begin
        indicacao_uf.ItemIndex := 11;
        end
     else if DB_indicacao_uf.Text = 'MG' then
        begin
        indicacao_uf.ItemIndex := 12;
        end
     else if DB_indicacao_uf.Text = 'PA' then
        begin
        indicacao_uf.ItemIndex := 13;
        end
     else if DB_indicacao_uf.Text = 'PB' then
        begin
        indicacao_uf.ItemIndex := 14;
        end
     else if DB_indicacao_uf.Text = 'PR' then
        begin
        indicacao_uf.ItemIndex := 15;
        end
     else if DB_indicacao_uf.Text = 'PE' then
        begin
        indicacao_uf.ItemIndex := 16;
        end
     else if DB_indicacao_uf.Text = 'PI' then
        begin
        indicacao_uf.ItemIndex := 17;
        end
     else if DB_indicacao_uf.Text = 'RN' then
        begin
        indicacao_uf.ItemIndex := 18;
        end
     else if DB_indicacao_uf.Text = 'RS' then
        begin
        indicacao_uf.ItemIndex := 19;
        end
     else if DB_indicacao_uf.Text = 'RJ' then
        begin
        indicacao_uf.ItemIndex := 20;
        end
     else if DB_indicacao_uf.Text = 'RO' then
        begin
        indicacao_uf.ItemIndex := 21;
        end
     else if DB_indicacao_uf.Text = 'RR' then
        begin
        indicacao_uf.ItemIndex := 22;
        end
     else if DB_indicacao_uf.Text = 'SC' then
        begin
        indicacao_uf.ItemIndex := 23;
        end
     else if DB_indicacao_uf.Text = 'SP' then
        begin
        indicacao_uf.ItemIndex := 24;
        end
     else if DB_indicacao_uf.Text = 'SE' then
        begin
        indicacao_uf.ItemIndex := 25;
        end
     else if DB_indicacao_uf.Text = 'TO' then
        begin
        indicacao_uf.ItemIndex := 26;
     end;

     indicacao_fone.Text        := DB_indicacao_fone.Text;
     indicacao_celular.Text     := DB_indicacao_celular.Text;
     indicacao_fax.Text         := DB_indicacao_fax.Text;
     indicacao_email.Text       := DB_indicacao_email.Text;

     indicacao_nome.SetFocus;
end;

procedure TIndicacao.indicacao_nomeKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   indicacao_endereco.SetFocus;
end;

end;

procedure TIndicacao.indicacao_enderecoKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   indicacao_complemento.SetFocus;
end;

end;

procedure TIndicacao.indicacao_complementoKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   indicacao_bairro.SetFocus;
end;

end;

procedure TIndicacao.indicacao_bairroKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   indicacao_cidade.SetFocus;
end;

end;

procedure TIndicacao.indicacao_cidadeKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   indicacao_cep.SetFocus;
end;

end;

procedure TIndicacao.indicacao_cepKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   indicacao_uf.SetFocus;
end;

end;

procedure TIndicacao.indicacao_ufKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   indicacao_fone.SetFocus;
end;

end;

procedure TIndicacao.indicacao_foneKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   indicacao_celular.SetFocus;
end;

end;

procedure TIndicacao.indicacao_celularKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   indicacao_fax.SetFocus;
end;

end;

procedure TIndicacao.indicacao_faxKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   indicacao_email.SetFocus;
end;

end;

procedure TIndicacao.indicacao_emailKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   Cons02.Bt_Gravar.SetFocus;
end;

end;

end.
