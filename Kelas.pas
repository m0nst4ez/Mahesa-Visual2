unit Kelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TFormKelas = class(TForm)
    lblnama: TLabel;
    lbljurusan: TLabel;
    Edtnama: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bhapus: TButton;
    bbatal: TButton;
    dbgrd1: TDBGrid;
    cbbjurusan: TComboBox;
    b1: TButton;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ds1: TDataSource;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure edtbersih;
    procedure edtenable;
    procedure posisiawal;
    procedure bbaruClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure beditClick(Sender: TObject);
    procedure bhapusClick(Sender: TObject);
    procedure b1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormKelas: TFormKelas;
  id : string;

implementation

{$R *.dfm}

procedure TFormKelas.edtbersih;
begin
Edtnama.Clear;
end;

procedure TFormKelas.edtenable;
begin
Edtnama.Enabled:= True;
cbbjurusan.Enabled:= True;
end;

procedure TFormKelas.posisiawal;
begin
edtbersih;
Edtnama.Enabled:= False;
cbbjurusan.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;

end;

procedure TFormKelas.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormKelas.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TFormKelas.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormKelas.bsimpanClick(Sender: TObject);
begin
if (Edtnama.Text = '') then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG!');
end
else
begin
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('INSERT INTO kelas VALUES (null, "' + Edtnama.Text + '", "' + cbbjurusan.Text + '")');
  ZQuery1.ExecSQL;

  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('SELECT * FROM kelas');
  ZQuery1.Open;

  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;
end;



end;

procedure TFormKelas.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtnama.Text:= ZQuery1.FieldList[1].AsString;
cbbjurusan.Text:= ZQuery1.FieldList[2].AsString;


end;

procedure TFormKelas.beditClick(Sender: TObject);
begin
if (Edtnama.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  if (Edtnama.Text = ZQuery1.FieldList[1].AsString) and (cbbjurusan.Text = ZQuery1.FieldList[2].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('Update kelas set nama_kelas="'+Edtnama.Text+'", jurusan="'+cbbjurusan.Text+'" where id="'+id+'"');
  ZQuery1.ExecSQL;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from kelas');
  ZQuery1.Open;
  posisiawal;
  end;


end;

procedure TFormKelas.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add(' delete from kelas where id="'+id+'"');
ZQuery1.ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from kelas');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormKelas.b1Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;

end.
