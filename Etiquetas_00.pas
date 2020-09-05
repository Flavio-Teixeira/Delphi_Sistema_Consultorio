unit Etiquetas_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls;

type
  TEtiquetas00 = class(TForm)
    Panel1: TPanel;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    GroupBox1: TGroupBox;
    rbTodos: TRadioButton;
    rbNumero_Ficha: TRadioButton;
    rbAniversario_Mes: TRadioButton;
    rbUltima_Consulta: TRadioButton;
    edtNumero_Ficha: TEdit;
    cbbMes: TComboBox;
    edtDias: TEdit;
    Label1: TLabel;
    procedure edtDiasKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure rbTodosClick(Sender: TObject);
    procedure rbNumero_FichaClick(Sender: TObject);
    procedure rbAniversario_MesClick(Sender: TObject);
    procedure rbUltima_ConsultaClick(Sender: TObject);
  private
    { Private declarations }
    procedure Checa_Radio();
  public
    { Public declarations }
  end;

var
  Etiquetas00: TEtiquetas00;

implementation

uses Conexao_BD, Rel_Etiquetas_00, Rotinas_Gerais, Math;

{$R *.dfm}

procedure TEtiquetas00.edtDiasKeyPress(Sender: TObject; var Key: Char);
begin
    So_Numero(Sender,Key);
end;

procedure TEtiquetas00.btnSairClick(Sender: TObject);
begin
    Etiquetas00.Close;
end;

procedure TEtiquetas00.btnImprimirClick(Sender: TObject);
var
    Erro: Boolean;
    Comando_SQL, Mes, Ultima_Consulta: String;

    A1, Paciente1, Endereco1, Bairro_Cidade_Estado1, CEP1: String;
    A2, Paciente2, Endereco2, Bairro_Cidade_Estado2, CEP2: String;
