var f:array[0..1,0..5011]of longint;
    a:array[0..5011]of longint;
    i,j,n,m,now,last:longint;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
begin
  readln(m,n);
  for i:=1 to n do
    read(a[i]);
  for i:=1 to m do
    begin
      now:=i and 1;last:=1-now;
      fillchar(f[now],sizeof(f[now]),63);
      for j:=n-3*i+1 downto 1 do
        f[now,j]:=fmin(f[now,j+1],f[last,j+2]+sqr(a[j]-a[j+1]));
    end;
  writeln(f[now,1]);
end.