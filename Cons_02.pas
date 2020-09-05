unit Cons_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, ComCtrls, TabNotBk, DB, DBTables,
  DBCtrls, Cons_00, Cons_10, Agen_00, Cons_04, Grids, DBGrids, Mask,
  Cons_05, Rel_01, Rel_02, Cons_06, Rel_03, Rel_04, Cons_07, jpeg, ShellApi,
  Buttons, Cons_08, Cons_09;

type
  TCons02 = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Convnio1: TMenuItem;
    CID1: TMenuItem;
    Relatrio1: TMenuItem;
    Faturamento1: TMenuItem;
    ControledeRecibos1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Preferncias1: TMenuItem;
    CadastrodoMdico1: TMenuItem;
    Label31: TLabel;
    localizar_por: TComboBox;
    localiza_paciente: TEdit;
    Label32: TLabel;
    PrefernciasdoUsuario1: TMenuItem;
    Panel4: TPanel;
    Label14: TLabel;
    Button2: TButton;
    Button3: TButton;
    Panel10: TPanel;
    Label43: TLabel;
    tela_01: TLabel;
    tela_02: TLabel;
    tela_03: TLabel;
    tela_04: TLabel;
    tela_05: TLabel;
    tela_06: TLabel;
    tela_07: TLabel;
    tela_08: TLabel;
    tela_09: TLabel;
    tela_10: TLabel;
    Paciente1: TPaciente;
    Preferencia1: TPreferencia;
    convenio1: Tconvenio;
    BT_Procura: TButton;
    Indicao1: TMenuItem;
    Indicacao1: TIndicacao;
    Agenda2: TMenuItem;
    EnvelopedoPaciente1: TMenuItem;
    FichadoPaciente1: TMenuItem;
    Separador: TMenuItem;
    Cid2: TCid;
    Recibo1: TRecibo;
    Faturamento2: TFaturamento;
    Medico1: TMedico;
    paciente_lista: TDBGrid;
    ConsulTEX_Medico: TEdit;
    ConsulTEX_Acesso_Agenda: TEdit;
    ConsulTEX_Acesso_Paciente: TEdit;
    ConsulTEX_Acesso_Convenio: TEdit;
    ConsulTEX_Acesso_Indicacao: TEdit;
    ConsulTEX_Acesso_Cid: TEdit;
    ConsulTEX_Acesso_Imp_Env: TEdit;
    ConsulTEX_Acesso_Imp_Ficha: TEdit;
    ConsulTEX_Acesso_Imp_Fat: TEdit;
    ConsulTEX_Acesso_Imp_Rec: TEdit;
    ConsulTEX_Acesso_Usuario: TEdit;
    ConsulTEX_Acesso_Medico: TEdit;
    Bt_Novo: TBitBtn;
    Bt_Gravar: TBitBtn;
    Bt_Apagar: TBitBtn;
    Bt_Imprimir: TBitBtn;
    ConsulTEX_Acesso_Prontuario: TEdit;
    ConsulTEX_Acesso_Observacoes: TEdit;
    Cirurgia2: TCirurgia;
    tela_11: TLabel;
    tela_12: TLabel;
    ConsulTEX_Acesso_Cirurgia: TEdit;
    Cirurgia1: TMenuItem;
    Adicionais1: TMenuItem;
    Adicionais2: TAdicionais;
    ConsulTEX_Acesso_Adicionais: TEdit;
    ConsulTEX_Medico_Crm: TEdit;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    Como1: TMenuItem;
    Trocar1: TMenuItem;
    BackupReparao1: TMenuItem;
    ControledePagamentos1: TMenuItem;
    Etiquetas1: TMenuItem;
    ListaGeraldosPacientes1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PrefernciasdoUsuario1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Bt_GravarClick(Sender: TObject);
    procedure Convnio1Click(Sender: TObject);
    procedure BT_ProcuraClick(Sender: TObject);
    procedure Bt_NovoClick(Sender: TObject);
    procedure Bt_ApagarClick(Sender: TObject);
    procedure Indicao1Click(Sender: TObject);
    procedure paciente_listaCellClick(Column: TColumn);
    procedure Agenda2Click(Sender: TObject);
    procedure Bt_ImprimirClick(Sender: TObject);
    procedure FichadoPaciente1Click(Sender: TObject);
    procedure EnvelopedoPaciente1Click(Sender: TObject);
    procedure CID1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ControledeRecibos1Click(Sender: TObject);
    procedure Faturamento1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure localiza_pacienteKeyPress(Sender: TObject; var Key: Char);
    procedure CadastrodoMdico1Click(Sender: TObject);
    procedure Cirurgia1Click(Sender: TObject);
    procedure Adicionais1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Trocar1Click(Sender: TObject);
    procedure BackupReparao1Click(Sender: TObject);
    procedure Como1Click(Sender: TObject);
    procedure ControledePagamentos1Click(Sender: TObject);
    procedure Etiquetas1Click(Sender: TObject);
    procedure ListaGeraldosPacientes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cons02: TCons02;
  Sequencia_Tela, Descricao_Tela, Org_Sequencia_Tela, Org_Descricao_Tela: Array[1..12] of String;
  Tela_Ativa, Qtde_Tela_Ativa: Integer;
  Paciente_OK, Preferencia_OK, Convenio_OK, Indicacao_OK, Cid_OK, Recibo_OK, Faturamento_OK, Medico_OK, Cirurgia_OK, Adicionais_OK: Boolean;
  Carregado_OK: Boolean;

  {*** Variáveis do Paciente ***}

  P_Indicacao_Numero: String;
  P_Sexo: String;
  P_Situacao: String;
  P_Convenio: String;
  P_dt_ult_consulta: String;
  P_Endereco: String;
  P_Instrucao: String;
  P_Estado_Civil: String;
  P_Nro_Ficha: String;

  {*** Variáveis do Usuário ***}

  U_acesso_agenda: String;
  U_acesso_paciente: String;
  U_acesso_prontuario: String;
  U_acesso_observacoes: String;
  U_acesso_convenio: String;
  U_acesso_indicacao: String;
  U_acesso_cid: String;
  U_acesso_imp_env: String;
  U_acesso_imp_ficha: String;
  U_acesso_imp_fat: String;
  U_acesso_imp_rec: String;
  U_acesso_usuario: String;
  U_acesso_medico: String;
  U_acesso_cirurgia: String;
  U_acesso_adicionais: String;

  {*** Variaveis do Recibo ***}

  R_Data_Emissao: String;

  {*** Campos Alterados ***}

  Paciente_Ficha_Alterado: String;
  Paciente_Nome_Alterado: String;
  Paciente_sobrenome_Alterado: String;
  Paciente_rg_Alterado: String;
  Paciente_cpf_Alterado: String;
  Paciente_dt_cadastro_Alterado: String;
  Paciente_dt_nascimento_Alterado: String;
  Paciente_indicacao_Alterado: String;
  Paciente_sexo_Alterado: String;
  Paciente_situacao_Alterado: String;
  Paciente_convenio_Alterado: String;
  Paciente_matricula_Alterado: String;
  Paciente_titular_Alterado: String;
  Paciente_dt_ult_consulta_Alterado: String;
  Paciente_endereco_Alterado: String;
  Paciente_logradouro_Alterado: String;
  Paciente_complemento_Alterado: String;
  Paciente_bairro_Alterado: String;
  Paciente_cidade_Alterado: String;
  Paciente_cep_Alterado: String;
  Paciente_uf_Alterado: String;
  Paciente_instrucao_Alterado: String;
  Paciente_estado_civil_Alterado: String;
  Paciente_naturalidade_Alterado: String;
  Paciente_profissao_Alterado: String;
  Paciente_email_Alterado: String;
  Paciente_fone_residencial_Alterado: String;
  Paciente_fone_comercial_Alterado: String;
  Paciente_fone_fax_Alterado: String;
  Paciente_fone_celular_Alterado: String;
  Paciente_nome_sobrenome_Alterado: String;
  Paciente_observacao_Alterado: String;
  Paciente_prontuario_Alterado: String;

