unit Agen_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Rel_00,
  Buttons;

type
  TAgenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Calendario: TMonthCalendar;
    Label1: TLabel;
    dia_horario: TLabel;
    Label2: TLabel;
    mes_horario: TLabel;
    Label3: TLabel;
    ano_horario: TLabel;
    Panel3: TPanel;
    GRD_Horario: TDBGrid;
    Label4: TLabel;
    horario_tipo: TComboBox;
    Label5: TLabel;
    horario_hora: TMaskEdit;
    horario_descricao: TEdit;
    Label6: TLabel;
    horario_procura: TButton;
    horario_status: TComboBox;
    Label7: TLabel;
    horario_paciente_lista: TDBGrid;
    horario_convenio: TComboBox;
    Label8: TLabel;
    Panel4: TPanel;
    horario_localiza: TComboBox;
    Label9: TLabel;
    DB_agenda_hora: TDBEdit;
    DB_agenda_ficha: TDBEdit;
    DB_agenda_descricao: TDBEdit;
    DB_agenda_tipo: TDBEdit;
    DB_agenda_status: TDBEdit;
    DB_agenda_convenio: TDBEdit;
    DB_agenda_descricao_convenio: TDBEdit;
    horario_ficha_nro: TEdit;
    horario_convenio_nro: TEdit;
    DB_paciente_ficha_AG: TDBEdit;
    DB_paciente_nome_sobrenome_AG: TDBEdit;
    Atualiza_Agenda: TTimer;
    horario_novo: TBitBtn;
    horario_apagar: TBitBtn;
    horario_gravar: TBitBtn;
    horario_imprimir: TBitBtn;
    horario_adicionais: TBitBtn;
    horario_atualizar: TBitBtn;
    horario_tipo_cirurgia: TComboBox;
    Label10: TLabel;
    DB_agenda_tipo_cirurgia: TDBEdit;
    horario_adicional_incluido: TEdit;
    DB_agenda_identifica_adicional: TDBEdit;
    horario_cirurgia_descricao: TEdit;
    horario_quantidade_ch: TEdit;
    horario_valor_ch: TEdit;
    Label11: TLabel;
    horario_material: TEdit;
    Label12: TLabel;
    horario_observacao: TEdit;
    DB_agenda_valor_material_cirurgia: TDBEdit;
    DB_agenda_observacao: TDBEdit;
    horario_valor_cirurgia: TEdit;
    Label13: TLabel;
    Agenda_Exibe_Medico: TLabel;
    Agenda_Medico: TEdit;
    Agenda_Medico_Crm: TEdit;
    procedure CalendarioClick(Sender: TObject);
    procedure GRD_HorarioCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure horario_procuraClick(Sender: TObject);
    procedure horario_novoClick(Sender: TObject);
    procedure horario_apagarClick(Sender: TObject);
    procedure horario_paciente_listaCellClick(Column: TColumn);
    procedure horario_gravarClick(Sender: TObject);
    procedure horario_imprimirClick(Sender: TObject);
    procedure Atualiza_AgendaTimer(Sender: TObject);
    procedure horario_descricaoKeyPress(Sender: TObject; var Key: Char);
    procedure horario_horaKeyPress(Sender: TObject; var Key: Char);
    procedure horario_tipoKeyPress(Sender: TObject; var Key: Char);
    procedure horario_localizaKeyPress(Sender: TObject; var Key: Char);
    procedure horario_statusKeyPress(Sender: TObject; var Key: Char);
    procedure horario_convenioKeyPress(Sender: TObject; var Key: Char);
    procedure horario_atualizarClick(Sender: TObject);
    procedure horario_tipoSelect(Sender: TObject);
    procedure horario_adicionaisClick(Sender: TObject);
    procedure horario_materialKeyPress(Sender: TObject; var Key: Char);
    procedure horario_tipo_cirurgiaSelect(Sender: TObject);
    procedure GRD_HorarioTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Agenda: TAgenda;
  Ordena_Coluna, Selecionado: String;

implementation

uses Cons_02, Rotinas_Gerais, Conexao_BD, Agen_01;

{$R *.dfm}

