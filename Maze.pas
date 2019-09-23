unit Maze;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sSkinManager, StdCtrls, sButton, sLabel, sRadioButton,
  Buttons, sSpeedButton, jpeg;

type
  TForm1 = class(TForm)
    pb1: TPaintBox;
    sknmngr1: TsSkinManager;
    imeTimer1: TTimer;
    Know1: TsLabel;
    Button2: TsButton;
    Button3: TsButton;
    Button4: TsButton;
    pb2: TPaintBox;
    pb3: TPaintBox;
    pb4: TPaintBox;
    pb5: TPaintBox;
    congr: TsLabel;
    fl1: TsLabel;
    fl2: TsLabel;
    fl3: TsLabel;
    pb6: TPaintBox;
    img1: TImage;
    btn1: TsSpeedButton;
    btn2: TsSpeedButton;
    procedure pb1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imeTimer1Timer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure pb4Paint(Sender: TObject);
    procedure pb5Paint(Sender: TObject);
    procedure pb3Paint(Sender: TObject);
    procedure pb2Paint(Sender: TObject);
    procedure pb6Paint(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
type
 TMAS=array[0..20] of array[0..20] of Integer;

implementation

{$R *.dfm}

var A:TMAS=(
  (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
  (2,2,2,2,2,2,1,2,2,2,1,2,2,2,2,2,2,2,1,0,1),
  (1,1,1,1,1,2,1,2,1,2,1,2,1,1,1,1,1,2,1,0,1),
  (1,0,0,0,0,2,1,2,1,2,2,2,1,2,2,2,2,2,1,0,1),
  (1,1,1,1,1,2,1,2,1,1,1,1,1,2,1,1,1,1,1,0,1),
  (1,0,0,0,1,2,2,2,0,0,0,0,1,2,2,2,2,2,2,2,1),
  (1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,2,1),
  (1,0,1,0,1,0,1,0,0,0,1,0,0,2,2,2,1,0,1,2,1),
  (1,0,1,1,1,0,1,0,1,0,1,0,1,2,1,2,1,1,1,2,1),
  (1,0,0,0,0,0,1,0,1,0,0,0,1,2,1,2,2,2,2,2,1),
  (1,0,1,1,1,1,1,0,1,1,1,1,1,2,1,1,1,1,1,1,1),
  (1,0,1,0,0,0,1,1,1,0,0,0,0,2,2,2,2,2,0,0,1),
  (1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,2,1,1,1),
  (1,0,0,0,1,0,1,0,1,0,1,2,2,2,2,2,1,2,2,2,1),
  (1,1,1,1,1,0,1,0,1,0,1,2,1,1,1,2,1,1,1,2,1),
  (1,0,0,0,0,0,1,0,0,0,1,2,2,2,1,2,2,2,2,2,1),
  (1,0,1,1,1,1,1,1,1,1,1,1,1,2,1,0,1,1,1,1,1),
  (1,0,0,0,0,0,0,0,0,0,0,0,1,2,1,0,0,0,0,0,1),
  (1,1,1,0,1,1,1,1,1,1,1,0,1,2,1,1,1,1,1,0,1),
  (1,0,0,0,0,0,0,0,0,0,1,0,1,2,2,2,2,2,1,0,1),
  (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1));

  B:TMAS=(
  (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
  (2,2,2,1,0,0,0,0,1,0,1,0,1,0,1,1,2,2,2,0,1),
  (1,1,2,1,0,1,0,2,2,2,1,0,1,2,2,2,2,1,2,0,1),
  (1,0,2,1,0,1,1,2,1,2,2,2,2,2,1,1,1,1,2,1,1),
  (1,0,2,2,2,2,2,2,1,0,1,0,1,0,0,1,2,2,2,0,1),
  (1,0,1,0,1,0,1,1,1,0,1,1,1,1,1,1,2,1,0,0,1),
  (1,0,1,1,1,0,1,0,0,0,1,0,0,0,0,1,2,1,1,1,1),
  (1,0,0,0,0,0,1,0,1,1,1,0,1,0,0,0,2,2,2,2,1),
  (1,0,1,1,1,1,1,0,1,0,0,0,1,1,1,1,0,0,1,2,1),
  (1,0,1,0,0,0,1,0,1,0,1,1,1,1,0,1,1,1,1,2,1),
  (1,0,0,0,0,0,0,0,1,1,1,0,0,1,2,2,2,0,1,2,1),
  (1,1,1,1,0,1,1,0,1,0,1,1,0,1,2,1,2,1,1,2,1),
  (1,0,1,1,0,1,0,0,1,0,1,2,2,2,2,1,2,2,2,2,1),
  (1,0,0,1,0,1,1,1,1,0,0,2,1,1,1,1,1,1,1,1,1),
  (1,1,0,0,0,0,0,1,1,1,1,2,1,0,1,1,0,1,0,0,1),
  (1,1,0,1,1,1,0,0,0,0,1,2,2,2,2,2,2,2,2,1,1),
  (1,0,0,0,0,1,0,0,1,1,1,0,1,1,0,1,1,1,2,0,1),
  (1,1,1,1,0,1,0,0,1,0,0,0,0,1,0,1,2,2,2,0,1),
  (1,0,0,0,0,1,1,0,1,0,1,0,1,1,0,1,2,1,1,1,1),
  (1,0,1,1,0,0,0,0,1,0,1,0,1,0,0,1,2,2,0,0,1),
  (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1));



  C:TMAS=(
  (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),
  (2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,0,0,1),
  (1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,2,1,1,0,1),
  (1,0,1,0,0,0,0,0,0,0,0,0,1,0,2,2,2,0,1,0,1),
  (1,0,0,0,1,1,1,1,1,1,1,1,1,1,2,1,1,0,1,0,1),
  (1,0,1,1,1,0,1,0,1,1,0,0,0,2,2,1,1,1,1,0,1),
  (1,0,1,0,0,0,1,0,0,1,0,1,1,2,1,0,1,0,1,0,1),
  (1,0,1,0,1,0,1,0,0,1,0,0,1,2,1,0,0,0,1,0,1),
  (1,0,1,0,1,0,1,0,1,1,1,0,1,2,1,0,1,0,1,0,1),
  (1,0,1,0,1,1,1,0,1,0,0,0,1,2,1,0,1,0,1,1,1),
  (1,0,1,0,0,2,2,2,1,0,1,0,1,2,1,0,1,0,1,0,1),
  (1,0,1,0,1,2,1,2,2,2,2,2,2,2,0,0,1,0,1,0,1),
  (1,1,1,0,1,2,1,0,1,1,1,1,1,1,1,1,1,0,1,0,1),
  (1,0,1,1,1,2,1,0,1,0,0,0,0,0,1,0,1,0,1,0,1),
  (1,0,1,2,2,2,1,1,1,1,0,1,1,0,1,0,0,0,0,0,1),
  (1,2,2,2,1,0,1,0,0,0,0,0,1,0,0,0,1,0,1,0,1),
  (1,2,1,0,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,0,1),
  (1,2,1,0,1,0,0,0,0,0,1,0,0,1,0,2,2,2,1,0,1),
  (1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,2,1,0,1),
  (1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1,2,1,0,1),
  (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1));

N,M:TMAS;

  k,x,y:integer;
  check:boolean;
  f:integer;

procedure TForm1.pb1Paint(Sender: TObject);
var
r:TRect;
i,j:integer;


begin
//while k<0 do
//begin



      begin
        btn1.Visible:=True;
        btn2.Visible:=True;

        //r:=Rect(0,0,pb1.width, pb1.height);
        pb1.canvas.brush.color:=clWhite;
        pb1.canvas.brush.style:=bsSolid;
        pb1.canvas.brush.color := clred;
        for i:=0 to 20 do
          begin

          //pb1.canvas.brush.color := clyellow;
           for j:=0 to 20 do
           begin
               r:=Rect(j*26, i*26, (j+1)*26, (i+1)*26);
               if A[i,j] = 0 then
                begin
                  pb1.canvas.brush.color := clred;
                end
               else
               if (A[i,j]=2) or (A[i,j]=3) then
                 begin
                  //pb1.canvas.brush.color := clRed;

                 end
               else

              // pb1.canvas.brush.color := clgray;
               pb1.canvas.fillrect(R);
              //pb1.canvas.fillrect(R);
           end;
          end;
      end;


  //end;
   //Dec(k);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
sknmngr1.SkinDirectory:=extractfilepath(application.ExeName);
sknmngr1.SkinName:='TV-b';
sknmngr1.Active:=true;

end;

procedure TForm1.imeTimer1Timer(Sender: TObject);
var i,j:integer;
r:TRect;

begin
with canvas do
begin
 Repaint;
 DoubleBuffered:=True;
 case k of
 1:
  begin
 pb1.Visible:=True;
 fl1.Visible:=True;
 end;
 2: begin
 pb2.Visible:=True;
 fl2.Visible:=True;
 end;
 3:begin
 pb3.Visible:=True;
 fl3.Visible:=True;
 end;
 end;
 if (k=1) or (k=2) or (k=3) then
  begin
       brush.color := clSkyBlue;
       ellipse((x)*26+24,y*26+8,(x+1)*26+24,(y+1)*26+8);
       brush.color := clSkyBlue;
  end;
   if (x=17) and (y=20) then
     begin
       if k>=1 then
        begin
          case k of
           1:
             begin
               pb1.Visible:=false;
               pb4.Visible:=false;
               fl1.Visible:=false;
               f:=k-1;
               k:=0;
             end;
           2:
             begin
               pb2.Visible:=false;
               pb5.Visible:=false;
               fl2.Visible:=false;
               f:=k-1;
               k:=0
             end;
           3:
             begin
               pb3.Visible:=false;
               pb6.Visible:=false;
               fl3.Visible:=false;
               f:=k-1;
               k:=0;
             end;
           end;
           if f>0 then
           begin
           k:=f;
           x:=0;
           y:=1;
           end
           else begin
             btn1.Visible:=False;
             btn2.Visible:=False;
            congr.Visible:=True;
            with timage(img1) do sendtoback;
            img1.Visible:=True;
           end;
        end;
     end;
end;


  //end;
   //Dec(k);




end;


procedure TForm1.pb5Paint(Sender: TObject);
var i,j:Integer;
r:TRect;
begin
   begin
        pb5.canvas.brush.color:=clWhite;
        pb5.canvas.brush.style:=bsSolid;
        pb5.canvas.brush.color := clmaroon;
        for i:=0 to 20 do
          begin

          //pb1.canvas.brush.color := clyellow;
          for j:=0 to 20 do
           begin
            r:=Rect(j*26, i*26, (j+1)*26, (i+1)*26);
            if B[i,j] <> 2 then
            begin

             pb5.canvas.brush.color := clmaroon;
             end

           else

            // pb1.canvas.brush.color := clgray;
             pb5.canvas.fillrect(R);
            //pb1.canvas.fillrect(R);
           end;
           end;
           end;
end;


procedure TForm1.pb3Paint(Sender: TObject);
var i,j:Integer;
r:TRect;
begin
 begin
               btn1.Visible:=True;
               btn2.Visible:=True;
        //r:=Rect(0,0,pb1.width, pb1.height);
        pb3.canvas.brush.color:=clWhite;
        pb3.canvas.brush.style:=bsSolid;
        pb3.canvas.brush.color := clgreen;
        for i:=0 to 20 do
          begin

          //pb1.canvas.brush.color := clyellow;
           for j:=0 to 20 do
           begin
               r:=Rect(j*26, i*26, (j+1)*26, (i+1)*26);
               if C[i,j] = 0 then
                begin
                  pb3.canvas.brush.color := clgreen;
                end
               else
               if (C[i,j]=2) or (C[i,j]=3) then
                 begin
                  //pb1.canvas.brush.color := clRed;

                 end
               else

              // pb1.canvas.brush.color := clgray;
               pb3.canvas.fillrect(R);
              //pb1.canvas.fillrect(R);
           end;
          end;



       end;
end;

procedure TForm1.pb2Paint(Sender: TObject);
var i,j:Integer;
r:TRect;
begin
 begin
               btn1.Visible:=True;
               btn2.Visible:=True;
        //r:=Rect(0,0,pb1.width, pb1.height);
        pb2.canvas.brush.color:=clWhite;
        pb2.canvas.brush.style:=bsSolid;
        pb2.canvas.brush.color := clsilver;
        for i:=0 to 20 do
          begin

          //pb1.canvas.brush.color := clyellow;
           for j:=0 to 20 do
           begin
               r:=Rect(j*26, i*26, (j+1)*26, (i+1)*26);
               if B[i,j] = 0 then
                begin
                  pb2.canvas.brush.color := clsilver;
                end
               else
               if (B[i,j]=2) or (B[i,j]=3) then
                 begin
                  //pb1.canvas.brush.color := clRed;

                 end
               else

              // pb1.canvas.brush.color := clgray;
               pb2.canvas.fillrect(R);
              //pb1.canvas.fillrect(R);
           end;
          end;

       end;
end;

procedure TForm1.pb6Paint(Sender: TObject);
var i,j:Integer;
r:TRect;
begin
  begin
        pb6.canvas.brush.color:=clWhite;
        pb6.canvas.brush.style:=bsSolid;
        pb6.canvas.brush.color := clmaroon;
        for i:=0 to 20 do
          begin

          //pb1.canvas.brush.color := clyellow;
          for j:=0 to 20 do
           begin
            r:=Rect(j*26, i*26, (j+1)*26, (i+1)*26);
            if C[i,j] <> 2 then
            begin

             pb6.canvas.brush.color := clmaroon;
             end

           else

            // pb1.canvas.brush.color := clgray;
             pb6.canvas.fillrect(R);
            //pb1.canvas.fillrect(R);
           end;
           end;
           end;
end;











procedure TForm1.Button4Click(Sender: TObject);
begin
 k:=3;
 Button4.Visible:=False;
 Button2.Visible:=False;
 Button3.Visible:=False;
 Know1.Visible:=False;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 k:=2;
 Button4.Visible:=False;
 Button2.Visible:=False;
 Button3.Visible:=False;
 Know1.Visible:=False;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 k:=1;
 Button4.Visible:=False;
 Button2.Visible:=False;
 Button3.Visible:=False;
 Know1.Visible:=False;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case K of
  1: M:=A;
  2: M:=B;
  3: M:=C;
  end;
  if (Key = VK_RIGHT) then
  begin
    if (M[y,x+1]<>1) and (x>=0) and (y>=0) and (x<=19) and (y<=19) then
    inc(x);
  end;
  if (Key = VK_LEFT) then
  begin
     if (M[y,x-1]<>1) and (x>=0) and (y>=0) and (x<=19) and (y<=19) then
    dec(x);
  end;
  if (Key = VK_UP) then
  begin
     if (M[y-1,x]<>1) and (x>=0) and (y>=0) and (x<=19) and (y<=19) then
    dec(y);
  end;
  if (Key = VK_DOWN) then
  begin
     if (M[y+1,x]<>1) and (x>=0) and (y>=0) and (x<=19) and (y<=19) then
    inc(y);
  end;
  if (x=4) and (y=18) then Dec(k);
end;




procedure TForm1.FormActivate(Sender: TObject);
begin
   x:=0;
  y:=1;
imeTimer1.Interval:=80;
end;


procedure TForm1.pb4Paint(Sender: TObject);
var i,j:Integer;
r:TRect;
begin

      begin
        
        pb4.canvas.brush.color:=clWhite;
        pb4.canvas.brush.style:=bsSolid;
        pb4.canvas.brush.color := clgreen;
        for i:=0 to 20 do
          begin

          //pb1.canvas.brush.color := clyellow;
          for j:=0 to 20 do
           begin
            r:=Rect(j*26, i*26, (j+1)*26, (i+1)*26);
            if A[i,j] <> 2 then
            begin

             pb4.canvas.brush.color := clgreen;
             end

           else

            // pb1.canvas.brush.color := clgray;
             pb4.canvas.fillrect(R);
            //pb1.canvas.fillrect(R);
           end;
           end;
           end;
           end;









procedure TForm1.btn1Click(Sender: TObject);
begin
   case k of
   1: pb4.Visible:=true;
   2: pb5.Visible:=true;
   3: pb6.Visible:=true;
   end;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
   pb4.Visible:=false;
   pb5.Visible:=false;
   pb6.Visible:=false;
end;

end.
