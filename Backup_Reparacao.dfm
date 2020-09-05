object BackupReparacao: TBackupReparacao
  Left = 276
  Top = 154
  BorderStyle = bsDialog
  Caption = 'Efetua o Backup e Repara a Base de Dados'
  ClientHeight = 218
  ClientWidth = 407
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
  object Panel1: TPanel
    Left = 5
    Top = 6
    Width = 397
    Height = 207
    Color = 15722463
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 8
      Top = 5
      Width = 380
      Height = 131
      Caption = '  Aten'#231#227'o !!!  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 361
        Height = 108
        AutoSize = False
        Caption = 
          'Antes de efetuar o Backup '#233' necess'#225'rio que todos os usu'#225'rios que' +
          ' estiverem utilizando o ConsulTEX, saiam do aplicativo e fechem ' +
          'todas as janelas relacionadas a ele. '#201' necess'#225'rio tamb'#233'm que sej' +
          'am fechadas todas as janelas de cadastro e demais op'#231#245'es que est' +
          'ejam sendo utilizadas por este computador. Assim que todos os us' +
          'u'#225'rios tiverem finalizado seus aplicativos, de continuidade ao B' +
          'ackup. Caso as instru'#231#245'es informadas acima n'#227'o sejam, seguidas, ' +
          'erros poder'#227'o ocorrer danificando a Base de Dados. Cuidado, cert' +
          'ifique-se de que as instru'#231#245'es foram seguidas.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 144
      Width = 380
      Height = 53
      Caption = '  Efetuar o Backup e Repara'#231#227'o?  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object BT_Gravar: TBitBtn
        Left = 130
        Top = 19
        Width = 120
        Height = 25
        Caption = '&Efetuar o Backup'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BT_GravarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
      object BT_Sair: TBitBtn
        Left = 300
        Top = 19
        Width = 70
        Height = 25
        Caption = '&Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
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
end
