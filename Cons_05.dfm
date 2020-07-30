object Indicacao: TIndicacao
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
    Caption = ' Indica'#231#227'o '
    TabOrder = 0
    object GRD_Indicacao: TDBGrid
      Left = 9
      Top = 25
      Width = 560
      Height = 112
      Ctl3D = False
      DataSource = conexaoBD.DS_Indicacao
      Options = [dgTitles, dgColLines, dgRowLines]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = GRD_IndicacaoCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Indicacao_numero'
          Title.Caption = 'N'#250'mero'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Indicacao_nome'
          Title.Caption = 'Nome'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Indicacao_endereco'
          Title.Caption = 'Endere'#231'o'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Indicacao_complemento'
          Title.Caption = 'Complemento'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Indicacao_bairro'
          Title.Caption = 'Bairro'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Indicacao_cidade'
          Title.Caption = 'Cidade'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Indicacao_cep'
          Title.Caption = 'CEP'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Indicacao_uf'
          Title.Caption = 'UF'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Indicacao_fone'
          Title.Caption = 'Fone'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Indicacao_celular'
          Title.Caption = 'Celular'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Indicacao_fax'
          Title.Caption = 'FAX'
          Title.Color = 13615023
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Indicacao_email'
          Title.Caption = 'E-Mail'
          Title.Color = 13615023
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 9
      Top = 144
      Width = 563
      Height = 363
      BorderStyle = bsSingle
      Color = 13615023
      TabOrder = 1
      object Label1: TLabel
        Left = 4
        Top = 3
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 3
        Top = 38
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label3: TLabel
        Left = 3
        Top = 74
        Width = 64
        Height = 13
        Caption = 'Complemento'
      end
      object Label4: TLabel
        Left = 3
        Top = 109
        Width = 27
        Height = 13
        Caption = 'Bairro'
      end
      object Label5: TLabel
        Left = 3
        Top = 144
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label6: TLabel
        Left = 3
        Top = 179
        Width = 30
        Height = 13
        Caption = 'C.E.P.'
      end
      object Label7: TLabel
        Left = 75
        Top = 179
        Width = 20
        Height = 13
        Caption = 'U.F.'
      end
      object Label8: TLabel
        Left = 4
        Top = 214
        Width = 24
        Height = 13
        Caption = 'Fone'
      end
      object Label9: TLabel
        Left = 3
        Top = 249
        Width = 32
        Height = 13
        Caption = 'Celular'
      end
      object Label10: TLabel
        Left = 4
        Top = 284
        Width = 20
        Height = 13
        Caption = 'FAX'
      end
      object Label11: TLabel
        Left = 4
        Top = 320
        Width = 29
        Height = 13
        Caption = 'E-Mail'
      end
      object indicacao_numero: TEdit
        Left = 496
        Top = 16
        Width = 9
        Height = 21
        TabOrder = 0
        Visible = False
      end
      object indicacao_nome: TEdit
        Left = 3
        Top = 16
        Width = 489
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = indicacao_nomeKeyPress
      end
      object indicacao_endereco: TEdit
        Left = 3
        Top = 52
        Width = 489
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = indicacao_enderecoKeyPress
      end
      object indicacao_complemento: TEdit
        Left = 3
        Top = 88
        Width = 489
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = indicacao_complementoKeyPress
      end
      object indicacao_bairro: TEdit
        Left = 3
        Top = 122
        Width = 489
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = indicacao_bairroKeyPress
      end
      object indicacao_cidade: TEdit
        Left = 3
        Top = 157
        Width = 489
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = indicacao_cidadeKeyPress
      end
      object indicacao_fone: TEdit
        Left = 3
        Top = 227
        Width = 245
        Height = 19
        Ctl3D = False
        MaxLength = 40
        ParentCtl3D = False
        TabOrder = 7
        OnKeyPress = indicacao_foneKeyPress
      end
      object indicacao_celular: TEdit
        Left = 3
        Top = 262
        Width = 245
        Height = 19
        Ctl3D = False
        MaxLength = 40
        ParentCtl3D = False
        TabOrder = 8
        OnKeyPress = indicacao_celularKeyPress
      end
      object indicacao_fax: TEdit
        Left = 3
        Top = 298
        Width = 245
        Height = 19
        Ctl3D = False
        MaxLength = 40
        ParentCtl3D = False
        TabOrder = 9
        OnKeyPress = indicacao_faxKeyPress
      end
      object indicacao_email: TEdit
        Left = 4
        Top = 333
        Width = 489
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 10
        OnKeyPress = indicacao_emailKeyPress
      end
      object indicacao_uf: TComboBox
        Left = 75
        Top = 192
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
        TabOrder = 6
        Text = 'AC'
        OnKeyPress = indicacao_ufKeyPress
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
      object DB_indicacao_numero: TDBEdit
        Left = 302
        Top = 312
        Width = 10
        Height = 21
        DataField = 'Indicacao_numero'
        DataSource = conexaoBD.DS_Indicacao
        TabOrder = 11
        Visible = False
      end
      object DB_indicacao_nome: TDBEdit
        Left = 320
        Top = 312
        Width = 10
        Height = 21
        DataField = 'Indicacao_nome'
        DataSource = conexaoBD.DS_Indicacao
        TabOrder = 12
        Visible = False
      end
      object DB_indicacao_endereco: TDBEdit
        Left = 336
        Top = 312
        Width = 10
        Height = 21
        DataField = 'Indicacao_endereco'
        DataSource = conexaoBD.DS_Indicacao
        TabOrder = 13
        Visible = False
      end
      object DB_indicacao_complemento: TDBEdit
        Left = 352
        Top = 312
        Width = 10
        Height = 21
        DataField = 'Indicacao_complemento'
        DataSource = conexaoBD.DS_Indicacao
        TabOrder = 14
        Visible = False
      end
      object DB_indicacao_bairro: TDBEdit
        Left = 368
        Top = 312
        Width = 10
        Height = 21
        DataField = 'Indicacao_bairro'
        DataSource = conexaoBD.DS_Indicacao
        TabOrder = 15
        Visible = False
      end
      object DB_indicacao_cidade: TDBEdit
        Left = 384
        Top = 312
        Width = 10
        Height = 21
        DataField = 'Indicacao_cidade'
        DataSource = conexaoBD.DS_Indicacao
        TabOrder = 16
        Visible = False
      end
      object DB_indicacao_cep: TDBEdit
        Left = 400
        Top = 312
        Width = 10
        Height = 21
        DataField = 'Indicacao_cep'
        DataSource = conexaoBD.DS_Indicacao
        TabOrder = 17
        Visible = False
      end
      object DB_indicacao_uf: TDBEdit
        Left = 416
        Top = 312
        Width = 10
        Height = 21
        DataField = 'Indicacao_uf'
        DataSource = conexaoBD.DS_Indicacao
        TabOrder = 18
        Visible = False
      end
      object DB_indicacao_fone: TDBEdit
        Left = 432
        Top = 312
        Width = 10
        Height = 21
        DataField = 'Indicacao_fone'
        DataSource = conexaoBD.DS_Indicacao
        TabOrder = 19
        Visible = False
      end
      object DB_indicacao_celular: TDBEdit
        Left = 448
        Top = 312
        Width = 10
        Height = 21
        DataField = 'Indicacao_celular'
        DataSource = conexaoBD.DS_Indicacao
        TabOrder = 20
        Visible = False
      end
      object DB_indicacao_fax: TDBEdit
        Left = 464
        Top = 312
        Width = 10
        Height = 21
        DataField = 'Indicacao_fax'
        DataSource = conexaoBD.DS_Indicacao
        TabOrder = 21
        Visible = False
      end
      object DB_indicacao_email: TDBEdit
        Left = 480
        Top = 312
        Width = 10
        Height = 21
        DataField = 'Indicacao_email'
        DataSource = conexaoBD.DS_Indicacao
        TabOrder = 22
        Visible = False
      end
      object indicacao_cep: TMaskEdit
        Left = 3
        Top = 192
        Width = 64
        Height = 19
        Ctl3D = False
        EditMask = '99999-999;1; '
        MaxLength = 9
        ParentCtl3D = False
        TabOrder = 23
        Text = '     -   '
        OnKeyPress = indicacao_cepKeyPress
      end
    end
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
      TabOrder = 2
      OnClick = Button1Click
    end
  end
end
