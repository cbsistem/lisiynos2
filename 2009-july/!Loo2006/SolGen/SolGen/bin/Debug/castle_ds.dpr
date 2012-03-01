// ������� � ������ "C. ��������"
// �����: ��������� �.�.
// E-mail: stden@inruscom.com

uses SysUtils;

const n = 6;

var
  x, y : array [0..n-1] of double; // ���������� ������
  know : array [0..n-1] of boolean; // �������� ��?

procedure setCoord( index : integer; xx,yy : double );
begin
  know[index] := true;
  x[index] := xx;
  y[index] := yy;
end;

var
  i, j : longint;
  s : string; // ��������� ������ ��� ������
begin
  assign(input,'castle.in'); reset(input);
  assign(output,'castle.out'); rewrite(output);
  // ������ �������� ������
  for i:=0 to n-1 do begin
    readln( s );
    assert( s = trim(s) ); // ���������, ��� ��� �������� ������
    if s = '? ?' then
      know[i] := false
    else begin
      know[i] := true;
      x[i] := strtoint( copy( s, 1, pos(' ', s) - 1) );
      y[i] := strtoint( copy( s, pos(' ', s) + 1, maxlongint ) );
    end;
  end;
  // �������
  // ���� �������� ������, �� �������� � ��������
  for i:=0 to 3 do begin
    if know[i*2] and know[i*2+2] then
      setCoord(i*2+1, (x[i*2] + x[i*2+2]) / 2, (y[i*2] + y[i*2+2]) / 2   );
  end;
  // ������ �����������

end.
