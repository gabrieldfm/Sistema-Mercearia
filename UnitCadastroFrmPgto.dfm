inherited FrmCadastroFrmPgto: TFrmCadastroFrmPgto
  Caption = 'Cadastro de Forma de Pagamento'
  ExplicitWidth = 601
  ExplicitHeight = 378
  PixelsPerInch = 96
  TextHeight = 13
  inherited BtPesq: TSpeedButton
    OnClick = BtPesqClick
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 70
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
    Width = 40
    Height = 13
    Caption = 'Parcelas'
    FocusControl = LbParc
  end
  object Label4: TLabel [4]
    Left = 8
    Top = 188
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  inherited BtsNav: TDBNavigator
    Hints.Strings = ()
  end
  object LbCod: TDBEdit [7]
    Left = 76
    Top = 65
    Width = 134
    Height = 21
    CharCase = ecUpperCase
    Color = cl3DLight
    DataField = 'IF_FRM_PGTO'
    DataSource = DS
    ReadOnly = True
    TabOrder = 2
  end
  object LbDesc: TDBEdit [8]
    Left = 76
    Top = 105
    Width = 253
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DESCRICAO'
    DataSource = DS
    TabOrder = 3
  end
  object LbParc: TDBEdit [9]
    Left = 76
    Top = 145
    Width = 134
    Height = 21
    CharCase = ecUpperCase
    DataField = 'PARCELAS'
    DataSource = DS
    TabOrder = 4
  end
  object CbTp: TDBComboBox [10]
    Left = 76
    Top = 185
    Width = 134
    Height = 21
    Style = csDropDownList
    CharCase = ecUpperCase
    DataField = 'TIPO'
    DataSource = DS
    Items.Strings = (
      'DINHEIRO'
      'CART'#195'O DE CR'#201'DITO'
      'CART'#195'O DE D'#201'BITO'
      'CHEQUE'
      'TRANSFER'#202'NCIA BANC'#193'RIA')
    TabOrder = 5
  end
  inherited Query: TIBQuery
    SQL.Strings = (
      'SELECT * FROM FRMPAGTO ORDER BY IF_FRM_PGTO')
    object QueryIF_FRM_PGTO: TIntegerField
      FieldName = 'IF_FRM_PGTO'
      Origin = '"FRMPAGTO"."IF_FRM_PGTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"FRMPAGTO"."DESCRICAO"'
      Required = True
      Size = 10
    end
    object QueryPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      Origin = '"FRMPAGTO"."PARCELAS"'
      Required = True
    end
    object QueryTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"FRMPAGTO"."TIPO"'
      Size = 100
    end
  end
  inherited Update: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  IF_FRM_PGTO,'
      '  DESCRICAO,'
      '  PARCELAS,'
      '  TIPO'
      'from FRMPAGTO '
      'where'
      '  IF_FRM_PGTO = :IF_FRM_PGTO')
    ModifySQL.Strings = (
      'update FRMPAGTO'
      'set'
      '  IF_FRM_PGTO = :IF_FRM_PGTO,'
      '  DESCRICAO = :DESCRICAO,'
      '  PARCELAS = :PARCELAS,'
      '  TIPO = :TIPO'
      'where'
      '  IF_FRM_PGTO = :OLD_IF_FRM_PGTO')
    InsertSQL.Strings = (
      'insert into FRMPAGTO'
      '  (IF_FRM_PGTO, DESCRICAO, PARCELAS, TIPO)'
      'values'
      '  (:IF_FRM_PGTO, :DESCRICAO, :PARCELAS, :TIPO)')
    DeleteSQL.Strings = (
      'delete from FRMPAGTO'
      'where'
      '  IF_FRM_PGTO = :OLD_IF_FRM_PGTO')
  end
end
