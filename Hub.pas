unit Hub;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, ZAbstractConnection, ZConnection, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls, Grids, DBGrids;

type
  TFormHub = class(TForm)
    lblsiswaid: TLabel;
    lblortuid: TLabel;
    lblstatushubanak: TLabel;
    lbljk: TLabel;
    lblket: TLabel;
    bbaru: TButton;
    bsimpan: TButton;
    bhapus: TButton;
    bbatal: TButton;
    dbgrd1: TDBGrid;
    Edtket: TEdit;
    cbbsiswaid: TComboBox;
    cbbortuid: TComboBox;
    b1: TButton;
    cbbstatus: TComboBox;
    ZQuery1: TZQuery;
    ds1: TDataSource;
    ZConnection1: TZConnection;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    bedit: TButton;
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
  FormHub: TFormHub;
  id:string;

implementation

{$R *.dfm}

procedure TFormHub.edtbersih;
begin
Edtket.Clear;
end;

procedure TFormHub.edtenable;
begin
cbbsiswaid.Enabled:= True;
cbbortuid.Enabled:= True;
cbbstatus.Enabled:= True;
Edtket.Enabled:= True;
end;

procedure TFormHub.posisiawal;
begin
edtbersih;
cbbsiswaid.Enabled:= False;
cbbortuid.Enabled:= False;
cbbstatus.Enabled:= False;
Edtket.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;
end;

procedure TFormHub.FormShow(Sender: TObject);
begin
  posisiawal;

  cbbsiswaid.Items.Clear;
  cbbortuid.Items.Clear;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('SELECT siswa_id FROM hub');
  ZQuery1.Open;

  while not ZQuery1.Eof do
  begin
    cbbsiswaid.Items.Add(ZQuery1.FieldByName('siswa_id').AsString);
    ZQuery1.Next;
  end;

  ZQuery1.Close;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('SELECT ortu_id FROM hub');
  ZQuery1.Open;

  while not ZQuery1.Eof do
  begin
    cbbortuid.Items.Add(ZQuery1.FieldByName('ortu_id').AsString);
    ZQuery1.Next;
  end;

  dbgrd1.DataSource := ds1;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from hub');
  ZQuery1.Open;

end;

procedure TFormHub.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormHub.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormHub.bsimpanClick(Sender: TObject);
begin
if (Edtket.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  begin
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('insert into hub values (null,"'+cbbsiswaid.Text+'","'+cbbortuid.Text+'","'+cbbstatus.Text+'","'+Edtket.Text+'")');
  ZQuery1.ExecSQL;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from hub');
  ZQuery1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormHub.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

cbbsiswaid.Text:= ZQuery1.FieldList[1].AsString;
cbbortuid.Text:= ZQuery1.FieldList[2].AsString;
cbbstatus.Text:= ZQuery1.FieldList[3].AsString;
Edtket.Text:= ZQuery1.FieldList[4].AsString;
end;

procedure TFormHub.bhapusClick(Sender: TObject);
begin
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add(' delete from hub where id="'+id+'"');
ZQuery1.ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from hub');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;
end;
end;

procedure TFormHub.beditClick(Sender: TObject);
begin
  if (Edtket.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  if (cbbsiswaid.Text = ZQuery1.FieldList[1].AsString) and (cbbortuid.Text = ZQuery1.FieldList[2].AsString) and (cbbstatus.Text = ZQuery1.FieldList[3].AsString) and (Edtket.Text = ZQuery1.FieldList[4].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('Update hub set siswa_id="'+cbbsiswaid.Text+'", ortu_id="'+cbbortuid.Text+'", status_hub_anak="'+cbbstatus.Text+'", ket="'+Edtket.Text+'" where id="'+id+'"');
  ZQuery1.ExecSQL;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from hub');
  ZQuery1.Open;
  posisiawal;
  end;

end;

procedure TFormHub.b1Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;

end.
