{$I trans.inc}
uses testlib, sysutils;
var jury, cont:string;
    count:integer;
begin
  count:=0;
  while not ans.seekeof do begin
    if ouf.seekeof then quit (_Wa, '���������� ����� 䠩�� ���⭨��');
    ans.sp;
    jury:=StripSpaces (UpperCase (ans.readstring));
    cont:=StripSpaces (UpperCase (ouf.readstring));
    inc (count);
    if (jury<>'NO') and (jury<>'YES') then quit (_Fail, 
      '�訡�� � �⢥� ��� #'+i2s (count)+' (������ � 䠩�� ��� '+
        ans.spp +') ' +
    'YES or NO required');
    if (cont<>'NO') and (cont<>'YES') then quit (_PE, 
      '�訡�� � �⢥� #'+i2s (count)+' (������ � 䠩�� ��� '+
        ans.spp +') ' +
    'YES or NO required');
    if jury<>cont then 
      quit (_WA, 
      '�訡�� � �⢥� #'+i2s (count)+' (������ � 䠩�� ��� '+
        ans.spp +') ' +
      'Jury: '+jury+', Contestant: '+cont);
  end;
  quit (_OK, '');
end.