{$APPTYPE CONSOLE}
{ ��������� ������ ��� ������: ����� ������� }

uses SysUtils;

{ ��� �������� ����� ��� ��������� ������ ����� }
function InputFileName( TestNo : Integer ):string;
begin
  Str(TestNo,Result);
  { ��������� ����������� ������ }
  while Length(Result) < 2 do
    Result := '0' + Result;
end;

function R( L,H : Integer ):Integer;
begin
  assert( L <= H );
  R := Random(H-L+1) + L;
end;

procedure GenLongNumber( MaxLen : Integer );
var Len,i : Integer;
begin
    { ���������� ����� ����� }
    Len := Random(MaxLen);
    { ���������� ������ ����� }
    Write(R(1,9));
    { ���������� ���������� ����� }
    for i := 2 to Len do
      Write(R(0,9));
    Writeln;
end;

var Test,Len,i : Integer;
begin
  RandSeed := 34647;
  for Test := 2 to 50 do begin
    rewrite(Output,InputFileName(Test));
    writeln(Random(Test*Test*10+10)/10:0:1,' ',Random(Test*Test*10+10)/10:0:1,' ',Random(Test*Test*10+10)/10:0:1);
    CloseFile(Output);
  end;
end.
