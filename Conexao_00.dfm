object Conexao: TConexao
  Left = 275
  Top = 153
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Altera a Conex'#227'o com o Banco de Dados'
  ClientHeight = 271
  ClientWidth = 342
  Color = 13615023
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000110000000000000099
    1000000000000191100000000000008891100000000009991100000000000008
    7911000000000999110000000000000018911000000019991100000000000000
    0089100000001999110000000000000000189100000019991000000000000000
    0008891000009999100000000000000000008891000099991000000000000000
    0000088910019999100000000000000000000088911199911000000000000000
    0000001889999991100000000000000000000000879999910000000000000000
    0000000008799991000000000000000000000000001899910000000000000000
    0000000000199991000000000000000000000000001999910000000000000000
    0000000000199991100000000000000000000000001999991000000000000000
    0000000000199999910000000000000000000000009999999910000000000000
    0000000000999988899100000000000000000000019991017891100000000000
    0000000001991000088911000000000000000000018910000088911000000000
    0000000000891000000889100000000000000000001810000000879100000000
    0000000000000000000008791000000000000000000110000000008791000000
    000000000000000000000008791100000000000000000000000000001891FFFF
    FFFFFFFFCFFFC7FF87FFC1FF83FFE0FF83FFF07F03FFFC7F03FFFC3F07FFFE1F
    07FFFF0F07FFFF8607FFFFC007FFFFC007FFFFF00FFFFFF80FFFFFFC0FFFFFFC
    0FFFFFFC0FFFFFFC07FFFFFC07FFFFFC03FFFFFC01FFFFFC00FFFFF8207FFFF8
    783FFFF87C1FFFFC7E1FFFFC7F0FFFFFFF87FFFE7FC3FFFFFFE0FFFFFFF0}
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 16
    Width = 317
    Height = 13
    Caption = 
      'Se sua m'#225'quina for uma esta'#231#227'o de trabalho '#233' necess'#225'rio indicar ' +
      'a'
  end
  object Label2: TLabel
    Left = 10
    Top = 30
    Width = 318
    Height = 13
    Caption = 'localiza'#231#227'o de sua base de dados (Caminho do Servidor) no campo'
  end
  object Label3: TLabel
    Left = 10
    Top = 43
    Width = 34
    Height = 13
    Caption = 'abaixo:'
  end
  object Label4: TLabel
    Left = 10
    Top = 96
    Width = 31
    Height = 13
    Caption = 'Obs.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 43
    Top = 96
    Width = 282
    Height = 13
    Caption = #201' necess'#225'rio informar uma '#39'\'#39' no final da localiza'#231#227'o de sua '
  end
  object Label6: TLabel
    Left = 10
    Top = 110
    Width = 180
    Height = 13
    Caption = 'base de dados (Caminho do Servidor).'
  end
  object Label7: TLabel
    Left = 10
    Top = 131
    Width = 43
    Height = 13
    Caption = 'Exemplo:'
  end
  object Label8: TLabel
    Left = 64
    Top = 131
    Width = 191
    Height = 13
    Caption = 'C:\ConsulTEX\Tabelas\                     ou'
  end
  object Label9: TLabel
    Left = 64
    Top = 147
    Width = 191
    Height = 13
    Caption = '\\Servidor\C\ConsulTEX\Tabelas\    ou'
  end
  object Label10: TLabel
    Left = 64
    Top = 163
    Width = 116
    Height = 13
    Caption = 'E:\ConsulTEX\Tabelas\'
  end
  object Label11: TLabel
    Left = 10
    Top = 186
    Width = 306
    Height = 13
    Caption = 'Para que sua altera'#231#227'o tenha o efeito desejado, clique no bot'#227'o '
  end
  object Label12: TLabel
    Left = 10
    Top = 200
    Width = 227
    Height = 13
    Caption = #39'Gravar'#39', saia do ConsulTEX e entre novamente.'
  end
  object conexao_caminho: TEdit
    Left = 10
    Top = 64
    Width = 318
    Height = 19
    Color = 15722463
    Ctl3D = False
    MaxLength = 100
    ParentCtl3D = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 238
    Width = 150
    Height = 25
    Caption = '&Gravar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 182
    Top = 238
    Width = 150
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 2
    OnClick = Button2Click
  end
end
