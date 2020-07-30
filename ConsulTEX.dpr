program ConsulTEX;

uses
  Forms,
  Cons_02 in 'Cons_02.pas' {Cons02},
  Cons_10 in 'Cons_10.pas' {Preferencia: TFrame},
  Cons_00 in 'Cons_00.pas' {Paciente: TFrame},
  Conexao_BD in 'Conexao_BD.pas' {conexaoBD: TDataModule},
  Rotinas_Gerais in 'Rotinas_Gerais.pas',
  Cons_04 in 'Cons_04.pas' {Convenio: TFrame},
  Cons_05 in 'Cons_05.pas' {Indicacao: TFrame},
  Agen_00 in 'Agen_00.pas' {Agenda},
  Rel_00 in 'Rel_00.pas' {Rel_Horario},
  Rel_01 in 'Rel_01.pas' {Rel_Ficha_Paciente},
  Rel_02 in 'Rel_02.pas' {Rel_Envelope},
  Cons_06 in 'Cons_06.pas' {Cid: TFrame},
  Rel_03 in 'Rel_03.pas' {Recibo: TFrame},
  Rel_04 in 'Rel_04.pas' {Faturamento: TFrame},
  Rel_03A in 'Rel_03A.pas' {Rel_Recibo},
  Rel_03B in 'Rel_03B.pas' {Rel_Ctrl_Recibo},
  Rel_04A in 'Rel_04A.pas' {Rel_Faturamento},
  Login_00 in 'Login_00.pas' {Login00},
  Cons_07 in 'Cons_07.pas' {Medico: TFrame},
  Conexao_00 in 'Conexao_00.pas' {Conexao},
  Foto_00 in 'Foto_00.pas' {Foto},
  Cons_08 in 'Cons_08.pas' {Cirurgia: TFrame},
  Cons_09 in 'Cons_09.pas' {Adicionais: TFrame},
  Agen_01 in 'Agen_01.pas' {Adicionais_AG},
  Rel_04B in 'Rel_04B.pas' {Rel_Faturamento_Detalhado},
  Sobre_00 in 'Sobre_00.pas' {Sobre00},
  Ativo_00 in 'Ativo_00.pas' {Ativo00},
  Registra_ConsulTEX in 'Registra_ConsulTEX.pas' {RegistraConsultex},
  Backup_Reparacao in 'Backup_Reparacao.pas' {BackupReparacao},
  Ajuda_00 in 'Ajuda_00.pas' {Ajuda00},
  Controle_Pagamento_00 in 'Controle_Pagamento_00.pas' {Controle_Pagamento00},
  Etiquetas_00 in 'Etiquetas_00.pas' {Etiquetas00},
  Rel_Etiquetas_00 in 'Rel_Etiquetas_00.pas' {Rel_Etiquetas00},
  ListaGeralPacientes_00 in 'ListaGeralPacientes_00.pas' {ListaGeralPacientes00},
  Rel_ListaGeralPacientes_00 in 'Rel_ListaGeralPacientes_00.pas' {Rel_ListaGeralPacientes00},
  Rel_Controle_Pagamentos_00 in 'Rel_Controle_Pagamentos_00.pas' {Rel_Controle_Pagamentos00};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ConsulTEX';
  Application.CreateForm(TLogin00, Login00);
  Application.CreateForm(TconexaoBD, conexaoBD);
  Application.CreateForm(TAgenda, Agenda);
  Application.CreateForm(TRel_Controle_Pagamentos00, Rel_Controle_Pagamentos00);
  Application.CreateForm(TControle_Pagamento00, Controle_Pagamento00);
  Application.CreateForm(TEtiquetas00, Etiquetas00);
  Application.CreateForm(TRel_Etiquetas00, Rel_Etiquetas00);
  Application.CreateForm(TListaGeralPacientes00, ListaGeralPacientes00);
  Application.CreateForm(TRel_ListaGeralPacientes00, Rel_ListaGeralPacientes00);
  Application.Run;
end.
