{$I trans.inc}
program macro;
uses testlib;
var jury, cont, count:longint;
begin
  count:=0;
  while not ans.seekeof do
    begin
      if ouf.seekeof then quit (_Wa, '���������� ����� 䠩�� ���⭨��');
      ans.sp;
      jury:=ans.getlong;
      cont:=ouf.getlong;
      inc (count);
      if jury<>cont then quit (_wa, '�訡�� � �᫥ #'+i2s (count)+' (������ � 䠩�� ��� '+
        ans.spp +') �ॡ������� '+i2s (jury)+', � ����祭� '+i2s (cont));
    end;
  if not ouf.seekeof then quit (_wa, '����� ���ଠ�� � �⢥� ���⭨��');
  quit (_ok, '');
end.