var work:array[0..21,0..10000]of boolean;
    a,b:array[0..100,0..100]of longint;
    c,d,e:array[0..1000]of longint;
    i,j,n,m,k:longint;
function can(id,x,y,z:longint):boolean;
var i:longint;
begin
  for i:=y to y+z-1 do
    if work[x,i]then exit(false);
  for i:=y to y+z-1 do
    work[x,i]:=true;
  inc(d[id]);
  e[id]:=y+z;
  exit(true);
end;
begin
  assign(input,'jsp.in');reset(input);
  assign(output,'jsp.out');rewrite(output);
  readln(m,n);
  for i:=1 to n*m do
    read(c[i]);
  for i:=1 to n do
  for j:=1 to m do
    read(a[i,j]);
  for i:=1 to n do
  for j:=1 to m do
    read(b[i,j]);
  for i:=1 to n do d[i]:=1;
  e:=d;
  for i:=1 to n*m do
  begin
  for j:=e[c[i]] to 8020 do
    if work[a[c[i],d[c[i]]],j]=false then
      if can(c[i],a[c[i],d[c[i]]],j,b[c[i],d[c[i]]])then
       break;
  end;
  for i:=8020 downto 0 do
    begin
      for j:=m downto 0 do
        if work[j,i]then break;
      if j<>0 then break;
    end;
  writeln(i);
  close(input);close(output);
end.