procedure TAgenda.CalendarioClick(Sender: TObject);
begin
     Prepara_Agenda();
end;

procedure TAgenda.GRD_HorarioCellClick(Column: TColumn);
var
   Ind: Integer;
   Pago: String;

begin
     Limpa_Agenda();

{*** Carrega a Lista de Convênios ***}

     Carrega_Lista_Convenio_AG();

{*** Carrega os Campos da Tela ***}

     horario_hora.Text               := DB_agenda_hora.Text;
     horario_ficha_nro.Text          := DB_agenda_ficha.Text;
     horario_tipo.Text               := DB_agenda_tipo.Text;
     horario_tipo_cirurgia.Text      := DB_agenda_tipo_cirurgia.Text;
     horario_localiza.ItemIndex      := 0;
     horario_descricao.Text          := DB_agenda_descricao.Text;
     horario_status.Text             := DB_agenda_status.Text;
     horario_convenio_nro.Text       := DB_agenda_convenio.Text;
     horario_adicional_incluido.Text := DB_agenda_identifica_adicional.Text;
     horario_observacao.Text         := DB_agenda_observacao.Text;

     If horario_tipo.Text = 'Cirurgia' Then
        begin
        horario_tipo_cirurgia.Enabled := True;
        horario_material.Enabled      := True;
        horario_material.Text         := DB_agenda_valor_material_cirurgia.Text;


        {*** Prepara o Tipo da Cirurgia ***}

        horario_tipo_cirurgia.ItemIndex := -1;

        if horario_tipo_cirurgia.Items.Count > 0 then
           begin
           for Ind := 1 to horario_tipo_cirurgia.Items.Count do
               begin
               if horario_tipo_cirurgia.Items.Strings[Ind - 1] = DB_agenda_tipo_cirurgia.Text then
                  begin
                  horario_tipo_cirurgia.ItemIndex := Ind - 1;
               end;
           end;
        end;

        end
     Else
        begin
        horario_tipo_cirurgia.Enabled   := False;
        horario_material.Enabled        := False;
        horario_material.Text           := '';
        horario_tipo_cirurgia.ItemIndex := -1;
     end;

{*** Prepara o Campo de Convênio ***}

     horario_convenio.ItemIndex := -1;

     if horario_convenio.Items.Count > 0 then
        begin
        for Ind := 1 to horario_convenio.Items.Count do
            begin
            if horario_convenio.Items.Strings[Ind - 1] = DB_agenda_descricao_convenio.Text then
               begin
               horario_convenio.ItemIndex := Ind - 1;
            end;
        end;
     end;

     horario_tipo.SetFocus;

     if ((Trim(GRD_Horario.Fields[1].Text) <> '') and (Column.Index = 7)) Then Begin
         Cursor_Ampulheta();

         Carrega_Agenda(False);

         Pago := GRD_Horario.Fields[7].Text;

         conexaoBD.SQL_Agenda.Close;
         conexaoBD.SQL_Agenda.SQL.Clear;
         if (Trim(Pago) = '') then begin
            conexaoBD.SQL_Agenda.SQL.Add('update Agenda set agenda_pago = "OK"'+
            ' where Agenda_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And agenda_data = #'+Inverte_Data(DateToStr(Agenda.Calendario.Date))+'# and agenda_hora = "'+Trim(Agenda.horario_hora.Text)+'"');
         end
         else begin
            conexaoBD.SQL_Agenda.SQL.Add('update Agenda set agenda_pago = ""'+
            ' where Agenda_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And agenda_data = #'+Inverte_Data(DateToStr(Agenda.Calendario.Date))+'# and agenda_hora = "'+Trim(Agenda.horario_hora.Text)+'"');
         end;
         conexaoBD.SQL_Agenda.ExecSQL;

          Cursor_Ampulheta();
          Prepara_Agenda();
          Carrega_Lista_Convenio_AG();

          conexaoBD.SQL_Paciente_AG.Close;
          conexaoBD.SQL_Paciente_AG.SQL.Clear;
          conexaoBD.SQL_Paciente_AG.SQL.Add('select * from Paciente where paciente_ficha = "0"');
          conexaoBD.SQL_Paciente_AG.Open;
          Agenda.horario_paciente_lista.Refresh;


         Cursor_Normal();
     End;
