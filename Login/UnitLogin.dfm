object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 183
  ClientWidth = 243
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object LbLogin: TLabeledEdit
    Left = 40
    Top = 32
    Width = 164
    Height = 21
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'Login'
    TabOrder = 0
  end
  object LbSenha: TLabeledEdit
    Left = 40
    Top = 80
    Width = 164
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'Senha'
    PasswordChar = '*'
    TabOrder = 1
  end
  object BtEntrar: TBitBtn
    Left = 40
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 2
    OnClick = BtEntrarClick
  end
  object BtCancelar: TBitBtn
    Left = 129
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = BtCancelarClick
  end
end
