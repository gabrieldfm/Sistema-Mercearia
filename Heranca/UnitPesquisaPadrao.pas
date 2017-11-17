unit UnitPesquisaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask;

type
  TFrmPesquisaPadrao = class(TForm)
    Query: TIBQuery;
    DS: TDataSource;
    GpPesq: TGroupBox;
    RdPesq: TRadioGroup;
    BtPesquisar: TBitBtn;
    GridPesq: TDBGrid;
    MskFiltro: TMaskEdit;
    Label1: TLabel;
    BtImprimir: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure GridPesqDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesquisaPadrao: TFrmPesquisaPadrao;

implementation

{$R *.dfm}

uses UnitDMConexao;

procedure TFrmPesquisaPadrao.FormCreate(Sender: TObject);
begin
  Query.Open;
end;

procedure TFrmPesquisaPadrao.GridPesqDblClick(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

end.
