unit Cons_04;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  TConvenio = class(TFrame)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Panel1: TPanel;
    GRD_Convenios: TDBGrid;
    DB_convenio_numero: TDBEdit;
    DB_convenio_razao_social: TDBEdit;
    DB_convenio_nome_fantasia: TDBEdit;
    DB_convenio_apelido: TDBEdit;
    DB_convenio_endereco: TDBEdit;
    DB_convenio_complemento: TDBEdit;
    DB_convenio_bairro: TDBEdit;
    DB_convenio_cidade: TDBEdit;
    DB_convenio_cep: TDBEdit;
    DB_convenio_uf: TDBEdit;
    DB_convenio_fone_1: TDBEdit;
    DB_convenio_fone_2: TDBEdit;
    DB_convenio_fax: TDBEdit;
    DB_convenio_setor_resp: TDBEdit;
    DB_convenio_qtde_ch: TDBEdit;
    DB_convenio_valor_ch: TDBEdit;
    convenio_uf: TComboBox;
    convenio_razao_social: TEdit;
    convenio_nome_fantasia: TEdit;
    convenio_apelido: TEdit;
    convenio_endereco: TEdit;
    convenio_complemento: TEdit;
    convenio_bairro: TEdit;
    convenio_cidade: TEdit;
    convenio_fone_1: TEdit;
    convenio_fone_2: TEdit;
    convenio_fax: TEdit;
    convenio_setor_resp: TEdit;
    convenio_qtde_ch: TEdit;
    convenio_valor_ch: TEdit;
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
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    convenio_numero: TEdit;
    convenio_cep: TMaskEdit;
    convenio_valor_consulta: TEdit;
    Label16: TLabel;
    DB_convenio_valor_consulta: TDBEdit;
    Label17: TLabel;
    convenio_valor_cirurgia: TEdit;
    DB_convenio_valor_cirurgia: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure GRD_ConveniosCellClick(Column: TColumn);
    procedure convenio_qtde_chKeyPress(Sender: TObject; var Key: Char);
    procedure convenio_valor_chKeyPress(Sender: TObject; var Key: Char);
    procedure convenio_valor_consultaKeyPress(Sender: TObject;
      var Key: Char);
    procedure convenio_nome_fantasiaKeyPress(Sender: TObject;
      var Key: Char);
    procedure convenio_apelidoKeyPress(Sender: TObject; var Key: Char);
    procedure convenio_enderecoKeyPress(Sender: TObject; var Key: Char);
    procedure convenio_complementoKeyPress(Sender: TObject; var Key: Char);
    procedure convenio_bairroKeyPress(Sender: TObject; var Key: Char);
    procedure convenio_cidadeKeyPress(Sender: TObject; var Key: Char);
    procedure convenio_ufKeyPress(Sender: TObject; var Key: Char);
    procedure convenio_cepKeyPress(Sender: TObject; var Key: Char);
    procedure convenio_setor_respKeyPress(Sender: TObject; var Key: Char);
    procedure convenio_fone_1KeyPress(Sender: TObject; var Key: Char);
    procedure convenio_fone_2KeyPress(Sender: TObject; var Key: Char);
    procedure convenio_faxKeyPress(Sender: TObject; var Key: Char);
    procedure convenio_razao_socialKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Rotinas_Gerais, Conexao_BD, Cons_02;

{$R *.dfm}

procedure TConvenio.Button1Click(Sender: TObject);
begin
     Fecha_Convenio();
end;