end;

procedure TAgenda.FormShow(Sender: TObject);
begin
     // Ajusta as Margens e Altura do Formulário

     with Agenda do begin
         Top  := ((Screen.Height Div 2) - 285) - 12;
         Left := ((Screen.Width Div 2) - 397)
     end;

     Carrega_Lista_Convenio_AG();
end;

procedure TAgenda.horario_procuraClick(Sender: TObject);
begin
     Carrega_Lista_Pacientes_AG();
end;

procedure TAgenda.horario_novoClick(Sender: TObject);
begin
     Registro_Novo_AG();
end;

procedure TAgenda.horario_apagarClick(Sender: TObject);
begin
     Registro_Apagar_AG();
end;

procedure TAgenda.horario_paciente_listaCellClick(Column: TColumn);
begin
     Agenda.horario_descricao.Text := DB_paciente_nome_sobrenome_AG.Text;
     Agenda.horario_ficha_nro.Text := DB_paciente_ficha_AG.Text;
end;

procedure TAgenda.horario_gravarClick(Sender: TObject);
begin
     Registro_Gravar_AG();
end;

procedure TAgenda.horario_imprimirClick(Sender: TObject);
begin
     Application.CreateForm(TRel_Horario,Rel_Horario);

     Rel_Horario.QRL_Nome_medico.Caption := Cons02.ConsulTEX_Medico.Text;

     Rel_Horario.RPT_Horario.PreviewModal;
     Rel_Horario.RPT_Horario.Destroy;
     Rel_Horario.Destroy;
end;

procedure TAgenda.Atualiza_AgendaTimer(Sender: TObject);
begin
     Cursor_Ampulheta();
     Prepara_Agenda();
     Cursor_Normal();
end;

procedure TAgenda.horario_descricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #13 then
        begin
        if horario_descricao.Text = '' Then
           begin
           horario_status.SetFocus;
           end
        else
           begin
           Carrega_Lista_Pacientes_AG();
        end;
     end;
end;

procedure TAgenda.horario_horaKeyPress(Sender: TObject; var Key: Char);
begin

if Key = #13 then
   begin
   horario_tipo.SetFocus;
end;

end;

procedure TAgenda.horario_tipoKeyPress(Sender: TObject; var Key: Char);
begin

if Key = #13 then
   begin
   horario_localiza.SetFocus; 
end;

end;

procedure TAgenda.horario_localizaKeyPress(Sender: TObject; var Key: Char);
begin

if Key = #13 then
   begin
   horario_descricao.SetFocus;
end;

end;

procedure TAgenda.horario_statusKeyPress(Sender: TObject; var Key: Char);
begin

if Key = #13 then
   begin
   horario_convenio.SetFocus;
end;

end;

procedure TAgenda.horario_convenioKeyPress(Sender: TObject; var Key: Char);
begin

if Key = #13 then
   begin
   horario_gravar.SetFocus;
end;

end;

procedure TAgenda.horario_atualizarClick(Sender: TObject);
begin
     Cursor_Ampulheta();
     Prepara_Agenda();
     Cursor_Normal();
end;

procedure TAgenda.horario_tipoSelect(Sender: TObject);
begin
     If horario_tipo.Text = 'Cirurgia' Then
        begin
        horario_tipo_cirurgia.Enabled := True;
        horario_material.Enabled      := True;
        horario_material.Text         := '';
        end
     Else
        begin
        horario_tipo_cirurgia.Enabled   := False;
        horario_material.Enabled        := False;
        horario_material.Text           := '';
        horario_tipo_cirurgia.ItemIndex := -1;
     end;
end;

