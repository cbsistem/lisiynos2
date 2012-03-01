// ������� � ������ "D. �����"
// �����: ��������� �.�.
// E-mail: stden@inruscom.com

uses SysUtils;

var
  n,i : longint;
  sum, num : int64;
begin
  assign(input,'digits.in'); reset(input);
  assign(output,'digits.out'); rewrite(output);
  // ������ �������� ������
  read(n); assert( n <= 100000 );
  // �������
  //  0
  //  1
  //  ...
  //  9
  // ����� = 45, ���������� ����� = 10
  // ������ ���������� ������� � ������� ����� �� ����� 0..9
  sum := 0; num := -1;
  for i:=1 to n do begin
    sum := sum + 45;
    inc( num );
    assert( sum < 10000000 );
  end;
  // ������ �����������
  write(sum);
  for i:=1 to num do write('0');
end.
