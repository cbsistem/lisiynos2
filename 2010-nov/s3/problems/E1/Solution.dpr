{$APPTYPE CONSOLE}
var
  N,M,A,B,i,j,k,t,step : integer;
  next,emptyset, current : set of 1..100;
  l : array [1..20] of set of 1..100;

begin
  assign(INPUT,'e1.in');reset(INPUT);
  assign(OUTPUT,'e1.out');rewrite(OUTPUT);
  { ������ ������ �� �������� ����� }
  read(N,M);
  for i:=1 to M do begin
    read(k);
    for j:=1 to k do begin
      read(t);
      Include(l[i],t);   {��������� ������� t }
 {� ��������� l[i]    }
    end;
  end;
  read(A,B);

  { ������������� }
  emptyset:=[];  {������ ���������}
  step:=0;
  current:=[A];

  { �������� ���� }
  for step:=0 to M-1 do begin
    next:=current;
    for i:=1 to M do
      if current*l[i]<>emptyset then
        next:=next+l[i];
    if B in next then begin
      write(step); close(output);exit;
    end;
    current:=next;
  end;

  { ���� �� ������� A �� ������� B ��� }
  write(-1);

  close(INPUT);
  close(OUTPUT);
end.