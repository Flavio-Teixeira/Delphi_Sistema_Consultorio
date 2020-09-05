object Adicionais: TAdicionais
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
    Caption = '   Cadastro de Adicionais  '
    TabOrder = 0
    object Panel1: TPanel
      Left = 7
      Top = 17
      Width = 565
      Height = 311
      Color = 13615023
      TabOrder = 0
      object Label3: TLabel
        Left = 6
        Top = 6
        Width = 118
        Height = 13
        Caption = 'Localizar o Adicional por:'
      end
      object Label4: TLabel
        Left = 6
        Top = 43
        Width = 99
        Height = 13
        Caption = 'C'#243'digo ou Descri'#231#227'o'
      end
      object Button1: TButton
        Left = 547
        Top = 4
        Width = 15
        Height = 15
        Caption = 'X'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = Button1Click
      end
      object GRD_Adicional: TDBGrid
        Left = 6
        Top = 85
        Width = 553
        Height = 220
        Ctl3D = False
        DataSource = conexaoBD.DS_Adicionais
        Options = [dgTitles, dgColLines, dgRowLines]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = GRD_AdicionalCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Adicional_codigo'
            Title.Caption = 'C'#243'digo'
            Title.Color = 13615023
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Adicional_descricao'
            Title.Caption = 'Descri'#231#227'o'
            Title.Color = 13615023
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Adicional_valor'
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Title.Color = 13615023
            Width = 82
            Visible = True
          end>
      end
      object adicional_tipo_procura: TComboBox
        Left = 6
        Top = 19
        Width = 163
        Height = 19
        BevelInner = bvNone
        BevelKind = bkSoft
        Style = csOwnerDrawFixed
        Ctl3D = False
        ItemHeight = 13
        ItemIndex = 0
        ParentCtl3D = False
        TabOrder = 0
        Text = 'C'#243'digo do Adicional'
        OnKeyPress = adicional_tipo_procuraKeyPress
        Items.Strings = (
          'C'#243'digo do Adicional'
          'Descri'#231#227'o do Adicional')
      end
      object adicional_procura: TEdit
        Left = 6
        Top = 57
        Width = 121
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = adicional_procuraKeyPress
      end
      object adicional_busca: TButton
        Left = 130
        Top = 57
        Width = 38
        Height = 19
        Caption = '&Ok'
        TabOrder = 2
        OnClick = adicional_buscaClick
      end
    end
    object Panel2: TPanel
      Left = 7
      Top = 333
      Width = 565
      Height = 172
      Color = 13615023
      TabOrder = 1
      object Label1: TLabel
        Left = 6
        Top = 42
        Width = 109
        Height = 13
        Caption = 'Descri'#231#227'o do Adicional'
      end
      object Label2: TLabel
        Left = 6
        Top = 5
        Width = 94
        Height = 13
        Caption = 'C'#243'digo do Adicional'
      end
      object Label5: TLabel
        Left = 6
        Top = 80
        Width = 63
        Height = 13
        Caption = 'Observa'#231#245'es'
      end
      object Label6: TLabel
        Left = 230
        Top = 5
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object adicional_codigo: TEdit
        Left = 6
        Top = 19
        Width = 173
        Height = 19
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 0
      end
      object adicional_descricao: TEdit
        Left = 6
        Top = 56
        Width = 553
        Height = 19
        Ctl3D = False
        MaxLength = 255
        ParentCtl3D = False
        TabOrder = 2
      end
      object adicional_observacao: TMemo
        Left = 6
        Top = 94
        Width = 552
        Height = 72
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object DB_adicional_codigo: TDBEdit
        Left = 182
        Top = 19
        Width = 10
        Height = 21
        DataField = 'Adicional_codigo'
        DataSource = conexaoBD.DS_Adicionais
        TabOrder = 4
        Visible = False
      end
      object DB_adicional_descricao: TDBEdit
        Left = 194
        Top = 19
        Width = 10
        Height = 21
        DataField = 'Adicional_descricao'
        DataSource = conexaoBD.DS_Adicionais
        TabOrder = 5
        Visible = False
      end
      object DB_adicional_observacao: TDBMemo
        Left = 206
        Top = 19
        Width = 10
        Height = 21
        DataField = 'Adicional_observacao'
        DataSource = conexaoBD.DS_Adicionais
        TabOrder = 6
        Visible = False
      end
      object adicional_valor: TEdit
        Left = 230
        Top = 19
        Width = 90
        Height = 19
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = adicional_valorKeyPress
      end
      object DB_adicional_valor: TDBEdit
        Left = 217
        Top = 19
        Width = 10
        Height = 21
        DataField = 'Adicional_valor'
        DataSource = conexaoBD.DS_Adicionais
        TabOrder = 7
        Visible = False
      end
    end
  end
end
