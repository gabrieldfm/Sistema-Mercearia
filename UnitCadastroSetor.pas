unit UnitCadastroSetor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask;

type
  TFrmCadastroSetor = class(TFrmCadastroPadrao)
    QueryID_SET: TIntegerField;
    QueryNOME: TIBStringField;
    QueryDESCRICAO: TIBStringField;
    Label1: TLabel;
    LbCod: TDBEdit;
    Label2: TLabel;
    LbNome: TDBEdit;
    Label3: TLabel;
    LbDesc: TDBEdit;
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
  FrmCadastroSetor: TFrmCadastroSetor;

implementation

{$R *.dfm}

uses UnitDMConexao, UnitPesquisaSetor;

procedure TFrmCadastroSetor.BtPesqClick(Sender: TObject);
begin
  inherited;
  try
    FrmPesquisaSetor:= TFrmPesquisaSetor.Create(Self);
    FrmPesquisaSetor.ShowModal;
  finally
    if (FrmPesquisaSetor.ModalResult = mrOk) then
    begin
       Query.Locate('ID_SET',FrmPesquisaSetor.QueryID_SET.AsInteger,
       [])
    end;
    FrmPesquisaSetor.free;
  end;
end;

procedure TFrmCadastroSetor.BtSalvarClick(Sender: TObject);
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

  inherited;

end;

procedure TFrmCadastroSetor.DSStateChange(Sender: TObject);
begin
  inherited;
  //BtPesq.Enabled := DS.State IN [dsInsert,dsEdit];
end;

procedure TFrmCadastroSetor.QueryBeforePost(DataSet: TDataSet);
begin
  inherited;
  QueryID_SET.AsInteger := Conexao.geraPK('ID_SET', 'SETOR');
end;

end.
