unit Rel_04;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Rel_04A, Buttons, Variants;

type
  TFaturamento = class(TFrame)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    faturamento_inicio: TMaskEdit;
    Label3: TLabel;
    faturamento_final: TMaskEdit;
    faturamento_convenio: TComboBox;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    faturamento_consulta_qtde: TEdit;
    faturamento_cirurgia_qtde: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    faturamento_consulta_ch: TEdit;
    faturamento_cirurgia_ch: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    faturamento_total_consulta: TEdit;
    faturamento_total_cirurgia: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    faturamento_total_geral: TEdit;
    BT_Recalcular: TBitBtn;
    BT_Imprimir: TBitBtn;
    BT_Calcular: TBitBtn;
    Label17: TLabel;
    faturamento_adicionais_qtde: TEdit;
    faturamento_total_adicionais: TEdit;
    Label18: TLabel;
    BT_Detalhado: TBitBtn;
    Label19: TLabel;
    Label20: TLabel;
    faturamento_total_material: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure BT_CalcularClick(Sender: TObject);
    procedure faturamento_consulta_qtdeKeyPress(Sender: TObject;
      var Key: Char);
    procedure faturamento_cirurgia_qtdeKeyPress(Sender: TObject;
      var Key: Char);
    procedure faturamento_consulta_chKeyPress(Sender: TObject;
      var Key: Char);
    procedure faturamento_cirurgia_chKeyPress(Sender: TObject;
      var Key: Char);
    procedure faturamento_total_consultaKeyPress(Sender: TObject;
      var Key: Char);
    procedure faturamento_total_cirurgiaKeyPress(Sender: TObject;
      var Key: Char);
    procedure faturamento_total_geralKeyPress(Sender: TObject;
      var Key: Char);
    procedure BT_RecalcularClick(Sender: TObject);
    procedure BT_ImprimirClick(Sender: TObject);
    procedure faturamento_inicioKeyPress(Sender: TObject; var Key: Char);
    procedure faturamento_finalKeyPress(Sender: TObject; var Key: Char);
    procedure faturamento_convenioKeyPress(Sender: TObject; var Key: Char);
    procedure faturamento_inicioExit(Sender: TObject);
    procedure faturamento_finalExit(Sender: TObject);
    procedure BT_DetalhadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Cons_02, Rotinas_Gerais, Conexao_BD, Rel_04B;

{$R *.dfm}

procedure TFaturamento.Button1Click(Sender: TObject);
begin
     Fecha_Faturamento();
end;

procedure TFaturamento.BT_CalcularClick(Sender: TObject);

var
   Cirurgia_CH, Consulta_CH, Cirurgia_CH_Total, Consulta_CH_Total, Total_Cirurgia, Total_Consulta, Total_Cirurgia_Geral, Total_Consulta_Geral, Total_Geral, Total_Adicionais, Valor_Material: Real;
   Cirurgia_Qtde, Consulta_Qtde, Cirurgia_Total, Consulta_Total, Adicional_Qtde: Integer;

   Cirurgia_CH_Tipo, Total_Cirurgia_Tipo, Valor_CH_Tipo, Valor_Cirurgia, Total_Valor_Cirurgia: Real;
   Cirurgia_Qtde_Tipo, Cirurgia_Qtde_Tipo_Total, Valor_Cirurgia_Qtde: Integer;
   Cirurgia_Tipo, Cirurgia_Tipo_ANT: String;

   Data_Busca_I, Data_Busca_F, Nro_Str, Convenio_Ant: String;

