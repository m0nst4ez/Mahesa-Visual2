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
    procedure User2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenuUtama: TFormMenuUtama;

implementation

uses User;
{$R *.dfm}

procedure TFormMenuUtama.User2Click(Sender: TObject);
begin
FormUser.ShowModal;
end;

end.
