unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  TForm1 = class(TForm)
    btnHitungNilai: TButton;
    edtNama: TEdit;
    edtNilai: TEdit;
    fMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Memo1: TMemo;
    procedure btnHitungNilaiClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Nilai: Double;
    Grade: string;
  public
    function SetGrade(ANilai: Double): string;
    function SetStatus(ANilai: Double): string;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
end;

procedure TForm1.btnHitungNilaiClick(Sender: TObject);
var
  StatusCaption: string;
begin
  Nilai := StrToFloat(edtNilai.Text);
  if Nilai > 100 then
  begin
    ShowMessage('Maaf, input nilai salah');
    edtNilai.SetFocus;
    Exit;
  end;

  Grade := SetGrade(Nilai);
  StatusCaption := SetStatus(Nilai);

  Label4.Caption := StatusCaption;
  if StatusCaption = 'Lulus' then
    Label4.Font.Color := clGreen
  else
    Label4.Font.Color := clRed;

  Label6.Caption := Grade;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
end;

function TForm1.SetGrade(ANilai: Double): string;
var
  mark: Integer;
begin
  mark := Trunc(ANilai);
  case mark of
    80..100: Result := 'A';
    70..79:  Result := 'B';
    60..69:  Result := 'C';
    50..59:  Result := 'D';
  else
    Result := 'E';
  end;
end;

function TForm1.SetStatus(ANilai: Double): string;
begin
  if ANilai >= 75 then
    Result := 'Lulus'
  else
    Result := 'Tidak Lulus';
end;

end.

