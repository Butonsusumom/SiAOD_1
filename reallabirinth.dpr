program reallabirinth;

uses
  Forms,
  Maze in 'Maze.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
