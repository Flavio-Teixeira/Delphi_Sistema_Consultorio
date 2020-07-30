object Medico: TMedico
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
    Caption = '   M'#233'dico   '
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
      Left = 23
      Top = 219
      Width = 538
      Height = 275
      Color = 13615023
      TabOrder = 1
      object Label1: TLabel
        Left = 90
        Top = 5
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 283
        Top = 39
        Width = 66
        Height = 13
        Caption = 'Especialidade'
      end
      object Label3: TLabel
        Left = 10
        Top = 5
        Width = 33
        Height = 13
        Caption = 'C.R.M.'
      end
      object Label4: TLabel
        Left = 90
        Top = 40
        Width = 22
        Height = 13
        Caption = 'R.G.'
      end
      object Label5: TLabel
        Left = 187
        Top = 40
        Width = 29
        Height = 13
        Caption = 'C.P.F.'
      end
      object Label6: TLabel
        Left = 10
        Top = 92
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label7: TLabel
        Left = 10
        Top = 127
        Width = 64
        Height = 13
        Caption = 'Complemento'
      end
      object Label8: TLabel
        Left = 10
        Top = 162
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label9: TLabel
        Left = 240
        Top = 162
        Width = 27
        Height = 13
        Caption = 'Bairro'
      end
      object Label10: TLabel
        Left = 369
        Top = 127
        Width = 20
        Height = 13
        Caption = 'U.F.'
      end
      object Label11: TLabel
        Left = 10
        Top = 196
        Width = 79
        Height = 13
        Caption = 'Fone Consult'#243'rio'
      end
      object Label12: TLabel
        Left = 141
        Top = 196
        Width = 80
        Height = 13
        Caption = 'Fone Resid'#234'ncia'
      end
      object Label13: TLabel
        Left = 272
        Top = 196
        Width = 59
        Height = 13
        Caption = 'Fone Celular'
      end
      object Label14: TLabel
        Left = 403
        Top = 196
        Width = 47
        Height = 13
        Caption = 'Fone FAX'
      end
      object Label15: TLabel
        Left = 10
        Top = 231
        Width = 29
        Height = 13
        Caption = 'E-Mail'
      end
      object Label16: TLabel
        Left = 469
        Top = 162
        Width = 30
        Height = 13
        Caption = 'C.E.P.'
      end
      object medico_nome: TEdit
        Left = 90
        Top = 19
        Width = 438
        Height = 19
        Ctl3D = False
        MaxLength = 160
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = medico_nomeKeyPress
      end
      object medico_complemento: TEdit
        Left = 10
        Top = 142
        Width = 353
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 6
        OnKeyPress = medico_complementoKeyPress
      end
      object medico_cidade: TEdit
        Left = 10
        Top = 176
        Width = 225
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 8
        OnKeyPress = medico_cidadeKeyPress
      end
      object medico_fone_consultorio: TEdit
        Left = 10
        Top = 210
        Width = 125
        Height = 19
        Ctl3D = False
        MaxLength = 40
        ParentCtl3D = False
        TabOrder = 11
        OnKeyPress = medico_fone_consultorioKeyPress
      end
      object medico_fone_residencia: TEdit
        Left = 141
        Top = 210
        Width = 125
        Height = 19
        Ctl3D = False
        MaxLength = 40
        ParentCtl3D = False
        TabOrder = 12
        OnKeyPress = medico_fone_residenciaKeyPress
      end
      object medico_email: TEdit
        Left = 10
        Top = 245
        Width = 300
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 15
        OnKeyPress = medico_emailKeyPress
      end
      object medico_fone_fax: TEdit
        Left = 403
        Top = 210
        Width = 125
        Height = 19
        Ctl3D = False
        MaxLength = 40
        ParentCtl3D = False
        TabOrder = 14
        OnKeyPress = medico_fone_faxKeyPress
      end
      object medico_rg: TEdit
        Left = 90
        Top = 54
        Width = 89
        Height = 19
        Ctl3D = False
        MaxLength = 15
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = medico_rgKeyPress
      end
      object medico_crm: TEdit
        Left = 10
        Top = 19
        Width = 73
        Height = 19
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = medico_crmKeyPress
      end
      object medico_especialidade: TEdit
        Left = 283
        Top = 54
        Width = 245
        Height = 19
        Ctl3D = False
        MaxLength = 160
        ParentCtl3D = False
        TabOrder = 4
        OnKeyPress = medico_especialidadeKeyPress
      end
      object medico_endereco: TEdit
        Left = 10
        Top = 107
        Width = 401
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = medico_enderecoKeyPress
      end
      object medico_bairro: TEdit
        Left = 240
        Top = 176
        Width = 225
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 9
        OnKeyPress = medico_bairroKeyPress
      end
      object medico_fone_celular: TEdit
        Left = 272
        Top = 210
        Width = 125
        Height = 19
        Ctl3D = False
        MaxLength = 40
        ParentCtl3D = False
        TabOrder = 13
        OnKeyPress = medico_fone_celularKeyPress
      end
      object medico_uf: TComboBox
        Left = 369
        Top = 142
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
        TabOrder = 7
        Text = 'AC'
        OnKeyPress = medico_ufKeyPress
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
      object medico_cpf: TMaskEdit
        Left = 187
        Top = 54
        Width = 88
        Height = 19
        Ctl3D = False
        EditMask = '999.999.999-99;1; '
        MaxLength = 14
        ParentCtl3D = False
        TabOrder = 3
        Text = '   .   .   -  '
        OnKeyPress = medico_cpfKeyPress
      end
      object medico_cep: TMaskEdit
        Left = 469
        Top = 176
        Width = 59
        Height = 19
        Ctl3D = False
        EditMask = '99999-999;1; '
        MaxLength = 9
        ParentCtl3D = False
        TabOrder = 10
        Text = '     -   '
        OnKeyPress = medico_cepKeyPress
      end
    end
    object GRD_Medico: TDBGrid
      Left = 24
      Top = 31
      Width = 537
      Height = 178
      Ctl3D = False
      DataSource = conexaoBD.DS_Medico
      Options = [dgTitles, dgColLines, dgRowLines]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = GRD_MedicoCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Medico_crm'
          Title.Alignment = taCenter
          Title.Caption = 'C.R.M.'
          Title.Color = 13615023
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Medico_nome'
          Title.Caption = 'Nome'
          Title.Color = 13615023
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Medico_especialidade'
          Title.Caption = 'Especialidade'
          Title.Color = 13615023
          Width = 135
          Visible = True
        end>
    end
    object DB_Medico_CRM: TDBEdit
      Left = 64
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_crm'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 3
      Visible = False
    end
    object DB_Medico_Nome: TDBEdit
      Left = 77
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_nome'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 4
      Visible = False
    end
    object DB_Medico_RG: TDBEdit
      Left = 89
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_rg'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 5
      Visible = False
    end
    object DB_Medico_CPF: TDBEdit
      Left = 102
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_cpf'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 6
      Visible = False
    end
    object DB_Medico_Especialidade: TDBEdit
      Left = 115
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_especialidade'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 7
      Visible = False
    end
    object DB_Medico_Endereco: TDBEdit
      Left = 128
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_endereco'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 8
      Visible = False
    end
    object DB_Medico_Complemento: TDBEdit
      Left = 141
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_complemento'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 9
      Visible = False
    end
    object DB_Medico_Cidade: TDBEdit
      Left = 155
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_cidade'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 10
      Visible = False
    end
    object DB_Medico_Bairro: TDBEdit
      Left = 168
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_bairro'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 11
      Visible = False
    end
    object DB_Medico_Cep: TDBEdit
      Left = 181
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_cep'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 12
      Visible = False
    end
    object DB_Medico_Fone_Consultorio: TDBEdit
      Left = 194
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_fone_consultorio'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 13
      Visible = False
    end
    object DB_Medico_Fone_Residencia: TDBEdit
      Left = 207
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_fone_residencia'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 14
      Visible = False
    end
    object DB_Medico_Fone_Celular: TDBEdit
      Left = 220
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_fone_celular'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 15
      Visible = False
    end
    object DB_Medico_Fone_Fax: TDBEdit
      Left = 232
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_fone_fax'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 16
      Visible = False
    end
    object DB_Medico_Email: TDBEdit
      Left = 245
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_email'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 17
      Visible = False
    end
    object DB_Medico_Uf: TDBEdit
      Left = 258
      Top = 8
      Width = 10
      Height = 21
      DataField = 'Medico_uf'
      DataSource = conexaoBD.DS_Medico
      TabOrder = 18
      Visible = False
    end
  end
end
