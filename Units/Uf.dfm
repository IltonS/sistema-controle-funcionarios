inherited FrmUf: TFrmUf
  Caption = 'FrmUf'
  ClientWidth = 756
  ExplicitWidth = 762
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTitulo: TPanel
    Width = 756
  end
  inherited PnlFormulario: TPanel
    Width = 756
    Height = 46
    ExplicitTop = 107
    ExplicitWidth = 756
    ExplicitHeight = 46
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 20
      Height = 13
      Caption = 'UF: '
    end
    object Label2: TLabel
      Left = 192
      Top = 16
      Width = 82
      Height = 13
      Caption = 'Nome do Estado:'
    end
    object EdtUf: TDBEdit
      Left = 51
      Top = 13
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      DataField = 'uf'
      DataSource = DataSource
      TabOrder = 0
    end
    object EdtNomeEstado: TDBEdit
      Left = 280
      Top = 13
      Width = 227
      Height = 21
      DataField = 'nome_estado'
      DataSource = DataSource
      TabOrder = 1
    end
  end
  inherited DBGrid: TDBGrid
    Top = 153
    Width = 756
    Height = 223
  end
  inherited PnlControles: TPanel
    Width = 756
  end
  inherited PnlPesquisa: TPanel
    Width = 756
    inherited EdtPesquisa: TLabeledEdit
      EditLabel.ExplicitLeft = 0
      EditLabel.ExplicitTop = -16
      EditLabel.ExplicitWidth = 58
    end
  end
  inherited DataSource: TDataSource
    DataSet = DM.TableUF
    Left = 96
    Top = 304
  end
end
