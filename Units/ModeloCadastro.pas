unit ModeloCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, DataModule, DBCtrls;

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
    FCampoPesquisar: String;
    procedure HabilitaControles;
    procedure HabilitaControlesVisuais(Status: Boolean);
  public
    { Public declarations }
    property NomeTabela: String read FNomeTabela write FNomeTabela;
    property NomeJanela: String read FNomeJanela write FNomeJanela;
    property Titulo: String read FTitulo write FTitulo;
    property CampoPesquisar: String read FCampoPesquisar write FCampoPesquisar;
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
  HabilitaControles;
  HabilitaControlesVisuais(False);
end;

procedure TFrmModeloCadastro.BtnDeletarClick(Sender: TObject);
begin
  if DM.QueryLogin.FieldByName(NomeTabela+'_E').AsString = '1' then
  begin
    if MessageDlg('Deseja Excluir o Registro', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
     DataSource.DataSet.Delete;
     HabilitaControles;
     HabilitaControlesVisuais(False);
  end
  else
    ShowMessage('Você não possui permissão para realizar esta operação.');

end;

procedure TFrmModeloCadastro.BtnEditarClick(Sender: TObject);
begin
  if DM.QueryLogin.FieldByName(NomeTabela+'_A').AsString = '1' then
  begin
    DataSource.DataSet.Edit;
    HabilitaControles;
    HabilitaControlesVisuais(True);
  end
  else
    ShowMessage('Você não possui permissão para realizar esta operação.');

end;

procedure TFrmModeloCadastro.BtnGravarClick(Sender: TObject);
begin
  DataSource.DataSet.Post;
  DataSource.DataSet.Filtered := False;
  HabilitaControles;
  HabilitaControlesVisuais(False);
end;

procedure TFrmModeloCadastro.BtnNovoClick(Sender: TObject);
begin
  if DM.QueryLogin.FieldByName(NomeTabela+'_I').AsString = '1' then
  begin
    DataSource.DataSet.Insert;
    HabilitaControles;
    HabilitaControlesVisuais(True);
  end
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
  Self.EdtPesquisa.EditLabel.Caption := CampoPesquisar;
  HabilitaControles;
  HabilitaControlesVisuais(False);
end;

procedure TFrmModeloCadastro.HabilitaControles;
begin
  BtnNovo.Enabled := not(DataSource.DataSet.State in [dsInsert, dsEdit]);
  BtnGravar.Enabled := (DataSource.DataSet.State in [dsInsert, dsEdit]);
  BtnEditar.Enabled := (DataSource.DataSet.State in [dsBrowse]);
  BtnDeletar.Enabled := (DataSource.DataSet.State in [dsBrowse, dsEdit]);
  BtnCancelar.Enabled := (DataSource.DataSet.State in [dsInsert, dsEdit]);
end;

procedure TFrmModeloCadastro.HabilitaControlesVisuais(Status: Boolean);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TDBEdit then
      TDBEdit(Components[I]).Enabled := Status
    else if Components[I] is TDBLookupComboBox then
      TDBLookupComboBox(Components[I]).Enabled := Status
    else if Components[I] is TDBComboBox then
      TDBComboBox(Components[I]).Enabled := Status
    else if Components[I] is TDBMemo then
      TDBMemo(Components[I]).Enabled := Status;
  end;
end;

end.
