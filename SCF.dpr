program SCF;

uses
  Vcl.Forms,
  Main in 'Units\Main.pas' {FrmMain},
  DataModule in 'Units\DataModule.pas' {DM: TDataModule},
  Login in 'Units\Login.pas' {FrmLogin},
  ModeloCadastro in 'Units\ModeloCadastro.pas' {FrmModeloCadastro},
  Uf in 'Units\Uf.pas' {FrmUf},
  Cargos in 'Units\Cargos.pas' {FrmCargos},
  Perfis in 'Units\Perfis.pas' {FrmPerfis};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema de Controle de Funcionarios';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmModeloCadastro, FrmModeloCadastro);
  Application.CreateForm(TFrmUf, FrmUf);
  Application.CreateForm(TFrmCargos, FrmCargos);
  Application.CreateForm(TFrmPerfis, FrmPerfis);
  Application.Run;
end.
