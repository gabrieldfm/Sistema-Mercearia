unit UnitCadastroFrmPgto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, IBX.IBCustomDataSet, IBX.IBUpdateSQL,
  IBX.IBQuery, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmCadastroFrmPgto = class(TFrmCadastroPadrao)
    QueryIF_FRM_PGTO: TIntegerField;
    QueryDESCRICAO: TIBStringField;
    QueryPARCELAS: TIntegerField;
    QueryTIPO: TIBStringField;
    Label1: TLabel;
    LbCod: TDBEdit;
    Label2: TLabel;
    LbDesc: TDBEdit;
    Label3: TLabel;
    LbParc: TDBEdit;
    Label4: TLabel;
    CbTp: TDBComboBox;
    procedure DSStateChange(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure BtPesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroFrmPgto: TFrmCadastroFrmPgto;

implementation

{$R *.dfm}

uses UnitDMConexao, UnitPesquisaFrmPagto;

procedure TFrmCadastroFrmPgto.BtPesqClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaFrmPgto:= TFrmPesquisaFrmPgto.Create(Self);
    FrmPesquisaFrmPgto.ShowModal;
  finally
    if (FrmPesquisaFrmPgto.ModalResult = mrOk) then
    begin
       Query.Locate('IF_FRM_PGTO',FrmPesquisaFrmPgto.QueryIF_FRM_PGTO.AsInteger,
       [])
    end;
    FrmPesquisaFrmPgto.free;
  end;
end;

procedure TFrmCadastroFrmPgto.DSStateChange(Sender: TObject);
begin
  inherited;
  //SpeedButon de pesquisa
  //BtPesq.Enabled := DS.State IN [dsInsert,dsEdit];

end;

procedure TFrmCadastroFrmPgto.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  //Gera a chave primaria
  QueryIF_FRM_PGTO.AsInteger := Conexao.geraPK('IF_FRM_PGTO', 'FRMPAGTO');
end;

end.