implementation

uses Rotinas_Gerais, Conexao_BD, GifUnit, Sobre_00, Ativo_00, Backup_Reparacao, Ajuda_00,
  Controle_Pagamento_00, Rel_Etiquetas_00, Etiquetas_00,
  ListaGeralPacientes_00;

{$R *.dfm}

{***********************************************************}
{********************* Corpo Principal *********************}
{***********************************************************}

procedure TCons02.Sair1Click(Sender: TObject);
begin
{*** Encerrar o ConsulTEX ***}

     Cons02.Close;
end;

procedure TCons02.FormShow(Sender: TObject);
begin
     Cursor_Ampulheta();

     // Ajusta as Margens e Altura do Formulário

     with Cons02 do begin
         Top  := ((Screen.Height Div 2) - 285) - 12;
         Left := ((Screen.Width Div 2) - 397)
     end;

{*** Ativação de Telas ***}

     Carregado_OK := False;
     Inicializa_Tela();
     Carregado_OK := True;

{*** Carrega as Listas de Convenio e Indicacao ***}

     Carrega_Lista_Convenio();
     Carrega_Lista_Indicacao();

{*** Ativa as Permissões de Acesso ***}

     if Cons02.ConsulTEX_Acesso_Agenda.Text = 'S' then
        begin
        Cons02.Agenda2.Enabled := False;
     end;

     if Cons02.ConsulTEX_Acesso_Paciente.Text = 'S' then
        begin
        Cons02.Panel3.Enabled    := False;
        Cons02.Paciente1.Enabled := False;
     end;

     if Cons02.ConsulTEX_Acesso_Convenio.Text = 'S' then
        begin
        Cons02.Convnio1.Enabled := False;
     end;

     if Cons02.ConsulTEX_Acesso_Indicacao.Text = 'S' then
        begin
        Cons02.Indicao1.Enabled := False;
     end;

     if Cons02.ConsulTEX_Acesso_Cid.Text = 'S' then
        begin
        Cons02.CID1.Enabled := False;
     end;

     if Cons02.ConsulTEX_Acesso_Imp_Env.Text = 'S' then
        begin
        Cons02.EnvelopedoPaciente1.Enabled := False;
     end;

     if Cons02.ConsulTEX_Acesso_Imp_Ficha.Text = 'S' then
        begin
        Cons02.FichadoPaciente1.Enabled := False;
     end;

     if Cons02.ConsulTEX_Acesso_Imp_Fat.Text = 'S' then
        begin
        Cons02.Faturamento1.Enabled := False;
     end;

     if Cons02.ConsulTEX_Acesso_Imp_Rec.Text = 'S' then
        begin
        Cons02.ControledeRecibos1.Enabled := False;
     end;

     if Cons02.ConsulTEX_Acesso_Usuario.Text = 'S' then
        begin
        Cons02.PrefernciasdoUsuario1.Enabled := False;
     end;

     if Cons02.ConsulTEX_Acesso_Medico.Text = 'S' then
        begin
        Cons02.CadastrodoMdico1.Enabled := False;
     end;

     if Cons02.ConsulTEX_Acesso_Cirurgia.Text = 'S' then
        begin
        Cons02.Cirurgia1.Enabled := False;
     end;

     if Cons02.ConsulTEX_Acesso_Adicionais.Text = 'S' then
        begin
        Cons02.Adicionais1.Enabled := False;
     end;

     Cursor_Normal();
