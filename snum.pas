var a,f:array[0..1001]of longint;
    va:array[0..1001,0..1001]of longint;
    n,i,j,k:longint;
function  fmax(a,b:longint):longint;
begin
  if a>b then exit(a)else exit(b);
end;
begin
  readln(n);
  for i:=1 to n do
    read(a[i]);
  for i:=1 to n-1 do
  for j:=i+1 to n do
    va[i,j]:=abs(a[i]-a[j])*(j-i+1);
  for i:=1 to n do va[i,i]:=a[i];
  for i:=1 to n do
  for j:=0 to i-1 do
    f[i]:=fmax(f[i],f[j]+va[j+1,i]);
  writeln(f[n]);
end.