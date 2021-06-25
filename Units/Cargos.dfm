inherited FrmCargos: TFrmCargos
  Caption = 'FrmCargos'
  ClientWidth = 757
  ExplicitTop = 2
  ExplicitWidth = 763
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTitulo: TPanel
    Width = 757
  end
  inherited PnlFormulario: TPanel
    Width = 757
    Height = 62
    ExplicitHeight = 62
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 78
      Height = 13
      Caption = 'Nome do Cargo:'
    end
    object DBEdit1: TDBEdit
      Left = 100
      Top = 21
      Width = 270
      Height = 21
      DataField = 'nome_cargo'
      DataSource = DataSource
      TabOrder = 0
    end
  end
  inherited DBGrid: TDBGrid
    Top = 169
    Width = 757
    Height = 207
    Columns = <
      item
        Expanded = False
        FieldName = 'nome_cargo'
        Title.Caption = 'Nome do Cargo'
        Visible = True
      end>
  end
  inherited PnlControles: TPanel
    Width = 757
  end
  inherited PnlPesquisa: TPanel
    Width = 757
    inherited EdtPesquisa: TLabeledEdit
      EditLabel.ExplicitLeft = 0
      EditLabel.ExplicitTop = -16
      EditLabel.ExplicitWidth = 58
    end
  end
  inherited DataSource: TDataSource
    DataSet = DM.TableCargos
    Left = 56
    Top = 216
  end
end
