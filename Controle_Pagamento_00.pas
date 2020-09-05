unit Controle_Pagamento_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons;

type
  TControle_Pagamento00 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtData_F: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtData_I: TMaskEdit;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    Medico: TEdit;
    Medico_Crm: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtData_IKeyPress(Sender: TObject; var Key: Char);
    procedure edtData_FKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Controle_Pagamento00: TControle_Pagamento00;

implementation

uses Rel_Controle_Pagamentos_00, Cons_02, Rotinas_Gerais, Conexao_BD;

{$R *.dfm}

procedure TControle_Pagamento00.btnSairClick(Sender: TObject);
begin
    Controle_Pagamento00.Close;
end;

procedure TControle_Pagamento00.FormCreate(Sender: TObject);
begin
    {*** Trabalha com o Ano de 4 Dígitos ***}
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TControle_Pagamento00.FormShow(Sender: TObject);
begin
    edtData_I.Text  := DateToStr(Date());
    edtData_F.Text  := DateToStr(Date());
end;

procedure TControle_Pagamento00.btnImprimirClick(Sender: TObject);
var Comando_SQL: String;
begin
    if (Trim(edtData_I.Text) = '/  /') then begin
        MSG_Erro('Para proseguir preencha o campo de data que marca o início do intervalo...');
        edtData_I.SetFocus;
    end
    else if (Trim(edtData_F.Text) = '/  /') then begin
        MSG_Erro('Para proseguir preencha o campo de data que marca o final do intervalo...');
        edtData_F.SetFocus;
    end
    else if (StrToDate(edtData_I.Text) > StrToDate(edtData_F.Text)) then begin
        MSG_Erro('A data que marca o início do intervalo, '+#13
                +'não pode ser maior que a que marca o seu fim...');
        edtData_I.SetFocus;
    end
    else begin
        Comando_SQL := '';
        Comando_SQL := Comando_SQL + 'Select ';
        Comando_SQL := Comando_SQL + '  A.*,';
        Comando_SQL := Comando_SQL + '  C.Convenio_numero,';
        Comando_SQL := Comando_SQL + '  C.Convenio_qtde_ch,';
        Comando_SQL := Comando_SQL + '  C.Convenio_valor_ch,';
        Comando_SQL := Comando_SQL + '  C.Convenio_valor_cirurgia ';
        Comando_SQL := Comando_SQL + 'From ';
        Comando_SQL := Comando_SQL + '  Agenda A,';
        Comando_SQL := Comando_SQL + '  Convenio C ';
        Comando_SQL := Comando_SQL + 'Where ';
        Comando_SQL := Comando_SQL + '  (A.Agenda_convenio = C.Convenio_numero) And ';
        Comando_SQL := Comando_SQL + '  (A.Agenda_medico_crm >= '''+Trim(Medico_Crm.Text)+''') And ';

        Comando_SQL := Comando_SQL + '  ((A.Agenda_data >= #'+Inverte_Data(edtData_I.Text)+'#) And (A.Agenda_data <= #'+Inverte_Data(edtData_F.Text)+'#)) ';

//        Comando_SQL := Comando_SQL + '  (A.Agenda_data between #'+Trim(edtData_I.Text)+'# And #'+Trim(edtData_F.Text)+'#) ';

        Comando_SQL := Comando_SQL + 'Order By ';
        Comando_SQL := Comando_SQL + '  A.Agenda_data';

        conexaoBD.SQL_Rel_Controle_Pagamentos.Close;
        conexaoBD.SQL_Rel_Controle_Pagamentos.SQL.Clear;
        conexaoBD.SQL_Rel_Controle_Pagamentos.SQL.Add(Comando_SQL);
        conexaoBD.SQL_Rel_Controle_Pagamentos.Open;

        Application.CreateForm(TRel_Controle_Pagamentos00,Rel_Controle_Pagamentos00);

        Rel_Controle_Pagamentos00.lblNomeMedico.Caption := Medico.Text;
        Rel_Controle_Pagamentos00.lblPeriodo.Caption    := 'Período: De ' + edtData_I.Text + ' até ' + edtData_F.Text;

        Rel_Controle_Pagamentos00.QR_Controle_Pagamentos.PreviewModal;
        Rel_Controle_Pagamentos00.Destroy;
    end;
end;

procedure TControle_Pagamento00.edtData_IKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
        begin
        edtData_F.SetFocus;
     end;
end;

procedure TControle_Pagamento00.edtData_FKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
        begin
        btnImprimir.SetFocus;
     end;
end;

end.
