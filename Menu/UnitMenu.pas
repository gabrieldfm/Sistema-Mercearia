unit UnitMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFrmMenu = class(TForm)
    Menu: TMainMenu;
    Cadastros1: TMenuItem;
    Bsicos1: TMenuItem;
    CIDADES1: TMenuItem;
    FORNECEDOR1: TMenuItem;
    CLIENTE1: TMenuItem;
    DEPTOPESSOAL1: TMenuItem;
    FUNCIONRIOS1: TMenuItem;
    DEPENDENTES1: TMenuItem;
    SETOR1: TMenuItem;
    CARGOS1: TMenuItem;
    PRODUTOS1: TMenuItem;
    FRETE1: TMenuItem;
    Pesquisa1: TMenuItem;
    B1: TMenuItem;
    CIDADES2: TMenuItem;
    FORNECEDOR2: TMenuItem;
    CLIENTES1: TMenuItem;
    DEPTOPESSOAL2: TMenuItem;
    PRODUTOS2: TMenuItem;
    FRETE2: TMenuItem;
    FUNCIONRIO1: TMenuItem;
    DEPENDENTES2: TMenuItem;
    SETOR2: TMenuItem;
    CARGOS2: TMenuItem;
    FRMPAGAMENTO1: TMenuItem;
    FRMPAGAMENTO2: TMenuItem;
    StSatus: TStatusBar;
    Relatrios1: TMenuItem;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure CIDADES1Click(Sender: TObject);
    procedure SETOR1Click(Sender: TObject);
    procedure CARGOS1Click(Sender: TObject);
    procedure FRETE1Click(Sender: TObject);
    procedure PRODUTOS1Click(Sender: TObject);
    procedure FRMPAGAMENTO1Click(Sender: TObject);
    procedure CIDADES2Click(Sender: TObject);
    procedure PRODUTOS2Click(Sender: TObject);
    procedure FRETE2Click(Sender: TObject);
    procedure SETOR2Click(Sender: TObject);
    procedure CARGOS2Click(Sender: TObject);
    procedure FRMPAGAMENTO2Click(Sender: TObject);
    procedure CLIENTE1Click(Sender: TObject);
    procedure CLIENTES1Click(Sender: TObject);
    procedure FORNECEDOR1Click(Sender: TObject);
    procedure FORNECEDOR2Click(Sender: TObject);
    procedure FUNCIONRIOS1Click(Sender: TObject);
    procedure FUNCIONRIO1Click(Sender: TObject);
    procedure DEPENDENTES1Click(Sender: TObject);
    procedure DEPENDENTES2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.dfm}

uses UnitLogin, UnitCadastroCidade, UnitCadastroSetor, UnitCadastroCargos,
  UnitCadastroFrete, UnitCadastroProduto, UnitCadastroFrmPgto,
  UnitPesquisaCargos, UnitPesquisaCidade, UnitPesquisaFrete,
  UnitPesquisaFrmPagto, UnitPesquisaProduto, UnitPesquisaSetor,
  UnitCadastroCliente, UnitPesquisaCliente, UnitCadastroFornecedor,
  UnitPesquisaFornecedor, UnitCadastroFuncionario, UnitPesquisaFuncionarios,
  UnitCadastroDependentes, UnitPesquisaDependentes;

procedure TFrmMenu.CARGOS1Click(Sender: TObject);
begin
  try
    FrmCadastroCargo:= TFrmCadastroCargo.Create(self);
    FrmCadastroCargo.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.CARGOS2Click(Sender: TObject);
begin
  try
    FrmPesquisaCargos:= TFrmPesquisaCargos.Create(self);
    FrmPesquisaCargos.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.CIDADES1Click(Sender: TObject);
begin
  try
    FrmCadastroCidade:= TFrmCadastroCidade.Create(self);
    FrmCadastroCidade.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.CIDADES2Click(Sender: TObject);
begin
  try
    FrmPesquisaCidades:= TFrmPesquisaCidades.Create(self);
    FrmPesquisaCidades.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.CLIENTE1Click(Sender: TObject);
begin
  try
    FrmCadastroCliente:= TFrmCadastroCliente.Create(self);
    FrmCadastroCliente.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.CLIENTES1Click(Sender: TObject);
begin
   try
    FrmPesquisaCliente:= TFrmPesquisaCliente.Create(self);
    FrmPesquisaCliente.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.DEPENDENTES1Click(Sender: TObject);
begin
  try
    FrmCadastroDependentes:= TFrmCadastroDependentes.Create(self);
    FrmCadastroDependentes.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.DEPENDENTES2Click(Sender: TObject);
begin
    try
    FrmPesquisaDependentes:= TFrmPesquisaDependentes.Create(self);
    FrmPesquisaDependentes.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.FormCreate(Sender: TObject);
begin
  try
    FrmLogin:= TFrmLogin.Create(Self)  ;
    FrmLogin.ShowModal;
  finally
    if (FrmLogin.ModalResult <> mrOk) then
    begin
        Application.Terminate;
    end;
    StSatus.Panels[2].Text := FrmLogin.LbLogin.Text;
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.FORNECEDOR1Click(Sender: TObject);
begin
   try
    FrmCadastroFornecedor:= TFrmCadastroFornecedor.Create(self);
    FrmCadastroFornecedor.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.FORNECEDOR2Click(Sender: TObject);
begin
   try
    FrmPesquisaFornecedor:= TFrmPesquisaFornecedor.Create(self);
    FrmPesquisaFornecedor.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.FRETE1Click(Sender: TObject);
begin
   try
    FrmCadastroFrete:= TFrmCadastroFrete.Create(self);
    FrmCadastroFrete.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.FRETE2Click(Sender: TObject);
begin
   try
    FrmPesquisaFrete:= TFrmPesquisaFrete.Create(self);
    FrmPesquisaFrete.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.FRMPAGAMENTO1Click(Sender: TObject);
begin
  try
    FrmCadastroFrmPgto:= TFrmCadastroFrmPgto.Create(self);
    FrmCadastroFrmPgto.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.FRMPAGAMENTO2Click(Sender: TObject);
begin
   try
    FrmPesquisaFrmPgto:= TFrmPesquisaFrmPgto.Create(self);
    FrmPesquisaFrmPgto.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.FUNCIONRIO1Click(Sender: TObject);
begin
   try
    FrmPesquisaFuncionario:= TFrmPesquisaFuncionario.Create(self);
    FrmPesquisaFuncionario.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.FUNCIONRIOS1Click(Sender: TObject);
begin
   try
    FrmCadastroFuncionario:= TFrmCadastroFuncionario.Create(self);
    FrmCadastroFuncionario.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.PRODUTOS1Click(Sender: TObject);
begin
  try
    FrmCadastroProduto:= TFrmCadastroProduto.Create(self);
    FrmCadastroProduto.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.PRODUTOS2Click(Sender: TObject);
begin
   try
    FrmPesquisaProd:= TFrmPesquisaProd.Create(self);
    FrmPesquisaProd.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.SETOR1Click(Sender: TObject);
begin
   try
    FrmCadastroSetor:= TFrmCadastroSetor.Create(self);
    FrmCadastroSetor.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.SETOR2Click(Sender: TObject);
begin
  try
    FrmPesquisaSetor:= TFrmPesquisaSetor.Create(self);
    FrmPesquisaSetor.ShowModal;
  finally
    FrmLogin.Free;
  end;
end;

procedure TFrmMenu.Timer1Timer(Sender: TObject);
begin
  StSatus.Panels[0].Text:= DateToStr(now);
  StSatus.Panels[1].Text:= TimeToStr(now);
end;

end.
