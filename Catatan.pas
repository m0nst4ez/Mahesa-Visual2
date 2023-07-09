unit Catatan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, ComCtrls, Grids,
  DBGrids;

type
  TFormCatatan = class(TForm)
    lblsiswaid: TLabel;
    lblpoinid: TLabel;
    lblwaliid: TLabel;
    lblortuid: TLabel;
    lblalamat: TLabel;
    lblsemester: TLabel;
    lblstatus: TLabel;
    Edtsemester: TEdit;
    Edtstatus: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bhapus: TButton;
    bbatal: TButton;
    dbgrd1: TDBGrid;
    dtptgl: TDateTimePicker;
    b1: TButton;
    cbbsiswaid: TComboBox;
    cbbpoinid: TComboBox;
    cbbwaliid: TComboBox;
    cbbortuid: TComboBox;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ds1: TDataSource;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure edtbersih;
    procedure edtenable;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure bbaruClick(Sender: TObject);
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
  FormCatatan: TFormCatatan;
  id: string;

implementation

{$R *.dfm}

procedure TFormCatatan.edtbersih;
begin
Edtsemester.Clear;
Edtstatus.Clear;
end;

procedure TFormCatatan.edtenable;
begin
dtptgl.Enabled:= True;
Edtsemester.Enabled:= True;
cbbsiswaid.Enabled:= True;
cbbwaliid.Enabled:= True;
cbbortuid.Enabled:= True;
cbbpoinid.Enabled:= True;
Edtstatus.Enabled:= True;
end;

procedure TFormCatatan.posisiawal;
begin
edtbersih;
dtptgl.Enabled:= False;
Edtsemester.Enabled:= False;
cbbsiswaid.Enabled:= False;
cbbwaliid.Enabled:= False;
cbbortuid.Enabled:= False;
cbbpoinid.Enabled:= False;
Edtstatus.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;

end;

procedure TFormCatatan.FormShow(Sender: TObject);
begin
  posisiawal;
  cbbsiswaid.Items.Clear;
  cbbpoinid.Items.Clear;
  cbbwaliid.Items.Clear;
  cbbortuid.Items.Clear;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('SELECT siswa_id FROM catatan');
  ZQuery1.Open;

  while not ZQuery1.Eof do
  begin
    cbbsiswaid.Items.Add(ZQuery1.FieldByName('siswa_id').AsString);
    ZQuery1.Next;
  end;

  ZQuery1.Close;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('SELECT ortu_id FROM catatan');
  ZQuery1.Open;

  while not ZQuery1.Eof do
  begin
    cbbortuid.Items.Add(ZQuery1.FieldByName('ortu_id').AsString);
    ZQuery1.Next;
  end;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('SELECT poin_id FROM catatan');
  ZQuery1.Open;

  while not ZQuery1.Eof do
  begin
    cbbpoinid.Items.Add(ZQuery1.FieldByName('poin_id').AsString);
    ZQuery1.Next;
  end;

  ZQuery1.Close;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('SELECT wali_id FROM catatan');
  ZQuery1.Open;

  while not ZQuery1.Eof do
  begin
    cbbwaliid.Items.Add(ZQuery1.FieldByName('wali_id').AsString);
    ZQuery1.Next;
  end;

  dbgrd1.DataSource := ds1;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('SELECT * FROM catatan');
  ZQuery1.Open;

end;

procedure TFormCatatan.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormCatatan.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;

end;

procedure TFormCatatan.bsimpanClick(Sender: TObject);
begin
  if (Edtsemester.Text='') or (Edtstatus.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  begin
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('insert into catatan values (null,"'+FormatDateTime('yyyy-mm-dd', dtptgl.Date)+'","'+Edtsemester.Text+'","'+cbbsiswaid.Text+'","'+cbbwaliid.Text+'","'+cbbortuid.Text+'","'+cbbpoinid.Text+'","'+Edtstatus.Text+'")');
  ZQuery1.ExecSQL;

  //ZQuery1.Active:= False;
  //ZQuery1.Active:= True;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from catatan');
  ZQuery1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormCatatan.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

dtptgl.Date := StrToDate(ZQuery1.FieldList[1].AsString);
Edtsemester.Text:= ZQuery1.FieldList[2].AsString;
cbbsiswaid.Text:= ZQuery1.FieldList[3].AsString;
cbbwaliid.Text:= ZQuery1.FieldList[4].AsString;
cbbortuid.Text:= ZQuery1.FieldList[5].AsString;
cbbpoinid.Text:= ZQuery1.FieldList[6].AsString;
Edtstatus.Text:= ZQuery1.FieldList[7].AsString;

end;

procedure TFormCatatan.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add(' delete from catatan where id="'+id+'"');
ZQuery1.ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from catatan');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormCatatan.beditClick(Sender: TObject);
begin
  if (Edtsemester.Text='') or (Edtstatus.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtsemester.Text = ZQuery1.FieldList[3].AsString) and (Edtstatus.Text = ZQuery1.FieldList[7].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('Update catatan set tanggal="'+FormatDateTime('yyyy-mm-dd', dtptgl.Date)+'", semester="'+Edtsemester.Text+'", siswa_id="'+cbbsiswaid.Text+'", wali_id="'+cbbwaliid.Text+'", ortu_id="'+cbbortuid.Text+'",  poin_id="'+cbbpoinid.Text+'",  status="'+Edtstatus.Text+'" where id="'+id+'"');
  ZQuery1.ExecSQL;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from catatan');
  ZQuery1.Open;
  posisiawal;
  end;

end;

procedure TFormCatatan.b1Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;

end.
