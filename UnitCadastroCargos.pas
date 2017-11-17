unit UnitCadastroCargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask;

type
  TFrmCadastroCargo = class(TFrmCadastroPadrao)
    QueryCRG: TIntegerField;
    QueryNOME: TIBStringField;
    QueryDESCRICAO: TIBStringField;
    QuerySAL_BASE: TIBBCDField;
    Label1: TLabel;
    LbCod: TDBEdit;
    Label2: TLabel;
    LbNome: TDBEdit;
    Label3: TLabel;
    LbDesc: TDBEdit;
    Label4: TLabel;
    LbSalBase: TDBEdit;
    procedure DSStateChange(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtPesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroCargo: TFrmCadastroCargo;

implementation

{$R *.dfm}

uses UnitDMConexao, UnitPesquisaCargos;

procedure TFrmCadastroCargo.BtPesqClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaCargos:= TFrmPesquisaCargos.Create(Self);
    FrmPesquisaCargos.ShowModal;
  finally
    if (FrmPesquisaCargos.ModalResult = mrOk) then
    begin
       Query.Locate('CRG',FrmPesquisaCargos.QueryCRG.AsInteger,
       [])
    end;
    FrmPesquisaCargos.free;
  end;
end;

procedure TFrmCadastroCargo.BtSalvarClick(Sender: TObject);
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
  if (Trim(LbSalBase.text) = '') then
  begin
    Application.MessageBox('Valor obrigatorio',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (StrToFloat(LbSalBase.text) < 0) then
  begin
    Application.MessageBox('Digite um valor válido',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;

  inherited;
end;

procedure TFrmCadastroCargo.DSStateChange(Sender: TObject);
begin
  inherited;
  //BtPesq.Enabled := DS.State IN [dsInsert,dsEdit];
end;

procedure TFrmCadastroCargo.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  QueryCRG.AsInteger := Conexao.geraPK('CRG', 'CARGOS');
end;

end.
