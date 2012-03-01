// ������� � ������ "D. �����"
// �����: ��������� �.�.
// E-mail: stden@inruscom.com

uses SysUtils;

const
  max_n = 100000;

// ����� ���� ����� t
function sumDig( t : longint ) : longint;
begin
  result := 0;
  while t > 0 do begin
    inc( result, t mod 10 );
    t := t div 10;
  end;
end;

var
  n,i : longint;
  sum,mul : longint;
begin
  assign(input,'digits.in'); reset(input);
  assign(output,'digits.out'); rewrite(output);
  // ������ �������� ������
  read(n); assert( n <= max_n );
  // �������
  // ��������� 10^n-1
  mul := 1;
  for i:=1 to n do
    mul := mul * 10;
  mul := mul - 1;
  // ��������� ����� ����
  sum := 0;
  for i:=1 to mul do begin
    sum := sum + sumdig(i);
  end;
  // ������ �����������
  write(sum);
end.
