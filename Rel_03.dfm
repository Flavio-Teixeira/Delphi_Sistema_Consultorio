object Recibo: TRecibo
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
    Caption = '   Controle de Recibos   '
    TabOrder = 0
    object Panel1: TPanel
      Left = 31
      Top = 27
      Width = 519
      Height = 341
      Color = 13615023
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      object Label6: TLabel
        Left = 30
        Top = 33
        Width = 80
        Height = 13
        Caption = 'Data de Emiss'#227'o'
      end
      object Label7: TLabel
        Left = 30
        Top = 83
        Width = 88
        Height = 13
        Caption = 'Nome do Paciente'
      end
      object Label8: TLabel
        Left = 30
        Top = 130
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label9: TLabel
        Left = 30
        Top = 178
        Width = 66
        Height = 13
        Caption = 'Discrimina'#231#227'o'
      end
      object Label10: TLabel
        Left = 30
        Top = 286
        Width = 129
        Height = 13
        Caption = 'Assinatura do Respons'#225'vel'
      end
      object Panel3: TPanel
        Left = 3
        Top = 3
        Width = 70
        Height = 25
        Color = 13615023
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 6
          Width = 60
          Height = 14
          Alignment = taCenter
          AutoSize = False
          Caption = 'Recibo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object recibo_data_emissao: TMaskEdit
        Left = 30
        Top = 48
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '99/99/9999;1; '
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        Text = '  /  /    '
        OnKeyPress = recibo_data_emissaoKeyPress
      end
      object recibo_paciente_nome: TEdit
        Left = 30
        Top = 98
        Width = 400
        Height = 19
        Ctl3D = False
        MaxLength = 160
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = recibo_paciente_nomeKeyPress
      end
      object recibo_valor: TEdit
        Left = 30
        Top = 145
        Width = 70
        Height = 19
        BiDiMode = bdLeftToRight
        Ctl3D = False
        MaxLength = 15
        ParentBiDiMode = False
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = recibo_valorKeyPress
      end
      object recibo_discriminacao: TMemo
        Left = 30
        Top = 193
        Width = 459
        Height = 82
        Ctl3D = False
        MaxLength = 489
        ParentCtl3D = False
        TabOrder = 4
      end
      object recibo_assinatura: TEdit
        Left = 30
        Top = 301
        Width = 369
        Height = 19
        Ctl3D = False
        MaxLength = 160
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = recibo_assinaturaKeyPress
      end
      object BT_recibo_imprimir: TButton
        Left = 409
        Top = 308
        Width = 103
        Height = 25
        Caption = 'Imprimir &Recibo'
        TabOrder = 6
        OnClick = BT_recibo_imprimirClick
      end
      object recibo_paciente_ficha: TEdit
        Left = 449
        Top = 97
        Width = 10
        Height = 21
        TabOrder = 7
        Visible = False
      end
      object recibo_paciente_nome_ant: TEdit
        Left = 460
        Top = 97
        Width = 10
        Height = 21
        TabOrder = 8
        Visible = False
      end
    end
    object Panel2: TPanel
      Left = 31
      Top = 381
      Width = 259
      Height = 119
      Color = 13615023
      TabOrder = 1
      object Label3: TLabel
        Left = 6
        Top = 36
        Width = 41
        Height = 13
        Caption = 'Per'#237'odo:'
      end
      object Label4: TLabel
        Left = 26
        Top = 58
        Width = 14
        Height = 13
        Caption = 'De'
      end
      object Label5: TLabel
        Left = 131
        Top = 58
        Width = 15
        Height = 13
        Caption = 'at'#233
      end
      object Panel4: TPanel
        Left = 3
        Top = 3
        Width = 124
        Height = 25
        Color = 13615023
        TabOrder = 0
        object Label2: TLabel
          Left = 13
          Top = 6
          Width = 98
          Height = 13
          Caption = 'Recibos Emitidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object recibo_inicio: TMaskEdit
        Left = 54
        Top = 55
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '99/99/9999;1; '
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        Text = '  /  /    '
        OnKeyPress = recibo_inicioKeyPress
      end
      object recibo_final: TMaskEdit
        Left = 158
        Top = 55
        Width = 65
        Height = 19
        Ctl3D = False
        EditMask = '99/99/9999;1; '
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 2
        Text = '  /  /    '
        OnKeyPress = recibo_finalKeyPress
      end
      object BT_recibo_emitido_imprimir: TButton
        Left = 77
        Top = 87
        Width = 100
        Height = 25
        Caption = '&Imprimir Controle'
        TabOrder = 3
        OnClick = BT_recibo_emitido_imprimirClick
      end
    end
    object Button1: TButton
      Left = 561
      Top = 9
      Width = 15
      Height = 15
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
    object Panel5: TPanel
      Left = 304
      Top = 381
      Width = 245
      Height = 119
      Color = 13615023
      TabOrder = 3
      object Label12: TLabel
        Left = 16
        Top = 37
        Width = 89
        Height = 13
        Caption = 'N'#250'mero do Recibo'
      end
      object Panel6: TPanel
        Left = 3
        Top = 3
        Width = 124
        Height = 25
        Color = 13615023
        TabOrder = 0
        object Label11: TLabel
          Left = 18
          Top = 6
          Width = 91
          Height = 13
          Caption = 'Apagar Recibos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object BT_recibo_apagar: TButton
        Left = 76
        Top = 87
        Width = 100
        Height = 25
        Caption = '&Apagar'
        TabOrder = 1
        OnClick = BT_recibo_apagarClick
      end
      object recibo_apagar: TEdit
        Left = 16
        Top = 51
        Width = 214
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = recibo_apagarKeyPress
      end
    end
  end
end
