program SCF;

uses
  Vcl.Forms,
  Main in 'Units\Main.pas' {FrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema de Controle de Funcionarios';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