procedure TAgenda.horario_adicionaisClick(Sender: TObject);
begin
     if Agenda.horario_hora.Text = '  :  ' then
        begin
        MSG_Erro('A Hora não foi informada');
        Agenda.horario_hora.SetFocus;
        end
     else if Agenda.horario_descricao.Text = '' then
        begin
        MSG_Erro('O Paciente  não foi informado');
        Agenda.horario_descricao.SetFocus;
        end
     else
        begin
        If (horario_tipo.Text = 'Consulta') Or (horario_tipo.Text = 'Cirurgia') Or (horario_tipo.Text = 'Adicional') Then
           begin
           Prepara_Hora();

           Application.CreateForm(TAdicionais_AG,Adicionais_AG);

           Adicionais_AG.paciente_hora.Text           := Agenda.horario_hora.Text;
           Adicionais_AG.paciente_ficha.Text          := Agenda.horario_ficha_nro.Text;
           Adicionais_AG.paciente_nome.Text           := Agenda.horario_descricao.Text;

           Adicionais_AG.paciente_data.Text           := DateToStr(Agenda.Calendario.Date);
           Adicionais_AG.paciente_data_invertida.Text := Inverte_Data(DateToStr(Agenda.Calendario.Date));

           Adicionais_AG.ShowModal;
           Adicionais_AG.Destroy;
           end
        Else
           begin
           MSG_Erro('O Adicional só é valido para "Consulta", "Cirurgia" ou "Adicional"');
           Agenda.horario_tipo.SetFocus;
        end;
     end;
end;

procedure TAgenda.horario_materialKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
        begin
        horario_material.SetFocus;
     end;

     if not(key in ['0'..'9','.',',',#8,#13]) then
        key := #0;
     if key in [',','.'] then
        key := DecimalSeparator;
     if key = DecimalSeparator then
        if pos(key,TEdit(Sender).Text) <> 0 then
           key := #0;
end;

procedure TAgenda.horario_tipo_cirurgiaSelect(Sender: TObject);

var
   Valor_Material_Cirurgia: Real;
   Nro_Str: String;

begin
     conexaoBD.SQL_Comunitario_Aux.Close;
     conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
     conexaoBD.SQL_Comunitario_Aux.SQL.Add('select * from Cirurgia where Cirurgia_codigo = "'+horario_tipo_cirurgia.Text+'"');
     conexaoBD.SQL_Comunitario_Aux.Open;

     If conexaoBD.SQL_Comunitario_Aux.RecordCount > 0 then
        begin
        If conexaoBD.SQL_Comunitario_Aux.FieldValues['Cirurgia_material'] <> Null Then
           begin
           Valor_Material_Cirurgia := conexaoBD.SQL_Comunitario_Aux.FieldValues['Cirurgia_material'];
           Str(Valor_Material_Cirurgia:13:2,Nro_Str);
           horario_material.Text := Trim(Ponto_Virgula(Nro_Str));
           end
        Else
           begin
           horario_material.Text := '';
        end; 
        end
     Else
        begin
        horario_material.Text := '';
     end;
end;

procedure TAgenda.GRD_HorarioTitleClick(Column: TColumn);

var
   Data_Sis: String;

begin
     Cursor_Ampulheta();

     Data_Sis := DateToStr(Date());
     Data_Sis := Inverte_Data(Data_Sis);

{*** Carrega as Informações da Tabela ***}

     conexaoBD.SQL_Agenda.Close;
     conexaoBD.SQL_Agenda.SQL.Clear;
     conexaoBD.SQL_Agenda.SQL.Add('Select * from Agenda where Agenda_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Agenda_data = #'+Data_Sis+'# Order by Agenda_data, Agenda_hora');
     conexaoBD.SQL_Agenda.Open;

     If (Pos(Column.FieldName, Ordena_Coluna) > 0) And (Pos('ASC', Ordena_Coluna) > 0) Then
        Begin
        Ordena_Coluna := ' Order By ' + Trim(Column.FieldName) + ' DESC';
        End
     Else
        Begin
        Ordena_Coluna := ' Order By ' + Trim(Column.FieldName) + ' ASC';
     End;

     ConexaoBD.SQL_Agenda.Close;
     ConexaoBD.SQL_Agenda.SQL.Clear;
     ConexaoBD.SQL_Agenda.SQL.Add('Select * from Agenda where Agenda_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Agenda_data = #'+Data_Sis+'# '+Trim(Ordena_Coluna));
     ConexaoBD.SQL_Agenda.Open;

     GRD_Horario.Refresh;

     Seta();
end;

end.
