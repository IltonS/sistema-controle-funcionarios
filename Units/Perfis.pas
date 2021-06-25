unit Perfis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ModeloCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, DataModule, Vcl.DBCtrls,
  Vcl.Mask;

type
  TFrmPerfis = class(TFrmModeloCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    Label3: TLabel;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    Label4: TLabel;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    Label5: TLabel;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    Label6: TLabel;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox20: TDBCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPerfis: TFrmPerfis;

implementation

{$R *.dfm}

procedure TFrmPerfis.BtnPesquisarClick(Sender: TObject);
begin
  FiltroPesquisar := 'nome_perfil LIKE ' + #39 + '%' + EdtPesquisa.Text + '%' + #39;
  inherited;
end;

procedure TFrmPerfis.FormActivate(Sender: TObject);
begin
  NomeTabela := 'tb_perfis';
  NomeJanela := 'Cadastro de Perfis de Acesso';
  Titulo := '   Perfis de Acesso';
  CampoPesquisar := 'Pesquisar por Nome do Perfil:';
  inherited;
end;

end.
