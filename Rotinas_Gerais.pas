unit Rotinas_Gerais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, ComCtrls, TabNotBk, DB, DBTables,
  DBCtrls, Conexao_BD;

type
  TNumeroStr = string;

const
  Unidades: array[1..19] of TNumeroStr = ('um', 'dois', 'três', 'quatro','cinco', 'seis', 'sete', 'oito', 'nove', 'dez', 'onze', 'doze', 'treze', 'quatorze', 'quinze', 'dezesseis', 'dezessete', 'dezoito','dezenove');
  Dezenas: array[1..9] of TNumeroStr = ('dez', 'vinte', 'trinta', 'quarenta','cinqüenta', 'sessenta', 'setenta', 'oitenta', 'noventa');
  Centenas: array[1..9] of TNumeroStr = ('cem', 'duzentos', 'trezentos','quatrocentos', 'quinhentos', 'seiscentos', 'setecentos', 'oitocentos','novecentos');
  ErrorString = 'Valor fora da faixa';
  Min = 0.01;
  Max = 4294967295.99;
  Moeda = ' real ';
  Moedas = ' reais ';
  Centesimo = ' centavo ';
  Centesimos = ' centavos ';

{*** Funções ***}

function Valida_CPF(num_cpf: String): Boolean;
function Valida_Preferencia():Boolean;
function Valida_Medico():Boolean;
function Valida_Convenio():Boolean;
function Valida_Indicacao():Boolean;
function Valida_Paciente():Boolean;
function Valida_Agenda():Boolean;
function Valida_Cid():Boolean;
function Valida_Cirurgia():Boolean;
function Valida_Adicionais():Boolean;
function Valida_Recibo_Novo():Boolean;
function Valida_Recibo_Ctrl():Boolean;
function Valida_Recibo_Apagar():Boolean;
function Valida_Faturamento_Calculo():Boolean;
function Ponto_Virgula(Valor: String): String;
function Virgula_Ponto(Valor: String): String;
function Calcula_Idade(DT_I: String; DT_F: String): String;
function Inverte_Data(DT: String): String;
function Prepara_Data(DT: String): String;
function Valida_Data(StrData: String):Boolean;
function Extenso(parmNumero: Real): String;
function ConversaoRecursiva(N: LongWord): String;
function Carrega_Conexao(): String;
function Confirma(strTexto: String): Integer;
function Numero_HD(FDrive:String): String;
function Obtem_Numero_Ficha(): String;
function MSG_Erro(strTexto: String): Integer;
function Remove_Aspas_Simples(Texto: String): String;
//A função abaixo pega um string informada como parâmetro e retira todas as letras acentuadas substituindo-as por letras correspondentes sem acento.
function AnsiToAscii(str: String): String;

{*** Procedures ***}

Procedure Seta();
Procedure Ampulheta();
procedure Cursor_Normal();
procedure Cursor_Ampulheta();
procedure Prepara_Hora();
procedure Data_Extenso();
procedure Verifica_Movto_Tela();
procedure Opcoes_Tela();
procedure Exibe_Tela();
procedure Inicializa_Tela();
procedure Inicializa_Agenda();
procedure Carrega_Tipo_Cirurgia_AG();
procedure Prepara_Agenda();
procedure Avanca_Tela();
procedure Retorna_Tela();
procedure Fecha_Preferencia();
procedure Fecha_Convenio();
procedure Fecha_Indicacao();
procedure Fecha_Cid();
procedure Fecha_Cirurgia();
procedure Fecha_Adicionais();
procedure Fecha_Recibo();
procedure Fecha_Faturamento();
procedure Fecha_Medico();
procedure Fecha_Tudo();
procedure Grava_Medico();
procedure Carrega_Lista_Pacientes();
procedure Carrega_Lista_Pacientes_AG();
procedure Carrega_Lista_Convenio();
procedure Carrega_Lista_Convenio_AG();
procedure Carrega_Lista_Convenio_FAT();
procedure Carrega_Lista_Indicacao();
procedure Carrega_Lista_Medico();
procedure Limpa_Convenio();
procedure Limpa_Indicacao();
procedure Limpa_Medico();
procedure Limpa_Paciente();
procedure Limpa_Agenda();
procedure Limpa_Cid();
procedure Limpa_Cirurgia();
procedure Limpa_Adicionais();
procedure Limpa_Recibo();
procedure Limpa_Faturamento();
procedure Limpa_Preferencia();
procedure Carrega_Paciente();
procedure Carrega_Agenda(Novo: Boolean);
procedure Carrega_Recibo();
procedure Carrega_Preferencia();
procedure Registro_Novo();
procedure Registro_Novo_AG();
procedure Registro_Apagar(Sender: TObject);
procedure Registro_Apagar_AG();
procedure Registro_Gravar();
procedure Registro_Gravar_AG();
procedure Procura_Cid();
procedure Procura_Cirurgia();
procedure Procura_Adicionais();
procedure Carrega_Campos_Alterados();
procedure Descarrega_Campos_Alterados();

procedure So_Valor(Sender: TObject; var Key: Char);
procedure So_Numero(Sender: TObject; var Key: Char);
procedure So_Letra(Sender: TObject; var Key: Char);


implementation

uses Cons_02, Agen_00, Login_00;

{************************************************************}
{*************************** Funções ************************}
{************************************************************}

function Valida_CPF(num_cpf: String): Boolean;

var
   n1,n2,n3,n4,n5,n6,n7,n8,n9: Integer;
   d1,d2,Ind: Integer;
   num, digitado, calculado: String;

begin
     num := '';

     for Ind := 0 to Length(num_cpf) do
         begin
         if (num_cpf[Ind] = '0') or
            (num_cpf[Ind] = '1') or
            (num_cpf[Ind] = '2') or
            (num_cpf[Ind] = '3') or
            (num_cpf[Ind] = '4') or
            (num_cpf[Ind] = '5') or
            (num_cpf[Ind] = '6') or
            (num_cpf[Ind] = '7') or
            (num_cpf[Ind] = '8') or
            (num_cpf[Ind] = '9') then
            begin
            num := num + num_cpf[Ind];
         end;
     end;

     num := trim(num);

     if Length(num) = 1 then
        begin
        num := '0000000000' + num;
        end
     else if Length(num) = 2 then
        begin
        num := '000000000' + num;
        end
     else if Length(num) = 3 then
        begin
        num := '00000000' + num;
        end
     else if Length(num) = 4 then
        begin
        num := '0000000' + num;
        end
     else if Length(num) = 5 then
        begin
        num := '000000' + num;
        end
     else if Length(num) = 6 then
        begin
        num := '00000' + num;
        end
     else if Length(num) = 7 then
        begin
        num := '0000' + num;
        end
     else if Length(num) = 8 then
        begin
        num := '000' + num;
        end
     else if Length(num) = 9 then
        begin
        num := '00' + num;
        end
     else if Length(num) = 10 then
        begin
        num := '0' + num;
     end;

     n1 := StrToInt(num[1]);
     n2 := StrToInt(num[2]);
     n3 := StrToInt(num[3]);
     n4 := StrToInt(num[4]);
     n5 := StrToInt(num[5]);
     n6 := StrToInt(num[6]);
     n7 := StrToInt(num[7]);
     n8 := StrToInt(num[8]);
     n9 := StrToInt(num[9]);
     d1 := n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
     d1 := 11-(d1 mod 11);

     if d1 >= 10 then
        begin
        d1 := 0;
     end;

     d2 := d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
     d2 := 11-(d2 mod 11);

     if d2>=10 then
        begin
        d2 := 0;
     end;

     calculado := inttostr(d1) + inttostr(d2);
     digitado  := num[10] + num[11];

     if calculado = digitado then
        begin
        Valida_CPF := True;
        end
     else
        begin
        Valida_CPF := False;
     end;
end;

function Valida_Preferencia():Boolean;

var
   Resultado: Boolean;

begin
     Resultado := False;

     if Cons02.Preferencia1.usuario_nome.Text = '' then
        begin
        MSG_Erro('O Nome não foi informado');
        Cons02.Preferencia1.usuario_nome.SetFocus;
        end
     else if Cons02.Preferencia1.usuario_senha.Text = '' then
        begin
        MSG_Erro('A Senha não foi informada');
        Cons02.Preferencia1.usuario_senha.SetFocus;
        end
     else
        begin
        Resultado := True;
     end;

     Valida_Preferencia := Resultado;
end;

function Valida_Medico():Boolean;

var
   Resultado: Boolean;

begin
     Resultado := False;

     if Cons02.Medico1.medico_crm.Text = '' then
        begin
        MSG_Erro('O C.R.M. do Médico não foi informado');
        Cons02.Medico1.medico_crm.SetFocus;
        end
     else if Cons02.Medico1.medico_nome.Text = '' then
        begin
        MSG_Erro('O Nome do Médico não foi informado');
        Cons02.Medico1.medico_nome.SetFocus;
        end
     else if Cons02.Medico1.medico_especialidade.Text = '' then
        begin
        MSG_Erro('A Especialidade do Médico não foi informada');
        Cons02.Medico1.medico_especialidade.SetFocus;
        end
     else
        begin
        if Cons02.Medico1.medico_cpf.Text <> '   .   .   -  ' then
           begin
           if Valida_CPF(Cons02.Medico1.medico_cpf.Text) = True then
              begin
              Resultado := True;
              end
           else
              begin
              MSG_Erro('O C.P.F. não confere');
              Cons02.Medico1.medico_cpf.SetFocus;
              Resultado := False;
           end;
           end
        else
           begin
           Resultado := True;
        end;
     end;

     Valida_Medico := Resultado;
end;

function Valida_Convenio():Boolean;

var
   Resultado: Boolean;

begin
     Resultado := False;

     if Cons02.Convenio1.convenio_razao_social.Text = '' then
        begin
        MSG_Erro('A Razão Social não foi informada');
        Cons02.convenio1.convenio_razao_social.SetFocus;
        end
     else if Cons02.convenio1.convenio_nome_fantasia.Text = '' then
        begin
        MSG_Erro('O Nome Fantasia não foi informado');
        Cons02.convenio1.convenio_nome_fantasia.SetFocus;
        end
     else if Cons02.convenio1.convenio_apelido.Text = '' then
        begin
        MSG_Erro('O Apelido não não foi informado');
        Cons02.convenio1.convenio_apelido.SetFocus;
        end
     else
        begin

        if Cons02.convenio1.convenio_qtde_ch.Text = '' then
           begin
           Cons02.convenio1.convenio_qtde_ch.Text := '0';
        end;

        if Cons02.convenio1.convenio_valor_ch.Text = '' then
           begin
           Cons02.convenio1.convenio_valor_ch.Text := '0';
        end;

        if Cons02.convenio1.convenio_valor_consulta.Text = '' then
           begin
           Cons02.convenio1.convenio_valor_consulta.Text := '0';
        end;

        if Cons02.convenio1.convenio_valor_cirurgia.Text = '' then
           begin
           Cons02.convenio1.convenio_valor_cirurgia.Text := '0';
        end;

        Resultado := True;
     end;

     Valida_Convenio := Resultado;
end;

function Valida_Indicacao():Boolean;

var
   Resultado: Boolean;

begin
     Resultado := False;

     if Cons02.Indicacao1.indicacao_nome.Text = '' then
        begin
        MSG_Erro('O Nome não informado');
        Cons02.Indicacao1.indicacao_nome.SetFocus;
        end
     else
        begin
        Resultado := True;
     end;

     Valida_Indicacao := Resultado;
end;

function Valida_Paciente():Boolean;

var
   Resultado: Boolean;

begin
     Resultado := False;

     if Cons02.Paciente1.paciente_nome.Text = '' then
        begin
        MSG_Erro('O Nome não foi informado');
        Cons02.Paciente1.paciente_nome.SetFocus;
        end
     else if Cons02.Paciente1.paciente_sobrenome.Text = '' then
        begin
        MSG_Erro('O SobreNome não foi informado');
        Cons02.Paciente1.paciente_sobrenome.SetFocus;
        end
     else if Trim(Cons02.Paciente1.paciente_dt_cadastro.Text) = '/  /' then
        begin
        MSG_Erro('A Data de Cadastro não foi informada');
        Cons02.Paciente1.paciente_dt_cadastro.SetFocus;
        end
     else if Trim(Cons02.Paciente1.paciente_dt_nascimento.Text) = '/  /' then
        begin
        MSG_Erro('A Data de Nascimento não foi informada');
        Cons02.Paciente1.paciente_dt_nascimento.SetFocus;
        end
     else if Cons02.Paciente1.paciente_sexo.Text = '' then
        begin
        MSG_Erro('O Sexo não foi informado');
        Cons02.Paciente1.paciente_sexo.SetFocus;
        end
     else if Cons02.Paciente1.paciente_situacao.Text = '' then
        begin
        MSG_Erro('A Situação não foi informada');
        Cons02.Paciente1.paciente_situacao.SetFocus;
        end
     else if Cons02.Paciente1.paciente_convenio.Text = '' then
        begin
        MSG_Erro('O Convenio não foi informado');
        Cons02.Paciente1.paciente_convenio.SetFocus;
        end
     else if Cons02.Paciente1.paciente_endereco.Text = '' then
        begin
        MSG_Erro('O Endereço não foi informado');
        Cons02.Paciente1.paciente_endereco.SetFocus;
        end
     else if Cons02.Paciente1.paciente_logradouro.Text = '' then
        begin
        MSG_Erro('O Logradouro não foi informado');
        Cons02.Paciente1.paciente_logradouro.SetFocus;
        end
     else if Cons02.Paciente1.paciente_bairro.Text = '' then
        begin
        MSG_Erro('O Bairro não foi informado');
        Cons02.Paciente1.paciente_bairro.SetFocus;
        end
     else if Cons02.Paciente1.paciente_cidade.Text = '' then
        begin
        MSG_Erro('A Cidade não foi informada');
        Cons02.Paciente1.paciente_cidade.SetFocus;
        end
     else if Cons02.Paciente1.paciente_uf.Text = '' then
        begin
        MSG_Erro('A Unidade de Federação não foi informada');
        Cons02.Paciente1.paciente_uf.SetFocus;
        end
     else if Cons02.Paciente1.paciente_instrucao.Text = '' then
        begin
        MSG_Erro('A Instrução não foi informada');
        Cons02.Paciente1.paciente_instrucao.SetFocus;
        end
     else if Cons02.Paciente1.paciente_estado_civil.Text = '' then
        begin
        MSG_Erro('O Estado Civil não foi informado');
        Cons02.Paciente1.paciente_estado_civil.SetFocus;
        end
     else
        begin

        if Cons02.Paciente1.paciente_cpf.Text <> '   .   .   -  ' then
           begin
           if Valida_CPF(Cons02.Paciente1.paciente_cpf.Text) = True then
              begin
              Resultado := True;
              end
           else
              begin
              MSG_Erro('O C.P.F. não confere');
              Cons02.Paciente1.paciente_cpf.SetFocus;
              Resultado := False;
           end;
           end
        else
           begin
           Resultado := True;
        end;
     end;

     Valida_Paciente := Resultado;
end;

function Valida_Agenda():Boolean;

var
   Resultado: Boolean;

begin
     Resultado := False;

     if Agenda.horario_hora.Text = '  :  ' then
        begin
        MSG_Erro('A Hora não foi informada');
        Agenda.horario_hora.SetFocus;
        end
     else if Agenda.horario_descricao.Text = '' then
        begin
        MSG_Erro('a Descrição / Paciente  não foi informada');
        Agenda.horario_descricao.SetFocus;
        end
     else
        begin
        Resultado := True;
     end;

     Valida_Agenda := Resultado;
end;

function Valida_Cid():Boolean;

var
   Resultado: Boolean;

begin
     Resultado := False;

     if Cons02.Cid2.cid_codigo.Text = '' then
        begin
        MSG_Erro('O Código do CID não foi informado');
        Cons02.Cid2.cid_codigo.SetFocus;
        end
     else if Cons02.Cid2.cid_descricao.Text = '' then
        begin
        MSG_Erro('A Descrição do CID não foi informada');
        Cons02.Cid2.cid_descricao.SetFocus;
        end
     else
        begin
        Resultado := True;
     end;

     Valida_Cid := Resultado;
end;

function Valida_Cirurgia():Boolean;

var
   Resultado: Boolean;

begin
     Resultado := False;

     if Cons02.Cirurgia2.cirurgia_codigo.Text = '' then
        begin
        MSG_Erro('O Código da Cirurgia não foi informado');
        Cons02.Cirurgia2.cirurgia_codigo.SetFocus;
        end
     else if Cons02.Cirurgia2.cirurgia_descricao.Text = '' then
        begin
        MSG_Erro('A Descrição da Cirurgia não foi informada');
        Cons02.Cirurgia2.cirurgia_descricao.SetFocus;
        end
     else
        begin

        if Cons02.Cirurgia2.cirurgia_quantidade.Text = '' then
           begin
           Cons02.Cirurgia2.cirurgia_quantidade.Text := '0';
        end;

        if Cons02.Cirurgia2.cirurgia_material.Text = '' then
           begin
           Cons02.Cirurgia2.cirurgia_material.Text := '0';
        end;

        Resultado := True;
     end;

     Valida_Cirurgia := Resultado;
end;

function Valida_Adicionais():Boolean;

var
   Resultado: Boolean;

begin
     Resultado := False;

     if Cons02.Adicionais2.adicional_codigo.Text = '' then
        begin
        MSG_Erro('O Código do Adicional não foi informado');
        Cons02.Adicionais2.adicional_codigo.SetFocus;
        end
     else if Cons02.Adicionais2.adicional_descricao.Text = '' then
        begin
        MSG_Erro('A Descrição do Adicional não foi informada');
        Cons02.Adicionais2.adicional_descricao.SetFocus;
        end
     else
        begin

        if Cons02.Adicionais2.adicional_valor.Text = '' then
           begin
           Cons02.Adicionais2.adicional_valor.Text := '0';
        end;

        Resultado := True;
     end;

     Valida_Adicionais := Resultado;
end;

function Valida_Recibo_Novo():Boolean;

var
   Resultado: Boolean;

begin
     Resultado := False;

     if Cons02.Recibo1.recibo_data_emissao.Text = '  /  /    ' then
        begin
        MSG_Erro('A Data de Emissão não foi informada');
        Cons02.Recibo1.recibo_data_emissao.SetFocus;
        end
     else if Cons02.Recibo1.recibo_paciente_nome.Text = '' then
        begin
        MSG_Erro('O Nome do Paciente não foi informado');
        Cons02.Recibo1.recibo_paciente_nome.SetFocus;
        end
     else if Cons02.Recibo1.recibo_valor.Text = '' then
        begin
        MSG_Erro('O Valor não foi informado');
        Cons02.Recibo1.recibo_valor.SetFocus;
        end
     else if Cons02.Recibo1.recibo_discriminacao.Text = '' then
        begin
        MSG_Erro('A Discriminação não foi informada');
        Cons02.Recibo1.recibo_discriminacao.SetFocus;
        end
     else
        begin
        Resultado := True;
     end;

     Valida_Recibo_Novo := Resultado;
end;

function Valida_Recibo_Ctrl():Boolean;

var
   Resultado: Boolean;

begin
     Resultado := False;

     if Cons02.Recibo1.recibo_inicio.Text = '  /  /    ' then
        begin
        MSG_Erro('A Data de Inicio não foi informada');
        Cons02.Recibo1.recibo_inicio.SetFocus;
        end
     else if Cons02.Recibo1.recibo_final.Text = '  /  /    ' then
        begin
        MSG_Erro('A Data Final não foi informada');
        Cons02.Recibo1.recibo_final.SetFocus;
        end
     else if StrToDate(Cons02.Recibo1.recibo_inicio.Text) > StrToDate(Cons02.Recibo1.recibo_final.Text) then
        begin
        MSG_Erro('Data Inicial maior que a Final');
        Cons02.Recibo1.recibo_inicio.SetFocus;
        end
     else
        begin
        Resultado := True;
     end;

     Valida_Recibo_Ctrl := Resultado;
end;

function Valida_Recibo_Apagar():Boolean;

var
   Resultado: Boolean;

begin
     Resultado := False;

     if Cons02.Recibo1.recibo_apagar.Text = '' then
        begin
        MSG_Erro('O Número do Recibo não foi informado');
        Cons02.Recibo1.recibo_apagar.SetFocus;
        end
     else
        begin
        Resultado := True;
     end;

     Valida_Recibo_Apagar := Resultado;
end;

function Valida_Faturamento_Calculo():Boolean;

var
   Resultado: Boolean;

begin
     Resultado := False;

     if Cons02.Faturamento2.faturamento_inicio.Text = '  /  /    ' then
        begin
        MSG_Erro('A Data de Inicio não foi informada');
        Cons02.Faturamento2.faturamento_inicio.SetFocus;
        end
     else if Cons02.Faturamento2.faturamento_final.Text = '  /  /    ' then
        begin
        MSG_Erro('A Data Final não foi informada');
        Cons02.Faturamento2.faturamento_final.SetFocus;
        end
     else if StrToDate(Cons02.Faturamento2.faturamento_inicio.Text) > StrToDate(Cons02.Faturamento2.faturamento_final.Text) then
        begin
        MSG_Erro('Data Inicial maior que a Final');
        Cons02.Faturamento2.faturamento_inicio.SetFocus;
        end
     else if Cons02.Faturamento2.faturamento_convenio.Text = '' Then
        begin
        MSG_Erro('Convênio não foi informado');
        Cons02.Faturamento2.faturamento_convenio.SetFocus;
        end
     else
        begin
        Resultado := True;
     end;

     Valida_Faturamento_Calculo := Resultado;
end;

function Ponto_Virgula(Valor: String): String;

Var
   Ind: Integer;

begin
     if Length(Valor) > 0 then
        begin
        for Ind := 0 to Length(Valor) do
            begin
            if Valor[Ind] = '.' then
               begin
               Valor[Ind] := ',';
            end;
        end;
     end;
     Ponto_Virgula := valor;
end;

function Virgula_Ponto(Valor: String): String;

Var
   Ind: Integer;

begin
     if Length(Valor) > 0 then
        begin
        for Ind := 0 to Length(Valor) do
            begin
            if Valor[Ind] = ',' then
               begin
               Valor[Ind] := '.';
            end;
        end;
     end;
     Virgula_Ponto := valor;
end;

function Calcula_Idade(DT_I: String; DT_F: String): String;

var
  Ano_I, Mes_I, Dia_I, Ano_F, Mes_F, Dia_F: Word;
  Str_Ano_I, Str_Ano_F, Str_MesDia_I, Str_MesDia_F: String;
  Int_Ano_I, Int_Ano_F, Int_MesDia_I, Int_MesDia_F, Erro, Idade: Integer;

begin
     if (DT_I <> '  /  /    ') and (DT_F <> '  /  /    ') then
        begin
        DecodeDate(StrToDate(DT_I), Ano_I, Mes_I, Dia_I);
        DecodeDate(StrToDate(DT_F), Ano_F, Mes_F, Dia_F);

        Str_Ano_I := IntToStr(Ano_I);
        Str_Ano_F := IntToStr(Ano_F);

        Str_MesDia_I := IntToStr(Mes_I)+IntToStr(Dia_I);
        Str_MesDia_F := IntToStr(Mes_F)+IntToStr(Dia_F);

        Val(Str_Ano_I, Int_Ano_I, Erro);
        Val(Str_Ano_F, Int_Ano_F, Erro);

        Val(Str_MesDia_I, Int_MesDia_I, Erro);
        Val(Str_MesDia_F, Int_MesDia_F, Erro);

        Idade := Int_Ano_I - Int_Ano_F;

        if Int_MesDia_I < Int_MesDia_F then
           begin
           Idade := Idade - 1;
        end;

        Calcula_Idade := IntToStr(Idade);
        end
     else
        begin
        Calcula_Idade := '0';
     end;
end;

function Inverte_Data(DT: String): String;

var
  Ano, Mes, Dia: Word;
  Str_Ano, Str_Mes, Str_Dia, Str_Data: String;

begin
     DecodeDate(StrToDate(DT), Ano, Mes, Dia);

     Str_Ano := IntToStr(Ano);
     Str_Mes := IntToStr(Mes);
     Str_Dia := IntToStr(Dia);

     Str_Data := Trim(Str_Mes)+'/'+Trim(Str_Dia)+'/'+Trim(Str_Ano);

     Inverte_Data := Str_Data;
end;

function Prepara_Data(DT: String): String;

var
  Ano, Mes, Dia: Word;
  Str_Data, Str_Ano, Str_Mes, Str_Dia: String;

begin
     if (DT <> '  /  /    ') and (DT <> '') then
        begin
        DecodeDate(StrToDate(DT), Ano, Mes, Dia);

        Str_Ano := IntToStr(Ano);
        Str_Mes := IntToStr(Mes);
        Str_Dia := IntToStr(Dia);

        if Length(Str_Ano) < 2 then
           begin
           Str_Ano := '0'+Trim(Str_Ano);
        end;

        if Length(Str_Mes) < 2 then
           begin
           Str_Mes := '0'+Trim(Str_Mes);
        end;

        if Length(Str_Dia) < 2 then
           begin
           Str_Dia := '0'+Trim(Str_Dia);
        end;

        Str_Data := Trim(Str_Dia)+'/'+Trim(Str_Mes)+'/'+Trim(Str_Ano);

        end
     else
        begin
        Str_Data := '  /  /    ';
     end;

     Prepara_Data := Str_Data;
end;

function Valida_Data(StrData: String):Boolean;
begin
     Result := True;
     try
        StrToDate(StrData);
     except
        on EConvertError do
           Result := False;
     end;
