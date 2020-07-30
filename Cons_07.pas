unit Cons_07;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Grids, DBGrids, DBCtrls;

type
  TMedico = class(TFrame)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Panel1: TPanel;
    medico_nome: TEdit;
    medico_complemento: TEdit;
    medico_cidade: TEdit;
    medico_fone_consultorio: TEdit;
    medico_fone_residencia: TEdit;
    medico_email: TEdit;
    medico_fone_fax: TEdit;
    medico_rg: TEdit;
    medico_crm: TEdit;
    medico_especialidade: TEdit;
    medico_endereco: TEdit;
    medico_bairro: TEdit;
    medico_fone_celular: TEdit;
    medico_uf: TComboBox;
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
    Label16: TLabel;
    medico_cpf: TMaskEdit;
    medico_cep: TMaskEdit;
    GRD_Medico: TDBGrid;
    DB_Medico_CRM: TDBEdit;
    DB_Medico_Nome: TDBEdit;
    DB_Medico_RG: TDBEdit;
    DB_Medico_CPF: TDBEdit;
    DB_Medico_Especialidade: TDBEdit;
    DB_Medico_Endereco: TDBEdit;
    DB_Medico_Complemento: TDBEdit;
    DB_Medico_Cidade: TDBEdit;
    DB_Medico_Bairro: TDBEdit;
    DB_Medico_Cep: TDBEdit;
    DB_Medico_Fone_Consultorio: TDBEdit;
    DB_Medico_Fone_Residencia: TDBEdit;
    DB_Medico_Fone_Celular: TDBEdit;
    DB_Medico_Fone_Fax: TDBEdit;
    DB_Medico_Email: TDBEdit;
    DB_Medico_Uf: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure medico_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure medico_especialidadeKeyPress(Sender: TObject; var Key: Char);
    procedure medico_crmKeyPress(Sender: TObject; var Key: Char);
    procedure medico_rgKeyPress(Sender: TObject; var Key: Char);
    procedure medico_cpfKeyPress(Sender: TObject; var Key: Char);
    procedure medico_enderecoKeyPress(Sender: TObject; var Key: Char);
    procedure medico_complementoKeyPress(Sender: TObject; var Key: Char);
    procedure medico_ufKeyPress(Sender: TObject; var Key: Char);
    procedure medico_cidadeKeyPress(Sender: TObject; var Key: Char);
    procedure medico_bairroKeyPress(Sender: TObject; var Key: Char);
    procedure medico_cepKeyPress(Sender: TObject; var Key: Char);
    procedure medico_fone_consultorioKeyPress(Sender: TObject;
      var Key: Char);
    procedure medico_fone_residenciaKeyPress(Sender: TObject;
      var Key: Char);
    procedure medico_fone_celularKeyPress(Sender: TObject; var Key: Char);
    procedure medico_fone_faxKeyPress(Sender: TObject; var Key: Char);
    procedure medico_emailKeyPress(Sender: TObject; var Key: Char);
    procedure GRD_MedicoCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Rotinas_Gerais, Conexao_BD, Cons_02;

{$R *.dfm}

procedure TMedico.Button1Click(Sender: TObject);
begin
     Fecha_Medico();
end;

procedure TMedico.medico_nomeKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   medico_especialidade.SetFocus;
end;

end;

procedure TMedico.medico_especialidadeKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   medico_crm.SetFocus;
end;

end;

procedure TMedico.medico_crmKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   medico_rg.SetFocus;
end;

end;

procedure TMedico.medico_rgKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   medico_cpf.SetFocus;
end;

end;

procedure TMedico.medico_cpfKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   medico_endereco.SetFocus;
end;

end;

procedure TMedico.medico_enderecoKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   medico_complemento.SetFocus;
end;

end;

procedure TMedico.medico_complementoKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   medico_uf.SetFocus;
end;

end;

procedure TMedico.medico_ufKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   medico_cidade.SetFocus;
end;

end;

procedure TMedico.medico_cidadeKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   medico_bairro.SetFocus;
end;

end;

procedure TMedico.medico_bairroKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   medico_cep.SetFocus;
end;

end;

procedure TMedico.medico_cepKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   medico_fone_consultorio.SetFocus;
end;

end;

procedure TMedico.medico_fone_consultorioKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   medico_fone_residencia.SetFocus;
end;

end;

procedure TMedico.medico_fone_residenciaKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   medico_fone_celular.SetFocus;
end;

end;

procedure TMedico.medico_fone_celularKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   medico_fone_fax.SetFocus;
end;

end;

procedure TMedico.medico_fone_faxKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   medico_email.SetFocus;
end;

end;

