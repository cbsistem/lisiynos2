{$APPTYPE CONSOLE}

(*

\def\name{a4}%
\begin{problem}{���������� �������}{\name.in}{\name.out}{}{}

  ����� ����������������� ����,
  ����� ����������, ����� ������� ��������� �� �������� �������
  S (��������� � ��� � ����� ���������� ���������).

\InputFile

  � ������ ������ �������� ��� ����� $N$,$M$,$S$ ���������� ���������.
  $N$ - ���������� ������ ($1 \le N \le 255$). $M$ - ���������� ����.
  $S$ - ������� �� ������� �������� �����.

  ����� ��� $M$ �����.
  ������ ������ ����� ���� ����� � �������� 2 ����� $F$, $T$.
  ����� ��������� ������� $F$ � $T$.

\OutputFile

  �������� ��� ����������� �� $S$ ������� � ������� ����������� ����������
  ���������.

\Examples

\begin{example}
\exmp{ \input \name/01 }{ \input \name/01.a }%
\exmp{ \input \name/02 }{ \input \name/02.a }%
\exmp{ \input \name/03 }{ \input \name/03.a }%
\end{example}

\end{problem}
*)

{ ���������� DFS ����� ��������� }
var
  N : byte; { ���������� ������ }
  M : Integer; { ���������� ���� }
  A : Array [1..256] of Set of Byte;
  C : Set of Byte;
  S : byte;

procedure DFS( i:byte );
var j : byte;
begin
  if i in C then exit;
  C := C + [i];
  for j := low(Byte) to high(Byte) do
    if j in A[i] then
      DFS(j);
end;

var
  i : integer;
  F,T : byte;
begin
  Reset(input,'a4.in');
  Rewrite(output,'a4.out');
  { ������ ������� ������ }
  Read(N,M,S);
  for i:=1 to N do
    A[i] := [];
  for i:=1 to M do begin
    Read(F,T);
    A[F] := A[F] + [T];
    A[T] := A[T] + [F];
  end;
  { ������������� }
  C := [];
  { ����� ������ � ������� }
  DFS(S);
  { ����� ������ }
  for i := low(Byte) to high(Byte) do
    if i in C then
      write(i,' ');
end.



