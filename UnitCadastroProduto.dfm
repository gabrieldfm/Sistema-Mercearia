inherited FrmCadastroProduto: TFrmCadastroProduto
  Caption = 'Cadastro de Produto'
  ClientHeight = 369
  ExplicitWidth = 601
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 13
  inherited BtPesq: TSpeedButton
    OnClick = BtPesqClick
  end
  object Label1: TLabel [1]
    Left = 9
    Top = 68
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = LbCod
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 106
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = LbNome
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 148
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = LbDesc
  end
  object Label4: TLabel [4]
    Left = 8
    Top = 188
    Width = 59
    Height = 13
    Caption = 'Prc. Unit'#225'rio'
  end
  object Label5: TLabel [5]
    Left = 8
    Top = 226
    Width = 64
    Height = 13
    Caption = 'Qtd. Estoque'
  end
  object Label6: TLabel [6]
    Left = 8
    Top = 264
    Width = 47
    Height = 13
    Caption = 'Categoria'
  end
  inherited GpCad: TGroupBox
    Top = 310
    ExplicitTop = 310
  end
  inherited BtsNav: TDBNavigator
    Hints.Strings = ()
  end
  object LbCod: TDBEdit [9]
    Left = 76
    Top = 65
    Width = 134
    Height = 21
    Color = cl3DLight
    DataField = 'PROD_ID'
    DataSource = DS
    ReadOnly = True
    TabOrder = 2
  end
  object LbNome: TDBEdit [10]
    Left = 76
    Top = 105
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = DS
    TabOrder = 3
  end
  object LbDesc: TDBEdit [11]
    Left = 76
    Top = 145
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DESCRICAO'
    DataSource = DS
    TabOrder = 4
  end
  object CbCat: TDBComboBox [12]
    Left = 76
    Top = 261
    Width = 120
    Height = 21
    Style = csDropDownList
    CharCase = ecUpperCase
    DataField = 'CATEGORIA'
    DataSource = DS
    Items.Strings = (
      'PADARIA'
      'CARNES'
      'HIGIENE'
      'BEBIDAS'
      'FRIOS'
      'FRUTAS'
      'VERDURAS'
      '')
    TabOrder = 5
  end
  object MsPrec: TDBEdit [13]
    Left = 76
    Top = 185
    Width = 120
    Height = 21
    CharCase = ecUpperCase
    DataField = 'PREC_UNIT'
    DataSource = DS
    TabOrder = 6
  end
  object MskQtd: TDBEdit [14]
    Left = 78
    Top = 223
    Width = 118
    Height = 21
    CharCase = ecUpperCase
    DataField = 'QTD_ESTOQUE'
    DataSource = DS
    TabOrder = 7
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT * FROM PRODUTOS ORDER BY PROD_ID')
    object QueryPROD_ID: TIntegerField
      FieldName = 'PROD_ID'
      Origin = '"PRODUTOS"."PROD_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"PRODUTOS"."NOME"'
      Required = True
      Size = 50
    end
    object QueryDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"PRODUTOS"."DESCRICAO"'
      Size = 200
    end
    object QueryPREC_UNIT: TIBBCDField
      FieldName = 'PREC_UNIT'
      Origin = '"PRODUTOS"."PREC_UNIT"'
      Required = True
      DisplayFormat = '#.##0,00'
      Precision = 18
      Size = 2
    end
    object QueryQTD_ESTOQUE: TIBBCDField
      FieldName = 'QTD_ESTOQUE'
      Origin = '"PRODUTOS"."QTD_ESTOQUE"'
      Required = True
      Precision = 18
      Size = 2
    end
    object QueryCATEGORIA: TIBStringField
      FieldName = 'CATEGORIA'
      Origin = '"PRODUTOS"."CATEGORIA"'
      Required = True
      Size = 100
    end
  end
  inherited Update: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  PROD_ID,'
      '  NOME,'
      '  DESCRICAO,'
      '  PREC_UNIT,'
      '  QTD_ESTOQUE'
      'from PRODUTOS '
      'where'
      '  PROD_ID = :PROD_ID')
    ModifySQL.Strings = (
      'update PRODUTOS'
      'set'
      '  PROD_ID = :PROD_ID,'
      '  NOME = :NOME,'
      '  DESCRICAO = :DESCRICAO,'
      '  PREC_UNIT = :PREC_UNIT,'
      '  QTD_ESTOQUE = :QTD_ESTOQUE'
      'where'
      '  PROD_ID = :OLD_PROD_ID')
    InsertSQL.Strings = (
      'insert into PRODUTOS'
      '  (PROD_ID, NOME, DESCRICAO, PREC_UNIT, QTD_ESTOQUE)'
      'values'
      '  (:PROD_ID, :NOME, :DESCRICAO, :PREC_UNIT, :QTD_ESTOQUE)')
    DeleteSQL.Strings = (
      'delete from PRODUTOS'
      'where'
      '  PROD_ID = :OLD_PROD_ID')
  end
end
