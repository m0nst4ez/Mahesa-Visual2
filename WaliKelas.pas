unit WaliKelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, ZAbstractConnection, ZConnection, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls, Grids, DBGrids;

type
  TFormWakel = class(TForm)
    lblnis: TLabel;
    lblnisn: TLabel;
    lblnama: TLabel;
    lblnik: TLabel;
    lbltanggallahir: TLabel;
    lbljk: TLabel;
    lblalamat: TLabel;
    lbl1: TLabel;
    Edtnik: TEdit;
    Edtnama: TEdit;
    Edtpendidikan: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bhapus: TButton;
    bbatal: TButton;
    dbgrd1: TDBGrid;
    Edttelp: TEdit;
    Edtmapel: TEdit;
    Edtalamat: TEdit;
    cbbjk: TComboBox;
    b1: TButton;
    ZQuery1: TZQuery;
    ds1: TDataSource;
    ZConnection1: TZConnection;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure edtbersih;
    procedure edtenable;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure bbaruClick(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
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
  FormWakel: TFormWakel;
  id: string;

implementation

{$R *.dfm}

procedure TFormWakel.edtbersih;
begin
Edtnik.Clear;
Edtnama.Clear;
Edtpendidikan.Clear;
Edtmapel.Clear;
Edttelp.Clear;
Edtalamat.Clear;
end;

procedure TFormWakel.edtenable;
begin
Edtnik.Enabled:= True;
Edtnama.Enabled:= True;
cbbjk.Enabled:= True;
Edtpendidikan.Enabled:= True;
Edtmapel.Enabled:= True;
Edttelp.Enabled:= True;
Edtalamat.Enabled:= True;
end;

procedure TFormWakel.posisiawal;
begin
edtbersih;
Edtnik.Enabled:= False;
Edtnama.Enabled:= False;
cbbjk.Enabled:= False;
Edtpendidikan.Enabled:= False;
Edtmapel.Enabled:= False;
Edttelp.Enabled:= False;
Edtalamat.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;
end;

procedure TFormWakel.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TFormWakel.bbaruClick(Sender: TObject);
begin
edtenable;
edtbersih;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormWakel.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormWakel.bsimpanClick(Sender: TObject);
begin
  if (Edtnik.Text='') or (Edtnama.Text='') or (Edtpendidikan.Text='') or (Edttelp.Text='') or (Edtmapel.Text='') or (Edtalamat.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  if (ZQuery1.Locate('nik', Edtnik.Text,[])) then
  begin
    ShowMessage('DATA CUSTOMER SUDAH DIGUNAKAN!');
    posisiawal;
  end else
  begin
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('insert into wali_kelas values (null,"'+Edtnik.Text+'","'+Edtnama.Text+'","'+cbbjk.Text+'","'+Edtpendidikan.Text+'","'+Edtmapel.Text+'","'+Edttelp.Text+'","'+Edtalamat.Text+'")');
  ZQuery1.ExecSQL;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from wali_kelas');
  ZQuery1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormWakel.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtnik.Text:= ZQuery1.FieldList[1].AsString;
Edtnama.Text:= ZQuery1.FieldList[2].AsString;
cbbjk.Text:= ZQuery1.FieldList[3].AsString;
Edtpendidikan.Text:= ZQuery1.FieldList[4].AsString;
Edtmapel.Text:= ZQuery1.FieldList[5].AsString;
Edttelp.Text:= ZQuery1.FieldList[6].AsString;
Edtalamat.Text:= ZQuery1.FieldList[7].AsString;
end;

procedure TFormWakel.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add(' delete from wali_kelas where id="'+id+'"');
ZQuery1.ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from wali_kelas');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormWakel.beditClick(Sender: TObject);
begin
  if (Edtnik.Text='') or (Edtnama.Text='') or (Edtpendidikan.Text='') or (Edttelp.Text='') or (Edtmapel.Text='') or (Edtalamat.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtnik.Text = ZQuery1.FieldList[1].AsString) and (Edtnama.Text = ZQuery1.FieldList[2].AsString) and (Edtpendidikan.Text = ZQuery1.FieldList[4].AsString) and (Edtmapel.Text = ZQuery1.FieldList[5].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('Update wali_kelas set nik="'+Edtnik.Text+'", nama="'+Edtnama.Text+'", jk="'+cbbjk.Text+'", pendidikan="'+Edtpendidikan.Text+'", mapel="'+Edtmapel.Text+'", telp="'+Edttelp.Text+'", alamat="'+Edtalamat.Text+'" where id="'+id+'"');
  ZQuery1.ExecSQL;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from wali_kelas');
  ZQuery1.Open;
  posisiawal;
  end;

end;

procedure TFormWakel.b1Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;

end.