begin
    Erro                  := False;
    Comando_SQL           := '';
    Mes                   := '';
    Ultima_Consulta       := '';

    if rbNumero_Ficha.Checked = True Then begin
        If Trim(edtNumero_Ficha.Text) = '' Then begin
            MSG_Erro('Antes de Prosseguir preencha o campo Número da ficha corretamente');
            edtNumero_Ficha.SetFocus;
            Erro := True;
        end
        Else begin
            Comando_SQL := 'Select * from Paciente Where paciente_ficha ='''+Trim(edtNumero_Ficha.Text)+''' Order By paciente_nome_sobrenome';
            Erro := False;
        end;
    end
    else if rbAniversario_Mes.Checked = True Then begin
             If Trim(cbbMes.Text) = 'Janeiro'   Then Mes :=  '1'
        Else If Trim(cbbMes.Text) = 'Fevereiro' Then Mes :=  '2'
        Else If Trim(cbbMes.Text) = 'Março'     Then Mes :=  '3'
        Else If Trim(cbbMes.Text) = 'Abril'     Then Mes :=  '4'
        Else If Trim(cbbMes.Text) = 'Maio'      Then Mes :=  '5'
        Else If Trim(cbbMes.Text) = 'Junho'     Then Mes :=  '6'
        Else If Trim(cbbMes.Text) = 'Julho'     Then Mes :=  '7'
        Else If Trim(cbbMes.Text) = 'Agosto'    Then Mes :=  '8'
        Else If Trim(cbbMes.Text) = 'Setembro'  Then Mes :=  '9'
        Else If Trim(cbbMes.Text) = 'Outubro'   Then Mes := '10'
        Else If Trim(cbbMes.Text) = 'Novembro'  Then Mes := '11'
        Else If Trim(cbbMes.Text) = 'Dezembro'  Then Mes := '12';

        Comando_SQL := 'Select * from Paciente Where Month(paciente_dt_nascimento) ='''+(Mes)+''' Order By paciente_dt_nascimento, paciente_nome_sobrenome';
        Erro := False;
    end
    else if rbUltima_Consulta.Checked = True Then begin
        If Trim(edtDias.Text) = '' Then begin
            MSG_Erro('Antes de Prosseguir preencha o campo Número de Dias corretamente');
            edtDias.SetFocus;
            Erro := True;
        end
        Else begin
            Ultima_Consulta := DateToStr(Date() - StrToInt(edtDias.Text));
            Comando_SQL := 'Select * from Paciente Where Paciente_dt_ult_consulta <= #'+Inverte_Data(Ultima_Consulta)+'# Order By Paciente_dt_ult_consulta, paciente_nome_sobrenome';
            Erro := False;
        end;

    end
    else begin
        Comando_SQL := 'Select * from Paciente Order By paciente_nome_sobrenome';
        Erro := False;
    end;


    If (Trim(Comando_SQL) <> '') And (Erro = False) Then Begin
        conexaoBD.SQL_Paciente.Close;
        conexaoBD.SQL_Paciente.SQL.Clear;
        conexaoBD.SQL_Paciente.SQL.Add(Comando_SQL);
        conexaoBD.SQL_Paciente.Open;

        If conexaoBD.SQL_Paciente.RecordCount <= 0 Then begin
            MSG_Erro('Não foi encontrado nenhum registro apartir do requisito solicitado...');
            btnImprimir.SetFocus;
        end
        Else begin
            conexaoBD.SQL_Comunitario.Close;
            conexaoBD.SQL_Comunitario.SQL.Clear;
            conexaoBD.SQL_Comunitario.SQL.Add('Delete * From Etiquetas');
            conexaoBD.SQL_Comunitario.ExecSQL;

            conexaoBD.SQL_Paciente.First;
            While conexaoBD.SQL_Paciente.Eof = False Do begin
                A1                    := '';
                A2                    := '';
                Paciente1             := '';
                Paciente2             := '';
                Endereco1             := '';
                Endereco2             := '';
                Bairro_Cidade_Estado1 := '';
                Bairro_Cidade_Estado2 := '';
                CEP1                  := '';
                CEP2                  := '';

                A1                    := 'A';
                Paciente1             := conexaoBD.SQL_PacientePaciente_nome.Text +' '+ conexaoBD.SQL_PacientePaciente_sobrenome.Text;
                Endereco1             := 'Endereço: '+conexaoBD.SQL_PacientePaciente_logradouro.Text;
                Bairro_Cidade_Estado1 := conexaoBD.SQL_PacientePaciente_bairro.Text +' - '+ conexaoBD.SQL_PacientePaciente_cidade.Text +' - '+ conexaoBD.SQL_PacientePaciente_uf.Text;
                CEP1                  := 'CEP: '+conexaoBD.SQL_PacientePaciente_cep.Text;

                conexaoBD.SQL_Paciente.Next;

                if conexaoBD.SQL_Paciente.Eof = False Then begin
                    A2                    := 'A';
                    Paciente2             := conexaoBD.SQL_PacientePaciente_nome.Text +' '+ conexaoBD.SQL_PacientePaciente_sobrenome.Text;
                    Endereco2             := 'Endereço: '+conexaoBD.SQL_PacientePaciente_logradouro.Text;
                    Bairro_Cidade_Estado2 := conexaoBD.SQL_PacientePaciente_bairro.Text +' - '+ conexaoBD.SQL_PacientePaciente_cidade.Text +' - '+ conexaoBD.SQL_PacientePaciente_uf.Text;
                    CEP2                  := 'CEP: '+conexaoBD.SQL_PacientePaciente_cep.Text;
                    conexaoBD.SQL_Paciente.Next;
                End;

                Comando_SQL := '';
                Comando_SQL := Comando_SQL + 'Insert into Etiquetas(A1, Paciente1, Endereco1, Bairro_Cidade_Estado1, CEP1, A2, Paciente2, Endereco2, Bairro_Cidade_Estado2, CEP2) values(''';
                Comando_SQL := Comando_SQL + A1                   + ''',''';
                Comando_SQL := Comando_SQL + Paciente1            + ''',''';
                Comando_SQL := Comando_SQL + Endereco1            + ''',''';
                Comando_SQL := Comando_SQL + Bairro_Cidade_Estado1+ ''',''';
                Comando_SQL := Comando_SQL + CEP1                 + ''',''';
                Comando_SQL := Comando_SQL + A2                   + ''',''';
                Comando_SQL := Comando_SQL + Paciente2            + ''',''';
                Comando_SQL := Comando_SQL + Endereco2            + ''',''';
                Comando_SQL := Comando_SQL + Bairro_Cidade_Estado2+ ''',''';
                Comando_SQL := Comando_SQL + CEP2                 + ''')';

                conexaoBD.SQL_Comunitario.Close;
                conexaoBD.SQL_Comunitario.SQL.Clear;
                conexaoBD.SQL_Comunitario.SQL.Add(Comando_SQL);
                conexaoBD.SQL_Comunitario.ExecSQL;

            End;

            conexaoBD.SQL_Etiquetas.Close;
            conexaoBD.SQL_Etiquetas.SQL.Clear;
            conexaoBD.SQL_Etiquetas.SQL.Add('Select * From Etiquetas E Order By E.Numero');
            conexaoBD.SQL_Etiquetas.Open;

            Application.CreateForm(TRel_Etiquetas00,Rel_Etiquetas00);
            Rel_Etiquetas00.qrEtiquetas.PreviewModal;
            Rel_Etiquetas00.Destroy;
        End;
        conexaoBD.SQL_Paciente.Close;
    End;



end;

procedure TEtiquetas00.Checa_Radio;
begin
    If rbNumero_Ficha.Checked = True Then begin
        edtNumero_Ficha.Text  := '0';
        cbbMes.ItemIndex      :=  0 ;
        edtDias.Text          := '0';

        edtNumero_Ficha.Enabled := True;
        cbbMes.Enabled          := False;
        edtDias.Enabled         := False;

        edtNumero_Ficha.SetFocus;
    end
    Else If rbAniversario_Mes.Checked = True Then begin
        edtNumero_Ficha.Text  := '0';
        cbbMes.ItemIndex      :=  0 ;
        edtDias.Text          := '0';

        edtNumero_Ficha.Enabled := False;
        cbbMes.Enabled          := True;
        edtDias.Enabled         := False;

        cbbMes.SetFocus;
    end
    Else If rbUltima_Consulta.Checked = True Then begin
        edtNumero_Ficha.Text  := '0';
        cbbMes.ItemIndex      :=  0 ;
        edtDias.Text          := '0';

        edtNumero_Ficha.Enabled := False;
        cbbMes.Enabled          := False;
        edtDias.Enabled         := True;

        edtDias.SetFocus;
    end
    Else begin
        edtNumero_Ficha.Text  := '0';
        cbbMes.ItemIndex      :=  0 ;
        edtDias.Text          := '0';

        edtNumero_Ficha.Enabled := False;
        cbbMes.Enabled          := False;
        edtDias.Enabled         := False;

        btnImprimir.SetFocus;
    end;
end;

procedure TEtiquetas00.rbTodosClick(Sender: TObject);
begin
    Checa_Radio();
end;

procedure TEtiquetas00.rbNumero_FichaClick(Sender: TObject);
begin
    Checa_Radio();
end;

procedure TEtiquetas00.rbAniversario_MesClick(Sender: TObject);
begin
    Checa_Radio();
end;

procedure TEtiquetas00.rbUltima_ConsultaClick(Sender: TObject);
begin
    Checa_Radio();
end;

end.
