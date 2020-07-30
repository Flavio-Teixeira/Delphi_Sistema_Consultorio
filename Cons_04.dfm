object Convenio: TConvenio
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
    Caption = '   Conv'#234'nios   '
    TabOrder = 0
    object Button1: TButton
      Left = 563
      Top = 8
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
      Left = 14
      Top = 170
      Width = 554
      Height = 330
      BorderStyle = bsSingle
      Color = 13615023
      TabOrder = 2
      object Label1: TLabel
        Left = 4
        Top = 1
        Width = 63
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object Label2: TLabel
        Left = 3
        Top = 35
        Width = 71
        Height = 13
        Caption = 'Nome Fantasia'
      end
      object Label3: TLabel
        Left = 4
        Top = 68
        Width = 35
        Height = 13
        Caption = 'Apelido'
      end
      object Label4: TLabel
        Left = 3
        Top = 102
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label5: TLabel
        Left = 307
        Top = 102
        Width = 64
        Height = 13
        Caption = 'Complemento'
      end
      object Label6: TLabel
        Left = 3
        Top = 136
        Width = 27
        Height = 13
        Caption = 'Bairro'
      end
      object Label7: TLabel
        Left = 253
        Top = 137
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label8: TLabel
        Left = 502
        Top = 136
        Width = 20
        Height = 13
        Caption = 'U.F.'
      end
      object Label9: TLabel
        Left = 3
        Top = 169
        Width = 30
        Height = 13
        Caption = 'C.E.P.'
      end
      object Label10: TLabel
        Left = 68
        Top = 169
        Width = 90
        Height = 13
        Caption = 'Setor Respons'#225'vel'
      end
      object Label11: TLabel
        Left = 3
        Top = 202
        Width = 33
        Height = 13
        Caption = 'Fone 1'
      end
      object Label12: TLabel
        Left = 186
        Top = 202
        Width = 33
        Height = 13
        Caption = 'Fone 2'
      end
      object Label13: TLabel
        Left = 368
        Top = 202
        Width = 20
        Height = 13
        Caption = 'FAX'
      end
      object Label14: TLabel
        Left = 70
        Top = 259
        Width = 88
        Height = 13
        Caption = 'Quantidade de CH'
      end
      object Label15: TLabel
        Left = 178
        Top = 259
        Width = 57
        Height = 13
        Caption = 'Valor de CH'
      end
      object Label16: TLabel
        Left = 285
        Top = 259
        Width = 83
        Height = 13
        Caption = 'Valor da Consulta'
      end
      object Label17: TLabel
        Left = 387
        Top = 259
        Width = 77
        Height = 13
        Caption = 'Valor da Cirurgia'
      end
      object DB_convenio_numero: TDBEdit
        Left = 15
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_numero'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 0
        Visible = False
      end
      object DB_convenio_razao_social: TDBEdit
        Left = 27
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_razao_social'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 1
        Visible = False
      end
      object DB_convenio_nome_fantasia: TDBEdit
        Left = 39
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_nome_fantasia'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 16
        Visible = False
      end
      object DB_convenio_apelido: TDBEdit
        Left = 51
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_apelido'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 17
        Visible = False
      end
      object DB_convenio_endereco: TDBEdit
        Left = 63
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_endereco'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 18
        Visible = False
      end
      object DB_convenio_complemento: TDBEdit
        Left = 75
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_complemento'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 19
        Visible = False
      end
      object DB_convenio_bairro: TDBEdit
        Left = 87
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_bairro'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 20
        Visible = False
      end
      object DB_convenio_cidade: TDBEdit
        Left = 99
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_cidade'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 21
        Visible = False
      end
      object DB_convenio_cep: TDBEdit
        Left = 111
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_cep'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 22
        Visible = False
      end
      object DB_convenio_uf: TDBEdit
        Left = 123
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_uf'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 23
        Visible = False
      end
      object DB_convenio_fone_1: TDBEdit
        Left = 135
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_fone_1'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 24
        Visible = False
      end
      object DB_convenio_fone_2: TDBEdit
        Left = 147
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_fone_2'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 25
        Visible = False
      end
      object DB_convenio_fax: TDBEdit
        Left = 159
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_fax'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 26
        Visible = False
      end
      object DB_convenio_setor_resp: TDBEdit
        Left = 171
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_setor_resp'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 27
        Visible = False
      end
      object DB_convenio_qtde_ch: TDBEdit
        Left = 183
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_qtde_ch'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 28
        Visible = False
      end
      object DB_convenio_valor_ch: TDBEdit
        Left = 195
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_valor_ch'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 29
        Visible = False
      end
      object convenio_uf: TComboBox
        Left = 502
        Top = 149
        Width = 42
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        MaxLength = 2
        ParentCtl3D = False
        TabOrder = 9
        Text = 'AC'
        OnKeyPress = convenio_ufKeyPress
        Items.Strings = (
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RN'
          'RS'
          'RJ'
          'RO'
          'RR'
          'SC'
          'SP'
          'SE'
          'TO')
      end
      object convenio_razao_social: TEdit
        Left = 3
        Top = 14
        Width = 489
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = convenio_razao_socialKeyPress
      end
      object convenio_nome_fantasia: TEdit
        Left = 3
        Top = 48
        Width = 489
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = convenio_nome_fantasiaKeyPress
      end
      object convenio_apelido: TEdit
        Left = 3
        Top = 82
        Width = 245
        Height = 19
        Ctl3D = False
        MaxLength = 40
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = convenio_apelidoKeyPress
      end
      object convenio_endereco: TEdit
        Left = 3
        Top = 116
        Width = 300
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = convenio_enderecoKeyPress
      end
      object convenio_complemento: TEdit
        Left = 307
        Top = 116
        Width = 237
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 6
        OnKeyPress = convenio_complementoKeyPress
      end
      object convenio_bairro: TEdit
        Left = 3
        Top = 149
        Width = 245
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 7
        OnKeyPress = convenio_bairroKeyPress
      end
      object convenio_cidade: TEdit
        Left = 253
        Top = 149
        Width = 245
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 8
        OnKeyPress = convenio_cidadeKeyPress
      end
      object convenio_fone_1: TEdit
        Left = 3
        Top = 215
        Width = 175
        Height = 19
        BiDiMode = bdRightToLeft
        Ctl3D = False
        MaxLength = 40
        ParentBiDiMode = False
        ParentCtl3D = False
        TabOrder = 11
        OnKeyPress = convenio_fone_1KeyPress
      end
      object convenio_fone_2: TEdit
        Left = 186
        Top = 215
        Width = 175
        Height = 19
        Ctl3D = False
        MaxLength = 40
        ParentCtl3D = False
        TabOrder = 12
        OnKeyPress = convenio_fone_2KeyPress
      end
      object convenio_fax: TEdit
        Left = 368
        Top = 215
        Width = 175
        Height = 19
        Ctl3D = False
        MaxLength = 40
        ParentCtl3D = False
        TabOrder = 13
        OnKeyPress = convenio_faxKeyPress
      end
      object convenio_setor_resp: TEdit
        Left = 68
        Top = 182
        Width = 475
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 10
        OnKeyPress = convenio_setor_respKeyPress
      end
      object convenio_qtde_ch: TEdit
        Left = 72
        Top = 272
        Width = 95
        Height = 19
        BiDiMode = bdLeftToRight
        Ctl3D = False
        MaxLength = 5
        ParentBiDiMode = False
        ParentCtl3D = False
        TabOrder = 14
        OnKeyPress = convenio_qtde_chKeyPress
      end
      object convenio_valor_ch: TEdit
        Left = 178
        Top = 272
        Width = 95
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 15
        OnKeyPress = convenio_valor_chKeyPress
      end
      object convenio_numero: TEdit
        Left = 3
        Top = 237
        Width = 10
        Height = 21
        TabOrder = 30
        Visible = False
      end
      object convenio_cep: TMaskEdit
        Left = 3
        Top = 182
        Width = 58
        Height = 19
        Ctl3D = False
        EditMask = '99999-999;1; '
        MaxLength = 9
        ParentCtl3D = False
        TabOrder = 31
        Text = '     -   '
        OnKeyPress = convenio_cepKeyPress
      end
      object convenio_valor_consulta: TEdit
        Left = 285
        Top = 272
        Width = 90
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 32
        OnKeyPress = convenio_valor_consultaKeyPress
      end
      object DB_convenio_valor_consulta: TDBEdit
        Left = 207
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_valor_consulta'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 33
        Visible = False
      end
      object convenio_valor_cirurgia: TEdit
        Left = 387
        Top = 272
        Width = 90
        Height = 19
        Ctl3D = False
        MaxLength = 13
        ParentCtl3D = False
        TabOrder = 34
        OnKeyPress = convenio_valor_consultaKeyPress
      end
      object DB_convenio_valor_cirurgia: TDBEdit
        Left = 219
        Top = 237
        Width = 10
        Height = 21
        DataField = 'Convenio_valor_cirurgia'
        DataSource = conexaoBD.DS_Convenio
        TabOrder = 35
        Visible = False
      end
    end
    object GRD_Convenios: TDBGrid
      Left = 15
      Top = 36
      Width = 552
      Height = 127
      Ctl3D = False
      DataSource = conexaoBD.DS_Convenio
      Options = [dgTitles, dgColLines, dgRowLines]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = GRD_ConveniosCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Convenio_numero'
          Title.Caption = 'N'#250'mero'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_razao_social'
          Title.Caption = 'Raz'#227'o Social'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_nome_fantasia'
          Title.Caption = 'Nome Fantasia'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_apelido'
          Title.Caption = 'Apelido'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_endereco'
          Title.Caption = 'Endere'#231'o'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_complemento'
          Title.Caption = 'Complemento'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_bairro'
          Title.Caption = 'Bairro'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_cidade'
          Title.Caption = 'Cidade'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_cep'
          Title.Caption = 'CEP'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_uf'
          Title.Caption = 'UF'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_fone_1'
          Title.Caption = 'Fone 1'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_fone_2'
          Title.Caption = 'Fone 2'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_fax'
          Title.Caption = 'FAX'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_setor_resp'
          Title.Caption = 'Setor Respons'#225'vel'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_qtde_ch'
          Title.Caption = 'Qtde de CH'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_valor_ch'
          Title.Caption = 'Valor de CH'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Convenio_valor_consulta'
          Title.Caption = 'Valor da Consulta'
          Title.Color = 13615023
          Visible = True
        end>
    end
  end
end