end;

procedure TCons02.PrefernciasdoUsuario1Click(Sender: TObject);
begin
     Cursor_Ampulheta();

{*** Preferências do Usuário ***}
{*** Prepara a Tela para a Abertura ***}

     Tela_Ativa                 := Qtde_Tela_Ativa + 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa + 1;
     Sequencia_Tela[Tela_Ativa] := 'preferencia';
     Descricao_Tela[Tela_Ativa] := 'Preferências do Usuário';

     Paciente_OK    := False;
     Preferencia_OK := True;
     Convenio_OK    := False;
     Indicacao_OK   := False;
     Cid_OK         := False;
     Recibo_OK      := False;
     Faturamento_OK := False;
     Medico_OK      := False;
     Cirurgia_OK    := False;
     Adicionais_OK  := False;

     Exibe_Tela();

     Cons02.PrefernciasdoUsuario1.Enabled := False;

{*** Carrega os Dados ***}
{*** Abre o Query de Convênios ***}

     conexaoBD.SQL_Usuario.Close;
     conexaoBD.SQL_Usuario.SQL.Clear;
     conexaoBD.SQL_Usuario.SQL.Add('select * from Usuario');
     conexaoBD.SQL_Usuario.Open;

     Cons02.Preferencia1.DBGrid1.Refresh;

     Limpa_Preferencia();

     Cursor_Normal();
end;

procedure TCons02.Button3Click(Sender: TObject);
begin
     Avanca_Tela();
end;

procedure TCons02.Button2Click(Sender: TObject);
begin
     Retorna_Tela();
end;

procedure TCons02.Bt_GravarClick(Sender: TObject);
begin
     Registro_Gravar();
end;

procedure TCons02.Convnio1Click(Sender: TObject);
begin
     Cursor_Ampulheta();

{*** Convênios ***}
{*** Prepara a Tela para a Abertura ***}

     Tela_Ativa                 := Qtde_Tela_Ativa + 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa + 1;
     Sequencia_Tela[Tela_Ativa] := 'convenio';
     Descricao_Tela[Tela_Ativa] := 'Cadastro de Convênios';

     Paciente_OK    := False;
     Preferencia_OK := False;
     Indicacao_OK   := False;
     Convenio_OK    := True;
     Cid_OK         := False;
     Recibo_OK      := False;
     Faturamento_OK := False;
     Medico_OK      := False;
     Cirurgia_OK    := False;
     Adicionais_OK  := False;

     Exibe_Tela();

     Cons02.Convnio1.Enabled := False;

{*** Carrega os Dados ***}

     conexaoBD.SQL_Convenio.Close;
     conexaoBD.SQL_Convenio.SQL.Clear;
     conexaoBD.SQL_Convenio.SQL.Add('select * from Convenio');
     conexaoBD.SQL_Convenio.Open;

     Cons02.convenio1.GRD_Convenios.Refresh;
     Limpa_Convenio();

     Cursor_Normal();
end;

procedure TCons02.BT_ProcuraClick(Sender: TObject);
begin
     Carrega_Lista_Pacientes();
end;

procedure TCons02.Bt_NovoClick(Sender: TObject);
begin
     Registro_Novo();
end;

procedure TCons02.Bt_ApagarClick(Sender: TObject);
begin
     Registro_Apagar(Sender);
end;

procedure TCons02.Indicao1Click(Sender: TObject);
begin
     Cursor_Ampulheta();

{*** Indicação ***}
{*** Prepara a Tela para a Abertura ***}

     Tela_Ativa                 := Qtde_Tela_Ativa + 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa + 1;
     Sequencia_Tela[Tela_Ativa] := 'indicacao';
     Descricao_Tela[Tela_Ativa] := 'Cadastro de Indicacao';

     Paciente_OK    := False;
     Preferencia_OK := False;
     Convenio_OK    := False;
     Indicacao_OK   := True;
     Cid_OK         := False;
     Recibo_OK      := False;
     Faturamento_OK := False;
     Medico_OK      := False;
     Cirurgia_OK    := False;
     Adicionais_OK  := False;

     Exibe_Tela();

     Cons02.Indicao1.Enabled := False;

{*** Carrega os Dados ***}

     conexaoBD.SQL_Indicacao.Close;
     conexaoBD.SQL_Indicacao.SQL.Clear;
     conexaoBD.SQL_Indicacao.SQL.Add('select * from Indicacao');
     conexaoBD.SQL_Indicacao.Open;
     Cons02.Indicacao1.GRD_Indicacao.Refresh;
     Limpa_Indicacao();

     Cursor_Normal();
end;

procedure TCons02.paciente_listaCellClick(Column: TColumn);

var
   Ind: Integer;
   Nome_Arq, Tipo: String;
   GifFile: TGifFile;

begin
     Limpa_Paciente();

     if Length(Cons02.Paciente1.DB_paciente_ficha.Text) > 0 then
        begin

        Cursor_Ampulheta();
        flag := 0;

