unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.StdStyleActnCtrls, Vcl.ActnMan, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.AppEvnts, DataModule, Login,
  Uf, Cargos, Perfis, Usuarios, Funcionarios, System.ImageList, Vcl.ImgList,
  Vcl.ToolWin, Vcl.ActnCtrls, ShellAPI, Sobre;

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
    ToolBarIcons24: TImageList;
    ActionToolBar1: TActionToolBar;
    CalculadoraCmd: TAction;
    NavegadorCmd: TAction;
    Utilitrios1: TMenuItem;
    Calculadora1: TMenuItem;
    Navegador1: TMenuItem;
    SobreCmd: TAction;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
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
    procedure Calculadora(Sender: TObject);
    procedure Navegador(Sender: TObject);
    procedure Sobre(Sender: TObject);
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
  //Exibe a ajuda da a??o
  StatusBar.Panels[3].Text := Application.Hint;
end;

procedure TFrmMain.Calculadora(Sender: TObject);
begin
  ShellExecute(0, nil,'calc', PChar(''), '', SW_NORMAL);
end;

procedure TFrmMain.Cargos(Sender: TObject);
begin
  FrmCargos.ShowModal;
end;

procedure TFrmMain.CargosCmdUpdate(Sender: TObject);
begin
  //Habilita de acordo com a permiss?o do usu?rio
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
  FrmFuncionarios.ShowModal;
end;

procedure TFrmMain.FuncionariosCmdUpdate(Sender: TObject);
begin
  //Habilita de acordo com a permiss?o do usu?rio
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

procedure TFrmMain.Navegador(Sender: TObject);
begin
  ShellExecute(Handle, 'Open', PChar('https://google.com'), '', '', SW_NORMAL);
end;

procedure TFrmMain.Perfis(Sender: TObject);
begin
  FrmPerfis.ShowModal;
end;

procedure TFrmMain.PerfisCmdUpdate(Sender: TObject);
begin
//Habilita de acordo com a permiss?o do usu?rio
  if DM.QueryLogin.FieldByName('tb_perfis').AsString = '1' then
    PerfisCmd.Enabled := True
  else
    PerfisCmd.Enabled := False;
end;

procedure TFrmMain.Sair(Sender: TObject);
begin
  //Encerra a aplica??o.
  Close;
end;

procedure TFrmMain.Sobre(Sender: TObject);
begin
  FrmSobre.ShowModal;
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
  //Habilita de acordo com a permiss?o do usu?rio
  if DM.QueryLogin.FieldByName('tb_uf').AsString = '1' then
    UFCmd.Enabled := True
  else
    UFCmd.Enabled := False;
end;

procedure TFrmMain.Usuarios(Sender: TObject);
begin
  FrmUsuarios.ShowModal;
end;

procedure TFrmMain.UsuariosCmdUpdate(Sender: TObject);
begin
  //Habilita de acordo com a permiss?o do usu?rio
  if DM.QueryLogin.FieldByName('tb_usuarios').AsString = '1' then
    UsuariosCmd.Enabled := True
  else
    UsuariosCmd.Enabled := False;
end;

end.
