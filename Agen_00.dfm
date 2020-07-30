object Agenda: TAgenda
  Left = 275
  Top = 153
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'AGENDA    ConsulTEX - Gerenciamento de Consult'#243'rios'
  ClientHeight = 542
  ClientWidth = 785
  Color = 13615023
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 21
    Width = 22
    Height = 13
    Caption = 'Dia: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object dia_horario: TLabel
    Left = 26
    Top = 21
    Width = 25
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = '99'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 54
    Top = 21
    Width = 12
    Height = 13
    Caption = 'de'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object mes_horario: TLabel
    Left = 70
    Top = 21
    Width = 64
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'xxxxxxxx'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 136
    Top = 21
    Width = 12
    Height = 13
    Caption = 'de'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ano_horario: TLabel
    Left = 152
    Top = 21
    Width = 29
    Height = 13
    AutoSize = False
    Caption = '9999'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 4
    Top = 3
    Width = 69
    Height = 13
    Caption = 'Hor'#225'rios do(a):'
  end
  object Agenda_Exibe_Medico: TLabel
    Left = 79
    Top = 3
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 578
    Top = 1
    Width = 209
    Height = 541
    BorderStyle = bsSingle
    Color = 15722463
    TabOrder = 1
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 201
      Height = 163
      BorderStyle = bsSingle
      Color = 13615023
      TabOrder = 0
      object Calendario: TMonthCalendar
        Left = 3
        Top = 2
        Width = 191
        Height = 153
        BorderWidth = 1
        CalColors.TitleBackColor = 13615023
        Date = 38869.590204895830000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = CalendarioClick
      end
    end
    object Panel3: TPanel
      Left = 3
      Top = 166
      Width = 198
      Height = 306
      Color = 15722463
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label4: TLabel
        Left = 8
        Top = 3
        Width = 23
        Height = 13
        Caption = 'Hora'
      end
      object Label5: TLabel
        Left = 86
        Top = 2
        Width = 21
        Height = 13
        Caption = 'Tipo'
      end
      object Label6: TLabel
        Left = 8
        Top = 105
        Width = 107
        Height = 13
        Caption = 'Descri'#231#227'o  /  Paciente'
      end
      object Label7: TLabel
        Left = 8
        Top = 208
        Width = 30
        Height = 13
        Caption = 'Status'
      end
      object Label8: TLabel
        Left = 8
        Top = 242
        Width = 45
        Height = 13
        Caption = 'Conv'#234'nio'
      end
      object Label9: TLabel
        Left = 8
        Top = 71
        Width = 63
        Height = 13
        Caption = 'Localizar por:'
      end
      object Label10: TLabel
        Left = 8
        Top = 37
        Width = 74
        Height = 13
        Caption = 'Tipo da Cirurgia'
      end
      object Label11: TLabel
        Left = 99
        Top = 37
        Width = 93
        Height = 13
        Caption = 'Vlr. Material Cirurgia'
      end
      object Label12: TLabel
        Left = 100
        Top = 70
        Width = 63
        Height = 13
        Caption = 'Observa'#231#245'es'
      end
      object horario_tipo: TComboBox
        Left = 86
        Top = 16
        Width = 107
        Height = 21
        BevelInner = bvNone
        BevelKind = bkSoft
        Ctl3D = False
        ItemHeight = 13
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = horario_tipoKeyPress
        OnSelect = horario_tipoSelect
        Items.Strings = (
          'Consulta'
          'Retorno'
          'Cirurgia'
          'Resultado Exame'
          'Adicional')
      end
      object horario_hora: TMaskEdit
        Left = 8
        Top = 17
        Width = 36
        Height = 19
        Ctl3D = False
        EditMask = '99:99;1; '
        MaxLength = 5
        ParentCtl3D = False
        TabOrder = 0
        Text = '  :  '
        OnKeyPress = horario_horaKeyPress
      end
      object horario_descricao: TEdit
        Left = 8
        Top = 119
        Width = 144
        Height = 19
        Ctl3D = False
        MaxLength = 160
        ParentCtl3D = False
        TabOrder = 6
        OnKeyPress = horario_descricaoKeyPress
      end
      object horario_procura: TButton
        Left = 154
        Top = 119
        Width = 36
        Height = 19
        Caption = '&Ok'
        TabOrder = 7
        OnClick = horario_procuraClick
      end
      object horario_status: TComboBox
        Left = 8
        Top = 221
        Width = 107
        Height = 21
        BevelInner = bvNone
        BevelKind = bkSoft
        Ctl3D = False
        ItemHeight = 13
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 9
        OnKeyPress = horario_statusKeyPress
        Items.Strings = (
          'Marcado'
          'Atendido'
          'Aguardando'
          'Em Consulta'
          'Em Cirurgia'
          'N'#227'o Compareceu')
      end
      object horario_paciente_lista: TDBGrid
        Left = 8
        Top = 140
        Width = 182
        Height = 67
        Ctl3D = False
        DataSource = conexaoBD.DS_Paciente_AG
        Options = []
        ParentCtl3D = False
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = horario_paciente_listaCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Paciente_ficha'
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Paciente_nome_sobrenome'
            ReadOnly = True
            Visible = True
          end>
      end
      object horario_convenio: TComboBox
        Left = 8
        Top = 255
        Width = 182
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        MaxLength = 40
        ParentCtl3D = False
        TabOrder = 10
        OnKeyPress = horario_convenioKeyPress
      end
      object horario_localiza: TComboBox
        Left = 8
        Top = 84
        Width = 85
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 4
        Text = 'Nome'
        OnKeyPress = horario_localizaKeyPress
        Items.Strings = (
          'Nome'
          'Sobrenome'
          'Nro. Ficha')
      end
      object DB_agenda_hora: TDBEdit
        Left = 116
        Top = 233
        Width = 10
        Height = 21
        DataField = 'Agenda_hora'
        DataSource = conexaoBD.DS_Agenda
        TabOrder = 13
        Visible = False
      end
      object DB_agenda_ficha: TDBEdit
        Left = 126
        Top = 233
        Width = 10
        Height = 21
        DataField = 'Agenda_ficha'
        DataSource = conexaoBD.DS_Agenda
        TabOrder = 14
        Visible = False
      end
      object DB_agenda_descricao: TDBEdit
        Left = 136
        Top = 233
        Width = 10
        Height = 21
        DataField = 'Agenda_descricao'
        DataSource = conexaoBD.DS_Agenda
        TabOrder = 15
        Visible = False
      end
      object DB_agenda_tipo: TDBEdit
        Left = 145
        Top = 233
        Width = 10
        Height = 21
        DataField = 'Agenda_tipo'
        DataSource = conexaoBD.DS_Agenda
        TabOrder = 16
        Visible = False
      end
      object DB_agenda_status: TDBEdit
        Left = 154
        Top = 233
        Width = 10
        Height = 21
        DataField = 'Agenda_status'
        DataSource = conexaoBD.DS_Agenda
        TabOrder = 17
        Visible = False
      end
      object DB_agenda_convenio: TDBEdit
        Left = 164
        Top = 233
        Width = 10
        Height = 21
        DataField = 'Agenda_convenio'
        DataSource = conexaoBD.DS_Agenda
        TabOrder = 18
        Visible = False
      end
      object DB_agenda_descricao_convenio: TDBEdit
        Left = 174
        Top = 233
        Width = 10
        Height = 21
        DataField = 'Agenda_descricao_convenio'
        DataSource = conexaoBD.DS_Agenda
        TabOrder = 19
        Visible = False
      end
      object horario_ficha_nro: TEdit
        Left = 116
        Top = 209
        Width = 10
        Height = 21
        TabOrder = 20
        Visible = False
      end
      object horario_convenio_nro: TEdit
        Left = 126
        Top = 209
        Width = 10
        Height = 21
        TabOrder = 21
        Visible = False
      end
      object DB_paciente_ficha_AG: TDBEdit
        Left = 136
        Top = 209
        Width = 10
        Height = 21
        DataField = 'paciente_ficha'
        DataSource = conexaoBD.DS_Paciente_AG
        TabOrder = 22
        Visible = False
      end
      object DB_paciente_nome_sobrenome_AG: TDBEdit
        Left = 146
        Top = 209
        Width = 10
        Height = 21
        DataField = 'paciente_nome_sobrenome'
        DataSource = conexaoBD.DS_Paciente_AG
        TabOrder = 23
        Visible = False
      end
      object horario_adicionais: TBitBtn
        Left = 64
        Top = 277
        Width = 87
        Height = 25
        Caption = 'A&dicionais'
        TabOrder = 12
        OnClick = horario_adicionaisClick
        Glyph.Data = {
          0E030000424D0E030000000000003600000028000000110000000E0000000100
          180000000000D8020000C30E0000C30E00000000000000000000BFBFBFBFBFBF
          BFBFBFBFBFBF000000000000000000000000000000000000000000000000BFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBF7F7F7FBFBFBF00FFFF
          BFBFBFBFBFBF0000007F7F7F7F7F7F7F7F7F000000000000BFBFBFBFBFBFBFBF
          BF00BFBFBFBFBFBFBFBFBF7F7F7FFFFFFFFFFFFFFFFFFF00FFFFFFFFFF000000
          00FFFFBFBFBF7F7F7F7F7F7F000000BFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBF
          BFBF7F7F7F00FFFFFFFFFFFFFFFFFFFFFF00FFFF000000FFFFFF00FFFFBFBFBF
          7F7F7F000000BFBFBF00BFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFFFFFFFFFF00
          FFFFFFFFFFFFFFFF000000FFFFFF0000000000007F7F7F000000BFBFBF00BFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFFFFFFFFFFFFFFFF00FFFF7F7F7F00
          0000FFFFFF00FFFFBFBFBF000000BFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BF00000000000000FFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFBFBFBF00
          0000BFBFBF00BFBFBF000000000000BFBFBF0000007F7F007F7F00000000FFFF
          FF00FFFFFFFFFFFFFFFFFFFFFF00FFFFBFBFBF000000BFBFBF000000007F7F00
          7F7F000000000000000000007F7F00000000FFFFFFFFFFFFFFFFFF00FFFFFFFF
          FFFFFFFFBFBFBF000000BFBFBF00000000FFFF007F7F00000000FFFF00000000
          7F7F00000000000000000000FFFFFFFFFFFFFFFFFF00FFFFBFBFBF000000BFBF
          BF00000000FFFF00FFFF00000000000000FFFF00FFFF00000000FFFFFFFFFFFF
          FFFFFF00FFFFFFFFFFFFFFFFBFBFBF000000BFBFBF00BFBFBF000000000000BF
          BFBFBFBFBF000000000000FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF00FFFF
          BFBFBF000000BFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FFFFFFF00
          FFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFBFBFBF000000BFBFBF00BFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F000000BFBFBF00}
      end
      object horario_atualizar: TBitBtn
        Left = 8
        Top = 277
        Width = 27
        Height = 25
        Hint = 'Atualizar os Hor'#225'rios'
        TabOrder = 11
        OnClick = horario_atualizarClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000014000000120000000100
          040000000000D8000000CE0E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777888888
          7777777700007487784444448877777700007448844444444487777700007444
          444CCCCC444877770000744444C77777C444877700007444447777777C448777
          00007444444777777C88877700007CCCCCCC7777777777770000777777777777
          7777777700007777777777778888887700007C888777777C4444487700007C44
          87777777C4444877000077C44877777884444877000077C44488888444444877
          0000777C4444444444CC487700007777CC444444CC77C7770000777777CCCCCC
          777777770000777777777777777777770000}
      end
      object horario_tipo_cirurgia: TComboBox
        Left = 8
        Top = 51
        Width = 85
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        Enabled = False
        ItemHeight = 13
        MaxLength = 40
        ParentCtl3D = False
        TabOrder = 2
        OnSelect = horario_tipo_cirurgiaSelect
      end
      object DB_agenda_tipo_cirurgia: TDBEdit
        Left = 156
        Top = 209
        Width = 10
        Height = 21
        DataField = 'Agenda_tipo_cirurgia'
        DataSource = conexaoBD.DS_Agenda
        TabOrder = 24
        Visible = False
      end
      object horario_adicional_incluido: TEdit
        Left = 166
        Top = 209
        Width = 10
        Height = 21
        TabOrder = 25
        Visible = False
      end
      object DB_agenda_identifica_adicional: TDBEdit
        Left = 176
        Top = 209
        Width = 10
        Height = 21
        DataField = 'Agenda_identifica_adicional'
        DataSource = conexaoBD.DS_Agenda
        TabOrder = 26
        Visible = False
      end
      object horario_cirurgia_descricao: TEdit
        Left = 152
        Top = 277
        Width = 10
        Height = 21
        TabOrder = 27
        Visible = False
      end
      object horario_quantidade_ch: TEdit
        Left = 161
        Top = 277
        Width = 10
        Height = 21
        TabOrder = 28
        Visible = False
      end
      object horario_valor_ch: TEdit
        Left = 170
        Top = 277
        Width = 10
        Height = 21
        TabOrder = 29
        Visible = False
      end
      object horario_material: TEdit
        Left = 99
        Top = 51
        Width = 94
        Height = 19
        Ctl3D = False
        Enabled = False
        MaxLength = 160
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = horario_materialKeyPress
      end
      object horario_observacao: TEdit
        Left = 99
        Top = 84
        Width = 94
        Height = 19
        Ctl3D = False
        MaxLength = 30
        ParentCtl3D = False
        TabOrder = 5
      end
      object DB_agenda_valor_material_cirurgia: TDBEdit
        Left = 184
        Top = 233
        Width = 10
        Height = 21
        DataField = 'Agenda_valor_material_cirurgia'
        DataSource = conexaoBD.DS_Agenda
        TabOrder = 30
        Visible = False
      end
      object DB_agenda_observacao: TDBEdit
        Left = 186
        Top = 209
        Width = 10
        Height = 21
        DataField = 'Agenda_observacao'
        DataSource = conexaoBD.DS_Agenda
        TabOrder = 31
        Visible = False
      end
      object horario_valor_cirurgia: TEdit
        Left = 179
        Top = 277
        Width = 10
        Height = 21
        TabOrder = 32
        Visible = False
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 475
      Width = 198
      Height = 58
      Color = 13615023
      TabOrder = 2
      object horario_novo: TBitBtn
        Left = 12
        Top = 3
        Width = 87
        Height = 25
        Caption = '&Novo'
        TabOrder = 0
        OnClick = horario_novoClick
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
      object horario_apagar: TBitBtn
        Left = 101
        Top = 3
        Width = 87
        Height = 25
        Caption = '&Apagar'
        TabOrder = 1
        OnClick = horario_apagarClick
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
      object horario_gravar: TBitBtn
        Left = 12
        Top = 30
        Width = 87
        Height = 25
        Caption = '&Gravar'
        TabOrder = 2
        OnClick = horario_gravarClick
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
      object horario_imprimir: TBitBtn
        Left = 101
        Top = 30
        Width = 87
        Height = 25
        Caption = '&Hor'#225'rio'
        TabOrder = 3
        OnClick = horario_imprimirClick
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
  end
  object GRD_Horario: TDBGrid
    Left = 0
    Top = 35
    Width = 579
    Height = 506
    Ctl3D = False
    DataSource = conexaoBD.DS_Agenda
    FixedColor = 13615023
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnCellClick = GRD_HorarioCellClick
    OnTitleClick = GRD_HorarioTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Agenda_hora'
        ReadOnly = True
        Title.Caption = 'Hora'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Agenda_descricao'
        ReadOnly = True
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Agenda_tipo'
        ReadOnly = True
        Title.Caption = 'Tipo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Agenda_observacao'
        ReadOnly = True
        Title.Caption = 'Observa'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Agenda_tipo_cirurgia'
        ReadOnly = True
        Title.Caption = 'Cod.Cirurgia'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Agenda_status'
        ReadOnly = True
        Title.Caption = 'Status'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Agenda_descricao_convenio'
        ReadOnly = True
        Title.Caption = 'Conv'#234'nio'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Agenda_pago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ReadOnly = True
        Title.Caption = 'Pago'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 31
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Agenda_identifica_adicional'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Item Adicional'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 96
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Agenda_valor_adicional'
        Title.Alignment = taRightJustify
        Title.Caption = 'Vlr. Adicional'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 71
        Visible = True
      end>
  end
  object Agenda_Medico: TEdit
    Left = 535
    Top = 3
    Width = 10
    Height = 21
    TabOrder = 2
    Visible = False
  end
  object Agenda_Medico_Crm: TEdit
    Left = 523
    Top = 3
    Width = 10
    Height = 21
    TabOrder = 3
    Visible = False
  end
  object Atualiza_Agenda: TTimer
    Interval = 360000
    OnTimer = Atualiza_AgendaTimer
    Left = 549
  end
end
