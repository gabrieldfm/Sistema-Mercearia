inherited FrmCadastroCargo: TFrmCadastroCargo
  Caption = 'Cadastro de Cargos'
  ClientHeight = 314
  ExplicitWidth = 601
  ExplicitHeight = 353
  PixelsPerInch = 96
  TextHeight = 13
  inherited BtPesq: TSpeedButton
    Left = 183
    OnClick = BtPesqClick
    ExplicitLeft = 183
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
    Top = 150
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = LbDesc
  end
  object Label4: TLabel [4]
    Left = 8
    Top = 192
    Width = 58
    Height = 13
    Caption = 'Sal'#225'rio Base'
    FocusControl = LbSalBase
  end
  inherited GpCad: TGroupBox
    Top = 255
    ExplicitTop = 255
  end
  inherited BtsNav: TDBNavigator
    Hints.Strings = ()
  end
  object LbCod: TDBEdit [7]
    Left = 85
    Top = 65
    Width = 92
    Height = 21
    Color = cl3DLight
    DataField = 'CRG'
    DataSource = DS
    ReadOnly = True
    TabOrder = 2
  end
  object LbNome: TDBEdit [8]
    Left = 85
    Top = 105
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = DS
    TabOrder = 3
  end
  object LbDesc: TDBEdit [9]
    Left = 85
    Top = 147
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DESCRICAO'
    DataSource = DS
    TabOrder = 4
  end
  object LbSalBase: TDBEdit [10]
    Left = 85
    Top = 189
    Width = 121
    Height = 21
    DataField = 'SAL_BASE'
    DataSource = DS
    TabOrder = 5
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT * FROM CARGOS ORDER BY CRG')
    object QueryCRG: TIntegerField
      FieldName = 'CRG'
      Origin = '"CARGOS"."CRG"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"CARGOS"."NOME"'
      Required = True
      Size = 100
    end
    object QueryDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"CARGOS"."DESCRICAO"'
      Size = 200
    end
    object QuerySAL_BASE: TIBBCDField
      FieldName = 'SAL_BASE '
      Origin = '"CARGOS"."SAL_BASE"'
      Required = True
      DisplayFormat = '#.##0,00'
      Precision = 18
      Size = 2
    end
  end
  inherited Update: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CRG,'
      '  NOME,'
      '  DESCRICAO,'
      '  SAL_BASE'
      'from CARGOS '
      'where'
      '  CRG = :CRG')
    ModifySQL.Strings = (
      'update CARGOS'
      'set'
      '  CRG = :CRG,'
      '  NOME = :NOME,'
      '  DESCRICAO = :DESCRICAO,'
      '  SAL_BASE = :SAL_BASE'
      'where'
      '  CRG = :OLD_CRG')
    InsertSQL.Strings = (
      'insert into CARGOS'
      '  (CRG, NOME, DESCRICAO, SAL_BASE)'
      'values'
      '  (:CRG, :NOME, :DESCRICAO, :SAL_BASE)')
    DeleteSQL.Strings = (
      'delete from CARGOS'
      'where'
      '  CRG = :OLD_CRG')
  end
end
