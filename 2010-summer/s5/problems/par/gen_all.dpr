program gen_all;

{ ��������� ������ ��� ������ "��������������" }
{$APPTYPE CONSOLE}
uses
  SysUtils;

const maxAngle = 10000;
  MaxX = 10000;

{ ��� ����� ����� �� ������ ����� }
function FileName( test : integer ):string;
begin
  Result := IntToStr(test);
  if Length(Result)<2 then
    Result := '0'+Result;
end;

var test,N,i : integer;
  inf,outf : TextFile;
begin
  RandSeed := 123321;
  for test:=2 to 10 do begin
    { ��������� ���� ����� � ������ }
    Assign(inf,FileName(test)); rewrite(inf);
  //  Assign(outf,FileName(test)+'.a'); rewrite(outf);
    { ����������� ������������ }
    N := test*test;
//    writeln(inf,N);
    for i:=1 to N do begin
      { ���������� 2 ��������� ������ }
      writeln(inf,Random(MaxX),' ',Random(MaxX),' ',Random(MaxX));
      writeln(inf,Random(MaxX),' ',Random(MaxX),' ',Random(MaxX));
//      writeln(outf,Solve(A):0:3);
    end;
    writeln(inf,'0 0 0');
    { ��������� ����� }
    close(inf); // close(outf);
  end;
end.