unit Cons_08;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Mask, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TCirurgia = class(TFrame)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    GRD_Cirurgia: TDBGrid;
    cirurgia_tipo_procura: TComboBox;
    cirurgia_procura: TEdit;
    cirurgia_busca: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    cirurgia_codigo: TEdit;
    cirurgia_descricao: TEdit;
    cirurgia_observacao: TMemo;
    DB_cirurgia_codigo: TDBEdit;
    DB_cirurgia_descricao: TDBEdit;
    DB_cirurgia_observacao: TDBMemo;
    Label6: TLabel;
    cirurgia_quantidade: TEdit;
    DB_cirurgia_quantidade: TDBEdit;
    Label7: TLabel;
    cirurgia_material: TEdit;
    DB_cirurgia_material: TDBEdit;
    procedure cirurgia_quantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure cirurgia_tipo_procuraKeyPress(Sender: TObject;
      var Key: Char);
    procedure cirurgia_procuraKeyPress(Sender: TObject; var Key: Char);
    procedure cirurgia_buscaClick(Sender: TObject);
    procedure GRD_CirurgiaCellClick(Column: TColumn);
    procedure cirurgia_materialKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Conexao_BD, Rotinas_Gerais;

{$R *.dfm}

procedure TCirurgia.cirurgia_quantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
        begin
        cirurgia_quantidade.SetFocus;
     end;

     if not(key in ['0'..'9','.',',',#8,#13]) then
        key := #0;
     if key in [',','.'] then
        key := DecimalSeparator;
     if key = DecimalSeparator then
        if pos(key,TEdit(Sender).Text) <> 0 then
           key := #0;
end;

procedure TCirurgia.Button1Click(Sender: TObject);
begin
     Fecha_Cirurgia();
end;

procedure TCirurgia.cirurgia_tipo_procuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #13 then
        begin
        cirurgia_procura.SetFocus;
     end;
end;

procedure TCirurgia.cirurgia_procuraKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #13 then
        begin
        if cirurgia_procura.Text = '' then
           begin
           cirurgia_codigo.SetFocus;
           end
        else
           begin
           Procura_Cirurgia();
        end;
     end;
end;

procedure TCirurgia.cirurgia_buscaClick(Sender: TObject);
begin
     Procura_Cirurgia();
end;

procedure TCirurgia.GRD_CirurgiaCellClick(Column: TColumn);
begin
     cirurgia_codigo.Text     := DB_cirurgia_codigo.Text;
     cirurgia_descricao.Text  := DB_cirurgia_descricao.Text;
     cirurgia_observacao.Text := DB_cirurgia_observacao.Text;
     cirurgia_quantidade.Text := DB_cirurgia_quantidade.Text;
     cirurgia_material.Text   := DB_cirurgia_material.Text;

     cirurgia_codigo.SetFocus;
end;

procedure TCirurgia.cirurgia_materialKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
        begin
        cirurgia_material.SetFocus;
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
