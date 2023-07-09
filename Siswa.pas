unit Siswa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, ComCtrls, StdCtrls, Grids,
  DBGrids;

type
  TFormSiswa = class(TForm)
    lblnis: TLabel;
    lblnisn: TLabel;
    lblnama: TLabel;
    lblnik: TLabel;
    lbltempatlahir: TLabel;
    lbltanggallahir: TLabel;
    lbljk: TLabel;
    lblalamat: TLabel;
    lbltelp: TLabel;
    lblhp: TLabel;
    lblstatus: TLabel;
    Edtnis: TEdit;
    Edtnisn: TEdit;
    Edtnama: TEdit;
    Edtnik: TEdit;
    Edttempatlahir: TEdit;
    Edtalamat: TEdit;
    Edttelp: TEdit;
    Edthp: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bhapus: TButton;
    bbatal: TButton;
    dbgrd1: TDBGrid;
    cbbjk: TComboBox;
    dtp1: TDateTimePicker;
    b1: TButton;
    cbbstatus: TComboBox;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ds1: TDataSource;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure edtbersih;
    procedure edtenable;
    procedure posisiawal;
    procedure bbaruClick(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure bhapusClick(Sender: TObject);
    procedure beditClick(Sender: TObject);
    procedure b1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSiswa: TFormSiswa;
  id: string;

implementation

{$R *.dfm}

procedure TFormSiswa.edtbersih;
begin
Edtnis.Clear;
Edtnisn.Clear;
Edtnisn.Clear;
Edtnama.Clear;
Edtnik.Clear;
Edttempatlahir.Clear;
Edtalamat.Clear;
Edttelp.Clear;
Edthp.Clear;
end;

procedure TFormSiswa.edtenable;
begin
Edtnis.Enabled:= True;
Edtnisn.Enabled:= True;
Edtnama.Enabled:= True;
Edtnik.Enabled:= True;
Edttempatlahir.Enabled:= True;
dtp1.Enabled:=True;
cbbjk.Enabled:= True;
Edtalamat.Enabled:= True;
Edttelp.Enabled:= True;
Edthp.Enabled:= True;
cbbstatus.Enabled:=True;
end;

procedure TFormSiswa.posisiawal;
begin
edtbersih;
Edtnis.Enabled:= False;
Edtnisn.Enabled:= False;
Edtnama.Enabled:= False;
Edtnik.Enabled:= False;
Edttempatlahir.Enabled:= False;
dtp1.Enabled:=False;
cbbjk.Enabled:= False;
Edtalamat.Enabled:= False;
Edttelp.Enabled:= False;
Edthp.Enabled:= False;
cbbstatus.Enabled:=False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;

end;

procedure TFormSiswa.bbaruClick(Sender: TObject);
begin
edtenable;
edtbersih;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormSiswa.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormSiswa.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TFormSiswa.bsimpanClick(Sender: TObject);
begin
  if (Edtnis.Text='') or (Edtnisn.Text='') or (Edtnama.Text='') or (Edtnik.Text='') or (Edttempatlahir.Text='') or (Edtalamat.Text='') or (Edttelp.Text='') or (Edthp.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  if (ZQuery1.Locate('nis', Edtnis.Text,[])) and (ZQuery1.Locate('nisn', Edtnisn.Text,[]))  then
  begin
    ShowMessage('DATA CUSTOMER SUDAH DIGUNAKAN!');
    posisiawal;
  end else
  begin
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('insert into siswa values (null,"'+Edtnis.Text+'","'+Edtnisn.Text+'","'+Edtnama.Text+'","'+Edtnik.Text+'","'+Edttempatlahir.Text+'", "' + FormatDateTime('yyyy-mm-dd', dtp1.Date) + '","'+cbbjk.Text+'","'+Edtalamat.Text+'","'+Edttelp.Text+'","'+Edthp.Text+'","'+cbbstatus.Text+'")');
  ZQuery1.ExecSQL;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from siswa');
  ZQuery1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormSiswa.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtnis.Text:= ZQuery1.FieldList[1].AsString;
Edtnisn.Text:= ZQuery1.FieldList[2].AsString;
Edtnama.Text:= ZQuery1.FieldList[3].AsString;
Edtnik.Text:= ZQuery1.FieldList[4].AsString;
Edttempatlahir.Text:= ZQuery1.FieldList[5].AsString;
dtp1.Date := StrToDate(ZQuery1.FieldList[6].AsString);
cbbjk.Text:= ZQuery1.FieldList[7].AsString;
Edtalamat.Text:= ZQuery1.FieldList[8].AsString;
Edttelp.Text:= ZQuery1.FieldList[9].AsString;
Edthp.Text:= ZQuery1.FieldList[10].AsString;
cbbstatus.Text:= ZQuery1.FieldList[11].AsString;


end;

procedure TFormSiswa.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add(' delete from siswa where id="'+id+'"');
ZQuery1.ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from siswa');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormSiswa.beditClick(Sender: TObject);
begin
  if (Edtnis.Text='') or (Edtnisn.Text='') or (Edtnama.Text='') or (Edtnik.Text='') or (Edttempatlahir.Text='') or (Edtalamat.Text='') or (Edttelp.Text='') or (Edthp.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtnis.Text = ZQuery1.FieldList[1].AsString) and (Edtnisn.Text = ZQuery1.FieldList[2].AsString) and (Edtnama.Text = ZQuery1.FieldList[3].AsString) and (cbbstatus.Text = ZQuery1.FieldList[12].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('Update siswa set nis="'+Edtnis.Text+'", nisn="'+Edtnisn.Text+'", nama_siswa="'+Edtnama.Text+'", nik="'+Edtnik.Text+'", tempat_lahir="'+Edttempatlahir.Text+'", tgl_lahir="'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'", jk="'+cbbjk.Text+'", alamat="'+Edtalamat.Text+'", telp="'+Edttelp.Text+'", hp="'+Edthp.Text+'", status="'+cbbstatus.Text+'" where id="'+id+'"');
  ZQuery1.ExecSQL;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from siswa');
  ZQuery1.Open;
  posisiawal;
  end;

end;

procedure TFormSiswa.b1Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;

end.
