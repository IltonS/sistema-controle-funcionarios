unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.StdStyleActnCtrls, Vcl.ActnMan, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.AppEvnts;

type
  TFrmMain = class(TForm)
    ActionManager: TActionManager;
    FuncionariosCmd: TAction;
    CargosCmd: TAction;
    UFCmd: TAction;
    SairCmd: TAction;
    MainMenu: TMainMenu;
    Cadastros1: TMenuItem;
    Funcionrios1: TMenuItem;
    abelasAuxiliares1: TMenuItem;
    Cargos1: TMenuItem;
    UF1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    StatusBar: TStatusBar;
    Timer: TTimer;
    ApplicationEvents: TApplicationEvents;
    procedure Sair(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
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
  StatusBar.Panels[2].Text := Application.Hint;
end;

procedure TFrmMain.FormActivate(Sender: TObject);
begin
  //Atualiza a data do sistema
  StatusBar.Panels[0].Text := FormatDateTime('hh:nn:ss', Now);
  StatusBar.Panels[1].Text := FormatDateTime('dddd", "dd" de "mmmm" de "yyyy', Now);
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

end.