begin
     Cursor_Ampulheta();

     if Valida_Faturamento_Calculo() = True then
        begin

        Data_Busca_I := faturamento_inicio.Text;
        Data_Busca_I := Inverte_Data(Data_Busca_I);

        Data_Busca_F := faturamento_final.Text;
        Data_Busca_F := Inverte_Data(Data_Busca_F);

        If Trim(faturamento_convenio.Text) <> '--- Total Geral ---' Then
           begin
           Valor_Material   := 0;

           Adicional_Qtde   := 0;
           Total_Adicionais := 0;

           Consulta_Total := 0;
           Cirurgia_Total := 0;

           Consulta_CH_Total := 0;
           Cirurgia_CH_Total := 0;

           Valor_Cirurgia       := 0;
           Valor_Cirurgia_Qtde  := 0;
           Total_Valor_Cirurgia := 0;

           Total_Consulta_Geral := 0;
           Total_Cirurgia_Geral := 0;

           {*** Busca a Quantidade de Adicionais Atendidos ***}

           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('select * from Adicionais_Lista, Agenda Where (Adicional_lista_data >= #'+Data_Busca_I+'# And Adicional_lista_data <= #'+Data_Busca_F+'#) And (Adicional_lista_data = Agenda_data) And (Adicional_lista_hora = Agenda_hora) And Agenda_tipo = '+#39+'ADICIONAL'+#39+' And Agenda_status = '+#39+'ATENDIDO'+#39+' And (Agenda_descricao_convenio = '+#39+UpperCase(Trim(faturamento_convenio.Text))+#39+')');
           conexaoBD.SQL_Comunitario_Aux.Open;

           Adicional_Qtde := conexaoBD.SQL_Comunitario_Aux.RecordCount;
           faturamento_adicionais_qtde.Text := IntToStr(Adicional_Qtde);

           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('select SUM(Adicional_lista_valor) As Adicional_Total from Adicionais_Lista, Agenda Where (Adicional_lista_data >= #'+Data_Busca_I+'# And Adicional_lista_data <= #'+Data_Busca_F+'#) And (Adicional_lista_data = Agenda_data) And (Adicional_lista_hora = Agenda_hora) And Agenda_tipo = '+#39+'ADICIONAL'+#39+' And Agenda_status = '+#39+'ATENDIDO'+#39+' And (Agenda_descricao_convenio = '+#39+UpperCase(Trim(faturamento_convenio.Text))+#39+')');
           conexaoBD.SQL_Comunitario_Aux.Open;

           If conexaoBD.SQL_Comunitario_Aux.FieldValues['Adicional_Total'] <> Null Then
              begin
              Total_Adicionais := conexaoBD.SQL_Comunitario_Aux.FieldValues['Adicional_Total'];
           end;

           {*** Busca a Quantidade de Consultas Atendidas ***}

           conexaoBD.SQL_Agenda_FAT.Close;
           conexaoBD.SQL_Agenda_FAT.SQL.Clear;
           conexaoBD.SQL_Agenda_FAT.SQL.Add('select * from Agenda where (Agenda_data >= #'+Data_Busca_I+'#'+
           ' and Agenda_data <= #'+Data_Busca_F+'#)'+
           ' and (Agenda_tipo = "CONSULTA" and Agenda_status = "ATENDIDO")'+
           ' and (Agenda_descricao_convenio = "'+UpperCase(Trim(faturamento_convenio.Text))+'")');
           conexaoBD.SQL_Agenda_FAT.Open;

           Consulta_Qtde := conexaoBD.SQL_Agenda_FAT.RecordCount;
           faturamento_consulta_qtde.Text := Trim(IntToStr(Consulta_Qtde));

           {*** Busca o Valor do Material das Cirurgias ***}

           conexaoBD.SQL_Agenda_FAT.Close;
           conexaoBD.SQL_Agenda_FAT.SQL.Clear;
           conexaoBD.SQL_Agenda_FAT.SQL.Add('select SUM(Agenda_valor_material_cirurgia) As Agenda_Total_Material from Agenda where (Agenda_data >= #'+Data_Busca_I+'#'+
           ' and Agenda_data <= #'+Data_Busca_F+'#)'+
           ' and (Agenda_tipo = "CIRURGIA" and Agenda_status = "ATENDIDO")'+
           ' and (Agenda_descricao_convenio = "'+UpperCase(Trim(faturamento_convenio.Text))+'")');
           conexaoBD.SQL_Agenda_FAT.Open;

           If conexaoBD.SQL_Agenda_FAT.FieldValues['Agenda_Total_Material'] <> Null Then
              begin
              Valor_Material := conexaoBD.SQL_Agenda_FAT.FieldValues['Agenda_Total_Material'];
           end;

           Str(Valor_Material:13:2,Nro_Str);
           faturamento_total_material.Text := Trim(Ponto_Virgula(Nro_Str));

           {*** Busca o Valor das Cirurgias Atendidas Com o Valor Fixo (Não podem Calcular o CH) ***}

           conexaoBD.SQL_Agenda_FAT.Close;
           conexaoBD.SQL_Agenda_FAT.SQL.Clear;
           conexaoBD.SQL_Agenda_FAT.SQL.Add('select * from Agenda where (Agenda_data >= #'+Data_Busca_I+'#'+
           ' and Agenda_data <= #'+Data_Busca_F+'#)'+
           ' and (Agenda_tipo = "CIRURGIA" and Agenda_status = "ATENDIDO")'+
           ' and (Agenda_descricao_convenio = "'+UpperCase(Trim(faturamento_convenio.Text))+'")'+
           ' and (Agenda_valor_cirurgia > 0)');
           conexaoBD.SQL_Agenda_FAT.Open;

           If conexaoBD.SQL_Agenda_FAT.RecordCount > 0 Then
              begin

              Valor_Cirurgia_Qtde := conexaoBD.SQL_Agenda_FAT.RecordCount;

              conexaoBD.SQL_Agenda_FAT.First;

              While Not conexaoBD.SQL_Agenda_FAT.Eof Do
                    begin

                    If conexaoBD.SQL_Agenda_FAT.FieldValues['Agenda_Valor_Cirurgia'] <> Null Then
                       begin
                       Valor_Cirurgia := conexaoBD.SQL_Agenda_FAT.FieldValues['Agenda_Valor_Cirurgia'];
                       end
                    Else
                       begin
                       Valor_Cirurgia := 0;
                    End;

                    Total_Valor_Cirurgia := Total_Valor_Cirurgia + Valor_Cirurgia;

                    conexaoBD.SQL_Agenda_FAT.Next;
              end;
           end;

           {*** Busca a Quantidade de Cirurgias Atendidas Sem o Tipo da Cirurgia ***}

           conexaoBD.SQL_Agenda_FAT.Close;
           conexaoBD.SQL_Agenda_FAT.SQL.Clear;
           conexaoBD.SQL_Agenda_FAT.SQL.Add('select * from Agenda where (Agenda_data >= #'+Data_Busca_I+'#'+
           ' and Agenda_data <= #'+Data_Busca_F+'#)'+
           ' and (Agenda_tipo = "CIRURGIA" and Agenda_tipo_cirurgia = "" and Agenda_status = "ATENDIDO")'+
           ' and (Agenda_descricao_convenio = "'+UpperCase(Trim(faturamento_convenio.Text))+'")'+
           ' and (Agenda_valor_cirurgia <= 0)');
           conexaoBD.SQL_Agenda_FAT.Open;

           Cirurgia_Qtde := conexaoBD.SQL_Agenda_FAT.RecordCount;

           {*** Busca a Quantidade de Cirurgias Atendidas Com o Tipo da Cirurgia ***}

           Cirurgia_CH_Tipo         := 0;
           Valor_CH_Tipo            := 0;
           Total_Cirurgia_Tipo      := 0;
           Cirurgia_Qtde_Tipo       := 0;
           Cirurgia_Qtde_Tipo_Total := 0;

           conexaoBD.SQL_Comunitario.Close;
           conexaoBD.SQL_Comunitario.SQL.Clear;
           conexaoBD.SQL_Comunitario.SQL.Add('select Agenda_convenio, Agenda_tipo_cirurgia from Agenda where (Agenda_data >= #'+Data_Busca_I+'#'+
           ' and Agenda_data <= #'+Data_Busca_F+'#)'+
           ' and (Agenda_tipo = "CIRURGIA" and Agenda_tipo_cirurgia <> "" and Agenda_status = "ATENDIDO")'+
           ' and (Agenda_descricao_convenio = "'+UpperCase(Trim(faturamento_convenio.Text))+'")'+
           ' and (Agenda_valor_cirurgia <= 0) Group By Agenda_convenio, Agenda_tipo_cirurgia Order By Agenda_convenio, Agenda_tipo_cirurgia');
           conexaoBD.SQL_Comunitario.Open;

           If conexaoBD.SQL_Comunitario.RecordCount > 0 Then
              begin

              conexaoBD.SQL_Comunitario.First;

              While Not conexaoBD.SQL_Comunitario.Eof Do
                    begin

                    Convenio_Ant  := conexaoBD.SQL_Comunitario.FieldValues['Agenda_convenio'];
                    Cirurgia_Tipo := conexaoBD.SQL_Comunitario.FieldValues['Agenda_tipo_cirurgia'];

                    conexaoBD.SQL_Agenda_FAT.Close;
                    conexaoBD.SQL_Agenda_FAT.SQL.Clear;
                    conexaoBD.SQL_Agenda_FAT.SQL.Add('select * from Agenda where (Agenda_data >= #'+Data_Busca_I+'#'+
                    ' and Agenda_data <= #'+Data_Busca_F+'#)'+
                    ' and (Agenda_tipo = "CIRURGIA" and Agenda_tipo_cirurgia <> "" and Agenda_status = "ATENDIDO")'+
                    ' and (Agenda_convenio ='+Trim(Convenio_ANT)+' and Agenda_tipo_cirurgia = "'+Trim(Cirurgia_tipo)+'")'+
                    ' and (Agenda_valor_cirurgia <= 0)');
                    conexaoBD.SQL_Agenda_FAT.Open;

                    Cirurgia_Qtde_Tipo       := 0;
                    Cirurgia_Qtde_Tipo       := conexaoBD.SQL_Agenda_FAT.RecordCount;
                    Cirurgia_Qtde_Tipo_Total := Cirurgia_Qtde_Tipo_Total + Cirurgia_Qtde_Tipo;

                    {*** Busca a Qtde de CH da Cirurgia ***}

                    conexaoBD.SQL_Comunitario_Aux.Close;
                    conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
                    conexaoBD.SQL_Comunitario_Aux.SQL.Add('select * from Cirurgia where Cirurgia_codigo = '+#39+ Trim(Cirurgia_Tipo) +#39);
                    conexaoBD.SQL_Comunitario_Aux.Open;

                    If conexaoBD.SQL_Comunitario_Aux.RecordCount > 0 Then
                       begin
                       Cirurgia_CH_Tipo := conexaoBD.SQL_Comunitario_Aux.FieldValues['Cirurgia_quantidade_ch'];
                    end;

                    {*** Busca os Valores de CH do Convênio ***}

                    conexaoBD.SQL_Convenio_FAT.Close;
                    conexaoBD.SQL_Convenio_FAT.SQL.Clear;
                    conexaoBD.SQL_Convenio_FAT.SQL.Add('select * from Convenio where Convenio_numero = '+Trim(Convenio_Ant));
                    conexaoBD.SQL_Convenio_FAT.Open;

                    Valor_CH_Tipo       := conexaoBD.SQL_Convenio_FAT.FieldValues['Convenio_valor_ch'];
                    Cirurgia_CH_Total   := Cirurgia_CH_Total + Valor_CH_Tipo;
                    Total_Cirurgia_Tipo := Total_Cirurgia_Tipo + ((Cirurgia_Qtde_Tipo * Cirurgia_CH_Tipo) * Valor_CH_Tipo);

                    conexaoBD.SQL_Comunitario.Next;
              end;
           end;

           Cirurgia_Qtde_Tipo             := (Cirurgia_Qtde + Cirurgia_Qtde_Tipo_Total);
           faturamento_cirurgia_qtde.Text := Trim(IntToStr(Cirurgia_Qtde_Tipo + Valor_Cirurgia_Qtde));

           {*** Busca os Valores de CH do Convênio ***}

           conexaoBD.SQL_Convenio_FAT.Close;
           conexaoBD.SQL_Convenio_FAT.SQL.Clear;
           conexaoBD.SQL_Convenio_FAT.SQL.Add('select * from Convenio where Convenio_apelido = "'+UpperCase(Trim(faturamento_convenio.Text))+'"');
           conexaoBD.SQL_Convenio_FAT.Open;

           If Cirurgia_Qtde > 0 Then
              begin
              Cirurgia_CH := conexaoBD.SQL_Convenio_FAT.FieldValues['Convenio_valor_ch'];
              end
           Else
              begin
              Cirurgia_CH := 0;
           end;

           Str((Cirurgia_CH + Cirurgia_CH_Total):13:2,Nro_Str);
           faturamento_cirurgia_ch.Text := Trim(Ponto_Virgula(Nro_Str));

           Consulta_CH := conexaoBD.SQL_Convenio_FAT.FieldValues['Convenio_valor_consulta'];
           Str(Consulta_CH:13:2,Nro_Str);
           faturamento_consulta_ch.Text := Trim(Ponto_Virgula(Nro_Str));

           // *** Totaliza os Adicionais ***

           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('select * from Adicionais_Lista, Agenda Where (Adicional_lista_data >= #'+Data_Busca_I+'# And Adicional_lista_data <= #'+Data_Busca_F+'#) And (Adicional_lista_data = Agenda_data) And (Adicional_lista_hora = Agenda_hora) And (Agenda_tipo = '+#39+'CONSULTA'+#39+' Or Agenda_tipo = '+#39+'CIRURGIA'+#39+') And Agenda_status = '+#39+'ATENDIDO'+#39+' And (Agenda_descricao_convenio = '+#39+UpperCase(Trim(faturamento_convenio.Text))+#39+')');
           conexaoBD.SQL_Comunitario_Aux.Open;

           Adicional_Qtde := Adicional_Qtde + conexaoBD.SQL_Comunitario_Aux.RecordCount;
           faturamento_adicionais_qtde.Text := IntToStr(Adicional_Qtde);

           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('select SUM(Adicional_lista_valor) As Adicional_Total from Adicionais_Lista, Agenda Where (Adicional_lista_data >= #'+Data_Busca_I+'# And Adicional_lista_data <= #'+Data_Busca_F+'#) And (Adicional_lista_data = Agenda_data) And (Adicional_lista_hora = Agenda_hora) And (Agenda_tipo = '+#39+'CONSULTA'+#39+' Or Agenda_tipo = '+#39+'CIRURGIA'+#39+') And Agenda_status = '+#39+'ATENDIDO'+#39+' And (Agenda_descricao_convenio = '+#39+UpperCase(Trim(faturamento_convenio.Text))+#39+')');
           conexaoBD.SQL_Comunitario_Aux.Open;

           If conexaoBD.SQL_Comunitario_Aux.FieldValues['Adicional_Total'] <> Null Then
              begin
              Total_Adicionais := Total_Adicionais + conexaoBD.SQL_Comunitario_Aux.FieldValues['Adicional_Total'];
           end;

           {*** Totaliza o Faturamento ***}

           Total_Cirurgia := (Cirurgia_Qtde * Cirurgia_CH);
           Total_Cirurgia := Total_Cirurgia + Total_Cirurgia_Tipo;
           Total_Cirurgia := Total_Cirurgia + Total_Valor_Cirurgia;
           Str(Total_Cirurgia:13:2,Nro_Str);
           faturamento_total_cirurgia.Text := Trim(Ponto_Virgula(Nro_Str));

           Total_Consulta := (Consulta_Qtde * Consulta_CH);
           Str(Total_Consulta:13:2,Nro_Str);
           faturamento_total_consulta.Text := Trim(Ponto_Virgula(Nro_Str));

           Str((Total_Adicionais):13:2,Nro_Str);
           faturamento_total_adicionais.Text := Trim(Ponto_Virgula(Nro_Str));

           Total_Geral := (Total_Consulta + Total_Cirurgia + Total_Adicionais + Valor_Material);
           Str(Total_Geral:13:2,Nro_Str);
           faturamento_total_geral.Text := Trim(Ponto_Virgula(Nro_Str));
           end
        Else
           begin
           Valor_Material   := 0;

           Adicional_Qtde   := 0;
           Total_Adicionais := 0;

           Consulta_Total := 0;
           Cirurgia_Total := 0;

           Consulta_CH_Total := 0;
           Cirurgia_CH_Total := 0;

           Valor_Cirurgia       := 0;
           Valor_Cirurgia_Qtde  := 0;
           Total_Valor_Cirurgia := 0;

           Total_Consulta_Geral := 0;
           Total_Cirurgia_Geral := 0;

           {*** Busca a Quantidade de Adicionais Atendidos ***}

           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('select * from Adicionais_Lista, Agenda Where (Adicional_lista_data >= #'+Data_Busca_I+'# And Adicional_lista_data <= #'+Data_Busca_F+'#) And (Adicional_lista_data = Agenda_data) And (Adicional_lista_hora = Agenda_hora) And Agenda_tipo = '+#39+'ADICIONAL'+#39+' And Agenda_status = '+#39+'ATENDIDO'+#39);
           conexaoBD.SQL_Comunitario_Aux.Open;

           Adicional_Qtde := conexaoBD.SQL_Comunitario_Aux.RecordCount;
           faturamento_adicionais_qtde.Text := IntToStr(Adicional_Qtde);

           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('select SUM(Adicional_lista_valor) As Adicional_Total from Adicionais_Lista, Agenda Where (Adicional_lista_data >= #'+Data_Busca_I+'# And Adicional_lista_data <= #'+Data_Busca_F+'#) And (Adicional_lista_data = Agenda_data) And (Adicional_lista_hora = Agenda_hora) And Agenda_tipo = '+#39+'ADICIONAL'+#39+' And Agenda_status = '+#39+'ATENDIDO'+#39);
           conexaoBD.SQL_Comunitario_Aux.Open;

           If conexaoBD.SQL_Comunitario_Aux.FieldValues['Adicional_Total'] <> Null Then
              begin
              Total_Adicionais := conexaoBD.SQL_Comunitario_Aux.FieldValues['Adicional_Total'];
           end;

           {*** Busca a Quantidade de Consultas Atendidas ***}

           conexaoBD.SQL_Comunitario.Close;
           conexaoBD.SQL_Comunitario.SQL.Clear;
           conexaoBD.SQL_Comunitario.SQL.Add('select Agenda_descricao_convenio from Agenda where (Agenda_data >= #'+Data_Busca_I+'#'+
           ' and Agenda_data <= #'+Data_Busca_F+'#)'+
           ' and (Agenda_tipo = "CONSULTA" and Agenda_status = "ATENDIDO") Group By Agenda_descricao_convenio Order By Agenda_descricao_convenio');
           conexaoBD.SQL_Comunitario.Open;

           If conexaoBD.SQL_Comunitario.RecordCount > 0 Then
              begin

              conexaoBD.SQL_Comunitario.First;

              While Not conexaoBD.SQL_Comunitario.Eof Do
                    begin
                    Convenio_Ant := conexaoBD.SQL_Comunitario.FieldValues['Agenda_descricao_convenio'];

                    conexaoBD.SQL_Agenda_FAT.Close;
                    conexaoBD.SQL_Agenda_FAT.SQL.Clear;
                    conexaoBD.SQL_Agenda_FAT.SQL.Add('select * from Agenda where (Agenda_data >= #'+Data_Busca_I+'#'+
                    ' and Agenda_data <= #'+Data_Busca_F+'#)'+
                    ' and (Agenda_tipo = "CONSULTA" and Agenda_status = "ATENDIDO")'+
                    ' and (Agenda_descricao_convenio = "'+UpperCase(Trim(Convenio_Ant))+'")');
                    conexaoBD.SQL_Agenda_FAT.Open;

                    Consulta_Qtde  := conexaoBD.SQL_Agenda_FAT.RecordCount;
                    Consulta_Total := Consulta_Total + Consulta_Qtde;

                    {*** Busca os Valores de CH do Convênio ***}

                    conexaoBD.SQL_Convenio_FAT.Close;
                    conexaoBD.SQL_Convenio_FAT.SQL.Clear;
                    conexaoBD.SQL_Convenio_FAT.SQL.Add('select * from Convenio where Convenio_apelido = "'+UpperCase(Trim(Convenio_Ant))+'"');
                    conexaoBD.SQL_Convenio_FAT.Open;

                    Consulta_CH := conexaoBD.SQL_Convenio_FAT.FieldValues['Convenio_valor_consulta'];
                    Consulta_CH_Total := Consulta_CH_Total + Consulta_CH;

                    Total_Consulta       := (Consulta_Qtde * Consulta_CH);
                    Total_Consulta_Geral := Total_Consulta_Geral + Total_Consulta;

                    conexaoBD.SQL_Comunitario.Next;
              end;
           end;

           {*** Busca o Valor do Material das Cirurgias ***}

           conexaoBD.SQL_Agenda_FAT.Close;
           conexaoBD.SQL_Agenda_FAT.SQL.Clear;
           conexaoBD.SQL_Agenda_FAT.SQL.Add('select SUM(Agenda_valor_material_cirurgia) As Agenda_Total_Material from Agenda where (Agenda_data >= #'+Data_Busca_I+'#'+
           ' and Agenda_data <= #'+Data_Busca_F+'#)'+
           ' and (Agenda_tipo = "CIRURGIA" and Agenda_status = "ATENDIDO")');
           conexaoBD.SQL_Agenda_FAT.Open;

           If conexaoBD.SQL_Agenda_FAT.FieldValues['Agenda_Total_Material'] <> Null Then
              begin
              Valor_Material := conexaoBD.SQL_Agenda_FAT.FieldValues['Agenda_Total_Material'];
           end;

           Str(Valor_Material:13:2,Nro_Str);
           faturamento_total_material.Text := Trim(Ponto_Virgula(Nro_Str));

          {*** Busca o Valor das Cirurgias Atendidas Com o Valor Fixo (Não podem Calcular o CH) ***}

           conexaoBD.SQL_Agenda_FAT.Close;
           conexaoBD.SQL_Agenda_FAT.SQL.Clear;
           conexaoBD.SQL_Agenda_FAT.SQL.Add('select * from Agenda where (Agenda_data >= #'+Data_Busca_I+'#'+
           ' and Agenda_data <= #'+Data_Busca_F+'#)'+
           ' and (Agenda_tipo = "CIRURGIA" and Agenda_status = "ATENDIDO")'+
           ' and (Agenda_valor_cirurgia > 0)');
           conexaoBD.SQL_Agenda_FAT.Open;

           If conexaoBD.SQL_Agenda_FAT.RecordCount > 0 Then
              begin

              Valor_Cirurgia_Qtde := conexaoBD.SQL_Agenda_FAT.RecordCount;

              conexaoBD.SQL_Agenda_FAT.First;

              While Not conexaoBD.SQL_Agenda_FAT.Eof Do
                    begin

                    If conexaoBD.SQL_Agenda_FAT.FieldValues['Agenda_Valor_Cirurgia'] <> Null Then
                       begin
                       Valor_Cirurgia := conexaoBD.SQL_Agenda_FAT.FieldValues['Agenda_Valor_Cirurgia'];
                       end
                    Else
                       begin
                       Valor_Cirurgia := 0;
                    End;

                    Total_Valor_Cirurgia := Total_Valor_Cirurgia + Valor_Cirurgia;

                    conexaoBD.SQL_Agenda_FAT.Next;
              end;
           end;

           {*** Busca a Quantidade de Cirurgias Atendidas Sem o Tipo da Cirurgia ***}

           conexaoBD.SQL_Comunitario.Close;
           conexaoBD.SQL_Comunitario.SQL.Clear;
           conexaoBD.SQL_Comunitario.SQL.Add('select Agenda_descricao_convenio from Agenda where (Agenda_data >= #'+Data_Busca_I+'#'+
           ' and Agenda_data <= #'+Data_Busca_F+'#)'+
           ' and (Agenda_tipo = "CIRURGIA" and Agenda_tipo_cirurgia = "" and Agenda_status = "ATENDIDO")'+
           ' and (Agenda_valor_cirurgia <= 0) Group By Agenda_descricao_convenio Order By Agenda_descricao_convenio');
           conexaoBD.SQL_Comunitario.Open;

           If conexaoBD.SQL_Comunitario.RecordCount > 0 Then
              begin

              conexaoBD.SQL_Comunitario.First;

              While Not conexaoBD.SQL_Comunitario.Eof Do
                    begin
                    Convenio_Ant := conexaoBD.SQL_Comunitario.FieldValues['Agenda_descricao_convenio'];

                    conexaoBD.SQL_Agenda_FAT.Close;
                    conexaoBD.SQL_Agenda_FAT.SQL.Clear;
                    conexaoBD.SQL_Agenda_FAT.SQL.Add('select * from Agenda where (Agenda_data >= #'+Data_Busca_I+'#'+
                    ' and Agenda_data <= #'+Data_Busca_F+'#)'+
                    ' and (Agenda_tipo = "CIRURGIA" and Agenda_tipo_cirurgia = "" and Agenda_status = "ATENDIDO")'+
                    ' and (Agenda_descricao_convenio = "'+UpperCase(Trim(Convenio_Ant))+'")'+
                    ' and (Agenda_valor_cirurgia <= 0)');
                    conexaoBD.SQL_Agenda_FAT.Open;

                    Cirurgia_Qtde  := conexaoBD.SQL_Agenda_FAT.RecordCount;
                    Cirurgia_Total := Cirurgia_Total + Cirurgia_Qtde;

                    {*** Busca os Valores de CH do Convênio ***}

                    conexaoBD.SQL_Convenio_FAT.Close;
                    conexaoBD.SQL_Convenio_FAT.SQL.Clear;
                    conexaoBD.SQL_Convenio_FAT.SQL.Add('select * from Convenio where Convenio_apelido = "'+UpperCase(Trim(Convenio_Ant))+'"');
                    conexaoBD.SQL_Convenio_FAT.Open;

                    Cirurgia_CH := conexaoBD.SQL_Convenio_FAT.FieldValues['Convenio_valor_ch'];
                    Cirurgia_CH_Total := Cirurgia_CH_Total + Cirurgia_CH;

                    Total_Cirurgia       := (Cirurgia_Qtde * Cirurgia_CH);
                    Total_Cirurgia_Geral := Total_Cirurgia_Geral + Total_Cirurgia;

                    conexaoBD.SQL_Comunitario.Next;
              end;
           end;

           {*** Busca a Quantidade de Cirurgias Atendidas Com o Tipo da Cirurgia ***}

           Cirurgia_CH_Tipo         := 0;
           Valor_CH_Tipo            := 0;
           Total_Cirurgia_Tipo      := 0;
           Cirurgia_Qtde_Tipo       := 0;
           Cirurgia_Qtde_Tipo_Total := 0;

           conexaoBD.SQL_Comunitario.Close;
           conexaoBD.SQL_Comunitario.SQL.Clear;
           conexaoBD.SQL_Comunitario.SQL.Add('select Agenda_convenio, Agenda_tipo_cirurgia from Agenda where (Agenda_data >= #'+Data_Busca_I+'#'+
           ' and Agenda_data <= #'+Data_Busca_F+'#)'+
           ' and (Agenda_tipo = "CIRURGIA" and Agenda_tipo_cirurgia <> "" and Agenda_status = "ATENDIDO")'+
           ' and (Agenda_valor_cirurgia <= 0) Group By Agenda_convenio, Agenda_tipo_cirurgia Order By Agenda_convenio, Agenda_tipo_cirurgia');
           conexaoBD.SQL_Comunitario.Open;

           If conexaoBD.SQL_Comunitario.RecordCount > 0 Then
              begin

              conexaoBD.SQL_Comunitario.First;

              While Not conexaoBD.SQL_Comunitario.Eof Do
                    begin

                    Convenio_Ant  := conexaoBD.SQL_Comunitario.FieldValues['Agenda_convenio'];
                    Cirurgia_Tipo := conexaoBD.SQL_Comunitario.FieldValues['Agenda_tipo_cirurgia'];

                    conexaoBD.SQL_Agenda_FAT.Close;
                    conexaoBD.SQL_Agenda_FAT.SQL.Clear;
                    conexaoBD.SQL_Agenda_FAT.SQL.Add('select * from Agenda where (Agenda_data >= #'+Data_Busca_I+'#'+
                    ' and Agenda_data <= #'+Data_Busca_F+'#)'+
                    ' and (Agenda_tipo = "CIRURGIA" and Agenda_tipo_cirurgia <> "" and Agenda_status = "ATENDIDO")'+
                    ' and (Agenda_convenio ='+Trim(Convenio_ANT)+' and Agenda_tipo_cirurgia = "'+Trim(Cirurgia_tipo)+'")'+
                    ' and (Agenda_valor_cirurgia <= 0)');
                    conexaoBD.SQL_Agenda_FAT.Open;

                    Cirurgia_Qtde_Tipo       := 0;
                    Cirurgia_Qtde_Tipo       := conexaoBD.SQL_Agenda_FAT.RecordCount;
                    Cirurgia_Qtde_Tipo_Total := Cirurgia_Qtde_Tipo_Total + Cirurgia_Qtde_Tipo;

                    {*** Busca a Qtde de CH da Cirurgia ***}

                    conexaoBD.SQL_Comunitario_Aux.Close;
                    conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
                    conexaoBD.SQL_Comunitario_Aux.SQL.Add('select * from Cirurgia where Cirurgia_codigo = '+#39+ Trim(Cirurgia_Tipo) +#39);
                    conexaoBD.SQL_Comunitario_Aux.Open;

                    If conexaoBD.SQL_Comunitario_Aux.RecordCount > 0 Then
                       begin
                       Cirurgia_CH_Tipo := conexaoBD.SQL_Comunitario_Aux.FieldValues['Cirurgia_quantidade_ch'];
                    end;

                    {*** Busca os Valores de CH do Convênio ***}

                    conexaoBD.SQL_Convenio_FAT.Close;
                    conexaoBD.SQL_Convenio_FAT.SQL.Clear;
                    conexaoBD.SQL_Convenio_FAT.SQL.Add('select * from Convenio where Convenio_numero = '+Trim(Convenio_Ant));
                    conexaoBD.SQL_Convenio_FAT.Open;

                    Valor_CH_Tipo       := conexaoBD.SQL_Convenio_FAT.FieldValues['Convenio_valor_ch'];
                    Cirurgia_CH_Total   := Cirurgia_CH_Total + Valor_CH_Tipo;
                    Total_Cirurgia_Tipo := Total_Cirurgia_Tipo + ((Cirurgia_Qtde_Tipo * Cirurgia_CH_Tipo) * Valor_CH_Tipo);

                    conexaoBD.SQL_Comunitario.Next;
              end;
           end;

           faturamento_consulta_qtde.Text := Trim(IntToStr(Consulta_Total));
           faturamento_cirurgia_qtde.Text := Trim(IntToStr((Cirurgia_Total + Cirurgia_Qtde_Tipo_Total + Valor_Cirurgia_Qtde)));

           Str((Cirurgia_CH_Total):13:2,Nro_Str);
           faturamento_cirurgia_ch.Text := Trim(Ponto_Virgula(Nro_Str));

           Str(Consulta_CH_Total:13:2,Nro_Str);
           faturamento_consulta_ch.Text := Trim(Ponto_Virgula(Nro_Str));

           // *** Totaliza os Adicionais ***

           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('select * from Adicionais_Lista, Agenda Where (Adicional_lista_data >= #'+Data_Busca_I+'# And Adicional_lista_data <= #'+Data_Busca_F+'#) And (Adicional_lista_data = Agenda_data) And (Adicional_lista_hora = Agenda_hora) And (Agenda_tipo = '+#39+'CONSULTA'+#39+' Or Agenda_tipo = '+#39+'CIRURGIA'+#39+') And Agenda_status = '+#39+'ATENDIDO'+#39);
           conexaoBD.SQL_Comunitario_Aux.Open;

           Adicional_Qtde := Adicional_Qtde + conexaoBD.SQL_Comunitario_Aux.RecordCount;
           faturamento_adicionais_qtde.Text := IntToStr(Adicional_Qtde);

           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('select SUM(Adicional_lista_valor) As Adicional_Total from Adicionais_Lista, Agenda Where (Adicional_lista_data >= #'+Data_Busca_I+'# And Adicional_lista_data <= #'+Data_Busca_F+'#) And (Adicional_lista_data = Agenda_data) And (Adicional_lista_hora = Agenda_hora) And (Agenda_tipo = '+#39+'CONSULTA'+#39+' Or Agenda_tipo = '+#39+'CIRURGIA'+#39+') And Agenda_status = '+#39+'ATENDIDO'+#39);
           conexaoBD.SQL_Comunitario_Aux.Open;

           If conexaoBD.SQL_Comunitario_Aux.FieldValues['Adicional_Total'] <> Null Then
              begin
              Total_Adicionais := Total_Adicionais + conexaoBD.SQL_Comunitario_Aux.FieldValues['Adicional_Total'];
           end;

           {*** Totaliza o Faturamento ***}

           Str((Total_Cirurgia_Geral + Total_Cirurgia_Tipo + Total_Valor_Cirurgia):13:2,Nro_Str);
           faturamento_total_cirurgia.Text := Trim(Ponto_Virgula(Nro_Str));

           Str(Total_Consulta_Geral:13:2,Nro_Str);
           faturamento_total_consulta.Text := Trim(Ponto_Virgula(Nro_Str));

           Str((Total_Adicionais):13:2,Nro_Str);
           faturamento_total_adicionais.Text := Trim(Ponto_Virgula(Nro_Str));

           Total_Geral := (Total_Consulta_Geral + (Total_Cirurgia_Geral + Total_Cirurgia_Tipo + Total_Valor_Cirurgia) + Total_Adicionais + Valor_Material);
           Str(Total_Geral:13:2,Nro_Str);
           faturamento_total_geral.Text := Trim(Ponto_Virgula(Nro_Str));
        end;
     end;

     Cursor_Normal();
end;

procedure TFaturamento.faturamento_consulta_qtdeKeyPress(Sender: TObject;
  var Key: Char);
begin

     if key = #13 then
        begin
        faturamento_consulta_ch.SetFocus;
     end;

     if not(key in ['0'..'9','.',',',#8,#13]) then
        key := #0;
     if key in [',','.'] then
        key := #0;
     if key = DecimalSeparator then
        if pos(key,TEdit(Sender).Text) <> 0 then
           key := #0;
end;

procedure TFaturamento.faturamento_cirurgia_qtdeKeyPress(Sender: TObject;
  var Key: Char);
begin

     if key = #13 then
        begin
        faturamento_cirurgia_ch.SetFocus;
     end;

     if not(key in ['0'..'9','.',',',#8,#13]) then
        key := #0;
     if key in [',','.'] then
        key := #0;
     if key = DecimalSeparator then
        if pos(key,TEdit(Sender).Text) <> 0 then
           key := #0;
end;

procedure TFaturamento.faturamento_consulta_chKeyPress(Sender: TObject;
  var Key: Char);
begin

     if key = #13 then
        begin
        faturamento_cirurgia_qtde.SetFocus;
     end;

     if not(key in ['0'..'9','.',',',#8,#13]) then
        key := #0;
     if key in [',','.'] then
        key := DecimalSeparator;
     if key = DecimalSeparator then
        if pos(key,TEdit(Sender).Text) <> 0 then
           key := #0;
end;

procedure TFaturamento.faturamento_cirurgia_chKeyPress(Sender: TObject;
  var Key: Char);
begin

     if key = #13 then
        begin
        BT_Recalcular.SetFocus;
     end;

     if not(key in ['0'..'9','.',',',#8,#13]) then
        key := #0;
     if key in [',','.'] then
        key := DecimalSeparator;
     if key = DecimalSeparator then
        if pos(key,TEdit(Sender).Text) <> 0 then
           key := #0;
end;

procedure TFaturamento.faturamento_total_consultaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not(key in ['0'..'9','.',',',#8,#13]) then
        key := #0;
     if key in [',','.'] then
        key := DecimalSeparator;
     if key = DecimalSeparator then
        if pos(key,TEdit(Sender).Text) <> 0 then
           key := #0;
end;

procedure TFaturamento.faturamento_total_cirurgiaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not(key in ['0'..'9','.',',',#8,#13]) then
        key := #0;
     if key in [',','.'] then
        key := DecimalSeparator;
     if key = DecimalSeparator then
        if pos(key,TEdit(Sender).Text) <> 0 then
           key := #0;
end;

procedure TFaturamento.faturamento_total_geralKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not(key in ['0'..'9','.',',',#8,#13]) then
        key := #0;
     if key in [',','.'] then
        key := DecimalSeparator;
     if key = DecimalSeparator then
        if pos(key,TEdit(Sender).Text) <> 0 then
           key := #0;
end;

procedure TFaturamento.BT_RecalcularClick(Sender: TObject);

var
   Cirurgia_CH, Consulta_CH, Total_Cirurgia, Total_Consulta, Total_Geral, Total_Adicionais, I: Real;
   Cirurgia_Qtde, Consulta_Qtde, Erro: Integer;
   Nro_Str: String;

begin
     Cursor_Ampulheta();

{*** Recalcula o Total do Faturamento ***}

     if Length(Trim(faturamento_cirurgia_ch.Text)) <= 0 then
        begin
        faturamento_cirurgia_ch.Text := '0';
     end;

     if Length(Trim(faturamento_cirurgia_qtde.Text)) <= 0 then
        begin
        faturamento_cirurgia_qtde.Text := '0';
     end;

     if Length(Trim(faturamento_consulta_ch.Text)) <= 0 then
        begin
        faturamento_consulta_ch.Text := '0';
     end;

     if Length(Trim(faturamento_consulta_qtde.Text)) <= 0 then
        begin
        faturamento_consulta_qtde.Text := '0';
     end;

     if Length(Trim(faturamento_total_consulta.Text)) <= 0 then
        begin
        faturamento_total_consulta.Text := '0';
     end;

     if Length(Trim(faturamento_total_cirurgia.Text)) <= 0 then
        begin
        faturamento_total_cirurgia.Text := '0';
     end;

     if Length(Trim(faturamento_total_geral.Text)) <= 0 then
        begin
        faturamento_total_geral.Text := '0';
     end;

     if Length(Trim(faturamento_total_adicionais.Text)) <= 0 then
        begin
        faturamento_total_adicionais.Text := '0';
     end;

     if Length(Trim(faturamento_adicionais_qtde.Text)) <= 0 then
        begin
        faturamento_adicionais_qtde.Text := '0';
     end;

{*** Calcula a Cirurgia ***}

     Cirurgia_Qtde := StrToInt(faturamento_cirurgia_qtde.Text);

     Val(Virgula_Ponto(faturamento_cirurgia_ch.Text),I,Erro);
     Cirurgia_CH   := I;

     Total_Cirurgia := (Cirurgia_Qtde * Cirurgia_CH);
     Str(Total_Cirurgia:13:2,Nro_Str);
     faturamento_total_cirurgia.Text := Trim(Ponto_Virgula(Nro_Str));

{*** Calcula a Consulta ***}

     Consulta_Qtde := StrToInt(faturamento_consulta_qtde.Text);

     Val(Virgula_Ponto(faturamento_consulta_ch.Text),I,Erro);
     Consulta_CH   := I;

     Total_Consulta := (Consulta_Qtde * Consulta_CH);
     Str(Total_Consulta:13:2,Nro_Str);
     faturamento_total_consulta.Text := Trim(Ponto_Virgula(Nro_Str));

{*** Calcula o Total de Adicionais ***}

     Val(Virgula_Ponto(faturamento_total_adicionais.Text),I,Erro);
     Total_Adicionais := I;
     
{*** Calcula o Total Geral ***}

     Total_Geral := (Total_Consulta + Total_Cirurgia + Total_Adicionais);
     Str(Total_Geral:13:2,Nro_Str);
     faturamento_total_geral.Text := Trim(Ponto_Virgula(Nro_Str));

     faturamento_cirurgia_ch.Text   := Trim(Ponto_Virgula(faturamento_cirurgia_ch.Text));
     faturamento_cirurgia_qtde.Text := Trim(Ponto_Virgula(faturamento_cirurgia_qtde.Text));
     faturamento_consulta_ch.Text   := Trim(Ponto_Virgula(faturamento_consulta_ch.Text));
     faturamento_consulta_qtde.Text := Trim(Ponto_Virgula(faturamento_consulta_qtde.Text));

     Cursor_Normal();

     BT_Imprimir.SetFocus;
end;

procedure TFaturamento.BT_ImprimirClick(Sender: TObject);
begin
     Cursor_Ampulheta();

     Application.CreateForm(TRel_Faturamento,Rel_Faturamento);

{*** Carrega os Valores do Relatório ***}

     Rel_Faturamento.QRL_Dt_Inicio.Caption        := faturamento_inicio.Text;
     Rel_Faturamento.QRL_Dt_Final.Caption         := faturamento_final.Text;

     Rel_Faturamento.QRL_Convenio.Caption         := faturamento_convenio.Text;

     Rel_Faturamento.QRL_Consulta_Qtde.Caption    := faturamento_consulta_qtde.Text;
     Rel_Faturamento.QRL_Consulta_CH.Caption      := faturamento_consulta_ch.Text;

     Rel_Faturamento.QRL_Cirurgia_Qtde.Caption    := faturamento_cirurgia_qtde.Text;
     Rel_Faturamento.QRL_Cirurgia_CH.Caption      := faturamento_cirurgia_ch.Text;

     Rel_Faturamento.QRL_Adicionais_Qtde.Caption  := faturamento_adicionais_qtde.Text;
     Rel_Faturamento.QRL_Total_Adicionais.Caption := faturamento_total_adicionais.Text;

     Rel_Faturamento.QRL_Total_Consulta.Caption   := faturamento_total_consulta.Text;
     Rel_Faturamento.QRL_Total_Cirurgia.Caption   := faturamento_total_cirurgia.Text;

     Rel_Faturamento.QRL_Total_Material.Caption   := faturamento_total_material.Text;

     Rel_Faturamento.QRL_Total_Geral.Caption      := faturamento_total_geral.Text;

     Rel_Faturamento.QRL_Nome_medico.Caption      := Cons02.ConsulTEX_Medico.Text;

     Cursor_Normal();

{*** Exibe o Relatório ***}

     Rel_Faturamento.RPT_Faturamento.PreviewModal;
     Rel_Faturamento.RPT_Faturamento.Destroy;
     Rel_Faturamento.Destroy;
end;

procedure TFaturamento.faturamento_inicioKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   faturamento_final.SetFocus;
end;

end;

procedure TFaturamento.faturamento_finalKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   faturamento_convenio.SetFocus;
end;

end;

procedure TFaturamento.faturamento_convenioKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   BT_Calcular.SetFocus;
end;

end;

procedure TFaturamento.faturamento_inicioExit(Sender: TObject);
begin
     If Valida_Data(faturamento_inicio.Text) = False Then
        begin
        MSG_Erro('Data Inválida!');
        faturamento_inicio.SetFocus;
     end;
end;

procedure TFaturamento.faturamento_finalExit(Sender: TObject);
begin
     If Valida_Data(faturamento_final.Text) = False Then
        begin
        MSG_Erro('Data Inválida!');
        faturamento_final.SetFocus;
     end;
end;

procedure TFaturamento.BT_DetalhadoClick(Sender: TObject);

var
   Data_Busca_I, Data_Busca_F: String;

begin
     if Valida_Faturamento_Calculo() = True then
        begin
        Cursor_Ampulheta();

        Data_Busca_I := faturamento_inicio.Text;
        Data_Busca_I := Inverte_Data(Data_Busca_I);

        Data_Busca_F := faturamento_final.Text;
        Data_Busca_F := Inverte_Data(Data_Busca_F);

{*** Seleciona as Informações para o Relatório ***}

        If Trim(faturamento_convenio.Text) <> '--- Total Geral ---' Then
           begin
           conexaoBD.SQL_Rel_Detalhado.Close;
           conexaoBD.SQL_Rel_Detalhado.SQL.Clear;
           conexaoBD.SQL_Rel_Detalhado.SQL.Add('select Agenda_descricao_convenio, Agenda_tipo, Agenda_tipo_cirurgia, Agenda_cirurgia_descricao, Agenda_quantidade_ch, Agenda_valor_ch,'+
           'SUM(Agenda_valor_material_cirurgia) As Total_Material, '+
           'SUM(Agenda_valor_cirurgia) As Total_Valor_Cirurgia, COUNT(*) As Total_Qtde'+
           ' from Agenda '+
           'where (Agenda_data >= #'+Data_Busca_I+'#'+' and Agenda_data <= #'+Data_Busca_F+'#) '+
           'and (Agenda_descricao_convenio = "'+UpperCase(Trim(faturamento_convenio.Text))+'") '+
           'and ((Agenda_tipo = "CONSULTA" Or Agenda_tipo = "CIRURGIA") and Agenda_status = "ATENDIDO") '+
           'Group By Agenda_descricao_convenio, Agenda_tipo, Agenda_tipo_cirurgia, Agenda_cirurgia_descricao, Agenda_quantidade_ch, Agenda_valor_ch '+
           'Order By Agenda_descricao_convenio, Agenda_tipo, Agenda_tipo_cirurgia, Agenda_cirurgia_descricao, Agenda_quantidade_ch, Agenda_valor_ch');
           conexaoBD.SQL_Rel_Detalhado.Open;
           end
        Else
           begin
           conexaoBD.SQL_Rel_Detalhado.Close;
           conexaoBD.SQL_Rel_Detalhado.SQL.Clear;
           conexaoBD.SQL_Rel_Detalhado.SQL.Add('select Agenda_descricao_convenio, Agenda_tipo, Agenda_tipo_cirurgia, Agenda_cirurgia_descricao, Agenda_quantidade_ch, Agenda_valor_ch, SUM(Agenda_valor_material_cirurgia) As Total_Material,'+
           'SUM(Agenda_valor_cirurgia) As Total_Valor_Cirurgia, COUNT(*) As Total_Qtde'+
           ' from Agenda '+
           'where (Agenda_data >= #'+Data_Busca_I+'#'+' and Agenda_data <= #'+Data_Busca_F+'#) '+           
           'and ((Agenda_tipo = "CONSULTA" Or Agenda_tipo = "CIRURGIA") and Agenda_status = "ATENDIDO") '+
           'Group By Agenda_descricao_convenio, Agenda_tipo, Agenda_tipo_cirurgia, Agenda_cirurgia_descricao, Agenda_quantidade_ch, Agenda_valor_ch '+
           'Order By Agenda_descricao_convenio, Agenda_tipo, Agenda_tipo_cirurgia, Agenda_cirurgia_descricao, Agenda_quantidade_ch, Agenda_valor_ch');
           conexaoBD.SQL_Rel_Detalhado.Open;
        end;

        Application.CreateForm(TRel_Faturamento_Detalhado,Rel_Faturamento_Detalhado);

{*** Carrega os Valores do Relatório ***}

        Rel_Faturamento_Detalhado.QRL_Dt_Inicio.Caption   := faturamento_inicio.Text;
        Rel_Faturamento_Detalhado.QRL_Dt_Final.Caption    := faturamento_final.Text;

        Rel_Faturamento_Detalhado.QRL_Nome_medico.Caption := Cons02.ConsulTEX_Medico.Text;

        Cursor_Normal();

        Rel_Faturamento_Detalhado.RPT_Detalhado.PreviewModal;
        Rel_Faturamento_Detalhado.RPT_Detalhado.Destroy;
        Rel_Faturamento_Detalhado.Destroy;
     end;
end;

end.
