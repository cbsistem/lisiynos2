{$apptype console}

uses SysUtils;

const
  task = 'sum';

{ ����� ������� �������� ������� ����� ���������� }

Const
  MaxLen = 10100; { ������������ ����� �������� ����� }
  Base = 10; { ���� }

type
  Integer = SmallInt;

function Digit( Dig:Integer ):Char;
begin
  case Dig of
    0..9: Result := Chr(Ord('0')+Dig);
    10..35: Result := Chr(Ord('A')+Dig-10);
  else
    raise EOverflow.Create('������� ������� �����. �� ���� ��� �������� ;)');
  end;
end;

Type Long = array [-1..MaxLen] of Integer;
  { � -1�� ������� ��������� ���� }
  {  -1 - ������������� }
  {  +1 - ������������� }
  {   0 - ���� :) }

{ �������� ����� ����� = Len + 1 !!! }
function Len( Var L:Long ):Integer;
begin
  Result:=MaxLen;
  while (L[Result]=0) and (Result>0) do dec(Result);
end;

function ToString( Var L:Long ):String;
var i : Integer;
begin
  Case L[-1] of
    -1: Result := '-';
    0,1: Result := '';
  end;
  for i:=Len(L) downto 0 do
    Result := Result + Digit(L[i]);
end;

procedure FixUp( Var L:Long );
var i : Integer;
begin
  for i:=0 to MaxLen-1 do begin
    inc( L[i+1], L[i] div Base );
    L[i] := L[i] mod Base;
  end;
end;

procedure LAdd_Abs( A,B:Long; Var C:Long );
var i : Integer;
begin
  for i:=0 to MaxLen do C[i] := A[i] + B[i];
  FixUp(C);
end;

procedure LAdd( A,B:Long; Var C:Long );
begin
  { ���������� 2 ������: }
  if A[-1] = B[-1] then begin { A � B ������ ����� }
    C[-1] := A[-1]; { ����� ���� �� ����� ����� �� ��� � A � B }
    LAdd_Abs(A,B,C);
  end;
end;

{ ������� ����� �� ������� ����� � ����� (��� �������� ����������) }
function ToDigit( C:Char ):Integer;
begin
  case C of
    '0'..'9': Result := Ord(C)-Ord('0');
    'A'..'Z': Result := Ord(C)-Ord('A')+10;
  else
    raise EOverflow.Create('���������� ����� "'+C+'"');
  end;
end;

{ ������ �������� ����� �� ������ ����� }
procedure ReadLong( var N : Long );
var
  S : string; { ��������� ������ ��� ������ �� ����� �������� ����� }
  i : integer;
begin
  Readln(S);
  assert( Length(S) <= 10000 );
  for i := -1 to MaxLen do
    N[i] := 0;
  for i := 1 to Length(S) do
    N[Length(S)-i] := ToDigit(S[i]);
end;

var
  A,B,C : Long;

procedure ReadData;
begin
  Reset(Input,Task+'.in');
  ReadLong( A );
  ReadLong( B );
end;

procedure WriteAnswer;
begin
  Rewrite(Output,Task+'.out');
  Writeln(ToString(C));
end;

begin
  ReadData;
  LAdd(A,B,C);
  WriteAnswer;
end.
