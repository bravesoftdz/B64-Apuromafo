unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.NetEncoding, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Button3: TButton;
    Label1: TLabel;
    Button4: TButton;
    Image1: TImage;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

Resourcestring
  str1 = 'Base64 String Encode/decode by Apuromafo';
  str2 = '';
  str3 = 'Bienvenido Sigue las instrucciones y funcionara bien :) ';
  str4 = 'Base 64 Encoding';
  str5 = 'Base 64 Decoding';
  str6 = 'Encode b64';
  str7 = 'Decode b64';
  str8 = 'Decode ';
  str9 = 'No olvides que fue creado para decodificar base64 no texto ;) ';
  // excepcion
  str10 = 'Guardar como .b64';
  str11 = 'Decidete a cargar un archivo';
  str12 = 'File does not exist.';
  str13 = 'Abrir .b64';

  SAVED = 'encoded.b64';
  SAVETEXT = 'Guardando el b64 '; // 3
  DFilter = 'Archivo en Base64 |*.b64'; // 4
  EXT = 'b64';

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
begin
  // Memo1.Lines.BeginUpdate;
  Memo3.Lines.BeginUpdate;
  Application.ProcessMessages;
  Memo3.Text := TNetEncoding.Base64.Encode(Memo1.Text);
  Memo1.Text := Memo3.Text;
  // Memo1.Lines.EndUpdate;
  Memo3.Lines.EndUpdate;

  Label1.Visible := False;
  // Button1.Visible := False;

end;

procedure TForm1.Button2Click(Sender: TObject);

var
  hola: string;
  I: Integer;
begin
  try
    // Memo1.Lines.BeginUpdate;
    // Memo3.Lines.BeginUpdate;
    Application.ProcessMessages;
    Memo3.Text := TNetEncoding.Base64.Decode(Memo1.Text);
    Memo1.Text := Memo3.Text;
    // Memo1.Lines.EndUpdate;
    // Memo3.Lines.EndUpdate;

    Label1.Visible := True;
    Button1.Visible := True;
  except
    on E: Exception do
    begin
      // ShowMessage('Exception class name = ' + E.ClassName);
      // ShowMessage('Exception message = ' + E.Message);
      ShowMessage(str9);
    end;

  end;
end;

procedure TForm1.Button3Click(Sender: TObject);

begin
  try
    Memo3.Clear;
    // Memo1.Lines.BeginUpdate;
    // Memo3.Lines.BeginUpdate;

    Memo3.Text := TNetEncoding.Base64.Decode(Memo1.Text);
    Memo2.Text := Memo3.Text;
    // Memo1.Lines.EndUpdate;
    // Memo3.Lines.EndUpdate;
    { /*
      Edit1.Text := Memo2.Text;
      Edit1.Visible := True;
      Label1.Visible := True;
      Button1.Visible := True;
    }
  except
    on E: Exception do
    begin
      // ShowMessage('Exception class name = ' + E.ClassName);
      // ShowMessage('Exception message = ' + E.Message);
      ShowMessage(str9);
    end;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);

var
  saveDialog: tsavedialog; // Save dialog variable

begin

  begin
    // Create the save dialog object - assign to our save dialog variable
    saveDialog := tsavedialog.Create(self);
    // Give the dialog a title
    saveDialog.Title := SAVETEXT;
    // Set up the starting directory to be the current one
    saveDialog.InitialDir := GetCurrentDir;
    // Allow only .txt file types to be saved
    saveDialog.Filter := DFilter;
    // Set the default extension
    saveDialog.DefaultExt := EXT;
    // Select text files as the starting filter type
    saveDialog.FilterIndex := 1;
    // Display the open file dialog
    if saveDialog.Execute then
    begin
      // showmessage(MSGSAVED + saveDialog.FileName);
      Memo1.Lines.SaveToFile(saveDialog.FileName, Tencoding.utf8)
    end
    else
    begin
      // ShowMessage('Save file was cancelled');
      Memo1.Lines.SaveToFile(SAVED, Tencoding.utf8);
      // showmessage(dia2);
    end;
    // Free up the dialog
    saveDialog.Free;
  end;

end;

procedure TForm1.Button5Click(Sender: TObject);
var
  OpenDialog: TOpenDialog; // Save dialog variable

begin
  try
    OpenDialog := TOpenDialog.Create(self);
    // Give the dialog a title
    OpenDialog.Title := SAVETEXT;
    // Set up the starting directory to be the current one
    OpenDialog.InitialDir := GetCurrentDir;
    // Allow only .txt file types to be saved
    OpenDialog.Filter := DFilter;
    // Set the default extension
    OpenDialog.DefaultExt := EXT;
    // Select text files as the starting filter type
    OpenDialog.FilterIndex := 1;

    { Execute an open file dialog. }
    if OpenDialog.Execute then
      { First check if the file exists. }
      if FileExists(OpenDialog.FileName) then
        { If it exists, load the data into the memo box. }
        Memo1.Lines.LoadFromFile(OpenDialog.FileName, Tencoding.utf8)
  except
    on E: Exception do
    begin
      // ShowMessage('Exception class name = ' + E.ClassName);
      // ShowMessage('Exception message = ' + E.Message);
      ShowMessage(str11);
    end;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Caption := str1;
  Memo1.Text := str2;
  Memo2.Text := str2;
  Label1.Caption := str3;
  Label2.Caption := str4;
  Label3.Caption := str5;
  Button1.Caption := str6;
  Button2.Caption := str7;
  Button3.Caption := str8;
  Button4.Caption := str10;
  Button5.Caption := str13;
  Memo1.Clear;
end;

end.
