const p=9901;
var f:array[0..1001,-1001..1001]of longint;
    a:array[0..1001]of longint;
    i,j,n,ans,p10:longint;
begin
  readln(n);
  for i:=1 to n do
    read(a[i]);
  p10:=p*10;
  for i:=2 to n do
  for j:=1 to i-1 do
    f[i,a[i]-a[j]]:=(f[i,a[i]-a[j]]+f[j,a[i]-a[j]]+1)mod p10;
  for i:=2 to n do
  for j:=-1000 to 1000 do
    ans:=(ans+f[i,j])mod p10;
  writeln((ans+n) mod p);
end.