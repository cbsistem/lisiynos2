{ �ணࠬ�� ���஢���� ����� "�����㣮�쭨�" }
{ (c) 1996 ��⮭ ���㭮� }
uses TESTLIB, symbols;

var s,t : string;

begin
  s := Compress(ans.ReadString);
  t := Compress(ouf.ReadString);

  if s <> t then QUIT(_WA, '��������� ' + s + ', � �� ' + t);
  QUIT(_OK, '');
end.