var f,a:array[0..1001,0..1001]of longint;
    i,j,n:longint;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
begin
  assign(input,'a.in');reset(input);
  readln(n);
  for i:=1 to n do
  for j:=1 to i do
    read(a[i,j]);
  fillchar(f,sizeof(f),63);
  f[n,1]:=a[n,1];
  for i:=2 to n do
  f[n,i]:=f[n,i-1]+a[n,i];
  if f[n,1]+a[n,n]<f[n,n]then
    f[n,n]:=f[n,1]+a[n,n];
  for i:=n-1 downto 1 do
    if f[n,i+1]+a[n,i]<f[n,i]then
      f[n,i]:=f[n,i+1]+a[n,i];
  for i:=n-1 downto 1 do
    begin
      for j:=1 to i-1 do
        f[i,j]:=fmin(f[i+1,j],f[i+1,j+1])+a[i,j];
      f[i,i]:=fmin(f[i+1,i+1],fmin(f[i+1,1],f[i+1,i]))+a[i,i];
      f[i,1]:=fmin(f[i,1],f[i+1,i+1]+a[i,1]);
      f[i,1]:=fmin(f[i,1],f[i,i]+a[i,1]);
      for j:=2 to i do
        f[i,j]:=fmin(f[i,j],f[i,j-1]+a[i,j]);
      f[i,i]:=fmin(f[i,i],f[i,1]+a[i,i]);
      for j:=i-1 downto 1 do
        f[i,j]:=fmin(f[i,j],f[i,j+1]+a[i,j]);
    end;
  writeln(f[1,1]);
end.