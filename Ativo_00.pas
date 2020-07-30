unit Ativo_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TAtivo00 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    medico_disponivel: TComboBox;
    Panel2: TPanel;
    BT_Ativar: TBitBtn;
    BT_Sair: TBitBtn;
    GroupBox2: TGroupBox;
    medico_ativo: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_AtivarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ativo00: TAtivo00;

implementation

uses Cons_02, Conexao_BD, Rotinas_Gerais, Agen_00;

{$R *.dfm}

procedure TAtivo00.BT_SairClick(Sender: TObject);
begin
     Ativo00.Close;
end;

procedure TAtivo00.FormShow(Sender: TObject);

var
   Ind: Integer;

begin
     Cursor_Ampulheta();

     medico_ativo.Text := Cons02.ConsulTEX_Medico.Text;

     conexaoBD.SQL_Comunitario_Aux.Close;
     conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
     conexaoBD.SQL_Comunitario_Aux.SQL.Add('select * from Medico Order By Medico_Nome');
     conexaoBD.SQL_Comunitario_Aux.Open;

     medico_disponivel.Items.Clear;

     for Ind := 1 to conexaoBD.SQL_Comunitario_Aux.RecordCount do begin
         medico_disponivel.Items.Add(conexaoBD.SQL_Comunitario_Aux.FieldValues['Medico_nome']);
         conexaoBD.SQL_Comunitario_Aux.Next;
     end;

     medico_disponivel.ItemIndex := 0;

     Cursor_Normal();
end;

procedure TAtivo00.BT_AtivarClick(Sender: TObject);
begin
     Cursor_Ampulheta();

//*** Carrega as Informações do Médico Selecionado ***

     conexaoBD.SQL_Comunitario_Aux.Close;
     conexaoBD.SQL_Comunitario_Aux.SQL.Clear;
     conexaoBD.SQL_Comunitario_Aux.SQL.Add('select * from Medico Where Medico_nome = '+#39+Trim(medico_disponivel.Text)+#39);
     conexaoBD.SQL_Comunitario_Aux.Open;

     conexaoBD.SQL_Comunitario_Aux.First;

     Cons02.Caption := '- '+Trim(conexaoBD.SQL_Comunitario_Aux.FieldValues['Medico_nome']);
     Cons02.ConsulTEX_Medico_Crm.Text := conexaoBD.SQL_Comunitario_Aux.FieldValues['Medico_crm'];
     Cons02.ConsulTEX_Medico.Text     := conexaoBD.SQL_Comunitario_Aux.FieldValues['Medico_Nome'];

//*** Fecha a Agenda ***

     Agenda.Close;
     Cursor_Normal();

     Ativo00.Close;
end;

end.
