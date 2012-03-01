{$APPTYPE CONSOLE}

Uses SysUtils;

{ ���������� ������ }
Function Solve(R: LongInt): LongInt;
Var
  X, Y, K: LongInt;
Begin
  K := 0;
  { ���������� ���������� ������ ������ ����� ����������� }
  X := 1; { ���������� ������������ ��� ���������� X = 1 }
  Y := R; { � Y - ����� R (������� ��, ��� ����� ������� ������) }
  for X := 1 to R do { ���� �� �������� }
  Begin
    { ���� �������� �� ������� ����������, ��������� Y }
    While Y*Y + X*X > R*R do  { R*R - ������� ������� ���������� }
      Dec(Y);
    K := K + Y; { ��������� ���������� ���������� �������� }
  End;
  Solve := K * 4; { ��������� �� ��������� ��� 1/4 ����������, �� �������� �� 4 }
End;

Const
  FileName = 'sqr';

var
  R: LongInt;
begin
  Reset(input, FileName + '.in');
  Rewrite(output, FileName + '.out');
  Read(R);
  Writeln(Solve(R));
end.
