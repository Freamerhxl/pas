var f,map:array[0..1001,0..1001]of boolean;
    i,j,n,m,k,y:longint;
begin
  readln(n);
  for i:=1 to n do
  for j:=1 to n do
    begin
      read(k);
      if k=1 then
        begin
          map[i,j]:=true;
          map[i,j+n]:=true;
          map[i+n,j]:=true;
          map[i+n,j+n]:=true;
        end;
    end;
  for i:=1 to n*2-1 do
    f[i,i+1]:=true;
  for i:=2 to n do
  for j:=1 to 2*n do
    begin
      y:=j+i;
      if y>2*n then break;
      for k:=j+1 to y do
        f[j,y]:=f[j,y]or((f[j,k]and f[k,y])and(map[j,k]or map[y,k]));
    end;
  m:=0;
  for i:=1 to n do
    if f[i,i+n]then
      inc(m);
  writeln(m);
  for i:=1 to n do
    if f[i,i+n]then
      writeln(i);
end.