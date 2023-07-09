object FormMenuUtama: TFormMenuUtama
  Left = 192
  Top = 162
  Width = 1044
  Height = 530
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
        OnClick = Kelas1Click
      end
      object User3: TMenuItem
        Caption = 'Siswa'
        OnClick = User3Click
      end
      object Ortu1: TMenuItem
        Caption = 'Ortu'
        OnClick = Ortu1Click
      end
      object Poin1: TMenuItem
        Caption = 'Poin'
        OnClick = Poin1Click
      end
      object WaliKelas1: TMenuItem
        Caption = 'Wali Kelas'
        OnClick = WaliKelas1Click
      end
      object Hubungan1: TMenuItem
        Caption = 'Hubungan'
        OnClick = Hubungan1Click
      end
    end
  end
end
