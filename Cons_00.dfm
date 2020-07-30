object Paciente: TPaciente
  Left = 0
  Top = 0
  Width = 582
  Height = 516
  Color = 15722463
  ParentColor = False
  TabOrder = 0
  object GroupBox2: TGroupBox
    Left = 0
    Top = 1
    Width = 582
    Height = 513
    Caption = '  Paciente   '
    Color = 15722463
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Dados_Paciente: TPageControl
      Left = 5
      Top = 81
      Width = 571
      Height = 426
      ActivePage = Ficha
      HotTrack = True
      TabOrder = 1
      object Ficha: TTabSheet
        Caption = 'Ficha'
        object GroupBox3: TGroupBox
          Left = 488
          Top = -1
          Width = 75
          Height = 100
          TabOrder = 3
          object Foto_Paciente: TImage
            Left = 2
            Top = 7
            Width = 70
            Height = 90
            Center = True
          end
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 311
          Width = 562
          Height = 86
          Caption = '   Telefone   '
          TabOrder = 2
          object Label27: TLabel
            Left = 8
            Top = 14
            Width = 55
            Height = 13
            Caption = 'Residencial'
          end
          object Label28: TLabel
            Left = 225
            Top = 14
            Width = 46
            Height = 13
            Caption = 'Comercial'
          end
          object Label30: TLabel
            Left = 8
            Top = 48
            Width = 17
            Height = 13
            Caption = 'Fax'
          end
          object Label29: TLabel
            Left = 225
            Top = 48
            Width = 32
            Height = 13
            Caption = 'Celular'
          end
          object paciente_fone_residencial: TEdit
            Left = 8
            Top = 27
            Width = 200
            Height = 19
            Ctl3D = False
            MaxLength = 40
            ParentCtl3D = False
            TabOrder = 0
            OnKeyPress = paciente_fone_residencialKeyPress
          end
          object paciente_fone_comercial: TEdit
            Left = 225
            Top = 27
            Width = 200
            Height = 19
            Ctl3D = False
            MaxLength = 40
            ParentCtl3D = False
            TabOrder = 1
            OnKeyPress = paciente_fone_comercialKeyPress
          end
          object paciente_fone_fax: TEdit
            Left = 8
            Top = 60
            Width = 200
            Height = 19
            Ctl3D = False
            MaxLength = 40
            ParentCtl3D = False
            TabOrder = 2
            OnKeyPress = paciente_fone_faxKeyPress
          end
          object paciente_fone_celular: TEdit
            Left = 225
            Top = 60
            Width = 200
            Height = 19
            Ctl3D = False
            MaxLength = 40
            ParentCtl3D = False
            TabOrder = 3
            OnKeyPress = paciente_fone_celularKeyPress
          end
          object GroupBox7: TGroupBox
            Left = 444
            Top = 7
            Width = 111
            Height = 72
            Caption = ' Imprimir '
            TabOrder = 4
            object BT_paciente_envelope: TBitBtn
              Left = 5
              Top = 16
              Width = 100
              Height = 23
              Caption = '&Envelope'
              TabOrder = 0
              OnClick = BT_paciente_envelopeClick
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
            object BT_paciente_ficha: TBitBtn
              Left = 5
              Top = 43
              Width = 100
              Height = 23
              Caption = '&Ficha'
              TabOrder = 1
              OnClick = BT_paciente_fichaClick
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
        object GroupBox6: TGroupBox
          Left = 0
          Top = 194
          Width = 562
          Height = 114
          Caption = '   Endere'#231'o   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label15: TLabel
            Left = 96
            Top = 6
            Width = 54
            Height = 13
            Caption = 'Logradouro'
          end
          object Label16: TLabel
            Left = 393
            Top = 6
            Width = 64
            Height = 13
            Caption = 'Complemento'
          end
          object Label17: TLabel
            Left = 6
            Top = 40
            Width = 27
            Height = 13
            Caption = 'Bairro'
          end
          object Label18: TLabel
            Left = 225
            Top = 40
            Width = 33
            Height = 13
            Caption = 'Cidade'
          end
          object Label19: TLabel
            Left = 442
            Top = 40
            Width = 30
            Height = 13
            Caption = 'C.E.P.'
          end
          object Label20: TLabel
            Left = 513
            Top = 40
            Width = 20
            Height = 13
            Caption = 'U.F.'
          end
          object Label25: TLabel
            Left = 6
            Top = 74
            Width = 29
            Height = 13
            Caption = 'E-Mail'
          end
          object paciente_endereco: TComboBox
            Left = 6
            Top = 20
            Width = 84
            Height = 19
            BevelInner = bvNone
            BevelKind = bkSoft
            Style = csOwnerDrawFixed
            Ctl3D = False
            ItemHeight = 13
            ItemIndex = 0
            ParentCtl3D = False
            TabOrder = 0
            Text = 'Residencial'
            OnKeyPress = paciente_enderecoKeyPress
            Items.Strings = (
              'Residencial'
              'Comercial')
          end
          object paciente_logradouro: TEdit
            Left = 96
            Top = 20
            Width = 291
            Height = 19
            Ctl3D = False
            MaxLength = 80
            ParentCtl3D = False
            TabOrder = 1
            OnKeyPress = paciente_logradouroKeyPress
          end
          object paciente_complemento: TEdit
            Left = 392
            Top = 20
            Width = 159
            Height = 19
            Ctl3D = False
            MaxLength = 80
            ParentCtl3D = False
            TabOrder = 2
            OnKeyPress = paciente_complementoKeyPress
          end
          object paciente_bairro: TEdit
            Left = 6
            Top = 52
            Width = 200
            Height = 19
            Ctl3D = False
            MaxLength = 80
            ParentCtl3D = False
            TabOrder = 3
            OnKeyPress = paciente_bairroKeyPress
          end
          object paciente_cidade: TEdit
            Left = 224
            Top = 52
            Width = 200
            Height = 19
            Ctl3D = False
            MaxLength = 80
            ParentCtl3D = False
            TabOrder = 4
            OnKeyPress = paciente_cidadeKeyPress
          end
          object paciente_uf: TComboBox
            Left = 513
            Top = 52
            Width = 40
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
            OnKeyPress = paciente_ufKeyPress
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
          object paciente_email: TEdit
            Left = 6
            Top = 87
            Width = 378
            Height = 19
            Ctl3D = False
            MaxLength = 80
            ParentCtl3D = False
            TabOrder = 7
            OnKeyPress = paciente_emailKeyPress
          end
          object paciente_cep: TMaskEdit
            Left = 442
            Top = 52
            Width = 58
            Height = 19
            Ctl3D = False
            EditMask = '99999-999;1; '
            MaxLength = 9
            ParentCtl3D = False
            TabOrder = 5
            Text = '     -   '
            OnKeyPress = paciente_cepKeyPress
          end
          object Button1: TButton
            Left = 392
            Top = 84
            Width = 144
            Height = 25
            Caption = 'Enviar E-mail'
            TabOrder = 8
            OnClick = Button1Click
          end
        end
        object DB_paciente_ficha: TDBEdit
          Left = 2
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_ficha'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 4
          Visible = False
        end
        object DB_paciente_nome: TDBEdit
          Left = 11
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_nome'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 5
          Visible = False
        end
        object DB_paciente_sobrenome: TDBEdit
          Left = 20
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_sobrenome'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 6
          Visible = False
        end
        object DB_paciente_cpf: TDBEdit
          Left = 39
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_cpf'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 7
          Visible = False
        end
        object DB_paciente_rg: TDBEdit
          Left = 29
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_rg'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 8
          Visible = False
        end
        object DB_paciente_dt_nascimento: TDBEdit
          Left = 59
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_dt_nascimento'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 9
          Visible = False
        end
        object DB_paciente_dt_cadastro: TDBEdit
          Left = 49
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_dt_cadastro'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 10
          Visible = False
        end
        object DB_paciente_foto: TDBEdit
          Left = 319
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_foto'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 11
          Visible = False
        end
        object DB_paciente_fone_celular: TDBEdit
          Left = 308
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_fone_celular'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 12
          Visible = False
        end
        object DB_paciente_fone_fax: TDBEdit
          Left = 297
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_fone_fax'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 13
          Visible = False
        end
        object DB_paciente_fone_comercial: TDBEdit
          Left = 285
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_fone_comercial'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 14
          Visible = False
        end
        object DB_paciente_fone_residencial: TDBEdit
          Left = 274
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_fone_residencial'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 15
          Visible = False
        end
        object DB_paciente_email: TDBEdit
          Left = 264
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_email'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 16
          Visible = False
        end
        object DB_paciente_profissao: TDBEdit
          Left = 253
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_profissao'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 17
          Visible = False
        end
        object DB_paciente_naturalidade: TDBEdit
          Left = 242
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_naturalidade'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 18
          Visible = False
        end
        object DB_paciente_estado_civil: TDBEdit
          Left = 230
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_estado_civil'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 19
          Visible = False
        end
        object DB_paciente_instrucao: TDBEdit
          Left = 219
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_instrucao'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 20
          Visible = False
        end
        object DB_paciente_uf: TDBEdit
          Left = 208
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_uf'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 21
          Visible = False
        end
        object DB_paciente_cep: TDBEdit
          Left = 197
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_cep'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 22
          Visible = False
        end
        object DB_paciente_cidade: TDBEdit
          Left = 186
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_cidade'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 23
          Visible = False
        end
        object DB_paciente_bairro: TDBEdit
          Left = 176
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_bairro'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 24
          Visible = False
        end
        object DB_paciente_complemento: TDBEdit
          Left = 165
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_complemento'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 25
          Visible = False
        end
        object DB_paciente_logradouro: TDBEdit
          Left = 154
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_logradouro'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 26
          Visible = False
        end
        object DB_paciente_endereco: TDBEdit
          Left = 143
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_endereco'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 27
          Visible = False
        end
        object DB_paciente_dt_ult_consulta: TDBEdit
          Left = 132
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_dt_ult_consulta'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 28
          Visible = False
        end
        object DB_paciente_titular: TDBEdit
          Left = 121
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_titular'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 29
          Visible = False
        end
        object DB_paciente_matricula: TDBEdit
          Left = 110
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_matricula'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 30
          Visible = False
        end
        object DB_paciente_convenio: TDBEdit
          Left = 100
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_convenio'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 31
          Visible = False
        end
        object DB_paciente_situacao: TDBEdit
          Left = 89
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_situacao'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 32
          Visible = False
        end
        object DB_paciente_sexo: TDBEdit
          Left = 79
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_sexo'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 33
          Visible = False
        end
        object DB_paciente_indicacao: TDBEdit
          Left = 69
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_indicacao'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 34
          Visible = False
        end
        object DB_paciente_observacao: TDBMemo
          Left = 330
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_observacao'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 35
          Visible = False
        end
        object GroupBox1: TGroupBox
          Left = 1
          Top = -1
          Width = 485
          Height = 192
          Caption = '   Dados   '
          TabOrder = 0
          object Label4: TLabel
            Left = 5
            Top = 14
            Width = 22
            Height = 13
            Caption = 'R.G.'
          end
          object Label5: TLabel
            Left = 105
            Top = 14
            Width = 29
            Height = 13
            Caption = 'C.P.F.'
          end
          object Label7: TLabel
            Left = 188
            Top = 14
            Width = 56
            Height = 13
            Caption = 'Nascimento'
          end
          object Label11: TLabel
            Left = 6
            Top = 117
            Width = 45
            Height = 13
            Caption = 'Conv'#234'nio'
          end
          object Label33: TLabel
            Left = 5
            Top = 153
            Width = 29
            Height = 13
            Caption = 'Titular'
          end
          object Label9: TLabel
            Left = 279
            Top = 151
            Width = 47
            Height = 13
            Caption = 'Indica'#231#227'o'
          end
          object Label8: TLabel
            Left = 253
            Top = 15
            Width = 27
            Height = 13
            Caption = 'Idade'
          end
          object Label12: TLabel
            Left = 279
            Top = 118
            Width = 83
            Height = 13
            Caption = 'Nro. de Matr'#237'cula'
          end
          object Label6: TLabel
            Left = 358
            Top = 14
            Width = 42
            Height = 13
            Caption = 'Cadastro'
          end
          object Label10: TLabel
            Left = 302
            Top = 14
            Width = 24
            Height = 13
            Caption = 'Sexo'
          end
          object Label34: TLabel
            Left = 406
            Top = 82
            Width = 73
            Height = 13
            Caption = #218'ltima Consulta'
          end
          object Label13: TLabel
            Left = 424
            Top = 14
            Width = 42
            Height = 13
            Caption = 'Situa'#231#227'o'
          end
          object Label21: TLabel
            Left = 358
            Top = 48
            Width = 85
            Height = 13
            Caption = 'Grau de Instru'#231#227'o'
          end
          object Label22: TLabel
            Left = 273
            Top = 48
            Width = 55
            Height = 13
            Caption = 'Estado Civil'
          end
          object Label23: TLabel
            Left = 6
            Top = 48
            Width = 60
            Height = 13
            Caption = 'Naturalidade'
          end
          object Label24: TLabel
            Left = 7
            Top = 82
            Width = 43
            Height = 13
            Caption = 'Profiss'#227'o'
          end
          object paciente_rg: TEdit
            Left = 5
            Top = 27
            Width = 96
            Height = 19
            Ctl3D = False
            MaxLength = 15
            ParentCtl3D = False
            TabOrder = 0
            OnKeyPress = paciente_rgKeyPress
          end
          object paciente_cpf: TMaskEdit
            Left = 104
            Top = 27
            Width = 80
            Height = 19
            Ctl3D = False
            EditMask = '999.999.999-99;1; '
            MaxLength = 14
            ParentCtl3D = False
            TabOrder = 1
            Text = '   .   .   -  '
            OnKeyPress = paciente_cpfKeyPress
          end
          object paciente_dt_nascimento: TMaskEdit
            Left = 187
            Top = 27
            Width = 63
            Height = 19
            Ctl3D = False
            EditMask = '99/99/9999;1; '
            MaxLength = 10
            ParentCtl3D = False
            TabOrder = 2
            Text = '  /  /    '
            OnExit = paciente_dt_nascimentoExit
            OnKeyPress = paciente_dt_nascimentoKeyPress
          end
          object paciente_convenio: TComboBox
            Left = 6
            Top = 130
            Width = 269
            Height = 19
            BevelInner = bvNone
            BevelKind = bkSoft
            Style = csOwnerDrawFixed
            Ctl3D = False
            ItemHeight = 13
            ParentCtl3D = False
            TabOrder = 12
            OnKeyPress = paciente_convenioKeyPress
          end
          object paciente_titular: TEdit
            Left = 6
            Top = 166
            Width = 269
            Height = 19
            Ctl3D = False
            MaxLength = 160
            ParentCtl3D = False
            TabOrder = 14
            OnKeyPress = paciente_titularKeyPress
          end
          object paciente_indicacao: TComboBox
            Left = 279
            Top = 165
            Width = 203
            Height = 21
            BevelInner = bvNone
            BevelKind = bkSoft
            Ctl3D = False
            ItemHeight = 13
            MaxLength = 80
            ParentCtl3D = False
            TabOrder = 15
            OnKeyPress = paciente_indicacaoKeyPress
          end
          object paciente_idade: TEdit
            Left = 253
            Top = 27
            Width = 26
            Height = 19
            Ctl3D = False
            Enabled = False
            MaxLength = 3
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 3
          end
          object paciente_matricula: TEdit
            Left = 279
            Top = 130
            Width = 158
            Height = 19
            Ctl3D = False
            MaxLength = 25
            ParentCtl3D = False
            TabOrder = 13
            OnKeyPress = paciente_matriculaKeyPress
          end
          object paciente_dt_cadastro: TMaskEdit
            Left = 358
            Top = 27
            Width = 63
            Height = 19
            Ctl3D = False
            EditMask = '99/99/9999;1; '
            MaxLength = 10
            ParentCtl3D = False
            TabOrder = 5
            Text = '  /  /    '
            OnExit = paciente_dt_cadastroExit
            OnKeyPress = paciente_dt_cadastroKeyPress
          end
          object paciente_sexo: TComboBox
            Left = 283
            Top = 27
            Width = 72
            Height = 19
            BevelInner = bvNone
            BevelKind = bkSoft
            Style = csOwnerDrawFixed
            Ctl3D = False
            ItemHeight = 13
            ItemIndex = 0
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
            Text = 'Feminino'
            OnKeyPress = paciente_sexoKeyPress
            Items.Strings = (
              'Feminino'
              'Masculino')
          end
          object paciente_dt_ult_consulta: TMaskEdit
            Left = 416
            Top = 94
            Width = 65
            Height = 19
            Ctl3D = False
            EditMask = '99/99/9999;1; '
            MaxLength = 10
            ParentCtl3D = False
            TabOrder = 11
            Text = '  /  /    '
            OnExit = paciente_dt_ult_consultaExit
            OnKeyPress = paciente_dt_ult_consultaKeyPress
          end
          object paciente_situacao: TComboBox
            Left = 424
            Top = 27
            Width = 58
            Height = 19
            BevelInner = bvNone
            BevelKind = bkSoft
            Style = csOwnerDrawFixed
            Ctl3D = False
            ItemHeight = 13
            ItemIndex = 0
            ParentCtl3D = False
            TabOrder = 6
            Text = 'Ativo'
            OnKeyPress = paciente_situacaoKeyPress
            Items.Strings = (
              'Ativo'
              'Inativo')
          end
          object paciente_instrucao: TComboBox
            Left = 358
            Top = 61
            Width = 124
            Height = 19
            BevelInner = bvNone
            BevelKind = bkSoft
            Style = csOwnerDrawFixed
            Ctl3D = False
            ItemHeight = 13
            ItemIndex = 0
            ParentCtl3D = False
            TabOrder = 9
            Text = '1o. Grau Incompleto'
            OnKeyPress = paciente_instrucaoKeyPress
            Items.Strings = (
              '1o. Grau Incompleto'
              '1o. Grau Completo'
              '2o. Grau Incompleto'
              '2o. Grau Completo'
              '3o. Grau Incompleto'
              '3o. Grau Completo')
          end
          object paciente_estado_civil: TComboBox
            Left = 273
            Top = 61
            Width = 83
            Height = 19
            BevelInner = bvNone
            BevelKind = bkSoft
            Style = csOwnerDrawFixed
            Ctl3D = False
            ItemHeight = 13
            ItemIndex = 0
            ParentCtl3D = False
            TabOrder = 8
            Text = 'Solteiro'
            OnKeyPress = paciente_estado_civilKeyPress
            Items.Strings = (
              'Solteiro'
              'Casado'
              'Divorciado'
              'Separado'
              'Viuvo')
          end
          object paciente_naturalidade: TEdit
            Left = 6
            Top = 61
            Width = 265
            Height = 19
            Ctl3D = False
            MaxLength = 80
            ParentCtl3D = False
            TabOrder = 7
            OnKeyPress = paciente_naturalidadeKeyPress
          end
          object paciente_profissao: TEdit
            Left = 5
            Top = 95
            Width = 269
            Height = 19
            Ctl3D = False
            MaxLength = 80
            ParentCtl3D = False
            TabOrder = 10
            OnKeyPress = paciente_profissaoKeyPress
          end
        end
        object Bt_Foto: TBitBtn
          Left = 488
          Top = 101
          Width = 74
          Height = 25
          Caption = '&Foto'
          TabOrder = 36
          OnClick = Bt_FotoClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888888888888888888888888887007888888870000000000
            0078807700777700770880770777777077088077078777707708807707F87770
            770880FF00777700FF0880FFF000000FFF0880000000000000088800870FF078
            0088888888700788888888888888888888888888888888888888}
        end
        object DB_paciente_prontuario: TDBMemo
          Left = 445
          Top = 136
          Width = 10
          Height = 21
          DataField = 'Paciente_prontuario'
          DataSource = conexaoBD.DS_Paciente
          TabOrder = 37
          Visible = False
        end
      end
      object Prontuario: TTabSheet
        Caption = 'Prontu'#225'rio'
        ImageIndex = 1
        object paciente_prontuario: TMemo
          Left = 4
          Top = 4
          Width = 554
          Height = 390
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
      end
      object Observacoes: TTabSheet
        Caption = 'Observa'#231#245'es'
        ImageIndex = 2
        object paciente_observacao: TMemo
          Left = 4
          Top = 4
          Width = 554
          Height = 390
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 6
      Top = 11
      Width = 571
      Height = 69
      TabOrder = 0
      object Label2: TLabel
        Left = 82
        Top = 17
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label3: TLabel
        Left = 277
        Top = 17
        Width = 54
        Height = 13
        Caption = 'Sobrenome'
      end
      object Label1: TLabel
        Left = 4
        Top = 17
        Width = 49
        Height = 13
        Caption = 'Nro. Ficha'
      end
      object paciente_ficha: TEdit
        Left = 4
        Top = 30
        Width = 56
        Height = 19
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object paciente_nome: TEdit
        Left = 82
        Top = 30
        Width = 190
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 1
        OnChange = paciente_nomeChange
        OnKeyPress = paciente_nomeKeyPress
      end
      object paciente_sobrenome: TEdit
        Left = 277
        Top = 30
        Width = 288
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = paciente_sobrenomeKeyPress
      end
      object paciente_nome_alterado: TEdit
        Left = 75
        Top = 30
        Width = 8
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 3
        Visible = False
        OnKeyPress = paciente_nomeKeyPress
      end
      object paciente_nome_ant: TEdit
        Left = 68
        Top = 30
        Width = 8
        Height = 19
        Ctl3D = False
        MaxLength = 80
        ParentCtl3D = False
        TabOrder = 4
        Visible = False
        OnChange = paciente_nomeChange
        OnKeyPress = paciente_nomeKeyPress
      end
    end
  end
end