end;

function Extenso(parmNumero: Real): string;
begin
     if (parmNumero >= Min) and (parmNumero <= Max) then
        begin
        Result := ConversaoRecursiva(Round(Int(parmNumero)));

        if Round(Int(parmNumero)) = 1 then

           {Tratar Reais}

           begin
           Result := Result + Moeda
           end
        else
           begin

           {Tratar Reais}

           if Round(Int(parmNumero)) <> 0 then
              begin
              Result := Result + Moedas;
           end;

           {Tratar centavos}

           if not(Frac(parmNumero) = 0.00) then
              begin
              if Round(Int(parmNumero)) <> 0 then
                 begin
                 Result := Result + ' e ';
                 Result := Result + ConversaoRecursiva(Round(Frac(parmNumero) * 100));
                 if (Round(Frac(parmNumero) * 100) = 1) then
                    begin
                    Result := Result + centesimo
                    end
                 else
                    begin
                    Result := Result + centesimos;
                 end;
                 end
              else
                 begin
                 raise ERangeError.CreateFmt('%g ' + ErrorString + ' %g..%g',[parmNumero, Min, Max]);
              end;
           end;
        end;
     end;
end;

function ConversaoRecursiva(N: LongWord): string;
begin
     case N of
          1..19: Result := Unidades[N];
          20, 30, 40, 50, 60, 70, 80, 90: Result := Dezenas[N div 10] + ' ';
          21..29, 31..39, 41..49, 51..59, 61..69, 71..79, 81..89, 91..99: Result := Dezenas[N div 10] + ' e ' + ConversaoRecursiva(N mod 10);
          100, 200, 300, 400, 500, 600, 700, 800, 900: Result := Centenas[N div 100] + ' ';
          101..199: Result := ' cento e ' + ConversaoRecursiva(N mod 100);
          201..299, 301..399, 401..499, 501..599, 601..699, 701..799, 801..899, 901..999: Result := Centenas[N div 100] + ' e ' + ConversaoRecursiva(N mod 100);
          1000..999999: Result := ConversaoRecursiva(N div 1000) + ' mil ' + ConversaoRecursiva(N mod 1000);
          1000000..1999999: Result := ConversaoRecursiva(N div 1000000) + ' milhão '+ ConversaoRecursiva(N mod 1000000);
          2000000..999999999: Result := ConversaoRecursiva(N div 1000000) + ' milhões '+ ConversaoRecursiva(N mod 1000000);
          1000000000..1999999999: Result := ConversaoRecursiva(N div 1000000000) + ' bilhão ' + ConversaoRecursiva(N mod 1000000000);
          2000000000..4294967295: Result := ConversaoRecursiva(N div 1000000000) + ' bilhões ' + ConversaoRecursiva(N mod 1000000000);
     end;
end;

function Carrega_Conexao(): String;

var
   Caminho, Caminho_Resultado: String;

begin
{*** Prepara a Conexão com as Tabelas e Querys ***}

     ConexaoBD.Conexao_Principal.Connected := False;
     ConexaoBD.Conexao_Principal.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\ConsulTEX\Tabelas\ConsulTEX.mdb;Mode=Read|Write;Persist Security Info=False';
     ConexaoBD.Conexao_Principal.Connected := True;

{*** Carrega a Connexão da Estação Local ***}

     conexaoBD.SQL_Conexao.Close;
     conexaoBD.SQL_Conexao.SQL.Clear;
     conexaoBD.SQL_Conexao.SQL.Add('Select * from Conexao');
     conexaoBD.SQL_Conexao.Open;

     if conexaoBD.SQL_Conexao.RecordCount <= 0 then
        begin
        conexaoBD.SQL_Conexao.Close;
        conexaoBD.SQL_Conexao.SQL.Clear;
        conexaoBD.SQL_Conexao.SQL.Add('insert into Conexao'+
        '(Conexao_caminho) '+
        'values("C:\ConsulTEX\Tabelas\")');
        conexaoBD.SQL_Conexao.ExecSQL;

        conexaoBD.SQL_Conexao.Close;
        conexaoBD.SQL_Conexao.SQL.Clear;
        conexaoBD.SQL_Conexao.SQL.Add('Select * from Conexao');
        conexaoBD.SQL_Conexao.Open;
     End;

     Caminho_Resultado  := conexaoBD.SQL_Conexao.FieldValues['Conexao_caminho'];
     Caminho := Caminho_Resultado;
     Caminho := Trim(Caminho);
     Caminho := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Caminho+'ConsulTEX.mdb;Mode=Read|Write;Persist Security Info=False';

{*** Carrega as Conexões das Querys com o Access ***}

     ConexaoBD.Conexao_Principal.Connected := False;
     ConexaoBD.Conexao_Principal.ConnectionString := Caminho;
     ConexaoBD.Conexao_Principal.Connected := True;

     Result := Caminho_Resultado;
end;

function Obtem_Numero_Ficha(): String;

var
   Nro_Ficha, Numero_Ficha: String;

begin
{*** Carrega o Número da Última Ficha do Paciente ***}

     Nro_Ficha := UpperCase(Trim(Cons02.Paciente1.paciente_nome.Text));
     Nro_Ficha := AnsiToAscii(Nro_Ficha[1]);

     conexaoBD.SQL_Comunitario.Close;
     conexaoBD.SQL_Comunitario.SQL.Clear;
     conexaoBD.SQL_Comunitario.SQL.Add('Select Paciente_ficha from Paciente Where paciente_ficha Like "%' + Nro_Ficha + '%" Order By Paciente_ficha Desc');
     conexaoBD.SQL_Comunitario.Open;

     Nro_Ficha := Nro_Ficha + '1';

     if conexaoBD.SQL_Comunitario.RecordCount > 0 then
        begin
        conexaoBD.SQL_Comunitario.First;

        Nro_Ficha := conexaoBD.SQL_Comunitario.FieldValues['Paciente_Ficha'];

        Numero_Ficha := Copy(Nro_Ficha,2,StrLen(PChar(Nro_Ficha)));
        Numero_Ficha := IntToStr(StrToInt(Numero_Ficha) + 1);


        Nro_Ficha := Nro_Ficha[1] + Numero_Ficha;

        conexaoBD.SQL_Comunitario.Close;
        conexaoBD.SQL_Comunitario.SQL.Clear;
        conexaoBD.SQL_Comunitario.SQL.Add('Select Paciente_ficha, Paciente_caracteres from Paciente Where paciente_ficha Like "%' + Nro_Ficha + '%" Order By Paciente_caracteres Desc, Paciente_ficha Desc');
        conexaoBD.SQL_Comunitario.Open;

        if conexaoBD.SQL_Comunitario.RecordCount > 0 then begin
            While conexaoBD.SQL_Comunitario.RecordCount > 0 Do begin
                Numero_Ficha := IntToStr(StrToInt(Numero_Ficha) + 1);
                Nro_Ficha := Nro_Ficha[1] + Numero_Ficha;

                conexaoBD.SQL_Comunitario.Close;
                conexaoBD.SQL_Comunitario.SQL.Clear;
                conexaoBD.SQL_Comunitario.SQL.Add('Select Paciente_ficha, Paciente_caracteres from Paciente Where paciente_ficha Like "%' + Nro_Ficha + '%" Order By Paciente_caracteres Desc, Paciente_ficha Desc');
                conexaoBD.SQL_Comunitario.Open;
            end;
        end;
     End;

     conexaoBD.SQL_Comunitario.Close;

     Result := Nro_Ficha;
end;

function Confirma(strTexto: String):Integer;
begin
     Result := Application.MessageBox(PChar(strTexto),'Confirmação',mb_YesNo+mb_DefButton2+mb_IconQuestion);
end;

function MSG_Erro(strTexto: String):Integer;
begin
     Result := Application.MessageBox(PChar(strTexto),'Atenção !!!',mb_OK+mb_IconExclamation);
end;

function Numero_HD(FDrive:String): String;

var
    Serial:DWord;
    DirLen,Flags: DWord;
    DLabel : Array[0..11] of Char;

begin
     Try
        GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
        Result := IntToHex(Serial,8);
        Except Result :='';
     end;
end;

function Remove_Aspas_Simples(Texto: String): String;
var
    Ind: Integer;
    Resultado: String;
    Ativa: Boolean;
begin
    Resultado := ' ';
    Ativa     := True;

    For Ind := 1 To Length(Texto) Do Begin
        If Texto[Ind] = #39 Then Begin
            Ativa := False;
        End;

        If Ativa = True Then Begin
            If Texto[Ind] <> #39 Then Begin
                Resultado := Resultado + Texto[Ind];
            End;
        End;
    End;

    Result := Trim(Resultado);
end;

//A função abaixo pega um string informada como parâmetro e retira todas as letras acentuadas substituindo-as por letras correspondentes sem acento.
function AnsiToAscii(str: String): String;
var
    i: Integer;
begin
    for i := 1 to Length ( str ) do
        case str[i] of
            'á': str[i] := 'a';
            'é': str[i] := 'e';
            'í': str[i] := 'i';
            'ó': str[i] := 'o';
            'ú': str[i] := 'u';
            'à': str[i] := 'a';
            'è': str[i] := 'e';
            'ì': str[i] := 'i';
            'ò': str[i] := 'o';
            'ù': str[i] := 'u';
            'â': str[i] := 'a';
            'ê': str[i] := 'e';
            'î': str[i] := 'i';
            'ô': str[i] := 'o';
            'û': str[i] := 'u';
            'ä': str[i] := 'a';
            'ë': str[i] := 'e';
            'ï': str[i] := 'i';
            'ö': str[i] := 'o';
            'ü': str[i] := 'u';
            'ã': str[i] := 'a';
            'õ': str[i] := 'o';
            'ñ': str[i] := 'n';
            'ç': str[i] := 'c';
            'Á': str[i] := 'A';
            'É': str[i] := 'E';
            'Í': str[i] := 'I';
            'Ó': str[i] := 'O';
            'Ú': str[i] := 'U';
            'À': str[i] := 'A';
            'È': str[i] := 'E';
            'Ì': str[i] := 'I';
            'Ò': str[i] := 'O';
            'Ù': str[i] := 'U';
            'Â': str[i] := 'A';
            'Ê': str[i] := 'E';
            'Î': str[i] := 'I';
            'Ô': str[i] := 'O';
            'Û': str[i] := 'U';
            'Ä': str[i] := 'A';
            'Ë': str[i] := 'E';
            'Ï': str[i] := 'I';
            'Ö': str[i] := 'O';
            'Ü': str[i] := 'U';
            'Ã': str[i] := 'A';
            'Õ': str[i] := 'O';
            'Ñ': str[i] := 'N';
            'Ç': str[i] := 'C';
        end;
    Result := str;
end;



{************************************************************}
{*********************** Procedures *************************}
{************************************************************}

procedure Seta();
begin
     Screen.Cursor := crDefault; // *** Tira a Ampulheta do Cursor ***
end;

procedure Ampulheta();
begin
     Screen.Cursor := crHourglass; // *** Coloca a Ampúlheta no cursor ***
end;

procedure Cursor_Normal();
begin

{*** Tira a Ampulheta do Cursor ***}

     Screen.Cursor := crDefault;
end;

procedure Cursor_Ampulheta();
begin

{*** Coloca a Ampúlheta no cursor ***}

     Screen.Cursor := crHourglass;
end;

procedure Prepara_Hora();

Var
   Hora_Str, Hora_Res, Minuto_Res: String;
   Hora_Int, Minuto_Int: Integer;

begin
     Hora_Str   := Agenda.horario_hora.Text;

     Hora_Int   := StrToInt( Hora_Str[1] + Hora_Str[2] );
     Minuto_Int := StrToInt( Hora_Str[4] + Hora_Str[5] );

     if (Hora_Int >= 0) and (Hora_Int <= 23) then
        begin

        Hora_Res := IntToStr(Hora_Int);

        if Length(Hora_Res) <= 1 then
           begin
           Hora_Res := '0'+Trim(Hora_Res);
        end;
        end
     else
        begin
        Hora_Res := '00';
     end;

     if (Minuto_Int >= 0) and (Hora_Int <= 59) then
        begin

        Minuto_Res := IntToStr(Minuto_Int);

        if Length(Minuto_Res) <= 1 then
           begin
           Minuto_Res := '0'+Trim(Minuto_Res);
        end;
        end
     else
        begin
        Minuto_Res := '00';
     end;

     Hora_Str := Trim(Hora_Res)+':'+Trim(Minuto_Res);

     Agenda.horario_hora.Text := Hora_Str;
end;

procedure Data_Extenso();

var
  Ano, Mes, Dia: Word;
  Str_Ano, Str_Mes, Str_Dia: String;

begin
     DecodeDate(Agenda.Calendario.Date, Ano, Mes, Dia);

     Str_Ano := IntToStr(Ano);
     Str_Dia := IntToStr(Dia);

     if Mes = 01 then
        begin
        Str_Mes := 'Janeiro';
        end
     else if Mes = 02 then
        begin
        Str_Mes := 'Fevereiro';
        end
     else if Mes = 03 then
        begin
        Str_Mes := 'Março';
        end
     else if Mes = 04 then
        begin
        Str_Mes := 'Abril';
        end
     else if Mes = 05 then
        begin
        Str_Mes := 'Maio';
        end
     else if Mes = 06 then
        begin
        Str_Mes := 'Junho';
        end
     else if Mes = 07 then
        begin
        Str_Mes := 'Julho';
        end
     else if Mes = 08 then
        begin
        Str_Mes := 'Agosto';
        end
     else if Mes = 09 then
        begin
        Str_Mes := 'Setembro';
        end
     else if Mes = 10 then
        begin
        Str_Mes := 'Outubro';
        end
     else if Mes = 11 then
        begin
        Str_Mes := 'Novembro';
        end
     else if Mes = 12 then
        begin
        Str_Mes := 'Dezembro';
     end;

     Agenda.dia_horario.Caption := Str_Dia;
     Agenda.mes_horario.Caption := Str_Mes;
     Agenda.ano_horario.Caption := Str_Ano;
end;

procedure Verifica_Movto_Tela();
begin
     Cursor_Ampulheta();

     if Qtde_Tela_Ativa > 1 then
        begin
        Cons02.Label14.Visible := True;
        Cons02.Button2.Visible := True;
        Cons02.Button3.Visible := True;
        end
     else
        begin
        Cons02.Label14.Visible := False;
        Cons02.Button2.Visible := False;
        Cons02.Button3.Visible := False;
     end;

     Cursor_Normal();
end;

procedure Opcoes_Tela();
begin
     Cursor_Ampulheta();
     
     if Paciente_OK = True then
        begin

        if (Cons02.ConsulTEX_Acesso_Paciente.Text = 'S') or (Cons02.ConsulTEX_Acesso_Paciente.Text = 'L') then
           begin
           Cons02.Bt_Novo.Enabled     := False;
           Cons02.Bt_Apagar.Enabled   := False;
           Cons02.Bt_Gravar.Enabled   := False;
           Cons02.Bt_Imprimir.Enabled := False;
           end
        else
           begin
           Cons02.Bt_Novo.Enabled     := True;
           Cons02.Bt_Apagar.Enabled   := True;
           Cons02.Bt_Gravar.Enabled   := True;
           Cons02.Bt_Imprimir.Enabled := True;
        end;

        // Verifica a Permissão de Acesso do Prontuário

        if Cons02.ConsulTEX_Acesso_Prontuario.Text = 'L' then
           begin
           Cons02.Paciente1.paciente_prontuario.Enabled := False;
           end
        else if Cons02.ConsulTEX_Acesso_Prontuario.Text = 'S' then
           begin
           Cons02.Paciente1.paciente_prontuario.Visible := False;
           end
        else
           begin
           Cons02.Paciente1.paciente_prontuario.Visible := True;
           Cons02.Paciente1.paciente_prontuario.Enabled := True;
        end;

        // Verifica a Permissão de Acesso das Observações

        if Cons02.ConsulTEX_Acesso_Observacoes.Text = 'L' then
           begin
           Cons02.Paciente1.paciente_observacao.Enabled := False;
           end
        else if Cons02.ConsulTEX_Acesso_Observacoes.Text = 'S' then
           begin
           Cons02.Paciente1.paciente_observacao.Visible := False;
           end
        else
           begin
           Cons02.Paciente1.paciente_observacao.Visible := True;
           Cons02.Paciente1.paciente_observacao.Enabled := True;
        end;

{*** Carrega as Listas de Convênios e Indicação ***}

        Carrega_Lista_Convenio();
        Carrega_Lista_Indicacao();

{*** Foca o Campo Principal ***}

        if Cons02.ConsulTEX_Acesso_Paciente.Text <> 'S' then
           begin
           Cons02.localiza_paciente.SetFocus;
        end;

        end
     else if Preferencia_OK = True then
        begin

        if (Cons02.ConsulTEX_Acesso_Usuario.Text = 'S') or (Cons02.ConsulTEX_Acesso_Usuario.Text = 'L') then
           begin
           Cons02.Bt_Novo.Enabled     := False;
           Cons02.Bt_Apagar.Enabled   := False;
           Cons02.Bt_Gravar.Enabled   := False;
           Cons02.Bt_Imprimir.Enabled := False;
           end
        else
           begin
           Cons02.Bt_Novo.Enabled     := True;
           Cons02.Bt_Apagar.Enabled   := True;
           Cons02.Bt_Gravar.Enabled   := True;
           Cons02.Bt_Imprimir.Enabled := False;
        end;

        end
     else if Convenio_OK = True then
        begin

        if (Cons02.ConsulTEX_Acesso_Convenio.Text = 'S') or (Cons02.ConsulTEX_Acesso_Convenio.Text = 'L') then
           begin
           Cons02.Bt_Novo.Enabled     := False;
           Cons02.Bt_Apagar.Enabled   := False;
           Cons02.Bt_Gravar.Enabled   := False;
           Cons02.Bt_Imprimir.Enabled := False;
           end
        else
           begin
           Cons02.Bt_Novo.Enabled     := True;
           Cons02.Bt_Apagar.Enabled   := True;
           Cons02.Bt_Gravar.Enabled   := True;
           Cons02.Bt_Imprimir.Enabled := False;
        end;

        end
     else if Indicacao_OK = True then
        begin

        if (Cons02.ConsulTEX_Acesso_Indicacao.Text = 'S') or (Cons02.ConsulTEX_Acesso_Indicacao.Text = 'L') then
           begin
           Cons02.Bt_Novo.Enabled     := False;
           Cons02.Bt_Apagar.Enabled   := False;
           Cons02.Bt_Gravar.Enabled   := False;
           Cons02.Bt_Imprimir.Enabled := False;
           end
        else
           begin
           Cons02.Bt_Novo.Enabled     := True;
           Cons02.Bt_Apagar.Enabled   := True;
           Cons02.Bt_Gravar.Enabled   := True;
           Cons02.Bt_Imprimir.Enabled := False;
        end;

        end
     else if Cid_OK = True then
        begin

        if (Cons02.ConsulTEX_Acesso_Cid.Text = 'S') or (Cons02.ConsulTEX_Acesso_Cid.Text = 'L') then
           begin
           Cons02.Bt_Novo.Enabled     := False;
           Cons02.Bt_Apagar.Enabled   := False;
           Cons02.Bt_Gravar.Enabled   := False;
           Cons02.Bt_Imprimir.Enabled := False;
           end
        else
           begin
           Cons02.Bt_Novo.Enabled     := True;
           Cons02.Bt_Apagar.Enabled   := True;
           Cons02.Bt_Gravar.Enabled   := True;
           Cons02.Bt_Imprimir.Enabled := False;
        end;

{*** Foca o Campo Principal ***}

        if Cons02.ConsulTEX_Acesso_Cid.Text <> 'S' then
           begin
           Cons02.Cid2.cid_procura.SetFocus;
        end;

        end
     else if Recibo_OK = True then
        begin

        if (Cons02.ConsulTEX_Acesso_Imp_Rec.Text = 'S') or (Cons02.ConsulTEX_Acesso_Imp_Rec.Text = 'L') then
           begin
           Cons02.Bt_Novo.Enabled     := False;
           Cons02.Bt_Apagar.Enabled   := False;
           Cons02.Bt_Gravar.Enabled   := False;
           Cons02.Bt_Imprimir.Enabled := False;
           end
        else
           begin
           Cons02.Bt_Novo.Enabled     := False;
           Cons02.Bt_Apagar.Enabled   := False;
           Cons02.Bt_Gravar.Enabled   := False;
           Cons02.Bt_Imprimir.Enabled := False;
        end;

{*** Foca o Campo Principal ***}

        if Cons02.ConsulTEX_Acesso_Imp_Rec.Text <> 'S' then
           begin
           Cons02.Recibo1.recibo_paciente_nome.SetFocus;
        end;

        end
     else if Faturamento_OK = True then
        begin

        if (Cons02.ConsulTEX_Acesso_Imp_Fat.Text = 'S') or (Cons02.ConsulTEX_Acesso_Imp_Fat.Text = 'L') then
           begin
           Cons02.Bt_Novo.Enabled     := False;
           Cons02.Bt_Apagar.Enabled   := False;
           Cons02.Bt_Gravar.Enabled   := False;
           Cons02.Bt_Imprimir.Enabled := False;
           end
        else
           begin
           Cons02.Bt_Novo.Enabled     := False;
           Cons02.Bt_Apagar.Enabled   := False;
           Cons02.Bt_Gravar.Enabled   := False;
           Cons02.Bt_Imprimir.Enabled := False;
        end;

        end
     else if Medico_OK = True then
        begin

        if (Cons02.ConsulTEX_Acesso_Medico.Text = 'S') or (Cons02.ConsulTEX_Acesso_Medico.Text = 'L') then
           begin
           Cons02.Bt_Novo.Enabled     := False;
           Cons02.Bt_Apagar.Enabled   := False;
           Cons02.Bt_Gravar.Enabled   := False;
           Cons02.Bt_Imprimir.Enabled := False;
           end
        else
           begin
           Cons02.Bt_Novo.Enabled     := True;
           Cons02.Bt_Apagar.Enabled   := True;
           Cons02.Bt_Gravar.Enabled   := True;
           Cons02.Bt_Imprimir.Enabled := False;
        end;

{*** Foca o Campo Principal ***}

        if Cons02.ConsulTEX_Acesso_Medico.Text <> 'S' then
           begin
           Cons02.Medico1.medico_nome.SetFocus;
        end;
        end
     else if Cirurgia_OK = True then
        begin

        if (Cons02.ConsulTEX_Acesso_Cirurgia.Text = 'S') or (Cons02.ConsulTEX_Acesso_Cirurgia.Text = 'L') then
           begin
           Cons02.Bt_Novo.Enabled     := False;
           Cons02.Bt_Apagar.Enabled   := False;
           Cons02.Bt_Gravar.Enabled   := False;
           Cons02.Bt_Imprimir.Enabled := False;
           end
        else
           begin
           Cons02.Bt_Novo.Enabled     := True;
           Cons02.Bt_Apagar.Enabled   := True;
           Cons02.Bt_Gravar.Enabled   := True;
           Cons02.Bt_Imprimir.Enabled := False;
        end;

{*** Foca o Campo Principal ***}

        if Cons02.ConsulTEX_Acesso_Cirurgia.Text <> 'S' then
           begin
           Cons02.Cirurgia2.cirurgia_procura.SetFocus;
        end;
        end
     else if Adicionais_OK = True then
        begin

        if (Cons02.ConsulTEX_Acesso_Adicionais.Text = 'S') or (Cons02.ConsulTEX_Acesso_Adicionais.Text = 'L') then
           begin
           Cons02.Bt_Novo.Enabled     := False;
           Cons02.Bt_Apagar.Enabled   := False;
           Cons02.Bt_Gravar.Enabled   := False;
           Cons02.Bt_Imprimir.Enabled := False;
           end
        else
           begin
           Cons02.Bt_Novo.Enabled     := True;
           Cons02.Bt_Apagar.Enabled   := True;
           Cons02.Bt_Gravar.Enabled   := True;
           Cons02.Bt_Imprimir.Enabled := False;
        end;

{*** Foca o Campo Principal ***}

        if Cons02.ConsulTEX_Acesso_Adicionais.Text <> 'S' then
           begin
           Cons02.Adicionais2.adicional_procura.SetFocus;
        end;
     end;

     Cursor_Normal();
end;

procedure Exibe_Tela();

var
   Ind, Ind_Org: Integer;

begin
     Cursor_Ampulheta();

{*** Organiza a Sequencia das Telas ***}

     Ind_Org := 0;

     for Ind := 1 to 12 do begin
         Org_Sequencia_Tela[Ind] := ' ';
         Org_Descricao_Tela[Ind] := ' ';

         if Sequencia_Tela[Ind] <> ' ' then
            begin
            Ind_Org := Ind_Org + 1;
            Org_Sequencia_Tela[Ind_Org] := Sequencia_Tela[Ind];
            Org_Descricao_Tela[Ind_Org] := Descricao_Tela[Ind];
         end;
     end;

     Ind_Org := 0;

     for Ind := 1 to 12 do begin
         Sequencia_Tela[Ind] := ' ';
         Descricao_Tela[Ind] := ' ';

         if Org_Sequencia_Tela[Ind] <> ' ' then
            begin
            Ind_Org := Ind_Org + 1;
            Sequencia_Tela[Ind_Org] := Org_Sequencia_Tela[Ind];
            Descricao_Tela[Ind_Org] := Org_Descricao_Tela[Ind];
         end;
     end;

