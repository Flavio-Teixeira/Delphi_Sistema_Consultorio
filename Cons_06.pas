unit Cons_06;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, DBCtrls, Mask;

type
  TCid = class(TFrame)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    cid_codigo: TEdit;
    cid_descricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    GRD_Cid: TDBGrid;
    cid_tipo_procura: TComboBox;
    Label3: TLabel;
    cid_procura: TEdit;
    Label4: TLabel;
    Button2: TButton;
    cid_observacao: TMemo;
    Label5: TLabel;
    DB_cid_codigo: TDBEdit;
    DB_cid_descricao: TDBEdit;
    DB_cid_observacao: TDBMemo;
    procedure Button1Click(Sender: TObject);
    procedure GRD_CidCellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure cid_procuraKeyPress(Sender: TObject; var Key: Char);
    procedure cid_tipo_procuraKeyPress(Sender: TObject; var Key: Char);
    procedure cid_codigoKeyPress(Sender: TObject; var Key: Char);
    procedure cid_descricaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Rotinas_Gerais, Conexao_BD, Cons_02;

{$R *.dfm}

procedure TCid.Button1Click(Sender: TObject);
begin
     Fecha_Cid();
end;

procedure TCid.GRD_CidCellClick(Column: TColumn);
begin
     cid_codigo.Text     := DB_cid_codigo.Text;
     cid_descricao.Text  := DB_cid_descricao.Text;
     cid_observacao.Text := DB_cid_observacao.Text;

     cid_codigo.SetFocus;
end;

procedure TCid.Button2Click(Sender: TObject);
begin
     procura_Cid();
end;

procedure TCid.cid_procuraKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #13 then
        begin
        if cid_procura.Text = '' then
           begin
           cid_codigo.SetFocus;
           end
        else
           begin
           Procura_Cid();
        end;
     end;
end;

procedure TCid.cid_tipo_procuraKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   cid_procura.SetFocus;
end;

end;

procedure TCid.cid_codigoKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   cid_descricao.SetFocus;
end;

end;

procedure TCid.cid_descricaoKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   cid_observacao.SetFocus;
end;

end;

end.
