unit Rel_03;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Rel_03A, Rel_03B;

type
  TRecibo = class(TFrame)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    Button1: TButton;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    recibo_data_emissao: TMaskEdit;
    recibo_paciente_nome: TEdit;
    recibo_valor: TEdit;
    recibo_discriminacao: TMemo;
    recibo_assinatura: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    recibo_inicio: TMaskEdit;
    Label5: TLabel;
    recibo_final: TMaskEdit;
    BT_recibo_emitido_imprimir: TButton;
    BT_recibo_imprimir: TButton;
    recibo_paciente_ficha: TEdit;
    recibo_paciente_nome_ant: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    BT_recibo_apagar: TButton;
    recibo_apagar: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure BT_recibo_imprimirClick(Sender: TObject);
    procedure recibo_valorKeyPress(Sender: TObject; var Key: Char);
    procedure BT_recibo_emitido_imprimirClick(Sender: TObject);
    procedure recibo_data_emissaoKeyPress(Sender: TObject; var Key: Char);
    procedure recibo_paciente_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure recibo_assinaturaKeyPress(Sender: TObject; var Key: Char);
    procedure recibo_inicioKeyPress(Sender: TObject; var Key: Char);
    procedure recibo_finalKeyPress(Sender: TObject; var Key: Char);
    procedure BT_recibo_apagarClick(Sender: TObject);
    procedure recibo_apagarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var RPT_Total: Real;

implementation

uses Cons_02, Rotinas_Gerais, Conexao_BD;

{$R *.dfm}

procedure TRecibo.Button1Click(Sender: TObject);
begin
     Fecha_Recibo();
end;

procedure TRecibo.BT_recibo_imprimirClick(Sender: TObject);

var
   Valor_Extenso, Valor_Normal, Valor_Busca, Data_Busca: String;
   Vlr_I, Erro: Integer;
   Vlr_F: Real;

begin
     if Valida_Recibo_Novo() = True then
        begin
        Cursor_Ampulheta();

        Valor_Extenso := Extenso(StrToFloat(recibo_valor.Text));
        Valor_Extenso := UpperCase(Copy(Valor_Extenso,1,1))+LowerCase(Copy(Valor_Extenso,2,Length(Valor_Extenso)));

        if UpperCase(Trim(recibo_paciente_nome.Text)) <> UpperCase(Trim(recibo_paciente_nome_ant.Text)) then
           begin
           recibo_paciente_ficha.Text := '0';
        end;

{*** Grava o Recibo na Tabela ***}

        Carrega_Recibo();
        conexaoBD.SQL_Recibo.Close;
        conexaoBD.SQL_Recibo.SQL.Clear;
        conexaoBD.SQL_Recibo.SQL.Add('insert into Recibo('+
        'Recibo_paciente_ficha,'+
        'Recibo_paciente_nome,'+
        'Recibo_valor,'+
        'Recibo_discriminacao,'+
        'Recibo_data_emissao,'+
        'Recibo_assinatura) '+
        'values("'+Cons02.Recibo1.recibo_paciente_ficha.Text+'",'+
        '"'+Cons02.Recibo1.recibo_paciente_nome.Text+'",'+
        '"'+Cons02.Recibo1.recibo_valor.Text+'",'+
        '"'+Cons02.Recibo1.recibo_discriminacao.Text+'",'+
        '"'+Cons02.Recibo1.recibo_data_emissao.Text+'",'+
        '"'+Cons02.Recibo1.recibo_assinatura.Text+'")');
        conexaoBD.SQL_Recibo.ExecSQL;

