object Preferencia: TPreferencia
  Left = 0
  Top = 0
  Width = 583
  Height = 514
  Color = 15722463
  ParentColor = False
  TabOrder = 0
  object GroupBox7: TGroupBox
    Left = 0
    Top = 1
    Width = 582
    Height = 513
    Caption = '   Prefer'#234'ncias do Usu'#225'rio   '
    TabOrder = 0
    object Button4: TButton
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
      OnClick = Button4Click
    end
    object DBGrid1: TDBGrid
      Left = 41
      Top = 16
      Width = 503
      Height = 56
      Ctl3D = False
      DataSource = conexaoBD.DS_Usuario
      Options = [dgTitles, dgColLines, dgRowLines]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Usuario_nome'
          Title.Caption = 'Nome do Usu'#225'rio'
          Title.Color = 13615023
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 27
      Top = 77
      Width = 527
      Height = 429
      Color = 13615023
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Top = 39
        Width = 109
        Height = 13
        Caption = 'Permiss'#245'es de Acesso:'
      end
      object Label15: TLabel
        Left = 212
        Top = 39
        Width = 75
        Height = 13
        Caption = 'Acesso Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 319
        Top = 39
        Width = 70
        Height = 13
        Caption = 'Sem Acesso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 420
        Top = 39
        Width = 93
        Height = 13
        Caption = 'Somente Leitura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 61
        Top = 9
        Width = 405
        Height = 26
        BevelOuter = bvLowered
        Color = 13615023
        TabOrder = 0
        object Label1: TLabel
          Left = 3
          Top = 5
          Width = 36
          Height = 13
          Caption = 'Usu'#225'rio'
        end
        object Label2: TLabel
          Left = 211
          Top = 6
          Width = 31
          Height = 13
          Caption = 'Senha'
        end
        object usuario_nome: TEdit
          Left = 43
          Top = 3
          Width = 150
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          TabOrder = 0
          OnKeyPress = usuario_nomeKeyPress
        end
        object usuario_senha: TEdit
          Left = 251
          Top = 3
          Width = 150
          Height = 19
          Ctl3D = False
          MaxLength = 80
          ParentCtl3D = False
          PasswordChar = '*'
          TabOrder = 1
          OnKeyPress = usuario_senhaKeyPress
        end
      end
      object Panel3: TPanel
        Left = 8
        Top = 53
        Width = 512
        Height = 368
        BevelOuter = bvLowered
        Color = 13615023
        TabOrder = 1
        object Panel4: TPanel
          Left = 3
          Top = 79
          Width = 195
          Height = 21
          Color = 13615023
          TabOrder = 2
          object Label4: TLabel
            Left = 4
            Top = 4
            Width = 37
            Height = 13
            Caption = 'Agenda'
          end
        end
        object Panel5: TPanel
          Left = 3
          Top = 151
          Width = 195
          Height = 21
          Color = 13615023
          TabOrder = 4
          object Label5: TLabel
            Left = 4
            Top = 4
            Width = 99
            Height = 13
            Caption = 'Cadastro > Conv'#234'nio'
          end
        end
        object Panel6: TPanel
          Left = 3
          Top = 175
          Width = 195
          Height = 21
          Color = 13615023
          TabOrder = 20
          object Label6: TLabel
            Left = 4
            Top = 4
            Width = 101
            Height = 13
            Caption = 'Cadastro > Indica'#231#227'o'
          end
        end
        object Panel7: TPanel
          Left = 3
          Top = 199
          Width = 195
          Height = 21
          Color = 13615023
          TabOrder = 6
          object Label7: TLabel
            Left = 4
            Top = 4
            Width = 72
            Height = 13
            Caption = 'Cadastro > CID'
          end
        end
        object Panel8: TPanel
          Left = 3
          Top = 223
          Width = 195
          Height = 21
          Color = 13615023
          TabOrder = 8
          object Label8: TLabel
            Left = 4
            Top = 4
            Width = 152
            Height = 13
            Caption = 'Imprimir > Envelope do Paciente'
          end
        end
        object Panel9: TPanel
          Left = 3
          Top = 247
          Width = 195
          Height = 21
          Color = 13615023
          TabOrder = 10
          object Label9: TLabel
            Left = 4
            Top = 4
            Width = 133
            Height = 13
            Caption = 'Imprimir > Ficha do Paciente'
          end
        end
        object Panel10: TPanel
          Left = 3
          Top = 271
          Width = 195
          Height = 21
          Color = 13615023
          TabOrder = 12
          object Label10: TLabel
            Left = 4
            Top = 4
            Width = 106
            Height = 13
            Caption = 'Imprimir > Faturamento'
          end
        end
        object Panel11: TPanel
          Left = 3
          Top = 295
          Width = 195
          Height = 21
          Color = 13615023
          TabOrder = 14
          object Label11: TLabel
            Left = 4
            Top = 4
            Width = 143
            Height = 13
            Caption = 'Imprimir > Controle de Recibos'
          end
        end
        object Panel12: TPanel
          Left = 3
          Top = 319
          Width = 195
          Height = 21
          Color = 13615023
          TabOrder = 16
          object Label12: TLabel
            Left = 4
            Top = 4
            Width = 184
            Height = 13
            Caption = 'Prefer'#234'ncias > Prefer'#234'ncias do Usu'#225'rio'
          end
        end
        object Panel13: TPanel
          Left = 3
          Top = 343
          Width = 195
          Height = 21
          Color = 13615023
          TabOrder = 18
          object Label13: TLabel
            Left = 4
            Top = 4
            Width = 155
            Height = 13
            Caption = 'Prefer'#234'ncias > Dados do M'#233'dico'
          end
        end
        object Panel14: TPanel
          Left = 3
          Top = 4
          Width = 195
          Height = 72
          Color = 13615023
          TabOrder = 0
          object Label14: TLabel
            Left = 4
            Top = 4
            Width = 86
            Height = 13
            Caption = 'Ficha do Paciente'
          end
          object Panel28: TPanel
            Left = 10
            Top = 21
            Width = 175
            Height = 21
            BevelOuter = bvLowered
            Color = 13615023
            TabOrder = 0
            object Label18: TLabel
              Left = 4
              Top = 4
              Width = 146
              Height = 13
              Caption = 'Ficha do Paciente > Prontu'#225'rio'
            end
          end
          object Panel29: TPanel
            Left = 10
            Top = 46
            Width = 175
            Height = 21
            BevelOuter = bvLowered
            Color = 13615023
            TabOrder = 1
            object Label19: TLabel
              Left = 4
              Top = 4
              Width = 161
              Height = 13
              Caption = 'Ficha do Paciente > Observa'#231#245'es'
            end
          end
        end
        object Panel15: TPanel
          Left = 200
          Top = 4
          Width = 308
          Height = 72
          Color = 13615023
          TabOrder = 1
          object paciente_t: TRadioButton
            Left = 34
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 0
          end
          object paciente_s: TRadioButton
            Left = 139
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 1
          end
          object paciente_l: TRadioButton
            Left = 247
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 2
          end
          object Panel26: TPanel
            Left = 6
            Top = 21
            Width = 296
            Height = 21
            BevelOuter = bvLowered
            Color = 13615023
            TabOrder = 3
            object prontuario_t: TRadioButton
              Left = 28
              Top = 2
              Width = 15
              Height = 17
              TabOrder = 0
            end
            object prontuario_s: TRadioButton
              Left = 133
              Top = 2
              Width = 15
              Height = 17
              TabOrder = 1
            end
            object prontuario_l: TRadioButton
              Left = 241
              Top = 2
              Width = 15
              Height = 17
              TabOrder = 2
            end
          end
          object Panel27: TPanel
            Left = 6
            Top = 46
            Width = 296
            Height = 21
            BevelOuter = bvLowered
            Color = 13615023
            TabOrder = 4
            object observacoes_t: TRadioButton
              Left = 28
              Top = 2
              Width = 15
              Height = 17
              TabOrder = 0
            end
            object observacoes_s: TRadioButton
              Left = 133
              Top = 2
              Width = 15
              Height = 17
              TabOrder = 1
            end
            object observacoes_l: TRadioButton
              Left = 241
              Top = 2
              Width = 15
              Height = 17
              TabOrder = 2
            end
          end
        end
        object Panel16: TPanel
          Left = 200
          Top = 79
          Width = 308
          Height = 21
          Color = 13615023
          TabOrder = 3
          object agenda_t: TRadioButton
            Left = 34
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 0
          end
          object agenda_s: TRadioButton
            Left = 139
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 1
          end
          object agenda_l: TRadioButton
            Left = 247
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 2
          end
        end
        object Panel17: TPanel
          Left = 200
          Top = 151
          Width = 308
          Height = 21
          Color = 13615023
          TabOrder = 21
          object convenio_t: TRadioButton
            Left = 34
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 0
          end
          object convenio_s: TRadioButton
            Left = 139
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 1
          end
          object convenio_l: TRadioButton
            Left = 247
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 2
          end
        end
        object Panel18: TPanel
          Left = 200
          Top = 175
          Width = 308
          Height = 21
          Color = 13615023
          TabOrder = 5
          object indicacao_t: TRadioButton
            Left = 34
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 0
          end
          object indicacao_s: TRadioButton
            Left = 139
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 1
          end
          object indicacao_l: TRadioButton
            Left = 247
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 2
          end
        end
        object Panel19: TPanel
          Left = 200
          Top = 199
          Width = 308
          Height = 21
          Color = 13615023
          TabOrder = 7
          object cid_t: TRadioButton
            Left = 34
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 0
          end
          object cid_s: TRadioButton
            Left = 139
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 1
          end
          object cid_l: TRadioButton
            Left = 247
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 2
          end
        end
        object Panel20: TPanel
          Left = 200
          Top = 223
          Width = 308
          Height = 21
          Color = 13615023
          TabOrder = 9
          object paciente_env_t: TRadioButton
            Left = 34
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 0
          end
          object paciente_env_s: TRadioButton
            Left = 139
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 1
          end
          object paciente_env_l: TRadioButton
            Left = 247
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 2
          end
        end
        object Panel21: TPanel
          Left = 200
          Top = 247
          Width = 308
          Height = 21
          Color = 13615023
          TabOrder = 11
          object ficha_imp_t: TRadioButton
            Left = 34
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 0
          end
          object ficha_imp_s: TRadioButton
            Left = 139
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 1
          end
          object ficha_imp_l: TRadioButton
            Left = 247
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 2
          end
        end
        object Panel22: TPanel
          Left = 200
          Top = 271
          Width = 308
          Height = 21
          Color = 13615023
          TabOrder = 13
          object faturamento_imp_t: TRadioButton
            Left = 34
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 0
          end
          object faturamento_imp_s: TRadioButton
            Left = 139
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 1
          end
          object faturamento_imp_l: TRadioButton
            Left = 247
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 2
          end
        end
        object Panel23: TPanel
          Left = 200
          Top = 295
          Width = 308
          Height = 21
          Color = 13615023
          TabOrder = 15
          object recibo_imp_t: TRadioButton
            Left = 34
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 0
          end
          object recibo_imp_s: TRadioButton
            Left = 139
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 1
          end
          object recibo_imp_l: TRadioButton
            Left = 247
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 2
          end
        end
        object Panel24: TPanel
          Left = 200
          Top = 319
          Width = 308
          Height = 21
          Color = 13615023
          TabOrder = 17
          object usuario_t: TRadioButton
            Left = 34
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 0
          end
          object usuario_s: TRadioButton
            Left = 139
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 1
          end
          object usuario_l: TRadioButton
            Left = 247
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 2
          end
        end
        object Panel25: TPanel
          Left = 200
          Top = 343
          Width = 308
          Height = 21
          Color = 13615023
          TabOrder = 19
          object medico_t: TRadioButton
            Left = 34
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 0
          end
          object medico_s: TRadioButton
            Left = 139
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 1
          end
          object medico_l: TRadioButton
            Left = 247
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 2
          end
        end
        object Panel30: TPanel
          Left = 3
          Top = 103
          Width = 195
          Height = 21
          Color = 13615023
          TabOrder = 22
          object Label20: TLabel
            Left = 4
            Top = 4
            Width = 102
            Height = 13
            Caption = 'Cadastro > Adicionais'
          end
        end
        object Panel31: TPanel
          Left = 3
          Top = 127
          Width = 195
          Height = 21
          Color = 13615023
          TabOrder = 23
          object Label21: TLabel
            Left = 4
            Top = 4
            Width = 89
            Height = 13
            Caption = 'Cadastro > Cirurgia'
          end
        end
        object Panel32: TPanel
          Left = 200
          Top = 127
          Width = 308
          Height = 21
          Color = 13615023
          TabOrder = 24
          object cirurgia_t: TRadioButton
            Left = 34
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 0
          end
          object cirurgia_s: TRadioButton
            Left = 139
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 1
          end
          object cirurgia_l: TRadioButton
            Left = 247
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 2
          end
        end
        object Panel33: TPanel
          Left = 200
          Top = 103
          Width = 308
          Height = 21
          Color = 13615023
          TabOrder = 25
          object adicionais_t: TRadioButton
            Left = 34
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 0
          end
          object adicionais_s: TRadioButton
            Left = 139
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 1
          end
          object adicionais_l: TRadioButton
            Left = 247
            Top = 2
            Width = 15
            Height = 17
            TabOrder = 2
          end
        end
      end
      object DB_usuario_nome: TDBEdit
        Left = 4
        Top = 3
        Width = 10
        Height = 21
        DataField = 'Usuario_nome'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 2
        Visible = False
      end
      object DB_usuario_acesso_agenda: TDBEdit
        Left = 26
        Top = 3
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_agenda'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 3
        Visible = False
      end
      object DB_usuario_acesso_paciente: TDBEdit
        Left = 37
        Top = 3
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_paciente'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 4
        Visible = False
      end
      object DB_usuario_acesso_convenio: TDBEdit
        Left = 48
        Top = 3
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_convenio'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 5
        Visible = False
      end
      object DB_usuario_acesso_indicacao: TDBEdit
        Left = 3
        Top = 25
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_indicacao'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 6
        Visible = False
      end
      object DB_usuario_acesso_cid: TDBEdit
        Left = 14
        Top = 25
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_cid'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 7
        Visible = False
      end
      object DB_usuario_acesso_imp_env: TDBEdit
        Left = 468
        Top = 3
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_imp_env'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 8
        Visible = False
      end
      object DB_usuario_acesso_imp_ficha: TDBEdit
        Left = 479
        Top = 3
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_imp_ficha'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 9
        Visible = False
      end
      object DB_usuario_acesso_imp_fat: TDBEdit
        Left = 490
        Top = 3
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_imp_fat'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 10
        Visible = False
      end
      object DB_usuario_senha: TDBEdit
        Left = 15
        Top = 3
        Width = 10
        Height = 21
        DataField = 'Usuario_senha'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 11
        Visible = False
      end
      object DB_usuario_acesso_imp_rec: TDBEdit
        Left = 501
        Top = 3
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_imp_rec'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 12
        Visible = False
      end
      object DB_usuario_acesso_usuario: TDBEdit
        Left = 512
        Top = 3
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_usuario'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 13
        Visible = False
      end
      object DB_usuario_acesso_medico: TDBEdit
        Left = 468
        Top = 25
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_medico'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 14
        Visible = False
      end
      object DB_usuario_acesso_prontuario: TDBEdit
        Left = 479
        Top = 25
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_paciente_prontuario'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 15
        Visible = False
      end
      object DB_usuario_acesso_observacoes: TDBEdit
        Left = 489
        Top = 25
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_paciente_observacoes'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 16
        Visible = False
      end
      object DB_usuario_acesso_cirurgia: TDBEdit
        Left = 500
        Top = 25
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_cirurgia'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 17
        Visible = False
      end
      object DB_usuario_acesso_adicionais: TDBEdit
        Left = 511
        Top = 25
        Width = 10
        Height = 21
        DataField = 'Usuario_acesso_adicionais'
        DataSource = conexaoBD.DS_Usuario
        TabOrder = 18
        Visible = False
      end
    end
  end
end
