unit ModeloCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, DataModule;

type
  TFrmModeloCadastro = class(TForm)
    PnlTitulo: TPanel;
    PnlFormulario: TPanel;
    DBGrid: TDBGrid;
    PnlControles: TPanel;
    PnlPesquisa: TPanel;
    EdtPesquisa: TLabeledEdit;
    BtnNovo: TBitBtn;
    BtnGravar: TBitBtn;
    BtnEditar: TBitBtn;
    BtnDeletar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnPrimeiro: TBitBtn;
    BtnAnterior: TBitBtn;
    BtnPosterior: TBitBtn;
    BtnUltimo: TBitBtn;
    DataSource: TDataSource;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnPosteriorClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FNomeTabela: String;
    FNomeJanela: String;
    FTitulo: String;
    procedure HabilitaControles;
  public
    { Public declarations }
    property NomeTabela: String read FNomeTabela write FNomeTabela;
    property NomeJanela: String read FNomeJanela write FNomeJanela;
    property Titulo: String read FTitulo write FTitulo;
  end;

var
  FrmModeloCadastro: TFrmModeloCadastro;

implementation

{$R *.dfm}

procedure TFrmModeloCadastro.BtnAnteriorClick(Sender: TObject);
begin
  DataSource.DataSet.Prior;
end;

procedure TFrmModeloCadastro.BtnCancelarClick(Sender: TObject);
begin
  DataSource.DataSet.Cancel;
  DataSource.DataSet.Filtered := False;
end;

procedure TFrmModeloCadastro.BtnDeletarClick(Sender: TObject);
begin
  if DM.QueryLogin.FieldByName(NomeTabela+'_E') = 1 then
  begin
    if MessageDlg('Deseja Excluir o Registro', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
     DataSource.DataSet.Delete;
  end
  else
    ShowMessage('Você não possui permissão para realizar esta operação.');

end;

procedure TFrmModeloCadastro.BtnEditarClick(Sender: TObject);
begin
  if DM.QueryLogin.FieldByName(NomeTabela+'_A') = 1 then
    DataSource.DataSet.Edit
  else
    ShowMessage('Você não possui permissão para realizar esta operação.');

end;

procedure TFrmModeloCadastro.BtnGravarClick(Sender: TObject);
begin
  DataSource.DataSet.Post;
  DataSource.DataSet.Filtered := False;
end;

procedure TFrmModeloCadastro.BtnNovoClick(Sender: TObject);
begin
  if DM.QueryLogin.FieldByName(NomeTabela+'_I') = 1 then
    DataSource.DataSet.Insert
  else
    ShowMessage('Você não possui permissão para realizar esta operação.');
end;

procedure TFrmModeloCadastro.BtnPosteriorClick(Sender: TObject);
begin
  DataSource.DataSet.Next;
end;

procedure TFrmModeloCadastro.BtnPrimeiroClick(Sender: TObject);
begin
  DataSource.DataSet.First;
end;

procedure TFrmModeloCadastro.BtnUltimoClick(Sender: TObject);
begin
  DataSource.DataSet.Last;
end;

procedure TFrmModeloCadastro.FormActivate(Sender: TObject);
begin
  Self.Caption := NomeJanela;
  Self.PnlTitulo.Caption := Titulo;
end;

procedure TFrmModeloCadastro.HabilitaControles;
begin
  BtnNovo.Enabled := not(DataSource.DataSet.State in [dsInsert, dsEdit]);
  BtnGravar.Enabled := (DataSource.DataSet.State in [dsInsert, dsEdit]);
  BtnEditar.Enabled := (DataSource.DataSet.State in [dsBrowse]);
  BtnDeletar.Enabled := (DataSource.DataSet.State in [dsBrowse, dsEdit]);
  BtnCancelar.Enabled := (DataSource.DataSet.State in [dsInsert, dsEdit]);
end;

end.
