{$apptype console}

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
  for i:=1 to 9 do begin
    a := random(maxLongInt) - maxLongint div 2;
    b := (random(maxLongInt) div 2)+1;
    assign(output,'0'+IntToStr(i)); rewrite(output);
    writeln(a,' ',b);
    close(output);
    assign(output,'0'+IntToStr(i)+'.a'); rewrite(output);
    writeln(Zp(a,b));
    close(output);
  end;
end.