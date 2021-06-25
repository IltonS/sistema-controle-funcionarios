inherited FrmPerfis: TFrmPerfis
  Caption = 'FrmPerfis'
  ClientHeight = 557
  ClientWidth = 757
  ExplicitTop = -77
  ExplicitWidth = 763
  ExplicitHeight = 586
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTitulo: TPanel
    Width = 757
  end
  inherited PnlFormulario: TPanel
    Width = 757
    Height = 222
    ExplicitWidth = 757
    ExplicitHeight = 222
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 73
      Height = 13
      Caption = 'Nome do Perfil:'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 20
      Height = 13
      Caption = 'UFs'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 88
      Width = 42
      Height = 13
      Caption = 'Cargos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 120
      Width = 74
      Height = 13
      Caption = 'Funcion'#225'rios:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 15
      Top = 152
      Width = 52
      Height = 13
      Caption = 'Usu'#225'rios:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 184
      Width = 35
      Height = 13
      Caption = 'Perfis:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 95
      Top = 13
      Width = 275
      Height = 21
      DataField = 'nome_perfil'
      DataSource = DataSource
      TabOrder = 0
    end
    object DBCheckBox1: TDBCheckBox
      Left = 143
      Top = 56
      Width = 97
      Height = 17
      Caption = 'Menu UF'
      DataField = 'tb_uf'
      DataSource = DataSource
      TabOrder = 1
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 259
      Top = 56
      Width = 97
      Height = 17
      Caption = 'UF Incluir'
      DataField = 'tb_uf_I'
      DataSource = DataSource
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox3: TDBCheckBox
      Left = 375
      Top = 56
      Width = 97
      Height = 17
      Caption = 'UF Alterar'
      DataField = 'tb_uf_A'
      DataSource = DataSource
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox4: TDBCheckBox
      Left = 502
      Top = 56
      Width = 97
      Height = 17
      Caption = 'UF Excluir'
      DataField = 'tb_uf_E'
      DataSource = DataSource
      TabOrder = 4
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox5: TDBCheckBox
      Left = 143
      Top = 88
      Width = 97
      Height = 17
      Caption = 'Menu Cargos'
      DataField = 'tb_cargos'
      DataSource = DataSource
      TabOrder = 5
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox6: TDBCheckBox
      Left = 259
      Top = 88
      Width = 97
      Height = 17
      Caption = 'Cargos Incluir'
      DataField = 'tb_cargos_I'
      DataSource = DataSource
      TabOrder = 6
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox7: TDBCheckBox
      Left = 375
      Top = 89
      Width = 97
      Height = 17
      Caption = 'Cargos Alterar'
      DataField = 'tb_cargos_A'
      DataSource = DataSource
      TabOrder = 7
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox8: TDBCheckBox
      Left = 502
      Top = 87
      Width = 97
      Height = 17
      Caption = 'Cargos Excluir'
      DataField = 'tb_cargos_E'
      DataSource = DataSource
      TabOrder = 8
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox9: TDBCheckBox
      Left = 143
      Top = 120
      Width = 110
      Height = 17
      Caption = 'Menu Funcion'#225'rios'
      DataField = 'tb_funcionarios'
      DataSource = DataSource
      TabOrder = 9
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox10: TDBCheckBox
      Left = 259
      Top = 120
      Width = 111
      Height = 17
      Caption = 'Funcion'#225'rios Incluir'
      DataField = 'tb_funcionarios_I'
      DataSource = DataSource
      TabOrder = 10
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox11: TDBCheckBox
      Left = 375
      Top = 120
      Width = 121
      Height = 17
      Caption = 'Funcion'#225'rios Alterar'
      DataField = 'tb_funcionarios_A'
      DataSource = DataSource
      TabOrder = 11
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox12: TDBCheckBox
      Left = 502
      Top = 120
      Width = 123
      Height = 17
      Caption = 'Funcion'#225'rios Excluir'
      DataField = 'tb_funcionarios_E'
      DataSource = DataSource
      TabOrder = 12
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox13: TDBCheckBox
      Left = 143
      Top = 152
      Width = 97
      Height = 17
      Caption = 'Menu Usu'#225'rios'
      DataField = 'tb_usuarios'
      DataSource = DataSource
      TabOrder = 13
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox14: TDBCheckBox
      Left = 259
      Top = 152
      Width = 97
      Height = 17
      Caption = 'Usu'#225'rios Incluir'
      DataField = 'tb_usuarios_I'
      DataSource = DataSource
      TabOrder = 14
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox15: TDBCheckBox
      Left = 375
      Top = 152
      Width = 97
      Height = 17
      Caption = 'Usu'#225'rios Alterar'
      DataField = 'tb_usuarios_A'
      DataSource = DataSource
      TabOrder = 15
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox16: TDBCheckBox
      Left = 502
      Top = 152
      Width = 97
      Height = 17
      Caption = 'Usu'#225'rios Excluir'
      DataField = 'tb_usuarios_E'
      DataSource = DataSource
      TabOrder = 16
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox17: TDBCheckBox
      Left = 143
      Top = 184
      Width = 97
      Height = 17
      Caption = 'Menu Perfis'
      DataField = 'tb_perfis'
      DataSource = DataSource
      TabOrder = 17
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox18: TDBCheckBox
      Left = 259
      Top = 184
      Width = 97
      Height = 17
      Caption = 'Perfis Incluir'
      DataField = 'tb_perfis_I'
      DataSource = DataSource
      TabOrder = 18
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox19: TDBCheckBox
      Left = 375
      Top = 184
      Width = 97
      Height = 17
      Caption = 'Perfis Alterar'
      DataField = 'tb_perfis_A'
      DataSource = DataSource
      TabOrder = 19
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox20: TDBCheckBox
      Left = 502
      Top = 184
      Width = 97
      Height = 17
      Caption = 'Perfis Excluir'
      DataField = 'tb_perfis_E'
      DataSource = DataSource
      TabOrder = 20
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  inherited DBGrid: TDBGrid
    Top = 329
    Width = 757
    Height = 171
    Columns = <
      item
        Expanded = False
        FieldName = 'nome_perfil'
        Title.Caption = 'Nome do Perfil'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_uf'
        Title.Caption = 'Menu UF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_uf_I'
        Title.Caption = 'UF Incluir'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_uf_A'
        Title.Caption = 'UF Alterar'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_uf_E'
        Title.Caption = 'UF Excluir'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_cargos'
        Title.Caption = 'Menu Cargos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_cargos_I'
        Title.Caption = 'Cargos Incluir'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_cargos_A'
        Title.Caption = 'Cargos Alterar'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_cargos_E'
        Title.Caption = 'Cargos Excluir'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_funcionarios'
        Title.Caption = 'Menu Funcion'#225'rios'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_funcionarios_I'
        Title.Caption = 'Funcion'#225'rios Incluir'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_funcionarios_A'
        Title.Caption = 'Funcion'#225'rios Alterar'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_funcionarios_E'
        Title.Caption = 'Funcion'#225'rios Excluir'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_usuarios'
        Title.Caption = 'Menu Usu'#225'rios'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_usuarios_I'
        Title.Caption = 'Usu'#225'rios Incluir'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_usuarios_A'
        Title.Caption = 'Usu'#225'rios Alterar'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_usuarios_E'
        Title.Caption = 'Usu'#225'rios Excluir'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_perfis'
        Title.Caption = 'Menu Perfis'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_perfis_I'
        Title.Caption = 'Perfis Incluir'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_perfis_A'
        Title.Caption = 'Perfis Alterar'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tb_perfis_E'
        Title.Caption = 'Perfis Excluir'
        Visible = True
      end>
  end
  inherited PnlControles: TPanel
    Top = 500
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
    DataSet = DM.TablePerfis
    Left = 24
    Top = 352
  end
end
