program LaporanMa;

uses
  Forms,
  MenuUtama in 'MenuUtama.pas' {FormMenuUtama},
  User in 'User.pas' {FormUser};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMenuUtama, FormMenuUtama);
  Application.CreateForm(TFormUser, FormUser);
  Application.Run;
end.
