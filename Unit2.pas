unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Soap.EncdDecd, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}


procedure TForm1.Edit1Change(Sender: TObject);
begin
  Edit2.Text := TNetEncoding.Base64.Encode(Edit1.Text);
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  Edit3.Text := TNetEncoding.Base64.Decode( Edit2.Text );
end;

end.
