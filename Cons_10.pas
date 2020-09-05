unit Cons_10;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  TPreferencia = class(TFrame)
    GroupBox7: TGroupBox;
    Button4: TButton;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    usuario_nome: TEdit;
    usuario_senha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel4: TPanel;
    Label3: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    paciente_t: TRadioButton;
    paciente_s: TRadioButton;
    paciente_l: TRadioButton;
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
    Panel16: TPanel;
    agenda_t: TRadioButton;
    agenda_s: TRadioButton;
    agenda_l: TRadioButton;
    Panel17: TPanel;
    convenio_t: TRadioButton;
    convenio_s: TRadioButton;
    convenio_l: TRadioButton;
    Panel18: TPanel;
    indicacao_t: TRadioButton;
    indicacao_s: TRadioButton;
    indicacao_l: TRadioButton;
    Panel19: TPanel;
    cid_t: TRadioButton;
    cid_s: TRadioButton;
    cid_l: TRadioButton;
    Panel20: TPanel;
    paciente_env_t: TRadioButton;
    paciente_env_s: TRadioButton;
    paciente_env_l: TRadioButton;
    Panel21: TPanel;
    ficha_imp_t: TRadioButton;
    ficha_imp_s: TRadioButton;
    ficha_imp_l: TRadioButton;
    Panel22: TPanel;
    faturamento_imp_t: TRadioButton;
    faturamento_imp_s: TRadioButton;
    faturamento_imp_l: TRadioButton;
    Panel23: TPanel;
    recibo_imp_t: TRadioButton;
    recibo_imp_s: TRadioButton;
    recibo_imp_l: TRadioButton;
    Panel24: TPanel;
    usuario_t: TRadioButton;
    usuario_s: TRadioButton;
    usuario_l: TRadioButton;
    Panel25: TPanel;
    medico_t: TRadioButton;
    medico_s: TRadioButton;
    medico_l: TRadioButton;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DB_usuario_nome: TDBEdit;
    DB_usuario_acesso_agenda: TDBEdit;
    DB_usuario_acesso_paciente: TDBEdit;
    DB_usuario_acesso_convenio: TDBEdit;
    DB_usuario_acesso_indicacao: TDBEdit;
    DB_usuario_acesso_cid: TDBEdit;
    DB_usuario_acesso_imp_env: TDBEdit;
    DB_usuario_acesso_imp_ficha: TDBEdit;
    DB_usuario_acesso_imp_fat: TDBEdit;
    DB_usuario_senha: TDBEdit;
    DB_usuario_acesso_imp_rec: TDBEdit;
    DB_usuario_acesso_usuario: TDBEdit;
    DB_usuario_acesso_medico: TDBEdit;
    Panel26: TPanel;
    prontuario_t: TRadioButton;
    prontuario_s: TRadioButton;
    prontuario_l: TRadioButton;
    Panel27: TPanel;
    observacoes_t: TRadioButton;
    observacoes_s: TRadioButton;
    observacoes_l: TRadioButton;
    Panel28: TPanel;
    Label18: TLabel;
    Panel29: TPanel;
    Label19: TLabel;
    DB_usuario_acesso_prontuario: TDBEdit;
    DB_usuario_acesso_observacoes: TDBEdit;
    Panel30: TPanel;
    Label20: TLabel;
    Panel31: TPanel;
    Label21: TLabel;
    Panel32: TPanel;
    cirurgia_t: TRadioButton;
    cirurgia_s: TRadioButton;
    cirurgia_l: TRadioButton;
    Panel33: TPanel;
    adicionais_t: TRadioButton;
    adicionais_s: TRadioButton;
    adicionais_l: TRadioButton;
    DB_usuario_acesso_cirurgia: TDBEdit;
    DB_usuario_acesso_adicionais: TDBEdit;
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure usuario_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure usuario_senhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Rotinas_Gerais, Conexao_BD, Cons_02;

{$R *.dfm}

procedure TPreferencia.Button4Click(Sender: TObject);
begin
     Fecha_Preferencia();
end;