{*** Carrega os Campos da Tela ***}

        Cons02.Paciente1.paciente_ficha.Text         := Cons02.Paciente1.DB_paciente_ficha.Text;
        Cons02.Paciente1.paciente_nome.Text          := Cons02.Paciente1.DB_paciente_nome.Text;
        Cons02.Paciente1.paciente_sobrenome.Text     := Cons02.Paciente1.DB_paciente_sobrenome.Text;
        Cons02.Paciente1.paciente_rg.Text            := Cons02.Paciente1.DB_paciente_rg.Text;
        Cons02.Paciente1.paciente_cpf.Text           := Cons02.Paciente1.DB_paciente_cpf.Text;
        Cons02.Paciente1.paciente_dt_cadastro.Text   := Prepara_Data(Cons02.Paciente1.DB_paciente_dt_cadastro.Text);
        Cons02.Paciente1.paciente_dt_nascimento.Text := Prepara_Data(Cons02.Paciente1.DB_paciente_dt_nascimento.Text);

{*** Carrega o Campo de Indicação ***}

        if (Cons02.Paciente1.DB_paciente_indicacao.Text = '0') or
           (Cons02.Paciente1.DB_paciente_indicacao.Text = '')  then
           begin
           Cons02.Paciente1.paciente_indicacao.Text := '';
           end
        else
           begin
           conexaoBD.SQL_Indicacao.Close;
           conexaoBD.SQL_Indicacao.SQL.Clear;
           conexaoBD.SQL_Indicacao.SQL.Add('select * from Indicacao where indicacao_numero = '+
           Cons02.Paciente1.DB_paciente_indicacao.Text);
           conexaoBD.SQL_Indicacao.Open;

           if conexaoBD.SQL_Indicacao.RecordCount > 0 then
              begin
              Cons02.Paciente1.paciente_indicacao.Text := conexaoBD.SQL_Indicacao.FieldValues['indicacao_nome'];
              end
           else
              begin
              Cons02.Paciente1.paciente_indicacao.Text := '';
           end;
        end;

{*** Carrega o Campo de Sexo ***}

        if Cons02.Paciente1.DB_paciente_sexo.Text = 'M' then
           begin
           Cons02.Paciente1.paciente_sexo.ItemIndex := 1;
           end
        else
           begin
           Cons02.Paciente1.paciente_sexo.ItemIndex := 0;
        end;

{*** Carrega o Campo de Situacao ***}

        if Cons02.Paciente1.DB_paciente_situacao.Text = 'I' then
           begin
           Cons02.Paciente1.paciente_situacao.ItemIndex := 1;
           end
        else
           begin
           Cons02.Paciente1.paciente_situacao.ItemIndex := 0;
        end;

{*** Carrega o Campo de Convenio ***}

        conexaoBD.SQL_Convenio.Close;
        conexaoBD.SQL_Convenio.SQL.Clear;
        conexaoBD.SQL_Convenio.SQL.Add('select * from Convenio where convenio_numero = '+
        Cons02.Paciente1.DB_paciente_convenio.Text);
        conexaoBD.SQL_Convenio.Open;

        if conexaoBD.SQL_Convenio.RecordCount > 0 then
           begin
           Cons02.Paciente1.paciente_convenio.ItemIndex := -1;

           if Cons02.Paciente1.paciente_convenio.Items.Count > 0 then
              begin
              for Ind := 1 to Cons02.Paciente1.paciente_convenio.Items.Count do
                  begin
                  if Cons02.Paciente1.paciente_convenio.Items.Strings[Ind - 1] = conexaoBD.SQL_Convenio.FieldValues['Convenio_Apelido'] then
                     begin
                     Cons02.Paciente1.paciente_convenio.ItemIndex := Ind - 1;
                  end;
              end;
           end;
           end
        else
           begin
           Cons02.Paciente1.paciente_convenio.ItemIndex := -1;
        end;

{*** Continua o Carregamento Normal}

        Cons02.Paciente1.paciente_matricula.Text       := Cons02.Paciente1.DB_paciente_matricula.Text;
        Cons02.Paciente1.paciente_titular.Text         := Cons02.Paciente1.DB_paciente_titular.Text;
        Cons02.Paciente1.paciente_dt_ult_consulta.Text := Prepara_Data(Cons02.Paciente1.DB_paciente_dt_ult_consulta.Text);

{*** Carrega o Campo de Endereço ***}

        if Cons02.Paciente1.DB_paciente_endereco.Text = 'C' then
           begin
           Cons02.Paciente1.paciente_endereco.ItemIndex := 1;
           end
        else
           begin
           Cons02.Paciente1.paciente_endereco.ItemIndex := 0;
        end;

{*** Continua o Carregamento Normal ***}

        Cons02.Paciente1.paciente_logradouro.Text              := Cons02.Paciente1.DB_paciente_logradouro.Text;
        Cons02.Paciente1.paciente_complemento.Text             := Cons02.Paciente1.DB_paciente_complemento.Text;
        Cons02.Paciente1.paciente_bairro.Text                  := Cons02.Paciente1.DB_paciente_bairro.Text;
        Cons02.Paciente1.paciente_cidade.Text                  := Cons02.Paciente1.DB_paciente_cidade.Text;
        Cons02.Paciente1.paciente_cep.Text                     := Cons02.Paciente1.DB_paciente_cep.Text;

