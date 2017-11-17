unit UnitCadastroFrete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, IBX.IBCustomDataSet, IBX.IBUpdateSQL,
  IBX.IBQuery, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmCadastroFrete = class(TFrmCadastroPadrao)
    QueryID_FRT: TIntegerField;
    QueryDESCRICAO: TIBStringField;
    QueryTIPO: TIBStringField;
    QueryDIAS: TIntegerField;
    Label1: TLabel;
    LbCod: TDBEdit;
    Label2: TLabel;
    LbDesc: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    LbDias: TDBEdit;
    CbTp: TDBComboBox;
    procedure DSStateChange(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtNovoClick(Sender: TObject);
    procedure BtPesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroFrete: TFrmCadastroFrete;

implementation

{$R *.dfm}

uses UnitDMConexao, UnitPesquisaFrete;

procedure TFrmCadastroFrete.BtNovoClick(Sender: TObject);
begin
  inherited;

  QueryTIPO.AsString := 'Rodoviário';
end;

procedure TFrmCadastroFrete.BtPesqClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaFrete:= TFrmPesquisaFrete.Create(Self);
    FrmPesquisaFrete.ShowModal;
  finally
    if (FrmPesquisaFrete.ModalResult = mrOk) then
    begin
       Query.Locate('ID_FRT',FrmPesquisaFrete.QueryID_FRT.AsInteger,
       [])
    end;
    FrmPesquisaFrete.free;
  end;
end;

procedure TFrmCadastroFrete.BtSalvarClick(Sender: TObject);
begin
  if (Trim(LbDesc.text) = '') then
  begin
    Application.MessageBox('Nome obrigatorio',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (Trim(LbDias.text) = '') then
  begin
    Application.MessageBox('Informe o número de dias',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;
  if (StrToInt(LbDias.text) < 1) then
  begin
    Application.MessageBox('Informe um número válido',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;

  if (CbTp.ItemIndex = -1) then
  BEGIN
    Application.MessageBox('Tipo obrigatorio','ERRO',MB_ICONERROR+MB_OK);
    QueryTIPO.AsString := 'Rodoviário';
    Exit;
  END ;
  inherited;

end;

procedure TFrmCadastroFrete.DSStateChange(Sender: TObject);
begin
  inherited;
  //SpeedButon de pesquisa
  //BtPesq.Enabled := DS.State IN [dsInsert,dsEdit];
end;

procedure TFrmCadastroFrete.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  //Gera a chave primaria
  QueryID_FRT.AsInteger := Conexao.geraPK('ID_FRT', 'FRETE');
end;

end.
