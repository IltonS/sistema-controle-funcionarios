unit Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, DataModule, Vcl.DBCtrls,
  Vcl.Mask;

type
  TFrmUsuarios = class(TFrmModeloCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DSPerfis: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsuarios: TFrmUsuarios;

implementation

{$R *.dfm}

procedure TFrmUsuarios.BtnPesquisarClick(Sender: TObject);
begin
  FiltroPesquisar := 'login LIKE ' + #39 + '%' + EdtPesquisa.Text + '%' + #39;
  inherited;
end;

procedure TFrmUsuarios.FormActivate(Sender: TObject);
begin
  NomeTabela := 'tb_usuarios';
  NomeJanela := 'Cadastro de Usuários';
  Titulo := '   Usuários';
  CampoPesquisar := 'Pesquisar por Login:';
  inherited;
end;

end.
