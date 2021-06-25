unit Uf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, DataModule, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFrmUf = class(TFrmModeloCadastro)
    Label1: TLabel;
    EdtUf: TDBEdit;
    Label2: TLabel;
    EdtNomeEstado: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUf: TFrmUf;

implementation

{$R *.dfm}

procedure TFrmUf.BtnPesquisarClick(Sender: TObject);
begin
  FiltroPesquisar := 'uf LIKE ' + #39 + '%' + EdtPesquisa.Text + '%' + #39;
  inherited;
end;

procedure TFrmUf.FormActivate(Sender: TObject);
begin
  NomeTabela := 'tb_uf';
  NomeJanela := 'Cadastro de UFs';
  Titulo := '   UFs';
  CampoPesquisar := 'Pesquisar por UF:';
  inherited;
end;

end.
