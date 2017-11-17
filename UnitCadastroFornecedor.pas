unit UnitCadastroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask;

type
  TFrmCadastroFornecedor = class(TFrmCadastroPadrao)
    QueryFOR_ID: TIntegerField;
    QueryNOME: TIBStringField;
    QueryCPFCNPJ: TIBStringField;
    QueryCIDADES_CID_ID: TIntegerField;
    QueryNOME1: TIBStringField;
    Label1: TLabel;
    LbCod: TDBEdit;
    Label2: TLabel;
    LbNome: TDBEdit;
    Label3: TLabel;
    LbIdentificacao: TDBEdit;
    Label4: TLabel;
    LbCodCid: TDBEdit;
    Label5: TLabel;
    LbNomeCid: TDBEdit;
    BtPesqCid: TSpeedButton;
    QueryTELEFONE: TIBStringField;
    QueryEMAIL: TIBStringField;
    Label6: TLabel;
    Label7: TLabel;
    LbEmail: TDBEdit;
    MskTel: TMaskEdit;
    procedure DSStateChange(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtPesqClick(Sender: TObject);
    procedure BtPesqCidClick(Sender: TObject);
    procedure LbCodCidExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroFornecedor: TFrmCadastroFornecedor;

implementation

{$R *.dfm}

uses UnitDMConexao, UnitPesquisaFornecedor, UnitPesquisaCidade;

procedure TFrmCadastroFornecedor.BtPesqCidClick(Sender: TObject);
begin
  inherited;
   try
    FrmPesquisaCidades := TFrmPesquisaCidades.Create(Self);
    FrmPesquisaCidades.ShowModal;
  finally
    if (FrmPesquisaCidades.ModalResult = mrOk) then
    begin
       QueryCIDADES_CID_ID.AsInteger:= FrmPesquisaCidades.QueryCID_ID.AsInteger;
       QueryNOME1.AsString:= FrmPesquisaCidades.QueryNOME.AsString;
    end;
    FrmPesquisaCidades.free;
  end;
end;

procedure TFrmCadastroFornecedor.BtPesqClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaFornecedor := TFrmPesquisaFornecedor.Create(Self);
    FrmPesquisaFornecedor.ShowModal;
  finally
    if (FrmPesquisaFornecedor.ModalResult = mrOk) then
    begin
       Query.Locate('FOR_ID',FrmPesquisaFornecedor.QueryFOR_ID.AsInteger,[]) ;
    end;
    FrmPesquisaFornecedor.free;
  end;
end;

procedure TFrmCadastroFornecedor.BtSalvarClick(Sender: TObject);
begin

  if (Trim(LbNome.text) = '') then
  begin
    Application.MessageBox('Nome obrigatorio',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (Trim(LbIdentificacao.text) = '') then
  begin
    Application.MessageBox('Digite o CPF/CNPJ',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (Length(LbIdentificacao.text) < 11) then
  begin
    Application.MessageBox('Digite um CPF/CNPJ válido',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (Trim(LbCodCid.text) = '') then
  begin
    Application.MessageBox('Informe o código da cidade',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (Trim(LbEmail.text) = '') then
  begin
    Application.MessageBox('Informe o E-mail',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  inherited;

end;

procedure TFrmCadastroFornecedor.DSStateChange(Sender: TObject);
begin
  inherited;
  //BtPesq.Enabled := DS.State IN [dsInsert,dsEdit];
  BtPesqCid.Enabled := DS.State IN [dsInsert,dsEdit];
end;

procedure TFrmCadastroFornecedor.LbCodCidExit(Sender: TObject);
var
  Sql : string;
begin
  inherited;
  if (LbCodCid.Text = '') then
  begin
    exit;
  end;

  sql:= 'SELECT NOME FROM CIDADES WHERE CID_ID = ' +  LbCodCid.Text;
  Conexao.alteraSQL(Conexao.Query, sql);
  if (Conexao.Query.IsEmpty) then
  begin
    Application.MessageBox('Registro não localizado', 'ERRO'
    ,MB_OK);
    LbCodCid.SetFocus;
    Exit;
  end;
  QueryNOME1.AsString := Conexao.Query.FieldByName('NOME').AsString;

end;

procedure TFrmCadastroFornecedor.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  QueryFOR_ID.AsInteger := Conexao.geraPK('FOR_ID', 'FORNECEDOR');
end;

end.
