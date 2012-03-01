{ ������������� ��������� ��������� 2004-2005. �������� ��� }
{ ������ C. ������ }
{ �������: ��������� ����� - Denis@nic.spb.ru }
{ ����: Delphi 6.0/7.0 }
{$APPTYPE CONSOLE}

Uses SysUtils;

const 
  FileName = 'groups';
  maxN = 24;
  maxK = 24;

var 
  SS : array [0..MaxN,0..MaxK] of Int64;

function S( N,K:Integer ):Int64;
begin
  if SS[N,K]<>-1 then 
    Result := SS[N,K]
  else begin
    if K>N then 
      Result := 0  //  S(N,K) K > N
    else if N=K then
      Result := 1  //  S(N,N)
    else if (N>0) and (K=0) then
      Result := 0  //  S(N,0), N>0
    else 
      Result := S(N-1,K-1) + K * S(N-1,K);
    SS[N,K] := Result;
  end;
end;

var N,K:Integer;
begin
  { ������������� }
  for N:=0 to MaxN do 
    for K:=0 to MaxK do 
      SS[N,K] := -1;
  { �������� ������� ������ }
  for N:=0 to MaxN do
    for K:=0 to MaxK do 
      assert( S(N,K) <= 1000000000000000000 );
  { ��������� �������/�������� ����� }
  assign(input,FileName+'.in'); reset(input);
  assign(output,FileName+'.out'); rewrite(output);
  { ��������� N � K }
  read(N,K);
  { �������� ����� �� ������������ ������������ }
  assert( (0<=N) and (N<=MaxN) );
  assert( (0<=K) and (K<=MaxK) );
  { ������� � ����� ������ }
  Writeln( S(N,K) );
end.
