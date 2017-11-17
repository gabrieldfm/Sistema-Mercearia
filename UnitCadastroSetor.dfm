inherited FrmCadastroSetor: TFrmCadastroSetor
  Caption = 'Cadastro de Setor'
  PixelsPerInch = 96
  TextHeight = 13
  inherited BtPesq: TSpeedButton
    OnClick = BtPesqClick
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 67
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = LbCod
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 107
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = LbNome
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 147
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = LbDesc
  end
  inherited BtsNav: TDBNavigator
    Hints.Strings = ()
  end
  object LbCod: TDBEdit [6]
    Left = 76
    Top = 64
    Width = 134
    Height = 21
    Color = cl3DLight
    DataField = 'ID_SET'
    DataSource = DS
    ReadOnly = True
    TabOrder = 2
  end
  object LbNome: TDBEdit [7]
    Left = 76
    Top = 104
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = DS
    TabOrder = 3
  end
  object LbDesc: TDBEdit [8]
    Left = 76
    Top = 144
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DESCRICAO'
    DataSource = DS
    TabOrder = 4
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT * FROM SETOR ORDER BY ID_SET')
    object QueryID_SET: TIntegerField
      FieldName = 'ID_SET'
      Origin = '"SETOR"."ID_SET"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"SETOR"."NOME"'
      Required = True
      Size = 100
    end
    object QueryDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"SETOR"."DESCRICAO"'
      Required = True
      Size = 200
    end
  end
  inherited Update: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID_SET,'
      '  NOME,'
      '  DESCRICAO'
      'from SETOR '
      'where'
      '  ID_SET = :ID_SET')
    ModifySQL.Strings = (
      'update SETOR'
      'set'
      '  ID_SET = :ID_SET,'
      '  NOME = :NOME,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  ID_SET = :OLD_ID_SET')
    InsertSQL.Strings = (
      'insert into SETOR'
      '  (ID_SET, NOME, DESCRICAO)'
      'values'
      '  (:ID_SET, :NOME, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from SETOR'
      'where'
      '  ID_SET = :OLD_ID_SET')
  end
end
