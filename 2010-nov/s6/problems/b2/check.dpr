{$I trans.inc}

uses testlib;

var 
  J, C : Longint;
begin
  J := ans.ReadLongint;
  C := ouf.ReadLongint;
  if J <> C then
    QUIT(_WA,'��� ' + IntToString(J) + ' <> ���⭨� ' + IntToString(C))
  else
    QUIT(_OK,'');
end.

