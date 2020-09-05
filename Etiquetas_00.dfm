object Etiquetas00: TEtiquetas00
  Left = 286
  Top = 156
  BorderStyle = bsDialog
  Caption = 'Etiquetas'
  ClientHeight = 184
  ClientWidth = 264
  Color = clBtnFace
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
    Left = 8
    Top = 136
    Width = 248
    Height = 40
    TabOrder = 0
    object btnImprimir: TBitBtn
      Left = 88
      Top = 8
      Width = 72
      Height = 24
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = btnImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object btnSair: TBitBtn
      Left = 168
      Top = 8
      Width = 72
      Height = 24
      Caption = '&Sair'
      TabOrder = 1
      OnClick = btnSairClick
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 248
    Height = 120
    Caption = '   Op'#231#245'es De Impress'#227'o   '
    TabOrder = 1
    object Label1: TLabel
      Left = 192
      Top = 91
      Width = 24
      Height = 15
      AutoSize = False
      Caption = ' Dias'
    end
    object rbTodos: TRadioButton
      Left = 16
      Top = 16
      Width = 144
      Height = 21
      Caption = 'Todos os pacientes'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbTodosClick
    end
    object rbNumero_Ficha: TRadioButton
      Left = 16
      Top = 40
      Width = 112
      Height = 21
      Caption = 'N'#250'mero da ficha'
      TabOrder = 1
      OnClick = rbNumero_FichaClick
    end
    object rbAniversario_Mes: TRadioButton
      Left = 16
      Top = 64
      Width = 112
      Height = 21
      Caption = 'Anivers'#225'rio no m'#234's'
      TabOrder = 2
      OnClick = rbAniversario_MesClick
    end
    object rbUltima_Consulta: TRadioButton
      Left = 16
      Top = 88
      Width = 144
      Height = 21
      Caption = #218'ltima consulta a mais de'
      TabOrder = 3
      OnClick = rbUltima_ConsultaClick
    end
    object edtNumero_Ficha: TEdit
      Left = 136
      Top = 40
      Width = 48
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 10
      ParentCtl3D = False
      TabOrder = 4
      Text = '0'
    end
    object cbbMes: TComboBox
      Left = 136
      Top = 64
      Width = 80
      Height = 21
      BevelInner = bvSpace
      BevelKind = bkFlat
      Style = csDropDownList
      Ctl3D = False
      Enabled = False
      ItemHeight = 13
      ItemIndex = 0
      ParentCtl3D = False
      TabOrder = 5
      Text = 'Janeiro'
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object edtDias: TEdit
      Left = 160
      Top = 88
      Width = 32
      Height = 19
      Ctl3D = False
      Enabled = False
      MaxLength = 4
      ParentCtl3D = False
      TabOrder = 6
      Text = '0'
      OnKeyPress = edtDiasKeyPress
    end
  end
end
