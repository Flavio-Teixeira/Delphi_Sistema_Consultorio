object Cirurgia: TCirurgia
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
    Caption = '   Cadastro de Cirurgias  '
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
        Width = 113
        Height = 13
        Caption = 'Localizar o  Cirurgia por:'
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
      object GRD_Cirurgia: TDBGrid
        Left = 6
        Top = 85
        Width = 553
        Height = 220
        Ctl3D = False
        DataSource = conexaoBD.DS_Cirurgia
        Options = [dgTitles, dgColLines, dgRowLines]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = GRD_CirurgiaCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'cirurgia_codigo'
            Title.Caption = 'C'#243'digo'
            Title.Color = 13615023
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cirurgia_descricao'
            Title.Caption = 'Descri'#231#227'o'
            Title.Color = 13615023
            Width = 348
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cirurgia_quantidade_ch'
            Title.Alignment = taCenter
            Title.Caption = 'Qtde CH'
            Title.Color = 13615023
            Visible = True
          end>
      end
      object cirurgia_tipo_procura: TComboBox
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
        Text = 'C'#243'digo da Cirurgia'
        OnKeyPress = cirurgia_tipo_procuraKeyPress
        Items.Strings = (
          'C'#243'digo da Cirurgia'
          'Descri'#231#227'o da Cirurgia')
      end
      object cirurgia_procura: TEdit
        Left = 6
        Top = 57
        Width = 121
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = cirurgia_procuraKeyPress
      end
      object cirurgia_busca: TButton
        Left = 130
        Top = 57
        Width = 38
        Height = 19
        Caption = '&Ok'
        TabOrder = 2
        OnClick = cirurgia_buscaClick
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
        Width = 101
        Height = 13
        Caption = 'Descri'#231#227'o da Cirurgia'
      end
      object Label2: TLabel
        Left = 6
        Top = 5
        Width = 86
        Height = 13
        Caption = 'C'#243'digo da Cirurgia'
      end
      object Label5: TLabel
        Left = 6
        Top = 80
        Width = 63
        Height = 13
        Caption = 'Observa'#231#245'es'
      end
      object Label6: TLabel
        Left = 267
        Top = 5
        Width = 88
        Height = 13
        Caption = 'Quantidade de CH'
      end
      object Label7: TLabel
        Left = 375
        Top = 5
        Width = 90
        Height = 13
        Caption = 'Vlr.Material Cirurgia'
      end
      object cirurgia_codigo: TEdit
        Left = 6
        Top = 19
        Width = 198
        Height = 19
        Ctl3D = False
        MaxLength = 20
        ParentCtl3D = False
        TabOrder = 0
      end
      object cirurgia_descricao: TEdit
        Left = 6
        Top = 56
        Width = 553
        Height = 19
        Ctl3D = False
        MaxLength = 255
        ParentCtl3D = False
        TabOrder = 3
      end
      object cirurgia_observacao: TMemo
        Left = 6
        Top = 94
        Width = 552
        Height = 72
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
      end
      object DB_cirurgia_codigo: TDBEdit
        Left = 207
        Top = 19
        Width = 10
        Height = 21
        DataField = 'cirurgia_codigo'
        DataSource = conexaoBD.DS_Cirurgia
        TabOrder = 5
        Visible = False
      end
      object DB_cirurgia_descricao: TDBEdit
        Left = 219
        Top = 19
        Width = 10
        Height = 21
        DataField = 'cirurgia_descricao'
        DataSource = conexaoBD.DS_Cirurgia
        TabOrder = 6
        Visible = False
      end
      object DB_cirurgia_observacao: TDBMemo
        Left = 231
        Top = 19
        Width = 10
        Height = 21
        DataField = 'cirurgia_observacao'
        DataSource = conexaoBD.DS_Cirurgia
        TabOrder = 7
        Visible = False
      end
      object cirurgia_quantidade: TEdit
        Left = 267
        Top = 19
        Width = 90
        Height = 19
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = cirurgia_quantidadeKeyPress
      end
      object DB_cirurgia_quantidade: TDBEdit
        Left = 242
        Top = 19
        Width = 10
        Height = 21
        DataField = 'cirurgia_quantidade_ch'
        DataSource = conexaoBD.DS_Cirurgia
        TabOrder = 8
        Visible = False
      end
      object cirurgia_material: TEdit
        Left = 375
        Top = 19
        Width = 92
        Height = 19
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = cirurgia_materialKeyPress
      end
      object DB_cirurgia_material: TDBEdit
        Left = 254
        Top = 19
        Width = 10
        Height = 21
        DataField = 'cirurgia_material'
        DataSource = conexaoBD.DS_Cirurgia
        TabOrder = 9
        Visible = False
      end
    end
  end
end