{*** Exibe a Tela Corrente ***}

     for Ind := 1 to 12 do begin
         if Ind = 1 then
            begin
            if Tela_Ativa = Ind then
               begin
               Cons02.tela_01.Caption    := '>> '+Descricao_Tela[Ind];
               Cons02.tela_01.Font.Color := clWhite;
               end
            else
               begin
               Cons02.tela_01.Caption    := Descricao_Tela[Ind];
               Cons02.tela_01.Font.Color := clBlack;
            end;
            end
         else if Ind = 2 then
            begin
            if Tela_Ativa = Ind then
               begin
               Cons02.tela_02.Caption    := '>> '+Descricao_Tela[Ind];
               Cons02.tela_02.Font.Color := clWhite;
               end
            else
               begin
               Cons02.tela_02.Caption    := Descricao_Tela[Ind];
               Cons02.tela_02.Font.Color := clBlack;
            end;
            end
         else if Ind = 3 then
            begin
            if Tela_Ativa = Ind then
               begin
               Cons02.tela_03.Caption    := '>> '+Descricao_Tela[Ind];
               Cons02.tela_03.Font.Color := clWhite;
               end
            else
               begin
               Cons02.tela_03.Caption    := Descricao_Tela[Ind];
               Cons02.tela_03.Font.Color := clBlack;
            end;
            end
         else if Ind = 4 then
            begin
            if Tela_Ativa = Ind then
               begin
               Cons02.tela_04.Caption    := '>> '+Descricao_Tela[Ind];
               Cons02.tela_04.Font.Color := clWhite;
               end
            else
               begin
               Cons02.tela_04.Caption    := Descricao_Tela[Ind];
               Cons02.tela_04.Font.Color := clBlack;
            end;
            end
         else if Ind = 5 then
            begin
            if Tela_Ativa = Ind then
               begin
               Cons02.tela_05.Caption    := '>> '+Descricao_Tela[Ind];
               Cons02.tela_05.Font.Color := clWhite;
               end
            else
               begin
               Cons02.tela_05.Caption    := Descricao_Tela[Ind];
               Cons02.tela_05.Font.Color := clBlack;
            end;
            end
         else if Ind = 6 then
            begin
            if Tela_Ativa = Ind then
               begin
               Cons02.tela_06.Caption    := '>> '+Descricao_Tela[Ind];
               Cons02.tela_06.Font.Color := clWhite;
               end
            else
               begin
               Cons02.tela_06.Caption    := Descricao_Tela[Ind];
               Cons02.tela_06.Font.Color := clBlack;
            end;
            end
         else if Ind = 7 then
            begin
            if Tela_Ativa = Ind then
               begin
               Cons02.tela_07.Caption    := '>> '+Descricao_Tela[Ind];
               Cons02.tela_07.Font.Color := clWhite;
               end
            else
               begin
               Cons02.tela_07.Caption    := Descricao_Tela[Ind];
               Cons02.tela_07.Font.Color := clBlack;
            end;
            end
         else if Ind = 8 then
            begin
            if Tela_Ativa = Ind then
               begin
               Cons02.tela_08.Caption    := '>> '+Descricao_Tela[Ind];
               Cons02.tela_08.Font.Color := clWhite;
               end
            else
               begin
               Cons02.tela_08.Caption    := Descricao_Tela[Ind];
               Cons02.tela_08.Font.Color := clBlack;
            end;
            end
         else if Ind = 9 then
            begin
            if Tela_Ativa = Ind then
               begin
               Cons02.tela_09.Caption    := '>> '+Descricao_Tela[Ind];
               Cons02.tela_09.Font.Color := clWhite;
               end
            else
               begin
               Cons02.tela_09.Caption    := Descricao_Tela[Ind];
               Cons02.tela_09.Font.Color := clBlack;
            end;
            end
         else if Ind = 10 then
            begin
            if Tela_Ativa = Ind then
               begin
               Cons02.tela_10.Caption    := '>> '+Descricao_Tela[Ind];
               Cons02.tela_10.Font.Color := clWhite;
               end
            else
               begin
               Cons02.tela_10.Caption    := Descricao_Tela[Ind];
               Cons02.tela_10.Font.Color := clBlack;
            end;
            end
         else if Ind = 11 then
            begin
            if Tela_Ativa = Ind then
               begin
               Cons02.tela_11.Caption    := '>> '+Descricao_Tela[Ind];
               Cons02.tela_11.Font.Color := clWhite;
               end
            else
               begin
               Cons02.tela_11.Caption    := Descricao_Tela[Ind];
               Cons02.tela_11.Font.Color := clBlack;
            end;
            end
         else if Ind = 12 then
            begin
            if Tela_Ativa = Ind then
               begin
               Cons02.tela_12.Caption    := '>> '+Descricao_Tela[Ind];
               Cons02.tela_12.Font.Color := clWhite;
               end
            else
               begin
               Cons02.tela_12.Caption    := Descricao_Tela[Ind];
               Cons02.tela_12.Font.Color := clBlack;
            end;
         end;
     end;

{*** Prepara a Exibição das Telas ***}

     Cons02.Paciente1.Visible    := Paciente_OK;
     Cons02.Preferencia1.Visible := Preferencia_OK;
     Cons02.Convenio1.Visible    := Convenio_OK;
     Cons02.Indicacao1.Visible   := Indicacao_OK;
     Cons02.CID2.Visible         := Cid_OK;
     Cons02.Recibo1.Visible      := Recibo_OK;
     Cons02.Faturamento2.Visible := Faturamento_OK;
     Cons02.Medico1.Visible      := Medico_OK;
     Cons02.Cirurgia2.Visible    := Cirurgia_OK;
     Cons02.Adicionais2.Visible  := Adicionais_OK;

     Cursor_Normal();

     Opcoes_Tela();
     Verifica_Movto_Tela();
end;

procedure Inicializa_Tela();

var
   Ind: Integer;

begin
     for Ind := 1 to 12 do begin
         Sequencia_Tela[Ind]     := ' ';
         Descricao_Tela[Ind]     := ' ';
         Org_Sequencia_Tela[Ind] := ' ';
         Org_Descricao_Tela[Ind] := ' ';
     end;

     Tela_Ativa                 := 1;
     Qtde_Tela_Ativa            := 1;
     Sequencia_Tela[Tela_Ativa] := 'paciente';
     Descricao_Tela[Tela_Ativa] := 'Cadastro de Pacientes';

     Paciente_OK     := True;
     Preferencia_OK  := False;
     Convenio_OK     := False;
     Indicacao_OK    := False;
     Cid_OK          := False;
     Recibo_OK       := False;
     Faturamento_OK  := False;
     Medico_OK       := False;
     Cirurgia_OK     := False;
     Adicionais_OK   := False;

     Limpa_Paciente();
     Exibe_Tela();
end;

procedure Inicializa_Agenda();

var
   Ind, Hora: Integer;
   Meia_Hora: Boolean;
   Data_Sis, Data_Grava, Agenda_hora: String;

begin
     Cursor_Ampulheta();

     Data_Sis := DateToStr(Date());
     Data_Sis := Inverte_Data(Data_Sis);

{*** Definição da Data ***}

     Agenda.Calendario.Date := Date();

