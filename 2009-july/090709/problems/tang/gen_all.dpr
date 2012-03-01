program gen_all;

{ ��������� ������ ��� ������ "������� � �������" }
{$APPTYPE CONSOLE}
uses
  SysUtils;

const maxAngle = 10000;

{ ��� ����� ����� �� ������ ����� }
function FileName( test : integer ):string;
begin
  Result := IntToStr(test);
  if Length(Result)<2 then
    Result := '0'+Result;
end;

{ ������� ������ "�������" }
function solve( grad : double ):double;
var rad : double;
begin
  rad := grad*Pi / 180.0; { ��������� � ������� }
  solve := sin(rad)/cos(rad); { ���������� ����� }
end;

var test,cases,A,c : integer;
  inf,outf : TextFile;
begin
  RandSeed := 4234;
  for test:=2 to 10 do begin
    { ��������� ���� ����� � ������ }
    Assign(inf,FileName(test)); rewrite(inf);
    Assign(outf,FileName(test)+'.a'); rewrite(outf);
    { ���������� ������� �������� ������ }
    cases := test*test;
    writeln(inf,cases);
    for c:=1 to cases do begin
      A := Random(maxAngle)+1;
      writeln(inf,A);
      writeln(outf,Solve(A):0:3);
    end;
    { ��������� ����� }
    close(inf); close(outf);
  end;
end.