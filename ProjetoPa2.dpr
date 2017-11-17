program ProjetoPa2;

uses
  Vcl.Forms,
  UnitMenu in 'Menu\UnitMenu.pas' {FrmMenu},
  UnitCadastroPadrao in 'Heranca\UnitCadastroPadrao.pas' {FrmCadastroPadrao},
  UnitPesquisaPadrao in 'Heranca\UnitPesquisaPadrao.pas' {FrmPesquisaPadrao},
  UnitLogin in 'Login\UnitLogin.pas' {FrmLogin},
  UnitDMConexao in 'DM\UnitDMConexao.pas' {Conexao: TDataModule},
  UnitCadastroCargos in 'Cadastro\UnitCadastroCargos.pas' {FrmCadastroCargo},
  UnitCadastroCidade in 'Cadastro\UnitCadastroCidade.pas' {FrmCadastroCidade},
  UnitCadastroSetor in 'Cadastro\UnitCadastroSetor.pas' {FrmCadastroSetor},
  UnitCadastroProduto in 'Cadastro\UnitCadastroProduto.pas' {FrmCadastroProduto},
  UnitCadastroFrete in 'Cadastro\UnitCadastroFrete.pas' {FrmCadastroFrete},
  UnitCadastroFrmPgto in 'Cadastro\UnitCadastroFrmPgto.pas' {FrmCadastroFrmPgto},
  UnitPesquisaCidade in 'Pesquisa\UnitPesquisaCidade.pas' {FrmPesquisaCidades},
  UnitPesquisaCargos in 'Pesquisa\UnitPesquisaCargos.pas' {FrmPesquisaCargos},
  UnitPesquisaFrete in 'Pesquisa\UnitPesquisaFrete.pas' {FrmPesquisaFrete},
  UnitPesquisaFrmPagto in 'Pesquisa\UnitPesquisaFrmPagto.pas' {FrmPesquisaFrmPgto},
  UnitPesquisaSetor in 'Pesquisa\UnitPesquisaSetor.pas' {FrmPesquisaSetor},
  UnitPesquisaProduto in 'Pesquisa\UnitPesquisaProduto.pas' {FrmPesquisaProd},
  UnitCadastroCliente in 'Cadastro\UnitCadastroCliente.pas' {FrmCadastroCliente},
  UnitPesquisaCliente in 'Pesquisa\UnitPesquisaCliente.pas' {FrmPesquisaCliente},
  UnitCadastroFornecedor in 'Cadastro\UnitCadastroFornecedor.pas' {FrmCadastroFornecedor},
  UnitPesquisaFornecedor in 'Pesquisa\UnitPesquisaFornecedor.pas' {FrmPesquisaFornecedor},
  UnitCadastroFuncionario in 'Cadastro\UnitCadastroFuncionario.pas' {FrmCadastroFuncionario},
  UnitPesquisaFuncionarios in 'Pesquisa\UnitPesquisaFuncionarios.pas' {FrmPesquisaFuncionario},
  UnitCadastroDependentes in 'Cadastro\UnitCadastroDependentes.pas' {FrmCadastroDependentes},
  UnitPesquisaDependentes in 'Pesquisa\UnitPesquisaDependentes.pas' {FrmPesquisaDependentes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TConexao, Conexao);
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.Run;
end.
