{ ��襭�� ����� D,E }
Var S:String;
    I,N,Sum,Cnt,J:LongInt; { I - ����� �ॡ㥬�� ���� }
      { N - ����� ⥪�饩 ��᫥����⥫쭮�� }
      { Cnt - ������⢮ ��� � ⥪�饩 ��᫥����⥫쭮�� }
      { Sum - �ᥣ� ��� � �।��騩 ��᫥����⥫쭮���� }
Begin
  Assign(Input,'D.IN'); Reset(Input);
  Assign(Output,'D.OUT'); Rewrite(Output);
  Read(I);
 { �饬 �����᫥����⥫쭮��� � ������ � ��� }
  Sum:=0; Cnt:=0;
  For N:=1 to MaxLongInt do
    Begin
      Str(N,S); { �ਯ��뢠�� � �।��饩 ��᫥����⥫쭮�� N }
      Cnt:=Cnt+Length(S); { ����� ��᫥�. �����⠥� �� Length(S) }
      If Sum>=(I-Cnt) then Break;
      Sum:=Sum+Cnt;
    End;
  I:=I-Sum; { ������ I - ������ ���� � ⥪�饩 �����᫥����⥫쭮�� }
 { �饬 ���� � �����᫥����⥫쭮�� }
  Cnt:=0;
  For N:=1 to MaxLongInt do
    Begin
      Str(N,S);
      If Cnt>=(I-Length(S)) then Break;
      Cnt:=Cnt+Length(S);
    End;
  I:=I-Cnt; { ������ I - ������ � ⥪�饬 �᫥ }
 { �뢮� �⢥� }
  Writeln(S[I]);
End.