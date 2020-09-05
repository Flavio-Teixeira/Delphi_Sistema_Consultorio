unit Cons_00;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, DBCtrls, Mask, ExtCtrls, jpeg, Buttons,
  Variants, PReport, OleCtrls, PdfLib_TLB, PdfDoc, ShellAPI, Mapi;

type
  TPaciente = class(TFrame)
    GroupBox2: TGroupBox;
    Dados_Paciente: TPageControl;
    Ficha: TTabSheet;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    paciente_fone_residencial: TEdit;
    paciente_fone_comercial: TEdit;
    paciente_fone_fax: TEdit;
    paciente_fone_celular: TEdit;
    GroupBox6: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    paciente_endereco: TComboBox;
    paciente_logradouro: TEdit;
    paciente_complemento: TEdit;
    paciente_bairro: TEdit;
    paciente_cidade: TEdit;
    paciente_uf: TComboBox;
    paciente_email: TEdit;
    Prontuario: TTabSheet;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    paciente_ficha: TEdit;
    paciente_nome: TEdit;
    paciente_sobrenome: TEdit;
    DB_paciente_ficha: TDBEdit;
    DB_paciente_nome: TDBEdit;
    DB_paciente_sobrenome: TDBEdit;
    DB_paciente_cpf: TDBEdit;
    DB_paciente_rg: TDBEdit;
    DB_paciente_dt_nascimento: TDBEdit;
    DB_paciente_dt_cadastro: TDBEdit;
    DB_paciente_foto: TDBEdit;
    DB_paciente_fone_celular: TDBEdit;
    DB_paciente_fone_fax: TDBEdit;
    DB_paciente_fone_comercial: TDBEdit;
    DB_paciente_fone_residencial: TDBEdit;
    DB_paciente_email: TDBEdit;
    DB_paciente_profissao: TDBEdit;
    DB_paciente_naturalidade: TDBEdit;
    DB_paciente_estado_civil: TDBEdit;
    DB_paciente_instrucao: TDBEdit;
    DB_paciente_uf: TDBEdit;
    DB_paciente_cep: TDBEdit;
    DB_paciente_cidade: TDBEdit;
    DB_paciente_bairro: TDBEdit;
    DB_paciente_complemento: TDBEdit;
    DB_paciente_logradouro: TDBEdit;
    DB_paciente_endereco: TDBEdit;
    DB_paciente_dt_ult_consulta: TDBEdit;
    DB_paciente_titular: TDBEdit;
    DB_paciente_matricula: TDBEdit;
    DB_paciente_convenio: TDBEdit;
    DB_paciente_situacao: TDBEdit;
    DB_paciente_sexo: TDBEdit;
    DB_paciente_indicacao: TDBEdit;
    paciente_cep: TMaskEdit;
    DB_paciente_observacao: TDBMemo;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    paciente_rg: TEdit;
    Label5: TLabel;
    paciente_cpf: TMaskEdit;
    Label7: TLabel;
    paciente_dt_nascimento: TMaskEdit;
    Label11: TLabel;
    paciente_convenio: TComboBox;
    Label33: TLabel;
    paciente_titular: TEdit;
    Label9: TLabel;
    paciente_indicacao: TComboBox;
    paciente_idade: TEdit;
    Label8: TLabel;
    paciente_matricula: TEdit;
    Label12: TLabel;
    Label6: TLabel;
    paciente_dt_cadastro: TMaskEdit;
    paciente_sexo: TComboBox;
    Label10: TLabel;
    paciente_dt_ult_consulta: TMaskEdit;
    Label34: TLabel;
    paciente_situacao: TComboBox;
    Label13: TLabel;
    paciente_instrucao: TComboBox;
    Label21: TLabel;
    paciente_estado_civil: TComboBox;
    Label22: TLabel;
    paciente_naturalidade: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    paciente_profissao: TEdit;
    GroupBox7: TGroupBox;
    Foto_Paciente: TImage;
    Bt_Foto: TBitBtn;
    BT_paciente_envelope: TBitBtn;
    BT_paciente_ficha: TBitBtn;
    Observacoes: TTabSheet;
    paciente_observacao: TMemo;
    paciente_prontuario: TMemo;
    DB_paciente_prontuario: TDBMemo;
    Button1: TButton;
    paciente_nome_alterado: TEdit;
    paciente_nome_ant: TEdit;
    procedure paciente_dt_nascimentoExit(Sender: TObject);
    procedure paciente_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_sobrenomeKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_rgKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_cpfKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_dt_nascimentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure paciente_sexoKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_dt_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_situacaoKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_naturalidadeKeyPress(Sender: TObject;
      var Key: Char);
    procedure paciente_estado_civilKeyPress(Sender: TObject;
      var Key: Char);
    procedure paciente_instrucaoKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_profissaoKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_dt_ult_consultaKeyPress(Sender: TObject;
      var Key: Char);
    procedure paciente_convenioKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_matriculaKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_titularKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_indicacaoKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_enderecoKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_logradouroKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_complementoKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_bairroKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_cidadeKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_cepKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_ufKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_emailKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_fone_residencialKeyPress(Sender: TObject;
      var Key: Char);
    procedure paciente_fone_comercialKeyPress(Sender: TObject;
      var Key: Char);
    procedure paciente_fone_faxKeyPress(Sender: TObject; var Key: Char);
    procedure paciente_fone_celularKeyPress(Sender: TObject;
      var Key: Char);
    procedure BT_paciente_fichaClick(Sender: TObject);
    procedure BT_paciente_envelopeClick(Sender: TObject);
    procedure paciente_dt_cadastroExit(Sender: TObject);
    procedure paciente_dt_ult_consultaExit(Sender: TObject);
    procedure Bt_FotoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure paciente_nomeChange(Sender: TObject);
  private
    { Private declarations }
    function SendEMail(Handle: THandle; Mail: TStrings): Cardinal;
  public
    { Public declarations }
  end;