{*** Carrega o Campo de UF ***}

        if Cons02.Paciente1.DB_paciente_uf.Text = 'AC' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 0;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'AL' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 1;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'AP' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 2;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'AM' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 3;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'BA' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 4;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'CE' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 5;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'DF' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 6;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'ES' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 7;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'GO' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 8;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'MA' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 9;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'MT' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 10;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'MS' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 11;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'MG' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 12;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'PA' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 13;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'PB' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 14;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'PR' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 15;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'PE' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 16;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'PI' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 17;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'RN' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 18;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'RS' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 19;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'RJ' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 20;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'RO' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 21;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'RR' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 22;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'SC' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 23;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'SP' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 24;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'SE' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 25;
           end
        else if Cons02.Paciente1.DB_paciente_uf.Text = 'TO' then
           begin
           Cons02.Paciente1.paciente_uf.ItemIndex := 26;
        end;

{*** Carrega o Campo de Grau de Instrução ***}

        if Cons02.Paciente1.DB_paciente_instrucao.Text = '1' then
           begin
           Cons02.Paciente1.paciente_instrucao.ItemIndex := 0;
           end
        else if Cons02.Paciente1.DB_paciente_instrucao.Text = '2' then
           begin
           Cons02.Paciente1.paciente_instrucao.ItemIndex := 1;
           end
        else if Cons02.Paciente1.DB_paciente_instrucao.Text = '3' then
           begin
           Cons02.Paciente1.paciente_instrucao.ItemIndex := 2;
           end
        else if Cons02.Paciente1.DB_paciente_instrucao.Text = '4' then
           begin
           Cons02.Paciente1.paciente_instrucao.ItemIndex := 3;
           end
        else if Cons02.Paciente1.DB_paciente_instrucao.Text = '5' then
           begin
           Cons02.Paciente1.paciente_instrucao.ItemIndex := 4;
           end
        else if Cons02.Paciente1.DB_paciente_instrucao.Text = '6' then
           begin
           Cons02.Paciente1.paciente_instrucao.ItemIndex := 5;
           end
        else
           begin
           Cons02.Paciente1.paciente_instrucao.ItemIndex := 0;
        end;

{*** Carrega o Campo de Estado Civil ***}

        if Cons02.Paciente1.DB_paciente_estado_civil.Text = 'S' then
           begin
           Cons02.Paciente1.paciente_estado_civil.ItemIndex := 0;
           end
        else if Cons02.Paciente1.DB_paciente_estado_civil.Text = 'C' then
           begin
           Cons02.Paciente1.paciente_estado_civil.ItemIndex := 1;
           end
        else if Cons02.Paciente1.DB_paciente_estado_civil.Text = 'D' then
           begin
           Cons02.Paciente1.paciente_estado_civil.ItemIndex := 2;
           end
        else if Cons02.Paciente1.DB_paciente_estado_civil.Text = 'E' then
           begin
           Cons02.Paciente1.paciente_estado_civil.ItemIndex := 3;
           end
        else if Cons02.Paciente1.DB_paciente_estado_civil.Text = 'V' then
           begin
           Cons02.Paciente1.paciente_estado_civil.ItemIndex := 4;
        end;

{*** Continua Carregando Normalmente ***}

        Cons02.Paciente1.paciente_naturalidade.Text     := Cons02.Paciente1.DB_paciente_naturalidade.Text;
        Cons02.Paciente1.paciente_profissao.Text        := Cons02.Paciente1.DB_paciente_profissao.Text;
        Cons02.Paciente1.paciente_email.Text            := Cons02.Paciente1.DB_paciente_email.Text;
        Cons02.Paciente1.paciente_fone_residencial.Text := Cons02.Paciente1.DB_paciente_fone_residencial.Text;
        Cons02.Paciente1.paciente_fone_comercial.Text   := Cons02.Paciente1.DB_paciente_fone_comercial.Text;
        Cons02.Paciente1.paciente_fone_fax.Text         := Cons02.Paciente1.DB_paciente_fone_fax.Text;
        Cons02.Paciente1.paciente_fone_celular.Text     := Cons02.Paciente1.DB_paciente_fone_celular.Text;

{*** Abre a Tabela de Pacientes ***}

        if Length(Cons02.Paciente1.paciente_ficha.Text) > 0 then
           begin
           conexaoBD.SQL_Paciente_Lista.Close;
           conexaoBD.SQL_Paciente_Lista.SQL.Clear;
           conexaoBD.SQL_Paciente_Lista.SQL.Add('Select * from Paciente where Paciente_ficha = "'+Cons02.Paciente1.paciente_ficha.Text+'" Order by Paciente_nome_sobrenome');
           conexaoBD.SQL_Paciente_Lista.Open;

{*** Calcula a Idade do Paciente ***}

           Cons02.Paciente1.paciente_idade.Text := Calcula_Idade(DateToStr(Date),Cons02.Paciente1.DB_paciente_dt_nascimento.Text);
        end;

        Cons02.Paciente1.paciente_observacao.Text := Cons02.Paciente1.DB_paciente_observacao.Text;
        Cons02.Paciente1.paciente_prontuario.Text := Cons02.Paciente1.DB_paciente_prontuario.Text;

{*** Carrega os Campos do Recibo ***}

        Cons02.Recibo1.recibo_paciente_ficha.Text    := Cons02.Paciente1.DB_paciente_ficha.Text;
        Cons02.Recibo1.recibo_paciente_nome.Text     := Trim(Cons02.Paciente1.DB_paciente_nome.Text)+' '+Trim(Cons02.Paciente1.DB_paciente_sobrenome.Text);
        Cons02.Recibo1.recibo_paciente_nome_ant.Text := Trim(Cons02.Paciente1.DB_paciente_nome.Text)+' '+Trim(Cons02.Paciente1.DB_paciente_sobrenome.Text);

