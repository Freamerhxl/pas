var f,a:array[0..1000001]of real;
    i,k,n:longint;
    ans:real;
begin
  readln(n);
  for i:=1 to n do
    readln(a[i]);
  f[1]:=1;k:=1;ans:=1;
  for i:=2 to n do
    begin
      f[i]:=f[k]/a[k]*a[i];
      if ans>f[i]then f[i]:=ans else ans:=f[i];
      if f[i]/a[i]>f[k]/a[k] then k:=i;
    end;
  writeln(ans:0:0);
end.