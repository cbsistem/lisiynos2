{ ������������� ��������� ��������� 2004-2005. �������� ��� }
{ ������ A. ����������� }
{ �������: ��������� ����� - Denis@nic.spb.ru }
{ ����: Delphi 6.0/7.0 }
{$APPTYPE CONSOLE}

uses SysUtils;

const 
  FileName = 'connect';
  maxN = 100;
  maxM = 10000;

var
  N,M,i,j,k,t,Answer : Integer;
  Color : Array [1..MaxN] of Integer;
  Use : Array [1..MaxN] of Boolean;
begin
  { ��������� �������/�������� ����� }
  assign(input,FileName+'.in'); reset(input);
  assign(output,FileName+'.out'); rewrite(output);
  { ��������� ���������� ������ � ����� }
  read(N,M);
  { �������� ����� �� ������������ ������������ }
  assert( (1<=N) and (N<=MaxN) );
  assert( (0<=M) and (M<=MaxM) );
  { ������ ������ ����� � ���� ���� }
  for k:=1 to N do Color[k]:=k;
  { ��������� ������. ���� ������ ��������� ������� c ������� Color1 � Color2,
    ���������� ��� ����� ����� Color2 � ���� Color1.
    ����� ��������� ��������� ��� �����, ����������� � ����� ������ �����
    ������ �����. }
  for k:=1 to M do begin
    read(i,j);
    { �������� ����� �� ������������ }
    assert( (1<=i) and (i<=N) );
    assert( (1<=j) and (j<=N) );
    { �������������� }
    for t:=1 to N do
      if Color[t] = Color[j] then Color[t]:=Color[i];
  end;
  { �������� ���������� ��������� ������, ��� ����� ������ ���������� ������
    Use. Use[i] - ���� �� �� ��� ���� i }
  fillChar(Use,SizeOf(Use),false); // ������� �������, ��� 
                     // �� ����������� �� ������ �����
  Answer := 0; // ����� ������ - ���������� ����� = ���������� ������
  for i:=1 to N do 
    if not Use[Color[i]] then begin
      Use[Color[i]] := true;
      Inc(Answer);
    end;
  { ������� ����� }
  write( Answer );
end.
