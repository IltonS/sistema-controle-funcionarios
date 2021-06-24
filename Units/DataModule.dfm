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
end
