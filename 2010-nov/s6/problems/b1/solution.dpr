{$APPTYPE CONSOLE}

uses SysUtils;

function NOD( a,b:int64 ):int64;
var r : integer;
begin
  while b <> 0 do begin
    r := a mod b;
    a := b;
    b := r;
  end;
  NOD := a;
end;


function NODM( a : array of int64 ):int64;
var d,i : integer;
begin
  d := a[0];
  for i:= 1 to length(a)-1 do
    d := NOD(d, a[i]);
  NODM := d;
end;
 
var 
  A : array of int64;
  N,i : integer;
begin
  assign(input,'b1.in'); reset(input);
  assign(output,'b1.out'); rewrite(output);
  { �⥭�� �室��� ������ }
  readln(N);
  SetLength(A,N);
  for i:=0 to N-1 do 
    read(A[i]);
  { ���᫥��� � ������ �⢥� }
  writeln(NodM(A)); 
end.

