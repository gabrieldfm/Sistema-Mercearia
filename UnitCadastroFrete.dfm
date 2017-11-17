inherited FrmCadastroFrete: TFrmCadastroFrete
  Caption = 'Cadastro de Frete'
  ExplicitWidth = 601
  ExplicitHeight = 378
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
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = LbDesc
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 148
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object Label4: TLabel [4]
    Left = 8
    Top = 188
    Width = 15
    Height = 13
    Caption = 'Dia'
    FocusControl = LbDias
  end
  inherited BtsNav: TDBNavigator
    Hints.Strings = ()
  end
  object LbCod: TDBEdit [7]
    Left = 76
    Top = 65
    Width = 134
    Height = 21
    Color = cl3DLight
    DataField = 'ID_FRT'
    DataSource = DS
    ReadOnly = True
    TabOrder = 2
  end
  object LbDesc: TDBEdit [8]
    Left = 76
    Top = 105
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DESCRICAO'
    DataSource = DS
    TabOrder = 3
  end
  object LbDias: TDBEdit [9]
    Left = 76
    Top = 185
    Width = 134
    Height = 21
    DataField = 'DIAS'
    DataSource = DS
    TabOrder = 4
  end
  object CbTp: TDBComboBox [10]
    Left = 76
    Top = 145
    Width = 134
    Height = 21
    Style = csDropDownList
    CharCase = ecUpperCase
    DataField = 'TIPO'
    DataSource = DS
    Items.Strings = (
      'RODOVI'#193'RIO'
      'MAR'#205'TIMO'
      'A'#201'REO')
    TabOrder = 5
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT * FROM FRETE ORDER BY ID_FRT')
    object QueryID_FRT: TIntegerField
      FieldName = 'ID_FRT'
      Origin = '"FRETE"."ID_FRT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"FRETE"."DESCRICAO"'
      Required = True
      Size = 100
    end
    object QueryTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"FRETE"."TIPO"'
      Required = True
      Size = 200
    end
    object QueryDIAS: TIntegerField
      FieldName = 'DIAS'
      Origin = '"FRETE"."DIAS"'
    end
  end
  inherited Update: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID_FRT,'
      '  DESCRICAO,'
      '  TIPO,'
      '  DIAS'
      'from FRETE '
      'where'
      '  ID_FRT = :ID_FRT')
    ModifySQL.Strings = (
      'update FRETE'
      'set'
      '  ID_FRT = :ID_FRT,'
      '  DESCRICAO = :DESCRICAO,'
      '  TIPO = :TIPO,'
      '  DIAS = :DIAS'
      'where'
      '  ID_FRT = :OLD_ID_FRT')
    InsertSQL.Strings = (
      'insert into FRETE'
      '  (ID_FRT, DESCRICAO, TIPO, DIAS)'
      'values'
      '  (:ID_FRT, :DESCRICAO, :TIPO, :DIAS)')
    DeleteSQL.Strings = (
      'delete from FRETE'
      'where'
      '  ID_FRT = :OLD_ID_FRT')
  end
end
