{$APPTYPE CONSOLE}
uses testlib,sysutils;

var 
  User, { �⢥� ���⭨�� }
  Jury : Longint; { �⢥� ��� }
begin
  User := ouf.readlongint; // �⢥� ���⭨��
  Jury := ans.readlongint; // �⢥� ���
  if User<>Jury then 
    quit(_wa,Format('���⭨� �뢥� %d, �ࠢ���� �⢥� %d',[User,Jury]));
  quit(_ok,'');
end.