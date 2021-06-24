object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Sistema de Controle de Funcion'#225'rios'
  ClientHeight = 383
  ClientWidth = 1042
  Color = clAppWorkSpace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 364
    Width = 1042
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 250
      end
      item
        Width = 250
      end>
    ExplicitLeft = 528
    ExplicitTop = 216
    ExplicitWidth = 0
  end
  object ActionManager: TActionManager
    Left = 32
    Top = 16
    StyleName = 'Standard'
    object FuncionariosCmd: TAction
      Category = 'cadastros'
      Caption = '&Funcion'#225'rios'
      Hint = 'Cadastro de Funcion'#225'rios|Registro dos funcion'#225'rios do sistema.'
      ShortCut = 16454
      OnExecute = Funcionarios
      OnUpdate = FuncionariosCmdUpdate
    end
    object CargosCmd: TAction
      Category = 'cadastros'
      Caption = '&Cargos'
      Hint = 'Cadastro de Cargos e Fun'#231#245'es|Manuten'#231#227'o da tabela de cargos.'
      ShortCut = 49219
      OnExecute = Cargos
      OnUpdate = CargosCmdUpdate
    end
    object UFCmd: TAction
      Category = 'cadastros'
      Caption = '&UF'
      Hint = 'Cadastro de UFs|Manuten'#231#227'o da tabela de UFs.'
      ShortCut = 16469
      OnExecute = Uf
      OnUpdate = UFCmdUpdate
    end
    object SairCmd: TAction
      Category = 'cadastros'
      Caption = '&Sair'
      Hint = 'Sair|Encerra a aplica'#231#227'o.'
      OnExecute = Sair
    end
  end
  object MainMenu: TMainMenu
    Left = 112
    Top = 16
    object Cadastros1: TMenuItem
      Caption = '&Cadastros'
      object Funcionrios1: TMenuItem
        Action = FuncionariosCmd
      end
      object abelasAuxiliares1: TMenuItem
        Caption = '&Tabelas Auxiliares'
        object Cargos1: TMenuItem
          Action = CargosCmd
        end
        object UF1: TMenuItem
          Action = UFCmd
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Action = SairCmd
      end
    end
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 176
    Top = 16
  end
  object ApplicationEvents: TApplicationEvents
    OnHint = ApplicationEventsHint
    Left = 256
    Top = 16
  end
end
