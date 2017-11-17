unit UnitCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask;

type
  TFrmCadastroProduto = class(TFrmCadastroPadrao)
    QueryPROD_ID: TIntegerField;
    QueryNOME: TIBStringField;
    QueryDESCRICAO: TIBStringField;
    QueryPREC_UNIT: TIBBCDField;
    QueryQTD_ESTOQUE: TIBBCDField;
    Label1: TLabel;
    LbCod: TDBEdit;
    Label2: TLabel;
    LbNome: TDBEdit;
    Label3: TLabel;
    LbDesc: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    QueryCATEGORIA: TIBStringField;
    Label6: TLabel;
    CbCat: TDBComboBox;
    MsPrec: TDBEdit;
    MskQtd: TDBEdit;
    procedure DSStateChange(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtPesqClick(Sender: TObject);
    procedure BtNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroProduto: TFrmCadastroProduto;

implementation

{$R *.dfm}

uses UnitDMConexao, UnitPesquisaProduto;

procedure TFrmCadastroProduto.BtNovoClick(Sender: TObject);
begin
  inherited;
  QueryCATEGORIA.AsString := 'PADARIA';
end;

procedure TFrmCadastroProduto.BtPesqClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaProd:= TFrmPesquisaProd.Create(Self);
    FrmPesquisaProd.ShowModal;
  finally
    if (FrmPesquisaProd.ModalResult = mrOk) then
    begin
       Query.Locate('PROD_ID',FrmPesquisaProd.QueryPROD_ID.AsInteger,
       [])
    end;
    FrmPesquisaProd.free;
  end;
end;

procedure TFrmCadastroProduto.BtSalvarClick(Sender: TObject);
begin
  if (Trim(LbNome.text) = '') then
  begin
    Application.MessageBox('Nome obrigatorio',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (Trim(LbDesc.text) = '') then
  begin
    Application.MessageBox('Digite uma descrição',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (Trim(MsPrec.text) = '') then
  begin
    Application.MessageBox('Valor obrigatorio',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (StrToFloat(MsPrec.text) < 0) then
  begin
    Application.MessageBox('Digite um valor válido',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (Trim(MskQtd.text) = '') then
  begin
    Application.MessageBox('Quantidade obrigatorio',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (StrToFloat(MskQtd.text) < 0) then
  begin
    Application.MessageBox('Digite um valor válido',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (CbCat.ItemIndex = -1) then
  BEGIN
    Application.MessageBox('Categoria obrigatória','ERRO',MB_ICONERROR+MB_OK);
    QueryCATEGORIA.AsString := 'PADARIA';
    Exit;
  END;
  inherited;

end;

procedure TFrmCadastroProduto.DSStateChange(Sender: TObject);
begin
  inherited;
  //BtPesq.Enabled := DS.State IN [dsInsert,dsEdit];
end;

procedure TFrmCadastroProduto.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  QueryPROD_ID.AsInteger := Conexao.geraPK('PROD_ID', 'PRODUTOS');
end;

end.