procedure TConvenio.GRD_ConveniosCellClick(Column: TColumn);
begin
     convenio_numero.Text        := DB_convenio_numero.Text;
     convenio_razao_social.Text  := DB_convenio_razao_social.Text;
     convenio_nome_fantasia.Text := DB_convenio_nome_fantasia.Text;
     convenio_apelido.Text       := DB_convenio_apelido.Text;
     convenio_endereco.Text      := DB_convenio_endereco.Text;
     convenio_complemento.Text   := DB_convenio_complemento.Text;
     convenio_bairro.Text        := DB_convenio_bairro.Text;
     convenio_cidade.Text        := DB_convenio_cidade.Text;
     convenio_cep.Text           := DB_convenio_cep.Text;

     if DB_convenio_uf.Text = 'AC' then
        begin
        convenio_uf.ItemIndex := 0;
        end
     else if DB_convenio_uf.Text = 'AL' then
        begin
        convenio_uf.ItemIndex := 1;
        end
     else if DB_convenio_uf.Text = 'AP' then
        begin
        convenio_uf.ItemIndex := 2;
        end
     else if DB_convenio_uf.Text = 'AM' then
        begin
        convenio_uf.ItemIndex := 3;
        end
     else if DB_convenio_uf.Text = 'BA' then
        begin
        convenio_uf.ItemIndex := 4;
        end
     else if DB_convenio_uf.Text = 'CE' then
        begin
        convenio_uf.ItemIndex := 5;
        end
     else if DB_convenio_uf.Text = 'DF' then
        begin
        convenio_uf.ItemIndex := 6;
        end
     else if DB_convenio_uf.Text = 'ES' then
        begin
        convenio_uf.ItemIndex := 7;
        end
     else if DB_convenio_uf.Text = 'GO' then
        begin
        convenio_uf.ItemIndex := 8;
        end
     else if DB_convenio_uf.Text = 'MA' then
        begin
        convenio_uf.ItemIndex := 9;
        end
     else if DB_convenio_uf.Text = 'MT' then
        begin
        convenio_uf.ItemIndex := 10;
        end
     else if DB_convenio_uf.Text = 'MS' then
        begin
        convenio_uf.ItemIndex := 11;
        end
     else if DB_convenio_uf.Text = 'MG' then
        begin
        convenio_uf.ItemIndex := 12;
        end
     else if DB_convenio_uf.Text = 'PA' then
        begin
        convenio_uf.ItemIndex := 13;
        end
     else if DB_convenio_uf.Text = 'PB' then
        begin
        convenio_uf.ItemIndex := 14;
        end
     else if DB_convenio_uf.Text = 'PR' then
        begin
        convenio_uf.ItemIndex := 15;
        end
     else if DB_convenio_uf.Text = 'PE' then
        begin
        convenio_uf.ItemIndex := 16;
        end
     else if DB_convenio_uf.Text = 'PI' then
        begin
        convenio_uf.ItemIndex := 17;
        end
     else if DB_convenio_uf.Text = 'RN' then
        begin
        convenio_uf.ItemIndex := 18;
        end
     else if DB_convenio_uf.Text = 'RS' then
        begin
        convenio_uf.ItemIndex := 19;
        end
     else if DB_convenio_uf.Text = 'RJ' then
        begin
        convenio_uf.ItemIndex := 20;
        end
     else if DB_convenio_uf.Text = 'RO' then
        begin
        convenio_uf.ItemIndex := 21;
        end
     else if DB_convenio_uf.Text = 'RR' then
        begin
        convenio_uf.ItemIndex := 22;
        end
     else if DB_convenio_uf.Text = 'SC' then
        begin
        convenio_uf.ItemIndex := 23;
        end
     else if DB_convenio_uf.Text = 'SP' then
        begin
        convenio_uf.ItemIndex := 24;
        end
     else if DB_convenio_uf.Text = 'SE' then
        begin
        convenio_uf.ItemIndex := 25;
        end
     else if DB_convenio_uf.Text = 'TO' then
        begin
        convenio_uf.ItemIndex := 26;
     end;

     convenio_fone_1.Text         := DB_convenio_fone_1.Text;
     convenio_fone_2.Text         := DB_convenio_fone_2.Text;
     convenio_fax.Text            := DB_convenio_fax.Text;
     convenio_setor_resp.Text     := DB_convenio_setor_resp.Text;
     convenio_qtde_ch.Text        := Ponto_Virgula(DB_convenio_qtde_ch.Text);
     convenio_valor_ch.Text       := Ponto_Virgula(DB_convenio_valor_ch.Text);
     convenio_valor_consulta.Text := Ponto_Virgula(DB_convenio_valor_consulta.Text);
     convenio_valor_cirurgia.Text := Ponto_Virgula(DB_convenio_valor_cirurgia.Text);

     convenio_razao_social.SetFocus;
