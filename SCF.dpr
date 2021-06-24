program SCF;

uses
  Vcl.Forms,
  Main in 'Units\Main.pas' {FrmMain},
  DataModule in 'Units\DataModule.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema de Controle de Funcionarios';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
