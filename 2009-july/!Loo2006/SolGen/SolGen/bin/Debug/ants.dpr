// ������� � ������ "A. ������� �� ���������� �����"
// �����: ��������� �.�.
// E-mail: stden@inruscom.com

uses SysUtils;

// ����������� �� ������� ������
const
  max_n = 100000;
  max_m = 15000;

var
  n : longint; // ���������� �������� �� �����
  m : longint; // ����� ������� �������
  x, y : longint; // ���������� �������
  ns_cnt : longint; // ���������� ��������� � ������ �� ��
  we_cnt : longint; // ���������� ��������� � ������ �� ������
  ns : array [1..max_m] of boolean; // ������ �� ������?
  we : array [1..max_m] of boolean; // ������ �� ������?
  _type : char; // ����������� �������� �������
  temp : char; // ��������� ���������� ��� ������ �� �����
  i, j : longint;
begin
  assign(input,'ants.in'); reset(input);
  assign(output,'ants.out'); rewrite(output);
  // ������ �������� ������
  readln( n, m );
  assert( (1 <= n) and (n <= max_n) );
  assert( (1 <= m) and (m <= max_m) );
  fillchar( ns, sizeof(ns), false );
  fillchar( we, sizeof(we), false );
  for i:=1 to n do begin
    readln( x, y, temp, _type );
    assert( _type in ['N','S','W','E'] );
    // ����������, ����� ������ �� ���� "��������" ���������
    if _type in ['N','S'] then ns[x] := true;
    if _type in ['W','E'] then we[y] := true;
    // ������� � ���� ����� ������� ���, ��� ��� � �� ���� ��� ������������� ��� X � Y
    // ��������, ������ ���� ���������� ����� ����� �������� ���:
//    if _type in ['N','S'] then ns[y] := true;  // ����������������, ���� ����� :)
//    if _type in ['W','E'] then we[x] := true;
  end;
  // �������
  ns_cnt := 0;  
  we_cnt := 0;
  for i:=1 to m do
    if not ns[i] then
      inc( ns_cnt );
  for i:=1 to m do
    if not we[i] then
      inc( we_cnt );
  // ������ �����������
  write( ns_cnt * we_cnt * 2 + // ������� � ������ �����
         (ns_cnt + we_cnt) * m * 2 // ������� �����
       );
end.
