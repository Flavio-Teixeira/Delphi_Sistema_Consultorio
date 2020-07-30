object Cid: TCid
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
    Caption = '   CID - Cadastro Internacional de Doen'#231'as   '
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
        Width = 96
        Height = 13
        Caption = 'Localizar o  CID por:'
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
      object GRD_Cid: TDBGrid
        Left = 6
        Top = 85
        Width = 553
        Height = 220
        Ctl3D = False
        DataSource = conexaoBD.DS_Cid
        Options = [dgTitles, dgColLines, dgRowLines]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = GRD_CidCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Cid_codigo_doenca'
            Title.Caption = 'C'#243'digo'
            Title.Color = 13615023
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cid_descricao_doenca'
            Title.Caption = 'Descri'#231#227'o'
            Title.Color = 13615023
            Width = 2000
            Visible = True
          end>
      end
      object cid_tipo_procura: TComboBox
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
        Text = 'C'#243'digo da Doen'#231'a'
        OnKeyPress = cid_tipo_procuraKeyPress
        Items.Strings = (
          'C'#243'digo da Doen'#231'a'
          'Descri'#231#227'o da Doen'#231'a')
      end
      object cid_procura: TEdit
        Left = 6
        Top = 57
        Width = 121
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = cid_procuraKeyPress
      end
      object Button2: TButton
        Left = 130
        Top = 57
        Width = 38
        Height = 19
        Caption = '&Ok'
        TabOrder = 2
        OnClick = Button2Click
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
        Width = 104
        Height = 13
        Caption = 'Descri'#231#227'o da Doen'#231'a'
      end
      object Label2: TLabel
        Left = 6
        Top = 5
        Width = 89
        Height = 13
        Caption = 'C'#243'digo da Doen'#231'a'
      end
      object Label5: TLabel
        Left = 6
        Top = 80
        Width = 63
        Height = 13
        Caption = 'Observa'#231#245'es'
      end
      object cid_codigo: TEdit
        Left = 6
        Top = 19
        Width = 90
        Height = 19
        Ctl3D = False
        MaxLength = 10
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = cid_codigoKeyPress
      end
      object cid_descricao: TEdit
        Left = 6
        Top = 56
        Width = 553
        Height = 19
        Ctl3D = False
        MaxLength = 255
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = cid_descricaoKeyPress
      end
      object cid_observacao: TMemo
        Left = 6
        Top = 94
        Width = 552
        Height = 72
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object DB_cid_codigo: TDBEdit
        Left = 98
        Top = 19
        Width = 10
        Height = 21
        DataField = 'Cid_codigo_doenca'
        DataSource = conexaoBD.DS_Cid
        TabOrder = 3
        Visible = False
      end
      object DB_cid_descricao: TDBEdit
        Left = 110
        Top = 19
        Width = 10
        Height = 21
        DataField = 'Cid_descricao_doenca'
        DataSource = conexaoBD.DS_Cid
        TabOrder = 4
        Visible = False
      end
      object DB_cid_observacao: TDBMemo
        Left = 122
        Top = 19
        Width = 10
        Height = 21
        DataField = 'Cid_doenca_observacao'
        DataSource = conexaoBD.DS_Cid
        TabOrder = 5
        Visible = False
      end
    end
  end
end
