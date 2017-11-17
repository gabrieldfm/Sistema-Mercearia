unit UnitCadastroDependentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask;

type
  TFrmCadastroDependentes = class(TFrmCadastroPadrao)
    QueryCOD_DEP: TIntegerField;
    QueryNOME: TIBStringField;
    QueryFUNCIONARIOS_IF_FUNC: TIntegerField;
    QueryDT_NASC: TDateField;
    QueryCIDADES_CID_ID: TIntegerField;
    QueryNMCIDADE: TIBStringField;
    QueryNMFUNC: TIBStringField;
    Label1: TLabel;
    LbCod: TDBEdit;
    Label2: TLabel;
    LbNome: TDBEdit;
    Label3: TLabel;
    LbCodFunc: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    LbCodCid: TDBEdit;
    Label6: TLabel;
    LbNomeCid: TDBEdit;
    Label7: TLabel;
    LbNomeFunc: TDBEdit;
    BtPesqFunc: TSpeedButton;
    BtPesqCid: TSpeedButton;
    QuerySEXO: TIBStringField;
    QueryEMAIL: TIBStringField;
    QueryPARENTESCO: TIBStringField;
    Label8: TLabel;
    Label9: TLabel;
    LbEmail: TDBEdit;
    Label10: TLabel;
    CbSexo: TDBComboBox;
    CbParentesco: TDBComboBox;
    MskDt: TDBEdit;
    procedure DSStateChange(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure BtPesqCidClick(Sender: TObject);
    procedure BtPesqFuncClick(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure LbCodCidExit(Sender: TObject);
    procedure LbCodFuncExit(Sender: TObject);
    procedure BtPesqClick(Sender: TObject);
    procedure BtNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroDependentes: TFrmCadastroDependentes;

implementation

{$R *.dfm}

uses UnitDMConexao, UnitPesquisaCidade, UnitPesquisaFuncionarios,
  UnitPesquisaDependentes;

procedure TFrmCadastroDependentes.BtNovoClick(Sender: TObject);
begin
  inherited;
  QueryDT_NASC.AsDateTime:= now;
  QueryPARENTESCO.AsString := 'PAI';
  QuerySEXO.AsString := 'M';
end;

procedure TFrmCadastroDependentes.BtPesqCidClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaCidades := TFrmPesquisaCidades.Create(Self);
    FrmPesquisaCidades.ShowModal;
  finally
    if (FrmPesquisaCidades.ModalResult = mrOk) then
    begin
       QueryCIDADES_CID_ID.AsInteger:= FrmPesquisaCidades.QueryCID_ID.AsInteger;
       QueryNMCIDADE.AsString:= FrmPesquisaCidades.QueryNOME.AsString;
    end;
    FrmPesquisaCidades.free;
  end;
end;

procedure TFrmCadastroDependentes.BtPesqClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaDependentes := TFrmPesquisaDependentes.Create(Self);
    FrmPesquisaDependentes.ShowModal;
  finally
    if (FrmPesquisaDependentes.ModalResult = mrOk) then
    begin
       QueryCOD_DEP.AsInteger:= FrmPesquisaDependentes.QueryCOD_DEP.AsInteger;
       QueryNOME.AsString:= FrmPesquisaDependentes.QueryNOME.AsString;
    end;
    FrmPesquisaCidades.free;
  end;
end;

procedure TFrmCadastroDependentes.BtPesqFuncClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaFuncionario := TFrmPesquisaFuncionario.Create(Self);
    FrmPesquisaFuncionario.ShowModal;
  finally
    if (FrmPesquisaFuncionario.ModalResult = mrOk) then
    begin
       QueryFUNCIONARIOS_IF_FUNC.AsInteger:= FrmPesquisaFuncionario.QueryIF_FUNC.AsInteger;
       QueryNMFUNC.AsString:= FrmPesquisaFuncionario.QueryNOME.AsString;
    end;
    FrmPesquisaCidades.free;
  end;
end;

procedure TFrmCadastroDependentes.BtSalvarClick(Sender: TObject);
begin
  if (Trim(LbNome.text) = '') then
  begin
    Application.MessageBox('Nome obrigatorio',  'ERRO',MB_ICONERROR+MB_OK);
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
  if (Trim(LbCodFunc.text) = '') then
  begin
    Application.MessageBox('Informe o código do funcionário',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (CbSexo.ItemIndex = -1) then
  BEGIN
    Application.MessageBox('Sexo obrigatorio','ERRO',MB_ICONERROR+MB_OK);
    QuerySEXO.AsString := 'M';
    Exit;
  END;
  if (CbParentesco.ItemIndex = -1) then
  BEGIN
    Application.MessageBox('Informe o grau de parentesco','ERRO',MB_ICONERROR+MB_OK);
    QueryPARENTESCO.AsString := 'PAI';
    Exit;
  END;
  if (Trim(LbEmail.text) = '') then
  begin
    Application.MessageBox('Informe o E-mail',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  inherited;

end;

procedure TFrmCadastroDependentes.DSStateChange(Sender: TObject);
begin
  inherited;
  //BtPesq.Enabled := DS.State IN [dsInsert,dsEdit];
  BtPesqFunc.Enabled := DS.State IN [dsInsert,dsEdit];
  BtPesqCid.Enabled := DS.State IN [dsInsert,dsEdit];
end;

procedure TFrmCadastroDependentes.LbCodCidExit(Sender: TObject);
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
  QueryNMCIDADE.AsString := Conexao.Query.FieldByName('NOME').AsString;
end;

procedure TFrmCadastroDependentes.LbCodFuncExit(Sender: TObject);
var
  Sql : string;
begin
  inherited;
  if (LbCodFunc.Text = '') then
  begin
    exit;
  end;

  sql:= 'SELECT NOME FROM FUNCIONARIOS WGERE IF_FUNC = ' +  LbCodFunc.Text;
  Conexao.alteraSQL(Conexao.Query, sql);
  if (Conexao.Query.IsEmpty) then
  begin
    Application.MessageBox('Registro não localizado', 'ERRO'
    ,MB_OK);
    LbCodFunc.SetFocus;
    Exit;
  end;
  QueryNMFUNC.AsString := Conexao.Query.FieldByName('NOME').AsString;
end;

procedure TFrmCadastroDependentes.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  QueryCOD_DEP.AsInteger := Conexao.geraPK('COD_DEP', 'DEPENDENTES');
end;

end.
