var f:array[0..101,0..101]of int64;
    a:array[0..101]of longint;
    i,j,n,k:longint;
function fmin(a,b:longint):longint;
begin
  if a<b then exit(a)else exit(b);
end;
begin
  readln(n);
  for i:=1 to n do read(a[i]);
  fillchar(f,sizeof(f),63);
  for i:=1 to n do
    begin
      f[i,i]:=0;
      f[i,i+1]:=0;
    end;
  for i:=n-2 downto 1 do
  for j:=i+2 to n do
  for k:=i+1 to j-1 do
    f[i,j]:=fmin(f[i,j],f[i,k]+f[k,j]+a[i]*a[k]*a[j]);
  writeln(f[1,n]);
end.