var f:array[0..1001]of longint;
    a:array[0..101,1..2]of longint;
    i,j,n,m,ans:longint;
begin
  readln(n,m);
  for i:=1 to m do
    readln(a[i,1],a[i,2]);
  fillchar(f,sizeof(f),$f7);
  f[0]:=0;
  for i:=1 to m do
  for j:=n downto a[i,1]do
  if f[j-a[i,1]]>=0 then
  if f[j-a[i,1]]+a[i,2]>f[j]then
  f[j]:=f[j-a[i,1]]+a[i,2];
  for i:=0 to n do
    if f[i]>ans then ans:=f[i];
  writeln(ans);
end.