{$APPTYPE CONSOLE}

uses SysUtils;

var
  X,Y : array [1..12] of extended;

function dist( F,T : integer ):extended;
begin
  dist := sqrt( sqr(X[F]-X[T]) + sqr(Y[F]-Y[T]));
end;

var
  N,M,i,j,F,T,k : integer;
  A : array [1..12,1..12] of extended;
  ForestSpeed,FieldSpeed : extended;
  Typ : string;
begin
  Reset(Input,'flame.in');
  Rewrite(Output,'flame.out');
  { �������� ��������������� ���� �� ���� � �� ���� }
  Read(ForestSpeed,FieldSpeed);
  { ���������� ����������� ����� (N) � ���������� ������ ����� ������������ ������� (M) }
  Readln(N,M);
  assert( (1 < N) and (N < 10) );
  assert( (1 < M) and (M < 100) );
  { ���������� ����� }
  for i:=1 to N do
    readln(X[i],Y[i]);
  { ��������� ������� ��� ��������� ������ }
  for i:=1 to N do
    for j:=1 to N do
      A[i,j] := 1e11;
  { ��� ���������� }
  for i:=1 to M do begin
    readln(F,T,Typ);
    inc(F); inc(T);
    Typ := trim(Typ);
    assert( (Typ = 'FOREST') or (Typ = 'FIELD') );
    if Typ = 'FOREST' then
      A[F,T] := dist(f,t) / ForestSpeed;
    if Typ = 'FIELD' then
      A[F,T] := dist(f,t) / FieldSpeed;
    A[T,F] := A[F,T];
  end;
  { �������� ������ }
  for k := 1 to N do
    for i := 1 to N do
      for j := 1 to N do
        if A[i,k]+A[k,j] < A[i,j] then
          A[i,j] := A[i,k]+A[k,j];
  { ������� }
    for i := 1 to N do begin
      for j := 1 to N do 
        write(A[i,j]:15:2);
      writeln;
    end;

  { ����� ������ }
  writeln(A[1,2]:0:2);
end.
