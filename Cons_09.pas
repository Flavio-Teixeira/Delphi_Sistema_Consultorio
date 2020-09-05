unit Cons_09;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Mask, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TAdicionais = class(TFrame)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    GRD_Adicional: TDBGrid;
    adicional_tipo_procura: TComboBox;
    adicional_procura: TEdit;
    adicional_busca: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    adicional_codigo: TEdit;
    adicional_descricao: TEdit;
    adicional_observacao: TMemo;
    DB_adicional_codigo: TDBEdit;
    DB_adicional_descricao: TDBEdit;
    DB_adicional_observacao: TDBMemo;
    adicional_valor: TEdit;
    DB_adicional_valor: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure adicional_tipo_procuraKeyPress(Sender: TObject;
      var Key: Char);
    procedure adicional_procuraKeyPress(Sender: TObject; var Key: Char);
    procedure adicional_buscaClick(Sender: TObject);
    procedure GRD_AdicionalCellClick(Column: TColumn);
    procedure adicional_valorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TAdicionais.Button1Click(Sender: TObject);
begin
     Fecha_Adicionais();
end;

procedure TAdicionais.adicional_tipo_procuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #13 then
        begin
        adicional_procura.SetFocus;
     end;
end;

procedure TAdicionais.adicional_procuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #13 then
        begin
        if adicional_procura.Text = '' then
           begin
           adicional_codigo.SetFocus;
           end
        else
           begin
           Procura_Adicionais();
        end;
     end;
end;

procedure TAdicionais.adicional_buscaClick(Sender: TObject);
begin
     Procura_Adicionais();
end;

procedure TAdicionais.GRD_AdicionalCellClick(Column: TColumn);
begin
     adicional_codigo.Text     := DB_adicional_codigo.Text;
     adicional_descricao.Text  := DB_adicional_descricao.Text;
     adicional_observacao.Text := DB_adicional_observacao.Text;
     adicional_valor.Text      := DB_adicional_valor.Text;

     adicional_codigo.SetFocus;
end;

procedure TAdicionais.adicional_valorKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
        begin
        adicional_valor.SetFocus;
     end;

     if not(key in ['0'..'9','.',',',#8,#13]) then
        key := #0;
     if key in [',','.'] then
        key := DecimalSeparator;
     if key = DecimalSeparator then
        if pos(key,TEdit(Sender).Text) <> 0 then
           key := #0;
end;

end.
