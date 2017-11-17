unit UnitDMConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  IBX.IBDatabase, IniFiles,Vcl.Dialogs,Vcl.Forms;

type
  TConexao = class(TDataModule)
    DB: TIBDatabase;
    transacao: TIBTransaction;
    Query: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure alteraSQL(Query: TIBQuery; SQL: String);
    function geraPK(PK, table: string): integer;
  end;

var
  Conexao: TConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TConexao.alteraSQL(Query: TIBQuery; SQL: String);
Begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add(SQL);
  Query.Open;
End;

procedure TConexao.DataModuleCreate(Sender: TObject);
Var
  arquivoIni  : TIniFile;
  caminho     : String;
begin
  arquivoIni:= TIniFile.Create('.\projeto.ini');
  try
    caminho:= arquivoIni.ReadString('BANCO','caminho','');
  finally
    arquivoIni.Free;
  end;
  //tentar conectar o banco com o caminho lido
  try
    DB.Close;
    DB.DatabaseName:= caminho;
    DB.Open;
  except
    showMessage('ERRO ao Conectar Banco');
    Application.Terminate;
  end;
end;

function TConexao.geraPK(PK, table: string): integer;
var
sql: string;
begin
  sql:='SELECT MAX('+PK+') AS MAIOR FROM '+TABLE;
  alteraSQL(Query,SQL);
  geraPK:= Query.FieldByName('MAIOR').AsInteger + 1;
end;

end.
