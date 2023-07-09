program LaporanMa;

uses
  Forms,
  MenuUtama in 'MenuUtama.pas' {FormMenuUtama},
  User in 'User.pas' {FormUser},
  Kelas in 'Kelas.pas' {FormKelas},
  Siswa in 'Siswa.pas' {FormSiswa},
  Ortu in 'Ortu.pas' {FormOrtu},
  Poin in 'Poin.pas' {FormPoin},
  WaliKelas in 'WaliKelas.pas' {FormWakel},
  Hub in 'Hub.pas' {FormHub},
  Catatan in 'Catatan.pas' {FormCatatan};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMenuUtama, FormMenuUtama);
  Application.CreateForm(TFormUser, FormUser);
  Application.CreateForm(TFormKelas, FormKelas);
  Application.CreateForm(TFormSiswa, FormSiswa);
  Application.CreateForm(TFormOrtu, FormOrtu);
  Application.CreateForm(TFormPoin, FormPoin);
  Application.CreateForm(TFormWakel, FormWakel);
  Application.CreateForm(TFormHub, FormHub);
  Application.CreateForm(TFormCatatan, FormCatatan);
  Application.Run;
end.
