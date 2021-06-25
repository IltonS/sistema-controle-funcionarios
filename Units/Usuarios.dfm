inherited FrmUsuarios: TFrmUsuarios
  Caption = 'FrmUsuarios'
  ClientWidth = 751
  ExplicitTop = 2
  ExplicitWidth = 757
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTitulo: TPanel
    Width = 751
  end
  inherited PnlFormulario: TPanel
    Width = 751
    Height = 62
    ExplicitWidth = 751
    ExplicitHeight = 62
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 29
      Height = 13
      Caption = 'Login:'
    end
    object Label2: TLabel
      Left = 232
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object Label3: TLabel
      Left = 440
      Top = 24
      Width = 28
      Height = 13
      Caption = 'Perfil:'
    end
    object DBEdit1: TDBEdit
      Left = 51
      Top = 21
      Width = 161
      Height = 21
      DataField = 'login'
      DataSource = DataSource
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 272
      Top = 21
      Width = 143
      Height = 21
      DataField = 'senha'
      DataSource = DataSource
      TabOrder = 1
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 474
      Top = 21
      Width = 184
      Height = 21
      DataField = 'id_perfil'
      DataSource = DataSource
      KeyField = 'id_perfil'
      ListField = 'nome_perfil'
      ListSource = DSPerfis
      TabOrder = 2
    end
  end
  inherited DBGrid: TDBGrid
    Top = 169
    Width = 751
    Height = 207
    Columns = <
      item
        Expanded = False
        FieldName = 'login'
        Title.Caption = 'Login'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'senha'
        Title.Caption = 'Senha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_perfil'
        Title.Caption = 'Perfil'
        Visible = True
      end>
  end
  inherited PnlControles: TPanel
    Width = 751
  end
  inherited PnlPesquisa: TPanel
    Width = 751
    inherited EdtPesquisa: TLabeledEdit
      EditLabel.ExplicitLeft = 0
      EditLabel.ExplicitTop = -16
      EditLabel.ExplicitWidth = 58
    end
  end
  inherited DataSource: TDataSource
    DataSet = DM.TableUsuarios
    Left = 40
    Top = 304
  end
  object DSPerfis: TDataSource
    DataSet = DM.TablePerfis
    Left = 128
    Top = 304
  end
end
