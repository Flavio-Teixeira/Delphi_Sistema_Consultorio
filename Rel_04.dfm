object Faturamento: TFaturamento
  Left = 0
  Top = 0
  Width = 584
  Height = 515
  Color = 15722463
  ParentColor = False
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 0
    Top = 1
    Width = 582
    Height = 513
    Caption = '   Faturamento   '
    TabOrder = 0
    object Button1: TButton
      Left = 561
      Top = 10
      Width = 15
      Height = 15
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Panel1: TPanel
      Left = 111
      Top = 86
      Width = 376
      Height = 341
      Color = 13615023
      TabOrder = 1
      object Label1: TLabel
        Left = 28
        Top = 11
        Width = 44
        Height = 13
        Caption = 'Per'#237'odo: '
      end
      object Label2: TLabel
        Left = 89
        Top = 11
        Width = 14
        Height = 13
        Caption = 'De'
      end
      object Label3: TLabel
        Left = 200
        Top = 12
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Label4: TLabel
        Left = 28
        Top = 48
        Width = 45
        Height = 13
        Caption = 'Conv'#234'nio'
      end
      object faturamento_inicio: TMaskEdit
        Left = 119
        Top = 8
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '99/99/9999;1; '
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        Text = '  /  /    '
        OnExit = faturamento_inicioExit
        OnKeyPress = faturamento_inicioKeyPress
      end
      object faturamento_final: TMaskEdit
        Left = 232
        Top = 8
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '99/99/9999;1; '
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        Text = '  /  /    '
        OnExit = faturamento_finalExit
        OnKeyPress = faturamento_finalKeyPress
      end
      object faturamento_convenio: TComboBox
        Left = 28
        Top = 62
        Width = 269
        Height = 21
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csDropDownList
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = faturamento_convenioKeyPress
      end
      object GroupBox2: TGroupBox
        Left = 28
        Top = 94
        Width = 321
        Height = 217
        Caption = '   Resultado   '
        TabOrder = 4
        object Label5: TLabel
          Left = 6
          Top = 30
          Width = 49
          Height = 13
          Caption = 'Consultas:'
        end
        object Label6: TLabel
          Left = 6
          Top = 57
          Width = 43
          Height = 13
          Caption = 'Cirurgias:'
        end
        object Label7: TLabel
          Left = 75
          Top = 14
          Width = 26
          Height = 13
          Caption = 'Qtde.'
        end
        object Label8: TLabel
          Left = 122
          Top = 30
          Width = 25
          Height = 13
          Caption = '   X   '
        end
        object Label9: TLabel
          Left = 122
          Top = 56
          Width = 25
          Height = 13
          Caption = '   X   '
        end
        object Label10: TLabel
          Left = 168
          Top = 14
          Width = 21
          Height = 13
          Caption = 'C.H.'
        end
        object Label11: TLabel
          Left = 213
          Top = 30
          Width = 24
          Height = 13
          Caption = '   =   '
        end
        object Label12: TLabel
          Left = 213
          Top = 56
          Width = 24
          Height = 13
          Caption = '   =   '
        end
        object Label13: TLabel
          Left = 255
          Top = 14
          Width = 24
          Height = 13
          Caption = 'Total'
        end
        object Label14: TLabel
          Left = 221
          Top = 127
          Width = 93
          Height = 13
          Caption = '-------------------------------'
        end
        object Label15: TLabel
          Left = 303
          Top = 110
          Width = 9
          Height = 13
          Caption = ' +'
        end
        object Label16: TLabel
          Left = 153
          Top = 148
          Width = 52
          Height = 13
          Caption = 'Total Geral'
        end
        object Label17: TLabel
          Left = 6
          Top = 84
          Width = 51
          Height = 13
          Caption = 'Adicionais:'
        end
        object Label18: TLabel
          Left = 213
          Top = 83
          Width = 24
          Height = 13
          Caption = '   =   '
        end
        object Label19: TLabel
          Left = 6
          Top = 111
          Width = 103
          Height = 13
          Caption = 'Material das Cirurgias:'
        end
        object Label20: TLabel
          Left = 213
          Top = 110
          Width = 24
          Height = 13
          Caption = '   =   '
        end
        object faturamento_consulta_qtde: TEdit
          Left = 59
          Top = 27
          Width = 60
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = faturamento_consulta_qtdeKeyPress
        end
        object faturamento_cirurgia_qtde: TEdit
          Left = 59
          Top = 53
          Width = 60
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          OnKeyPress = faturamento_cirurgia_qtdeKeyPress
        end
        object faturamento_consulta_ch: TEdit
          Left = 150
          Top = 27
          Width = 60
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = faturamento_consulta_chKeyPress
        end
        object faturamento_cirurgia_ch: TEdit
          Left = 150
          Top = 53
          Width = 60
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 3
          OnKeyPress = faturamento_cirurgia_chKeyPress
        end
        object faturamento_total_consulta: TEdit
          Left = 240
          Top = 27
          Width = 60
          Height = 19
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          TabOrder = 8
          OnKeyPress = faturamento_total_consultaKeyPress
        end
        object faturamento_total_cirurgia: TEdit
          Left = 240
          Top = 53
          Width = 60
          Height = 19
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          TabOrder = 9
          OnKeyPress = faturamento_total_cirurgiaKeyPress
        end
        object faturamento_total_geral: TEdit
          Left = 238
          Top = 144
          Width = 60
          Height = 19
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          TabOrder = 10
          OnKeyPress = faturamento_total_geralKeyPress
        end
        object BT_Recalcular: TBitBtn
          Left = 6
          Top = 187
          Width = 100
          Height = 25
          Caption = '&Recalcular'
          TabOrder = 5
          OnClick = BT_RecalcularClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
            73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
            0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
            0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
            0333337F777777737F333308888888880333337F333333337F33330888888888
            03333373FFFFFFFF733333700000000073333337777777773333}
          NumGlyphs = 2
        end
        object BT_Imprimir: TBitBtn
          Left = 111
          Top = 187
          Width = 100
          Height = 25
          Caption = '&Faturamento'
          TabOrder = 6
          OnClick = BT_ImprimirClick
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
        object faturamento_adicionais_qtde: TEdit
          Left = 59
          Top = 80
          Width = 60
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
          OnKeyPress = faturamento_cirurgia_qtdeKeyPress
        end
        object faturamento_total_adicionais: TEdit
          Left = 240
          Top = 80
          Width = 60
          Height = 19
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          TabOrder = 11
          OnKeyPress = faturamento_total_cirurgiaKeyPress
        end
        object BT_Detalhado: TBitBtn
          Left = 216
          Top = 187
          Width = 100
          Height = 25
          Caption = '&Detalhamento'
          TabOrder = 7
          OnClick = BT_DetalhadoClick
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
        object faturamento_total_material: TEdit
          Left = 240
          Top = 107
          Width = 60
          Height = 19
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          TabOrder = 12
          OnKeyPress = faturamento_total_cirurgiaKeyPress
        end
      end
      object BT_Calcular: TBitBtn
        Left = 302
        Top = 60
        Width = 68
        Height = 25
        Caption = '&Calcular'
        TabOrder = 3
        OnClick = BT_CalcularClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        NumGlyphs = 2
      end
    end
  end
end
