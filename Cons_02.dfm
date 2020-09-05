object Cons02: TCons02
  Left = 206
  Top = 135
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ConsulTEX - Gerenciamento de Consult'#243'rios'
  ClientHeight = 524
  ClientWidth = 787
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
  Menu = MainMenu1
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 2
    Top = 0
    Width = 784
    Height = 523
    BorderStyle = bsSingle
    Color = 15722463
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 3
      Top = 1
      Width = 186
      Height = 513
      Caption = '   Controle   '
      Color = 13615023
      ParentColor = False
      TabOrder = 0
      object Panel2: TPanel
        Left = 5
        Top = 212
        Width = 176
        Height = 71
        Color = 13615023
        TabOrder = 0
        object Bt_Novo: TBitBtn
          Left = 11
          Top = 7
          Width = 75
          Height = 25
          Caption = '&Novo'
          TabOrder = 0
          OnClick = Bt_NovoClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
            0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
            0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
            8888880FFFFFF008888888000000008888888888888888888888}
        end
        object Bt_Gravar: TBitBtn
          Left = 11
          Top = 38
          Width = 75
          Height = 25
          Caption = '&Gravar'
          TabOrder = 1
          OnClick = Bt_GravarClick
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
        object Bt_Apagar: TBitBtn
          Left = 91
          Top = 7
          Width = 75
          Height = 25
          Caption = '&Apagar'
          TabOrder = 2
          OnClick = Bt_ApagarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
            3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
            03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
            33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
            0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
            3333333337FFF7F3333333333000003333333333377777333333}
          NumGlyphs = 2
        end
        object Bt_Imprimir: TBitBtn
          Left = 91
          Top = 38
          Width = 75
          Height = 25
          Caption = '&Ficha'
          TabOrder = 3
          OnClick = Bt_ImprimirClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000C40E0000C40E00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888800000000000888808888888880808800000000000008080888888BBB88
            0008088888877788080800000000000008800888888888808080800000000008
            0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
            088888880FFFFFFFF08888888000000000888888888888888888}
        end
      end
      object Panel3: TPanel
        Left = 5
        Top = 17
        Width = 176
        Height = 191
        Color = 13615023
        TabOrder = 1
        object Label31: TLabel
          Left = 4
          Top = 5
          Width = 107
          Height = 13
          Caption = 'Localizar paciente por:'
        end
        object Label32: TLabel
          Left = 4
          Top = 51
          Width = 95
          Height = 13
          Caption = 'Paciente a localizar:'
        end
        object localizar_por: TComboBox
          Left = 4
          Top = 20
          Width = 168
          Height = 19
          BevelInner = bvNone
          BevelKind = bkSoft
          Style = csOwnerDrawFixed
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 0
          ParentCtl3D = False
          TabOrder = 0
          Text = 'Nome'
          Items.Strings = (
            'Nome'
            'Sobrenome'
            'Nro. Ficha'
            'RG')
        end
        object localiza_paciente: TEdit
          Left = 4
          Top = 65
          Width = 139
          Height = 19
          Ctl3D = False
          MaxLength = 160
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = localiza_pacienteKeyPress
        end
        object BT_Procura: TButton
          Left = 145
          Top = 65
          Width = 26
          Height = 19
          BiDiMode = bdLeftToRight
          Caption = '&Ok'
          ParentBiDiMode = False
          TabOrder = 2
          OnClick = BT_ProcuraClick
        end
        object paciente_lista: TDBGrid
          Left = 4
          Top = 87
          Width = 167
          Height = 99
          Ctl3D = False
          DataSource = conexaoBD.DS_Paciente
          Options = []
          ParentCtl3D = False
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = paciente_listaCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Paciente_ficha'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Paciente_nome_sobrenome'
              Visible = True
            end>
        end
      end
      object Panel4: TPanel
        Left = 5
        Top = 480
        Width = 176
        Height = 28
        Color = 13615023
        TabOrder = 2
        object Label14: TLabel
          Left = 15
          Top = 8
          Width = 91
          Height = 13
          Caption = 'Movimento de Tela'
        end
        object Button2: TButton
          Left = 114
          Top = 3
          Width = 21
          Height = 22
          Caption = '<<'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 143
          Top = 3
          Width = 21
          Height = 22
          Caption = '>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = Button3Click
        end
      end
      object Panel10: TPanel
        Left = 5
        Top = 287
        Width = 175
        Height = 189
        Color = 13615023
        TabOrder = 3
        object Label43: TLabel
          Left = 3
          Top = 2
          Width = 68
          Height = 13
          Caption = 'Telas Abertas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object tela_01: TLabel
          Left = 14
          Top = 17
          Width = 35
          Height = 13
          Caption = 'tela_01'
        end
        object tela_02: TLabel
          Left = 14
          Top = 31
          Width = 35
          Height = 13
          Caption = 'tela_02'
        end
        object tela_03: TLabel
          Left = 14
          Top = 45
          Width = 35
          Height = 13
          Caption = 'tela_03'
        end
        object tela_04: TLabel
          Left = 14
          Top = 59
          Width = 35
          Height = 13
          Caption = 'tela_04'
        end
        object tela_05: TLabel
          Left = 14
          Top = 73
          Width = 35
          Height = 13
          Caption = 'tela_05'
        end
        object tela_06: TLabel
          Left = 14
          Top = 87
          Width = 35
          Height = 13
          Caption = 'tela_06'
        end
        object tela_07: TLabel
          Left = 14
          Top = 101
          Width = 35
          Height = 13
          Caption = 'tela_07'
        end
        object tela_08: TLabel
          Left = 14
          Top = 115
          Width = 35
          Height = 13
          Caption = 'tela_08'
        end
        object tela_09: TLabel
          Left = 14
          Top = 129
          Width = 35
          Height = 13
          Caption = 'tela_09'
        end
        object tela_10: TLabel
          Left = 14
          Top = 143
          Width = 35
          Height = 13
          Caption = 'tela_10'
        end
        object tela_11: TLabel
          Left = 14
          Top = 157
          Width = 35
          Height = 13
          Caption = 'tela_11'
        end
        object tela_12: TLabel
          Left = 14
          Top = 172
          Width = 35
          Height = 13
          Caption = 'tela_12'
        end
        object ConsulTEX_Medico: TEdit
          Left = 157
          Top = 118
          Width = 10
          Height = 21
          TabOrder = 0
          Visible = False
        end
        object ConsulTEX_Acesso_Agenda: TEdit
          Left = 97
          Top = 142
          Width = 10
          Height = 21
          TabOrder = 1
          Visible = False
        end
        object ConsulTEX_Acesso_Paciente: TEdit
          Left = 109
          Top = 142
          Width = 10
          Height = 21
          TabOrder = 2
          Visible = False
        end
        object ConsulTEX_Acesso_Convenio: TEdit
          Left = 121
          Top = 142
          Width = 10
          Height = 21
          TabOrder = 3
          Visible = False
        end
        object ConsulTEX_Acesso_Indicacao: TEdit
          Left = 133
          Top = 142
          Width = 10
          Height = 21
          TabOrder = 4
          Visible = False
        end
        object ConsulTEX_Acesso_Cid: TEdit
          Left = 145
          Top = 142
          Width = 10
          Height = 21
          TabOrder = 5
          Visible = False
        end
        object ConsulTEX_Acesso_Imp_Env: TEdit
          Left = 157
          Top = 142
          Width = 10
          Height = 21
          TabOrder = 6
          Visible = False
        end
        object ConsulTEX_Acesso_Imp_Ficha: TEdit
          Left = 85
          Top = 166
          Width = 10
          Height = 21
          TabOrder = 7
          Visible = False
        end
        object ConsulTEX_Acesso_Imp_Fat: TEdit
          Left = 97
          Top = 166
          Width = 10
          Height = 21
          TabOrder = 8
          Visible = False
        end
        object ConsulTEX_Acesso_Imp_Rec: TEdit
          Left = 109
          Top = 166
          Width = 10
          Height = 21
          TabOrder = 9
          Visible = False
        end
        object ConsulTEX_Acesso_Usuario: TEdit
          Left = 121
          Top = 166
          Width = 10
          Height = 21
          TabOrder = 10
          Visible = False
        end
        object ConsulTEX_Acesso_Medico: TEdit
          Left = 133
          Top = 166
          Width = 10
          Height = 21
          TabOrder = 11
          Visible = False
        end
        object ConsulTEX_Acesso_Prontuario: TEdit
          Left = 145
          Top = 166
          Width = 10
          Height = 21
          TabOrder = 12
          Visible = False
        end
        object ConsulTEX_Acesso_Observacoes: TEdit
          Left = 157
          Top = 166
          Width = 10
          Height = 21
          TabOrder = 13
          Visible = False
        end
        object ConsulTEX_Acesso_Cirurgia: TEdit
          Left = 85
          Top = 142
          Width = 10
          Height = 21
          TabOrder = 14
          Visible = False
        end
        object ConsulTEX_Acesso_Adicionais: TEdit
          Left = 73
          Top = 142
          Width = 10
          Height = 21
          TabOrder = 15
          Visible = False
        end
        object ConsulTEX_Medico_Crm: TEdit
          Left = 145
          Top = 118
          Width = 10
          Height = 21
          TabOrder = 16
          Visible = False
        end
      end
    end
    inline Paciente1: TPaciente
      Left = 192
      Top = 0
      Width = 584
      Height = 516
      Color = 15722463
      ParentColor = False
      TabOrder = 1
    end
    inline Preferencia1: TPreferencia
      Left = 192
      Top = 0
      Width = 583
      Height = 514
      Color = 15722463
      ParentColor = False
      TabOrder = 2
    end
    inline convenio1: TConvenio
      Left = 192
      Top = 0
      Width = 584
      Height = 515
      Color = 15722463
      ParentColor = False
      TabOrder = 3
      inherited GroupBox1: TGroupBox
        inherited Panel1: TPanel
          inherited convenio_qtde_ch: TEdit
            Anchors = [akLeft, akTop, akRight]
          end
        end
      end
    end
    inline Indicacao1: TIndicacao
      Left = 192
      Top = 0
      Width = 584
      Height = 515
      Color = 15722463
      ParentColor = False
      TabOrder = 4
      inherited GroupBox1: TGroupBox
        inherited Panel1: TPanel
          inherited indicacao_email: TEdit
            Width = 487
          end
        end
      end
    end
    inline Cid2: TCid
      Left = 192
      Top = 0
      Width = 584
      Height = 515
      Color = 15722463
      ParentColor = False
      TabOrder = 5
    end
    inline Recibo1: TRecibo
      Left = 192
      Top = 0
      Width = 584
      Height = 515
      Color = 15722463
      ParentColor = False
      TabOrder = 6
    end
    inline Faturamento2: TFaturamento
      Left = 192
      Top = 0
      Width = 584
      Height = 515
      Color = 15722463
      ParentColor = False
      TabOrder = 7
    end
    inline Medico1: TMedico
      Left = 192
      Top = 0
      Width = 584
      Height = 515
      Color = 15722463
      ParentColor = False
      TabOrder = 8
    end
    inline Cirurgia2: TCirurgia
      Left = 192
      Top = 0
      Width = 584
      Height = 515
      Color = 15722463
      ParentColor = False
      TabOrder = 9
      Visible = False
    end
    inline Adicionais2: TAdicionais
      Left = 192
      Top = 0
      Width = 584
      Height = 515
      Color = 15722463
      ParentColor = False
      TabOrder = 10
      Visible = False
    end
  end
  object MainMenu1: TMainMenu
    Left = 3
    Top = 2
    object Agenda2: TMenuItem
      Caption = '&Agenda'
      Hint = 'Marcar Hor'#225'rio | Marcar Hor'#225'rio'
      OnClick = Agenda2Click
    end
    object Cadastro1: TMenuItem
      Caption = '&Cadastro'
      object Adicionais1: TMenuItem
        Caption = 'Adicionai&s'
        OnClick = Adicionais1Click
      end
      object Cirurgia1: TMenuItem
        Caption = 'Cir&urgia'
        OnClick = Cirurgia1Click
      end
      object Convnio1: TMenuItem
        Caption = 'C&onv'#234'nio'
        OnClick = Convnio1Click
      end
      object Indicao1: TMenuItem
        Caption = '&Indica'#231#227'o'
        OnClick = Indicao1Click
      end
      object CID1: TMenuItem
        Caption = 'CI&D'
        OnClick = CID1Click
      end
    end
    object Relatrio1: TMenuItem
      Caption = '&Imprimir'
      object EnvelopedoPaciente1: TMenuItem
        Caption = '&Envelope do Paciente'
        OnClick = EnvelopedoPaciente1Click
      end
      object FichadoPaciente1: TMenuItem
        AutoLineReduction = maAutomatic
        Caption = '&Ficha do Paciente'
        OnClick = FichadoPaciente1Click
      end
      object Separador: TMenuItem
        Caption = '-'
      end
      object Etiquetas1: TMenuItem
        Caption = 'E&tiquetas'
        OnClick = Etiquetas1Click
      end
      object Faturamento1: TMenuItem
        Caption = 'F&aturamento'
        OnClick = Faturamento1Click
      end
      object ControledeRecibos1: TMenuItem
        Caption = '&Controle de Recibos'
        OnClick = ControledeRecibos1Click
      end
      object ControledePagamentos1: TMenuItem
        Caption = 'Controle de &Pagamentos'
        OnClick = ControledePagamentos1Click
      end
      object ListaGeraldosPacientes1: TMenuItem
        Caption = '&Lista Geral dos Pacientes'
        OnClick = ListaGeraldosPacientes1Click
      end
    end
    object Preferncias1: TMenuItem
      Caption = '&Prefer'#234'ncias'
      object Trocar1: TMenuItem
        Caption = '&Trocar M'#233'dico Ativo'
        OnClick = Trocar1Click
      end
      object PrefernciasdoUsuario1: TMenuItem
        Caption = 'Prefer'#234'ncias do &Usu'#225'rio'
        OnClick = PrefernciasdoUsuario1Click
      end
      object CadastrodoMdico1: TMenuItem
        Caption = 'Dados dos &M'#233'dicos'
        OnClick = CadastrodoMdico1Click
      end
    end
    object BackupReparao1: TMenuItem
      Caption = '&Backup / Repara'#231#227'o'
      OnClick = BackupReparao1Click
    end
    object Ajuda1: TMenuItem
      Caption = 'Aj&uda'
      object Sobre1: TMenuItem
        Caption = 'S&obre'
        OnClick = Sobre1Click
      end
      object Como1: TMenuItem
        Caption = '&Como utilizar o ConsulTEX'
        OnClick = Como1Click
      end
    end
    object Sair1: TMenuItem
      Caption = '&Sair'
      OnClick = Sair1Click
    end
  end
end