procedure TPreferencia.DBGrid1CellClick(Column: TColumn);
begin
     Cursor_Ampulheta();

     usuario_nome.Text  := DB_usuario_nome.Text;
     usuario_senha.Text := DB_usuario_senha.Text;

     if DB_usuario_acesso_agenda.Text = 'T' then
        begin
        agenda_t.Checked   := True;
        agenda_s.Checked   := False;
        agenda_l.Checked   := False;
        end
     else if DB_usuario_acesso_agenda.Text = 'S' then
        begin
        agenda_t.Checked   := False;
        agenda_s.Checked   := True;
        agenda_l.Checked   := False;
        end
     else if DB_usuario_acesso_agenda.Text = 'L' then
        begin
        agenda_t.Checked   := False;
        agenda_s.Checked   := False;
        agenda_l.Checked   := True;
     end;

     if DB_usuario_acesso_paciente.Text = 'T' then
        begin
        paciente_t.Checked   := True;
        paciente_s.Checked   := False;
        paciente_l.Checked   := False;
        end
     else if DB_usuario_acesso_paciente.Text = 'S' then
        begin
        paciente_t.Checked   := False;
        paciente_s.Checked   := True;
        paciente_l.Checked   := False;
        end
     else if DB_usuario_acesso_paciente.Text = 'L' then
        begin
        paciente_t.Checked   := False;
        paciente_s.Checked   := False;
        paciente_l.Checked   := True;
     end;

     if DB_usuario_acesso_prontuario.Text = 'T' then
        begin
        prontuario_t.Checked   := True;
        prontuario_s.Checked   := False;
        prontuario_l.Checked   := False;
        end
     else if DB_usuario_acesso_prontuario.Text = 'S' then
        begin
        prontuario_t.Checked   := False;
        prontuario_s.Checked   := True;
        prontuario_l.Checked   := False;
        end
     else if DB_usuario_acesso_prontuario.Text = 'L' then
        begin
        prontuario_t.Checked   := False;
        prontuario_s.Checked   := False;
        prontuario_l.Checked   := True;
     end;

     if DB_usuario_acesso_observacoes.Text = 'T' then
        begin
        observacoes_t.Checked   := True;
        observacoes_s.Checked   := False;
        observacoes_l.Checked   := False;
        end
     else if DB_usuario_acesso_observacoes.Text = 'S' then
        begin
        observacoes_t.Checked   := False;
        observacoes_s.Checked   := True;
        observacoes_l.Checked   := False;
        end
     else if DB_usuario_acesso_observacoes.Text = 'L' then
        begin
        observacoes_t.Checked   := False;
        observacoes_s.Checked   := False;
        observacoes_l.Checked   := True;
     end;

     if DB_usuario_acesso_convenio.Text = 'T' then
        begin
        convenio_t.Checked   := True;
        convenio_s.Checked   := False;
        convenio_l.Checked   := False;
        end
     else if DB_usuario_acesso_convenio.Text = 'S' then
        begin
        convenio_t.Checked   := False;
        convenio_s.Checked   := True;
        convenio_l.Checked   := False;
        end
     else if DB_usuario_acesso_convenio.Text = 'L' then
        begin
        convenio_t.Checked   := False;
        convenio_s.Checked   := False;
        convenio_l.Checked   := True
     end;

     if DB_usuario_acesso_indicacao.Text = 'T' then
        begin
        indicacao_t.Checked   := True;
        indicacao_s.Checked   := False;
        indicacao_l.Checked   := False;
        end
     else if DB_usuario_acesso_indicacao.Text = 'S' then
        begin
        indicacao_t.Checked   := False;
        indicacao_s.Checked   := True;
        indicacao_l.Checked   := False;
        end
     else if DB_usuario_acesso_indicacao.Text = 'L' then
        begin
        indicacao_t.Checked   := False;
        indicacao_s.Checked   := False;
        indicacao_l.Checked   := True;
     end;

     if DB_usuario_acesso_cid.Text = 'T' then
        begin
        cid_t.Checked   := True;
        cid_s.Checked   := False;
        cid_l.Checked   := False;
        end
     else if DB_usuario_acesso_cid.Text = 'S' then
        begin
        cid_t.Checked   := False;
        cid_s.Checked   := True;
        cid_l.Checked   := False;
        end
     else if DB_usuario_acesso_cid.Text = 'L' then
        begin
        cid_t.Checked   := False;
        cid_s.Checked   := False;
        cid_l.Checked   := True;
     end;

     if DB_usuario_acesso_imp_env.Text = 'T' then
        begin
        paciente_env_t.Checked   := True;
        paciente_env_s.Checked   := False;
        paciente_env_l.Checked   := False;
        end
     else if DB_usuario_acesso_imp_env.Text = 'S' then
        begin
        paciente_env_t.Checked   := False;
        paciente_env_s.Checked   := True;
        paciente_env_l.Checked   := False;
        end
     else if DB_usuario_acesso_imp_env.Text = 'L' then
        begin
        paciente_env_t.Checked   := False;
        paciente_env_s.Checked   := False;
        paciente_env_l.Checked   := True;
     end;

     if DB_usuario_acesso_imp_ficha.Text = 'T' then
        begin
        ficha_imp_t.Checked   := True;
        ficha_imp_s.Checked   := False;
        ficha_imp_l.Checked   := False;
        end
     else if DB_usuario_acesso_imp_ficha.Text = 'S' then
        begin
        ficha_imp_t.Checked   := False;
        ficha_imp_s.Checked   := True;
        ficha_imp_l.Checked   := False;
        end
     else if DB_usuario_acesso_imp_ficha.Text = 'L' then
        begin
        ficha_imp_t.Checked   := False;
        ficha_imp_s.Checked   := False;
        ficha_imp_l.Checked   := True;
     end;

     if DB_usuario_acesso_imp_fat.Text = 'T' then
        begin
        faturamento_imp_t.Checked   := True;
        faturamento_imp_s.Checked   := False;
        faturamento_imp_l.Checked   := False;
        end
     else if DB_usuario_acesso_imp_fat.Text = 'S' then
        begin
        faturamento_imp_t.Checked   := False;
        faturamento_imp_s.Checked   := True;
        faturamento_imp_l.Checked   := False;
        end
     else if DB_usuario_acesso_imp_fat.Text = 'L' then
        begin
        faturamento_imp_t.Checked   := False;
        faturamento_imp_s.Checked   := False;
        faturamento_imp_l.Checked   := True;
     end;

     if DB_usuario_acesso_imp_rec.Text = 'T' then
        begin
        recibo_imp_t.Checked   := True;
        recibo_imp_s.Checked   := False;
        recibo_imp_l.Checked   := False;
        end
     else if DB_usuario_acesso_imp_rec.Text = 'S' then
        begin
        recibo_imp_t.Checked   := False;
        recibo_imp_s.Checked   := True;
        recibo_imp_l.Checked   := False;
        end
     else if DB_usuario_acesso_imp_rec.Text = 'L' then
        begin
        recibo_imp_t.Checked   := False;
        recibo_imp_s.Checked   := False;
        recibo_imp_l.Checked   := True;
     end;

     if DB_usuario_acesso_usuario.Text = 'T' then
        begin
        usuario_t.Checked   := True;
        usuario_s.Checked   := False;
        usuario_l.Checked   := False;
        end
     else if DB_usuario_acesso_usuario.Text = 'S' then
        begin
        usuario_t.Checked   := False;
        usuario_s.Checked   := True;
        usuario_l.Checked   := False;
        end
     else if DB_usuario_acesso_usuario.Text = 'L' then
        begin
        usuario_t.Checked   := False;
        usuario_s.Checked   := False;
        usuario_l.Checked   := True;
     end;

     if DB_usuario_acesso_medico.Text = 'T' then
        begin
        medico_t.Checked   := True;
        medico_s.Checked   := False;
        medico_l.Checked   := False;
        end
     else if DB_usuario_acesso_medico.Text = 'S' then
        begin
        medico_t.Checked   := False;
        medico_s.Checked   := True;
        medico_l.Checked   := False;
        end
     else if DB_usuario_acesso_medico.Text = 'L' then
        begin
        medico_t.Checked   := False;
        medico_s.Checked   := False;
        medico_l.Checked   := True;
     end;

     if DB_usuario_acesso_adicionais.Text = 'T' then
        begin
        adicionais_t.Checked   := True;
        adicionais_s.Checked   := False;
        adicionais_l.Checked   := False;
        end
     else if DB_usuario_acesso_adicionais.Text = 'S' then
        begin
        adicionais_t.Checked   := False;
        adicionais_s.Checked   := True;
        adicionais_l.Checked   := False;
        end
     else if DB_usuario_acesso_adicionais.Text = 'L' then
        begin
        adicionais_t.Checked   := False;
        adicionais_s.Checked   := False;
        adicionais_l.Checked   := True;
     end;

     if DB_usuario_acesso_cirurgia.Text = 'T' then
        begin
        cirurgia_t.Checked   := True;
        cirurgia_s.Checked   := False;
        cirurgia_l.Checked   := False;
        end
     else if DB_usuario_acesso_cirurgia.Text = 'S' then
        begin
        cirurgia_t.Checked   := False;
        cirurgia_s.Checked   := True;
        cirurgia_l.Checked   := False;
        end
     else if DB_usuario_acesso_cirurgia.Text = 'L' then
        begin
        cirurgia_t.Checked   := False;
        cirurgia_s.Checked   := False;
        cirurgia_l.Checked   := True;
     end;       

     Cursor_Normal();

     usuario_nome.SetFocus;
end;

procedure TPreferencia.usuario_nomeKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   usuario_senha.SetFocus;
end;

end;

procedure TPreferencia.usuario_senhaKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   Cons02.Bt_Gravar.SetFocus;
end;

end;

end.
