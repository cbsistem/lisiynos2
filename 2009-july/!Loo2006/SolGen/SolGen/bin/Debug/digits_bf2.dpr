// ������� � ������ "D. �����"
// �����: ��������� �.�.
// E-mail: stden@inruscom.com
// ������� � "�������������"

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
  sum := 0; num := 1;
  for i:=1 to n do begin
    sum := (sum * 10) + 45 * num;
    num := num * 10;
  end;
  // ������ �����������
  write(sum);
end.