procedure TMedico.medico_emailKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   Cons02.Bt_Gravar.SetFocus;
end;

end;

procedure TMedico.GRD_MedicoCellClick(Column: TColumn);
begin
     medico_crm.Text              := DB_Medico_Crm.Text;
     medico_nome.Text             := DB_Medico_Nome.Text;
     medico_rg.Text               := DB_Medico_Rg.Text;
     medico_cpf.Text              := DB_Medico_Cpf.Text;
     medico_especialidade.Text    := DB_Medico_Especialidade.Text;
     medico_endereco.Text         := DB_Medico_Endereco.Text;
     medico_cidade.Text           := DB_Medico_Cidade.Text;
     medico_bairro.Text           := DB_Medico_Bairro.Text;
     medico_complemento.Text      := DB_Medico_Complemento.Text;
     medico_cep.Text              := DB_Medico_Cep.Text;
     medico_fone_consultorio.Text := DB_Medico_Fone_Consultorio.Text;
     medico_fone_residencia.Text  := DB_Medico_Fone_Residencia.Text;
     medico_fone_celular.Text     := DB_Medico_Fone_Celular.Text;
     medico_fone_fax.Text         := DB_Medico_Fone_Fax.Text;
     medico_email.Text            := DB_Medico_Email.Text;

     if DB_Medico_Uf.Text = 'AC' then
        begin
        medico_uf.ItemIndex := 0;
        end
     else if DB_Medico_Uf.Text = 'AL' then
        begin
        medico_uf.ItemIndex := 1;
        end
     else if DB_Medico_Uf.Text = 'AP' then
        begin
        medico_uf.ItemIndex := 2;
        end
     else if DB_Medico_Uf.Text = 'AM' then
        begin
        medico_uf.ItemIndex := 3;
        end
     else if DB_Medico_Uf.Text = 'BA' then
        begin
        medico_uf.ItemIndex := 4;
        end
     else if DB_Medico_Uf.Text = 'CE' then
        begin
        medico_uf.ItemIndex := 5;
        end
     else if DB_Medico_Uf.Text = 'DF' then
        begin
        medico_uf.ItemIndex := 6;
        end
     else if DB_Medico_Uf.Text = 'ES' then
        begin
        medico_uf.ItemIndex := 7;
        end
     else if DB_Medico_Uf.Text = 'GO' then
        begin
        medico_uf.ItemIndex := 8;
        end
     else if DB_Medico_Uf.Text = 'MA' then
        begin
        medico_uf.ItemIndex := 9;
        end
     else if DB_Medico_Uf.Text = 'MT' then
        begin
        medico_uf.ItemIndex := 10;
        end
     else if DB_Medico_Uf.Text = 'MS' then
        begin
        medico_uf.ItemIndex := 11;
        end
     else if DB_Medico_Uf.Text = 'MG' then
        begin
        medico_uf.ItemIndex := 12;
        end
     else if DB_Medico_Uf.Text = 'PA' then
        begin
        medico_uf.ItemIndex := 13;
        end
     else if DB_Medico_Uf.Text = 'PB' then
        begin
        medico_uf.ItemIndex := 14;
        end
     else if DB_Medico_Uf.Text = 'PR' then
        begin
        medico_uf.ItemIndex := 15;
        end
     else if DB_Medico_Uf.Text = 'PE' then
        begin
        medico_uf.ItemIndex := 16;
        end
     else if DB_Medico_Uf.Text = 'PI' then
        begin
        medico_uf.ItemIndex := 17;
        end
     else if DB_Medico_Uf.Text = 'RN' then
        begin
        medico_uf.ItemIndex := 18;
        end
     else if DB_Medico_Uf.Text = 'RS' then
        begin
        medico_uf.ItemIndex := 19;
        end
     else if DB_Medico_Uf.Text = 'RJ' then
        begin
        medico_uf.ItemIndex := 20;
        end
     else if DB_Medico_Uf.Text = 'RO' then
        begin
        medico_uf.ItemIndex := 21;
        end
     else if DB_Medico_Uf.Text = 'RR' then
        begin
        medico_uf.ItemIndex := 22;
        end
     else if DB_Medico_Uf.Text = 'SC' then
        begin
        medico_uf.ItemIndex := 23;
        end
     else if DB_Medico_Uf.Text = 'SP' then
        begin
        medico_uf.ItemIndex := 24;
        end
     else if DB_Medico_Uf.Text = 'SE' then
        begin
        medico_uf.ItemIndex := 25;
        end
     else if DB_Medico_Uf.Text = 'TO' then
        begin
        medico_uf.ItemIndex := 26;
     end;

     Medico_Crm.SetFocus;
end;

end.
