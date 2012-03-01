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

var test,N,i : integer;
  inf,outf : TextFile;

begin
  RandSeed := 123321;
  for test:=3 to 10 do begin
    { ��������� ���� ����� � ������ }
    Assign(inf,FileName(test)); rewrite(inf);
  //  Assign(outf,FileName(test)+'.a'); rewrite(outf);
    { ����������� ������������ }
    N := test*test;
    writeln(inf,N);
    for i:=1 to N do begin
      write(inf,(Random(100000)-100000)/10000:0:4,' ');
//      writeln(outf,Solve(A):0:3);
    end;
    writeln(inf);
    for i:=1 to N do begin
      write(inf,(Random(100000)-100000)/10000:0:4,' ');
//      write(outf,Solve(A):0:3);
    end;
    writeln(inf);
    { ��������� ����� }
    close(inf); // close(outf);
  end;
end.