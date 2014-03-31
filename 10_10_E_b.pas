var f:Array[0..201,0..201]of longint;
    a:array[0..201]of longint;
    i,j,n,k:longint;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
begin
  readln(n);
  for i:=1 to n+1 do
    read(a[i]);
  fillchar(f,sizeof(f),63);
  for i:=1 to n do
    f[i,i]:=0;
  for i:=n-1 downto 1 do
  for j:=i+1 to n do
  for k:=i to j-1 do
    f[i,j]:=fmin(f[i,j],f[i,k]+f[k+1,j]+a[i]*a[k+1]*a[j+1]);
  writeln(f[1,n]);
end.