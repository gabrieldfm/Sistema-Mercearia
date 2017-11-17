inherited FrmCadastroFornecedor: TFrmCadastroFornecedor
  Caption = 'Cadastro de Fornecedor'
  ClientHeight = 375
  ExplicitHeight = 414
  PixelsPerInch = 96
  TextHeight = 13
  inherited BtPesq: TSpeedButton
    OnClick = BtPesqClick
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 68
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = LbCod
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 108
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = LbNome
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 148
    Width = 48
    Height = 13
    Caption = 'CPF/CNPJ'
    FocusControl = LbIdentificacao
  end
  object Label4: TLabel [4]
    Left = 8
    Top = 230
    Width = 59
    Height = 13
    Caption = 'C'#243'd. Cidade'
    FocusControl = LbCodCid
  end
  object Label5: TLabel [5]
    Left = 8
    Top = 268
    Width = 63
    Height = 13
    Caption = 'Nome Cidade'
    FocusControl = LbNomeCid
  end
  object BtPesqCid: TSpeedButton [6]
    Left = 216
    Top = 225
    Width = 23
    Height = 22
    Glyph.Data = {
      42040000424D4204000000000000420000002800000010000000100000000100
      20000300000000040000120B0000120B000000000000000000000000FF0000FF
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000200000004000000060000000A0000000E000000100E68B344338AD5760000
      0006000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000138AEE364CA8F8EF75C3F9FB148A
      E61C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000138AEE344CA8F8EF77C4FAFB30A2EF580000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000138AEE344CA8F8EF77C4FAFB30A2EF58000000000000
      00000000000000000000000000000000000000000000C1C1C11CDFDFDF70E1E1
      E183D7D7D752518FC30A1B79C9EF6FBFF8FB30A2EF5800000000000000000000
      000000000000000000000000000000000000CFCFCF58EADECDF7F5DDB6FFF7DE
      B7FFF3E3CAFFC9C5C0E332424FC3188AE6540000000000000000000000000000
      0000000000000000000000000000BFBFBF22E4D8C6F9FEE1B2FFFFE2B5FFFFE6
      BEFFFFEAC9FFF8EAD4FFD5D3D0AB000000000000000000000000000000000000
      0000000000000000000000000000CBCBCB7CF4DBB2FFFFE1B3FFFFE5BBFFFFE8
      C5FFFFECCEFFFFF2DFFFE1DAD1FDA1A1A1100000000000000000000000000000
      0000000000000000000000000000CCCCCB93F9DDB1FFFFE4B9FFFFE7C2FFFFEB
      CCFFFFEED5FFFFF2DEFFE8E2D8FFA8A8A8240000000000000000000000000000
      0000000000000000000000000000CCCCCC66F0DCBCFFFFE9C6FFFFEACAFFFFEE
      D3FFFFF1DCFFFFF4E4FFDCD8D1F1A0A0A0060000000000000000000000000000
      0000000000000000000000000000ABABAB0CD9D3CADFFAEDD9FFFFF9F1FFFFF3
      E0FFFFF3E2FFEDE6DBFFCAC9C97A000000000000000000000000000000000000
      000000000000000000000000000000000000C2C2C222D3D0CBC3E7DFD3FFEBE3
      D6FFDEDAD2F5CAC9C87EA0A0A002000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AEAEAE20B9B9
      B932A2A2A20C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
    OnClick = BtPesqCidClick
  end
  object Label6: TLabel [7]
    Left = 226
    Top = 148
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label7: TLabel [8]
    Left = 8
    Top = 184
    Width = 28
    Height = 13
    Caption = 'E-mail'
    FocusControl = LbEmail
  end
  inherited GpCad: TGroupBox
    Top = 316
    ExplicitTop = 316
  end
  inherited BtsNav: TDBNavigator
    Hints.Strings = ()
  end
  object LbCod: TDBEdit [11]
    Left = 76
    Top = 65
    Width = 134
    Height = 21
    CharCase = ecUpperCase
    Color = cl3DLight
    DataField = 'FOR_ID'
    DataSource = DS
    ReadOnly = True
    TabOrder = 2
  end
  object LbNome: TDBEdit [12]
    Left = 76
    Top = 105
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = DS
    TabOrder = 3
  end
  object LbIdentificacao: TDBEdit [13]
    Left = 76
    Top = 145
    Width = 125
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CPFCNPJ'
    DataSource = DS
    TabOrder = 4
  end
  object LbCodCid: TDBEdit [14]
    Left = 76
    Top = 225
    Width = 134
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CIDADES_CID_ID'
    DataSource = DS
    TabOrder = 5
    OnExit = LbCodCidExit
  end
  object LbNomeCid: TDBEdit [15]
    Left = 76
    Top = 265
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    Color = cl3DLight
    DataField = 'NOME1'
    DataSource = DS
    ReadOnly = True
    TabOrder = 6
  end
  object LbEmail: TDBEdit [16]
    Left = 76
    Top = 181
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'EMAIL'
    DataSource = DS
    TabOrder = 7
  end
  object MskTel: TMaskEdit [17]
    Left = 274
    Top = 145
    Width = 102
    Height = 21
    CharCase = ecUpperCase
    EditMask = '(00) 99999-0000'
    MaxLength = 15
    TabOrder = 8
    Text = '(  )      -    '
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT FORNECEDOR.*, CIDADES.NOME  FROM FORNECEDOR'
      ' INNER JOIN CIDADES ON (FORNECEDOR.CIDADES_CID_ID = '
      'CIDADES.CID_ID)'
      'ORDER BY FORNECEDOR.FOR_ID')
    object QueryFOR_ID: TIntegerField
      FieldName = 'FOR_ID'
      Origin = '"FORNECEDOR"."FOR_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"FORNECEDOR"."NOME"'
      Required = True
      Size = 100
    end
    object QueryCPFCNPJ: TIBStringField
      FieldName = 'CPFCNPJ'
      Origin = '"FORNECEDOR"."CPFCNPJ"'
      Required = True
    end
    object QueryCIDADES_CID_ID: TIntegerField
      FieldName = 'CIDADES_CID_ID'
      Origin = '"FORNECEDOR"."CIDADES_CID_ID"'
      Required = True
    end
    object QueryNOME1: TIBStringField
      FieldName = 'NOME1'
      Origin = '"CIDADES"."NOME"'
      Required = True
      Size = 50
    end
    object QueryTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = '"FORNECEDOR"."TELEFONE"'
      Size = 50
    end
    object QueryEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"FORNECEDOR"."EMAIL"'
      Required = True
      Size = 100
    end
  end
  inherited Update: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  FOR_ID,'
      '  NOME,'
      '  CPFCNPJ,'
      '  CIDADES_CID_ID,'
      '  TELEFONE,'
      '  EMAIL'
      'from FORNECEDOR '
      'where'
      '  FOR_ID = :FOR_ID')
    ModifySQL.Strings = (
      'update FORNECEDOR'
      'set'
      '  FOR_ID = :FOR_ID,'
      '  NOME = :NOME,'
      '  CPFCNPJ = :CPFCNPJ,'
      '  CIDADES_CID_ID = :CIDADES_CID_ID,'
      '  TELEFONE = :TELEFONE,'
      '  EMAIL = :EMAIL'
      'where'
      '  FOR_ID = :OLD_FOR_ID')
    InsertSQL.Strings = (
      'insert into FORNECEDOR'
      '  (FOR_ID, NOME, CPFCNPJ, CIDADES_CID_ID, TELEFONE, EMAIL)'
      'values'
      '  (:FOR_ID, :NOME, :CPFCNPJ, :CIDADES_CID_ID, :TELEFONE, :EMAIL)')
    DeleteSQL.Strings = (
      'delete from FORNECEDOR'
      'where'
      '  FOR_ID = :OLD_FOR_ID')
  end
end
