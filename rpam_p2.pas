const p=1000000000;
var fm:array[0..1333]of longint;
    f1,f2,f3:array[0..1000]of longint;
    i,j,n,m,k:longint;
begin
  readln(n);
  if n=2 then
    begin
      writeln(4);
      writeln(1);
    end
  else
  if n=3 then
  begin
    writeln(8);
    writeln(1);
  end
  else
  begin
  fm[1]:=8;fm[0]:=1;
  f1[0]:=1;f2[0]:=1;
  f1[1]:=1;f2[1]:=1;
  for i:=4 to n do
    begin
      for j:=1 to fm[0] do
        fm[j]:=fm[j]+fm[j];
      for j:=1 to fm[0]do
        if fm[j]>=p then
          begin
            inc(fm[j+1]);
            fm[j]:=fm[j]-p;
          end;
      while fm[fm[0]+1]>0 do inc(fm[0]);
      for j:=1 to f2[0]do
        f3[j]:=f1[j]+f2[j];
      f3[0]:=f2[0];
      for j:=1 to f3[0]do
       if f3[j]>=p then
        begin
          f3[j+1]:=f3[j+1]+1;
          f3[j]:=f3[j]-p;
        end;
      while f3[f3[0]+1]>0 do inc(f3[0]);
      for j:=0 to f3[0]do
        begin
          f1[j]:=f2[j];
          f2[j]:=f3[j];
        end;
    end;
  write(fm[fm[0]]);
  for i:=fm[0]-1 downto 1 do
   begin
     if fm[i]<100000000 then write(0);
     if fm[i]<10000000 then write(0);
     if fm[i]<1000000 then write(0);
     if fm[i]<100000 then write(0);
     if fm[i]<10000 then write(0);
     if fm[i]<1000 then write(0);
     if fm[i]<100 then write(0);
     if fm[i]<10 then write(0);
     write(fm[i]);
   end;
  writeln;
  write(f3[f3[0]]);
  for i:=f3[0]-1downto 1 do
    begin
     if f3[i]<100000000 then write(0);
     if f3[i]<10000000 then write(0);
     if f3[i]<1000000 then write(0);
     if f3[i]<100000 then write(0);
     if f3[i]<10000 then write(0);
     if f3[i]<1000 then write(0);
     if f3[i]<100 then write(0);
     if f3[i]<10 then write(0);
     write(f3[i]);
    end;
  end;
end.