{*** Prepara a Emissão do Recibo ***}

        Valor_Busca := Virgula_Ponto(Cons02.Recibo1.recibo_valor.Text);

        Val(Valor_Busca, Vlr_I, Erro);
        Val(Valor_Busca, Vlr_F, Erro);

        if (Vlr_F - Vlr_I) <= 0 Then
           begin
           Valor_Busca := IntToStr(Vlr_I);
        end;

        Data_Busca := Cons02.Recibo1.recibo_data_emissao.Text;
        Data_Busca := Inverte_Data(Data_Busca);

        conexaoBD.SQL_Recibo.Close;
        conexaoBD.SQL_Recibo.SQL.Clear;
        conexaoBD.SQL_Recibo.SQL.Add('select * from Recibo '+
        'where (Recibo_paciente_ficha = "'+Cons02.Recibo1.recibo_paciente_ficha.Text+'" and '+
        'Recibo_paciente_nome = "'+Cons02.Recibo1.recibo_paciente_nome.Text+'" and '+
        'Recibo_valor = '+Valor_Busca+' and '+
        'Recibo_data_emissao = #'+Data_Busca+'#)');
        conexaoBD.SQL_Recibo.Open;

        if conexaoBD.SQL_Recibo.RecordCount > 1 Then
           begin
           while Not conexaoBD.SQL_Recibo.Eof do
                 begin
                 conexaoBD.SQL_Recibo.Next;
           end;
           conexaoBd.SQL_Recibo.Last;
        end;

        Valor_Normal := conexaoBD.SQL_Recibo.FieldValues['Recibo_numero'];

        Application.CreateForm(TRel_Recibo,Rel_Recibo);

        if Length(Valor_Normal) = 1 then
           begin
           Rel_Recibo.QR_recibo_numero.Caption := '000000'+Trim(Valor_Normal);
           end
        else if Length(Valor_Normal) = 2 then
           begin
           Rel_Recibo.QR_recibo_numero.Caption := '00000'+Trim(Valor_Normal);
           end
        else if Length(Valor_Normal) = 3 then
           begin
           Rel_Recibo.QR_recibo_numero.Caption := '0000'+Trim(Valor_Normal);
           end
        else if Length(Valor_Normal) = 4 then
           begin
           Rel_Recibo.QR_recibo_numero.Caption := '000'+Trim(Valor_Normal);
           end
        else if Length(Valor_Normal) = 5 then
           begin
           Rel_Recibo.QR_recibo_numero.Caption := '00'+Trim(Valor_Normal);
           end
        else if Length(Valor_Normal) = 6 then
           begin
           Rel_Recibo.QR_recibo_numero.Caption := '0'+Trim(Valor_Normal);
           end
        else
           begin
           Rel_Recibo.QR_recibo_numero.Caption := Trim(Valor_Normal);
        end;

        Rel_Recibo.QR_recibo_valor.Caption         := Ponto_Virgula(recibo_valor.Text);
        Rel_Recibo.QR_recibo_paciente_nome.Caption := recibo_paciente_nome.Text;

        Rel_Recibo.QR_Linha.Lines.Clear;
        Rel_Recibo.QR_Linha.Lines.Add(Valor_Extenso);

        Rel_recibo.QR_recibo_discriminacao.Lines   := recibo_discriminacao.Lines;
        Rel_recibo.QR_recibo_data_emissao.Caption  := recibo_data_emissao.Text;
        Rel_recibo.QR_recibo_assinatura.Caption    := recibo_assinatura.Text;

        Limpa_Recibo();
        Fecha_Recibo();

        Cursor_Normal();

        Rel_Recibo.RPT_Recibo.PreviewModal;
        Rel_Recibo.RPT_Recibo.Destroy;
        Rel_Recibo.Destroy;
      end;
end;