{*** Carrega as Informações da Tabela ***}

     conexaoBD.SQL_Agenda.Close;
     conexaoBD.SQL_Agenda.SQL.Clear;
     conexaoBD.SQL_Agenda.SQL.Add('Select * from Agenda where Agenda_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Agenda_data = #'+Data_Sis+'# Order by Agenda_data, Agenda_hora');
     conexaoBD.SQL_Agenda.Open;
{
     if conexaoBD.SQL_Agenda.RecordCount <= 0 then
        begin

        Meia_Hora := False;
        Hora      := 7;

        for Ind := 1 to 27 do
            begin
            if Meia_hora = True then
               begin
               if Length(IntToStr(Hora)) < 2 then
                  begin
                  Agenda_hora := '0'+IntToStr(Hora)+':30';
                  end
               else
                  begin
                  Agenda_hora := IntToStr(Hora)+':30';
               end;
               Meia_Hora := False;
               Hora      := Hora + 1;
               end
            else
               begin
               if Length(IntToStr(Hora)) < 2 then
                  begin
                  Agenda_hora := '0'+IntToStr(Hora)+':00';
                  end
               else
                  begin
                  Agenda_hora := IntToStr(Hora)+':00';
               end;

               Meia_Hora := True;
            end;

            Data_Grava := DateToStr(Agenda.Calendario.Date);

            conexaoBD.SQL_Agenda.Close;
            conexaoBD.SQL_Agenda.SQL.Clear;
            conexaoBD.SQL_Agenda.SQL.Add('insert into Agenda'+
            '(Agenda_data,'+
            'Agenda_descricao,'+
            'Agenda_tipo,'+
            'Agenda_status,'+
            'Agenda_descricao_convenio,'+
            'Agenda_hora,'+
            'Agenda_medico_crm) '+
            'values("'+Data_Grava+'",'+
            '"",'+
            '"",'+
            '"",'+
            '"",'+
            '"'+Trim(Agenda_hora)+'",'+
            '"'+Trim(Agenda.Agenda_Medico_Crm.Text)+'")');
            conexaoBD.SQL_Agenda.ExecSQL;
        end;

        conexaoBD.SQL_Agenda.Close;
        conexaoBD.SQL_Agenda.SQL.Clear;
        conexaoBD.SQL_Agenda.SQL.Add('Select * from Agenda where Agenda_medico_crm = '+#39+ Agenda.Agenda_Medico_Crm.Text +#39+' And Agenda_data = #'+Data_Sis+'# Order by Agenda_data, Agenda_hora');
        conexaoBD.SQL_Agenda.Open;
     end;
}
     Data_Extenso();

     Carrega_Tipo_Cirurgia_AG();

     Cursor_Normal();
end;

procedure Carrega_Tipo_Cirurgia_AG();
begin
     Cursor_Ampulheta();

     Agenda.horario_tipo_cirurgia.Items.Clear;

{*** Carrega as Informações do Tipo de Cirurgia ***}

     conexaoBD.SQL_Cirurgia_AG.Close;
     conexaoBD.SQL_Cirurgia_AG.SQL.Clear;
     conexaoBD.SQL_Cirurgia_AG.SQL.Add('Select * from Cirurgia Order by Cirurgia_codigo, Cirurgia_descricao');
     conexaoBD.SQL_Cirurgia_AG.Open;

     if conexaoBD.SQL_Cirurgia_AG.RecordCount > 0 then
        begin
        conexaoBD.SQL_Cirurgia_AG.First;

        While Not conexaoBD.SQL_Cirurgia_AG.Eof Do
              begin
              Agenda.horario_tipo_cirurgia.Items.Add(conexaoBD.SQL_Cirurgia_AG.FieldValues['Cirurgia_codigo']);
              conexaoBD.SQL_Cirurgia_AG.Next;
        end;
     end;

     Cursor_Normal();
end;

procedure Prepara_Agenda();

var
   Ind, Hora: Integer;
   Meia_Hora: Boolean;
   Data_Sis, Data_Grava, Agenda_hora: String;

begin
     Data_Sis := DateToStr(Agenda.Calendario.Date);
     Data_Sis := Inverte_Data(Data_Sis);

{*** Carrega as Informações da Tabela ***}

     conexaoBD.SQL_Agenda.Close;
     conexaoBD.SQL_Agenda.SQL.Clear;
     conexaoBD.SQL_Agenda.SQL.Add('Select * from Agenda where Agenda_medico_crm = '+#39+ Agenda.Agenda_Medico_Crm.Text +#39+' And Agenda_data = #'+Data_Sis+'# Order by Agenda_data, Agenda_hora');
     conexaoBD.SQL_Agenda.Open;
{
     if conexaoBD.SQL_Agenda.RecordCount <= 0 then
        begin

        Meia_Hora := False;
        Hora      := 7;

        for Ind := 1 to 27 do
            begin

            if Meia_hora = True then
               begin
               if Length(IntToStr(Hora)) < 2 then
                  begin
                  Agenda_hora := '0'+IntToStr(Hora)+':30';
                  end
               else
                  begin
                  Agenda_hora := IntToStr(Hora)+':30';
               end;
               Meia_Hora := False;
               Hora      := Hora + 1;
               end
            else
               begin
               if Length(IntToStr(Hora)) < 2 then
                  begin
                  Agenda_hora := '0'+IntToStr(Hora)+':00';
                  end
               else
                  begin
                  Agenda_hora := IntToStr(Hora)+':00';
               end;

               Meia_Hora := True;
            end;

            Data_Grava := DateToStr(Agenda.Calendario.Date);

            conexaoBD.SQL_Agenda.Close;
            conexaoBD.SQL_Agenda.SQL.Clear;
            conexaoBD.SQL_Agenda.SQL.Add('insert into Agenda'+
            '(Agenda_data,'+
            'Agenda_descricao,'+
            'Agenda_tipo,'+
            'Agenda_status,'+
            'Agenda_descricao_convenio,'+
            'Agenda_hora,'+
            'Agenda_medico_crm) '+
            'values("'+Data_Grava+'",'+
            '"",'+
            '"",'+
            '"",'+
            '"",'+
            '"'+Trim(Agenda_hora)+'",'+
            '"'+Trim(Agenda.Agenda_Medico_Crm.Text)+'")');
            conexaoBD.SQL_Agenda.ExecSQL;
        end;

        conexaoBD.SQL_Agenda.Close;
        conexaoBD.SQL_Agenda.SQL.Clear;
        conexaoBD.SQL_Agenda.SQL.Add('Select * from Agenda where Agenda_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Agenda_data = #'+Data_Sis+'# Order by Agenda_data, Agenda_hora');
        conexaoBD.SQL_Agenda.Open;

     end;
}
     Data_Extenso();
     Agenda.GRD_Horario.Refresh;
end;

procedure Avanca_Tela();
begin
     Cursor_Ampulheta();

     if (Tela_Ativa + 1) > Qtde_Tela_Ativa then
        begin
        Tela_Ativa := 1;
        end
     else
        begin
        Tela_Ativa := Tela_Ativa + 1;
     end;

     Paciente_OK     := False;
     Preferencia_OK  := False;
     Convenio_OK     := False;
     Indicacao_OK    := False;
     Cid_OK          := False;
     Recibo_OK       := False;
     Faturamento_OK  := False;
     Medico_OK       := False;
     Cirurgia_OK     := False;
     Adicionais_OK   := False;

     if Sequencia_Tela[Tela_Ativa] = 'paciente' then
        begin
        Paciente_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'preferencia' then
        begin
        Preferencia_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'convenio' then
        begin
        Convenio_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'indicacao' then
        begin
        Indicacao_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'cid' then
        begin
        Cid_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'recibo' then
        begin
        Recibo_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'faturamento' then
        begin
        Faturamento_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'medico' then
        begin
        Medico_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'cirurgia' then
        begin
        Cirurgia_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'adicionais' then
        begin
        Adicionais_OK := True;
     end;

     Cursor_Normal();

     Exibe_Tela();
end;

procedure Retorna_Tela();
begin
     Cursor_Ampulheta();

     if (Tela_Ativa - 1) < 1 then
        begin
        Tela_Ativa := Qtde_Tela_Ativa;
        end
     else
        begin
        Tela_Ativa := Tela_Ativa - 1;
     end;

     Paciente_OK     := False;
     Preferencia_OK  := False;
     Convenio_OK     := False;
     Indicacao_OK    := False;
     Cid_OK          := False;
     Recibo_OK       := False;
     Faturamento_OK  := False;
     Medico_OK       := False;
     Cirurgia_OK     := False;
     Adicionais_OK   := False;

     if Sequencia_Tela[Tela_Ativa] = 'paciente' then
        begin
        Paciente_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'preferencia' then
        begin
        Preferencia_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'convenio' then
        begin
        Convenio_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'indicacao' then
        begin
        Indicacao_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'cid' then
        begin
        Cid_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'recibo' then
        begin
        Recibo_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'faturamento' then
        begin
        Faturamento_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'medico' then
        begin
        Medico_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'cirurgia' then
        begin
        Cirurgia_OK := True;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'adicionais' then
        begin
        Adicionais_OK := True;
     end;

     Cursor_Normal();

     Exibe_Tela();
end;

procedure Fecha_Preferencia();
begin
     Sequencia_Tela[Tela_Ativa] := ' ';
     Descricao_Tela[Tela_Ativa] := ' ';
     Tela_Ativa                 := 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa - 1;

     Paciente_OK     := True;
     Preferencia_OK  := False;
     Convenio_OK     := False;
     Indicacao_OK    := False;
     Cid_OK          := False;
     Recibo_OK       := False;
     Faturamento_OK  := False;
     Medico_OK       := False;
     Cirurgia_OK     := False;
     Adicionais_OK   := False;

     Exibe_Tela();

     Cons02.PrefernciasdoUsuario1.Enabled := True;
end;

procedure Grava_Medico();
begin
     conexaoBD.SQL_Medico.Close;
     conexaoBD.SQL_Medico.SQL.Clear;
     conexaoBD.SQL_Medico.SQL.Add('select * from Medico');
     conexaoBD.SQL_Medico.Open;

     if conexaoBD.SQL_Medico.RecordCount = 0 then
        begin
        conexaoBD.SQL_Medico.Close;
        conexaoBD.SQL_Medico.SQL.Clear;
        conexaoBD.SQL_Medico.SQL.Add('insert into Medico'+
        '(Medico_crm,'+
        'Medico_Nome,'+
        'Medico_especialidade,'+
        'Medico_rg,'+
        'Medico_cpf,'+
        'Medico_endereco,'+
        'Medico_complemento,'+
        'Medico_bairro,'+
        'Medico_cidade,'+
        'Medico_uf,'+
        'Medico_cep,'+
        'Medico_fone_consultorio,'+
        'Medico_fone_residencia,'+
        'Medico_fone_celular,'+
        'Medico_fone_fax,'+
        'Medico_email) '+
        'values("0000000000",'+
        '"ConsulTEX",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '"SP",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '" ")');
        conexaoBD.SQL_Medico.ExecSQL;
        end
     else
        begin
        conexaoBD.SQL_Medico.Close;
        conexaoBD.SQL_Medico.SQL.Clear;
        conexaoBD.SQL_Medico.SQL.Add('update Medico '+
        'set Medico_crm="'+Cons02.Medico1.medico_crm.Text+'",'+
        'Medico_nome="'+Cons02.Medico1.medico_nome.Text+'",'+
        'Medico_especialidade="'+Cons02.Medico1.medico_especialidade.Text+'",'+
        'Medico_rg="'+Cons02.Medico1.medico_rg.Text+'",'+
        'Medico_cpf="'+Cons02.Medico1.medico_cpf.Text+'",'+
        'Medico_endereco="'+Cons02.Medico1.medico_endereco.Text+'",'+
        'Medico_complemento="'+Cons02.Medico1.medico_complemento.Text+'",'+
        'Medico_bairro="'+Cons02.Medico1.medico_bairro.Text+'",'+
        'Medico_cidade="'+Cons02.Medico1.medico_cidade.Text+'",'+
        'Medico_uf="'+Cons02.Medico1.medico_uf.Text+'",'+
        'Medico_cep="'+Cons02.Medico1.medico_cep.Text+'",'+
        'Medico_fone_consultorio="'+Cons02.Medico1.medico_fone_consultorio.Text+'",'+
        'Medico_fone_residencia="'+Cons02.Medico1.medico_fone_residencia.Text+'",'+
        'Medico_fone_celular="'+Cons02.Medico1.medico_fone_celular.Text+'",'+
        'Medico_fone_fax="'+Cons02.Medico1.medico_fone_fax.Text+'",'+
        'Medico_email="'+Cons02.Medico1.medico_email.Text+'"');
        conexaoBD.SQL_Medico.ExecSQL;
     end;
end;

procedure Fecha_Convenio();
begin
     Sequencia_Tela[Tela_Ativa] := ' ';
     Descricao_Tela[Tela_Ativa] := ' ';
     Tela_Ativa                 := 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa - 1;

     Paciente_OK     := True;
     Preferencia_OK  := False;
     Convenio_OK     := False;
     Indicacao_OK    := False;
     Cid_OK          := False;
     Recibo_OK       := False;
     Faturamento_OK  := False;
     Medico_OK       := False;
     Cirurgia_OK     := False;
     Adicionais_OK   := False;

     Exibe_Tela();

     Cons02.Convnio1.Enabled := True;
end;

procedure Fecha_Indicacao();
begin
     Sequencia_Tela[Tela_Ativa] := ' ';
     Descricao_Tela[Tela_Ativa] := ' ';
     Tela_Ativa                 := 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa - 1;

     Paciente_OK     := True;
     Preferencia_OK  := False;
     Convenio_OK     := False;
     Indicacao_OK    := False;
     Cid_OK          := False;
     Recibo_OK       := False;
     Faturamento_OK  := False;
     Medico_OK       := False;
     Cirurgia_OK     := False;
     Adicionais_OK   := False;

     Exibe_Tela();

     Cons02.Indicao1.Enabled := True;
end;

procedure Fecha_Cid();
begin
     Sequencia_Tela[Tela_Ativa] := ' ';
     Descricao_Tela[Tela_Ativa] := ' ';
     Tela_Ativa                 := 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa - 1;

     Paciente_OK     := True;
     Preferencia_OK  := False;
     Convenio_OK     := False;
     Indicacao_OK    := False;
     Cid_OK          := False;
     Recibo_OK       := False;
     Faturamento_OK  := False;
     Medico_OK       := False;
     Cirurgia_OK     := False;
     Adicionais_OK   := False;

     Exibe_Tela();

     Cons02.CID1.Enabled := True;
end;

procedure Fecha_Cirurgia();
begin
     Sequencia_Tela[Tela_Ativa] := ' ';
     Descricao_Tela[Tela_Ativa] := ' ';
     Tela_Ativa                 := 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa - 1;

     Paciente_OK     := True;
     Preferencia_OK  := False;
     Convenio_OK     := False;
     Indicacao_OK    := False;
     Cid_OK          := False;
     Recibo_OK       := False;
     Faturamento_OK  := False;
     Medico_OK       := False;
     Cirurgia_OK     := False;
     Adicionais_OK   := False;

     Exibe_Tela();

     Cons02.Cirurgia1.Enabled := True;
end;

procedure Fecha_Adicionais();
begin
     Sequencia_Tela[Tela_Ativa] := ' ';
     Descricao_Tela[Tela_Ativa] := ' ';
     Tela_Ativa                 := 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa - 1;

     Paciente_OK     := True;
     Preferencia_OK  := False;
     Convenio_OK     := False;
     Indicacao_OK    := False;
     Cid_OK          := False;
     Recibo_OK       := False;
     Faturamento_OK  := False;
     Medico_OK       := False;
     Cirurgia_OK     := False;
     Adicionais_OK   := False;

     Exibe_Tela();

     Cons02.Adicionais1.Enabled := True;
end;

procedure Fecha_Recibo();
begin
     Sequencia_Tela[Tela_Ativa] := ' ';
     Descricao_Tela[Tela_Ativa] := ' ';
     Tela_Ativa                 := 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa - 1;

     Paciente_OK     := True;
     Preferencia_OK  := False;
     Convenio_OK     := False;
     Indicacao_OK    := False;
     Cid_OK          := False;
     Recibo_OK       := False;
     Faturamento_OK  := False;
     Medico_OK       := False;
     Cirurgia_OK     := False;
     Adicionais_OK   := False;

     Exibe_Tela();

     Cons02.ControledeRecibos1.Enabled := True;
end;

procedure Fecha_Faturamento();
begin
     Sequencia_Tela[Tela_Ativa] := ' ';
     Descricao_Tela[Tela_Ativa] := ' ';
     Tela_Ativa                 := 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa - 1;

     Paciente_OK     := True;
     Preferencia_OK  := False;
     Convenio_OK     := False;
     Indicacao_OK    := False;
     Cid_OK          := False;
     Recibo_OK       := False;
     Faturamento_OK  := False;
     Medico_OK       := False;
     Cirurgia_OK     := False;
     Adicionais_OK   := False;

     Exibe_Tela();

     Cons02.Faturamento1.Enabled := True;
end;

procedure Fecha_Medico();
begin
     Sequencia_Tela[Tela_Ativa] := ' ';
     Descricao_Tela[Tela_Ativa] := ' ';
     Tela_Ativa                 := 1;
     Qtde_Tela_Ativa            := Qtde_Tela_Ativa - 1;

     Paciente_OK     := True;
     Preferencia_OK  := False;
     Convenio_OK     := False;
     Indicacao_OK    := False;
     Cid_OK          := False;
     Recibo_OK       := False;
     Faturamento_OK  := False;
     Medico_OK       := False;
     Cirurgia_OK     := False;
     Adicionais_OK   := False;

     Exibe_Tela();

     Cons02.CadastrodoMdico1.Enabled := True;
end;

procedure Fecha_Tudo();
begin
     Cursor_Ampulheta();

{*** Fecha Todas os Querys e Tabelas Abertas ***}

     ConexaoBD.SQL_Paciente.Close;
     ConexaoBD.SQL_Paciente_AG.Close;
     ConexaoBD.SQL_Paciente_Lista.Close;

     ConexaoBD.SQL_Convenio.Close;
     ConexaoBD.SQL_Convenio_AG.Close;
     ConexaoBD.SQL_Convenio_FAT.Close;

     ConexaoBD.SQL_Agenda.Close;
     ConexaoBD.SQL_Agenda_FAT.Close;

     ConexaoBD.SQL_Conexao.Close;

     ConexaoBD.SQL_Medico.Close;

     ConexaoBD.SQL_Recibo.Close;

     ConexaoBD.SQL_Cid.Close;

     ConexaoBD.SQL_Indicacao.Close;

     ConexaoBD.SQL_Usuario.Close;

     ConexaoBD.SQL_Comunitario.Close;
     ConexaoBD.SQL_Cirurgia.Close;
     ConexaoBD.SQL_Adicionais.Close;
     ConexaoBD.SQL_Cirurgia_AG.Close;
     ConexaoBD.SQL_Comunitario_Aux.Close;
     ConexaoBD.SQL_Adicionais_AG.Close;
     ConexaoBD.SQL_Adicionais_Lista.Close;
     ConexaoBD.SQL_Rel_Detalhado.Close;

     ConexaoBD.Conexao_Principal.Connected := False;
     ConexaoBD.Conexao_Principal.Close;

     Cursor_Normal();
end;

procedure Carrega_Lista_Pacientes();

var
   Ind: Integer;
   Nro_Ficha: String;
   Nro_Ficha_Ok: Boolean;

begin
     Cursor_Ampulheta();

{*** Carrega a Lista de Pacientes ***}

     if Length(Cons02.localiza_paciente.Text) > 0 then
        begin
        conexaoBD.SQL_Paciente.Close;
        conexaoBD.SQL_Paciente.SQL.Clear;

        if Cons02.localizar_por.Text = 'Nome' then
           begin
           conexaoBD.SQL_Paciente.SQL.Add('select * from Paciente where (paciente_nome like "'+Cons02.localiza_paciente.Text+'%") or'+
           ' (paciente_nome+" "+paciente_sobrenome like "'+Cons02.localiza_paciente.Text+'%") order by paciente_nome_sobrenome');
           end
        else if Cons02.localizar_por.Text = 'Sobrenome' then
           begin
           conexaoBD.SQL_Paciente.SQL.Add('select * from Paciente where (paciente_sobrenome like "'+Cons02.localiza_paciente.Text+'%") or'+
           ' (paciente_nome+" "+paciente_sobrenome like "'+Cons02.localiza_paciente.Text+'%") order by paciente_nome_sobrenome');
           end
        else if Cons02.localizar_por.Text = 'Nro. Ficha' then
           begin

           Nro_Ficha := Cons02.localiza_paciente.Text;
           Nro_Ficha_Ok := True;
           conexaoBD.SQL_Paciente.SQL.Add('select * from Paciente where paciente_ficha ="'+Cons02.localiza_paciente.Text+'" order by paciente_nome_sobrenome');
           end
        else if Cons02.localizar_por.Text = 'RG' then
           begin
           conexaoBD.SQL_Paciente.SQL.Add('select * from Paciente where paciente_rg like "'+Cons02.localiza_paciente.Text+'%" order by paciente_nome_sobrenome');
        end;

        conexaoBD.SQL_Paciente.Open;

        Cons02.paciente_lista.Refresh;
        Cons02.paciente_lista.SetFocus;

     end;

     Carrega_Lista_Indicacao();
     Carrega_Lista_Convenio();

     Cursor_Normal();
end;

procedure Carrega_Lista_Pacientes_AG();

var
   Ind: Integer;
   Nro_Ficha: String;
   Nro_Ficha_Ok: Boolean;

begin
     Cursor_Ampulheta();

{*** Carrega a Lista de Pacientes ***}

     if Length(Agenda.horario_descricao.Text) > 0 then
        begin
        conexaoBD.SQL_Paciente_AG.Close;
        conexaoBD.SQL_Paciente_AG.SQL.Clear;

        if Agenda.horario_localiza.Text = 'Nome' then
           begin
           conexaoBD.SQL_Paciente_AG.SQL.Add('select * from Paciente where (paciente_nome like "'+Agenda.horario_descricao.Text+'%") or'+
           ' (paciente_nome+" "+paciente_sobrenome like "'+Agenda.horario_descricao.Text+'%") order by paciente_nome_sobrenome');
           end
        else if Agenda.horario_localiza.Text = 'Sobrenome' then
           begin
           conexaoBD.SQL_Paciente_AG.SQL.Add('select * from Paciente where (paciente_sobrenome like "'+Agenda.horario_descricao.Text+'%") or'+
           ' (paciente_nome+" "+paciente_sobrenome like "'+Agenda.horario_descricao.Text+'%") order by paciente_nome_sobrenome');
           end
        else if Agenda.horario_localiza.Text = 'Nro. Ficha' then
           begin

           Nro_Ficha := Agenda.horario_descricao.Text;
           Nro_Ficha_Ok := True;
           conexaoBD.SQL_Paciente_AG.SQL.Add('select * from Paciente where paciente_ficha like "'+Agenda.horario_descricao.Text+'%" order by paciente_nome_sobrenome');
           end
        else if Agenda.horario_localiza.Text = 'Sobrenome' then
           begin
           conexaoBD.SQL_Paciente_AG.SQL.Add('select * from Paciente where paciente_rg like "'+Agenda.horario_descricao.Text+'%" order by paciente_nome_sobrenome');
        end;

        conexaoBD.SQL_Paciente_AG.Open;
        Agenda.horario_paciente_lista.Refresh;

     end;

     Cursor_Normal();
end;

procedure Carrega_Lista_Convenio();

Var
   Ind: Integer;

begin
     if Carregado_OK = True then
        begin
        Cursor_Ampulheta();

        conexaoBD.SQL_Convenio.Close;
        conexaoBD.SQL_Convenio.SQL.Clear;
        conexaoBD.SQL_Convenio.SQL.Add('select * from Convenio order by convenio_apelido');
        conexaoBD.SQL_Convenio.Open;

        Cons02.Paciente1.paciente_convenio.Items.Clear;
        for Ind := 1 to conexaoBD.SQL_Convenio.RecordCount do begin
            Cons02.Paciente1.paciente_convenio.Items.Add(conexaoBD.SQL_Convenio.FieldValues['Convenio_Apelido']);
            conexaoBD.SQL_Convenio.Next;
        end;

        Cursor_Normal();
     end;
end;

procedure Carrega_Lista_Convenio_AG();

Var
   Ind: Integer;

begin
     Cursor_Ampulheta();

     conexaoBD.SQL_Convenio_AG.Close;
     conexaoBD.SQL_Convenio_AG.SQL.Clear;
     conexaoBD.SQL_Convenio_AG.SQL.Add('select * from Convenio order by convenio_apelido');
     conexaoBD.SQL_Convenio_AG.Open;

     Agenda.horario_convenio.Items.Clear;
     for Ind := 1 to conexaoBD.SQL_Convenio_AG.RecordCount do begin
         Agenda.horario_convenio.Items.Add(conexaoBD.SQL_Convenio_AG.FieldValues['Convenio_Apelido']);
         conexaoBD.SQL_Convenio_AG.Next;
     end;

     Cursor_Normal();
end;

procedure Carrega_Lista_Convenio_FAT();

Var
   Ind: Integer;

begin
     Cursor_Ampulheta();

     conexaoBD.SQL_Convenio_FAT.Close;
     conexaoBD.SQL_Convenio_FAT.SQL.Clear;
     conexaoBD.SQL_Convenio_FAT.SQL.Add('select * from Convenio order by convenio_apelido');
     conexaoBD.SQL_Convenio_FAT.Open;

     Cons02.Faturamento2.faturamento_convenio.Items.Clear;
     Cons02.Faturamento2.faturamento_convenio.Items.Add('--- Total Geral ---');
     for Ind := 1 to conexaoBD.SQL_Convenio_FAT.RecordCount do begin
         Cons02.Faturamento2.faturamento_convenio.Items.Add(conexaoBD.SQL_Convenio_FAT.FieldValues['Convenio_Apelido']);
         conexaoBD.SQL_Convenio_FAT.Next;
     end;
     Cons02.Faturamento2.faturamento_convenio.ItemIndex := 0;

     Cursor_Normal();
end;

procedure Carrega_Lista_Indicacao();

Var
   Ind: Integer;

begin
     if Carregado_OK = True then
        begin
        Cursor_Ampulheta();

        conexaoBD.SQL_Indicacao.Close;
        conexaoBD.SQL_Indicacao.SQL.Clear;
        conexaoBD.SQL_Indicacao.SQL.Add('select * from Indicacao order by indicacao_nome');
        conexaoBD.SQL_Indicacao.Open;

        Cons02.Paciente1.paciente_indicacao.Items.Clear;
        for Ind := 1 to conexaoBD.SQL_Indicacao.RecordCount do begin
            Cons02.Paciente1.paciente_indicacao.Items.Add(conexaoBD.SQL_Indicacao.FieldValues['indicacao_nome']);
            conexaoBD.SQL_Indicacao.Next;
        end;

        Cursor_Normal();
     end;
end;

procedure Carrega_Lista_Medico();

Var
   Ind: Integer;

begin
     Cursor_Ampulheta();

     conexaoBD.SQL_Medico.Close;
     conexaoBD.SQL_Medico.SQL.Clear;
     conexaoBD.SQL_Medico.SQL.Add('select * from Medico Order By Medico_Nome');
     conexaoBD.SQL_Medico.Open;

     if conexaoBD.SQL_Medico.RecordCount = 0 then
        begin
        conexaoBD.SQL_Medico.Close;
        conexaoBD.SQL_Medico.SQL.Clear;
        conexaoBD.SQL_Medico.SQL.Add('insert into Medico'+
        '(Medico_crm,'+
        'Medico_Nome,'+
        'Medico_especialidade,'+
        'Medico_rg,'+
        'Medico_cpf,'+
        'Medico_endereco,'+
        'Medico_complemento,'+
        'Medico_bairro,'+
        'Medico_cidade,'+
        'Medico_uf,'+
        'Medico_cep,'+
        'Medico_fone_consultorio,'+
        'Medico_fone_residencia,'+
        'Medico_fone_celular,'+
        'Medico_fone_fax,'+
        'Medico_email)'+
        ' values("0000000000",'+
        '"ConsulTEX",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '"SP",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '" ",'+
        '" ")');
        conexaoBD.SQL_Medico.ExecSQL;

        conexaoBD.SQL_Medico.Close;
        conexaoBD.SQL_Medico.SQL.Clear;
        conexaoBD.SQL_Medico.SQL.Add('select * from Medico Order By Medico_Nome');
        conexaoBD.SQL_Medico.Open;
     end;

     Login00.login_medico.Items.Clear;

     for Ind := 1 to conexaoBD.SQL_Medico.RecordCount do begin
         Login00.login_medico.Items.Add(conexaoBD.SQL_Medico.FieldValues['Medico_nome']);
         conexaoBD.SQL_Medico.Next;
     end;

     Login00.login_medico.ItemIndex := 0;

     Cursor_Normal();
end;

procedure Limpa_Convenio();
begin
     Cons02.convenio1.convenio_numero.Text         := '';
     Cons02.convenio1.convenio_razao_social.Text   := '';
     Cons02.convenio1.convenio_nome_fantasia.Text  := '';
     Cons02.convenio1.convenio_apelido.Text        := '';
     Cons02.convenio1.convenio_endereco.Text       := '';
     Cons02.convenio1.convenio_complemento.Text    := '';
     Cons02.convenio1.convenio_bairro.Text         := '';
     Cons02.convenio1.convenio_cidade.Text         := '';
     Cons02.convenio1.convenio_cep.Text            := '';
     Cons02.convenio1.convenio_uf.ItemIndex        := 0;
     Cons02.convenio1.convenio_fone_1.Text         := '';
     Cons02.convenio1.convenio_fone_2.Text         := '';
     Cons02.convenio1.convenio_fax.Text            := '';
     Cons02.convenio1.convenio_setor_resp.Text     := '';
     Cons02.convenio1.convenio_qtde_ch.Text        := '';
     Cons02.convenio1.convenio_valor_ch.Text       := '';
     Cons02.convenio1.convenio_valor_consulta.Text := '';
     Cons02.convenio1.convenio_valor_cirurgia.Text := '';
end;

procedure Limpa_Indicacao();
begin
     Cons02.Indicacao1.indicacao_numero.Text      := '';
     Cons02.Indicacao1.indicacao_nome.Text        := '';
     Cons02.Indicacao1.indicacao_endereco.Text    := '';
     Cons02.Indicacao1.indicacao_complemento.Text := '';
     Cons02.Indicacao1.indicacao_bairro.Text      := '';
     Cons02.Indicacao1.indicacao_cidade.Text      := '';
     Cons02.Indicacao1.indicacao_cep.Text         := '';
     Cons02.Indicacao1.indicacao_uf.ItemIndex     := 0;
     Cons02.Indicacao1.indicacao_fone.Text        := '';
     Cons02.Indicacao1.indicacao_celular.Text     := '';
     Cons02.Indicacao1.indicacao_fax.Text         := '';
     Cons02.Indicacao1.indicacao_email.Text       := '';
end;

procedure Limpa_Medico();
begin
     Cons02.Medico1.medico_crm.Text              := '';
     Cons02.Medico1.medico_nome.Text             := '';
     Cons02.Medico1.medico_rg.Text               := '';
     Cons02.Medico1.medico_cpf.Text              := '';
     Cons02.Medico1.medico_especialidade.Text    := '';
     Cons02.Medico1.medico_endereco.Text         := '';
     Cons02.Medico1.medico_complemento.Text      := '';
     Cons02.Medico1.medico_bairro.Text           := '';
     Cons02.Medico1.medico_cidade.Text           := '';
     Cons02.Medico1.medico_uf.ItemIndex          := 0;
     Cons02.Medico1.medico_cep.Text              := '';
     Cons02.Medico1.medico_fone_consultorio.Text := '';
     Cons02.Medico1.medico_fone_residencia.Text  := '';
     Cons02.Medico1.medico_fone_celular.Text     := '';
     Cons02.Medico1.medico_fone_fax.Text         := '';
     Cons02.Medico1.medico_email.Text            := '';
end;

procedure Limpa_Paciente();
begin
     Cons02.Paciente1.paciente_ficha.Text                   := '';
     Cons02.Paciente1.paciente_nome.Text                    := '';
     Cons02.Paciente1.paciente_sobrenome.Text               := '';
     Cons02.Paciente1.paciente_rg.Text                      := '';
     Cons02.Paciente1.paciente_cpf.Text                     := '';
     Cons02.Paciente1.paciente_dt_cadastro.Text             := Prepara_Data(DateToStr(Date));
     Cons02.Paciente1.paciente_dt_nascimento.Text           := '';
     Cons02.Paciente1.paciente_indicacao.Text               := '';
     Cons02.Paciente1.paciente_sexo.ItemIndex               := 0;
     Cons02.Paciente1.paciente_situacao.ItemIndex           := 0;
     Cons02.Paciente1.paciente_convenio.ItemIndex           := -1;
     Cons02.Paciente1.paciente_matricula.Text               := '';
     Cons02.Paciente1.paciente_titular.Text                 := '';
     Cons02.Paciente1.paciente_dt_ult_consulta.Text         := '';
     Cons02.Paciente1.paciente_endereco.ItemIndex           := 0;
     Cons02.Paciente1.paciente_logradouro.Text              := '';
     Cons02.Paciente1.paciente_complemento.Text             := '';
     Cons02.Paciente1.paciente_bairro.Text                  := '';
     Cons02.Paciente1.paciente_cidade.Text                  := '';
     Cons02.Paciente1.paciente_cep.Text                     := '';
     Cons02.Paciente1.paciente_uf.ItemIndex                 := 0;
     Cons02.Paciente1.paciente_instrucao.ItemIndex          := 0;
     Cons02.Paciente1.paciente_estado_civil.ItemIndex       := 0;
     Cons02.Paciente1.paciente_naturalidade.Text            := '';
     Cons02.Paciente1.paciente_profissao.Text               := '';
     Cons02.Paciente1.paciente_email.Text                   := '';
     Cons02.Paciente1.paciente_fone_residencial.Text        := '';
     Cons02.Paciente1.paciente_fone_comercial.Text          := '';
     Cons02.Paciente1.paciente_fone_fax.Text                := '';
     Cons02.Paciente1.paciente_fone_celular.Text            := '';
     Cons02.Paciente1.paciente_idade.Text                   := '';
     Cons02.Paciente1.paciente_observacao.Text              := '';
     Cons02.Paciente1.paciente_prontuario.Text              := '';
     Cons02.Paciente1.paciente_nome_alterado.Text           := '';
     Cons02.Paciente1.paciente_nome_ant.Text
             := '';

     Cons02.Recibo1.recibo_paciente_ficha.Text              := '';
     Cons02.Recibo1.recibo_paciente_nome.Text               := '';
     Cons02.Recibo1.recibo_paciente_nome_ant.Text           := '';

     Cons02.Paciente1.Foto_Paciente.Picture                 := Nil;
end;

procedure Limpa_Agenda();
begin
     Agenda.horario_hora.Text               := '';
     Agenda.horario_tipo.Text               := '';
     Agenda.horario_localiza.ItemIndex      := 0;
     Agenda.horario_descricao.Text          := '';
     Agenda.horario_status.Text             := '';
     Agenda.horario_convenio.ItemIndex      := -1;
     Agenda.horario_ficha_nro.Text          := '';
     Agenda.horario_convenio_nro.Text       := '';
     Agenda.horario_cirurgia_descricao.Text := '';
     Agenda.horario_quantidade_ch.Text      := '0';
     Agenda.horario_valor_ch.Text           := '0.00';
     Agenda.horario_valor_cirurgia.Text     := '0.00';
     Agenda.horario_material.Text           := '';
     Agenda.horario_observacao.Text         := '';
     Agenda.horario_tipo_cirurgia.ItemIndex := -1;
end;

procedure Limpa_Cid();
begin
     Cons02.Cid2.cid_codigo.Text            := '';
     Cons02.Cid2.cid_descricao.Text         := '';
     Cons02.Cid2.cid_observacao.Text        := '';

     Cons02.Cid2.cid_tipo_procura.ItemIndex := 0;
     Cons02.Cid2.cid_procura.Text           := '';
end;

procedure Limpa_Cirurgia();
begin
     Cons02.Cirurgia2.cirurgia_codigo.Text            := '';
     Cons02.Cirurgia2.cirurgia_descricao.Text         := '';
     Cons02.Cirurgia2.cirurgia_observacao.Text        := '';
     Cons02.Cirurgia2.cirurgia_quantidade.Text        := '';
     Cons02.Cirurgia2.cirurgia_material.Text          := '';

     Cons02.Cirurgia2.cirurgia_tipo_procura.ItemIndex := 0;
     Cons02.Cirurgia2.cirurgia_procura.Text           := '';
end;

procedure Limpa_Adicionais();
begin
     Cons02.Adicionais2.adicional_codigo.Text            := '';
     Cons02.Adicionais2.adicional_descricao.Text         := '';
     Cons02.Adicionais2.adicional_observacao.Text        := '';
     Cons02.Adicionais2.adicional_valor.Text             := '';

     Cons02.Adicionais2.adicional_tipo_procura.ItemIndex := 0;
     Cons02.Adicionais2.adicional_procura.Text           := '';
end;

procedure Limpa_Recibo();
begin
     Cons02.Recibo1.recibo_data_emissao.Text    := Prepara_Data(DateToStr(Date()));
     Cons02.Recibo1.recibo_valor.Text           := '';
     Cons02.Recibo1.recibo_discriminacao.Clear;
     Cons02.Recibo1.recibo_inicio.Text          := '';
     Cons02.Recibo1.recibo_final.Text           := '';
     Cons02.Recibo1.recibo_apagar.Text          := '';
end;

procedure Limpa_Faturamento();
begin
     Cons02.Faturamento2.faturamento_inicio.Text           := Prepara_Data(DateToStr(Date()));
     Cons02.Faturamento2.faturamento_final.Text            := Prepara_Data(DateToStr(Date()));
     Cons02.Faturamento2.faturamento_consulta_qtde.Text    := '';
     Cons02.Faturamento2.faturamento_consulta_ch.Text      := '';
     Cons02.Faturamento2.faturamento_cirurgia_qtde.Text    := '';
     Cons02.Faturamento2.faturamento_cirurgia_ch.Text      := '';
     Cons02.Faturamento2.faturamento_total_consulta.Text   := '';
     Cons02.Faturamento2.faturamento_total_cirurgia.Text   := '';
     Cons02.Faturamento2.faturamento_total_geral.Text      := '';
     Cons02.Faturamento2.faturamento_adicionais_qtde.Text  := '';
     Cons02.Faturamento2.faturamento_total_adicionais.Text := '';
end;

procedure Limpa_Preferencia();
begin
     Cons02.Preferencia1.usuario_nome.Text         := '';
     Cons02.Preferencia1.usuario_senha.Text        := '';

     Cons02.Preferencia1.agenda_t.Checked          := True;
     Cons02.Preferencia1.agenda_s.Checked          := False;
     Cons02.Preferencia1.agenda_l.Checked          := False;

     Cons02.Preferencia1.paciente_t.Checked        := True;
     Cons02.Preferencia1.paciente_s.Checked        := False;
     Cons02.Preferencia1.paciente_l.Checked        := False;

     Cons02.Preferencia1.prontuario_t.Checked      := True;
     Cons02.Preferencia1.prontuario_s.Checked      := False;
     Cons02.Preferencia1.prontuario_l.Checked      := False;

     Cons02.Preferencia1.observacoes_t.Checked     := True;
     Cons02.Preferencia1.observacoes_s.Checked     := False;
     Cons02.Preferencia1.observacoes_l.Checked     := False;

     Cons02.Preferencia1.convenio_t.Checked        := True;
     Cons02.Preferencia1.convenio_s.Checked        := False;
     Cons02.Preferencia1.convenio_l.Checked        := False;

     Cons02.Preferencia1.indicacao_t.Checked       := True;
     Cons02.Preferencia1.indicacao_s.Checked       := False;
     Cons02.Preferencia1.indicacao_l.Checked       := False;

     Cons02.Preferencia1.cid_t.Checked             := True;
     Cons02.Preferencia1.cid_s.Checked             := False;
     Cons02.Preferencia1.cid_l.Checked             := False;

     Cons02.Preferencia1.paciente_env_t.Checked    := True;
     Cons02.Preferencia1.paciente_env_s.Checked    := False;
     Cons02.Preferencia1.paciente_env_l.Checked    := False;

     Cons02.Preferencia1.ficha_imp_t.Checked       := True;
     Cons02.Preferencia1.ficha_imp_s.Checked       := False;
     Cons02.Preferencia1.ficha_imp_l.Checked       := False;

     Cons02.Preferencia1.faturamento_imp_t.Checked := True;
     Cons02.Preferencia1.faturamento_imp_s.Checked := False;
     Cons02.Preferencia1.faturamento_imp_l.Checked := False;

     Cons02.Preferencia1.recibo_imp_t.Checked      := True;
     Cons02.Preferencia1.recibo_imp_s.Checked      := False;
     Cons02.Preferencia1.recibo_imp_l.Checked      := False;

     Cons02.Preferencia1.usuario_t.Checked         := True;
     Cons02.Preferencia1.usuario_s.Checked         := False;
     Cons02.Preferencia1.usuario_l.Checked         := False;

     Cons02.Preferencia1.medico_t.Checked          := True;
     Cons02.Preferencia1.medico_s.Checked          := False;
     Cons02.Preferencia1.medico_l.Checked          := False;

     Cons02.Preferencia1.cirurgia_t.Checked        := True;
     Cons02.Preferencia1.cirurgia_s.Checked        := False;
     Cons02.Preferencia1.cirurgia_l.Checked        := False;

     Cons02.Preferencia1.adicionais_t.Checked      := True;
     Cons02.Preferencia1.adicionais_s.Checked      := False;
     Cons02.Preferencia1.adicionais_l.Checked      := False;
end;

procedure Carrega_Paciente();
begin

{*** Prepara o Campo de Indicação ***}

     if Cons02.Paciente1.paciente_indicacao.Text <> '' then
        begin
        conexaoBD.SQL_Indicacao.Close;
        conexaoBD.SQL_Indicacao.SQL.Clear;
        conexaoBD.SQL_Indicacao.SQL.Add('select * from Indicacao where indicacao_nome = "'+
        Cons02.Paciente1.paciente_indicacao.Text+'"');
        conexaoBD.SQL_Indicacao.Open;

        if conexaoBD.SQL_Indicacao.RecordCount > 0 then
           begin
           P_Indicacao_Numero := conexaoBD.SQL_Indicacao.FieldValues['indicacao_numero'];
           end
        else
           begin
           conexaoBD.SQL_Indicacao.Close;
           conexaoBD.SQL_Indicacao.SQL.Clear;
           conexaoBD.SQL_Indicacao.SQL.Add('insert into Indicacao(Indicacao_nome) values("'+Cons02.Paciente1.paciente_indicacao.Text+'")');
           conexaoBD.SQL_Indicacao.ExecSQL;

           conexaoBD.SQL_Indicacao.Close;
           conexaoBD.SQL_Indicacao.SQL.Clear;
           conexaoBD.SQL_Indicacao.SQL.Add('select * from Indicacao where indicacao_nome = "'+
           Cons02.Paciente1.paciente_indicacao.Text+'"');
           conexaoBD.SQL_Indicacao.Open;

           if conexaoBD.SQL_Indicacao.RecordCount > 0 then
              begin
              P_Indicacao_Numero := conexaoBD.SQL_Indicacao.FieldValues['indicacao_numero'];
              end
           else
              begin
              P_Indicacao_Numero := '0';
           end;
        end;
        end
     else
        begin
        P_Indicacao_Numero := '0';
     end;

{*** Prepara o Campo de Sexo ***}

     if UpperCase(Cons02.Paciente1.paciente_sexo.Text) = 'MASCULINO' then
        begin
        P_Sexo := 'M';
        end
     else
        begin
        P_Sexo := 'F';
     end;

{*** Prepara o Campo de Situacao ***}

     if UpperCase(Cons02.Paciente1.paciente_situacao.Text) = 'INATIVO' then
        begin
        P_Situacao := 'I';
        end
     else
        begin
        P_Situacao := 'A';
     end;

{*** Prepara o Campo de Convenio ***}

     conexaoBD.SQL_Convenio.Close;
     conexaoBD.SQL_Convenio.SQL.Clear;
     conexaoBD.SQL_Convenio.SQL.Add('select * from Convenio where convenio_apelido = "'+
     Cons02.Paciente1.paciente_convenio.Text+'"');
     conexaoBD.SQL_Convenio.Open;

     if conexaoBD.SQL_Convenio.RecordCount > 0 then
        begin
        P_Convenio := conexaoBD.SQL_Convenio.FieldValues['Convenio_Numero'];
        end
     else
        begin
        P_Convenio := '0';
     end;

{*** Valida a Data da Ultima Consulta ***}

     if Trim(Cons02.Paciente1.paciente_dt_ult_consulta.Text) <> '/  /' then
        begin
        P_dt_ult_consulta := Cons02.Paciente1.paciente_dt_ult_consulta.Text;
        end
     else
        begin
        P_dt_ult_consulta := '/  /';
     end;

{*** Prepara o Campo de Endereço ***}

     if UpperCase(Cons02.Paciente1.paciente_endereco.Text) = 'COMERCIAL' then
        begin
        P_Endereco := 'C';
        end
     else
        begin
        P_Endereco := 'R';
     end;

{*** Prepara o Campo de Grau de Instrução ***}

     if UpperCase(Cons02.Paciente1.paciente_instrucao.Text) = '1O. GRAU INCOMPLETO' then
        begin
        P_Instrucao := '1';
        end
     else if UpperCase(Cons02.Paciente1.paciente_instrucao.Text) = '1O. GRAU COMPLETO' then
        begin
        P_Instrucao := '2';
        end
     else if UpperCase(Cons02.Paciente1.paciente_instrucao.Text) = '2O. GRAU INCOMPLETO' then
        begin
        P_Instrucao := '3';
        end
     else if UpperCase(Cons02.Paciente1.paciente_instrucao.Text) = '2O. GRAU COMPLETO' then
        begin
        P_Instrucao := '4';
        end
     else if UpperCase(Cons02.Paciente1.paciente_instrucao.Text) = '3O. GRAU INCOMPLETO' then
        begin
        P_Instrucao := '5';
        end
     else if UpperCase(Cons02.Paciente1.paciente_instrucao.Text) = '3O. GRAU COMPLETO' then
        begin
        P_Instrucao := '6';
        end
     else
        begin
        P_Instrucao := '1';
     end;

{*** Prepara o Campo de Estado Civil ***}

     if UpperCase(Cons02.Paciente1.paciente_estado_civil.Text) = 'SOLTEIRO' then
        begin
        P_Estado_Civil := 'S';
        end
     else if UpperCase(Cons02.Paciente1.paciente_estado_civil.Text) = 'CASADO' then
        begin
        P_Estado_Civil := 'C';
        end
     else if UpperCase(Cons02.Paciente1.paciente_estado_civil.Text) = 'DIVORCIADO' then
        begin
        P_Estado_Civil := 'D';
        end
     else if UpperCase(Cons02.Paciente1.paciente_estado_civil.Text) = 'SEPARADO' then
        begin
        P_Estado_Civil := 'E';
        end
     else if UpperCase(Cons02.Paciente1.paciente_estado_civil.Text) = 'VIUVO' then
        begin
        P_Estado_Civil := 'V';
     end;
end;

procedure Carrega_Agenda(Novo: Boolean);

var
   Data_Grava: String;

begin

{*** Prepara o Campo de Tipo ***}

     if UpperCase(Agenda.horario_tipo.Text) = 'CONSULTA' then
        begin
        Agenda.horario_tipo.Text := 'Consulta';
        end
     else if UpperCase(Agenda.horario_tipo.Text) = 'RETORNO' then
        begin
        Agenda.horario_tipo.Text := 'Retorno';
        end
     else if UpperCase(Agenda.horario_tipo.Text) = 'CIRURGIA' then
        begin
        Agenda.horario_tipo.Text := 'Cirurgia';
        end
     else if UpperCase(Agenda.horario_tipo.Text) = 'RESULTADO EXAME' then
        begin
        Agenda.horario_tipo.Text := 'Resultado Exame';
        end
     else if UpperCase(Agenda.horario_tipo.Text) = 'ADICIONAL' then
        begin
        Agenda.horario_tipo.Text := 'Adicional';
     end;
{*** Prepara o Campo de Nro. da Ficha ***}
     if Agenda.horario_ficha_nro.Text <> '' then
        begin
        conexaoBD.SQL_Paciente_AG.Close;
        conexaoBD.SQL_Paciente_AG.SQL.Clear;
        conexaoBD.SQL_Paciente_AG.SQL.Add('select * from Paciente where paciente_ficha = "'+
        Agenda.horario_ficha_nro.Text+'"');
        conexaoBD.SQL_Paciente_AG.Open;

        if conexaoBD.SQL_Paciente_AG.RecordCount > 0 then
           begin
           if UpperCase(Agenda.horario_descricao.Text) = UpperCase(conexaoBD.SQL_Paciente_AGPaciente_Nome_Sobrenome.AsString) then
              begin
              Agenda.horario_descricao.Text := conexaoBD.SQL_Paciente_AGPaciente_Nome_Sobrenome.AsString;
              end
           else
              begin
              Agenda.horario_ficha_nro.Text := '0';
           end;
           end
        else
           begin
           Agenda.horario_ficha_nro.Text := '0';
        end;
        end
     else
        begin
        Agenda.horario_ficha_nro.Text := '0';
     end;

{*** Carrega o Campo de Status ***}

     if UpperCase(Agenda.horario_status.Text) = 'MARCADO' then
        begin
        Agenda.horario_status.Text := 'Marcado';
        end
     else if UpperCase(Agenda.horario_status.Text) = 'ATENDIDO' then
        begin
        Agenda.horario_status.Text := 'Atendido';
        end
     else if UpperCase(Agenda.horario_status.Text) = 'AGUARDANDO' then
        begin
        Agenda.horario_status.Text := 'Aguardando';
        end
     else if UpperCase(Agenda.horario_status.Text) = 'EM CONSULTA' then
        begin
        Agenda.horario_status.Text := 'Em Consulta';
        end
     else if UpperCase(Agenda.horario_status.Text) = 'EM CIRURGIA' then
        begin
        Agenda.horario_status.Text := 'Em Cirurgia';
        end
     else if UpperCase(Agenda.horario_status.Text) = 'NÃO COMPARECEU' then
        begin
        Agenda.horario_status.Text := 'Não Compareceu';
     end;

{*** Carrega Campo de Nro. de Convênio ***}

     conexaoBD.SQL_Convenio_AG.Close;
     conexaoBD.SQL_Convenio_AG.SQL.Clear;
     conexaoBD.SQL_Convenio_AG.SQL.Add('select Convenio_numero, Convenio_valor_consulta, Convenio_valor_ch, Convenio_qtde_ch, Convenio_valor_cirurgia from Convenio where convenio_apelido = "'+
     Agenda.horario_convenio.Text+'"');
     conexaoBD.SQL_Convenio_AG.Open;

     if conexaoBD.SQL_Convenio_AG.RecordCount > 0 then
        begin
        Agenda.horario_convenio_nro.Text := conexaoBD.SQL_Convenio_AG.FieldValues['convenio_numero'];
        end
     else
        begin
        Agenda.horario_convenio_nro.Text  := '0';
        Agenda.horario_convenio.ItemIndex := -1;
     end;

{*** Carrega os Valores para Consulta e Cirurgia ***}

     Agenda.horario_cirurgia_descricao.Text := '';
     Agenda.horario_quantidade_ch.Text      := '0';
     Agenda.horario_valor_ch.Text           := '0.00';
     Agenda.horario_valor_cirurgia.Text     := '0.00';

     If ((Agenda.horario_tipo.Text = 'Consulta') Or (Agenda.horario_tipo.Text = 'Cirurgia')) Then
        begin

        If Agenda.horario_tipo.Text = 'Cirurgia' Then
           begin
           conexaoBD.SQL_Comunitario_Aux.Close;
           conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
           conexaoBD.SQL_Comunitario_Aux.SQL.Add('select * from Cirurgia where Cirurgia_codigo = "'+Agenda.horario_tipo_cirurgia.Text+'"');
           conexaoBD.SQL_Comunitario_Aux.Open;

           If conexaoBD.SQL_Comunitario_Aux.RecordCount > 0 then
              begin
              Agenda.horario_cirurgia_descricao.Text := conexaoBD.SQL_Comunitario_Aux.FieldValues['Cirurgia_descricao'];
              Agenda.horario_quantidade_ch.Text      := conexaoBD.SQL_Comunitario_Aux.FieldValues['Cirurgia_quantidade_ch'];
              end
           Else
              begin
              Agenda.horario_cirurgia_descricao.Text := '';
              Agenda.horario_quantidade_ch.Text      := '1';
           end;

           If conexaoBD.SQL_Convenio_AG.FieldValues['Convenio_valor_cirurgia'] <> Null Then
              begin
              Agenda.horario_valor_cirurgia.Text := conexaoBD.SQL_Convenio_AG.FieldValues['Convenio_valor_cirurgia'];
              end
           Else
              begin
              Agenda.horario_valor_cirurgia.Text := '0.00';
           end;
        end;

        if conexaoBD.SQL_Convenio_AG.RecordCount > 0 then
           begin
           If Agenda.horario_tipo.Text = 'Consulta' Then
              begin
              Agenda.horario_valor_ch.Text := conexaoBD.SQL_Convenio_AG.FieldValues['Convenio_valor_consulta'];
              end
           Else
              begin
              Agenda.horario_valor_ch.Text := conexaoBD.SQL_Convenio_AG.FieldValues['Convenio_valor_ch'];
           end;
        end;
     end;

{*** Verifica o Valor do Material da Cirurgia ***}

     If Trim(Agenda.horario_material.Text) = '' Then
        begin
        Agenda.horario_material.Text := '0.00';
     end;

{*** Verifica se é um Registro Novo ***}

     if Novo = True then
        begin

        Data_Grava := DateToStr(Agenda.Calendario.Date);

        conexaoBD.SQL_Agenda.Close;
        conexaoBD.SQL_Agenda.SQL.Clear;
        conexaoBD.SQL_Agenda.SQL.Add('insert into Agenda'+
        '(Agenda_data,'+
        'Agenda_hora,'+
        'Agenda_ficha,'+
        'Agenda_descricao,'+
        'Agenda_tipo,'+
        'Agenda_tipo_cirurgia,'+
        'Agenda_status,'+
        'Agenda_convenio,'+
        'Agenda_descricao_convenio,'+
        'Agenda_cirurgia_descricao,'+
        'Agenda_quantidade_ch,'+
        'Agenda_valor_ch,'+
        'Agenda_valor_material_cirurgia,'+
        'Agenda_observacao,'+
        'Agenda_identifica_adicional,'+
        'Agenda_valor_cirurgia,'+
        'Agenda_medico_crm) '+
        'values("'+Data_Grava+'",'+
        '"'+Trim(Agenda.horario_hora.Text)+'","'+
        Agenda.horario_ficha_nro.Text+'",'+
        '"'+Agenda.horario_descricao.Text+'",'+
        '"'+Agenda.horario_tipo.Text+'",'+
        '"'+Agenda.horario_tipo_cirurgia.Text+'",'+
        '"'+Agenda.horario_status.Text+'",'+
        Agenda.horario_convenio_nro.Text+','+
        '"'+Agenda.horario_convenio.Text+'",'+
        '"'+Agenda.horario_cirurgia_descricao.Text+'",'+
        '"'+Agenda.horario_quantidade_ch.Text+'",'+
        '"'+Agenda.horario_valor_ch.Text+'",'+
        '"'+Agenda.horario_material.Text+'",'+
        '"'+Agenda.horario_observacao.Text+'",'+
        '"'+Agenda.horario_adicional_incluido.Text+'",'+
        '"'+Agenda.horario_valor_cirurgia.Text+'",'+
        '"'+Agenda.Agenda_Medico_Crm.Text+'")');
        conexaoBD.SQL_Agenda.ExecSQL;
     end;
end;

procedure Carrega_Recibo();
begin
     if Trim(Cons02.Recibo1.recibo_data_emissao.Text) <> '/  /' then
        begin
        R_Data_Emissao := Cons02.Recibo1.recibo_data_emissao.Text;
        end
     else
        begin
        R_Data_Emissao := DateToStr(Date());
     end;
end;

procedure Carrega_Preferencia();
begin

{*** Acesso da Agenda ***}

     if Cons02.Preferencia1.agenda_t.Checked = True then
        begin
        U_acesso_agenda := 'T';
     end;
     if Cons02.Preferencia1.agenda_s.Checked = True then
        begin
        U_acesso_agenda := 'S';
     end;
     if Cons02.Preferencia1.agenda_l.Checked = True then
        begin
        U_acesso_agenda := 'L';
     end;

{*** Acesso do Paciente ***}

     if Cons02.Preferencia1.paciente_t.Checked = True then
        begin
        U_acesso_paciente := 'T';
     end;
     if Cons02.Preferencia1.paciente_s.Checked = True then
        begin
        U_acesso_paciente := 'S';
     end;
     if Cons02.Preferencia1.paciente_l.Checked = True then
        begin
        U_acesso_paciente := 'L';
     end;

{*** Acesso do Paciente - Prontuario ***}

     if Cons02.Preferencia1.prontuario_t.Checked = True then
        begin
        U_acesso_prontuario := 'T';
     end;
     if Cons02.Preferencia1.prontuario_s.Checked = True then
        begin
        U_acesso_prontuario := 'S';
     end;
     if Cons02.Preferencia1.prontuario_l.Checked = True then
        begin
        U_acesso_prontuario := 'L';
     end;

{*** Acesso do Paciente - Observações ***}

     if Cons02.Preferencia1.observacoes_t.Checked = True then
        begin
        U_acesso_observacoes := 'T';
     end;
     if Cons02.Preferencia1.observacoes_s.Checked = True then
        begin
        U_acesso_observacoes := 'S';
     end;
     if Cons02.Preferencia1.observacoes_l.Checked = True then
        begin
        U_acesso_observacoes := 'L';
     end;

{*** Acesso do Convenio ***}

     if Cons02.Preferencia1.convenio_t.Checked = True then
        begin
        U_acesso_convenio := 'T';
     end;
     if Cons02.Preferencia1.convenio_s.Checked = True then
        begin
        U_acesso_convenio := 'S';
     end;
     if Cons02.Preferencia1.convenio_l.Checked = True then
        begin
        U_acesso_convenio := 'L';
     end;

{*** Acesso da Indicacao ***}

     if Cons02.Preferencia1.indicacao_t.Checked = True then
        begin
        U_acesso_indicacao := 'T';
     end;
     if Cons02.Preferencia1.indicacao_s.Checked = True then
        begin
        U_acesso_indicacao := 'S';
     end;
     if Cons02.Preferencia1.indicacao_l.Checked = True then
        begin
        U_acesso_indicacao := 'L';
     end;

{*** Acesso do CID ***}

     if Cons02.Preferencia1.cid_t.Checked = True then
        begin
        U_acesso_cid := 'T';
     end;
     if Cons02.Preferencia1.cid_s.Checked = True then
        begin
        U_acesso_cid := 'S';
     end;
     if Cons02.Preferencia1.cid_l.Checked = True then
        begin
        U_acesso_cid := 'L';
     end;

{*** Acesso do Envelope do Paciente ***}

     if Cons02.Preferencia1.paciente_env_t.Checked = True then
        begin
        U_acesso_imp_env := 'T';
     end;
     if Cons02.Preferencia1.paciente_env_s.Checked = True then
        begin
        U_acesso_imp_env := 'S';
     end;
     if Cons02.Preferencia1.paciente_env_l.Checked = True then
        begin
        U_acesso_imp_env := 'L';
     end;

{*** Acesso da Ficha do Paciente ***}

     if Cons02.Preferencia1.ficha_imp_t.Checked = True then
        begin
        U_acesso_imp_ficha := 'T';
     end;
     if Cons02.Preferencia1.ficha_imp_s.Checked = True then
        begin
        U_acesso_imp_ficha := 'S';
     end;
     if Cons02.Preferencia1.ficha_imp_l.Checked = True then
        begin
        U_acesso_imp_ficha := 'L';
     end;

{*** Acesso do Faturamento ***}

     if Cons02.Preferencia1.faturamento_imp_t.Checked = True then
        begin
        U_acesso_imp_fat := 'T';
     end;
     if Cons02.Preferencia1.faturamento_imp_s.Checked = True then
        begin
        U_acesso_imp_fat := 'S';
     end;
     if Cons02.Preferencia1.faturamento_imp_l.Checked = True then
        begin
        U_acesso_imp_fat := 'L';
     end;

{*** Acesso do Recibo ***}

     if Cons02.Preferencia1.recibo_imp_t.Checked = True then
        begin
        U_acesso_imp_rec := 'T';
     end;
     if Cons02.Preferencia1.recibo_imp_s.Checked = True then
        begin
        U_acesso_imp_rec := 'S';
     end;
     if Cons02.Preferencia1.recibo_imp_l.Checked = True then
        begin
        U_acesso_imp_rec := 'L';
     end;

{*** Acesso do Usuário ***}

     if Cons02.Preferencia1.usuario_t.Checked = True then
        begin
        U_acesso_usuario := 'T';
     end;
     if Cons02.Preferencia1.usuario_s.Checked = True then
        begin
        U_acesso_usuario := 'S';
     end;
     if Cons02.Preferencia1.usuario_l.Checked = True then
        begin
        U_acesso_usuario := 'L';
     end;

{*** Acesso do Médico ***}

     if Cons02.Preferencia1.medico_t.Checked = True then
        begin
        U_acesso_medico := 'T';
     end;
     if Cons02.Preferencia1.medico_s.Checked = True then
        begin
        U_acesso_medico := 'S';
     end;
     if Cons02.Preferencia1.medico_l.Checked = True then
        begin
        U_acesso_medico := 'L';
     end;

{*** Acesso do Cirurgia ***}

     if Cons02.Preferencia1.cirurgia_t.Checked = True then
        begin
        U_acesso_cirurgia := 'T';
     end;
     if Cons02.Preferencia1.cirurgia_s.Checked = True then
        begin
        U_acesso_cirurgia := 'S';
     end;
     if Cons02.Preferencia1.cirurgia_l.Checked = True then
        begin
        U_acesso_cirurgia := 'L';
     end;

{*** Acesso do Adicionais ***}

     if Cons02.Preferencia1.adicionais_t.Checked = True then
        begin
        U_acesso_adicionais := 'T';
     end;
     if Cons02.Preferencia1.adicionais_s.Checked = True then
        begin
        U_acesso_adicionais := 'S';
     end;
     if Cons02.Preferencia1.adicionais_l.Checked = True then
        begin
        U_acesso_adicionais := 'L';
     end;
end;

procedure Registro_Novo();
begin
     if Sequencia_Tela[Tela_Ativa] = 'paciente' then
        begin
        Limpa_Paciente();
        Carrega_Lista_Indicacao();
        Carrega_Lista_Convenio();
        end
     else if Sequencia_Tela[Tela_Ativa] = 'preferencia' then
        begin
        Limpa_Preferencia();
        end
     else if Sequencia_Tela[Tela_Ativa] = 'convenio' then
        begin
        Limpa_Convenio();
        end
     else if Sequencia_Tela[Tela_Ativa] = 'indicacao' then
        begin
        Limpa_Indicacao();
        end
     else if Sequencia_Tela[Tela_Ativa] = 'medico' then
        begin
        Limpa_Medico();
        end
     else if Sequencia_Tela[Tela_Ativa] = 'cid' then
        begin
        Limpa_Cid();
        end
     else if Sequencia_Tela[Tela_Ativa] = 'cirurgia' then
        begin
        Limpa_Cirurgia();
        end
     else if Sequencia_Tela[Tela_Ativa] = 'adicionais' then
        begin
        Limpa_Adicionais();
     end;
end;

procedure Registro_Novo_AG();
begin
     Limpa_Agenda();
     Carrega_Lista_Convenio_AG();
end;

procedure Registro_Apagar(Sender: TObject);
begin
     if Sequencia_Tela[Tela_Ativa] = 'paciente' then
        begin
        if Cons02.Paciente1.paciente_ficha.Text <> '' then
           begin
           if Confirma('Apagar esta Ficha?') = 6 Then
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Paciente.Close;
              conexaoBD.SQL_Paciente.SQL.Clear;
              conexaoBD.SQL_Paciente.SQL.Add('delete from Paciente'+
              ' where Paciente_ficha = "'+Cons02.Paciente1.paciente_ficha.Text+'"');
              conexaoBD.SQL_Paciente.ExecSQL;
              conexaoBD.SQL_Paciente.Close;
              Limpa_Paciente();
              Carrega_Lista_Pacientes();
              Cursor_Normal();
           end;
        end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'preferencia' then
        begin
        if Cons02.Preferencia1.usuario_nome.Text <> '' then
           begin
           if Confirma('Apagar esta Usuário?') = 6 Then
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Usuario.Close;
              conexaoBD.SQL_Usuario.SQL.Clear;
              conexaoBD.SQL_Usuario.SQL.Add('delete from Usuario'+
              ' where Usuario_nome = "'+Cons02.Preferencia1.usuario_nome.Text+'"');
              conexaoBD.SQL_Usuario.ExecSQL;

              Limpa_Preferencia();

              conexaoBD.SQL_Usuario.Close;
              conexaoBD.SQL_Usuario.SQL.Clear;
              conexaoBD.SQL_Usuario.SQL.Add('select * from Usuario');
              conexaoBD.SQL_Usuario.Open;
              Cons02.Preferencia1.DBGrid1.Refresh;
              Cursor_Normal();
           end;
        end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'convenio' then
        begin
        if Cons02.convenio1.convenio_numero.Text <> '' then
           begin
           if Confirma('Apagar este Convênio?') = 6 Then
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Convenio.Close;
              conexaoBD.SQL_Convenio.SQL.Clear;
              conexaoBD.SQL_Convenio.SQL.Add('delete from Convenio'+
              ' where Convenio_numero = '+Cons02.convenio1.convenio_numero.Text);
              conexaoBD.SQL_Convenio.ExecSQL;

              Limpa_Convenio();

              conexaoBD.SQL_Convenio.Close;
              conexaoBD.SQL_Convenio.SQL.Clear;
              conexaoBD.SQL_Convenio.SQL.Add('select * from Convenio');
              conexaoBD.SQL_Convenio.Open;
              Cons02.convenio1.GRD_Convenios.Refresh;
              Cursor_Normal();
           end;
        end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'indicacao' then
        begin
        if Cons02.Indicacao1.indicacao_numero.Text <> '' then
           begin
           if Confirma('Apagar esta Indicação?') = 6 Then
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Indicacao.Close;
              conexaoBD.SQL_Indicacao.SQL.Clear;
              conexaoBD.SQL_Indicacao.SQL.Add('delete from Indicacao where indicacao_numero = '+Cons02.Indicacao1.indicacao_numero.Text);
              conexaoBD.SQL_Indicacao.ExecSQL;

              Limpa_Indicacao();

              conexaoBD.SQL_Indicacao.Close;
              conexaoBD.SQL_Indicacao.SQL.Clear;
              conexaoBD.SQL_Indicacao.SQL.Add('select * from Indicacao');
              conexaoBD.SQL_Indicacao.Open;
              Cons02.Indicacao1.GRD_Indicacao.Refresh;
              Cursor_Normal();
           end;
        end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'medico' then
        begin
        if Cons02.Medico1.medico_crm.Text <> '' then
           begin
           if Confirma('Apagar este Médico?') = 6 Then
              begin
              Cursor_Ampulheta();

              conexaoBD.SQL_Medico.Close;
              conexaoBD.SQL_Medico.SQL.Clear;
              conexaoBD.SQL_Medico.SQL.Add('select * from Medico');
              conexaoBD.SQL_Medico.Open;

              If conexaoBD.SQL_Medico.RecordCount <= 1 Then
                 begin
                 Cursor_Normal();
                 MSG_Erro('Este Médico não poderá ser apagado'+Chr(13)+Chr(10)+'enquanto outro Médico não for cadastrado'+Chr(13)+Chr(10)+'em seu lugar.');
                 end
              Else
                 begin
                 conexaoBD.SQL_Medico.Close;
                 conexaoBD.SQL_Medico.SQL.Clear;
                 conexaoBD.SQL_Medico.SQL.Add('delete from Medico where Medico_Crm = '+#39+Cons02.Medico1.medico_crm.Text+#39);
                 conexaoBD.SQL_Medico.ExecSQL;

                 Limpa_Medico();

                 conexaoBD.SQL_Medico.Close;
                 conexaoBD.SQL_Medico.SQL.Clear;
                 conexaoBD.SQL_Medico.SQL.Add('select * from Medico');
                 conexaoBD.SQL_Medico.Open;
                 Cons02.Medico1.GRD_Medico.Refresh;
              end;

              Cursor_Normal();

           end;
        end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'cid' then
        begin
        if Cons02.Cid2.cid_codigo.Text <> '' then
           begin
           if Confirma('Apagar este C.I.D.?') = 6 Then
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Cid.Close;
              conexaoBD.SQL_Cid.SQL.Clear;
              conexaoBD.SQL_Cid.SQL.Add('delete from Cid'+
              ' where cid_codigo_doenca = "'+Cons02.Cid2.cid_codigo.Text+'"');
              conexaoBD.SQL_Cid.ExecSQL;

              Limpa_Cid();

              conexaoBD.SQL_Cid.Close;
              conexaoBD.SQL_Cid.SQL.Clear;
              conexaoBD.SQL_Cid.SQL.Add('select * from Cid');
              conexaoBD.SQL_Cid.Open;
              Cons02.Cid2.GRD_Cid.Refresh;
              Cursor_Normal();
           end;
        end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'cirurgia' then
        begin
        if Cons02.Cirurgia2.cirurgia_codigo.Text <> '' then
           begin
           if Confirma('Apagar esta Cirurgia?') = 6 Then
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Cirurgia.Close;
              conexaoBD.SQL_Cirurgia.SQL.Clear;
              conexaoBD.SQL_Cirurgia.SQL.Add('delete from Cirurgia'+
              ' where cirurgia_codigo = "'+Cons02.Cirurgia2.cirurgia_codigo.Text+'"');
              conexaoBD.SQL_Cirurgia.ExecSQL;

              Limpa_Cirurgia();

              conexaoBD.SQL_Cirurgia.Close;
              conexaoBD.SQL_Cirurgia.SQL.Clear;
              conexaoBD.SQL_Cirurgia.SQL.Add('select * from Cirurgia');
              conexaoBD.SQL_Cirurgia.Open;
              Cons02.Cirurgia2.GRD_Cirurgia.Refresh;
              Cursor_Normal();
           end;
        end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'adicionais' then
        begin
        if Cons02.Adicionais2.adicional_codigo.Text <> '' then
           begin
           if Confirma('Apagar este Adicional?') = 6 Then
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Adicionais.Close;
              conexaoBD.SQL_Adicionais.SQL.Clear;
              conexaoBD.SQL_Adicionais.SQL.Add('delete from Adicionais'+
              ' where adicional_codigo = "'+Cons02.Adicionais2.adicional_codigo.Text+'"');
              conexaoBD.SQL_Adicionais.ExecSQL;

              Limpa_Adicionais();

              conexaoBD.SQL_Adicionais.Close;
              conexaoBD.SQL_Adicionais.SQL.Clear;
              conexaoBD.SQL_Adicionais.SQL.Add('select * from Adicionais');
              conexaoBD.SQL_Adicionais.Open;
              Cons02.Adicionais2.GRD_Adicional.Refresh;
              Cursor_Normal();
           end;
        end;
     end;
end;

procedure Registro_Apagar_AG();

Var
   Data_Str, Hora_Str: String;
   Hora_Int, Minuto_Int: Integer;

begin
     Cursor_Ampulheta();

     if Agenda.horario_hora.Text <> '  :  ' then
        begin

        Prepara_Hora();
        Data_Str   := DateToStr(Agenda.Calendario.Date);
        Data_Str   := Inverte_Data(Data_Str);

        Hora_Str   := Agenda.horario_hora.Text;

        Hora_Int   := StrToInt( Hora_Str[1] + Hora_Str[2] );
        Minuto_Int := StrToInt( Hora_Str[4] + Hora_Str[5] );

        if (Hora_Int >= 7) and (Hora_Int <= 20) then
           begin

           if (Hora_Int = 20) and (Minuto_Int = 30) then
              begin
              conexaoBD.SQL_Agenda.Close;
              conexaoBD.SQL_Agenda.SQL.Clear;
              conexaoBD.SQL_Agenda.SQL.Add('delete from Agenda'+
              ' where Agenda_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Agenda_data = #'+Data_Str+'# And Agenda_hora = "'+Hora_Str+'"');
              conexaoBD.SQL_Agenda.ExecSQL;
              end
           else if (Minuto_Int = 0) or (Minuto_Int = 30) then
              begin
              conexaoBD.SQL_Agenda.Close;
              conexaoBD.SQL_Agenda.SQL.Clear;
              conexaoBD.SQL_Agenda.SQL.Add('update Agenda '+
              'Set Agenda_ficha = 0,'+
              'Agenda_descricao = "",'+
              'Agenda_tipo = "",'+
              'Agenda_tipo_cirurgia = "",'+
              'Agenda_status = "",'+
              'Agenda_convenio = 0,'+
              'Agenda_descricao_convenio = "",'+
              'Agenda_observacao = "",'+
              'Agenda_pago = "",'+
              'Agenda_identifica_adicional = "" where Agenda_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Agenda_data = #'+Data_Str+'# And Agenda_hora = "'+Hora_Str+'"');
              conexaoBD.SQL_Agenda.ExecSQL;
              end
           else
              begin
              conexaoBD.SQL_Agenda.Close;
              conexaoBD.SQL_Agenda.SQL.Clear;
              conexaoBD.SQL_Agenda.SQL.Add('delete from Agenda'+
              ' where Agenda_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Agenda_data = #'+Data_Str+'# And Agenda_hora = "'+Hora_Str+'"');
              conexaoBD.SQL_Agenda.ExecSQL;
           end;
           end
        else
           begin
           conexaoBD.SQL_Agenda.Close;
           conexaoBD.SQL_Agenda.SQL.Clear;
           conexaoBD.SQL_Agenda.SQL.Add('delete from Agenda'+
           ' where Agenda_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Agenda_data = #'+Data_Str+'# And Agenda_hora = "'+Hora_Str+'"');
           conexaoBD.SQL_Agenda.ExecSQL;
        end;

        conexaoBD.SQL_Comunitario_Aux.Close;
        conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
        conexaoBD.SQL_Comunitario_Aux.SQL.Add('delete from Adicionais_Lista where Adicional_lista_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And Adicional_lista_data = #'+Data_Str+'# And Adicional_lista_hora = "'+Hora_Str+'"');
        conexaoBD.SQL_Comunitario_Aux.ExecSQL;

        Prepara_Agenda();
     end;

     Limpa_Agenda();
     Carrega_Lista_Convenio_AG();

     Cursor_Normal();
end;

procedure Registro_Gravar();

var
   Comando_SQL: String;
   Paciente_Existe: Boolean;

begin
     if Sequencia_Tela[Tela_Ativa] = 'paciente' then
        begin
        //if Trim(Cons02.Paciente1.paciente_nome_alterado.Text) <> '' Then
        //   Cons02.Paciente1.paciente_ficha.Text := '';

        if Cons02.Paciente1.paciente_ficha.Text = '' then
           begin
           if Valida_Paciente() = True then
              begin
              Cursor_Ampulheta();
              Carrega_Paciente();

              P_Nro_Ficha := Obtem_Numero_Ficha();

              //*** Verifica Se o Paciente Não Exite ***

              Paciente_Existe := False;
              Comando_SQL := 'Select * from Paciente Where Paciente_nome_sobrenome = '+#39+Trim(Cons02.Paciente1.paciente_nome.Text)+' '+Trim(Cons02.Paciente1.paciente_sobrenome.Text)+#39;

              conexaoBD.SQL_Paciente.Close;
              conexaoBD.SQL_Paciente.SQL.Clear;
              conexaoBD.SQL_Paciente.SQL.Add(Comando_SQL);
              conexaoBD.SQL_Paciente.Open;

              If conexaoBD.SQL_Paciente.RecordCount > 0 Then
                 Begin
                 If Confirma('Esta Paciente Já Existe, Incluir assim mesmo') = 6 Then
                    Begin
                    Paciente_Existe := False;
                    End
                 Else
                    Begin
                    Paciente_Existe := True;
                 End;
              End;

              {*** Prepara Comando SQL ***}

              If Not Paciente_Existe Then
                 Begin
                 Comando_SQL := 'insert into Paciente(';
                 Comando_SQL := Comando_SQL + 'Paciente_ficha,';
                 Comando_SQL := Comando_SQL + 'Paciente_nome,';
                 Comando_SQL := Comando_SQL + 'Paciente_sobrenome,';
                 Comando_SQL := Comando_SQL + 'Paciente_rg,';
                 Comando_SQL := Comando_SQL + 'Paciente_cpf,';
                 Comando_SQL := Comando_SQL + 'Paciente_dt_cadastro,';
                 Comando_SQL := Comando_SQL + 'Paciente_dt_nascimento,';
                 Comando_SQL := Comando_SQL + 'Paciente_indicacao,';
                 Comando_SQL := Comando_SQL + 'Paciente_sexo,';
                 Comando_SQL := Comando_SQL + 'Paciente_situacao,';
                 Comando_SQL := Comando_SQL + 'Paciente_convenio,';
                 Comando_SQL := Comando_SQL + 'Paciente_matricula,';
                 Comando_SQL := Comando_SQL + 'Paciente_titular,';
                 Comando_SQL := Comando_SQL + 'Paciente_dt_ult_consulta,';
                 Comando_SQL := Comando_SQL + 'Paciente_endereco,';
                 Comando_SQL := Comando_SQL + 'Paciente_logradouro,';
                 Comando_SQL := Comando_SQL + 'Paciente_complemento,';
                 Comando_SQL := Comando_SQL + 'Paciente_bairro,';
                 Comando_SQL := Comando_SQL + 'Paciente_cidade,';
                 Comando_SQL := Comando_SQL + 'Paciente_cep,';
                 Comando_SQL := Comando_SQL + 'Paciente_uf,';
                 Comando_SQL := Comando_SQL + 'Paciente_instrucao,';
                 Comando_SQL := Comando_SQL + 'Paciente_estado_civil,';
                 Comando_SQL := Comando_SQL + 'Paciente_naturalidade,';
                 Comando_SQL := Comando_SQL + 'Paciente_profissao,';
                 Comando_SQL := Comando_SQL + 'Paciente_email,';
                 Comando_SQL := Comando_SQL + 'Paciente_fone_residencial,';
                 Comando_SQL := Comando_SQL + 'Paciente_fone_comercial,';
                 Comando_SQL := Comando_SQL + 'Paciente_fone_fax,';
                 Comando_SQL := Comando_SQL + 'Paciente_fone_celular,';
                 Comando_SQL := Comando_SQL + 'Paciente_nome_sobrenome,';
                 Comando_SQL := Comando_SQL + 'Paciente_observacao,';
                 Comando_SQL := Comando_SQL + 'Paciente_prontuario,';
                 Comando_SQL := Comando_SQL + 'Paciente_caracteres) ';
                 Comando_SQL := Comando_SQL + 'values("'+Trim(P_Nro_Ficha)+'",';
                 Comando_SQL := Comando_SQL + '"'+Trim(Cons02.Paciente1.paciente_nome.Text)+'",';
                 Comando_SQL := Comando_SQL + '"'+Trim(Cons02.Paciente1.paciente_sobrenome.Text)+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_rg.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_cpf.Text+'",';
              
                 if Trim(Cons02.Paciente1.paciente_dt_cadastro.Text) <> '/  /' Then
                    begin
                    Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_dt_cadastro.Text+'",';
                    end
                 else
                    begin
                    Comando_SQL := Comando_SQL + 'Null,';
                 end;
              
                 if Trim(Cons02.Paciente1.paciente_dt_nascimento.Text) <> '/  /' Then
                    begin
                    Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_dt_nascimento.Text+'",';
                    end
                 else
                    begin
                    Comando_SQL := Comando_SQL + 'Null,';
                 end;
              
                 Comando_SQL := Comando_SQL + P_Indicacao_Numero+',';
                 Comando_SQL := Comando_SQL + '"'+P_Sexo+'",';
                 Comando_SQL := Comando_SQL + '"'+P_Situacao+'",';
                 Comando_SQL := Comando_SQL + P_Convenio+',';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_matricula.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_titular.Text+'",';

                 if Trim(P_dt_ult_consulta) <> '/  /' Then
                    begin
                    Comando_SQL := Comando_SQL + '"'+P_dt_ult_consulta+'",';
                    end
                 else
                    begin
                    Comando_SQL := Comando_SQL + 'Null,';
                 end;
              
                 Comando_SQL := Comando_SQL + '"'+P_Endereco+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_logradouro.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_complemento.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_bairro.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_cidade.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_cep.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+UpperCase(Cons02.Paciente1.paciente_uf.Text)+'",';
                 Comando_SQL := Comando_SQL + '"'+P_Instrucao+'",';
                 Comando_SQL := Comando_SQL + '"'+P_Estado_Civil+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_naturalidade.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_profissao.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_email.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_fone_residencial.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_fone_comercial.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_fone_fax.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_fone_celular.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+Trim(Cons02.Paciente1.paciente_nome.Text)+' '+Trim(Cons02.Paciente1.paciente_sobrenome.Text)+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_observacao.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+Cons02.Paciente1.paciente_prontuario.Text+'",';
                 Comando_SQL := Comando_SQL + '"'+IntToStr(strLen(PChar(P_Nro_Ficha)))+'")';
              
                 {*** Executa Comando SQL ***}

                 conexaoBD.SQL_Paciente.Close;
                 conexaoBD.SQL_Paciente.SQL.Clear;
                 conexaoBD.SQL_Paciente.SQL.Add(Comando_SQL);
                 conexaoBD.SQL_Paciente.ExecSQL;
              
                 Paciente_Ficha_Alterado := '';
                 Paciente_Ficha_Alterado := P_Nro_Ficha;
                 Carrega_Campos_Alterados();
              End;

              Limpa_Paciente();
              Carrega_Lista_Pacientes();

              Descarrega_Campos_Alterados();

              Cursor_Normal();
           end;
           end
        else
           begin
           if Valida_Paciente() = True then
              begin
              Cursor_Ampulheta();
              Carrega_Paciente();

              {*** Guarda as Informações Alteradas ***}

              Paciente_Ficha_Alterado := Cons02.Paciente1.paciente_ficha.Text;
              Carrega_Campos_Alterados();

              {*** Prepara Comando SQL ***}

              Comando_SQL := 'update Paciente ';
              Comando_SQL := Comando_SQL + 'Set Paciente_nome         = "'+Trim(Cons02.Paciente1.paciente_nome.Text)+'",';
              Comando_SQL := Comando_SQL + 'Paciente_sobrenome        = "'+Trim(Cons02.Paciente1.paciente_sobrenome.Text)+'",';
              Comando_SQL := Comando_SQL + 'Paciente_rg               = "'+Cons02.Paciente1.paciente_rg.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_cpf              = "'+Cons02.Paciente1.paciente_cpf.Text+'",';

              if Trim(Cons02.Paciente1.paciente_dt_cadastro.Text) <> '/  /' Then
                 begin
                 Comando_SQL := Comando_SQL + 'Paciente_dt_cadastro = "'+Cons02.Paciente1.paciente_dt_cadastro.Text+'",';
                 end
              else
                 begin
                 Comando_SQL := Comando_SQL + 'Paciente_dt_cadastro = Null,';
              end;

              if Trim(Cons02.Paciente1.paciente_dt_nascimento.Text) <> '/  /' Then
                 begin
                 Comando_SQL := Comando_SQL + 'Paciente_dt_nascimento = "'+Cons02.Paciente1.paciente_dt_nascimento.Text+'",';
                 end
              else
                 begin
                 Comando_SQL := Comando_SQL + 'Paciente_dt_nascimento = Null,';
              end;

              Comando_SQL := Comando_SQL + 'Paciente_indicacao        = '+P_Indicacao_Numero+',';
              Comando_SQL := Comando_SQL + 'Paciente_sexo             = "'+P_Sexo+'",';
              Comando_SQL := Comando_SQL + 'Paciente_situacao         = "'+P_Situacao+'",';
              Comando_SQL := Comando_SQL + 'Paciente_convenio         = '+P_Convenio+',';
              Comando_SQL := Comando_SQL + 'Paciente_matricula        = "'+Cons02.Paciente1.paciente_matricula.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_titular          = "'+Cons02.Paciente1.paciente_titular.Text+'",';

              if Trim(P_dt_ult_consulta) <> '/  /' Then
                 begin
                 Comando_SQL := Comando_SQL + 'Paciente_dt_ult_consulta  = "'+P_dt_ult_consulta+'",';
                 end
              else
                 begin
                 Comando_SQL := Comando_SQL + 'Paciente_dt_ult_consulta  = Null,';
              end;

              Comando_SQL := Comando_SQL + 'Paciente_endereco         = "'+P_Endereco+'",';
              Comando_SQL := Comando_SQL + 'Paciente_logradouro       = "'+Cons02.Paciente1.paciente_logradouro.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_complemento      = "'+Cons02.Paciente1.paciente_complemento.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_bairro           = "'+Cons02.Paciente1.paciente_bairro.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_cidade           = "'+Cons02.Paciente1.paciente_cidade.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_cep              = "'+Cons02.Paciente1.paciente_cep.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_uf               = "'+UpperCase(Cons02.Paciente1.paciente_uf.Text)+'",';
              Comando_SQL := Comando_SQL + 'Paciente_instrucao        = "'+P_Instrucao+'",';
              Comando_SQL := Comando_SQL + 'Paciente_estado_civil     = "'+P_Estado_Civil+'",';
              Comando_SQL := Comando_SQL + 'Paciente_naturalidade     = "'+Cons02.Paciente1.paciente_naturalidade.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_profissao        = "'+Cons02.Paciente1.paciente_profissao.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_email            = "'+Cons02.Paciente1.paciente_email.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_fone_residencial = "'+Cons02.Paciente1.paciente_fone_residencial.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_fone_comercial   = "'+Cons02.Paciente1.paciente_fone_comercial.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_fone_fax         = "'+Cons02.Paciente1.paciente_fone_fax.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_fone_celular     = "'+Cons02.Paciente1.paciente_fone_celular.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_nome_sobrenome   = "'+Trim(Cons02.Paciente1.paciente_nome.Text)+' '+Trim(Cons02.Paciente1.paciente_sobrenome.Text)+'",';
              Comando_SQL := Comando_SQL + 'Paciente_prontuario       = "'+Cons02.Paciente1.paciente_prontuario.Text+'",';
              Comando_SQL := Comando_SQL + 'Paciente_observacao       = "'+Cons02.Paciente1.paciente_observacao.Text+'" where Paciente_ficha = "'+Cons02.Paciente1.paciente_ficha.Text+'"';

              {*** Executa Comando SQL ***}

              conexaoBD.SQL_Paciente.Close;
              conexaoBD.SQL_Paciente.SQL.Clear;
              conexaoBD.SQL_Paciente.SQL.Add(Comando_SQL);
              conexaoBD.SQL_Paciente.ExecSQL;

              conexaoBD.SQL_Paciente_Lista.Close;
              conexaoBD.SQL_Paciente_Lista.SQL.Clear;
              conexaoBD.SQL_Paciente_Lista.SQL.Add('select * from paciente where Paciente_ficha = "'+Paciente_Ficha_Alterado+'"');
              conexaoBD.SQL_Paciente_Lista.Open;

              Limpa_Paciente();
              Carrega_Lista_Pacientes();
              Descarrega_Campos_Alterados();

              Cursor_Normal();
           end;
        end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'preferencia' then
        begin
           if Valida_Preferencia() = True then
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Usuario.Close;
              conexaoBD.SQL_Usuario.SQL.Clear;
              conexaoBD.SQL_Usuario.SQL.Add('select * from Usuario where usuario_nome = "'+
              UpperCase(Cons02.Preferencia1.usuario_nome.Text)+'"');
              conexaoBD.SQL_Usuario.Open;
              Cursor_Normal();

              if conexaoBD.SQL_Usuario.RecordCount > 0 then
                 begin
                 Cursor_Ampulheta();
                 Carrega_Preferencia();
                 conexaoBD.SQL_Usuario.Close;
                 conexaoBD.SQL_Usuario.SQL.Clear;
                 conexaoBD.SQL_Usuario.SQL.Add('update Usuario '+
                 'set Usuario_nome = "'+Cons02.Preferencia1.usuario_nome.Text+'",'+
                 'Usuario_senha = "'+Cons02.Preferencia1.usuario_senha.Text+'",'+
                 'Usuario_acesso_agenda = "'+U_acesso_agenda+'",'+
                 'Usuario_acesso_paciente = "'+U_acesso_paciente+'",'+
                 'Usuario_acesso_paciente_prontuario = "'+U_acesso_prontuario+'",'+
                 'Usuario_acesso_paciente_observacoes = "'+U_acesso_observacoes+'",'+
                 'Usuario_acesso_convenio = "'+U_acesso_convenio+'",'+
                 'Usuario_acesso_indicacao = "'+U_acesso_indicacao+'",'+
                 'Usuario_acesso_cid = "'+U_acesso_cid+'",'+
                 'Usuario_acesso_imp_env = "'+U_acesso_imp_env+'",'+
                 'Usuario_acesso_imp_ficha = "'+U_acesso_imp_ficha+'",'+
                 'Usuario_acesso_imp_fat = "'+U_acesso_imp_fat+'",'+
                 'Usuario_acesso_imp_rec = "'+U_acesso_imp_rec+'",'+
                 'Usuario_acesso_usuario = "'+U_acesso_usuario+'",'+
                 'Usuario_acesso_medico = "'+U_acesso_medico+'",'+
                 'Usuario_acesso_cirurgia = "'+U_acesso_cirurgia+'",'+
                 'Usuario_acesso_adicionais = "'+U_acesso_adicionais+'" '+
                 'where Usuario_nome = "'+Cons02.Preferencia1.usuario_nome.Text+'"');
                 conexaoBD.SQL_Usuario.ExecSQL;

                 Limpa_Preferencia();
                 Cursor_Normal();
                 end
              else
                 begin
                 Cursor_Ampulheta();
                 Carrega_Preferencia();
                 conexaoBD.SQL_Usuario.Close;
                 conexaoBD.SQL_Usuario.SQL.Clear;
                 conexaoBD.SQL_Usuario.SQL.Add('insert into Usuario('+
                 'Usuario_nome,'+
                 'Usuario_senha,'+
                 'Usuario_acesso_agenda,'+
                 'Usuario_acesso_paciente,'+
                 'Usuario_acesso_paciente_prontuario,'+
                 'Usuario_acesso_paciente_observacoes,'+
                 'Usuario_acesso_convenio,'+
                 'Usuario_acesso_indicacao,'+
                 'Usuario_acesso_cid,'+
                 'Usuario_acesso_imp_env,'+
                 'Usuario_acesso_imp_ficha,'+
                 'Usuario_acesso_imp_fat,'+
                 'Usuario_acesso_imp_rec,'+
                 'Usuario_acesso_usuario,'+
                 'Usuario_acesso_medico,'+
                 'Usuario_acesso_cirurgia,'+
                 'Usuario_acesso_adicionais) '+
                 'values("'+Cons02.Preferencia1.usuario_nome.Text+'",'+
                 '"'+Cons02.Preferencia1.usuario_senha.Text+'",'+
                 '"'+U_acesso_agenda+'",'+
                 '"'+U_acesso_paciente+'",'+
                 '"'+U_acesso_prontuario+'",'+
                 '"'+U_acesso_observacoes+'",'+
                 '"'+U_acesso_convenio+'",'+
                 '"'+U_acesso_indicacao+'",'+
                 '"'+U_acesso_cid+'",'+
                 '"'+U_acesso_imp_env+'",'+
                 '"'+U_acesso_imp_ficha+'",'+
                 '"'+U_acesso_imp_fat+'",'+
                 '"'+U_acesso_imp_rec+'",'+
                 '"'+U_acesso_usuario+'",'+
                 '"'+U_acesso_medico+'",'+
                 '"'+U_acesso_cirurgia+'",'+
                 '"'+U_acesso_adicionais+'")');
                 conexaoBD.SQL_Usuario.ExecSQL;

                 Limpa_Preferencia();
                 Cursor_Normal();
              end;

              Cursor_Ampulheta();
              conexaoBD.SQL_Usuario.Close;
              conexaoBD.SQL_Usuario.SQL.Clear;
              conexaoBD.SQL_Usuario.SQL.Add('select * from Usuario');
              conexaoBD.SQL_Usuario.Open;
              Cons02.Preferencia1.DBGrid1.Refresh;
              Cursor_Normal();

           end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'convenio' then
        begin
        if Cons02.convenio1.convenio_numero.Text = '' then
           begin
           if Valida_Convenio() = True then
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Convenio.Close;
              conexaoBD.SQL_Convenio.SQL.Clear;
              conexaoBD.SQL_Convenio.SQL.Add('select * from Convenio where convenio_apelido = "'+
              Cons02.convenio1.convenio_apelido.Text+'" order by convenio_apelido');
              conexaoBD.SQL_Convenio.Open;
              Cursor_Normal();

              if conexaoBD.SQL_Convenio.RecordCount > 0 then
                 begin
                 MSG_Erro('Este Apelido já existe');
                 end
              else
                 begin
                 Cursor_Ampulheta();
                 conexaoBD.SQL_Convenio.Close;
                 conexaoBD.SQL_Convenio.SQL.Clear;
                 conexaoBD.SQL_Convenio.SQL.Add('insert into Convenio'+
                 '(Convenio_razao_social,'+
                 'Convenio_nome_fantasia,'+
                 'Convenio_apelido,'+
                 'Convenio_endereco,'+
                 'Convenio_complemento,'+
                 'Convenio_bairro,'+
                 'Convenio_cidade,'+
                 'Convenio_cep,'+
                 'Convenio_uf,'+
                 'Convenio_fone_1,'+
                 'Convenio_fone_2,'+
                 'Convenio_fax,'+
                 'Convenio_setor_resp,'+
                 'Convenio_qtde_ch,'+
                 'Convenio_valor_ch,'+
                 'Convenio_valor_consulta,'+
                 'Convenio_valor_cirurgia) '+
                 'values("'+Cons02.convenio1.convenio_razao_social.Text+'",'+
                 '"'+Cons02.convenio1.convenio_nome_fantasia.Text+'",'+
                 '"'+Cons02.convenio1.convenio_apelido.Text+'",'+
                 '"'+Cons02.convenio1.convenio_endereco.Text+'",'+
                 '"'+Cons02.convenio1.convenio_complemento.Text+'",'+
                 '"'+Cons02.convenio1.convenio_bairro.Text+'",'+
                 '"'+Cons02.convenio1.convenio_cidade.Text+'",'+
                 '"'+Cons02.convenio1.convenio_cep.Text+'",'+
                 '"'+Cons02.convenio1.convenio_uf.Text+'",'+
                 '"'+Cons02.convenio1.convenio_fone_1.Text+'",'+
                 '"'+Cons02.convenio1.convenio_fone_2.Text+'",'+
                 '"'+Cons02.convenio1.convenio_fax.Text+'",'+
                 '"'+Cons02.convenio1.convenio_setor_resp.Text+'",'+
                 '"'+Cons02.convenio1.convenio_qtde_ch.Text+'",'+
                 '"'+Cons02.convenio1.convenio_valor_ch.Text+'",'+
                 '"'+Cons02.convenio1.convenio_valor_consulta.Text+'",'+
                 '"'+Cons02.convenio1.convenio_valor_cirurgia.Text+'")');
                 conexaoBD.SQL_Convenio.ExecSQL;
                 Limpa_Convenio();
                 Cursor_Normal();
              end;

              Cursor_Ampulheta();
              conexaoBD.SQL_Convenio.Close;
              conexaoBD.SQL_Convenio.SQL.Clear;
              conexaoBD.SQL_Convenio.SQL.Add('select * from Convenio');
              conexaoBD.SQL_Convenio.Open;
              Cons02.convenio1.GRD_Convenios.Refresh;
              Cursor_Normal();
           end;
           end
        else
           begin
           if Valida_Convenio() = True then
             begin
             if Cons02.convenio1.convenio_apelido.Text = Cons02.convenio1.DB_convenio_apelido.Text then
                begin
                Cursor_Ampulheta();
                conexaoBD.SQL_Convenio.Close;
                conexaoBD.SQL_Convenio.SQL.Clear;
                conexaoBD.SQL_Convenio.SQL.Add('update Convenio '+
                'set Convenio_razao_social = "'+Cons02.convenio1.convenio_razao_social.Text+'",'+
                'Convenio_nome_fantasia    = "'+Cons02.convenio1.convenio_nome_fantasia.Text+'",'+
                'Convenio_apelido          = "'+Cons02.convenio1.convenio_apelido.Text+'",'+
                'Convenio_endereco         = "'+Cons02.convenio1.convenio_endereco.Text+'",'+
                'Convenio_complemento      = "'+Cons02.convenio1.convenio_complemento.Text+'",'+
                'Convenio_bairro           = "'+Cons02.convenio1.convenio_bairro.Text+'",'+
                'Convenio_cidade           = "'+Cons02.convenio1.convenio_cidade.Text+'",'+
                'Convenio_cep              = "'+Cons02.convenio1.convenio_cep.Text+'",'+
                'Convenio_uf               = "'+Cons02.convenio1.convenio_uf.Text+'",'+
                'Convenio_fone_1           = "'+Cons02.convenio1.convenio_fone_1.Text+'",'+
                'Convenio_fone_2           = "'+Cons02.convenio1.convenio_fone_2.Text+'",'+
                'Convenio_fax              = "'+Cons02.convenio1.convenio_fax.Text+'",'+
                'Convenio_setor_resp       = "'+Cons02.convenio1.convenio_setor_resp.Text+'",'+
                'Convenio_qtde_ch          = "'+Cons02.convenio1.convenio_qtde_ch.Text+'",'+
                'Convenio_valor_ch         = "'+Cons02.convenio1.convenio_valor_ch.Text+'",'+
                'Convenio_valor_consulta   = "'+Cons02.convenio1.convenio_valor_consulta.Text+'",'+
                'Convenio_valor_cirurgia   = "'+Cons02.convenio1.convenio_valor_cirurgia.Text+'" '+
                'where Convenio_numero = '+Cons02.convenio1.convenio_numero.Text);
                conexaoBD.SQL_Convenio.ExecSQL;
                Limpa_Convenio();
                Cursor_Normal();
                end
             else
                begin
                Cursor_Ampulheta();
                conexaoBD.SQL_Convenio.Close;
                conexaoBD.SQL_Convenio.SQL.Clear;
                conexaoBD.SQL_Convenio.SQL.Add('select * from Convenio where convenio_apelido = "'+
                Cons02.convenio1.convenio_apelido.Text+'" order by convenio_apelido');
                conexaoBD.SQL_Convenio.Open;
                Cursor_Normal();

                if conexaoBD.SQL_Convenio.RecordCount > 0 then
                   begin
                   MSG_Erro('Este Apelido já existe');
                   end
                else
                   begin
                   Cursor_Ampulheta();
                   conexaoBD.SQL_Convenio.Close;
                   conexaoBD.SQL_Convenio.SQL.Clear;
                   conexaoBD.SQL_Convenio.SQL.Add('update Convenio '+
                   'set Convenio_razao_social = "'+Cons02.convenio1.convenio_razao_social.Text+'",'+
                   'Convenio_nome_fantasia    = "'+Cons02.convenio1.convenio_nome_fantasia.Text+'",'+
                   'Convenio_apelido          = "'+Cons02.convenio1.convenio_apelido.Text+'",'+
                   'Convenio_endereco         = "'+Cons02.convenio1.convenio_endereco.Text+'",'+
                   'Convenio_complemento      = "'+Cons02.convenio1.convenio_complemento.Text+'",'+
                   'Convenio_bairro           = "'+Cons02.convenio1.convenio_bairro.Text+'",'+
                   'Convenio_cidade           = "'+Cons02.convenio1.convenio_cidade.Text+'",'+
                   'Convenio_cep              = "'+Cons02.convenio1.convenio_cep.Text+'",'+
                   'Convenio_uf               = "'+Cons02.convenio1.convenio_uf.Text+'",'+
                   'Convenio_fone_1           = "'+Cons02.convenio1.convenio_fone_1.Text+'",'+
                   'Convenio_fone_2           = "'+Cons02.convenio1.convenio_fone_2.Text+'",'+
                   'Convenio_fax              = "'+Cons02.convenio1.convenio_fax.Text+'",'+
                   'Convenio_setor_resp       = "'+Cons02.convenio1.convenio_setor_resp.Text+'",'+
                   'Convenio_qtde_ch          = "'+Cons02.convenio1.convenio_qtde_ch.Text+'",'+
                   'Convenio_valor_ch         = "'+Cons02.convenio1.convenio_valor_ch.Text+'",'+
                   'Convenio_valor_consulta   = "'+Cons02.convenio1.convenio_valor_consulta.Text+'",'+
                   'Convenio_valor_cirurgia   = "'+Cons02.convenio1.convenio_valor_cirurgia.Text+'" '+
                   'where Convenio_numero = '+Cons02.convenio1.convenio_numero.Text);
                   conexaoBD.SQL_Convenio.ExecSQL;
                   Limpa_Convenio();
                   Cursor_Normal();
                end;
             end;

             Cursor_Ampulheta();
             conexaoBD.SQL_Convenio.Close;
             conexaoBD.SQL_Convenio.SQL.Clear;
             conexaoBD.SQL_Convenio.SQL.Add('select * from Convenio');
             conexaoBD.SQL_Convenio.Open;
             Cons02.convenio1.GRD_Convenios.Refresh;
             Cursor_Normal();

           end;
        end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'indicacao' then
        begin
        if Cons02.Indicacao1.indicacao_numero.Text = '' then
           begin
           if Valida_Indicacao() = True then
             begin
             Cursor_Ampulheta();
             conexaoBD.SQL_Indicacao.Close;
             conexaoBD.SQL_Indicacao.SQL.Clear;
             conexaoBD.SQL_Indicacao.SQL.Add('select * from Indicacao where indicacao_nome = "'+
             Cons02.Indicacao1.indicacao_nome.Text+'" order by indicacao_nome');
             conexaoBD.SQL_Indicacao.Open;
             Cursor_Normal();

             if conexaoBD.SQL_Indicacao.RecordCount > 0 then
                begin
                MSG_Erro('Esta Indicação já existe');
                end
             else
                begin
                Cursor_Ampulheta();
                conexaoBD.SQL_Indicacao.Close;
                conexaoBD.SQL_Indicacao.SQL.Clear;
                conexaoBD.SQL_Indicacao.SQL.Add('insert into Indicacao'+
                '(Indicacao_nome,'+
                'Indicacao_endereco,'+
                'Indicacao_complemento,'+
                'Indicacao_bairro,'+
                'Indicacao_cidade,'+
                'Indicacao_cep,'+
                'Indicacao_uf,'+
                'Indicacao_fone,'+
                'Indicacao_celular,'+
                'Indicacao_fax,'+
                'Indicacao_email) '+
                'values("'+Cons02.Indicacao1.indicacao_nome.Text+'",'+
                '"'+Cons02.Indicacao1.indicacao_endereco.Text+'",'+
                '"'+Cons02.Indicacao1.indicacao_complemento.Text+'",'+
                '"'+Cons02.Indicacao1.indicacao_bairro.Text+'",'+
                '"'+Cons02.Indicacao1.indicacao_cidade.Text+'",'+
                '"'+Cons02.Indicacao1.indicacao_cep.Text+'",'+
                '"'+Cons02.Indicacao1.indicacao_uf.Text+'",'+
                '"'+Cons02.Indicacao1.indicacao_fone.Text+'",'+
                '"'+Cons02.Indicacao1.indicacao_celular.Text+'",'+
                '"'+Cons02.Indicacao1.indicacao_fax.Text+'",'+
                '"'+Cons02.Indicacao1.indicacao_email.Text+'")');
                conexaoBD.SQL_Indicacao.ExecSQL;
                Limpa_Medico();
                Cursor_Normal();
             end;

             Cursor_Ampulheta();
             conexaoBD.SQL_Indicacao.Close;
             conexaoBD.SQL_Indicacao.SQL.Clear;
             conexaoBD.SQL_Indicacao.SQL.Add('select * from Indicacao');
             conexaoBD.SQL_Indicacao.Open;
             Cons02.Indicacao1.GRD_Indicacao.Refresh;
             Cursor_Normal();

           end;
           end
        else
           begin
           if Valida_Indicacao() = True then
             begin
             if Cons02.Indicacao1.indicacao_nome.Text = Cons02.Indicacao1.DB_indicacao_nome.Text then
                begin
                Cursor_Ampulheta();
                conexaoBD.SQL_Indicacao.Close;
                conexaoBD.SQL_Indicacao.SQL.Clear;
                conexaoBD.SQL_Indicacao.SQL.Add('update Indicacao '+
                'set Indicacao_nome     = "'+Cons02.Indicacao1.indicacao_nome.Text+'",'+
                'Indicacao_endereco     = "'+Cons02.Indicacao1.indicacao_endereco.Text+'",'+
                'Indicacao_complemento  = "'+Cons02.Indicacao1.indicacao_complemento.Text+'",'+
                'Indicacao_bairro       = "'+Cons02.Indicacao1.indicacao_bairro.Text+'",'+
                'Indicacao_cidade       = "'+Cons02.Indicacao1.indicacao_cidade.Text+'",'+
                'Indicacao_cep          = "'+Cons02.Indicacao1.indicacao_cep.Text+'",'+
                'Indicacao_uf           = "'+Cons02.Indicacao1.indicacao_uf.Text+'",'+
                'Indicacao_fone         = "'+Cons02.Indicacao1.indicacao_fone.Text+'",'+
                'Indicacao_celular      = "'+Cons02.Indicacao1.indicacao_celular.Text+'",'+
                'Indicacao_fax          = "'+Cons02.Indicacao1.indicacao_fax.Text+'",'+
                'Indicacao_email        = "'+Cons02.Indicacao1.indicacao_email.Text+'" '+
                'where Indicacao_numero = '+Cons02.Indicacao1.indicacao_numero.Text);
                conexaoBD.SQL_Indicacao.ExecSQL;
                Limpa_Indicacao();
                Cursor_Normal();
                end
             else
                begin
                Cursor_Ampulheta();
                conexaoBD.SQL_Indicacao.Close;
                conexaoBD.SQL_Indicacao.SQL.Clear;
                conexaoBD.SQL_Indicacao.SQL.Add('select * from Indicacao where indicacao_nome = "'+
                Cons02.Indicacao1.indicacao_nome.Text+'" order by indicacao_nome');
                conexaoBD.SQL_Indicacao.Open;
                Cursor_Normal();

                if conexaoBD.SQL_Indicacao.RecordCount > 0 then
                   begin
                   MSG_Erro('Esta Indicação já existe');
                   end
                else
                   begin
                   Cursor_Ampulheta();
                   conexaoBD.SQL_Indicacao.Close;
                   conexaoBD.SQL_Indicacao.SQL.Clear;
                   conexaoBD.SQL_Indicacao.SQL.Add('update Indicacao '+
                   'set Indicacao_nome     = "'+Cons02.Indicacao1.indicacao_nome.Text+'",'+
                   'Indicacao_endereco     = "'+Cons02.Indicacao1.indicacao_endereco.Text+'",'+
                   'Indicacao_complemento  = "'+Cons02.Indicacao1.indicacao_complemento.Text+'",'+
                   'Indicacao_bairro       = "'+Cons02.Indicacao1.indicacao_bairro.Text+'",'+
                   'Indicacao_cidade       = "'+Cons02.Indicacao1.indicacao_cidade.Text+'",'+
                   'Indicacao_cep          = "'+Cons02.Indicacao1.indicacao_cep.Text+'",'+
                   'Indicacao_uf           = "'+Cons02.Indicacao1.indicacao_uf.Text+'",'+
                   'Indicacao_fone         = "'+Cons02.Indicacao1.indicacao_fone.Text+'",'+
                   'Indicacao_celular      = "'+Cons02.Indicacao1.indicacao_celular.Text+'",'+
                   'Indicacao_fax          = "'+Cons02.Indicacao1.indicacao_fax.Text+'",'+
                   'Indicacao_email        = "'+Cons02.Indicacao1.indicacao_email.Text+'" '+
                   'where Indicacao_numero = '+Cons02.Indicacao1.indicacao_numero.Text);
                   conexaoBD.SQL_Indicacao.ExecSQL;
                   Limpa_Indicacao();
                   Cursor_Normal();
                end;
             end;

             Cursor_Ampulheta();
             conexaoBD.SQL_Indicacao.Close;
             conexaoBD.SQL_Indicacao.SQL.Clear;
             conexaoBD.SQL_Indicacao.SQL.Add('select * from Indicacao');
             conexaoBD.SQL_Indicacao.Open;
             Cons02.Indicacao1.GRD_Indicacao.Refresh;
             Cursor_Normal();

           end;
        end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'medico' then
        begin
        if Valida_Medico() = True then
           begin
           if Cons02.Medico1.medico_crm.Text = Cons02.Medico1.DB_Medico_Crm.Text then
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Medico.Close;
              conexaoBD.SQL_Medico.SQL.Clear;
              conexaoBD.SQL_Medico.SQL.Add('update Medico '+
              'set Medico_Nome         = "'+Cons02.Medico1.medico_nome.Text+'",'+
              'Medico_Rg               = "'+Cons02.Medico1.medico_rg.Text+'",'+
              'Medico_Cpf              = "'+Cons02.Medico1.medico_cpf.Text+'",'+
              'Medico_Especialidade    = "'+Cons02.Medico1.medico_especialidade.Text+'",'+
              'Medico_Endereco         = "'+Cons02.Medico1.medico_endereco.Text+'",'+
              'Medico_Complemento      = "'+Cons02.Medico1.medico_complemento.Text+'",'+
              'Medico_Bairro           = "'+Cons02.Medico1.medico_bairro.Text+'",'+
              'Medico_Cidade           = "'+Cons02.Medico1.medico_cidade.Text+'",'+
              'Medico_Uf               = "'+Cons02.Medico1.medico_uf.Text+'",'+
              'Medico_Cep              = "'+Cons02.Medico1.medico_cep.Text+'",'+
              'Medico_Fone_Consultorio = "'+Cons02.Medico1.medico_fone_consultorio.Text+'",'+
              'Medico_Fone_Residencia  = "'+Cons02.Medico1.medico_fone_residencia.Text+'",'+
              'Medico_Fone_Celular     = "'+Cons02.Medico1.medico_fone_celular.Text+'",'+
              'Medico_Fone_Fax         = "'+Cons02.Medico1.medico_fone_fax.Text+'",'+
              'Medico_Email            = "'+Cons02.Medico1.medico_email.Text+'" '+
              'where Medico_Crm        = "'+Cons02.Medico1.medico_crm.Text+'"');
              conexaoBD.SQL_Medico.ExecSQL;
              Limpa_Medico();
              Cursor_Normal();
              end
           else
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Medico.Close;
              conexaoBD.SQL_Medico.SQL.Clear;
              conexaoBD.SQL_Medico.SQL.Add('select * from Medico where Medico_Crm = "'+
              Cons02.Medico1.medico_crm.Text+'" order by Medico_Nome');
              conexaoBD.SQL_Medico.Open;
              Cursor_Normal();

              if conexaoBD.SQL_Medico.RecordCount > 0 then
                 begin
                 MSG_Erro('Este Médico já existe');
                 end
              else
                 begin
                 Cursor_Ampulheta();
                 conexaoBD.SQL_Medico.Close;
                 conexaoBD.SQL_Medico.SQL.Clear;
                 conexaoBD.SQL_Medico.SQL.Add('insert into Medico'+
                 '(Medico_Crm,'+
                 'Medico_Nome,'+
                 'Medico_Rg,'+
                 'Medico_Cpf,'+
                 'Medico_Especialidade,'+
                 'Medico_Endereco,'+
                 'Medico_Complemento,'+
                 'Medico_Bairro,'+
                 'Medico_Cidade,'+
                 'Medico_Uf,'+
                 'Medico_Cep,'+
                 'Medico_Fone_Consultorio,'+
                 'Medico_Fone_Residencia,'+
                 'Medico_Fone_Celular,'+
                 'Medico_Fone_Fax,'+
                 'Medico_Email) '+
                 'values("'+Cons02.Medico1.medico_crm.Text+'",'+
                 '"'+Cons02.Medico1.medico_nome.Text+'",'+
                 '"'+Cons02.Medico1.medico_rg.Text+'",'+
                 '"'+Cons02.Medico1.medico_cpf.Text+'",'+
                 '"'+Cons02.Medico1.medico_especialidade.Text+'",'+
                 '"'+Cons02.Medico1.medico_endereco.Text+'",'+
                 '"'+Cons02.Medico1.medico_complemento.Text+'",'+
                 '"'+Cons02.Medico1.medico_bairro.Text+'",'+
                 '"'+Cons02.Medico1.medico_cidade.Text+'",'+
                 '"'+Cons02.Medico1.medico_uf.Text+'",'+
                 '"'+Cons02.Medico1.medico_cep.Text+'",'+
                 '"'+Cons02.Medico1.medico_fone_consultorio.Text+'",'+
                 '"'+Cons02.Medico1.medico_fone_residencia.Text+'",'+
                 '"'+Cons02.Medico1.medico_fone_celular.Text+'",'+
                 '"'+Cons02.Medico1.medico_fone_fax.Text+'",'+
                 '"'+Cons02.Medico1.medico_email.Text+'")');
                 conexaoBD.SQL_Medico.ExecSQL;
                 Limpa_Medico();
                 Cursor_Normal();
              end;
           end;
           Cursor_Ampulheta();
           conexaoBD.SQL_Medico.Close;
           conexaoBD.SQL_Medico.SQL.Clear;
           conexaoBD.SQL_Medico.SQL.Add('select * from Medico');
           conexaoBD.SQL_Medico.Open;
           Cons02.Medico1.GRD_Medico.Refresh;
           Cursor_Normal();
           end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'cid' then
        begin
        if Valida_Cid() = True then
           begin
           Cursor_Ampulheta();
           conexaoBD.SQL_Cid.Close;
           conexaoBD.SQL_Cid.SQL.Clear;
           conexaoBD.SQL_Cid.SQL.Add('select * from Cid where cid_codigo_doenca = "'+
           Cons02.Cid2.cid_codigo.Text+'"');
           conexaoBD.SQL_Cid.Open;
           Cursor_Normal();

           if conexaoBD.SQL_Cid.RecordCount > 0 then
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Cid.Close;
              conexaoBD.SQL_Cid.SQL.Clear;
              conexaoBD.SQL_Cid.SQL.Add('update Cid'+
              ' set cid_descricao_doenca="'+Cons02.Cid2.cid_descricao.Text+'",'+
              ' cid_doenca_observacao="'+Cons02.Cid2.cid_observacao.Text+'" where'+
              ' cid_codigo_doenca = "'+Cons02.Cid2.cid_codigo.Text+'"');
              conexaoBD.SQL_Cid.ExecSQL;
              Cursor_Normal();
              end
           else
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Cid.Close;
              conexaoBD.SQL_Cid.SQL.Clear;
              conexaoBD.SQL_Cid.SQL.Add('insert into Cid'+
              '(Cid_codigo_doenca,'+
              'Cid_descricao_doenca,'+
              'Cid_doenca_observacao) '+
              'values("'+Trim(Cons02.Cid2.cid_codigo.Text)+'",'+
              '"'+Trim(Cons02.Cid2.cid_descricao.Text)+'",'+
              '"'+Cons02.Cid2.cid_observacao.Text+'")');
              conexaoBD.SQL_Cid.ExecSQL;
              Cursor_Normal();
           end;

           Limpa_Cid();
           Cursor_Ampulheta();
           conexaoBD.SQL_Cid.Close;
           conexaoBD.SQL_Cid.SQL.Clear;
           conexaoBD.SQL_Cid.SQL.Add('select * from Cid');
           conexaoBD.SQL_Cid.Open;
           Cons02.Cid2.GRD_Cid.Refresh;
           Cursor_Normal();

        end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'medico' then
        begin
        if Valida_Medico() = True then
           begin
           Cursor_Ampulheta();
           conexaoBD.SQL_Medico.Close;
           conexaoBD.SQL_Medico.SQL.Clear;
           conexaoBD.SQL_Medico.SQL.Add('update Medico '+
           'set Medico_crm="'+Cons02.Medico1.medico_crm.Text+'", '+
           'Medico_nome="'+Cons02.Medico1.medico_nome.Text+'", '+
           'Medico_especialidade="'+Cons02.Medico1.medico_especialidade.Text+'", '+
           'Medico_rg="'+Cons02.Medico1.medico_rg.Text+'", '+
           'Medico_cpf="'+Cons02.Medico1.medico_cpf.Text+'", '+
           'Medico_endereco="'+Cons02.Medico1.medico_endereco.Text+'", '+
           'Medico_complemento="'+Cons02.Medico1.medico_complemento.Text+'", '+
           'Medico_bairro="'+Cons02.Medico1.medico_bairro.Text+'", '+
           'Medico_cidade="'+Cons02.Medico1.medico_cidade.Text+'", '+
           'Medico_uf="'+Cons02.Medico1.medico_uf.Text+'", '+
           'Medico_cep="'+Cons02.Medico1.medico_cep.Text+'", '+
           'Medico_fone_consultorio="'+Cons02.Medico1.medico_fone_consultorio.Text+'", '+
           'Medico_fone_residencia="'+Cons02.Medico1.medico_fone_residencia.Text+'", '+
           'Medico_fone_celular="'+Cons02.Medico1.medico_fone_celular.Text+'", '+
           'Medico_fone_fax="'+Cons02.Medico1.medico_fone_fax.Text+'", '+
           'Medico_email="'+Cons02.Medico1.medico_email.Text+'"');
           conexaoBD.SQL_Medico.ExecSQL;

           Cons02.ConsulTEX_Medico_Crm.Text     := Cons02.Medico1.medico_crm.Text;
           Cons02.ConsulTEX_Medico.Text         := Cons02.Medico1.medico_nome.Text;
           Cons02.Caption                       := '- '+Cons02.Medico1.medico_nome.Text;

           Cursor_Normal();

           Fecha_Medico();
        end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'cirurgia' then
        begin
        if Valida_Cirurgia() = True then
           begin
           Cursor_Ampulheta();
           conexaoBD.SQL_Cirurgia.Close;
           conexaoBD.SQL_Cirurgia.SQL.Clear;
           conexaoBD.SQL_Cirurgia.SQL.Add('select * from Cirurgia where cirurgia_codigo = "'+
           Cons02.Cirurgia2.cirurgia_codigo.Text+'"');
           conexaoBD.SQL_Cirurgia.Open;
           Cursor_Normal();

           if conexaoBD.SQL_Cirurgia.RecordCount > 0 then
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Cirurgia.Close;
              conexaoBD.SQL_Cirurgia.SQL.Clear;
              conexaoBD.SQL_Cirurgia.SQL.Add('update Cirurgia'+
              ' set cirurgia_descricao="'+Cons02.Cirurgia2.cirurgia_descricao.Text+'",'+
              ' cirurgia_quantidade_ch="'+Cons02.Cirurgia2.cirurgia_quantidade.Text+'",'+
              ' cirurgia_observacao="'+Cons02.Cirurgia2.cirurgia_observacao.Text+'",'+
              ' cirurgia_material="'+Cons02.Cirurgia2.cirurgia_material.Text+'" where'+
              ' cirurgia_codigo = "'+Cons02.Cirurgia2.cirurgia_codigo.Text+'"');
              conexaoBD.SQL_Cirurgia.ExecSQL;
              Cursor_Normal();
              end
           else
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Cirurgia.Close;
              conexaoBD.SQL_Cirurgia.SQL.Clear;
              conexaoBD.SQL_Cirurgia.SQL.Add('insert into Cirurgia'+
              '(Cirurgia_codigo,'+
              'Cirurgia_descricao,'+
              'Cirurgia_quantidade_ch,'+
              'Cirurgia_observacao,'+
              'Cirurgia_material) '+
              'values("'+Trim(Cons02.Cirurgia2.cirurgia_codigo.Text)+'",'+
              '"'+Trim(Cons02.Cirurgia2.cirurgia_descricao.Text)+'",'+
              Cons02.Cirurgia2.cirurgia_quantidade.Text+','+
              '"'+Cons02.Cirurgia2.cirurgia_observacao.Text+'",'+
              '"'+Cons02.Cirurgia2.cirurgia_material.Text+'")');
              conexaoBD.SQL_Cirurgia.ExecSQL;
              Cursor_Normal();
           end;

           Limpa_Cirurgia();
           Cursor_Ampulheta();
           conexaoBD.SQL_Cirurgia.Close;
           conexaoBD.SQL_Cirurgia.SQL.Clear;
           conexaoBD.SQL_Cirurgia.SQL.Add('select * from Cirurgia');
           conexaoBD.SQL_Cirurgia.Open;
           Cons02.Cirurgia2.GRD_Cirurgia.Refresh;
           Cursor_Normal();

        end;
        end
     else if Sequencia_Tela[Tela_Ativa] = 'adicionais' then
        begin
        if Valida_Adicionais() = True then
           begin
           Cursor_Ampulheta();
           conexaoBD.SQL_Adicionais.Close;
           conexaoBD.SQL_Adicionais.SQL.Clear;
           conexaoBD.SQL_Adicionais.SQL.Add('select * from Adicionais where adicional_codigo = "'+
           Cons02.Adicionais2.adicional_codigo.Text+'"');
           conexaoBD.SQL_Adicionais.Open;
           Cursor_Normal();

           if conexaoBD.SQL_Adicionais.RecordCount > 0 then
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Adicionais.Close;
              conexaoBD.SQL_Adicionais.SQL.Clear;
              conexaoBD.SQL_Adicionais.SQL.Add('update Adicionais'+
              ' set adicional_descricao="'+Cons02.Adicionais2.adicional_descricao.Text+'",'+
              ' adicional_valor="'+Cons02.Adicionais2.adicional_valor.Text+'",'+
              ' adicional_observacao="'+Cons02.Adicionais2.adicional_observacao.Text+'" where'+
              ' adicional_codigo = "'+Cons02.Adicionais2.adicional_codigo.Text+'"');
              conexaoBD.SQL_Adicionais.ExecSQL;
              Cursor_Normal();
              end
           else
              begin
              Cursor_Ampulheta();
              conexaoBD.SQL_Adicionais.Close;
              conexaoBD.SQL_Adicionais.SQL.Clear;
              conexaoBD.SQL_Adicionais.SQL.Add('insert into Adicionais'+
              '(Adicional_codigo,'+
              'Adicional_descricao,'+
              'Adicional_valor,'+
              'Adicional_observacao) '+
              'values("'+Trim(Cons02.Adicionais2.adicional_codigo.Text)+'",'+
              '"'+Trim(Cons02.Adicionais2.adicional_descricao.Text)+'",'+
              '"'+Cons02.Adicionais2.adicional_valor.Text+'",'+
              '"'+Cons02.Adicionais2.adicional_observacao.Text+'")');
              conexaoBD.SQL_Adicionais.ExecSQL;
              Cursor_Normal();
           end;

           Limpa_Adicionais();
           Cursor_Ampulheta();
           conexaoBD.SQL_Adicionais.Close;
           conexaoBD.SQL_Adicionais.SQL.Clear;
           conexaoBD.SQL_Adicionais.SQL.Add('select * from Adicionais');
           conexaoBD.SQL_Adicionais.Open;
           Cons02.Adicionais2.GRD_Adicional.Refresh;
           Cursor_Normal();
        end;
     end;
end;

procedure Registro_Gravar_AG();

Var
   Data_Busca, Data_Grava: String;

begin
     if Agenda.horario_hora.Text <> '  :  ' then
        begin

        Prepara_Hora();

        if Valida_Agenda() = True then
          begin

          Cursor_Ampulheta();

          Data_Busca := DateToStr(Agenda.Calendario.Date);
          Data_Busca := Inverte_Data(Data_Busca);

          Data_Grava := DateToStr(Agenda.Calendario.Date);

{*** Verifica o Valor do Material da Cirurgia ***}

          If Trim(Agenda.horario_material.Text) = '' Then
             begin
             Agenda.horario_material.Text := '0.00';
          end;

          conexaoBD.SQL_Agenda.Close;
          conexaoBD.SQL_Agenda.SQL.Clear;
          conexaoBD.SQL_Agenda.SQL.Add('select * from Agenda where Agenda_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And agenda_data = #'+
          Data_Busca+'# and agenda_hora = "'+
          Trim(Agenda.horario_hora.Text)+'"');
          conexaoBD.SQL_Agenda.Open;
          Cursor_Normal();

          if conexaoBD.SQL_Agenda.RecordCount > 0 then
             begin
             Cursor_Ampulheta();
             Carrega_Agenda(False);
             conexaoBD.SQL_Agenda.Close;
             conexaoBD.SQL_Agenda.SQL.Clear;
             conexaoBD.SQL_Agenda.SQL.Add('update Agenda'+
             ' set agenda_ficha="'+Agenda.horario_ficha_nro.Text+'",'+
             ' agenda_descricao="'+Agenda.horario_descricao.Text+'",'+
             ' agenda_tipo="'+Agenda.horario_tipo.Text+'",'+
             ' agenda_tipo_cirurgia="'+Agenda.horario_tipo_cirurgia.Text+'",'+
             ' agenda_status="'+Agenda.horario_status.Text+'",'+
             ' agenda_convenio="'+Agenda.horario_convenio_nro.Text+'",'+
             ' agenda_descricao_convenio="'+Agenda.horario_convenio.Text+'",'+
             ' agenda_cirurgia_descricao="'+Agenda.horario_cirurgia_descricao.Text+'",'+
             ' agenda_quantidade_ch="'+Agenda.horario_quantidade_ch.Text+'",'+
             ' agenda_valor_ch="'+Agenda.horario_valor_ch.Text+'",'+
             ' agenda_valor_material_cirurgia="'+Agenda.horario_material.Text+'",'+
             ' agenda_observacao="'+Agenda.horario_observacao.Text+'",'+
             ' agenda_identifica_adicional="'+Agenda.horario_adicional_incluido.Text+'",'+
             ' agenda_valor_cirurgia="'+Agenda.horario_valor_cirurgia.Text+'"'+
             ' where Agenda_medico_crm = '+#39+Agenda.Agenda_Medico_Crm.Text+#39+' And agenda_data = #'+Data_Busca+'# and agenda_hora = "'+Trim(Agenda.horario_hora.Text)+'"');
             conexaoBD.SQL_Agenda.ExecSQL;
             Cursor_Normal();
             end
          else
             begin
             Cursor_Ampulheta();
             Carrega_Agenda(True);
             Cursor_Normal();
          end;

{*** Atualiza a Data de Ultima Consulta do Paciente ***}

          if (UpperCase(Agenda.horario_tipo.Text) = 'CONSULTA') or
             (UpperCase(Agenda.horario_tipo.Text) = 'RETORNO')  or
             (UpperCase(Agenda.horario_tipo.Text) = 'CIRURGIA') then
             begin

             if UpperCase(Agenda.horario_status.Text) = 'ATENDIDO' then
                begin
                Cursor_Ampulheta();
                conexaoBD.SQL_Paciente_AG.Close;
                conexaoBD.SQL_Paciente_AG.SQL.Clear;
                conexaoBD.SQL_Paciente_AG.SQL.Add('update Paciente'+
                ' set paciente_dt_ult_consulta="'+
                Data_Grava+'" where paciente_ficha = "'+
                Agenda.horario_ficha_nro.Text+'"');
                conexaoBD.SQL_Paciente_AG.ExecSQL;

                Carrega_Lista_Pacientes();
                Cursor_Normal();
             end;
          end;

          Cursor_Ampulheta();
          Prepara_Agenda();
          Limpa_Agenda();
          Carrega_Lista_Convenio_AG();

          conexaoBD.SQL_Paciente_AG.Close;
          conexaoBD.SQL_Paciente_AG.SQL.Clear;
          conexaoBD.SQL_Paciente_AG.SQL.Add('select * from Paciente where paciente_ficha = "0"');
          conexaoBD.SQL_Paciente_AG.Open;
          Agenda.horario_paciente_lista.Refresh;
          Cursor_Normal();
        end;
     end;
end;

procedure Procura_Cid();
begin
     Cursor_Ampulheta();

     conexaoBD.SQL_Cid.Close;
     conexaoBD.SQL_Cid.SQL.Clear;

     if Length(Cons02.Cid2.cid_procura.Text) > 0 then
        begin

        if Cons02.Cid2.cid_tipo_procura.Text = 'Código da Doença' then
           begin
           conexaoBD.SQL_Cid.SQL.Add('select * from Cid where cid_codigo_doenca like "'+Trim(Cons02.Cid2.cid_procura.Text)+'%"');
           end
        else
           begin
           conexaoBD.SQL_Cid.SQL.Add('select * from Cid where cid_descricao_doenca like "%'+Trim(Cons02.Cid2.cid_procura.Text)+'%"');
        end;

        end
     else
        begin
        conexaoBD.SQL_Cid.SQL.Add('select * from Cid');
     end;

     conexaoBD.SQL_Cid.Open;

     Cons02.Cid2.GRD_Cid.Refresh;

     Cursor_Normal();
end;

procedure Procura_Cirurgia();
begin
     Cursor_Ampulheta();

     conexaoBD.SQL_Cirurgia.Close;
     conexaoBD.SQL_Cirurgia.SQL.Clear;

     if Length(Cons02.Cirurgia2.cirurgia_procura.Text) > 0 then
        begin

        if Cons02.Cirurgia2.cirurgia_tipo_procura.Text = 'Código da Cirurgia' then
           begin
           conexaoBD.SQL_Cirurgia.SQL.Add('select * from Cirurgia where cirurgia_codigo like "'+Trim(Cons02.Cirurgia2.cirurgia_procura.Text)+'%"');
           end
        else
           begin
           conexaoBD.SQL_Cirurgia.SQL.Add('select * from Cirurgia where cirurgia_descricao like "%'+Trim(Cons02.Cirurgia2.cirurgia_procura.Text)+'%"');
        end;

        end
     else
        begin
        conexaoBD.SQL_Cirurgia.SQL.Add('select * from Cirurgia');
     end;

     conexaoBD.SQL_Cirurgia.Open;

     Cons02.Cirurgia2.GRD_Cirurgia.Refresh;

     Cursor_Normal();
end;

procedure Procura_Adicionais();
begin
     Cursor_Ampulheta();

     conexaoBD.SQL_Adicionais.Close;
     conexaoBD.SQL_Adicionais.SQL.Clear;

     if Length(Cons02.Adicionais2.adicional_procura.Text) > 0 then
        begin

        if Cons02.Adicionais2.adicional_tipo_procura.Text = 'Código do Adicional' then
           begin
           conexaoBD.SQL_Adicionais.SQL.Add('select * from Adicionais where adicional_codigo like "'+Trim(Cons02.Adicionais2.adicional_procura.Text)+'%"');
           end
        else
           begin
           conexaoBD.SQL_Adicionais.SQL.Add('select * from Adicionais where adicional_descricao like "%'+Trim(Cons02.Adicionais2.adicional_procura.Text)+'%"');
        end;

        end
     else
        begin
        conexaoBD.SQL_Adicionais.SQL.Add('select * from Adicionais');
     end;

     conexaoBD.SQL_Adicionais.Open;

     Cons02.Adicionais2.GRD_Adicional.Refresh;

     Cursor_Normal();
end;

procedure Carrega_Campos_Alterados();
begin

     {*** Guarda as Informações Alteradas ***}

              Paciente_Nome_Alterado             := Trim(Cons02.Paciente1.paciente_nome.Text);
              Paciente_sobrenome_Alterado        := Trim(Cons02.Paciente1.paciente_sobrenome.Text);
              Paciente_rg_Alterado               := Cons02.Paciente1.paciente_rg.Text;
              Paciente_cpf_Alterado              := Cons02.Paciente1.paciente_cpf.Text;
              Paciente_dt_cadastro_Alterado      := Cons02.Paciente1.paciente_dt_cadastro.Text;
              Paciente_dt_nascimento_Alterado    := Cons02.Paciente1.paciente_dt_nascimento.Text;
              Paciente_indicacao_Alterado        := Cons02.Paciente1.paciente_indicacao.Text;
              Paciente_sexo_Alterado             := Cons02.Paciente1.paciente_sexo.Text;
              Paciente_situacao_Alterado         := Cons02.Paciente1.paciente_situacao.Text;
              Paciente_convenio_Alterado         := Cons02.Paciente1.paciente_convenio.Text;
              Paciente_matricula_Alterado        := Cons02.Paciente1.paciente_matricula.Text;
              Paciente_titular_Alterado          := Cons02.Paciente1.paciente_titular.Text;
              Paciente_dt_ult_consulta_Alterado  := Cons02.Paciente1.paciente_dt_ult_consulta.Text;
              Paciente_endereco_Alterado         := Cons02.Paciente1.paciente_endereco.Text;
              Paciente_logradouro_Alterado       := Cons02.Paciente1.paciente_logradouro.Text;
              Paciente_complemento_Alterado      := Cons02.Paciente1.paciente_complemento.Text;
              Paciente_bairro_Alterado           := Cons02.Paciente1.paciente_bairro.Text;
              Paciente_cidade_Alterado           := Cons02.Paciente1.paciente_cidade.Text;
              Paciente_cep_Alterado              := Cons02.Paciente1.paciente_cep.Text;
              Paciente_uf_Alterado               := Cons02.Paciente1.paciente_uf.Text;
              Paciente_instrucao_Alterado        := Cons02.Paciente1.paciente_instrucao.Text;
              Paciente_estado_civil_Alterado     := Cons02.Paciente1.paciente_estado_civil.Text;
              Paciente_naturalidade_Alterado     := Cons02.Paciente1.paciente_naturalidade.Text;
              Paciente_profissao_Alterado        := Cons02.Paciente1.paciente_profissao.Text;
              Paciente_email_Alterado            := Cons02.Paciente1.paciente_email.Text;
              Paciente_fone_residencial_Alterado := Cons02.Paciente1.paciente_fone_residencial.Text;
              Paciente_fone_comercial_Alterado   := Cons02.Paciente1.paciente_fone_comercial.Text;
              Paciente_fone_fax_Alterado         := Cons02.Paciente1.paciente_fone_fax.Text;
              Paciente_fone_celular_Alterado     := Cons02.Paciente1.paciente_fone_celular.Text;
              Paciente_nome_sobrenome_Alterado   := Trim(Cons02.Paciente1.paciente_nome.Text)+' '+Trim(Cons02.Paciente1.paciente_sobrenome.Text);
              Paciente_observacao_Alterado       := Cons02.Paciente1.paciente_observacao.Text;
              Paciente_prontuario_Alterado       := Cons02.Paciente1.paciente_prontuario.Text;
end;

procedure Descarrega_Campos_Alterados();
var Ind: Integer;
begin
      {*** Descarrega os Campos Alterados para Serem Exibidos Novamente ***}

              Cons02.Paciente1.paciente_ficha.Text            := Paciente_Ficha_Alterado;
              Cons02.Paciente1.paciente_nome.Text             := Paciente_Nome_Alterado;
              Cons02.Paciente1.paciente_nome_ant.Text         := Paciente_Nome_Alterado;
              Cons02.Paciente1.paciente_sobrenome.Text        := Paciente_sobrenome_Alterado;
              Cons02.Paciente1.paciente_rg.Text               := Paciente_rg_Alterado;
              Cons02.Paciente1.paciente_cpf.Text              := Paciente_cpf_Alterado;
              Cons02.Paciente1.paciente_dt_cadastro.Text      := Paciente_dt_cadastro_Alterado;
              Cons02.Paciente1.paciente_dt_nascimento.Text    := Paciente_dt_nascimento_Alterado;
              Cons02.Paciente1.paciente_indicacao.Text        := Paciente_indicacao_Alterado;

              {*** Carrega o Campo de Sexo ***}

              if UpperCase(Paciente_sexo_Alterado) = 'MASCULINO' then
                 begin
                 Cons02.Paciente1.paciente_sexo.ItemIndex := 1;
                 end
              else
                 begin
                 Cons02.Paciente1.paciente_sexo.ItemIndex := 0;
              end;

              {*** Carrega o Campo de Situacao ***}

              if UpperCase(Paciente_situacao_Alterado) = 'INATIVO' then
                 begin
                 Cons02.Paciente1.paciente_situacao.ItemIndex := 1;
                 end
              else
                 begin
                 Cons02.Paciente1.paciente_situacao.ItemIndex := 0;
              end;

              {*** Carrega o Campo de Convenio ***}

              Cons02.Paciente1.paciente_convenio.ItemIndex := -1;

              if Cons02.Paciente1.paciente_convenio.Items.Count > 0 then
                 begin
                 for Ind := 1 to Cons02.Paciente1.paciente_convenio.Items.Count do
                     begin
                     if Cons02.Paciente1.paciente_convenio.Items.Strings[Ind - 1] = Paciente_convenio_Alterado then
                        begin
                        Cons02.Paciente1.paciente_convenio.ItemIndex := Ind - 1;
                     end;
                 end;
              end;

              Cons02.Paciente1.paciente_matricula.Text        := Paciente_matricula_Alterado;
              Cons02.Paciente1.paciente_titular.Text          := Paciente_titular_Alterado;
              Cons02.Paciente1.paciente_dt_ult_consulta.Text  := Paciente_dt_ult_consulta_Alterado;

              {*** Carrega o Campo de Endereço ***}

              if UpperCase(Paciente_endereco_Alterado) = 'COMERCIAL' then
                 begin
                 Cons02.Paciente1.paciente_endereco.ItemIndex := 1;
                 end
              else
                 begin
                 Cons02.Paciente1.paciente_endereco.ItemIndex := 0;
              end;

              Cons02.Paciente1.paciente_logradouro.Text       := Paciente_logradouro_Alterado;
              Cons02.Paciente1.paciente_complemento.Text      := Paciente_complemento_Alterado;
              Cons02.Paciente1.paciente_bairro.Text           := Paciente_bairro_Alterado;
              Cons02.Paciente1.paciente_cidade.Text           := Paciente_cidade_Alterado;
              Cons02.Paciente1.paciente_cep.Text              := Paciente_cep_Alterado;

              {*** Carrega o Campo de UF ***}

              if Paciente_uf_Alterado = 'AC' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 0;
                 end
              else if Paciente_uf_Alterado = 'AL' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 1;
                 end
              else if Paciente_uf_Alterado = 'AP' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 2;
                 end
              else if Paciente_uf_Alterado = 'AM' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 3;
                 end
              else if Paciente_uf_Alterado = 'BA' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 4;
                 end
              else if Paciente_uf_Alterado = 'CE' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 5;
                 end
              else if Paciente_uf_Alterado = 'DF' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 6;
                 end
              else if Paciente_uf_Alterado = 'ES' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 7;
                 end
              else if Paciente_uf_Alterado = 'GO' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 8;
                 end
              else if Paciente_uf_Alterado = 'MA' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 9;
                 end
              else if Paciente_uf_Alterado = 'MT' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 10;
                 end
              else if Paciente_uf_Alterado = 'MS' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 11;
                 end
              else if Paciente_uf_Alterado = 'MG' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 12;
                 end
              else if Paciente_uf_Alterado = 'PA' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 13;
                 end
              else if Paciente_uf_Alterado = 'PB' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 14;
                 end
              else if Paciente_uf_Alterado = 'PR' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 15;
                 end
              else if Paciente_uf_Alterado = 'PE' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 16;
                 end
              else if Paciente_uf_Alterado = 'PI' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 17;
                 end
              else if Paciente_uf_Alterado = 'RN' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 18;
                 end
              else if Paciente_uf_Alterado = 'RS' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 19;
                 end
              else if Paciente_uf_Alterado = 'RJ' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 20;
                 end
              else if Paciente_uf_Alterado = 'RO' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 21;
                 end
              else if Paciente_uf_Alterado = 'RR' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 22;
                 end
              else if Paciente_uf_Alterado = 'SC' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 23;
                 end
              else if Paciente_uf_Alterado = 'SP' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 24;
                 end
              else if Paciente_uf_Alterado = 'SE' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 25;
                 end
              else if Paciente_uf_Alterado = 'TO' then
                 begin
                 Cons02.Paciente1.paciente_uf.ItemIndex := 26;
              end;

              {*** Carrega o Campo de Grau de Instrução ***}

              if Paciente_instrucao_Alterado = '1o. Grau Incompleto' then
                 begin
                 Cons02.Paciente1.paciente_instrucao.ItemIndex := 0;
                 end
              else if Paciente_instrucao_Alterado = '1o. Grau Completo' then
                 begin
                 Cons02.Paciente1.paciente_instrucao.ItemIndex := 1;
                 end
              else if Paciente_instrucao_Alterado = '2o. Grau Incompleto' then
                 begin
                 Cons02.Paciente1.paciente_instrucao.ItemIndex := 2;
                 end
              else if Paciente_instrucao_Alterado = '2o. Grau Completo' then
                 begin
                 Cons02.Paciente1.paciente_instrucao.ItemIndex := 3;
                 end
              else if Paciente_instrucao_Alterado = '3o. Grau Incompleto' then
                 begin
                 Cons02.Paciente1.paciente_instrucao.ItemIndex := 4;
                 end
              else if Paciente_instrucao_Alterado = '3o. Grau Completo' then
                 begin
                 Cons02.Paciente1.paciente_instrucao.ItemIndex := 5;
                 end
              else
                 begin
                 Cons02.Paciente1.paciente_instrucao.ItemIndex := 0;
              end;

              {*** Carrega o Campo de Estado Civil ***}

              if Paciente_estado_civil_Alterado = 'Solteiro' then
                 begin
                 Cons02.Paciente1.paciente_estado_civil.ItemIndex := 0;
                 end
              else if Paciente_estado_civil_Alterado = 'Casado' then
                 begin
                 Cons02.Paciente1.paciente_estado_civil.ItemIndex := 1;
                 end
              else if Paciente_estado_civil_Alterado = 'Divorciado' then
                 begin
                 Cons02.Paciente1.paciente_estado_civil.ItemIndex := 2;
                 end
              else if Paciente_estado_civil_Alterado = 'Separado' then
                 begin
                 Cons02.Paciente1.paciente_estado_civil.ItemIndex := 3;
                 end
              else if Paciente_estado_civil_Alterado = 'Viuvo' then
                 begin
                 Cons02.Paciente1.paciente_estado_civil.ItemIndex := 4;
              end;

              Cons02.Paciente1.paciente_naturalidade.Text     := Paciente_naturalidade_Alterado;
              Cons02.Paciente1.paciente_profissao.Text        := Paciente_profissao_Alterado;
              Cons02.Paciente1.paciente_email.Text            := Paciente_email_Alterado;
              Cons02.Paciente1.paciente_fone_residencial.Text := Paciente_fone_residencial_Alterado;
              Cons02.Paciente1.paciente_fone_comercial.Text   := Paciente_fone_comercial_Alterado;
              Cons02.Paciente1.paciente_fone_fax.Text         := Paciente_fone_fax_Alterado;
              Cons02.Paciente1.paciente_fone_celular.Text     := Paciente_fone_celular_Alterado;
              Cons02.Paciente1.paciente_observacao.Text       := Paciente_observacao_Alterado;
              Cons02.Paciente1.paciente_prontuario.Text       := Paciente_prontuario_Alterado;
              Cons02.Paciente1.paciente_idade.Text            := Calcula_Idade(DateToStr(Date),Paciente_dt_nascimento_Alterado);

              conexaoBD.SQL_Paciente_Lista.Close;
              conexaoBD.SQL_Paciente_Lista.SQL.Clear;
              conexaoBD.SQL_Paciente_Lista.SQL.Add('select * from paciente where Paciente_ficha = "'+Cons02.Paciente1.paciente_ficha.Text+'"');
              conexaoBD.SQL_Paciente_Lista.Open;
end;

procedure So_Valor(Sender: TObject; var Key: Char);
begin
     If Not(key in ['0'..'9','.',',',#8,#9,#13]) Then Begin
        key := #0;
     End;

     If key in [',','.'] Then Begin
        key := DecimalSeparator;
     End;

     If key = DecimalSeparator Then Begin
        If pos(key,TEdit(Sender).Text) <> 0 Then Begin
           key := #0;
        End;
     End;
end;

procedure So_Numero(Sender: TObject; var Key: Char);
begin
     If Not(key in ['0'..'9',#8,#9,#13]) Then Begin
        key := #0;
     End;
end;

procedure So_Letra(Sender: TObject; var Key: Char);
begin
     If Not(key in ['A'..'Z','a'..'z',#8,#9,#13]) Then Begin
        key := #0;
     End;
end;

end.
