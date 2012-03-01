{$apptype console}

{ a mod b
  ���᫨� a �� ����� b.
  �.�. ������ ⠪�� k in [0..b-1], �� a=b*t+k, t - 楫�� �᫮.
  Input
  ��� 楫�� �᫠ a � b ࠧ����� �஡����.
  a,b in [-2147483647..2147483647].
  Output
  �뢥��� k
  Example (������� Example )
  -5 4    =>   3
}

uses SysUtils;

function Zp( n,p : int64 ):int64;
begin
  assert( p > 0 );
  if n<0 then
    result := (p-1) - ((-n-1) mod p)
  else
    result := n mod p;
end;

{ ��ਠ�� ������ ���� ��������� ��-�� �ମ��� � mod -
  �� �� ���� ����뢠���� �� ���� ���� � � �� :) }
function Zp2( n,p : int64 ):int64;
begin
  assert( p > 0 );
  if n<0 then
    result := (p - (-n mod p)) mod p
  else
    result := n mod p;
end;

function Zp_Longint( n,p : Longint ):Longint;
begin
  assert( p > 0 );
  if n<0 then
    result := (p - (-n mod p)) mod p
  else
    result := n mod p;
end;

var
  i:Integer;
  Start,Diff : TDateTime;
  L : Longint;
  a,b : Int64;
begin
  { �஢�ન }
  assert( Zp(0,4) = 0 );
  assert( Zp(1,4) = 1 );
  assert( Zp(2,4) = 2 );
  assert( Zp(3,4) = 3 );
  assert( Zp(4,4) = 0 );
  assert( Zp(5,4) = 1 );
  assert( Zp(-1,4) = 3 );
  assert( Zp(-2,4) = 2 );
  assert( Zp(-3,4) = 1 );
  assert( Zp(-4,4) = 0 );
  assert( Zp(-5,4) = 3 );
  assert( Zp(-6,4) = 2 );
  for i:=-30 to 30 do
    assert( Zp(i,7) = Zp2(i,7) );
(*  { ���� � Longint }
  L := -2147483647;
  L := 2147483647;
  assert( Zp_Longint(-2147483647,2147483647) =
    Zp(-2147483647,2147483647) );
  { ����७�� ᪮��� }
  Start := GetTime;
  for i:=0 to 20000000 do Zp2(i*17,239312);
  Diff := (GetTime - Start)*1000*60*60*24;
  Writeln('Zp2: ',Diff:0:2);
  {}
  Start := GetTime;
  for i:=0 to 20000000 do Zp(i*17,239312);
  Diff := (GetTime - Start)*1000*60*60*24;
  Writeln('Zp: ',Diff:0:2); *)
  assign(input,'amodb.in'); reset(input);
  assign(output,'amodb.out'); rewrite(output);
  read(a,b);
  writeln(Zp(a,b));
end.