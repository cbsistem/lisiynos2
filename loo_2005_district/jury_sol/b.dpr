{ ������������� ��������� ��������� 2004-2005. �������� ��� }
{ ������ B. ��������� ����� }
{ �������: ��������� ����� - Denis@nic.spb.ru }
{ ����: Delphi 6.0/7.0 }
{$APPTYPE CONSOLE}

uses SysUtils;

const 
  FileName = 'fast';

{ ������� ���������� � ������� �� ������ a^b mod m }

function fast_mul( a:Int64; b:Integer; m:Int64 ):Int64;
begin
  if b = 0 then
    Result := 1
  else
    case b mod 2 of
      0: begin
           Result := fast_mul(a,b div 2,m);
           Result := Result*Result;
         end;
      1: Result := (fast_mul(a,b-1,m) * a);
    end;
  Result := Result mod m;
end;

var
  a:Int64; b:Integer; m:Int64;
  Tests,Test : Integer;
begin
  { ��������� �������/�������� ����� }
  assign(input,FileName+'.in'); reset(input);
  assign(output,FileName+'.out'); rewrite(output);
  { ������ ����� � ����� ������ }
  read(Tests);
  for Test := 1 to Tests do begin
    read(a,b,m);
    writeln( fast_mul(a,b,m) );
  end;
end.
