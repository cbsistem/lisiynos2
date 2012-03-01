{ ������� ������ "������" }
{$APPTYPE CONSOLE}
{$R+}

const
  maxM = 100;

var
  domino: array [0 .. maxM, 0 .. maxM] of Boolean; { ���� �� ��������? }
  power: array [0 .. maxM] of integer; { ������� ������� }
  comp: array [0 .. maxM] of integer; { ���������� ��������� ������� }
  numodd: array [1 .. maxM + 1] of integer;
  { ���������� �������� ������ � ���������� ��������� }
  N, M: integer;
  curcomp: integer;

procedure DFS(what: integer);
var
  i: integer;
begin
  comp[what] := curcomp;
  for i := 0 to M do
    if domino[what, i] and (comp[i] = 0) then
      DFS(i);
end;

var
  i, j: integer;
  a, b: integer;
  result: integer;

begin
  { ���� �������� ������ }
  Reset(Input, 'domino.in');
  Read(M); { ������������ ���������� ����� }
  assert((0 <= M) and (M <= 100));
  for i := 0 to M do
    for j := 0 to M do
      domino[i, j] := true;

  Read(N); { ���������� ����������� }
  for i := 1 to N do begin
    readln(a, b);
    domino[a, b] := false;
    domino[b, a] := false;
  end;

  { ������� ������� ������ }
  for i := 0 to M do
    power[i] := 0;
  for i := 0 to M do
    for j := i to M do
      if domino[i, j] then begin
        inc(power[i]);
        inc(power[j]);
      end;

  { ������������ ���� �� ���������� ��������� }
  for i := 0 to M do
    { ��������� ������������� ������� }
    if power[i] = 0 then
      comp[i] := maxint
    else if comp[i] = 0 then begin
      inc(curcomp);
      DFS(i);
    end;

  { ������� ���������� �������� ������ (�� ����������� ���������) }
  for i := 0 to M do
    if odd(power[i]) then
      inc(numodd[comp[i]]);

  { ��������� ��������� }
  for i := 1 to curcomp do
    if numodd[i] = 0 then
      { ���� �������� ������ ��� - ������� ���������� ��������� �� 1 ��� }
      result := result + 1
    else { ����� - �� ���������� ��� �������� ������ }
      result := result + numodd[i] div 2;

  { ������� ����� }
  Rewrite(Output, 'domino.out');
  Writeln(result);
end.
