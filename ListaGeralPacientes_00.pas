unit ListaGeralPacientes_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TListaGeralPacientes00 = class(TForm)
    Panel1: TPanel;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    GroupBox1: TGroupBox;
    rbTodos: TRadioButton;
    rbPelaLetra: TRadioButton;
    edtLetra: TEdit;
    procedure rbTodosClick(Sender: TObject);
    procedure rbPelaLetraClick(Sender: TObject);
    procedure edtLetraKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure edtLetraChange(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure Checa_Radio;
  public
    { Public declarations }
  end;

var
  ListaGeralPacientes00: TListaGeralPacientes00;

implementation

uses Conexao_BD, Rotinas_Gerais, Math, Rel_ListaGeralPacientes_00;

{$R *.dfm}

procedure TListaGeralPacientes00.Checa_Radio;
begin
    If rbTodos.Checked = True Then begin
        edtLetra.Text      := '';
        edtLetra.Enabled   := False;

        btnImprimir.SetFocus;
    end
    Else If rbPelaLetra.Checked = True Then begin
        edtLetra.Text      := '';
        edtLetra.Enabled  := True;

        edtLetra.SetFocus;
    end;
end;

procedure TListaGeralPacientes00.rbTodosClick(Sender: TObject);
begin
    Checa_Radio();
end;

procedure TListaGeralPacientes00.rbPelaLetraClick(Sender: TObject);
begin
    Checa_Radio();
end;

procedure TListaGeralPacientes00.edtLetraKeyPress(Sender: TObject;
  var Key: Char);
begin
    So_Letra(Sender,Key);
    If Key = #13 Then Key := #9;
end;

procedure TListaGeralPacientes00.btnSairClick(Sender: TObject);
begin
    ListaGeralPacientes00.Close;
end;

procedure TListaGeralPacientes00.edtLetraChange(Sender: TObject);
begin
    If Trim(edtLetra.Text) <> '' Then btnImprimir.SetFocus; 
end;

procedure TListaGeralPacientes00.btnImprimirClick(Sender: TObject);
var Comando_SQL: String;
begin
    If (Trim(edtLetra.Text) = '') and (rbPelaLetra.Checked = True) Then Begin
        MSG_Erro('Digite a letra pela qual pesquisar...');
        edtLetra.SetFocus;
    End
    Else Begin

        Comando_SQL := 'Select Paciente_ficha, Paciente_caracteres, Paciente_nome_sobrenome From Paciente ';
        If Trim(edtLetra.Text) <> '' Then
            Comando_SQL := Comando_SQL + 'Where Paciente_ficha like ''%'+Trim(edtLetra.Text)+'%'' ';
        Comando_SQL := Comando_SQL + 'Order By Paciente_nome_sobrenome';

        conexaoBD.SQL_PacienteListaGeral.Close;
        conexaoBD.SQL_PacienteListaGeral.SQL.Clear;
        conexaoBD.SQL_PacienteListaGeral.SQL.Add(Comando_SQL);
        conexaoBD.SQL_PacienteListaGeral.Open;

        Application.CreateForm(TRel_ListaGeralPacientes00,Rel_ListaGeralPacientes00);
        Rel_ListaGeralPacientes00.QR_ListaGeralPacientes.PreviewModal;
        Rel_ListaGeralPacientes00.Destroy;
    End;
end;

end.
