(*
 ������� 4-�� ��� ��� ����� "���".
 ��⮭ �������, 2002 ���.
*)

Type
  String6 = String[6];

Var
  S : String6;

{�ਡ����� ������� � S. �����頥� True, �᫨ ��� ��९�������, � False
� ��⨢��� ��砥}
function AddOne(var S : String6) : Boolean;
Var
  i : integer;
Begin
  AddOne := False; if S = 'TTTTTT' then Exit;

  AddOne := True;
  for i := 6 downto 1 do Begin
    if S[i] = '?' then Begin S[i] := 'F'; Break; end;
    if S[i] = 'F' then Begin S[i] := 'T'; Break; end;
    if S[i] = 'T' then Begin S[i] := '?'; end;
  end;

end;

Begin
  Assign(output, '04.'); ReWrite(output);

  S := '??????';
  WriteLn('729');

  Repeat
    WriteLn(S);
  Until not AddOne(S);

  Close(output);
End.