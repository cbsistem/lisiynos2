{$APPTYPE CONSOLE}

uses SysUtils;

const MaxN = 10000000;
{ ���� ����䥭� }
var 
  simple : array [2..MaxN] of Boolean; 
  N,M,i,j : Integer;
begin
  assign(input,'c1.in'); reset(input);
  assign(output,'c1.out'); rewrite(output);
  { ���� ��室��� ������: �᫠ N � M �� ���ண� �᪠�� ����� �᫠ }
  read(M,N);
  { ���� ��室��� ������: �᫮ N �� ���ண� �᪠�� ����� �᫠ }
  { ��ࢠ� ��ப� ᮤ�ন� ��� ����ࠫ��� �᫠ $N$ � $M$. ($1 \le M \le N \le 10000000$). }
  for i := 2 to N do 
    simple[i] := true;  
  for i := 2 to N do 
    if simple[i] then begin
      j := i + i;
      while j <= N do begin
        simple[j] := false;  
        j := j + i;
      end;  
    end;
  { �뢮� १���� - ��� ������ �ᥫ �� 2 �� N }  
  for i := M to N do
    if simple[i] then Write(i,' ');
end.

