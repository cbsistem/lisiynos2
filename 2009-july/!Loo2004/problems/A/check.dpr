{$APPTYPE CONSOLE}

Uses TestLib,SysUtils;

Const MaxA = 10000;

var
  maxLen,UserMaxLen,N,A,i : Longint;
  Prev,Prev2 : Longint;
  C : array [1..MaxA] of Longint;
begin
  { ������ ����� ���������� ������������ ������������������ }
  { � ����� ��������� ������������������ }
  MaxLen := ans.readLongint;
  UserMaxLen := ouf.readLongint;
  if MaxLen > UserMaxLen then
    Quit(_WA,' MaxLen='+IntToStr(MaxLen)+' > UserMaxLen='+IntToStr(UserMaxLen));
  { ������ ������� ����� }
  N := inf.readLongint;
  fillChar(A,sizeOf(A),0);
  for i:=1 to N do begin
    A := inf.readLongint;
    assert( (1<=A) and (A<=MaxA) );
    inc(C[A]);
  end;
  { ��������� ��������� ������������������ � ��������� �� ������������ ������� }
  Prev  := -1;
  Prev2 := -1;
  for i:=1 to UserMaxLen do begin
    A := ouf.readLongint;
    if ((A<1) or (A>MaxA)) then
      Quit(_WA,' Impossible number = '+IntToStr(A));
    Dec(C[A]);
    if C[A] < 0 then
      Quit(_WA,' �� �������� ����� '+IntToStr(A)+' � �������� ������������������!');
    if ((Prev2<>-1) and (Prev<>-1)) then
      if ((Prev-Prev2) <> (A-Prev)) then
        Quit(_WA,' ����� '+IntToStr(Prev2)+','+IntToStr(Prev2)+','+
          IntToStr(A)+' �� �������� ����������!');
    Prev2 := Prev;
    Prev  := A;
  end;
  assert( UserMaxLen = MaxLen );
  Quit(_OK,'OK');
end.
