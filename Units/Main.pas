unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.StdStyleActnCtrls, Vcl.ActnMan, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.AppEvnts, DataModule, Login,
  Uf;

type
  TFrmMain = class(TForm)
    ActionManager: TActionManager;
    FuncionariosCmd: TAction;
    CargosCmd: TAction;
    UFCmd: TAction;
    SairCmd: TAction;
    MainMenu: TMainMenu;
    StatusBar: TStatusBar;
    Timer: TTimer;
    ApplicationEvents: TApplicationEvents;
    LogoffCmd: TAction;
    UsuariosCmd: TAction;
    PerfisCmd: TAction;
    Sistema1: TMenuItem;
    Usurios1: TMenuItem;
    Perfis1: TMenuItem;
    Logoff1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    Cadastros1: TMenuItem;
    Funcionrios1: TMenuItem;
    abelasAuxiliares1: TMenuItem;
    Cargos1: TMenuItem;
    UF1: TMenuItem;
    procedure Sair(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure Funcionarios(Sender: TObject);
    procedure Cargos(Sender: TObject);
    procedure Uf(Sender: TObject);
    procedure FuncionariosCmdUpdate(Sender: TObject);
    procedure CargosCmdUpdate(Sender: TObject);
    procedure UFCmdUpdate(Sender: TObject);
    procedure Logoff(Sender: TObject);
    procedure Usuarios(Sender: TObject);
    procedure Perfis(Sender: TObject);
    procedure UsuariosCmdUpdate(Sender: TObject);
    procedure PerfisCmdUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.ApplicationEventsHint(Sender: TObject);
begin
  //Exibe a ajuda da ação
  StatusBar.Panels[3].Text := Application.Hint;
end;

procedure TFrmMain.Cargos(Sender: TObject);
begin
  //to-do
end;

procedure TFrmMain.CargosCmdUpdate(Sender: TObject);
begin
  //Habilita de acordo com a permissão do usuário
  if DM.QueryLogin.FieldByName('tb_cargos').AsString = '1' then
    CargosCmd.Enabled := True
  else
    CargosCmd.Enabled := False;
end;

procedure TFrmMain.FormActivate(Sender: TObject);
begin
  //Atualiza a data do sistema
  StatusBar.Panels[0].Text := FormatDateTime('hh:nn:ss', Now);
  StatusBar.Panels[1].Text := FormatDateTime('dddd", "dd" de "mmmm" de "yyyy', Now);

  FrmLogin.ShowModal;
end;

procedure TFrmMain.Funcionarios(Sender: TObject);
begin
  //to-do
end;

procedure TFrmMain.FuncionariosCmdUpdate(Sender: TObject);
begin
  //Habilita de acordo com a permissão do usuário
  if DM.QueryLogin.FieldByName('tb_funcionarios').AsString = '1' then
    FuncionariosCmd.Enabled := True
  else
    FuncionariosCmd.Enabled := False;
end;

procedure TFrmMain.Logoff(Sender: TObject);
begin
  StatusBar.Panels[2].Text := '';
  DM.QueryLogin.Close;
  DM.QueryLogin.SQL.Clear;
  FrmLogin.EdtLogin.Text := '';
  FrmLogin.EdtSenha.Text := '';
  FrmLogin.ShowModal;
end;

procedure TFrmMain.Perfis(Sender: TObject);
begin
  //to-do
end;

procedure TFrmMain.PerfisCmdUpdate(Sender: TObject);
begin
//Habilita de acordo com a permissão do usuário
  if DM.QueryLogin.FieldByName('tb_perfis').AsString = '1' then
    PerfisCmd.Enabled := True
  else
    PerfisCmd.Enabled := False;
end;

procedure TFrmMain.Sair(Sender: TObject);
begin
  //Encerra a aplicação.
  Close;
end;

procedure TFrmMain.TimerTimer(Sender: TObject);
begin
  //Atualiza a data do sistema
  StatusBar.Panels[0].Text := FormatDateTime('hh:nn:ss', Now);
  StatusBar.Panels[1].Text := FormatDateTime('dddd", "dd" de "mmmm" de "yyyy', Now);
end;

procedure TFrmMain.Uf(Sender: TObject);
begin
  FrmUf.ShowModal;
end;

procedure TFrmMain.UFCmdUpdate(Sender: TObject);
begin
  //Habilita de acordo com a permissão do usuário
  if DM.QueryLogin.FieldByName('tb_uf').AsString = '1' then
    UFCmd.Enabled := True
  else
    UFCmd.Enabled := False;
end;

procedure TFrmMain.Usuarios(Sender: TObject);
begin
  //to-do
end;

procedure TFrmMain.UsuariosCmdUpdate(Sender: TObject);
begin
  //Habilita de acordo com a permissão do usuário
  if DM.QueryLogin.FieldByName('tb_usuarios').AsString = '1' then
    UsuariosCmd.Enabled := True
  else
    UsuariosCmd.Enabled := False;
end;

end.