var flag: Integer = 0;

implementation

uses Rotinas_Gerais, Conexao_BD, Cons_02, Foto_00, Rel_01, Rel_02, GifUnit;

{$R *.dfm}


//***************
//*** Funções ***
//***************

function TPaciente.SendEMail(Handle: THandle; Mail: TStrings): Cardinal;
type
  TAttachAccessArray = array [0..0] of TMapiFileDesc;
  PAttachAccessArray = ^TAttachAccessArray;
var
  MapiMessage: TMapiMessage;
  Receip: TMapiRecipDesc;
  Attachments: PAttachAccessArray;
  AttachCount: Integer;
  i1: integer;
  FileName: string;
  dwRet: Cardinal;
  MAPI_Session: Cardinal;
  WndList: Pointer;
begin
  dwRet := MapiLogon(Handle,PChar(''),PChar(''),MAPI_LOGON_UI or MAPI_NEW_SESSION,0, @MAPI_Session);

  if (dwRet <> SUCCESS_SUCCESS) then
    begin
    MessageBox(Handle,PChar('Error while trying to send email'),PChar('Error'),MB_ICONERROR or MB_OK);
    end
  else
    begin
    FillChar(MapiMessage, SizeOf(MapiMessage), #0);
    Attachments := nil;
    FillChar(Receip, SizeOf(Receip), #0);

    if Mail.Values['to'] <> '' then
      begin
      Receip.ulReserved := 0;
      Receip.ulRecipClass := MAPI_TO;
      Receip.lpszName := StrNew(PChar(Mail.Values['to']));
      Receip.lpszAddress := StrNew(PChar('SMTP:' + Mail.Values['to']));
      Receip.ulEIDSize := 0;

      MapiMessage.nRecipCount := 1;
      MapiMessage.lpRecips := @Receip;
    end;

    AttachCount := 0;

    for i1 := 0 to MaxInt do
      begin
      if Mail.Values['attachment' + IntToStr(i1)] = '' then break;
      Inc(AttachCount);
    end;

    if AttachCount > 0 then
      begin
      GetMem(Attachments, SizeOf(TMapiFileDesc) * AttachCount);

      for i1 := 0 to AttachCount - 1 do
        begin
        FileName := Mail.Values['attachment' + IntToStr(i1)];
        Attachments[i1].ulReserved := 0;
        Attachments[i1].flFlags := 0;
        Attachments[i1].nPosition := ULONG($FFFFFFFF);
        Attachments[i1].lpszPathName := StrNew(PChar(FileName));
        Attachments[i1].lpszFileName := StrNew(PChar(ExtractFileName(FileName)));
        Attachments[i1].lpFileType := nil;
      end;

      MapiMessage.nFileCount := AttachCount;
      MapiMessage.lpFiles := @Attachments^;
    end;

    if Mail.Values['subject'] <> '' then MapiMessage.lpszSubject := StrNew(PChar(Mail.Values['subject']));
    if Mail.Values['body'] <> '' then MapiMessage.lpszNoteText := StrNew(PChar(Mail.Values['body']));

    WndList := DisableTaskWindows(0);

    try
      Result := MapiSendMail(MAPI_Session, Handle, MapiMessage, MAPI_DIALOG, 0);
    finally
      EnableTaskWindows( WndList );
    end;

    for i1 := 0 to AttachCount - 1 do
      begin
      StrDispose(Attachments[i1].lpszPathName);
      StrDispose(Attachments[i1].lpszFileName);
    end;

    if Assigned(MapiMessage.lpszSubject) then StrDispose(MapiMessage.lpszSubject);
    if Assigned(MapiMessage.lpszNoteText) then StrDispose(MapiMessage.lpszNoteText);
    if Assigned(Receip.lpszAddress) then StrDispose(Receip.lpszAddress);
    if Assigned(Receip.lpszName) then StrDispose(Receip.lpszName);

    MapiLogOff(MAPI_Session, Handle, 0, 0);
  end;
end;

//*****************
//*** Procedure ***
//*****************


procedure TPaciente.paciente_dt_nascimentoExit(Sender: TObject);
begin
     If Valida_Data(paciente_dt_nascimento.Text) = False Then
        begin
        MSG_Erro('Data Inválida!');
        paciente_dt_nascimento.SetFocus;
        end
     Else
        begin
        {*** Calcula a Idade do Paciente ***}

        paciente_idade.Text := Calcula_Idade(DateToStr(Date), paciente_dt_nascimento.Text);
     end;
end;

procedure TPaciente.paciente_nomeKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   paciente_sobrenome.SetFocus;
end;

end;

procedure TPaciente.paciente_sobrenomeKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_rg.SetFocus;
end;

end;

procedure TPaciente.paciente_rgKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   paciente_cpf.SetFocus;
end;

end;

procedure TPaciente.paciente_cpfKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   paciente_dt_nascimento.SetFocus;
end;

end;

procedure TPaciente.paciente_dt_nascimentoKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_sexo.SetFocus;
end;

end;

procedure TPaciente.paciente_sexoKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   paciente_dt_cadastro.SetFocus;
end;

end;

procedure TPaciente.paciente_dt_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_situacao.SetFocus;
end;

end;

procedure TPaciente.paciente_situacaoKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_naturalidade.SetFocus;
end;

end;

procedure TPaciente.paciente_naturalidadeKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_estado_civil.SetFocus;
end;

end;

procedure TPaciente.paciente_estado_civilKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_instrucao.SetFocus;
end;

end;

procedure TPaciente.paciente_instrucaoKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_profissao.SetFocus;
end;

end;

procedure TPaciente.paciente_profissaoKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_dt_ult_consulta.SetFocus;
end;

end;

procedure TPaciente.paciente_dt_ult_consultaKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_convenio.SetFocus;
end;

end;

procedure TPaciente.paciente_convenioKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_matricula.SetFocus;
end;

end;

procedure TPaciente.paciente_matriculaKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_titular.SetFocus;
end;

end;

procedure TPaciente.paciente_titularKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_indicacao.SetFocus;
end;

end;

procedure TPaciente.paciente_indicacaoKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_endereco.SetFocus;
end;

end;

procedure TPaciente.paciente_enderecoKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_logradouro.SetFocus;
end;

end;

procedure TPaciente.paciente_logradouroKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_complemento.SetFocus;
end;

end;

procedure TPaciente.paciente_complementoKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_bairro.SetFocus;
end;

end;

procedure TPaciente.paciente_bairroKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_cidade.SetFocus;
end;

end;

procedure TPaciente.paciente_cidadeKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_cep.SetFocus;
end;

end;

procedure TPaciente.paciente_cepKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   paciente_uf.SetFocus;
end;

end;

procedure TPaciente.paciente_ufKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   paciente_email.SetFocus;
end;

end;

procedure TPaciente.paciente_emailKeyPress(Sender: TObject; var Key: Char);
begin

if key = #13 then
   begin
   paciente_fone_residencial.SetFocus;
end;

end;

procedure TPaciente.paciente_fone_residencialKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_fone_comercial.SetFocus;
end;

end;

procedure TPaciente.paciente_fone_comercialKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_fone_fax.SetFocus;
end;

end;

procedure TPaciente.paciente_fone_faxKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   paciente_fone_celular.SetFocus;
end;

end;

procedure TPaciente.paciente_fone_celularKeyPress(Sender: TObject;
  var Key: Char);
begin

if key = #13 then
   begin
   Cons02.Bt_Gravar.SetFocus;
end;

end;

procedure TPaciente.BT_paciente_fichaClick(Sender: TObject);
begin
     if Cons02.Paciente1.paciente_ficha.Text <> '' then
        begin
        Application.CreateForm(TRel_Ficha_Paciente,Rel_Ficha_Paciente);

        Rel_Ficha_Paciente.QR_Descricao_Convenio.Caption   := Cons02.Paciente1.paciente_convenio.Text;
        Rel_Ficha_Paciente.QR_Idade.Caption                := Cons02.Paciente1.paciente_idade.Text;

        Rel_Ficha_Paciente.QRL_Nome_medico.Caption         := Cons02.ConsulTEX_Medico.Text;

        Rel_Ficha_Paciente.QR_Sexo.Caption := Cons02.Paciente1.paciente_sexo.Text;
        Rel_Ficha_Paciente.QR_Estado_Civil.Caption := Cons02.Paciente1.paciente_estado_civil.Text;
        Rel_Ficha_Paciente.QR_Indicacao.Caption := Cons02.Paciente1.paciente_indicacao.Text;
        Rel_Ficha_Paciente.QR_Tipo_Residencia.Caption := Cons02.Paciente1.paciente_endereco.Text;

        Rel_Ficha_Paciente.RPT_Ficha_Paciente.PreviewModal;
        Rel_Ficha_Paciente.RPT_Ficha_Paciente.Destroy;
        Rel_Ficha_Paciente.Destroy;
        end
     else
        begin
        MSG_Erro('O Paciente não foi escolhido...');
     end;
end;

procedure TPaciente.BT_paciente_envelopeClick(Sender: TObject);
begin
     if Cons02.Paciente1.paciente_ficha.Text <> '' then
        begin
        Application.CreateForm(TRel_Envelope,Rel_Envelope);
        Rel_Envelope.RPT_Envelope.PreviewModal;
        Rel_Envelope.RPT_Envelope.Destroy;
        Rel_Envelope.Destroy;
        end
     else
        begin
        MSG_Erro('O Paciente não foi escolhido...');
     end;
end;

procedure TPaciente.paciente_dt_cadastroExit(Sender: TObject);
begin
     If Valida_Data(paciente_dt_cadastro.Text) = False Then
        begin
        MSG_Erro('Data Inválida!');
        paciente_dt_cadastro.SetFocus;
     end;
end;

procedure TPaciente.paciente_dt_ult_consultaExit(Sender: TObject);
begin
     If Valida_Data(paciente_dt_ult_consulta.Text) = False Then
        begin
        MSG_Erro('Data Inválida!');
        paciente_dt_ult_consulta.SetFocus;
     end;
end;

procedure TPaciente.Bt_FotoClick(Sender: TObject);
begin
     if Cons02.Paciente1.paciente_ficha.Text <> '' then
        begin
        Application.CreateForm(TFoto,Foto);

        Foto.Foto_Paciente_Ficha.Text := Cons02.Paciente1.paciente_ficha.Text;

        Foto.ShowModal;
        Foto.Destroy;
        end
     else
        begin
        MSG_Erro('O Paciente não foi escolhido...');
     end;
end;

procedure TPaciente.Button1Click(Sender: TObject);
var
    mail: TStringList;
begin
    mail := TStringList.Create;
    try
       mail.values['to'] := Trim(paciente_email.Text); ///AQUI VAI O EMAIL DO DESTINATARIO///
       mail.values['subject'] := ''; ///AQUI O ASSUNTO///
       mail.values['body'] := ''; ///AQUI O TEXTO NO CORPO DO EMAIL///
       {mail.values['attachment0'] := Anexo; ////AQUI O ENDEREÇO ONDE ENCONTRAM OS ARQUIVOS//}
       sendEMail(Application.Handle, mail);
    finally
       mail.Free;
    end;
end;

procedure TPaciente.paciente_nomeChange(Sender: TObject);
begin
    if (flag = 0) then begin
        paciente_nome_ant.Text := paciente_nome.Text;
        flag := 1;
    end;

    if (Trim(paciente_nome.Text) <> Trim(paciente_nome_ant.Text)) then begin
        paciente_nome_alterado.Text :='True';
    end
    else begin
        paciente_nome_alterado.Text :='';
    end;
end;

end.
