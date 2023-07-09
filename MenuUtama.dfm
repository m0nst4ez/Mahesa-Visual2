object FormMenuUtama: TFormMenuUtama
  Left = 192
  Top = 152
  Width = 1044
  Height = 540
  Caption = 'MENU UTAMA'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mm1: TMainMenu
    Left = 16
    Top = 8
    object User1: TMenuItem
      Caption = 'Menu'
      object User2: TMenuItem
        Caption = 'User'
        OnClick = User2Click
      end
      object Kelas1: TMenuItem
        Caption = 'Kelas'
      end
    end
  end
end
