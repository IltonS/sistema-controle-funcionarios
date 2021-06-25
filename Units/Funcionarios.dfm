inherited FrmFuncionarios: TFrmFuncionarios
  Caption = 'FrmFuncionarios'
  ClientHeight = 519
  ExplicitTop = 2
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlFormulario: TPanel
    Height = 126
    ExplicitHeight = 126
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 104
      Height = 13
      Caption = 'Nome do Funcion'#225'rio:'
    end
    object Label2: TLabel
      Left = 266
      Top = 10
      Width = 119
      Height = 13
      Caption = 'CPF: (somente n'#250'meros)'
    end
    object Label3: TLabel
      Left = 415
      Top = 10
      Width = 100
      Height = 13
      Caption = 'Data de Nascimento:'
    end
    object Label4: TLabel
      Left = 16
      Top = 56
      Width = 59
      Height = 13
      Caption = 'Logradouro:'
    end
    object Label5: TLabel
      Left = 266
      Top = 56
      Width = 41
      Height = 13
      Caption = 'N'#250'mero:'
    end
    object Label6: TLabel
      Left = 340
      Top = 56
      Width = 69
      Height = 13
      Caption = 'Complemento:'
    end
    object Label7: TLabel
      Left = 648
      Top = 10
      Width = 33
      Height = 13
      Caption = 'Cargo:'
    end
    object Label8: TLabel
      Left = 516
      Top = 56
      Width = 32
      Height = 13
      Caption = 'Bairro:'
    end
    object Label9: TLabel
      Left = 640
      Top = 56
      Width = 37
      Height = 13
      Caption = 'Cidade:'
    end
    object Label10: TLabel
      Left = 807
      Top = 56
      Width = 17
      Height = 13
      Caption = 'UF:'
    end
    object Label11: TLabel
      Left = 807
      Top = 10
      Width = 36
      Height = 13
      Caption = 'Sal'#225'rio:'
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 29
      Width = 244
      Height = 21
      DataField = 'nome_funcionario'
      DataSource = DataSource
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 266
      Top = 29
      Width = 143
      Height = 21
      DataField = 'cpf'
      DataSource = DataSource
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 415
      Top = 29
      Width = 108
      Height = 21
      DataField = 'data_nascimento'
      DataSource = DataSource
      TabOrder = 2
    end
    object RgrSexo: TDBRadioGroup
      Left = 529
      Top = 10
      Width = 105
      Height = 41
      Caption = 'Sexo'
      Columns = 2
      DataField = 'sexo'
      DataSource = DataSource
      Items.Strings = (
        'M'
        'F')
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 75
      Width = 244
      Height = 21
      DataField = 'logradouro'
      DataSource = DataSource
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 266
      Top = 75
      Width = 68
      Height = 21
      DataField = 'numero'
      DataSource = DataSource
      TabOrder = 5
    end
    object DBEdit6: TDBEdit
      Left = 340
      Top = 75
      Width = 167
      Height = 21
      DataField = 'complemento'
      DataSource = DataSource
      TabOrder = 6
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 648
      Top = 29
      Width = 153
      Height = 21
      DataField = 'id_cargo'
      DataSource = DataSource
      KeyField = 'id_cargo'
      ListField = 'nome_cargo'
      ListSource = DSCargo
      TabOrder = 7
    end
    object DBEdit7: TDBEdit
      Left = 513
      Top = 75
      Width = 121
      Height = 21
      DataField = 'bairro'
      DataSource = DataSource
      TabOrder = 8
    end
    object DBEdit8: TDBEdit
      Left = 640
      Top = 75
      Width = 161
      Height = 21
      DataField = 'cidade'
      DataSource = DataSource
      TabOrder = 9
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 807
      Top = 75
      Width = 114
      Height = 21
      DataField = 'id_uf'
      DataSource = DataSource
      KeyField = 'id_uf'
      ListField = 'uf'
      ListSource = DSUf
      TabOrder = 10
    end
    object DBEdit9: TDBEdit
      Left = 807
      Top = 29
      Width = 114
      Height = 21
      DataField = 'salario'
      DataSource = DataSource
      TabOrder = 11
    end
  end
  inherited DBGrid: TDBGrid
    Top = 233
    Height = 229
    Columns = <
      item
        Expanded = False
        FieldName = 'nome_funcionario'
        Title.Caption = 'Nome do Funcion'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cpf'
        Title.Caption = 'CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_nascimento'
        Title.Caption = 'Data de Nascimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sexo'
        Title.Caption = 'Sexo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'logradouro'
        Title.Caption = 'Logradouro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero'
        Title.Caption = 'N'#250'mero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'complemento'
        Title.Caption = 'Complemento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bairro'
        Title.Caption = 'Bairro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Title.Caption = 'Cidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_uf'
        Title.Caption = 'UF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_cargo'
        Title.Caption = 'Cargo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'salario'
        Title.Caption = 'Sal'#225'rio'
        Visible = True
      end>
  end
  inherited PnlControles: TPanel
    Top = 462
  end
  inherited PnlPesquisa: TPanel
    inherited EdtPesquisa: TLabeledEdit
      EditLabel.ExplicitLeft = 0
      EditLabel.ExplicitTop = -16
      EditLabel.ExplicitWidth = 58
    end
  end
  inherited DataSource: TDataSource
    DataSet = DM.TableFuncionarios
    Left = 32
    Top = 344
  end
  object DSCargo: TDataSource
    DataSet = DM.TableCargos
    Left = 104
    Top = 344
  end
  object DSUf: TDataSource
    DataSet = DM.TableUF
    Left = 168
    Top = 344
  end
end
