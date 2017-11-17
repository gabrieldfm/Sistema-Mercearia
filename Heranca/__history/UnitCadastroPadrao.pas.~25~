unit UnitCadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls;

type
  TFrmCadastroPadrao = class(TForm)
    Query: TIBQuery;
    Update: TIBUpdateSQL;
    DS: TDataSource;
    GpCad: TGroupBox;
    BtNovo: TBitBtn;
    BtEditar: TBitBtn;
    BtSalvar: TBitBtn;
    BtDesfazer: TBitBtn;
    BtExcluir: TBitBtn;
    BtFechar: TBitBtn;
    BtsNav: TDBNavigator;
    BtPesq: TSpeedButton;
    procedure BtDesfazerClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtNovoClick(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure DSStateChange(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroPadrao: TFrmCadastroPadrao;

implementation

{$R *.dfm}

uses UnitDMConexao;

procedure TFrmCadastroPadrao.BtDesfazerClick(Sender: TObject);
begin
  Query.CancelUpdates;
end;

procedure TFrmCadastroPadrao.BtEditarClick(Sender: TObject);
begin
  Query.Edit;
end;

procedure TFrmCadastroPadrao.BtExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox(
  'Confirma?',
  'Aviso',
  MB_ICONQUESTION+MB_YESNO)=idNo) then Begin
    Exit;
  End;
  //inicia transação
  if not(Conexao.Transacao.InTransaction) then BEgin
    Conexao.Transacao.StartTransaction;
  End;
  try
    //tenta excluir
    Query.Delete;
    //efetiva transação
    Conexao.Transacao.Commit;
  except
    //desfaz transação
    Conexao.Transacao.Rollback;
    Application.MessageBox('ERRO ao Excluir',
    'ERRO',MB_ICONERROR+MB_OK);
  end;
  //reabrir a query
  Query.Open;
end;

procedure TFrmCadastroPadrao.BtFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastroPadrao.BtNovoClick(Sender: TObject);
begin
  Query.Append;
end;

procedure TFrmCadastroPadrao.BtSalvarClick(Sender: TObject);
begin
  //iniciar uma transação
  if not(Conexao.Transacao.InTransaction) then Begin
    Conexao.Transacao.StartTransaction;
  End;
  //tentar gravar
  try
    Query.Post;
    //efetivar transação
    Conexao.Transacao.Commit;
  Except
    //desfazer transação
    Conexao.Transacao.Rollback;
    Application.MessageBox(
    'ERRO ao Gravar','ERRO',MB_ICONERROR+MB_OK);
  end;
  //reabrir a Query
  Query.Open;
end;

procedure TFrmCadastroPadrao.DSStateChange(Sender: TObject);
begin
  BtNovo.Enabled:= DS.State in [dsBrowse];
  BtEditar.Enabled:= DS.State in [dsBrowse];
  BtSalvar.Enabled:= DS.State in [dsInsert,dsEdit];
  BtDesfazer.Enabled:= DS.State in [dsInsert,dsEdit];
  BtExcluir.Enabled:= DS.State in [dsBrowse];
  BtFechar.Enabled:= DS.State in [dsBrowse];
  BtPesq.Enabled := DS.State in [dsBrowse] ;
  BtsNav.Enabled:= DS.State in [dsBrowse];
end;

procedure TFrmCadastroPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query.Close;
end;

procedure TFrmCadastroPadrao.FormCreate(Sender: TObject);
begin
  Query.Open;
end;

procedure TFrmCadastroPadrao.QueryBeforePost(DataSet: TDataSet);
begin
  if DS.State = dsEdit then
  begin
    exit;
  end;
end;

end.
