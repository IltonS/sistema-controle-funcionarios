object DM: TDM
  OldCreateOrder = False
  Height = 270
  Width = 472
  object MySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Ilton\Documents\Embarcadero\Studio\Projects\sistema-con' +
      'trole-funcionarios\Lib\libmysql.dll'
    Left = 32
    Top = 16
  end
  object MySQLConnection: TFDConnection
    Params.Strings = (
      'Database=db_scf'
      'User_Name=root'
      'Password=master'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    Left = 128
    Top = 16
  end
  object QueryLogin: TFDQuery
    Connection = MySQLConnection
    SQL.Strings = (
      'SELECT *'#10
      'FROM tb_usuarios u'
      '   INNER JOIN tb_perfis p ON u.id_perfil=p.id_perfil;')
    Left = 32
    Top = 80
  end
  object TableUF: TFDTable
    Active = True
    IndexFieldNames = 'id_uf'
    Connection = MySQLConnection
    UpdateOptions.UpdateTableName = 'db_scf.tb_uf'
    TableName = 'db_scf.tb_uf'
    Left = 32
    Top = 144
  end
  object TableCargos: TFDTable
    Active = True
    IndexFieldNames = 'id_cargo'
    Connection = MySQLConnection
    UpdateOptions.UpdateTableName = 'db_scf.tb_cargos'
    TableName = 'db_scf.tb_cargos'
    Left = 96
    Top = 144
  end
  object TablePerfis: TFDTable
    Active = True
    IndexFieldNames = 'id_perfil'
    Connection = MySQLConnection
    UpdateOptions.UpdateTableName = 'db_scf.tb_perfis'
    TableName = 'db_scf.tb_perfis'
    Left = 168
    Top = 144
  end
  object TableUsuarios: TFDTable
    Active = True
    IndexFieldNames = 'id_usuario'
    Connection = MySQLConnection
    UpdateOptions.UpdateTableName = 'db_scf.tb_usuarios'
    TableName = 'db_scf.tb_usuarios'
    Left = 240
    Top = 144
  end
  object TableFuncionarios: TFDTable
    Active = True
    IndexFieldNames = 'id_funcionario'
    Connection = MySQLConnection
    UpdateOptions.UpdateTableName = 'db_scf.tb_funcionarios'
    TableName = 'db_scf.tb_funcionarios'
    Left = 320
    Top = 144
  end
end
