object ListaGeralPacientes00: TListaGeralPacientes00
  Left = 563
  Top = 156
  BorderStyle = bsDialog
  Caption = 'Lista Geral dos Pacientes'
  ClientHeight = 128
  ClientWidth = 224
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
    Top = 80
    Width = 208
    Height = 40
    TabOrder = 1
    object btnImprimir: TBitBtn
      Left = 16
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
      Left = 120
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
    Width = 208
    Height = 64
    TabOrder = 0
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
    object rbPelaLetra: TRadioButton
      Left = 16
      Top = 32
      Width = 148
      Height = 21
      Caption = 'Apenas as fichas pela letra'
      TabOrder = 1
      OnClick = rbPelaLetraClick
    end
    object edtLetra: TEdit
      Left = 176
      Top = 33
      Width = 16
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      Enabled = False
      MaxLength = 1
      ParentCtl3D = False
      TabOrder = 2
      OnChange = edtLetraChange
      OnKeyPress = edtLetraKeyPress
    end
  end
end
