unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,strUtils;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}


procedure Shuffle(var a:array of integer);
var i,i1,i2:integer;
    temp:integer;
begin
  for i:=0 to length(a)*10 do
    begin
      repeat
        i1:=random(length(a));
        i2:=random(length(a));
      until (i1 <> i2);

        temp:=a[i1];
        a[i1]:=a[i2];
        a[i2]:=temp;
    end;
end;

procedure BubblesortIntArrAsc(var a:array of integer);  //from Low to High values
var
  i,j:integer;
  temp:integer;
begin
  for i:=low(a) to high(a) do
    for j:=low(a) to high(a)-1 do
      begin
        if (a[j] > a[j+1]) then
        begin //swap 2 integers in the array
          temp:=a[j];
          a[j]:=a[j+1];
          a[j+1]:=temp;
        end;
      end;
end;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var i,j,k,m,n:integer;
    a:array of integer;
    s:string;
    e:array of array of integer;
begin
  memo1.text := '';

  setlength(a,35);

  for i:=0 to 34 do
  begin
     a[i] := i+1;
  end;

  shuffle(a);


   //assign 1D vector to 2D array here
  setlength(e,1);
  m:=0; n:=0;

  for i:=0 to 6 do // 7 lines in all
  begin
    setlength(e[i],1);
    k:=0;

    for j:=0 to 4 do   // 5 numbers per line
    begin
       e[i,j]:=a[n];
       inc(n);

       inc(k);
       setlength(e[i],k+1);
    end;

    inc(m);
    setlength(e,m+1);
  end;

  //reset lengths here
  setlength(e,m);
  // &...
  for i:=0 to length(e)-1 do
      setlength(e[i],k);

  for i:=0 to length(e)-1 do
      bubblesortintarrasc(e[i]);   //sort each number line


  //display them unique number combos on screen
  s:='';

  for i:=0 to length(e)-1 do
  begin
    s:=s+inttostr(i+1)+'. ';

    for j:=0 to length(e[i])-1 do
    begin
       s:=s+ ifthen(e[i,j]<10, '0'+inttostr(e[i,j]), inttostr(e[i,j])) + ',';
    end;

    delete(s,length(s),1);
    s:=s+'.'+#13#10;
  end;


  memo1.text:=s;  //display the string

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;   //once in the program is enough!

end;

end.

