{$apptype console}

uses SysUtils;

{ ��������� ������ ��� ������ �� ������� ������� �������� }

{ �������� ��������� ����� � ���� }
procedure WriteRandomDigits( MaxDigits : integer );
var NumDigits : integer;
  i : integer; { ���������� ����� }
begin
  NumDigits := Random(MaxDigits)+1;
  Write(Random(9)+1); { ������� ������ ����� ����� }
  for i := 2 to NumDigits do
    Write(Random(10)); { ������� ��������� ����� }
  Writeln;
end;

const Digits : array ['1'..'9'] of Integer =
  (3,26,123,235,2143,4334,3246,10000,10000);
var
  Test : char;
begin
  RandSeed := 357452;
  for Test := '1' to '9' do begin
    Rewrite(output,'0'+Test);
    WriteRandomDigits(Digits[Test]);
    WriteRandomDigits(Digits[Test]);
    Close(output);
  end;
end.
