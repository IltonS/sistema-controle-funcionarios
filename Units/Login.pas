unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, DataModule;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    EdtLogin: TEdit;
    Label2: TLabel;
    BtnOk: TButton;
    BtnCancelar: TButton;
    EdtSenha: TEdit;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses
  Main;

procedure TFrmLogin.BtnCancelarClick(Sender: TObject);
begin
  FrmMain.Close;
end;

procedure TFrmLogin.BtnOkClick(Sender: TObject);
var
  QryLogin: String;
begin
  QryLogin := 'SELECT * FROM tb_usuarios u INNER JOIN tb_perfis p ON u.id_perfil=p.id_perfil ';
  QryLogin := QryLogin + 'WHERE u.login=' + #39 + EdtLogin.Text + #39 + ' ';
  QryLogin := QryLogin + 'AND u.senha=' + #39 + EdtSenha.Text + #39 + ';';

  DM.QueryLogin.Close;
  DM.QueryLogin.SQL.Clear;
  DM.QueryLogin.SQL.Add(QryLogin);
  DM.QueryLogin.Open;

  if DM.QueryLogin.RecordCount = 1 then
  begin
    FrmMain.StatusBar.Panels[2].Text := 'Usuário: ' + DM.QueryLogin.FieldByName('login').AsString;
    FrmMain.WindowState := wsMaximized;
    FrmLogin.Close;
  end
  else
  begin
    ShowMessage('Login e/ou senha inválidos...');
    EdtLogin.Text := '';
    EdtSenha.Text := '';
  end;
end;

procedure TFrmLogin.EdtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then BtnOkClick(Sender);
end;

end.
