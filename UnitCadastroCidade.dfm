inherited FrmCadastroCidade: TFrmCadastroCidade
  Caption = 'Cadastro de Cidade'
  ClientHeight = 253
  ExplicitWidth = 601
  ExplicitHeight = 292
  PixelsPerInch = 96
  TextHeight = 13
  inherited BtPesq: TSpeedButton
    Left = 207
    OnClick = BtPesqClick
    ExplicitLeft = 207
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
    Top = 144
    Width = 22
    Height = 13
    Caption = 'Sigla'
  end
  inherited GpCad: TGroupBox
    Top = 194
    ExplicitTop = 194
  end
  inherited BtsNav: TDBNavigator
    Hints.Strings = ()
  end
  object LbCod: TDBEdit [6]
    Left = 67
    Top = 65
    Width = 134
    Height = 21
    Color = cl3DLight
    DataField = 'CID_ID'
    DataSource = DS
    ReadOnly = True
    TabOrder = 2
  end
  object LbNome: TDBEdit [7]
    Left = 67
    Top = 105
    Width = 300
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = DS
    TabOrder = 3
  end
  object CbSigla: TDBComboBox [8]
    Left = 67
    Top = 141
    Width = 145
    Height = 21
    Style = csDropDownList
    CharCase = ecUpperCase
    DataField = 'SIGLA'
    DataSource = DS
    Items.Strings = (
      'AC'#9' '
      'AL'#9' '
      'AP'#9' '
      'AM'#9' '
      'BA'#9' '
      'CE'#9' '
      'DF'#9' '
      'ES'#9' '
      'GO'#9' '
      'MA'#9' '
      'MT'#9' '
      'MS'#9' '
      'MG'#9' '
      'PA'#9' '
      'PB'#9' '
      'PR'#9' '
      'PE'#9' '
      'PI'#9' '
      'RJ'#9' '
      'RN'#9' '
      'RS'#9' '
      'RO'#9' '
      'RR'#9' '
      'SC'#9' '
      'SP'#9' '
      'SE'#9' '
      'TO')
    TabOrder = 4
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT * FROM CIDADES ORDER BY CID_ID')
    object QueryCID_ID: TIntegerField
      FieldName = 'CID_ID'
      Origin = '"CIDADES"."CID_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"CIDADES"."NOME"'
      Required = True
      Size = 50
    end
    object QuerySIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = '"CIDADES"."SIGLA"'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  inherited Update: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CID_ID,'
      '  NOME,'
      '  SIGLA'
      'from CIDADES '
      'where'
      '  CID_ID = :CID_ID')
    ModifySQL.Strings = (
      'update CIDADES'
      'set'
      '  CID_ID = :CID_ID,'
      '  NOME = :NOME,'
      '  SIGLA = :SIGLA'
      'where'
      '  CID_ID = :OLD_CID_ID')
    InsertSQL.Strings = (
      'insert into CIDADES'
      '  (CID_ID, NOME, SIGLA)'
      'values'
      '  (:CID_ID, :NOME, :SIGLA)')
    DeleteSQL.Strings = (
      'delete from CIDADES'
      'where'
      '  CID_ID = :OLD_CID_ID')
  end
end