end;

procedure TConvenio.convenio_qtde_chKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
        begin
        convenio_valor_ch.SetFocus;
     end;

     if not(key in ['0'..'9','.',',',#8,#13]) then
        key := #0;
     if key in [',','.'] then
        key := DecimalSeparator;
     if key = DecimalSeparator then
        if pos(key,TEdit(Sender).Text) <> 0 then
           key := #0;
end;

procedure TConvenio.convenio_valor_chKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
        begin
        convenio_valor_consulta.SetFocus;
     end;

     if not(key in ['0'..'9','.',',',#8,#13]) then
        key := #0;
     if key in [',','.'] then
        key := DecimalSeparator;
     if key = DecimalSeparator then
        if pos(key,TEdit(Sender).Text) <> 0 then
           key := #0;
end;

procedure TConvenio.convenio_valor_consultaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
        begin
        Cons02.Bt_Gravar.SetFocus;
     end;

     if not(key in ['0'..'9','.',',',#8,#13]) then
        key := #0;
     if key in [',','.'] then
        key := DecimalSeparator;
     if key = DecimalSeparator then
        if pos(key,TEdit(Sender).Text) <> 0 then
           key := #0;
end;

procedure TConvenio.convenio_nome_fantasiaKeyPress(Sender: TObject;
  var Key: Char);
begin

if Key = #13 then
   begin
   convenio_apelido.SetFocus;
end;

end;

procedure TConvenio.convenio_apelidoKeyPress(Sender: TObject;
  var Key: Char);
begin

if Key = #13 then
   begin
   convenio_endereco.SetFocus;
end;

end;

procedure TConvenio.convenio_enderecoKeyPress(Sender: TObject;
  var Key: Char);
begin

if Key = #13 then
   begin
   convenio_complemento.SetFocus;
end;

end;

procedure TConvenio.convenio_complementoKeyPress(Sender: TObject;
  var Key: Char);
begin

if Key = #13 then
   begin
   convenio_bairro.SetFocus;
end;

end;

procedure TConvenio.convenio_bairroKeyPress(Sender: TObject;
  var Key: Char);
begin

if Key = #13 then
   begin
   convenio_cidade.SetFocus;
end;

end;

procedure TConvenio.convenio_cidadeKeyPress(Sender: TObject;
  var Key: Char);
begin

if Key = #13 then
   begin
   convenio_uf.SetFocus;
end;

end;

procedure TConvenio.convenio_ufKeyPress(Sender: TObject; var Key: Char);
begin

if Key = #13 then
   begin
   convenio_cep.SetFocus;
end;

end;

procedure TConvenio.convenio_cepKeyPress(Sender: TObject; var Key: Char);
begin

if Key = #13 then
   begin
   convenio_setor_resp.SetFocus;
end;

end;

procedure TConvenio.convenio_setor_respKeyPress(Sender: TObject;
  var Key: Char);
begin

if Key = #13 then
   begin
   convenio_fone_1.SetFocus;
end;

end;

procedure TConvenio.convenio_fone_1KeyPress(Sender: TObject;
  var Key: Char);
begin

if Key = #13 then
   begin
   convenio_fone_2.SetFocus;
end;

end;

procedure TConvenio.convenio_fone_2KeyPress(Sender: TObject;
  var Key: Char);
begin

if Key = #13 then
   begin
   convenio_fax.SetFocus;
end;

end;

procedure TConvenio.convenio_faxKeyPress(Sender: TObject; var Key: Char);
begin

if Key = #13 then
   begin
   convenio_qtde_ch.SetFocus;
end;

end;

procedure TConvenio.convenio_razao_socialKeyPress(Sender: TObject;
  var Key: Char);
begin

if Key = #13 then
   begin
   convenio_nome_fantasia.SetFocus;
end;

end;

end.
