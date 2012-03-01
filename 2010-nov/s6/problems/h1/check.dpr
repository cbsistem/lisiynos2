{$I trans.inc}

uses testlib;

var
  ansWord, oufWord : String;
  i, badpos, tmp:longint;
  K : longint; { ��� ��������, ������� �������� �� ����� ���� }
  N : longint; { ����� ���������� ����� }
  W : array [1..50] of LongInt; { ���������� ����� � ������ ����� }
  R : longint; { ������ ����� � ����� ������������ }
  JuryR : longint; { ������ ���� � ����� ���� }
  K2 : longint; { ��� �� ������ ����� }
begin
  K := inf.ReadLongint;
  N := inf.ReadLongint;
  for i := low(W) to high(W) do
    W[i] := 0;
  for i := 1 to N do
    inc( W[inf.ReadLongint] );
  { ������ ���� ����� }
  JuryR := ans.ReadLongint; { ������ ����� �� ����������� ������ }
  R := ouf.ReadLongint; { ������ ����� �� ������ ��������� }
  if (JuryR = -1) or (R = -1) then
    if R <> JuryR then
      QUIT(_WA,'Jury '+IntToString(JuryR)+' user '+IntToString(R))
    else
      QUIT(_OK,'OK :)');
  { ��������� ������ ������ � K }
  if R<>0 then begin
    Dec( W[R] );
    if W[R] < 0 then
      QUIT(_WA,'Dont have with weight '+IntToString(R));
    Inc( K, R );
  end;
  { ��������� ��������� � K2 }
  while not ouf.seekeoln do begin
    R := ouf.ReadLongint;
    Dec( W[R] );
    if W[R] < 0 then QUIT(_WA,'Dont have with weight '+IntToString(R));
    Inc( K, R );
  end;
  ouf.newl(true);
  { �������� ��� �� ������ ����� }
  K2 := 0;
  while not ouf.seekeoln do begin
    R := ouf.ReadLongint;
    Dec( W[R] );
    if W[R] < 0 then QUIT(_WA,'Dont have with weight '+IntToString(R));
    Inc( K2, R );
  end;
  if K = K2 then
    QUIT(_OK,'OK :)')
  else
    QUIT(_WA,'Cup1 = '+IntToString(K)+' Cup2 = ' + IntToString(K2));
end.

