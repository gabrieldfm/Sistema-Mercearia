unit UnitCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask;

type
  TFrmCadastroCliente = class(TFrmCadastroPadrao)
    QueryCLI_ID: TIntegerField;
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
    QuerySEXO: TIBStringField;
    QueryEMAIL: TIBStringField;
    QueryTELEFONE: TIBStringField;
    Label6: TLabel;
    Label7: TLabel;
    LbEmail: TDBEdit;
    Label8: TLabel;
    CbSexo: TDBComboBox;
    DBEdit1: TDBEdit;
    procedure DSStateChange(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure BtPesqCidClick(Sender: TObject);
    procedure LbCodCidExit(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtPesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroCliente: TFrmCadastroCliente;

implementation

{$R *.dfm}

uses UnitDMConexao, UnitPesquisaCidade, UnitPesquisaCliente;

procedure TFrmCadastroCliente.BtPesqCidClick(Sender: TObject);
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

procedure TFrmCadastroCliente.BtPesqClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaCliente := TFrmPesquisaCliente.Create(Self);
    FrmPesquisaCliente.ShowModal;
  finally
    if (FrmPesquisaCliente.ModalResult = mrOk) then
    begin
       Query.Locate('CLI_ID',FrmPesquisaCliente.QueryCLI_ID.AsInteger,[]) ;
    end;
    FrmPesquisaCliente.free;
  end;
end;

procedure TFrmCadastroCliente.BtSalvarClick(Sender: TObject);
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
  if (CbSexo.ItemIndex = -1) then
  BEGIN
    Application.MessageBox('Sexo obrigatorio','ERRO',MB_ICONERROR+MB_OK);
    QuerySEXO.AsString := 'M';
    Exit;
  END;
  inherited;

end;

procedure TFrmCadastroCliente.DSStateChange(Sender: TObject);
begin
  inherited;
  //BtPesq.Enabled := DS.State IN [dsInsert,dsEdit];
  BtPesqCid.Enabled := DS.State IN [dsInsert,dsEdit];
end;

procedure TFrmCadastroCliente.LbCodCidExit(Sender: TObject);
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

procedure TFrmCadastroCliente.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  QueryCLI_ID.AsInteger := Conexao.geraPK('CLI_ID', 'CLIENTE');
end;

end.
