object Adicionais_AG: TAdicionais_AG
  Left = 275
  Top = 153
  BorderStyle = bsDialog
  Caption = 'Adicionais do Paciente'
  ClientHeight = 357
  ClientWidth = 582
  Color = 15722463
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000110000000000000099
    1000000000000191100000000000008891100000000009991100000000000008
    7911000000000999110000000000000018911000000019991100000000000000
    0089100000001999110000000000000000189100000019991000000000000000
    0008891000009999100000000000000000008891000099991000000000000000
    0000088910019999100000000000000000000088911199911000000000000000
    0000001889999991100000000000000000000000879999910000000000000000
    0000000008799991000000000000000000000000001899910000000000000000
    0000000000199991000000000000000000000000001999910000000000000000
    0000000000199991100000000000000000000000001999991000000000000000
    0000000000199999910000000000000000000000009999999910000000000000
    0000000000999988899100000000000000000000019991017891100000000000
    0000000001991000088911000000000000000000018910000088911000000000
    0000000000891000000889100000000000000000001810000000879100000000
    0000000000000000000008791000000000000000000110000000008791000000
    000000000000000000000008791100000000000000000000000000001891FFFF
    FFFFFFFFCFFFC7FF87FFC1FF83FFE0FF83FFF07F03FFFC7F03FFFC3F07FFFE1F
    07FFFF0F07FFFF8607FFFFC007FFFFC007FFFFF00FFFFFF80FFFFFFC0FFFFFFC
    0FFFFFFC0FFFFFFC07FFFFFC07FFFFFC03FFFFFC01FFFFFC00FFFFF8207FFFF8
    783FFFF87C1FFFFC7E1FFFFC7F0FFFFFFF87FFFE7FC3FFFFFFE0FFFFFFF0}
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 7
    Top = 8
    Width = 565
    Height = 119
    Color = 13615023
    TabOrder = 0
    object Label3: TLabel
      Left = 6
      Top = 6
      Width = 174
      Height = 13
      Caption = 'Rela'#231#227'o de Adicionais para Escolha:'
    end
    object GRD_Adicional_AG: TDBGrid
      Left = 6
      Top = 21
      Width = 553
      Height = 92
      Ctl3D = False
      DataSource = conexaoBD.DS_Adicionais_AG
      Options = [dgTitles, dgColLines, dgRowLines]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = GRD_Adicional_AGCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Adicional_codigo'
          Title.Caption = 'C'#243'digo'
          Title.Color = 13615023
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Adicional_descricao'
          Title.Caption = 'Descri'#231#227'o'
          Title.Color = 13615023
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Adicional_valor'
          Title.Alignment = taCenter
          Title.Caption = 'Valor'
          Title.Color = 13615023
          Width = 82
          Visible = True
        end>
    end
    object DB_Adicional_Codigo: TDBEdit
      Left = 183
      Top = 2
      Width = 10
      Height = 21
      DataField = 'Adicional_codigo'
      DataSource = conexaoBD.DS_Adicionais_AG
      TabOrder = 1
      Visible = False
    end
    object DB_Adicional_Descricao: TDBEdit
      Left = 195
      Top = 2
      Width = 10
      Height = 21
      DataField = 'Adicional_descricao'
      DataSource = conexaoBD.DS_Adicionais_AG
      TabOrder = 2
      Visible = False
    end
    object DB_Adicional_Valor: TDBEdit
      Left = 207
      Top = 2
      Width = 10
      Height = 21
      DataField = 'Adicional_valor'
      DataSource = conexaoBD.DS_Adicionais_AG
      TabOrder = 3
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 7
    Top = 137
    Width = 565
    Height = 210
    Color = 13615023
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 6
      Top = 2
      Width = 553
      Height = 202
      Caption = '  Paciente  '
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 18
        Width = 49
        Height = 13
        Caption = 'Nro. Ficha'
      end
      object Label2: TLabel
        Left = 86
        Top = 18
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label5: TLabel
        Left = 8
        Top = 60
        Width = 61
        Height = 13
        Caption = 'Adicionados:'
      end
      object Label6: TLabel
        Left = 422
        Top = 177
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object Label7: TLabel
        Left = 285
        Top = 177
        Width = 55
        Height = 13
        Caption = 'Quantidade'
      end
      object paciente_ficha: TEdit
        Left = 8
        Top = 31
        Width = 56
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object paciente_nome: TEdit
        Left = 86
        Top = 31
        Width = 460
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object GRD_Adicional_Paciente: TDBGrid
        Left = 8
        Top = 74
        Width = 537
        Height = 92
        Ctl3D = False
        DataSource = conexaoBD.DS_Adicionais_Lista
        Options = [dgTitles, dgColLines, dgRowLines]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = GRD_Adicional_PacienteCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Adicional_lista_codigo_adicional'
            Title.Caption = 'C'#243'digo'
            Title.Color = 13615023
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Adicional_lista_descricao'
            Title.Caption = 'Descri'#231#227'o'
            Title.Color = 13615023
            Width = 334
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Adicional_lista_valor'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Title.Color = 13615023
            Width = 82
            Visible = True
          end>
      end
      object paciente_total: TEdit
        Left = 450
        Top = 174
        Width = 95
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
      end
      object paciente_quantidade: TEdit
        Left = 344
        Top = 174
        Width = 59
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
      object paciente_hora: TEdit
        Left = 70
        Top = 52
        Width = 10
        Height = 21
        TabOrder = 5
        Text = 'paciente_hora'
        Visible = False
      end
      object paciente_data: TEdit
        Left = 81
        Top = 52
        Width = 10
        Height = 21
        TabOrder = 6
        Text = 'paciente_hora'
        Visible = False
      end
      object paciente_data_invertida: TEdit
        Left = 92
        Top = 52
        Width = 10
        Height = 21
        TabOrder = 7
        Text = 'paciente_hora'
        Visible = False
      end
      object DB_paciente_adicional_codigo: TDBEdit
        Left = 103
        Top = 52
        Width = 10
        Height = 21
        DataField = 'Adicional_lista_codigo'
        DataSource = conexaoBD.DS_Adicionais_Lista
        TabOrder = 8
        Visible = False
      end
      object BT_Sair: TBitBtn
        Left = 8
        Top = 171
        Width = 66
        Height = 25
        Caption = '&Sair'
        TabOrder = 9
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
