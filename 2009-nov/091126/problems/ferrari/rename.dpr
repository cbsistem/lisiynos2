{$apptype console}

uses SysUtils;

var
  SR : TSearchRec;
  F : File;
  newName : String;
begin
  { ��������������� inputXX.txt � XX }
  if FindFirst('input??.txt', faAnyFile, sr) = 0 then begin
    repeat
      AssignFile(F,SR.Name);
      newName := Copy(SR.Name,Length('input')+1,2);
      Rename(F,newName);
      writeln(SR.Name,' -> ',newName);
    until FindNext(sr) <> 0;
    FindClose(sr);
 end;
  { ��������������� outputXX.txt � XX.a }
  if FindFirst('answer??.txt', faAnyFile, sr) = 0 then begin
    repeat
      AssignFile(F,SR.Name);
      newName := Copy(SR.Name,Length('answer')+1,2)+'.a';
      Rename(F,newName);
      writeln(SR.Name,' -> ',newName);
    until FindNext(sr) <> 0;
    FindClose(sr);
 end;
end.
