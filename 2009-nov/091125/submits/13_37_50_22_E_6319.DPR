{$APPTYPE CONSOLE}

uses
  SysUtils;
var j, i, n, y, u, t : longint;
s, q : string;

function f(k : longint) : longint;
var h : string;
begin
 str(k, h);
 if k = 1 then f := 1 else f := f(k - 1) + length(h);
end;



begin
 reset(input,'e.in');
 rewrite(output,'e.out');
 readln(n);
 i := 1;
 u := 0;

 while n > u do begin
  u := u + f(i);
   inc(i);
 end;

 u := f(i);

 //������ �� ���� ����� ������������������ (u) � � ���������� ����� (i). �� ��� ������?

  //for j := 1 to t do begin

 t := i;

 for i := 1 to t do begin
  str(i, q);
  s := s + q;
 end;
 //writeln(s);
 u := 0;
 for i := 1 to t - 2 do
  u := u + f(i);
 //writeln(u);
 n := n - u;

 writeln(s[n]);
end.
