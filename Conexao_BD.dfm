object conexaoBD: TconexaoBD
  OldCreateOrder = False
  Left = 275
  Top = 153
  Height = 331
  Width = 712
  object DS_Paciente: TDataSource
    DataSet = SQL_Paciente
    Left = 40
    Top = 80
  end
  object DS_Usuario: TDataSource
    DataSet = SQL_Usuario
    Left = 600
    Top = 80
  end
  object DS_Convenio: TDataSource
    DataSet = SQL_Convenio
    Left = 200
    Top = 80
  end
  object DS_Indicacao: TDataSource
    DataSet = SQL_Indicacao
    Left = 560
    Top = 80
  end
  object DS_Agenda: TDataSource
    DataSet = SQL_Agenda
    Left = 320
    Top = 80
  end
  object DS_Cid: TDataSource
    DataSet = SQL_Cid
    Left = 520
    Top = 80
  end
  object DS_Recibo: TDataSource
    DataSet = SQL_Recibo
    Left = 480
    Top = 80
  end
  object DS_Medico: TDataSource
    DataSet = SQL_Medico
    Left = 440
    Top = 80
  end
  object DS_Paciente_AG: TDataSource
    DataSet = SQL_Paciente_AG
    Left = 80
    Top = 80
  end
  object DS_Convenio_AG: TDataSource
    DataSet = SQL_Convenio_AG
    Left = 240
    Top = 80
  end
  object DS_Convenio_FAT: TDataSource
    DataSet = SQL_Convenio_FAT
    Left = 280
    Top = 80
  end
  object DS_Agenda_FAT: TDataSource
    DataSet = SQL_Agenda_FAT
    Left = 360
    Top = 80
  end
  object SQL_Paciente: TADOQuery
    Active = True
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Paciente')
    Left = 40
    Top = 184
    object SQL_PacientePaciente_ficha: TWideStringField
      FieldName = 'Paciente_ficha'
      Size = 50
    end
    object SQL_PacientePaciente_nome: TWideStringField
      FieldName = 'Paciente_nome'
      Size = 80
    end
    object SQL_PacientePaciente_sobrenome: TWideStringField
      FieldName = 'Paciente_sobrenome'
      Size = 80
    end
    object SQL_PacientePaciente_rg: TWideStringField
      FieldName = 'Paciente_rg'
      Size = 15
    end
    object SQL_PacientePaciente_cpf: TWideStringField
      FieldName = 'Paciente_cpf'
      Size = 14
    end
    object SQL_PacientePaciente_dt_cadastro: TDateTimeField
      FieldName = 'Paciente_dt_cadastro'
    end
    object SQL_PacientePaciente_dt_nascimento: TDateTimeField
      FieldName = 'Paciente_dt_nascimento'
    end
    object SQL_PacientePaciente_indicacao: TFloatField
      FieldName = 'Paciente_indicacao'
    end
    object SQL_PacientePaciente_sexo: TWideStringField
      FieldName = 'Paciente_sexo'
      Size = 1
    end
    object SQL_PacientePaciente_situacao: TWideStringField
      FieldName = 'Paciente_situacao'
      Size = 1
    end
    object SQL_PacientePaciente_convenio: TFloatField
      FieldName = 'Paciente_convenio'
    end
    object SQL_PacientePaciente_matricula: TWideStringField
      FieldName = 'Paciente_matricula'
      Size = 25
    end
    object SQL_PacientePaciente_titular: TWideStringField
      FieldName = 'Paciente_titular'
      Size = 80
    end
    object SQL_PacientePaciente_dt_ult_consulta: TDateTimeField
      FieldName = 'Paciente_dt_ult_consulta'
    end
    object SQL_PacientePaciente_endereco: TWideStringField
      FieldName = 'Paciente_endereco'
      Size = 1
    end
    object SQL_PacientePaciente_logradouro: TWideStringField
      FieldName = 'Paciente_logradouro'
      Size = 80
    end
    object SQL_PacientePaciente_complemento: TWideStringField
      FieldName = 'Paciente_complemento'
      Size = 80
    end
    object SQL_PacientePaciente_bairro: TWideStringField
      FieldName = 'Paciente_bairro'
      Size = 80
    end
    object SQL_PacientePaciente_cidade: TWideStringField
      FieldName = 'Paciente_cidade'
      Size = 80
    end
    object SQL_PacientePaciente_cep: TWideStringField
      FieldName = 'Paciente_cep'
      Size = 9
    end
    object SQL_PacientePaciente_uf: TWideStringField
      FieldName = 'Paciente_uf'
      Size = 2
    end
    object SQL_PacientePaciente_instrucao: TWideStringField
      FieldName = 'Paciente_instrucao'
      Size = 1
    end
    object SQL_PacientePaciente_estado_civil: TWideStringField
      FieldName = 'Paciente_estado_civil'
      Size = 1
    end
    object SQL_PacientePaciente_naturalidade: TWideStringField
      FieldName = 'Paciente_naturalidade'
      Size = 80
    end
    object SQL_PacientePaciente_profissao: TWideStringField
      FieldName = 'Paciente_profissao'
      Size = 80
    end
    object SQL_PacientePaciente_email: TWideStringField
      FieldName = 'Paciente_email'
      Size = 80
    end
    object SQL_PacientePaciente_fone_residencial: TWideStringField
      FieldName = 'Paciente_fone_residencial'
      Size = 40
    end
    object SQL_PacientePaciente_fone_comercial: TWideStringField
      FieldName = 'Paciente_fone_comercial'
      Size = 40
    end
    object SQL_PacientePaciente_fone_fax: TWideStringField
      FieldName = 'Paciente_fone_fax'
      Size = 40
    end
    object SQL_PacientePaciente_fone_celular: TWideStringField
      FieldName = 'Paciente_fone_celular'
      Size = 40
    end
    object SQL_PacientePaciente_foto: TBlobField
      FieldName = 'Paciente_foto'
    end
    object SQL_PacientePaciente_nome_sobrenome: TWideStringField
      FieldName = 'Paciente_nome_sobrenome'
      Size = 160
    end
    object SQL_PacientePaciente_observacao: TMemoField
      FieldName = 'Paciente_observacao'
      BlobType = ftMemo
    end
    object SQL_PacientePaciente_medico: TFloatField
      FieldName = 'Paciente_medico'
    end
    object SQL_PacientePaciente_foto_tipo: TWideStringField
      FieldName = 'Paciente_foto_tipo'
      Size = 3
    end
    object SQL_PacientePaciente_prontuario: TMemoField
      FieldName = 'Paciente_prontuario'
      BlobType = ftMemo
    end
  end
  object SQL_Usuario: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    SQL.Strings = (
      'select * from Usuario')
    Left = 600
    Top = 184
    object SQL_UsuarioUsuario_nome: TWideStringField
      FieldName = 'Usuario_nome'
      Size = 80
    end
    object SQL_UsuarioUsuario_senha: TWideStringField
      FieldName = 'Usuario_senha'
      Size = 80
    end
    object SQL_UsuarioUsuario_acesso_agenda: TWideStringField
      FieldName = 'Usuario_acesso_agenda'
      Size = 1
    end
    object SQL_UsuarioUsuario_acesso_paciente: TWideStringField
      FieldName = 'Usuario_acesso_paciente'
      Size = 1
    end
    object SQL_UsuarioUsuario_acesso_convenio: TWideStringField
      FieldName = 'Usuario_acesso_convenio'
      Size = 1
    end
    object SQL_UsuarioUsuario_acesso_indicacao: TWideStringField
      FieldName = 'Usuario_acesso_indicacao'
      Size = 1
    end
    object SQL_UsuarioUsuario_acesso_cid: TWideStringField
      FieldName = 'Usuario_acesso_cid'
      Size = 1
    end
    object SQL_UsuarioUsuario_acesso_imp_env: TWideStringField
      FieldName = 'Usuario_acesso_imp_env'
      Size = 1
    end
    object SQL_UsuarioUsuario_acesso_imp_ficha: TWideStringField
      FieldName = 'Usuario_acesso_imp_ficha'
      Size = 1
    end
    object SQL_UsuarioUsuario_acesso_imp_fat: TWideStringField
      FieldName = 'Usuario_acesso_imp_fat'
      Size = 1
    end
    object SQL_UsuarioUsuario_acesso_imp_rec: TWideStringField
      FieldName = 'Usuario_acesso_imp_rec'
      Size = 1
    end
    object SQL_UsuarioUsuario_acesso_usuario: TWideStringField
      FieldName = 'Usuario_acesso_usuario'
      Size = 1
    end
    object SQL_UsuarioUsuario_acesso_medico: TWideStringField
      FieldName = 'Usuario_acesso_medico'
      Size = 1
    end
    object SQL_UsuarioUsuario_acesso_paciente_observacoes: TWideStringField
      FieldName = 'Usuario_acesso_paciente_observacoes'
      Size = 1
    end
    object SQL_UsuarioUsuario_acesso_paciente_prontuario: TWideStringField
      FieldName = 'Usuario_acesso_paciente_prontuario'
      Size = 1
    end
    object SQL_UsuarioUsuario_acesso_cirurgia: TWideStringField
      FieldName = 'Usuario_acesso_cirurgia'
      Size = 1
    end
    object SQL_UsuarioUsuario_acesso_adicionais: TWideStringField
      FieldName = 'Usuario_acesso_adicionais'
      Size = 1
    end
  end
  object SQL_Convenio: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 200
    Top = 184
  end
  object SQL_Indicacao: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 560
    Top = 184
  end
  object SQL_Agenda: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 320
    Top = 184
  end
  object SQL_Cid: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 520
    Top = 184
  end
  object SQL_Recibo: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 480
    Top = 184
  end
  object SQL_Medico: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    SQL.Strings = (
      'select * from Medico')
    Left = 440
    Top = 184
    object SQL_MedicoMedico_crm: TWideStringField
      FieldName = 'Medico_crm'
      Size = 10
    end
    object SQL_MedicoMedico_nome: TWideStringField
      FieldName = 'Medico_nome'
      Size = 160
    end
    object SQL_MedicoMedico_especialidade: TWideStringField
      FieldName = 'Medico_especialidade'
      Size = 160
    end
    object SQL_MedicoMedico_rg: TWideStringField
      FieldName = 'Medico_rg'
      Size = 15
    end
    object SQL_MedicoMedico_cpf: TWideStringField
      FieldName = 'Medico_cpf'
      Size = 14
    end
    object SQL_MedicoMedico_endereco: TWideStringField
      FieldName = 'Medico_endereco'
      Size = 80
    end
    object SQL_MedicoMedico_complemento: TWideStringField
      FieldName = 'Medico_complemento'
      Size = 80
    end
    object SQL_MedicoMedico_bairro: TWideStringField
      FieldName = 'Medico_bairro'
      Size = 80
    end
    object SQL_MedicoMedico_cidade: TWideStringField
      FieldName = 'Medico_cidade'
      Size = 80
    end
    object SQL_MedicoMedico_uf: TWideStringField
      FieldName = 'Medico_uf'
      Size = 2
    end
    object SQL_MedicoMedico_cep: TWideStringField
      FieldName = 'Medico_cep'
      Size = 9
    end
    object SQL_MedicoMedico_fone_consultorio: TWideStringField
      FieldName = 'Medico_fone_consultorio'
      Size = 40
    end
    object SQL_MedicoMedico_fone_residencia: TWideStringField
      FieldName = 'Medico_fone_residencia'
      Size = 40
    end
    object SQL_MedicoMedico_fone_celular: TWideStringField
      FieldName = 'Medico_fone_celular'
      Size = 40
    end
    object SQL_MedicoMedico_fone_fax: TWideStringField
      FieldName = 'Medico_fone_fax'
      Size = 40
    end
    object SQL_MedicoMedico_email: TWideStringField
      FieldName = 'Medico_email'
      Size = 80
    end
  end
  object SQL_Paciente_AG: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Paciente')
    Left = 80
    Top = 184
    object SQL_Paciente_AGPaciente_ficha: TWideStringField
      FieldName = 'Paciente_ficha'
      Size = 50
    end
    object SQL_Paciente_AGPaciente_nome: TWideStringField
      FieldName = 'Paciente_nome'
      Size = 80
    end
    object SQL_Paciente_AGPaciente_sobrenome: TWideStringField
      FieldName = 'Paciente_sobrenome'
      Size = 80
    end
    object SQL_Paciente_AGPaciente_rg: TWideStringField
      FieldName = 'Paciente_rg'
      Size = 15
    end
    object SQL_Paciente_AGPaciente_cpf: TWideStringField
      FieldName = 'Paciente_cpf'
      Size = 14
    end
    object SQL_Paciente_AGPaciente_dt_cadastro: TDateTimeField
      FieldName = 'Paciente_dt_cadastro'
    end
    object SQL_Paciente_AGPaciente_dt_nascimento: TDateTimeField
      FieldName = 'Paciente_dt_nascimento'
    end
    object SQL_Paciente_AGPaciente_indicacao: TFloatField
      FieldName = 'Paciente_indicacao'
    end
    object SQL_Paciente_AGPaciente_sexo: TWideStringField
      FieldName = 'Paciente_sexo'
      Size = 1
    end
    object SQL_Paciente_AGPaciente_situacao: TWideStringField
      FieldName = 'Paciente_situacao'
      Size = 1
    end
    object SQL_Paciente_AGPaciente_convenio: TFloatField
      FieldName = 'Paciente_convenio'
    end
    object SQL_Paciente_AGPaciente_matricula: TWideStringField
      FieldName = 'Paciente_matricula'
      Size = 25
    end
    object SQL_Paciente_AGPaciente_titular: TWideStringField
      FieldName = 'Paciente_titular'
      Size = 80
    end
    object SQL_Paciente_AGPaciente_dt_ult_consulta: TDateTimeField
      FieldName = 'Paciente_dt_ult_consulta'
    end
    object SQL_Paciente_AGPaciente_endereco: TWideStringField
      FieldName = 'Paciente_endereco'
      Size = 1
    end
    object SQL_Paciente_AGPaciente_logradouro: TWideStringField
      FieldName = 'Paciente_logradouro'
      Size = 80
    end
    object SQL_Paciente_AGPaciente_complemento: TWideStringField
      FieldName = 'Paciente_complemento'
      Size = 80
    end
    object SQL_Paciente_AGPaciente_bairro: TWideStringField
      FieldName = 'Paciente_bairro'
      Size = 80
    end
    object SQL_Paciente_AGPaciente_cidade: TWideStringField
      FieldName = 'Paciente_cidade'
      Size = 80
    end
    object SQL_Paciente_AGPaciente_cep: TWideStringField
      FieldName = 'Paciente_cep'
      Size = 9
    end
    object SQL_Paciente_AGPaciente_uf: TWideStringField
      FieldName = 'Paciente_uf'
      Size = 2
    end
    object SQL_Paciente_AGPaciente_instrucao: TWideStringField
      FieldName = 'Paciente_instrucao'
      Size = 1
    end
    object SQL_Paciente_AGPaciente_estado_civil: TWideStringField
      FieldName = 'Paciente_estado_civil'
      Size = 1
    end
    object SQL_Paciente_AGPaciente_naturalidade: TWideStringField
      FieldName = 'Paciente_naturalidade'
      Size = 80
    end
    object SQL_Paciente_AGPaciente_profissao: TWideStringField
      FieldName = 'Paciente_profissao'
      Size = 80
    end
    object SQL_Paciente_AGPaciente_email: TWideStringField
      FieldName = 'Paciente_email'
      Size = 80
    end
    object SQL_Paciente_AGPaciente_fone_residencial: TWideStringField
      FieldName = 'Paciente_fone_residencial'
      Size = 40
    end
    object SQL_Paciente_AGPaciente_fone_comercial: TWideStringField
      FieldName = 'Paciente_fone_comercial'
      Size = 40
    end
    object SQL_Paciente_AGPaciente_fone_fax: TWideStringField
      FieldName = 'Paciente_fone_fax'
      Size = 40
    end
    object SQL_Paciente_AGPaciente_fone_celular: TWideStringField
      FieldName = 'Paciente_fone_celular'
      Size = 40
    end
    object SQL_Paciente_AGPaciente_foto: TBlobField
      FieldName = 'Paciente_foto'
    end
    object SQL_Paciente_AGPaciente_nome_sobrenome: TWideStringField
      FieldName = 'Paciente_nome_sobrenome'
      Size = 160
    end
    object SQL_Paciente_AGPaciente_observacao: TMemoField
      FieldName = 'Paciente_observacao'
      BlobType = ftMemo
    end
    object SQL_Paciente_AGPaciente_medico: TFloatField
      FieldName = 'Paciente_medico'
    end
    object SQL_Paciente_AGPaciente_foto_tipo: TWideStringField
      FieldName = 'Paciente_foto_tipo'
      Size = 3
    end
    object SQL_Paciente_AGPaciente_prontuario: TMemoField
      FieldName = 'Paciente_prontuario'
      BlobType = ftMemo
    end
  end
  object SQL_Convenio_AG: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 240
    Top = 184
  end
  object SQL_Convenio_FAT: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 280
    Top = 184
  end
  object SQL_Agenda_FAT: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 360
    Top = 184
  end
  object SQL_Conexao: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Conexao')
    Left = 400
    Top = 184
    object SQL_Conexaoconexao_caminho: TWideStringField
      FieldName = 'conexao_caminho'
      Size = 100
    end
    object SQL_Conexaoconexao_registro: TWideStringField
      FieldName = 'conexao_registro'
      Size = 16
    end
  end
  object DS_Conexao: TDataSource
    DataSet = SQL_Conexao
    Left = 400
    Top = 80
  end
  object SQL_Paciente_Lista: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Paciente')
    Left = 120
    Top = 184
    object SQL_Paciente_ListaPaciente_ficha: TWideStringField
      FieldName = 'Paciente_ficha'
      Size = 50
    end
    object SQL_Paciente_ListaPaciente_nome: TWideStringField
      FieldName = 'Paciente_nome'
      Size = 80
    end
    object SQL_Paciente_ListaPaciente_sobrenome: TWideStringField
      FieldName = 'Paciente_sobrenome'
      Size = 80
    end
    object SQL_Paciente_ListaPaciente_rg: TWideStringField
      FieldName = 'Paciente_rg'
      Size = 15
    end
    object SQL_Paciente_ListaPaciente_cpf: TWideStringField
      FieldName = 'Paciente_cpf'
      Size = 14
    end
    object SQL_Paciente_ListaPaciente_dt_cadastro: TDateTimeField
      FieldName = 'Paciente_dt_cadastro'
    end
    object SQL_Paciente_ListaPaciente_dt_nascimento: TDateTimeField
      FieldName = 'Paciente_dt_nascimento'
    end
    object SQL_Paciente_ListaPaciente_indicacao: TFloatField
      FieldName = 'Paciente_indicacao'
    end
    object SQL_Paciente_ListaPaciente_sexo: TWideStringField
      FieldName = 'Paciente_sexo'
      Size = 1
    end
    object SQL_Paciente_ListaPaciente_situacao: TWideStringField
      FieldName = 'Paciente_situacao'
      Size = 1
    end
    object SQL_Paciente_ListaPaciente_convenio: TFloatField
      FieldName = 'Paciente_convenio'
    end
    object SQL_Paciente_ListaPaciente_matricula: TWideStringField
      FieldName = 'Paciente_matricula'
      Size = 25
    end
    object SQL_Paciente_ListaPaciente_titular: TWideStringField
      FieldName = 'Paciente_titular'
      Size = 80
    end
    object SQL_Paciente_ListaPaciente_dt_ult_consulta: TDateTimeField
      FieldName = 'Paciente_dt_ult_consulta'
    end
    object SQL_Paciente_ListaPaciente_endereco: TWideStringField
      FieldName = 'Paciente_endereco'
      Size = 1
    end
    object SQL_Paciente_ListaPaciente_logradouro: TWideStringField
      FieldName = 'Paciente_logradouro'
      Size = 80
    end
    object SQL_Paciente_ListaPaciente_complemento: TWideStringField
      FieldName = 'Paciente_complemento'
      Size = 80
    end
    object SQL_Paciente_ListaPaciente_bairro: TWideStringField
      FieldName = 'Paciente_bairro'
      Size = 80
    end
    object SQL_Paciente_ListaPaciente_cidade: TWideStringField
      FieldName = 'Paciente_cidade'
      Size = 80
    end
    object SQL_Paciente_ListaPaciente_cep: TWideStringField
      FieldName = 'Paciente_cep'
      Size = 9
    end
    object SQL_Paciente_ListaPaciente_uf: TWideStringField
      FieldName = 'Paciente_uf'
      Size = 2
    end
    object SQL_Paciente_ListaPaciente_instrucao: TWideStringField
      FieldName = 'Paciente_instrucao'
      Size = 1
    end
    object SQL_Paciente_ListaPaciente_estado_civil: TWideStringField
      FieldName = 'Paciente_estado_civil'
      Size = 1
    end
    object SQL_Paciente_ListaPaciente_naturalidade: TWideStringField
      FieldName = 'Paciente_naturalidade'
      Size = 80
    end
    object SQL_Paciente_ListaPaciente_profissao: TWideStringField
      FieldName = 'Paciente_profissao'
      Size = 80
    end
    object SQL_Paciente_ListaPaciente_email: TWideStringField
      FieldName = 'Paciente_email'
      Size = 80
    end
    object SQL_Paciente_ListaPaciente_fone_residencial: TWideStringField
      FieldName = 'Paciente_fone_residencial'
      Size = 40
    end
    object SQL_Paciente_ListaPaciente_fone_comercial: TWideStringField
      FieldName = 'Paciente_fone_comercial'
      Size = 40
    end
    object SQL_Paciente_ListaPaciente_fone_fax: TWideStringField
      FieldName = 'Paciente_fone_fax'
      Size = 40
    end
    object SQL_Paciente_ListaPaciente_fone_celular: TWideStringField
      FieldName = 'Paciente_fone_celular'
      Size = 40
    end
    object SQL_Paciente_ListaPaciente_foto: TBlobField
      FieldName = 'Paciente_foto'
    end
    object SQL_Paciente_ListaPaciente_nome_sobrenome: TWideStringField
      FieldName = 'Paciente_nome_sobrenome'
      Size = 160
    end
    object SQL_Paciente_ListaPaciente_observacao: TMemoField
      FieldName = 'Paciente_observacao'
      BlobType = ftMemo
    end
    object SQL_Paciente_ListaPaciente_medico: TFloatField
      FieldName = 'Paciente_medico'
    end
    object SQL_Paciente_ListaPaciente_foto_tipo: TWideStringField
      FieldName = 'Paciente_foto_tipo'
      Size = 3
    end
    object SQL_Paciente_ListaPaciente_prontuario: TMemoField
      FieldName = 'Paciente_prontuario'
      BlobType = ftMemo
    end
  end
  object DS_Paciente_Lista: TDataSource
    DataSet = SQL_Paciente_Lista
    Left = 120
    Top = 80
  end
  object Conexao_Principal: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\ConsulTEX\Tabela' +
      's\ConsulTEX.mdb;Mode=ReadWrite;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 16
  end
  object SQL_Paciente_Imagem: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Paciente')
    Left = 160
    Top = 184
    object SQL_Paciente_ImagemPaciente_ficha: TWideStringField
      FieldName = 'Paciente_ficha'
      Size = 50
    end
    object SQL_Paciente_ImagemPaciente_nome: TWideStringField
      FieldName = 'Paciente_nome'
      Size = 80
    end
    object SQL_Paciente_ImagemPaciente_sobrenome: TWideStringField
      FieldName = 'Paciente_sobrenome'
      Size = 80
    end
    object SQL_Paciente_ImagemPaciente_rg: TWideStringField
      FieldName = 'Paciente_rg'
      Size = 15
    end
    object SQL_Paciente_ImagemPaciente_cpf: TWideStringField
      FieldName = 'Paciente_cpf'
      Size = 14
    end
    object SQL_Paciente_ImagemPaciente_dt_cadastro: TDateTimeField
      FieldName = 'Paciente_dt_cadastro'
    end
    object SQL_Paciente_ImagemPaciente_dt_nascimento: TDateTimeField
      FieldName = 'Paciente_dt_nascimento'
    end
    object SQL_Paciente_ImagemPaciente_indicacao: TFloatField
      FieldName = 'Paciente_indicacao'
    end
    object SQL_Paciente_ImagemPaciente_sexo: TWideStringField
      FieldName = 'Paciente_sexo'
      Size = 1
    end
    object SQL_Paciente_ImagemPaciente_situacao: TWideStringField
      FieldName = 'Paciente_situacao'
      Size = 1
    end
    object SQL_Paciente_ImagemPaciente_convenio: TFloatField
      FieldName = 'Paciente_convenio'
    end
    object SQL_Paciente_ImagemPaciente_matricula: TWideStringField
      FieldName = 'Paciente_matricula'
      Size = 25
    end
    object SQL_Paciente_ImagemPaciente_titular: TWideStringField
      FieldName = 'Paciente_titular'
      Size = 80
    end
    object SQL_Paciente_ImagemPaciente_dt_ult_consulta: TDateTimeField
      FieldName = 'Paciente_dt_ult_consulta'
    end
    object SQL_Paciente_ImagemPaciente_endereco: TWideStringField
      FieldName = 'Paciente_endereco'
      Size = 1
    end
    object SQL_Paciente_ImagemPaciente_logradouro: TWideStringField
      FieldName = 'Paciente_logradouro'
      Size = 80
    end
    object SQL_Paciente_ImagemPaciente_complemento: TWideStringField
      FieldName = 'Paciente_complemento'
      Size = 80
    end
    object SQL_Paciente_ImagemPaciente_bairro: TWideStringField
      FieldName = 'Paciente_bairro'
      Size = 80
    end
    object SQL_Paciente_ImagemPaciente_cidade: TWideStringField
      FieldName = 'Paciente_cidade'
      Size = 80
    end
    object SQL_Paciente_ImagemPaciente_cep: TWideStringField
      FieldName = 'Paciente_cep'
      Size = 9
    end
    object SQL_Paciente_ImagemPaciente_uf: TWideStringField
      FieldName = 'Paciente_uf'
      Size = 2
    end
    object SQL_Paciente_ImagemPaciente_instrucao: TWideStringField
      FieldName = 'Paciente_instrucao'
      Size = 1
    end
    object SQL_Paciente_ImagemPaciente_estado_civil: TWideStringField
      FieldName = 'Paciente_estado_civil'
      Size = 1
    end
    object SQL_Paciente_ImagemPaciente_naturalidade: TWideStringField
      FieldName = 'Paciente_naturalidade'
      Size = 80
    end
    object SQL_Paciente_ImagemPaciente_profissao: TWideStringField
      FieldName = 'Paciente_profissao'
      Size = 80
    end
    object SQL_Paciente_ImagemPaciente_email: TWideStringField
      FieldName = 'Paciente_email'
      Size = 80
    end
    object SQL_Paciente_ImagemPaciente_fone_residencial: TWideStringField
      FieldName = 'Paciente_fone_residencial'
      Size = 40
    end
    object SQL_Paciente_ImagemPaciente_fone_comercial: TWideStringField
      FieldName = 'Paciente_fone_comercial'
      Size = 40
    end
    object SQL_Paciente_ImagemPaciente_fone_fax: TWideStringField
      FieldName = 'Paciente_fone_fax'
      Size = 40
    end
    object SQL_Paciente_ImagemPaciente_fone_celular: TWideStringField
      FieldName = 'Paciente_fone_celular'
      Size = 40
    end
    object SQL_Paciente_ImagemPaciente_foto: TBlobField
      FieldName = 'Paciente_foto'
    end
    object SQL_Paciente_ImagemPaciente_nome_sobrenome: TWideStringField
      FieldName = 'Paciente_nome_sobrenome'
      Size = 160
    end
    object SQL_Paciente_ImagemPaciente_observacao: TMemoField
      FieldName = 'Paciente_observacao'
      BlobType = ftMemo
    end
    object SQL_Paciente_ImagemPaciente_medico: TFloatField
      FieldName = 'Paciente_medico'
    end
    object SQL_Paciente_ImagemPaciente_foto_tipo: TWideStringField
      FieldName = 'Paciente_foto_tipo'
      Size = 3
    end
    object SQL_Paciente_ImagemPaciente_prontuario: TMemoField
      FieldName = 'Paciente_prontuario'
      BlobType = ftMemo
    end
  end
  object DS_Paciente_Imagem: TDataSource
    DataSet = SQL_Paciente_Imagem
    Left = 160
    Top = 80
  end
  object DS_Comunitario: TDataSource
    DataSet = SQL_Comunitario
    Left = 640
    Top = 80
  end
  object SQL_Comunitario: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 640
    Top = 184
  end
  object DS_Cirurgia: TDataSource
    DataSet = SQL_Cirurgia
    Left = 40
    Top = 128
  end
  object SQL_Cirurgia: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 40
    Top = 232
  end
  object DS_Adicionais: TDataSource
    DataSet = SQL_Adicionais
    Left = 80
    Top = 128
  end
  object SQL_Adicionais: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 80
    Top = 232
  end
  object DS_Cirurgia_AG: TDataSource
    DataSet = SQL_Cirurgia_AG
    Left = 120
    Top = 128
  end
  object SQL_Cirurgia_AG: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 120
    Top = 232
  end
  object DS_Comunitario_Aux: TDataSource
    DataSet = SQL_Comunitario_Aux
    Left = 160
    Top = 128
  end
  object SQL_Comunitario_Aux: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 160
    Top = 232
  end
  object DS_Adicionais_AG: TDataSource
    DataSet = SQL_Adicionais_AG
    Left = 200
    Top = 128
  end
  object SQL_Adicionais_AG: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 200
    Top = 232
  end
  object DS_Adicionais_Lista: TDataSource
    DataSet = SQL_Adicionais_Lista
    Left = 240
    Top = 128
  end
  object SQL_Adicionais_Lista: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 240
    Top = 232
  end
  object SQL_Rel_Detalhado: TADOQuery
    Connection = Conexao_Principal
    Parameters = <>
    Left = 280
    Top = 232
  end
  object DS_Rel_Detalhado: TDataSource
    DataSet = SQL_Rel_Detalhado
    Left = 280
    Top = 128
  end
  object SQL_Rel_Controle_Pagamentos: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select'
      '  A.*,'
      '  C.Convenio_numero,'
      '  C.Convenio_qtde_ch,'
      '  C.Convenio_valor_ch,'
      '  C.Convenio_valor_cirurgia'
      'From Agenda A, Convenio C'
      'Where (A.Agenda_convenio = C.Convenio_numero)'
      'Order By A.Agenda_data')
    Left = 320
    Top = 232
    object SQL_Rel_Controle_PagamentosAgenda_registro: TAutoIncField
      FieldName = 'Agenda_registro'
      ReadOnly = True
    end
    object SQL_Rel_Controle_PagamentosAgenda_medico_crm: TWideStringField
      FieldName = 'Agenda_medico_crm'
      Size = 10
    end
    object SQL_Rel_Controle_PagamentosAgenda_data: TDateTimeField
      FieldName = 'Agenda_data'
    end
    object SQL_Rel_Controle_PagamentosAgenda_hora: TWideStringField
      FieldName = 'Agenda_hora'
      Size = 5
    end
    object SQL_Rel_Controle_PagamentosAgenda_ficha: TWideStringField
      FieldName = 'Agenda_ficha'
      Size = 50
    end
    object SQL_Rel_Controle_PagamentosAgenda_descricao: TWideStringField
      FieldName = 'Agenda_descricao'
      Size = 160
    end
    object SQL_Rel_Controle_PagamentosAgenda_tipo: TWideStringField
      FieldName = 'Agenda_tipo'
    end
    object SQL_Rel_Controle_PagamentosAgenda_tipo_cirurgia: TWideStringField
      FieldName = 'Agenda_tipo_cirurgia'
    end
    object SQL_Rel_Controle_PagamentosAgenda_cirurgia_descricao: TWideStringField
      FieldName = 'Agenda_cirurgia_descricao'
      Size = 255
    end
    object SQL_Rel_Controle_PagamentosAgenda_quantidade_ch: TIntegerField
      FieldName = 'Agenda_quantidade_ch'
    end
    object SQL_Rel_Controle_PagamentosAgenda_valor_ch: TFloatField
      FieldName = 'Agenda_valor_ch'
    end
    object SQL_Rel_Controle_PagamentosAgenda_status: TWideStringField
      FieldName = 'Agenda_status'
    end
    object SQL_Rel_Controle_PagamentosAgenda_convenio: TFloatField
      FieldName = 'Agenda_convenio'
    end
    object SQL_Rel_Controle_PagamentosAgenda_descricao_convenio: TWideStringField
      FieldName = 'Agenda_descricao_convenio'
      Size = 40
    end
    object SQL_Rel_Controle_PagamentosAgenda_identifica_adicional: TWideStringField
      FieldName = 'Agenda_identifica_adicional'
      Size = 255
    end
    object SQL_Rel_Controle_PagamentosAgenda_valor_material_cirurgia: TFloatField
      FieldName = 'Agenda_valor_material_cirurgia'
    end
    object SQL_Rel_Controle_PagamentosAgenda_observacao: TWideStringField
      FieldName = 'Agenda_observacao'
      Size = 30
    end
    object SQL_Rel_Controle_PagamentosAgenda_valor_cirurgia: TFloatField
      FieldName = 'Agenda_valor_cirurgia'
    end
    object SQL_Rel_Controle_PagamentosAgenda_pago: TWideStringField
      FieldName = 'Agenda_pago'
      Size = 2
    end
    object SQL_Rel_Controle_PagamentosAgenda_valor_adicional: TFloatField
      FieldName = 'Agenda_valor_adicional'
    end
    object SQL_Rel_Controle_PagamentosConvenio_numero: TAutoIncField
      FieldName = 'Convenio_numero'
      ReadOnly = True
    end
    object SQL_Rel_Controle_PagamentosConvenio_qtde_ch: TFloatField
      FieldName = 'Convenio_qtde_ch'
    end
    object SQL_Rel_Controle_PagamentosConvenio_valor_ch: TFloatField
      FieldName = 'Convenio_valor_ch'
    end
    object SQL_Rel_Controle_PagamentosConvenio_valor_cirurgia: TFloatField
      FieldName = 'Convenio_valor_cirurgia'
    end
  end
  object DS_Rel_Controle_Pagamentos: TDataSource
    DataSet = SQL_Rel_Controle_Pagamentos
    Left = 320
    Top = 128
  end
  object DS_Etiquetas: TDataSource
    DataSet = SQL_Etiquetas
    Left = 360
    Top = 128
  end
  object SQL_Etiquetas: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From Etiquetas E Order By E.Numero')
    Left = 360
    Top = 232
    object SQL_EtiquetasNumero: TAutoIncField
      FieldName = 'Numero'
      ReadOnly = True
    end
    object SQL_EtiquetasA1: TWideStringField
      FieldName = 'A1'
      Size = 1
    end
    object SQL_EtiquetasA2: TWideStringField
      FieldName = 'A2'
      Size = 1
    end
    object SQL_EtiquetasPaciente1: TWideStringField
      FieldName = 'Paciente1'
      Size = 255
    end
    object SQL_EtiquetasPaciente2: TWideStringField
      FieldName = 'Paciente2'
      Size = 255
    end
    object SQL_EtiquetasEndereco1: TWideStringField
      FieldName = 'Endereco1'
      Size = 255
    end
    object SQL_EtiquetasEndereco2: TWideStringField
      FieldName = 'Endereco2'
      Size = 255
    end
    object SQL_EtiquetasBairro_Cidade_Estado1: TWideStringField
      FieldName = 'Bairro_Cidade_Estado1'
      Size = 255
    end
    object SQL_EtiquetasBairro_Cidade_Estado2: TWideStringField
      FieldName = 'Bairro_Cidade_Estado2'
      Size = 255
    end
    object SQL_EtiquetasCEP1: TWideStringField
      FieldName = 'CEP1'
      Size = 14
    end
    object SQL_EtiquetasCEP2: TWideStringField
      FieldName = 'CEP2'
      Size = 14
    end
  end
  object DS_PacienteListaGeral: TDataSource
    DataSet = SQL_PacienteListaGeral
    Left = 400
    Top = 128
  end
  object SQL_PacienteListaGeral: TADOQuery
    Connection = Conexao_Principal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select'
      '  Paciente_ficha, '
      '  Paciente_caracteres, '
      '  Paciente_nome_sobrenome'
      'From '
      '  Paciente '
      'Order By '
      '  Paciente_nome_sobrenome')
    Left = 400
    Top = 232
    object SQL_PacienteListaGeralPaciente_ficha: TWideStringField
      DisplayWidth = 18
      FieldName = 'Paciente_ficha'
      Size = 50
    end
    object SQL_PacienteListaGeralPaciente_caracteres: TIntegerField
      DisplayWidth = 24
      FieldName = 'Paciente_caracteres'
    end
    object SQL_PacienteListaGeralPaciente_nome_sobrenome: TWideStringField
      DisplayWidth = 41
      FieldName = 'Paciente_nome_sobrenome'
      Size = 160
    end
  end
end
