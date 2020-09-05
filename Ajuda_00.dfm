object Ajuda00: TAjuda00
  Left = 276
  Top = 153
  BorderStyle = bsDialog
  Caption = 'Ajuda'
  ClientHeight = 453
  ClientWidth = 688
  Color = 13615023
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 673
    Height = 385
    Caption = '  Como utilizar o ConsulTEX  '
    TabOrder = 0
    object Ajuda_ConsulTEX: TMemo
      Left = 10
      Top = 16
      Width = 652
      Height = 358
      Lines.Strings = (
        'O que '#233' o ConsulTEX?'
        ''
        
          'O ConsulTEX '#233' um Software de Gerenciamento de Cl'#237'nicas e Consult' +
          #243'rios desenvolvido pela Datatex em parceria com diversos '
        'M'#233'dicos de diferentes especialidades.'
        ''
        ''
        ''
        ''
        'Utiliza'#231#227'o Geral'
        ''
        
          'O ConsulTEX '#233' um Software de f'#225'cil utiliza'#231#227'o e auto-dedutivo, n' +
          #227'o precisando de conhecimentos detalhados da utiliza'#231#227'o da '
        'ferramenta.'
        'Em todos os Cadastros exintem os Bot'#245'es:'
        ''
        'Novo - Gera um Novo Registro em Branco.'
        'Gravar - Grava as Informa'#231#245'es no Registro.'
        'Apagar - Apaga as informa'#231#245'es do Registro.'
        'Ficha - Imprime a Ficha do Paciente.'
        '>> - Avan'#231'a para a Pr'#243'xima tela Aberta.'
        '<< - Retorna para a Tela aberta Anteriormente.'
        ''
        ''
        ''
        ''
        'Ficha do Paciente'
        ''
        
          'O Paciente pode ser localizado por Nome, Sobrenome ou Nro. da Fi' +
          'cha (Gerado Automaticamente).'
        'A Localiza'#231#227'o ocorre por palavras seguimentadas ou inteiras.'
        
          'Para se abrir a Ficha do paciente, local'#237'zea e clique um vez em ' +
          'cima da mesma.'
        
          'Sempre que fizer uma altera'#231#227'o clique no bot'#227'o gravar para regis' +
          'trar os dados.'
        ''
        ''
        'Demais d'#250'vidas podem ser esclarecidas via Suporte:'
        ''
        'E-Mail: datatex@datatex.com.br'
        'Fone: (0xx11) 4476-9175'
        ''
        ''
        '')
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 404
    Width = 673
    Height = 41
    Color = 13615023
    TabOrder = 1
    object BT_Sair: TBitBtn
      Left = 596
      Top = 8
      Width = 70
      Height = 25
      Caption = '&Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BT_SairClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
  end
end
