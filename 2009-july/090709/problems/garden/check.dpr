{ ������ L. ������ ���� }
{ ����������� ���������. }
{$I trans.inc}

uses testlib, sysutils, Math;

const eps = 1e-5; { �������� ������ }

var R_jury, R_cont, X, Y, X0, Y0, Dist : Extended;
  N,i : Longint;
begin
  R_jury := ans.ReadReal; { ����������, ����������� ���������� ���� }
  R_cont := ouf.ReadReal; { ����������, ����������� ���������� ��������� }
  X0 := ouf.ReadReal; { X-���������� ������ ��������� }
  Y0 := ouf.ReadReal; { Y-���������� ������ ��������� }
  {}
  if (R_cont-R_jury) > eps then 
    quit(_WA, '������ ���� '+FloatToStr(R_jury)+' < '+
              '������ ��������� '+FloatToStr(R_cont)); 
  { ��������� ��� ��� ������� ����� ������ }
  N := inf.ReadIntegerRange(2,100);
  for i:=1 to N do begin
    { ������ ���������� X,Y ������ }
    X := inf.ReadReal;
    Y := inf.ReadReal;
    { ���������� �� ������ ���������� �� ����� ������ }
    Dist := Sqrt(Sqr(X-X0)+Sqr(Y-Y0));
    if (Dist - R_cont) > eps then 
      quit(_WA, '������ ��� ����� '+
        ' �� ������ = '+FloatToStr(Dist)+
        ' � ������ = '+FloatToStr(R_cont) ); 
  end;
  {}
  quit(_OK, '');
end.