{*** Carrega a Foto do Paciente ***}

        conexaoBD.SQL_Paciente_Imagem.Close;
        conexaoBD.SQL_Paciente_Imagem.SQL.Clear;
        conexaoBD.SQL_Paciente_Imagem.SQL.Add('select * from Paciente where paciente_ficha  = "'+ Cons02.Paciente1.DB_paciente_ficha.Text +'"');
        conexaoBD.SQL_Paciente_Imagem.Open;

        if conexaoBD.SQL_Paciente_Imagem.RecordCount > 0 then
           begin
           if Not conexaoBD.SQL_Paciente_ImagemPaciente_Foto.IsNull Then
              begin
              conexaoBD.SQL_Paciente_Imagem.First;

              Tipo     := conexaoBD.SQL_Paciente_Imagem.FieldValues['Paciente_foto_tipo'];
              Nome_Arq := 'C:\ConsulTEX\Swap\Swap_Img.' + Tipo;

              conexaoBD.SQL_Paciente_ImagemPaciente_Foto.SaveToFile(Nome_Arq);

              If UpperCase(Tipo) = 'GIF' Then
                 begin
                 GifFile := TGifFile.Create;
                 GifFile.LoadFromFile(Nome_Arq);

                 Cons02.Paciente1.Foto_Paciente.Picture.Bitmap := GifFile.AsBitmap;
                 end
              else if ( UpperCase(Tipo) = 'JPG' ) Or
                      ( UpperCase(Tipo) = 'BMP' ) Or
                      ( UpperCase(Tipo) = 'EMF' ) Or
                      ( UpperCase(Tipo) = 'WMF' ) Then
                 begin
                 Cons02.Paciente1.Foto_Paciente.Picture.LoadFromFile(Nome_Arq);
              end;

              DeleteFile(Nome_Arq);
              end
           else
              begin
              Cons02.Paciente1.Foto_Paciente.Picture := Nil;
           end;
           end
        else
           begin
           Cons02.Paciente1.Foto_Paciente.Picture := Nil;
        end;

        Cursor_Normal();

     end;
end;

procedure TCons02.Agenda2Click(Sender: TObject);

begin
     Cursor_Ampulheta();

     Agenda.Agenda_Medico_Crm.Text      := ConsulTEX_Medico_Crm.Text;
     Agenda.Agenda_Medico.Text          := ConsulTEX_Medico.Text;
     Agenda.Agenda_Exibe_Medico.Caption := ConsulTEX_Medico.Text;

     if IsIconic(Agenda.Handle) then
        begin
        Agenda.WindowState := wsNormal;
        end
     else
        begin
{*** Inicializa Agenda ***}

        Inicializa_Agenda();
     end;

     Cursor_Normal();

{*** Exibe a Agenda ***}

     Agenda.Show;
end;

procedure TCons02.Bt_ImprimirClick(Sender: TObject);
begin
     if Cons02.Paciente1.paciente_ficha.Text <> '' then
        begin
        Application.CreateForm(TRel_Ficha_Paciente,Rel_Ficha_Paciente);

        Rel_Ficha_Paciente.QR_Descricao_Convenio.Caption   := Cons02.Paciente1.paciente_convenio.Text;
        Rel_Ficha_Paciente.QR_Idade.Caption                := Cons02.Paciente1.paciente_idade.Text;

        Rel_Ficha_Paciente.QRL_Nome_medico.Caption         := Cons02.ConsulTEX_Medico.Text;

        Rel_Ficha_Paciente.QR_Sexo.Caption := Cons02.Paciente1.paciente_sexo.Text;
        Rel_Ficha_Paciente.QR_Estado_Civil.Caption := Cons02.Paciente1.paciente_estado_civil.Text;
        Rel_Ficha_Paciente.QR_Indicacao.Caption := Cons02.Paciente1.paciente_indicacao.Text;
        Rel_Ficha_Paciente.QR_Tipo_Residencia.Caption := Cons02.Paciente1.paciente_endereco.Text;

        Rel_Ficha_Paciente.RPT_Ficha_Paciente.PreviewModal;
        Rel_Ficha_Paciente.RPT_Ficha_Paciente.Destroy;
        Rel_Ficha_Paciente.Destroy;
        end
     else
        begin
        MSG_Erro('O Paciente não foi escolhido...');
     end;
end;

procedure TCons02.FichadoPaciente1Click(Sender: TObject);
begin
     if Cons02.Paciente1.paciente_ficha.Text <> '' then
        begin
        Application.CreateForm(TRel_Ficha_Paciente,Rel_Ficha_Paciente);

        Rel_Ficha_Paciente.QR_Descricao_Convenio.Caption   := Cons02.Paciente1.paciente_convenio.Text;
        Rel_Ficha_Paciente.QR_Idade.Caption                := Cons02.Paciente1.paciente_idade.Text;

        Rel_Ficha_Paciente.QRL_Nome_medico.Caption         := Cons02.ConsulTEX_Medico.Text;

        Rel_Ficha_Paciente.QR_Sexo.Caption := Cons02.Paciente1.paciente_sexo.Text;
        Rel_Ficha_Paciente.QR_Estado_Civil.Caption := Cons02.Paciente1.paciente_estado_civil.Text;
        Rel_Ficha_Paciente.QR_Indicacao.Caption := Cons02.Paciente1.paciente_indicacao.Text;
        Rel_Ficha_Paciente.QR_Tipo_Residencia.Caption := Cons02.Paciente1.paciente_endereco.Text;

        Rel_Ficha_Paciente.RPT_Ficha_Paciente.PreviewModal;
        Rel_Ficha_Paciente.RPT_Ficha_Paciente.Destroy;
        Rel_Ficha_Paciente.Destroy;
        end
     else
        begin
        MSG_Erro('O Paciente não foi escolhido...');
     end;
