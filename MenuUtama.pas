unit MenuUtama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TFormMenuUtama = class(TForm)
    mm1: TMainMenu;
    User1: TMenuItem;
    User2: TMenuItem;
    Kelas1: TMenuItem;
    User3: TMenuItem;
    Ortu1: TMenuItem;
    Poin1: TMenuItem;
    WaliKelas1: TMenuItem;
    procedure User2Click(Sender: TObject);
    procedure Kelas1Click(Sender: TObject);
    procedure User3Click(Sender: TObject);
    procedure Ortu1Click(Sender: TObject);
    procedure Poin1Click(Sender: TObject);
    procedure WaliKelas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenuUtama: TFormMenuUtama;

implementation

uses User, Kelas, Siswa, Ortu, Poin, WaliKelas;
{$R *.dfm}

procedure TFormMenuUtama.User2Click(Sender: TObject);
begin
FormUser.ShowModal;
end;

procedure TFormMenuUtama.Kelas1Click(Sender: TObject);
begin
FormKelas.ShowModal;
end;

procedure TFormMenuUtama.User3Click(Sender: TObject);
begin
FormSiswa.ShowModal;
end;

procedure TFormMenuUtama.Ortu1Click(Sender: TObject);
begin
FormOrtu.ShowModal;
end;

procedure TFormMenuUtama.Poin1Click(Sender: TObject);
begin
FormPoin.ShowModal;
end;

procedure TFormMenuUtama.WaliKelas1Click(Sender: TObject);
begin
FormWakel.ShowModal;
end;

end.
