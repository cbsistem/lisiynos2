(*
 ����� Easy. ��襭�� ����.
 ��⮭ �������, 2002 ���.
*)

Var
  l, K : LongInt; {�ࠢ�������� �᫮, ��᫥�㥬�� �᫮}

Begin
  Assign(input, 'c.in'); ReSet(input);
  Assign(output, 'c.out'); ReWrite(output);

  Read(K);
  l := 2;
  While l <= sqrt(K) do Begin
    if K mod l = 0 then Begin
      WriteLn('NO,', l); Close(input); Close(output); Halt;
    end;
    Inc(l);
  end;

  WriteLn('YES'); Close(input); Close(output);
End.