procedure TRecibo.recibo_valorKeyPress(Sender: TObject; var Key: Char);
begin

     if key = #13 then
        begin
        recibo_discriminacao.SetFocus;
     end;

     if not(key in ['0'..'9','.',',',#8,#13]) then
        key := #0;
     if key in [',','.'] then
        key := DecimalSeparator;
     if key = DecimalSeparator then
        if pos(key,TEdit(Sender).Text) <> 0 then
           key := #0;
end;

procedure TRecibo.BT_recibo_emitido_imprimirClick(Sender: TObject);

var
   Data_Busca_I, Data_Busca_F: String;

begin
     RPT_Total := 0;

     if Valida_Recibo_Ctrl() = True then
        begin
        Cursor_Ampulheta();

{*** Consulta o Período Escolhido ***}

        Data_Busca_I := recibo_inicio.Text;
        Data_Busca_I := Inverte_Data(Data_Busca_I);

        Data_Busca_F := recibo_final.Text;
        Data_Busca_F := Inverte_Data(Data_Busca_F);

        conexaoBD.SQL_Recibo.Close;
        conexaoBD.SQL_Recibo.SQL.Clear;
        conexaoBD.SQL_Recibo.SQL.Add('select * from Recibo where (Recibo_data_emissao >= #'+Data_Busca_I+'# and Recibo_data_emissao <= #'+Data_Busca_F+'#)');
        conexaoBD.SQL_Recibo.Open;

{*** Prepara a Emissão do Controle de Recibo ***}

        Application.CreateForm(TRel_Ctrl_Recibo,Rel_Ctrl_Recibo);

        Rel_Ctrl_Recibo.QRL_Dt_Inicio.Caption   := recibo_inicio.Text;
        Rel_Ctrl_Recibo.QRL_Dt_Final.Caption    := recibo_final.Text;

        Rel_Ctrl_Recibo.QRL_Nome_medico.Caption := Cons02.ConsulTEX_Medico.Text;

        Cursor_Normal();

        if conexaoBD.SQL_Recibo.RecordCount > 0 then
           begin
           Rel_Ctrl_Recibo.RPT_Ctrl_Recibo.PreviewModal;
           Rel_Ctrl_Recibo.RPT_Ctrl_Recibo.Destroy;
           end
        else
           begin
           MSG_Erro('Nenhum Recibo foi emitido no período de '+Trim(recibo_inicio.Text)+' até '+Trim(recibo_inicio.Text));
        end;

        Rel_Ctrl_Recibo.Destroy;

        Limpa_Recibo();
        Fecha_Recibo();
     end;
end;

procedure TRecibo.recibo_data_emissaoKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   recibo_paciente_nome.SetFocus;
end;

end;

procedure TRecibo.recibo_paciente_nomeKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   recibo_valor.SetFocus;
end;

end;

procedure TRecibo.recibo_assinaturaKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   BT_Recibo_Imprimir.SetFocus;
end;

end;

procedure TRecibo.recibo_inicioKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   recibo_final.SetFocus;
end;

end;

procedure TRecibo.recibo_finalKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   BT_Recibo_Emitido_Imprimir.SetFocus;
end;

end;

procedure TRecibo.BT_recibo_apagarClick(Sender: TObject);
begin
     if Valida_Recibo_Apagar() = True then
        begin

{*** Consulta o Recibo Escolhido ***}

        Cursor_Ampulheta();
        conexaoBD.SQL_Recibo.Close;
        conexaoBD.SQL_Recibo.SQL.Clear;
        conexaoBD.SQL_Recibo.SQL.Add('select * from Recibo where Recibo_numero = '+recibo_apagar.Text);
        conexaoBD.SQL_Recibo.Open;
        Cursor_Normal();

        if conexaoBD.SQL_Recibo.RecordCount > 0 Then
           begin
           Cursor_Ampulheta();
           conexaoBD.SQL_Recibo.Close;
           conexaoBD.SQL_Recibo.SQL.Clear;
           conexaoBD.SQL_Recibo.SQL.Add('delete from Recibo'+
           ' where Recibo_numero = '+recibo_apagar.Text);
           conexaoBD.SQL_Recibo.ExecSQL;
           conexaoBD.SQL_Recibo.Close;
           Cursor_Normal();

           MSG_Erro('O Recibo '+Trim(recibo_apagar.Text)+' foi apagado');
           Cons02.Recibo1.recibo_apagar.SetFocus;
           end
        else
           begin
           MSG_Erro('Nenhum Recibo foi encontrado');
           Cons02.Recibo1.recibo_apagar.SetFocus;
        end;

        Limpa_Recibo();

     end;
end;

procedure TRecibo.recibo_apagarKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   BT_recibo_apagar.SetFocus;
end;

end;

end.