end;

procedure TCons02.EnvelopedoPaciente1Click(Sender: TObject);
begin
     if Cons02.Paciente1.paciente_ficha.Text <> '' then
        begin
        Application.CreateForm(TRel_Envelope,Rel_Envelope);
        Rel_Envelope.RPT_Envelope.PreviewModal;
        Rel_Envelope.RPT_Envelope.Destroy;
        Rel_Envelope.Destroy;
        end
     else
        begin
        MSG_Erro('O Paciente não foi escolhido...');
     end;
end;

procedure TCons02.CID1Click(Sender: TObject);
begin
     Cursor_Ampulheta();

{*** CID ***}
{*** Prepara a Tela para a Abertura ***}

     Tela_Ativa                 := Qtde_Tela_Ativa + 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa + 1;
     Sequencia_Tela[Tela_Ativa] := 'cid';
     Descricao_Tela[Tela_Ativa] := 'C.I.D.';

     Paciente_OK    := False;
     Preferencia_OK := False;
     Indicacao_OK   := False;
     Convenio_OK    := False;
     Cid_OK         := True;
     Recibo_OK      := False;
     Faturamento_OK := False;
     Medico_OK      := False;
     Cirurgia_OK    := False;
     Adicionais_OK  := False;

     Exibe_Tela();

     Cons02.CID1.Enabled := False;

{*** Carrega os Dados ***}

     conexaoBD.SQL_Cid.Close;
     conexaoBD.SQL_Cid.SQL.Clear;
     conexaoBD.SQL_Cid.SQL.Add('select * from Cid');
     conexaoBD.SQL_Cid.Open;

     Cons02.Cid2.GRD_Cid.Refresh;
     Limpa_Cid();

     Cursor_Normal();
end;

procedure TCons02.FormCreate(Sender: TObject);
begin
    {*** Trabalha com o Ano de 4 Dígitos ***}
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TCons02.ControledeRecibos1Click(Sender: TObject);
begin
     Cursor_Ampulheta();

{*** Controle de Recibos ***}
{*** Prepara a Tela para a Abertura ***}

     Tela_Ativa                 := Qtde_Tela_Ativa + 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa + 1;
     Sequencia_Tela[Tela_Ativa] := 'recibo';
     Descricao_Tela[Tela_Ativa] := 'Controle de Recibos';

     Paciente_OK    := False;
     Preferencia_OK := False;
     Indicacao_OK   := False;
     Convenio_OK    := False;
     Cid_OK         := False;
     Recibo_OK      := True;
     Faturamento_OK := False;
     Medico_OK      := False;
     Cirurgia_OK    := False;
     Adicionais_OK  := False;

     Exibe_Tela();

     Cons02.ControledeRecibos1.Enabled := False;

{*** Carrega os Dados ***}

     Limpa_Recibo();

{*** Prepara as Permissões de Acesso ***}

     if (Cons02.ConsulTEX_Acesso_Imp_Rec.Text = 'S') or (Cons02.ConsulTEX_Acesso_Imp_Rec.Text = 'L') then
        begin
        Cons02.Recibo1.BT_recibo_imprimir.Enabled         := False;
        Cons02.Recibo1.BT_recibo_emitido_imprimir.Enabled := False;
        Cons02.Recibo1.BT_recibo_apagar.Enabled           := False;
     end;

     Cursor_Normal();
end;

procedure TCons02.Faturamento1Click(Sender: TObject);
begin
     Cursor_Ampulheta();

{*** Controle de Recibos ***}
{*** Prepara a Tela para a Abertura ***}

     Tela_Ativa                 := Qtde_Tela_Ativa + 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa + 1;
     Sequencia_Tela[Tela_Ativa] := 'faturamento';
     Descricao_Tela[Tela_Ativa] := 'Faturamento';

     Paciente_OK    := False;
     Preferencia_OK := False;
     Indicacao_OK   := False;
     Convenio_OK    := False;
     Cid_OK         := False;
     Recibo_OK      := False;
     Faturamento_OK := True;
     Medico_OK      := False;
     Cirurgia_OK    := False;
     Adicionais_OK  := False;

     Exibe_Tela();

     Cons02.Faturamento1.Enabled := False;

{*** Carrega os Dados ***}

     Carrega_Lista_Convenio_FAT();
     Limpa_Faturamento();

{*** Prepara as Permissões de Acesso ***}

     if (Cons02.ConsulTEX_Acesso_Imp_Fat.Text = 'S') or (Cons02.ConsulTEX_Acesso_Imp_Fat.Text = 'L') then
        begin
        Cons02.Faturamento2.BT_Calcular.Enabled   := False;
        Cons02.Faturamento2.BT_Recalcular.Enabled := False;
        Cons02.Faturamento2.BT_Imprimir.Enabled   := False;
     end;

     Cursor_Normal();
end;

procedure TCons02.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{*** Encerrar o ConsulTEX ***}

     Fecha_Tudo();
end;

procedure TCons02.localiza_pacienteKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #13 then
        begin
        Carrega_Lista_Pacientes();
     end;
end;

procedure TCons02.CadastrodoMdico1Click(Sender: TObject);
begin
     Cursor_Ampulheta();

