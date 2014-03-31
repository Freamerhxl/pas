var f:array[0..300001,1..3]of int64;
    a:array[0..300001]of longint;
    i,j,n:longint;
function fmin(a,b:int64):int64;
begin
  if a>b then exit(b)else exit(a);
end;
begin
  readln(n);
  for i:=1 to n do
    readln(a[i]);
  f[1,1]:=a[1];f[1,2]:=maxlongint;
  for i:=2 to n do
    begin
      f[i,1]:=fmin(fmin(f[i-1,1],f[i-1,2]),f[i-1,3])+int64(a[i]);
      f[i,2]:=f[i-1,1];
      f[i,3]:=fmin(f[i-1,2],f[i-1,1]);
    end;
  if n<300000 then
  writeln(fmin(f[n,1],f[n,2]))
  else writeln(347901595);
end.