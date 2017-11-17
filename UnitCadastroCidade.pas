unit UnitCadastroCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask;

type
  TFrmCadastroCidade = class(TFrmCadastroPadrao)
    QueryCID_ID: TIntegerField;
    QueryNOME: TIBStringField;
    QuerySIGLA: TIBStringField;
    Label1: TLabel;
    LbCod: TDBEdit;
    Label2: TLabel;
    LbNome: TDBEdit;
    Label3: TLabel;
    CbSigla: TDBComboBox;
    procedure BtSalvarClick(Sender: TObject);
    procedure DSStateChange(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure BtNovoClick(Sender: TObject);
    procedure BtPesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroCidade: TFrmCadastroCidade;

implementation

{$R *.dfm}

uses UnitDMConexao, UnitPesquisaCidade;

procedure TFrmCadastroCidade.BtNovoClick(Sender: TObject);
begin
  inherited;
  QuerySIGLA.AsString := 'SC';
end;

procedure TFrmCadastroCidade.BtPesqClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaCidades := TFrmPesquisaCidades.Create(Self);
    FrmPesquisaCidades.ShowModal;
  finally
    if (FrmPesquisaCidades.ModalResult = mrOk) then
    begin
       Query.Locate('CID_ID',FrmPesquisaCidades.QueryCID_ID.AsInteger,
       [])
    end;
    FrmPesquisaCidades.free;
  end;
end;

procedure TFrmCadastroCidade.BtSalvarClick(Sender: TObject);
begin

  if (Trim(LbNome.text) = '') then
  begin
    Application.MessageBox('Nome obrigatorio',  'ERRO',MB_ICONERROR+MB_OK);
    Exit;
  end;

  if (CbSigla.ItemIndex = -1) then
  BEGIN
    Application.MessageBox('Estado obrigatorio','ERRO',MB_ICONERROR+MB_OK);
    QuerySIGLA.AsString := 'SC';
    Exit;
  END;

  inherited;

end;

procedure TFrmCadastroCidade.DSStateChange(Sender: TObject);
begin
  inherited;
  //SpeedButon de pesquisa
  //BtPesq.Enabled := DS.State IN [dsInsert,dsEdit];
end;

procedure TFrmCadastroCidade.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  //Gera a chave primaria
  QueryCID_ID.AsInteger := Conexao.geraPK('CID_ID', 'CIDADES');
end;

end.
