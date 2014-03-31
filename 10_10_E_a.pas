var f:array[0..1001]of longint;
    a:array[0..101,1..2]of longint;
    i,j,n,ans,t:longint;
function fmax(a,b:longint):longint;
begin
  if a>b then exit(a)else exit(b);
end;
begin
  readln(n);readln(t);
  for i:=1 to n do
    readln(a[i,1],a[i,2]);
  fillchar(f,sizeof(f),$f7);
  f[0]:=0;
  for i:=1 to n do
  for j:=t downto a[i,2]do
  if f[j-a[i,2]]>=0 then
  f[j]:=fmax(f[j],f[j-a[i,2]]+a[i,1]);
  for i:=t downto 0 do
    if f[i]>ans then ans:=f[i];
  writeln(ans);
end.