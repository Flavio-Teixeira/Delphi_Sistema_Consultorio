unit Agen_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons;

type
  TAdicionais_AG = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    GRD_Adicional_AG: TDBGrid;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    paciente_ficha: TEdit;
    Label2: TLabel;
    paciente_nome: TEdit;
    GRD_Adicional_Paciente: TDBGrid;
    Label5: TLabel;
    paciente_total: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    paciente_quantidade: TEdit;
    DB_Adicional_Codigo: TDBEdit;
    DB_Adicional_Descricao: TDBEdit;
    DB_Adicional_Valor: TDBEdit;
    paciente_hora: TEdit;
    paciente_data: TEdit;
    paciente_data_invertida: TEdit;
    DB_paciente_adicional_codigo: TDBEdit;
    BT_Sair: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure GRD_Adicional_AGCellClick(Column: TColumn);
    procedure GRD_Adicional_PacienteCellClick(Column: TColumn);
    procedure BT_SairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Adicionais_AG: TAdicionais_AG;

implementation

uses Conexao_BD, Rotinas_Gerais, Agen_00;

{$R *.dfm}

procedure TAdicionais_AG.FormShow(Sender: TObject);
begin
     Cursor_Ampulheta();

     //*** Carrega os Dados ***

     conexaoBD.SQL_Adicionais_AG.Close;
     conexaoBD.SQL_Adicionais_AG.SQL.Clear;
     conexaoBD.SQL_Adicionais_AG.SQL.Add('select * from Adicionais Order By Adicional_descricao');
     conexaoBD.SQL_Adicionais_AG.Open;

     //*** Obtem a Quantidade e o Valor Total de Itens Adicionados ***

     conexaoBD.SQL_Comunitario_Aux.Close;
     conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
     conexaoBD.SQL_Comunitario_Aux.SQL.Add('select SUM(Adicional_lista_valor) As Adicional_Total from Adicionais_Lista Where Adicional_lista_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Adicional_lista_data = #'+Trim(paciente_data_invertida.Text)+'# And Adicional_lista_hora = '+#39+Trim(paciente_hora.Text)+#39);
     conexaoBD.SQL_Comunitario_Aux.Open;

     If conexaoBD.SQL_Comunitario_Aux.FieldValues['Adicional_Total'] <> Null Then
        begin
        paciente_total.Text := conexaoBD.SQL_Comunitario_Aux.FieldValues['Adicional_Total'];
        end
     Else
        begin
        paciente_total.Text := '0,00';
     end;

     //*** Carrega a Lista de Adicionais do Paciente ***

     conexaoBD.SQL_Adicionais_Lista.Close;
     conexaoBD.SQL_Adicionais_Lista.SQL.Clear;
     conexaoBD.SQL_Adicionais_Lista.SQL.Add('select * from Adicionais_Lista Where Adicional_lista_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Adicional_lista_data = #'+Trim(paciente_data_invertida.Text)+'# And Adicional_lista_hora = '+#39+Trim(paciente_hora.Text)+#39+' Order By Adicional_lista_descricao');
     conexaoBD.SQL_Adicionais_Lista.Open;

     paciente_quantidade.Text := IntToStr(conexaoBD.SQL_Adicionais_Lista.RecordCount);

     If conexaoBD.SQL_Adicionais_Lista.RecordCount > 0 Then
        begin
        Agenda.horario_adicional_incluido.Text := '+';
        end
     Else
        begin
        Agenda.horario_adicional_incluido.Text := '';
     end;

     Cursor_Normal();
end;

procedure TAdicionais_AG.GRD_Adicional_AGCellClick(Column: TColumn);
begin
     If Trim(DB_Adicional_Codigo.Text) <> '' Then
        begin
        If Confirma('Adicionar este item ao Paciente?') = 6 Then
           begin
           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('insert into Adicionais_lista'+
           '(Adicional_lista_data,'+
           'Adicional_lista_hora,'+
           'Adicional_lista_codigo_adicional,'+
           'Adicional_lista_descricao,'+
           'Adicional_lista_valor,'+
           'Adicional_lista_medico_crm) '+
           'values("'+paciente_data.Text+'",'+
           '"'+Trim(paciente_hora.Text)+'",'+
           '"'+Trim(DB_Adicional_Codigo.Text)+'",'+
           '"'+Trim(DB_Adicional_Descricao.Text)+'",'+
           '"'+Trim(DB_Adicional_Valor.Text)+'",'+
           '"'+Trim(Agenda.Agenda_Medico_Crm.Text)+'")');
           conexaoBD.SQL_Comunitario_Aux.ExecSQL;

           //*** Obtem a Quantidade e o Valor Total de Itens Adicionados ***

           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('select * from Adicionais_Lista Where Adicional_lista_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Adicional_lista_data = #'+Trim(paciente_data_invertida.Text)+'# And Adicional_lista_hora = '+#39+Trim(paciente_hora.Text)+#39+' Order By Adicional_lista_descricao');
           conexaoBD.SQL_Comunitario_Aux.Open;

           paciente_quantidade.Text := IntToStr(conexaoBD.SQL_Comunitario_Aux.RecordCount);

           If conexaoBD.SQL_Comunitario_Aux.RecordCount > 0 Then
              begin
              Agenda.horario_adicional_incluido.Text := '+';
              end
           Else
              begin
              Agenda.horario_adicional_incluido.Text := '';
           end;

           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('select SUM(Adicional_lista_valor) As Adicional_Total from Adicionais_Lista Where Adicional_lista_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Adicional_lista_data = #'+Trim(paciente_data_invertida.Text)+'# And Adicional_lista_hora = '+#39+Trim(paciente_hora.Text)+#39);
           conexaoBD.SQL_Comunitario_Aux.Open;

           If conexaoBD.SQL_Comunitario_Aux.FieldValues['Adicional_Total'] <> Null Then
              begin
              paciente_total.Text := conexaoBD.SQL_Comunitario_Aux.FieldValues['Adicional_Total'];
              end
           Else
              begin
              paciente_total.Text := '0,00';
           end;

           //*** Carrega a Lista de Adicionais do Paciente ***

           conexaoBD.SQL_Adicionais_Lista.Close;
           conexaoBD.SQL_Adicionais_Lista.SQL.Clear;
           conexaoBD.SQL_Adicionais_Lista.SQL.Add('select * from Adicionais_Lista Where Adicional_lista_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Adicional_lista_data = #'+Trim(paciente_data_invertida.Text)+'# And Adicional_lista_hora = '+#39+Trim(paciente_hora.Text)+#39+' Order By Adicional_lista_descricao');
           conexaoBD.SQL_Adicionais_Lista.Open;

           GRD_Adicional_Paciente.Refresh;
        end;
     end;
end;

procedure TAdicionais_AG.GRD_Adicional_PacienteCellClick(Column: TColumn);
begin
     If Trim(DB_paciente_adicional_codigo.Text) <> '' Then
        begin
        If Confirma('Deseja Excluir este item do Paciente?') = 6 Then
           begin
           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('delete from Adicionais_Lista Where Adicional_lista_codigo = '+DB_paciente_adicional_codigo.Text);
           conexaoBD.SQL_Comunitario_Aux.ExecSQL;

           //*** Obtem a Quantidade e o Valor Total de Itens Adicionados ***

           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('select * from Adicionais_Lista Where Adicional_lista_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Adicional_lista_data = #'+Trim(paciente_data_invertida.Text)+'# And Adicional_lista_hora = '+#39+Trim(paciente_hora.Text)+#39+' Order By Adicional_lista_descricao');
           conexaoBD.SQL_Comunitario_Aux.Open;

           paciente_quantidade.Text := IntToStr(conexaoBD.SQL_Comunitario_Aux.RecordCount);

           If conexaoBD.SQL_Comunitario_Aux.RecordCount > 0 Then
              begin
              Agenda.horario_adicional_incluido.Text := '+';
              end
           Else
              begin
              Agenda.horario_adicional_incluido.Text := '';
           end;

           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('select SUM(Adicional_lista_valor) As Adicional_Total from Adicionais_Lista Where Adicional_lista_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Adicional_lista_data = #'+Trim(paciente_data_invertida.Text)+'# And Adicional_lista_hora = '+#39+Trim(paciente_hora.Text)+#39);
           conexaoBD.SQL_Comunitario_Aux.Open;

           If conexaoBD.SQL_Comunitario_Aux.FieldValues['Adicional_Total'] <> Null Then
              begin
              paciente_total.Text := conexaoBD.SQL_Comunitario_Aux.FieldValues['Adicional_Total'];
              end
           Else
              begin
              paciente_total.Text := '0,00';
           end;

           //*** Carrega a Lista de Adicionais do Paciente ***

           conexaoBD.SQL_Adicionais_Lista.Close;
           conexaoBD.SQL_Adicionais_Lista.SQL.Clear;
           conexaoBD.SQL_Adicionais_Lista.SQL.Add('select * from Adicionais_Lista Where Adicional_lista_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Adicional_lista_data = #'+Trim(paciente_data_invertida.Text)+'# And Adicional_lista_hora = '+#39+Trim(paciente_hora.Text)+#39+' Order By Adicional_lista_descricao');
           conexaoBD.SQL_Adicionais_Lista.Open;

           GRD_Adicional_Paciente.Refresh;
        end;
     end;
end;

procedure TAdicionais_AG.BT_SairClick(Sender: TObject);
begin
     Adicionais_AG.Close;
end;

procedure TAdicionais_AG.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
   Data_Busca, Data_Grava: String;
begin
    if conexaoBD.SQL_Adicionais_Lista.RecordCount > 0 Then begin
        conexaoBD.SQL_Adicionais_Lista.First;

        Data_Busca := DateToStr(Agenda.Calendario.Date);
        Data_Busca := Inverte_Data(Data_Busca);

        Data_Grava := DateToStr(Agenda.Calendario.Date);

        conexaoBD.SQL_Comunitario_Aux.Close;
        conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
        conexaoBD.SQL_Comunitario_Aux.SQL.Add('update Agenda set'+
        ' Agenda_identifica_adicional = "'+Trim(GRD_Adicional_Paciente.Fields[1].Text)+'",'+
        ' Agenda_valor_adicional = '+Trim(paciente_total.Text)+' '+
        ' where Agenda_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+
        ' And agenda_data = #'+Data_Busca+'# and agenda_hora = "'+Trim(Agenda.horario_hora.Text)+'"');

        conexaoBD.SQL_Comunitario_Aux.ExecSQL;
        conexaoBD.SQL_Agenda.Close;
        conexaoBD.SQL_Agenda.Open;
    end;
end;

end.
