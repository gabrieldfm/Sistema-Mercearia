unit UnitCadastroFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask;

type
  TFrmCadastroFuncionario = class(TFrmCadastroPadrao)
    QueryIF_FUNC: TIntegerField;
    QueryNOME: TIBStringField;
    QueryCPF: TIBStringField;
    QueryDT_NASC: TDateField;
    QuerySETOR_ID_SET: TIntegerField;
    QueryCIDADES_CID_ID: TIntegerField;
    QueryNOME1: TIBStringField;
    QueryNOME2: TIBStringField;
    Label1: TLabel;
    LbCod: TDBEdit;
    Label2: TLabel;
    LbNome: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    LbCodSet: TDBEdit;
    Label6: TLabel;
    LbCodCid: TDBEdit;
    Label7: TLabel;
    LbNomeSet: TDBEdit;
    Label8: TLabel;
    LbNomeCid: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    MskDt: TMaskEdit;
    MskCpf: TMaskEdit;
    BtPesqSetor: TSpeedButton;
    BtPesqCid: TSpeedButton;
    QuerySEXO: TIBStringField;
    QueryTELEFONE: TIBStringField;
    QueryEMAIL: TIBStringField;
    QueryCARGOS_CRG: TIntegerField;
    Label3: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    LbEmail: TDBEdit;
    Label13: TLabel;
    LbCodCargo: TDBEdit;
    MskTel: TMaskEdit;
    QueryNMCARGO: TIBStringField;
    Label14: TLabel;
    LbNomeCargo: TDBEdit;
    BtPesqCargo: TSpeedButton;
    CbSexo: TDBComboBox;
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure DSStateChange(Sender: TObject);
    procedure BtPesqCidClick(Sender: TObject);
    procedure BtPesqSetorClick(Sender: TObject);
    procedure LbCodCidExit(Sender: TObject);
    procedure LbCodSetExit(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtPesqClick(Sender: TObject);
    procedure BtNovoClick(Sender: TObject);
    procedure BtPesqCargoClick(Sender: TObject);
    procedure LbCodCargoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroFuncionario: TFrmCadastroFuncionario;

implementation

{$R *.dfm}

uses UnitDMConexao, UnitPesquisaCidade, UnitPesquisaSetor,
  UnitPesquisaFuncionarios, UnitPesquisaCargos;

procedure TFrmCadastroFuncionario.BtNovoClick(Sender: TObject);
begin
  inherited;
  QueryDT_NASC.AsDateTime:= now;
  QuerySEXO.AsString := 'M';

end;

procedure TFrmCadastroFuncionario.BtPesqCargoClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaCargos := TFrmPesquisaCargos.Create(Self);
    FrmPesquisaCargos.ShowModal;
  finally
    if (FrmPesquisaCargos.ModalResult = mrOk) then
    begin
       QueryCARGOS_CRG.AsInteger:= FrmPesquisaCargos.QueryCRG.AsInteger;
       QueryNMCARGO.AsString:= FrmPesquisaCargos.QueryNOME.AsString;
    end;
    FrmPesquisaCidades.free;
  end;
end;

procedure TFrmCadastroFuncionario.BtPesqCidClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaCidades := TFrmPesquisaCidades.Create(Self);
    FrmPesquisaCidades.ShowModal;
  finally
    if (FrmPesquisaCidades.ModalResult = mrOk) then
    begin
       QueryCIDADES_CID_ID.AsInteger:= FrmPesquisaCidades.QueryCID_ID.AsInteger;
       QueryNOME2.AsString:= FrmPesquisaCidades.QueryNOME.AsString;
    end;
    FrmPesquisaCidades.free;
  end;
end;

procedure TFrmCadastroFuncionario.BtPesqClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaFuncionario := TFrmPesquisaFuncionario.Create(Self);
    FrmPesquisaFuncionario.ShowModal;
  finally
    if (FrmPesquisaFuncionario.ModalResult = mrOk) then
    begin
       QueryIF_FUNC.AsInteger:= FrmPesquisaFuncionario.QueryIF_FUNC.AsInteger;
       QueryNOME.AsString:= FrmPesquisaFuncionario.QueryNOME.AsString;
    end;
    FrmPesquisaCidades.free;
  end;
end;

procedure TFrmCadastroFuncionario.BtPesqSetorClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaSetor := TFrmPesquisaSetor.Create(Self);
    FrmPesquisaSetor.ShowModal;
  finally
    if (FrmPesquisaSetor.ModalResult = mrOk) then
    begin
       QuerySETOR_ID_SET.AsInteger:= FrmPesquisaSetor.QueryID_SET.AsInteger;
       QueryNOME1.AsString:= FrmPesquisaSetor.QueryNOME.AsString;
    end;
    FrmPesquisaCidades.free;
  end;
end;

procedure TFrmCadastroFuncionario.BtSalvarClick(Sender: TObject);
begin
  if (Trim(LbNome.text) = '') then
  begin
    Application.MessageBox('Nome obrigatorio',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (Trim(MskCpf.text) = '') then
  begin
    Application.MessageBox('Digite o CPF',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (Length(MskCpf.Text) < 11) then
  begin
    Application.MessageBox('Digite um CPF válido',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (Trim(MskDt.Text) = '') then
  begin
    Application.MessageBox('Informe a data de nascimento',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (Trim(LbCodCid.text) = '') then
  begin
    Application.MessageBox('Informe o código da cidade',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (Trim(LbCodSet.text) = '') then
  begin
    Application.MessageBox('Informe o código do setor',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (Trim(LbCodCargo.text) = '') then
  begin
    Application.MessageBox('Informe o código do cargo',  'ERRO',MB_ICONERROR+MB_OK);
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

procedure TFrmCadastroFuncionario.DSStateChange(Sender: TObject);
begin
  inherited;
  //BtPesq.Enabled := DS.State IN [dsInsert,dsEdit];
  BtPesqSetor.Enabled := DS.State IN [dsInsert,dsEdit];
  BtPesqCid.Enabled := DS.State IN [dsInsert,dsEdit];
  BtPesqCargo.Enabled := DS.State IN [dsInsert,dsEdit];
end;

procedure TFrmCadastroFuncionario.LbCodCargoExit(Sender: TObject);
var
  Sql : string;
begin
  inherited;
   if (LbCodCargo.Text = '') then
  begin
    exit;
  end;

  sql:= 'SELECT NOME FROM CARGOS WHERE CRG = ' +  LbCodCargo.Text;
  Conexao.alteraSQL(Conexao.Query, sql);
  if (Conexao.Query.IsEmpty) then
  begin
    Application.MessageBox('Registro não localizado', 'ERRO'
    ,MB_OK);
    LbCodCargo.SetFocus;
    Exit;
  end;
  QueryNMCARGO.AsString := Conexao.Query.FieldByName('NOME').AsString
end;

procedure TFrmCadastroFuncionario.LbCodCidExit(Sender: TObject);
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
  QueryNOME2.AsString := Conexao.Query.FieldByName('NOME').AsString;

end;

procedure TFrmCadastroFuncionario.LbCodSetExit(Sender: TObject);
var
  Sql : string;
begin
  inherited;
   if (LbCodSet.Text = '') then
  begin
    exit;
  end;

  sql:= 'SELECT NOME FROM SETOR WHERE ID_SET = ' +  LbCodSet.Text;
  Conexao.alteraSQL(Conexao.Query, sql);
  if (Conexao.Query.IsEmpty) then
  begin
    Application.MessageBox('Registro não localizado', 'ERRO'
    ,MB_OK);
    LbCodSet.SetFocus;
    Exit;
  end;
  QueryNOME1.AsString := Conexao.Query.FieldByName('NOME').AsString;
end;

procedure TFrmCadastroFuncionario.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  QueryIF_FUNC.AsInteger := Conexao.geraPK('IF_FUNC', 'FUNCIONARIOS');
end;

end.
