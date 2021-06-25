unit Cargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, DataModule, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFrmCargos = class(TFrmModeloCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCargos: TFrmCargos;

implementation

{$R *.dfm}

procedure TFrmCargos.BtnPesquisarClick(Sender: TObject);
begin
  FiltroPesquisar := 'nome_cargo LIKE ' + #39 + '%' + EdtPesquisa.Text + '%' + #39;
  inherited;
end;

procedure TFrmCargos.FormActivate(Sender: TObject);
begin
  NomeTabela := 'tb_cargos';
  NomeJanela := 'Cadastro de Cargos';
  Titulo := '   Cargos';
  CampoPesquisar := 'Pesquisar por Nome do Cargo:';
  inherited;
end;

end.
