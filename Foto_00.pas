unit Foto_00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtDlgs, IdGlobal;

type
  TFoto = class(TForm)
    Label2: TLabel;
    Caminho_Imagem: TEdit;
    BT_Procurar: TBitBtn;
    BT_Alterar: TBitBtn;
    BT_Sair: TBitBtn;
    Imagem_Tipo: TEdit;
    OpenDialog1: TOpenDialog;
    BT_Excluir: TBitBtn;
    Foto_Paciente_Ficha: TEdit;
    procedure BT_SairClick(Sender: TObject);
    procedure BT_ProcurarClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Foto: TFoto;

implementation

uses Conexao_BD, Rotinas_Gerais, Cons_00, Cons_02, GifUnit;

{$R *.dfm}

procedure TFoto.BT_SairClick(Sender: TObject);
begin
     Foto.Close;
end;

procedure TFoto.BT_ProcurarClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
     begin
     Caminho_Imagem.Text := OpenDialog1.FileName;
     Imagem_Tipo.Text    := Copy(Caminho_Imagem.Text,(Length(Caminho_Imagem.Text) - 2),3);
  end;
end;

procedure TFoto.BT_AlterarClick(Sender: TObject);

var
  GifFile: TGifFile;

begin
     if Trim(Caminho_Imagem.Text) <> '' Then
        begin
        Cursor_Ampulheta();

        conexaoBD.SQL_Paciente_Imagem.Close;
        conexaoBD.SQL_Paciente_Imagem.SQL.Clear;
        conexaoBD.SQL_Paciente_Imagem.SQL.Add('Select * from Paciente where paciente_ficha = ' + Foto_Paciente_Ficha.Text );
        conexaoBD.SQL_Paciente_Imagem.Open;

         if conexaoBD.SQL_Paciente_Imagem.RecordCount > 0 Then
           begin
           conexaoBD.SQL_Paciente_Imagem.First;
           conexaoBD.SQL_Paciente_Imagem.Edit;
           conexaoBD.SQL_Paciente_ImagemPaciente_Foto.LoadFromFile(Caminho_Imagem.Text);
           conexaoBD.SQL_Paciente_ImagemPaciente_Foto_Tipo.Text := Trim(Imagem_Tipo.Text);
           conexaoBD.SQL_Paciente_Imagem.Post;

           If UpperCase(Trim(Imagem_Tipo.Text)) = 'GIF' Then
              begin
              GifFile := TGifFile.Create;
              GifFile.LoadFromFile(Caminho_Imagem.Text);

              Cons02.Paciente1.Foto_Paciente.Picture.Bitmap := GifFile.AsBitmap;
              end
           else if ( UpperCase(Trim(Imagem_Tipo.Text)) = 'JPG' ) Or
                   ( UpperCase(Trim(Imagem_Tipo.Text)) = 'BMP' ) Or
                   ( UpperCase(Trim(Imagem_Tipo.Text)) = 'EMF' ) Or
                   ( UpperCase(Trim(Imagem_Tipo.Text)) = 'WMF' ) Then
              begin
              Cons02.Paciente1.Foto_Paciente.Picture.LoadFromFile(Caminho_Imagem.Text);
           end;
        end;

        Cursor_Normal();

        MSG_Erro('Alteração da Foto Efetuada...');

        Foto.Close;
        end
     else
        begin
        MSG_Erro('Favor Informar o Caminho da Foto...');
     end;
end;

procedure TFoto.BT_ExcluirClick(Sender: TObject);
begin
     Cursor_Ampulheta();

     conexaoBD.SQL_Paciente_Imagem.Close;
     conexaoBD.SQL_Paciente_Imagem.SQL.Clear;
     conexaoBD.SQL_Paciente_Imagem.SQL.Add('Select * from Paciente where paciente_ficha = ' + Foto_Paciente_Ficha.Text );
     conexaoBD.SQL_Paciente_Imagem.Open;

     if conexaoBD.SQL_Paciente_Imagem.RecordCount > 0 Then
        begin
        conexaoBD.SQL_Paciente_Imagem.First;
        conexaoBD.SQL_Paciente_Imagem.Edit;
        conexaoBD.SQL_Paciente_ImagemPaciente_Foto.Clear;
        conexaoBD.SQL_Paciente_ImagemPaciente_Foto_Tipo.Text := '';
        conexaoBD.SQL_Paciente_Imagem.Post;

        Cons02.Paciente1.Foto_Paciente.Picture := Nil;
     end;

     Cursor_Normal();

     MSG_Erro('Exclusão da Foto Efetuada...');

     Foto.Close;
end;

end.
