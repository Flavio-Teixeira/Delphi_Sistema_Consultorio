unit Conexao_BD;

interface

uses
  SysUtils, Classes, DB, DBTables, ADODB;

type
  TconexaoBD = class(TDataModule)
    DS_Paciente: TDataSource;
    DS_Usuario: TDataSource;
    DS_Convenio: TDataSource;
    DS_Indicacao: TDataSource;
    DS_Agenda: TDataSource;
    DS_Cid: TDataSource;
    DS_Recibo: TDataSource;
    DS_Medico: TDataSource;
    DS_Paciente_AG: TDataSource;
    DS_Convenio_AG: TDataSource;
    DS_Convenio_FAT: TDataSource;
    DS_Agenda_FAT: TDataSource;
    SQL_Paciente: TADOQuery;
    SQL_Usuario: TADOQuery;
    SQL_Convenio: TADOQuery;
    SQL_Indicacao: TADOQuery;
    SQL_Agenda: TADOQuery;
    SQL_Cid: TADOQuery;
    SQL_Recibo: TADOQuery;
    SQL_Medico: TADOQuery;
    SQL_Paciente_AG: TADOQuery;
    SQL_Convenio_AG: TADOQuery;
    SQL_Convenio_FAT: TADOQuery;
    SQL_Agenda_FAT: TADOQuery;
    SQL_Conexao: TADOQuery;
    DS_Conexao: TDataSource;
    SQL_Paciente_Lista: TADOQuery;
    DS_Paciente_Lista: TDataSource;
    Conexao_Principal: TADOConnection;
    SQL_Conexaoconexao_caminho: TWideStringField;
    SQL_UsuarioUsuario_nome: TWideStringField;
    SQL_UsuarioUsuario_senha: TWideStringField;
    SQL_UsuarioUsuario_acesso_agenda: TWideStringField;
    SQL_UsuarioUsuario_acesso_paciente: TWideStringField;
    SQL_UsuarioUsuario_acesso_convenio: TWideStringField;
    SQL_UsuarioUsuario_acesso_indicacao: TWideStringField;
    SQL_UsuarioUsuario_acesso_cid: TWideStringField;
    SQL_UsuarioUsuario_acesso_imp_env: TWideStringField;
    SQL_UsuarioUsuario_acesso_imp_ficha: TWideStringField;
    SQL_UsuarioUsuario_acesso_imp_fat: TWideStringField;
    SQL_UsuarioUsuario_acesso_imp_rec: TWideStringField;
    SQL_UsuarioUsuario_acesso_usuario: TWideStringField;
    SQL_UsuarioUsuario_acesso_medico: TWideStringField;
    SQL_PacientePaciente_nome: TWideStringField;
    SQL_PacientePaciente_sobrenome: TWideStringField;
    SQL_PacientePaciente_rg: TWideStringField;
    SQL_PacientePaciente_cpf: TWideStringField;
    SQL_PacientePaciente_dt_cadastro: TDateTimeField;
    SQL_PacientePaciente_dt_nascimento: TDateTimeField;
    SQL_PacientePaciente_indicacao: TFloatField;
    SQL_PacientePaciente_sexo: TWideStringField;
    SQL_PacientePaciente_situacao: TWideStringField;
    SQL_PacientePaciente_convenio: TFloatField;
    SQL_PacientePaciente_matricula: TWideStringField;
    SQL_PacientePaciente_titular: TWideStringField;
    SQL_PacientePaciente_dt_ult_consulta: TDateTimeField;
    SQL_PacientePaciente_endereco: TWideStringField;
    SQL_PacientePaciente_logradouro: TWideStringField;
    SQL_PacientePaciente_complemento: TWideStringField;
    SQL_PacientePaciente_bairro: TWideStringField;
    SQL_PacientePaciente_cidade: TWideStringField;
    SQL_PacientePaciente_cep: TWideStringField;
    SQL_PacientePaciente_uf: TWideStringField;
    SQL_PacientePaciente_instrucao: TWideStringField;
    SQL_PacientePaciente_estado_civil: TWideStringField;
    SQL_PacientePaciente_naturalidade: TWideStringField;
    SQL_PacientePaciente_profissao: TWideStringField;
    SQL_PacientePaciente_email: TWideStringField;
    SQL_PacientePaciente_fone_residencial: TWideStringField;
    SQL_PacientePaciente_fone_comercial: TWideStringField;
    SQL_PacientePaciente_fone_fax: TWideStringField;
    SQL_PacientePaciente_fone_celular: TWideStringField;
    SQL_PacientePaciente_foto: TBlobField;
    SQL_PacientePaciente_nome_sobrenome: TWideStringField;
    SQL_PacientePaciente_observacao: TMemoField;
    SQL_PacientePaciente_medico: TFloatField;
    SQL_Paciente_AGPaciente_nome: TWideStringField;
    SQL_Paciente_AGPaciente_sobrenome: TWideStringField;
    SQL_Paciente_AGPaciente_rg: TWideStringField;
    SQL_Paciente_AGPaciente_cpf: TWideStringField;
    SQL_Paciente_AGPaciente_dt_cadastro: TDateTimeField;
    SQL_Paciente_AGPaciente_dt_nascimento: TDateTimeField;
    SQL_Paciente_AGPaciente_indicacao: TFloatField;
    SQL_Paciente_AGPaciente_sexo: TWideStringField;
    SQL_Paciente_AGPaciente_situacao: TWideStringField;
    SQL_Paciente_AGPaciente_convenio: TFloatField;
    SQL_Paciente_AGPaciente_matricula: TWideStringField;
    SQL_Paciente_AGPaciente_titular: TWideStringField;
    SQL_Paciente_AGPaciente_dt_ult_consulta: TDateTimeField;
    SQL_Paciente_AGPaciente_endereco: TWideStringField;
    SQL_Paciente_AGPaciente_logradouro: TWideStringField;
    SQL_Paciente_AGPaciente_complemento: TWideStringField;
    SQL_Paciente_AGPaciente_bairro: TWideStringField;
    SQL_Paciente_AGPaciente_cidade: TWideStringField;
    SQL_Paciente_AGPaciente_cep: TWideStringField;
    SQL_Paciente_AGPaciente_uf: TWideStringField;
    SQL_Paciente_AGPaciente_instrucao: TWideStringField;
    SQL_Paciente_AGPaciente_estado_civil: TWideStringField;
    SQL_Paciente_AGPaciente_naturalidade: TWideStringField;
    SQL_Paciente_AGPaciente_profissao: TWideStringField;
    SQL_Paciente_AGPaciente_email: TWideStringField;
    SQL_Paciente_AGPaciente_fone_residencial: TWideStringField;
    SQL_Paciente_AGPaciente_fone_comercial: TWideStringField;
    SQL_Paciente_AGPaciente_fone_fax: TWideStringField;
    SQL_Paciente_AGPaciente_fone_celular: TWideStringField;
    SQL_Paciente_AGPaciente_foto: TBlobField;
    SQL_Paciente_AGPaciente_nome_sobrenome: TWideStringField;
    SQL_Paciente_AGPaciente_observacao: TMemoField;
    SQL_Paciente_AGPaciente_medico: TFloatField;
    SQL_Paciente_ListaPaciente_nome: TWideStringField;
    SQL_Paciente_ListaPaciente_sobrenome: TWideStringField;
    SQL_Paciente_ListaPaciente_rg: TWideStringField;
    SQL_Paciente_ListaPaciente_cpf: TWideStringField;
    SQL_Paciente_ListaPaciente_dt_cadastro: TDateTimeField;
    SQL_Paciente_ListaPaciente_dt_nascimento: TDateTimeField;
    SQL_Paciente_ListaPaciente_indicacao: TFloatField;
    SQL_Paciente_ListaPaciente_sexo: TWideStringField;
    SQL_Paciente_ListaPaciente_situacao: TWideStringField;
    SQL_Paciente_ListaPaciente_convenio: TFloatField;
    SQL_Paciente_ListaPaciente_matricula: TWideStringField;
    SQL_Paciente_ListaPaciente_titular: TWideStringField;
    SQL_Paciente_ListaPaciente_dt_ult_consulta: TDateTimeField;
    SQL_Paciente_ListaPaciente_endereco: TWideStringField;
    SQL_Paciente_ListaPaciente_logradouro: TWideStringField;
    SQL_Paciente_ListaPaciente_complemento: TWideStringField;
    SQL_Paciente_ListaPaciente_bairro: TWideStringField;
    SQL_Paciente_ListaPaciente_cidade: TWideStringField;
    SQL_Paciente_ListaPaciente_cep: TWideStringField;
    SQL_Paciente_ListaPaciente_uf: TWideStringField;
    SQL_Paciente_ListaPaciente_instrucao: TWideStringField;
    SQL_Paciente_ListaPaciente_estado_civil: TWideStringField;
    SQL_Paciente_ListaPaciente_naturalidade: TWideStringField;
    SQL_Paciente_ListaPaciente_profissao: TWideStringField;
    SQL_Paciente_ListaPaciente_email: TWideStringField;
    SQL_Paciente_ListaPaciente_fone_residencial: TWideStringField;
    SQL_Paciente_ListaPaciente_fone_comercial: TWideStringField;
    SQL_Paciente_ListaPaciente_fone_fax: TWideStringField;
    SQL_Paciente_ListaPaciente_fone_celular: TWideStringField;
    SQL_Paciente_ListaPaciente_foto: TBlobField;
    SQL_Paciente_ListaPaciente_nome_sobrenome: TWideStringField;
    SQL_Paciente_ListaPaciente_observacao: TMemoField;
    SQL_Paciente_ListaPaciente_medico: TFloatField;
    SQL_Paciente_Imagem: TADOQuery;
    DS_Paciente_Imagem: TDataSource;
    SQL_Paciente_ImagemPaciente_nome: TWideStringField;
    SQL_Paciente_ImagemPaciente_sobrenome: TWideStringField;
    SQL_Paciente_ImagemPaciente_rg: TWideStringField;
    SQL_Paciente_ImagemPaciente_cpf: TWideStringField;
    SQL_Paciente_ImagemPaciente_dt_cadastro: TDateTimeField;
    SQL_Paciente_ImagemPaciente_dt_nascimento: TDateTimeField;
    SQL_Paciente_ImagemPaciente_indicacao: TFloatField;
    SQL_Paciente_ImagemPaciente_sexo: TWideStringField;
    SQL_Paciente_ImagemPaciente_situacao: TWideStringField;
    SQL_Paciente_ImagemPaciente_convenio: TFloatField;
    SQL_Paciente_ImagemPaciente_matricula: TWideStringField;
    SQL_Paciente_ImagemPaciente_titular: TWideStringField;
    SQL_Paciente_ImagemPaciente_dt_ult_consulta: TDateTimeField;
    SQL_Paciente_ImagemPaciente_endereco: TWideStringField;
    SQL_Paciente_ImagemPaciente_logradouro: TWideStringField;
    SQL_Paciente_ImagemPaciente_complemento: TWideStringField;
    SQL_Paciente_ImagemPaciente_bairro: TWideStringField;
    SQL_Paciente_ImagemPaciente_cidade: TWideStringField;
    SQL_Paciente_ImagemPaciente_cep: TWideStringField;
    SQL_Paciente_ImagemPaciente_uf: TWideStringField;
    SQL_Paciente_ImagemPaciente_instrucao: TWideStringField;
    SQL_Paciente_ImagemPaciente_estado_civil: TWideStringField;
    SQL_Paciente_ImagemPaciente_naturalidade: TWideStringField;
    SQL_Paciente_ImagemPaciente_profissao: TWideStringField;
    SQL_Paciente_ImagemPaciente_email: TWideStringField;
    SQL_Paciente_ImagemPaciente_fone_residencial: TWideStringField;
    SQL_Paciente_ImagemPaciente_fone_comercial: TWideStringField;
    SQL_Paciente_ImagemPaciente_fone_fax: TWideStringField;
    SQL_Paciente_ImagemPaciente_fone_celular: TWideStringField;
    SQL_Paciente_ImagemPaciente_foto: TBlobField;
    SQL_Paciente_ImagemPaciente_nome_sobrenome: TWideStringField;
    SQL_Paciente_ImagemPaciente_observacao: TMemoField;
    SQL_Paciente_ImagemPaciente_medico: TFloatField;
    SQL_PacientePaciente_foto_tipo: TWideStringField;
    SQL_Paciente_AGPaciente_foto_tipo: TWideStringField;
    SQL_Paciente_ListaPaciente_foto_tipo: TWideStringField;
    SQL_Paciente_ImagemPaciente_foto_tipo: TWideStringField;
    DS_Comunitario: TDataSource;
    SQL_Comunitario: TADOQuery;
    SQL_PacientePaciente_prontuario: TMemoField;
    SQL_Paciente_AGPaciente_prontuario: TMemoField;
    SQL_Paciente_ListaPaciente_prontuario: TMemoField;
    SQL_Paciente_ImagemPaciente_prontuario: TMemoField;
    SQL_UsuarioUsuario_acesso_paciente_observacoes: TWideStringField;
    SQL_UsuarioUsuario_acesso_paciente_prontuario: TWideStringField;
    DS_Cirurgia: TDataSource;
    SQL_Cirurgia: TADOQuery;
    SQL_UsuarioUsuario_acesso_cirurgia: TWideStringField;
    DS_Adicionais: TDataSource;
    SQL_Adicionais: TADOQuery;
    SQL_UsuarioUsuario_acesso_adicionais: TWideStringField;
    DS_Cirurgia_AG: TDataSource;
    SQL_Cirurgia_AG: TADOQuery;
    DS_Comunitario_Aux: TDataSource;
    SQL_Comunitario_Aux: TADOQuery;
    DS_Adicionais_AG: TDataSource;
    SQL_Adicionais_AG: TADOQuery;
    DS_Adicionais_Lista: TDataSource;
    SQL_Adicionais_Lista: TADOQuery;
    SQL_Rel_Detalhado: TADOQuery;
    DS_Rel_Detalhado: TDataSource;
    SQL_MedicoMedico_crm: TWideStringField;
    SQL_MedicoMedico_nome: TWideStringField;
    SQL_MedicoMedico_especialidade: TWideStringField;
    SQL_MedicoMedico_rg: TWideStringField;
    SQL_MedicoMedico_cpf: TWideStringField;
    SQL_MedicoMedico_endereco: TWideStringField;
    SQL_MedicoMedico_complemento: TWideStringField;
    SQL_MedicoMedico_bairro: TWideStringField;
    SQL_MedicoMedico_cidade: TWideStringField;
    SQL_MedicoMedico_uf: TWideStringField;
    SQL_MedicoMedico_cep: TWideStringField;
    SQL_MedicoMedico_fone_consultorio: TWideStringField;
    SQL_MedicoMedico_fone_residencia: TWideStringField;
    SQL_MedicoMedico_fone_celular: TWideStringField;
    SQL_MedicoMedico_fone_fax: TWideStringField;
    SQL_MedicoMedico_email: TWideStringField;
    SQL_Conexaoconexao_registro: TWideStringField;
    SQL_PacientePaciente_ficha: TWideStringField;
    SQL_Paciente_AGPaciente_ficha: TWideStringField;
    SQL_Paciente_ImagemPaciente_ficha: TWideStringField;
    SQL_Paciente_ListaPaciente_ficha: TWideStringField;
    SQL_Rel_Controle_Pagamentos: TADOQuery;
    DS_Rel_Controle_Pagamentos: TDataSource;
    SQL_Rel_Controle_PagamentosAgenda_registro: TAutoIncField;
    SQL_Rel_Controle_PagamentosAgenda_medico_crm: TWideStringField;
    SQL_Rel_Controle_PagamentosAgenda_data: TDateTimeField;
    SQL_Rel_Controle_PagamentosAgenda_hora: TWideStringField;
    SQL_Rel_Controle_PagamentosAgenda_ficha: TWideStringField;
    SQL_Rel_Controle_PagamentosAgenda_descricao: TWideStringField;
    SQL_Rel_Controle_PagamentosAgenda_tipo: TWideStringField;
    SQL_Rel_Controle_PagamentosAgenda_tipo_cirurgia: TWideStringField;
    SQL_Rel_Controle_PagamentosAgenda_cirurgia_descricao: TWideStringField;
    SQL_Rel_Controle_PagamentosAgenda_quantidade_ch: TIntegerField;
    SQL_Rel_Controle_PagamentosAgenda_valor_ch: TFloatField;
    SQL_Rel_Controle_PagamentosAgenda_status: TWideStringField;
    SQL_Rel_Controle_PagamentosAgenda_convenio: TFloatField;
    SQL_Rel_Controle_PagamentosAgenda_descricao_convenio: TWideStringField;
    SQL_Rel_Controle_PagamentosAgenda_identifica_adicional: TWideStringField;
    SQL_Rel_Controle_PagamentosAgenda_valor_material_cirurgia: TFloatField;
    SQL_Rel_Controle_PagamentosAgenda_observacao: TWideStringField;
    SQL_Rel_Controle_PagamentosAgenda_valor_cirurgia: TFloatField;
    SQL_Rel_Controle_PagamentosAgenda_pago: TWideStringField;
    SQL_Rel_Controle_PagamentosAgenda_valor_adicional: TFloatField;
    SQL_Rel_Controle_PagamentosConvenio_numero: TAutoIncField;
    SQL_Rel_Controle_PagamentosConvenio_qtde_ch: TFloatField;
    SQL_Rel_Controle_PagamentosConvenio_valor_ch: TFloatField;
    SQL_Rel_Controle_PagamentosConvenio_valor_cirurgia: TFloatField;
    DS_Etiquetas: TDataSource;
    SQL_Etiquetas: TADOQuery;
    SQL_EtiquetasNumero: TAutoIncField;
    SQL_EtiquetasPaciente1: TWideStringField;
    SQL_EtiquetasPaciente2: TWideStringField;
    SQL_EtiquetasEndereco1: TWideStringField;
    SQL_EtiquetasEndereco2: TWideStringField;
    SQL_EtiquetasBairro_Cidade_Estado1: TWideStringField;
    SQL_EtiquetasBairro_Cidade_Estado2: TWideStringField;
    SQL_EtiquetasCEP1: TWideStringField;
    SQL_EtiquetasCEP2: TWideStringField;
    SQL_EtiquetasA1: TWideStringField;
    SQL_EtiquetasA2: TWideStringField;
    DS_PacienteListaGeral: TDataSource;
    SQL_PacienteListaGeral: TADOQuery;
    SQL_PacienteListaGeralPaciente_ficha: TWideStringField;
    SQL_PacienteListaGeralPaciente_caracteres: TIntegerField;
    SQL_PacienteListaGeralPaciente_nome_sobrenome: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  conexaoBD: TconexaoBD;

implementation

{$R *.dfm}

end.