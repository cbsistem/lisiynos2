{$APPTYPE CONSOLE}

Uses Math;

const MaxN = 100;

var
  sum : Extended;
  N : integer; { �����୮��� ����࠭�⢠ }
  X : integer; { ������⢮ ����஢ }
  A,B : array [1..MaxN] of Extended;
  i : integer;
begin
  assign(input,'scalar.in'); reset(input);
  assign(output,'scalar.out'); rewrite(output);
  {}
  read(N);
  assert( N >= 1 );
  assert( N <= MaxN );
  { ��⠥� ���� ����� }
  for i:=1 to N do 
    read(A[i]);
  { ��⠥� ��ன ����� }
  for i:=1 to N do 
    read(B[i]);
  { ��⠥� ᪠��୮� �ந�������� }
  sum := 0;
  for i:=1 to N do 
    sum := sum + A[i]*B[i];
  { �뢮��� �⢥� }
  writeln(sum:0:3);
end.
