unit ModeloCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, DataModule, DBCtrls,
  FireDAC.Stan.Error;

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
    BtnPesquisar: TBitBtn;
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
    procedure BtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    FNomeTabela: String;
    FNomeJanela: String;
    FTitulo: String;
    FCampoPesquisar: String;
    FFiltroPesquisar: String;
    procedure HabilitaControles;
    procedure HabilitaControlesVisuais(Status: Boolean);
  public
    { Public declarations }
    property NomeTabela: String read FNomeTabela write FNomeTabela;
    property NomeJanela: String read FNomeJanela write FNomeJanela;
    property Titulo: String read FTitulo write FTitulo;
    property CampoPesquisar: String read FCampoPesquisar write FCampoPesquisar;
    property FiltroPesquisar: String read FFiltroPesquisar write FFiltroPesquisar;
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
  //Valida a persmissão do usuário para excluir
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
  //Valida a persmissão do usuário para alterar
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
  try
    DataSource.DataSet.Post;
    DataSource.DataSet.Filtered := False;
    HabilitaControles;
    HabilitaControlesVisuais(False);
  except
    on E: EFDDBEngineException do
    begin
      case E.ErrorCode of
        //A validação de dados é feita no BD através de Triggers
        //Formulário filhos podem herdar essa procedure sem a necessidade de escrever código específico para validação.
        1643: MessageDlg(E.Message, mtError, [mbOK], 0);
        else ShowMessage(E.Message + 'Código: ' + IntToStr(E.ErrorCode) ); //Mensagem padrão para pegar e tratar erros não previstos.
      end;
    end;
  end;
end;

procedure TFrmModeloCadastro.BtnNovoClick(Sender: TObject);
var
  I: Integer;
begin
  //Valida a persmissão do usuário para inserir
  if DM.QueryLogin.FieldByName(NomeTabela+'_I').AsString = '1' then
  begin
    DataSource.DataSet.Insert;
    HabilitaControles;
    HabilitaControlesVisuais(True);

    //Se o formulário filho possuir um Radio Group, marca o primeiro item
    for I := 0 to ComponentCount - 1 do
    begin
      if Components[I] is TDBRadioGroup then
        TDBRadioGroup(Components[I]).ItemIndex := 0;
    end;

  end
  else
    ShowMessage('Você não possui permissão para realizar esta operação.');
end;

procedure TFrmModeloCadastro.BtnPesquisarClick(Sender: TObject);
begin
  if EdtPesquisa.Text = '' then
    DataSource.DataSet.Filtered := False
  else
  begin
    DataSource.DataSet.Filtered := False;
    DataSource.DataSet.Filter := FiltroPesquisar;
    DataSource.DataSet.Filtered := True
  end;
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
var
  I: Integer;
begin

  //Parâmetros para personalização do formulário
  Self.Caption := NomeJanela;
  Self.PnlTitulo.Caption := Titulo;
  Self.EdtPesquisa.EditLabel.Caption := CampoPesquisar;

  HabilitaControles;
  HabilitaControlesVisuais(False);

  //Configura o filtro do dataset
  DataSource.DataSet.FilterOptions := [foCaseInsensitive];

  //Se o formulário filho possuir um Radio Group, marca o primeiro item
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TDBRadioGroup then
      TDBRadioGroup(Components[I]).ItemIndex := 0;
  end;

end;

procedure TFrmModeloCadastro.HabilitaControles;
begin
  //Habilita os controles de acordo com o estado do dataset
  BtnNovo.Enabled := not(DataSource.DataSet.State in [dsInsert, dsEdit]);
  BtnGravar.Enabled := (DataSource.DataSet.State in [dsInsert, dsEdit]);
  BtnEditar.Enabled := (DataSource.DataSet.State in [dsBrowse]);
  BtnDeletar.Enabled := (DataSource.DataSet.State in [dsBrowse, dsEdit]);
  BtnCancelar.Enabled := (DataSource.DataSet.State in [dsInsert, dsEdit]);
  BtnPrimeiro.Enabled := not(DataSource.DataSet.State in [dsInsert, dsEdit]);
  BtnAnterior.Enabled := not(DataSource.DataSet.State in [dsInsert, dsEdit]);
  BtnPosterior.Enabled := not(DataSource.DataSet.State in [dsInsert, dsEdit]);
  BtnUltimo.Enabled := not(DataSource.DataSet.State in [dsInsert, dsEdit]);
  BtnPesquisar.Enabled := not (DataSource.DataSet.State in [dsInsert, dsEdit]);
end;

procedure TFrmModeloCadastro.HabilitaControlesVisuais(Status: Boolean);
var
  I: Integer;
begin
  //Varre os componentes visuais do formulário para habilitá-los
  //ou desabilitá-los de acordo com o parâmetro Status
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TDBEdit then
      TDBEdit(Components[I]).Enabled := Status
    else if Components[I] is TDBLookupComboBox then
      TDBLookupComboBox(Components[I]).Enabled := Status
    else if Components[I] is TDBComboBox then
      TDBComboBox(Components[I]).Enabled := Status
    else if Components[I] is TDBMemo then
      TDBMemo(Components[I]).Enabled := Status
    else if Components[I] is TDBCheckBox then
      TDBCheckBox(Components[I]).Enabled := Status
    else if Components[I] is TDBRadioGroup then
      TDBRadioGroup(Components[I]).Enabled := Status;

  end;
end;

end.
