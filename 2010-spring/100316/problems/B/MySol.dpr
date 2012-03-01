program MySol;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  Task = 'b';
  MaxN = 100;
  NumLang = 50;

var
  N : integer; { ���������� ����� }
  Lang : array [1..MaxN,1..NumLang] of Boolean;
  Answer : integer;

{ ������� ���������� �������, �� ������� ����� ������
 �������� ������������� �������
 (������� ������ ������������). }
procedure Calc;
var
  Understand : array [1..MaxN,1..MaxN] of Boolean;
  Doshla : array [1..MaxN] of Boolean;
  i,j : integer;
  L : integer;
  Changes : boolean;
begin
  { ������� ����� ������ �� �������� }
  for i := 1 to N do
    for j := 1 to N do
      Understand[i,j] := false;
  { �������� ��� ���� ����� ������ }
  { ��������� ��� ����� � �������� �����, ������� �����
    ���� ����� ������ �� ����� L }
  for L := 1 to 50 do
    for i := 1 to N do
      for j := 1 to N do
        { ���� ��� ����� ���� L }
        if Lang[i,L] and Lang[j,L] then begin
          { �� ��� ���� ����� ������ }
          Understand[i,j] := true;
          Understand[j,i] := true;
        end;
  { = ���������� �� ���� ����� ������� = }
  { ������� �������, ��� ������� ������������ ������� ������ ��� }
  Doshla[1] := true;
  for i := 2 to N do
    Doshla[i] := false;
  repeat
    Changes := false;
    { �������, ��� ��� ����� ������ ���,
      �� ���� ��� ����� ������� }
    for i:=1 to N do
      { ���� �� i-��� ����� }
      if Doshla[i] then
        for j := 1 to N do
          { � ��� �������� j-��, �� �������� ��� �� ����� }
          if Understand[i,j] and not Doshla[j] then begin
            { ����� �� j-��� ������� ���� ����� }
            Doshla[j] := true;
            Changes := true;
          end;
  until not Changes;
  { ������� ���������� �������� }
  Answer := 0;
  for i := 1 to N do
    if Doshla[i] then
      inc( Answer );
end;

procedure ReadData;
var
  i,Mi,j,L: Integer;
begin
  Reset(input,Task+'.in');
  { ���������� ����� N (1<=N<=100) }
  Read(N);
  assert( (1 <= N) and (N <= 100) );
  { �������� ����, ����� ����� ����� ��� ���� }
  for i := 1 to N do begin
    { ����� Mi (0<=Mi<=50), ������������ ���������� ������ }
    Read(Mi);
    assert( (0 <= Mi) and (Mi <= 50) );
    { ������� ������ � �������, ������� ����� ���� ������� }
    { ������� �������, ��� ������� �� ����� ������� ������ }
    for j := 1 to NumLang do
      Lang[i,j] := false;
    { �������� �� �����, ������� ������� ����� }
    { �� ������� ����� ������ ����� ���� ������ � }
    {  ������������ ������� }
    for j:=1 to Mi do begin
      Read(L);
      { ������� i ����� ���� L }
      Lang[i,L] := true;
    end;
  end;
end;

procedure WriteAnswer;
begin
  Rewrite(output,Task+'.out');
  Writeln(Answer);
end;

begin
  try
    ReadData;
    Calc;
    WriteAnswer;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