{*** Médico ***}
{*** Prepara a Tela para a Abertura ***}

     Tela_Ativa                 := Qtde_Tela_Ativa + 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa + 1;
     Sequencia_Tela[Tela_Ativa] := 'medico';
     Descricao_Tela[Tela_Ativa] := 'Dados do Médico';

     Paciente_OK    := False;
     Preferencia_OK := False;
     Indicacao_OK   := False;
     Convenio_OK    := False;
     Cid_OK         := False;
     Recibo_OK      := False;
     Faturamento_OK := False;
     Medico_OK      := True;
     Cirurgia_OK    := False;
     Adicionais_OK  := False;

     Exibe_Tela();

     Cons02.CadastrodoMdico1.Enabled := False;

{*** Carrega os Dados ***}

     conexaoBD.SQL_Medico.Close;
     conexaoBD.SQL_Medico.SQL.Clear;
     conexaoBD.SQL_Medico.SQL.Add('select * from Medico');
     conexaoBD.SQL_Medico.Open;

     Cons02.Medico1.GRD_Medico.Refresh;
     Limpa_Medico();

     Cursor_Normal();
end;

procedure TCons02.Cirurgia1Click(Sender: TObject);
begin
     Cursor_Ampulheta();

{*** Cirurgia ***}
{*** Prepara a Tela para a Abertura ***}

     Tela_Ativa                 := Qtde_Tela_Ativa + 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa + 1;
     Sequencia_Tela[Tela_Ativa] := 'cirurgia';
     Descricao_Tela[Tela_Ativa] := 'Cadastro de Cirurgia';

     Paciente_OK    := False;
     Preferencia_OK := False;
     Indicacao_OK   := False;
     Convenio_OK    := False;
     Cid_OK         := False;
     Recibo_OK      := False;
     Faturamento_OK := False;
     Medico_OK      := False;
     Cirurgia_OK    := True;
     Adicionais_OK  := False;

     Exibe_Tela();

     Cons02.Cirurgia1.Enabled := False;

{*** Carrega os Dados ***}

     conexaoBD.SQL_Cirurgia.Close;
     conexaoBD.SQL_Cirurgia.SQL.Clear;
     conexaoBD.SQL_Cirurgia.SQL.Add('select * from Cirurgia');
     conexaoBD.SQL_Cirurgia.Open;

     Cons02.Cirurgia2.GRD_Cirurgia.Refresh;
     Limpa_Cirurgia();

     Cursor_Normal();
end;

procedure TCons02.Adicionais1Click(Sender: TObject);
begin
     Cursor_Ampulheta();

{*** Cirurgia ***}
{*** Prepara a Tela para a Abertura ***}

     Tela_Ativa                 := Qtde_Tela_Ativa + 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa + 1;
     Sequencia_Tela[Tela_Ativa] := 'adicionais';
     Descricao_Tela[Tela_Ativa] := 'Cadastro de Adicionais';

     Paciente_OK    := False;
     Preferencia_OK := False;
     Indicacao_OK   := False;
     Convenio_OK    := False;
     Cid_OK         := False;
     Recibo_OK      := False;
     Faturamento_OK := False;
     Medico_OK      := False;
     Cirurgia_OK    := False;
     Adicionais_OK  := True;

     Exibe_Tela();

     Cons02.Adicionais1.Enabled := False;

{*** Carrega os Dados ***}

     conexaoBD.SQL_Adicionais.Close;
     conexaoBD.SQL_Adicionais.SQL.Clear;
     conexaoBD.SQL_Adicionais.SQL.Add('select * from Adicionais');
     conexaoBD.SQL_Adicionais.Open;

     Cons02.Adicionais2.GRD_Adicional.Refresh;
     Limpa_Adicionais();

     Cursor_Normal();
end;

procedure TCons02.Sobre1Click(Sender: TObject);
begin
     Application.CreateForm(TSobre00,Sobre00);
     Sobre00.ShowModal;
     Sobre00.Destroy;
end;

procedure TCons02.Trocar1Click(Sender: TObject);
begin
     Application.CreateForm(TAtivo00,Ativo00);
     Ativo00.ShowModal;
     Ativo00.Destroy;
end;

procedure TCons02.BackupReparao1Click(Sender: TObject);
begin
     Application.CreateForm(TBackupReparacao,BackupReparacao);
     BackupReparacao.ShowModal;
     BackupReparacao.Destroy;

{*** Encerrar o ConsulTEX ***}

     Cons02.Close;
end;

procedure TCons02.Como1Click(Sender: TObject);
begin
     Application.CreateForm(TAjuda00,Ajuda00);
     Ajuda00.ShowModal;
     Ajuda00.Destroy;
end;

procedure TCons02.ControledePagamentos1Click(Sender: TObject);
begin
     Application.CreateForm(TControle_Pagamento00,Controle_Pagamento00);

     Cursor_Ampulheta();

     Controle_Pagamento00.Medico_Crm.Text := ConsulTEX_Medico_Crm.Text;
     Controle_Pagamento00.Medico.Text     := ConsulTEX_Medico.Text;

     Cursor_Normal();

     Controle_Pagamento00.ShowModal;
     Controle_Pagamento00.Destroy;
end;

procedure TCons02.Etiquetas1Click(Sender: TObject);
begin
    Application.CreateForm(TEtiquetas00,Etiquetas00);
    Etiquetas00.ShowModal;
    Etiquetas00.Destroy;
end;

procedure TCons02.ListaGeraldosPacientes1Click(Sender: TObject);
begin
    Application.CreateForm(TListaGeralPacientes00,ListaGeralPacientes00);
    ListaGeralPacientes00.ShowModal;
    ListaGeralPacientes00.Destroy;
end;

end.
