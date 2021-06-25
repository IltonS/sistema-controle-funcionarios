object FrmModeloCadastro: TFrmModeloCadastro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrmModeloCadastro'
  ClientHeight = 433
  ClientWidth = 945
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 945
    Height = 49
    Align = alTop
    Alignment = taLeftJustify
    BevelEdges = []
    BevelOuter = bvNone
    Caption = '   Cadastro'
    Color = 12480016
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object PnlFormulario: TPanel
    Left = 0
    Top = 107
    Width = 945
    Height = 152
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitTop = 49
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 259
    Width = 945
    Height = 117
    Align = alClient
    DataSource = DataSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object PnlControles: TPanel
    Left = 0
    Top = 376
    Width = 945
    Height = 57
    Align = alBottom
    BevelEdges = []
    BevelOuter = bvNone
    TabOrder = 2
    object BtnNovo: TBitBtn
      Left = 16
      Top = 15
      Width = 75
      Height = 25
      Hint = 'Novo|Cria um novo registro.'
      Caption = 'Novo'
      TabOrder = 0
      OnClick = BtnNovoClick
    end
    object BtnGravar: TBitBtn
      Left = 97
      Top = 15
      Width = 75
      Height = 25
      Hint = 'Gravar|Grava o registro atual.'
      Caption = 'Gravar'
      TabOrder = 1
      OnClick = BtnGravarClick
    end
    object BtnEditar: TBitBtn
      Left = 178
      Top = 15
      Width = 75
      Height = 25
      Hint = 'Editar|Edita o registro.'
      Caption = 'Editar'
      TabOrder = 2
      OnClick = BtnEditarClick
    end
    object BtnDeletar: TBitBtn
      Left = 259
      Top = 15
      Width = 75
      Height = 25
      Hint = 'Deletar|Deleta o registro da tabela.'
      Caption = 'Deletar'
      TabOrder = 3
      OnClick = BtnDeletarClick
    end
    object BtnCancelar: TBitBtn
      Left = 340
      Top = 15
      Width = 75
      Height = 25
      Hint = 'Cancelar|Cancela a opera'#231#227'o atual.'
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = BtnCancelarClick
    end
    object BtnPrimeiro: TBitBtn
      Left = 421
      Top = 15
      Width = 75
      Height = 25
      Hint = 'Primeiro|Seleciona o primeiro registro da tabela.'
      Caption = 'Primeiro'
      TabOrder = 5
      OnClick = BtnPrimeiroClick
    end
    object BtnAnterior: TBitBtn
      Left = 502
      Top = 15
      Width = 75
      Height = 25
      Hint = 'Anterior|Seleciona o registro anterior.'
      Caption = 'Anterior'
      TabOrder = 6
      OnClick = BtnAnteriorClick
    end
    object BtnPosterior: TBitBtn
      Left = 583
      Top = 15
      Width = 75
      Height = 25
      Hint = 'Posterior|Seleciona o registro posterior da tabela.'
      Caption = 'Posterior'
      TabOrder = 7
      OnClick = BtnPosteriorClick
    end
    object BtnUltimo: TBitBtn
      Left = 664
      Top = 15
      Width = 75
      Height = 25
      Hint = #218'ltimo|Seleciona o '#250'ltimo registro da tabela.'
      Caption = #218'ltimo'
      TabOrder = 8
      OnClick = BtnUltimoClick
    end
  end
  object PnlPesquisa: TPanel
    Left = 0
    Top = 49
    Width = 945
    Height = 58
    Align = alTop
    BevelEdges = []
    BevelOuter = bvNone
    TabOrder = 3
    object EdtPesquisa: TLabeledEdit
      Left = 16
      Top = 25
      Width = 273
      Height = 21
      EditLabel.Width = 69
      EditLabel.Height = 13
      EditLabel.Caption = 'Pesquisar por:'
      TabOrder = 0
    end
    object BtnPesquisar: TBitBtn
      Left = 295
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = BtnPesquisarClick
    end
  end
  object DataSource: TDataSource
    Left = 864
    Top = 272
  end
end
