object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Login do Sistema de Controle de Funcion'#225'rios'
  ClientHeight = 248
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 49
    Align = alTop
    Alignment = taLeftJustify
    BevelEdges = []
    BevelOuter = bvNone
    Caption = '   Login'
    Color = 12480016
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    ExplicitWidth = 359
  end
  object Panel2: TPanel
    Left = 16
    Top = 63
    Width = 409
    Height = 114
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 29
      Height = 13
      Caption = 'Login:'
    end
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object EdtLogin: TEdit
      Left = 64
      Top = 21
      Width = 321
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 0
    end
    object EdtSenha: TEdit
      Left = 64
      Top = 64
      Width = 321
      Height = 21
      CharCase = ecLowerCase
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object BtnOk: TButton
    Left = 256
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = BtnOkClick
  end
  object BtnCancelar: TButton
    Left = 350
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = BtnCancelarClick
  end
end
