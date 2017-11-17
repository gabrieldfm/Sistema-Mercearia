inherited FrmCadastroDependentes: TFrmCadastroDependentes
  Caption = 'Cadastro de Dependentes'
  ClientHeight = 469
  ExplicitWidth = 601
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited BtPesq: TSpeedButton
    Left = 240
    OnClick = BtPesqClick
    ExplicitLeft = 240
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
    Top = 262
    Width = 81
    Height = 13
    Caption = 'C'#243'd. Funcion'#225'rio'
    FocusControl = LbCodFunc
  end
  object Label4: TLabel [4]
    Left = 8
    Top = 148
    Width = 41
    Height = 13
    Caption = 'Dt. Nasc'
  end
  object Label5: TLabel [5]
    Left = 8
    Top = 329
    Width = 59
    Height = 13
    Caption = 'C'#243'd. Cidade'
    FocusControl = LbCodCid
  end
  object Label6: TLabel [6]
    Left = 8
    Top = 356
    Width = 63
    Height = 13
    Caption = 'Nome Cidade'
    FocusControl = LbNomeCid
  end
  object Label7: TLabel [7]
    Left = 8
    Top = 290
    Width = 85
    Height = 13
    Caption = 'Nome Funcion'#225'rio'
    FocusControl = LbNomeFunc
  end
  object BtPesqFunc: TSpeedButton [8]
    Left = 240
    Top = 259
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
    OnClick = BtPesqFuncClick
  end
  object BtPesqCid: TSpeedButton [9]
    Left = 240
    Top = 325
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
  object Label8: TLabel [10]
    Left = 266
    Top = 148
    Width = 24
    Height = 13
    Caption = 'Sexo'
  end
  object Label9: TLabel [11]
    Left = 8
    Top = 187
    Width = 28
    Height = 13
    Caption = 'E-mail'
    FocusControl = LbEmail
  end
  object Label10: TLabel [12]
    Left = 8
    Top = 227
    Width = 54
    Height = 13
    Caption = 'Parentesco'
  end
  inherited GpCad: TGroupBox
    Top = 410
    ExplicitTop = 410
  end
  inherited BtsNav: TDBNavigator
    Hints.Strings = ()
  end
  object LbCod: TDBEdit [15]
    Left = 100
    Top = 65
    Width = 134
    Height = 21
    CharCase = ecUpperCase
    Color = cl3DLight
    DataField = 'COD_DEP'
    DataSource = DS
    ReadOnly = True
    TabOrder = 2
  end
  object LbNome: TDBEdit [16]
    Left = 100
    Top = 105
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = DS
    TabOrder = 3
  end
  object LbCodFunc: TDBEdit [17]
    Left = 100
    Top = 259
    Width = 134
    Height = 21
    CharCase = ecUpperCase
    DataField = 'FUNCIONARIOS_IF_FUNC'
    DataSource = DS
    TabOrder = 4
    OnExit = LbCodFuncExit
  end
  object LbCodCid: TDBEdit [18]
    Left = 100
    Top = 326
    Width = 134
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CIDADES_CID_ID'
    DataSource = DS
    TabOrder = 5
    OnExit = LbCodCidExit
  end
  object LbNomeCid: TDBEdit [19]
    Left = 100
    Top = 353
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    Color = cl3DLight
    DataField = 'NMCIDADE'
    DataSource = DS
    ReadOnly = True
    TabOrder = 6
  end
  object LbNomeFunc: TDBEdit [20]
    Left = 100
    Top = 287
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    Color = cl3DLight
    DataField = 'NMFUNC'
    DataSource = DS
    ReadOnly = True
    TabOrder = 7
  end
  object LbEmail: TDBEdit [21]
    Left = 100
    Top = 184
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'EMAIL'
    DataSource = DS
    TabOrder = 8
  end
  object CbSexo: TDBComboBox [22]
    Left = 312
    Top = 145
    Width = 88
    Height = 21
    Style = csDropDownList
    CharCase = ecUpperCase
    DataField = 'SEXO'
    DataSource = DS
    Items.Strings = (
      'M'
      'F'
      '')
    TabOrder = 9
  end
  object CbParentesco: TDBComboBox [23]
    Left = 100
    Top = 224
    Width = 134
    Height = 21
    Style = csDropDownList
    CharCase = ecUpperCase
    DataField = 'PARENTESCO'
    DataSource = DS
    Items.Strings = (
      'PAI'
      'M'#195'E'
      'FILHO(A)'
      'TIO(A)'
      'AV'#212
      'IRM'#195'(O)'
      'SOBRINHO(A)'
      'OUTRO')
    TabOrder = 10
  end
  object MskDt: TDBEdit [24]
    Left = 100
    Top = 145
    Width = 134
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DT_NASC'
    DataSource = DS
    TabOrder = 11
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT DEPENDENTES.*, CIDADES.NOME AS NMCIDADE,'
      'FUNCIONARIOS.NOME AS NMFUNC'
      ' FROM DEPENDENTES'
      ' INNER JOIN CIDADES ON'
      ' ( DEPENDENTES.CIDADES_CID_ID = CIDADES.CID_ID)'
      ''
      'INNER JOIN FUNCIONARIOS ON'
      '( DEPENDENTES.FUNCIONARIOS_IF_FUNC = '
      'FUNCIONARIOS.IF_FUNC)'
      'ORDER BY DEPENDENTES.COD_DEP')
    object QueryCOD_DEP: TIntegerField
      FieldName = 'COD_DEP'
      Origin = '"DEPENDENTES"."COD_DEP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"DEPENDENTES"."NOME"'
      Required = True
      Size = 100
    end
    object QueryFUNCIONARIOS_IF_FUNC: TIntegerField
      FieldName = 'FUNCIONARIOS_IF_FUNC'
      Origin = '"DEPENDENTES"."FUNCIONARIOS_IF_FUNC"'
      Required = True
    end
    object QueryDT_NASC: TDateField
      FieldName = 'DT_NASC'
      Origin = '"DEPENDENTES"."DT_NASC"'
      Required = True
      EditMask = '!99/99/00;1;_'
    end
    object QueryCIDADES_CID_ID: TIntegerField
      FieldName = 'CIDADES_CID_ID'
      Origin = '"DEPENDENTES"."CIDADES_CID_ID"'
      Required = True
    end
    object QueryNMCIDADE: TIBStringField
      FieldName = 'NMCIDADE'
      Origin = '"CIDADES"."NOME"'
      Required = True
      Size = 50
    end
    object QueryNMFUNC: TIBStringField
      FieldName = 'NMFUNC'
      Origin = '"FUNCIONARIOS"."NOME"'
      Required = True
      Size = 100
    end
    object QuerySEXO: TIBStringField
      FieldName = 'SEXO'
      Origin = '"DEPENDENTES"."SEXO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"DEPENDENTES"."EMAIL"'
      Required = True
      Size = 100
    end
    object QueryPARENTESCO: TIBStringField
      FieldName = 'PARENTESCO'
      Origin = '"DEPENDENTES"."PARENTESCO"'
      Required = True
      Size = 50
    end
  end
  inherited Update: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD_DEP,'
      '  NOME,'
      '  FUNCIONARIOS_IF_FUNC,'
      '  DT_NASC,'
      '  CIDADES_CID_ID'
      'from DEPENDENTES '
      'where'
      '  COD_DEP = :COD_DEP')
    ModifySQL.Strings = (
      'update DEPENDENTES'
      'set'
      '  COD_DEP = :COD_DEP,'
      '  NOME = :NOME,'
      '  FUNCIONARIOS_IF_FUNC = :FUNCIONARIOS_IF_FUNC,'
      '  DT_NASC = :DT_NASC,'
      '  CIDADES_CID_ID = :CIDADES_CID_ID'
      'where'
      '  COD_DEP = :OLD_COD_DEP')
    InsertSQL.Strings = (
      'insert into DEPENDENTES'
      '  (COD_DEP, NOME, FUNCIONARIOS_IF_FUNC, DT_NASC, CIDADES_CID_ID)'
      'values'
      
        '  (:COD_DEP, :NOME, :FUNCIONARIOS_IF_FUNC, :DT_NASC, :CIDADES_CI' +
        'D_ID)')
    DeleteSQL.Strings = (
      'delete from DEPENDENTES'
      'where'
      '  COD_DEP = :OLD_COD_DEP')
  end
end
