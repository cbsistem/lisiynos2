Uses TestLib;
 Var lf, rg: LongInt;

BEGIN
  lf:=ouf.ReadLongInt;
  rg:=ans.ReadLongInt;
  If lf=rg Then QUIT(_ok, '') Else
   If lf<rg Then QUIT(_wa, '�뤠�� �����') Else QUIT(_wa, '�뤠�� �����');
END.