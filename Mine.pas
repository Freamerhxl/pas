var f:array[0..10001,-1..3,0..1]of longint;
    a:array[0..10001]of longint;
    i,j,n,m,k,ans:longint;
begin
  assign(input,'Mine.in');reset(input);
  assign(output,'Mine.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  f[1,0,0]:=1;
  if a[1]>0 then
    f[1,1,1]:=1;
  for i:=2 to n do
    if a[i]=1 then
      begin
        f[i,0,0]:=f[i-1,a[i-1],0];
        f[i,1,0]:=f[i-1,a[i-1],1];
        f[i,1,1]:=f[i-1,a[i-1]-1,0];
      end
    else
    if a[i]=2 then
      begin
        f[i,1,0]:=f[i-1,a[i-1],1];
        f[i,1,1]:=f[i-1,a[i-1]-1,0];
        f[i,2,1]:=f[i-1,a[i-1]-1,1];
      end
    else
    if a[i]=3 then
       f[i,2,1]:=f[i-1,a[i-1]-1,1]
    else
    if a[i]=0 then
      f[i,0,0]:=f[i-1,a[i-1],0];
  ans:=f[n,a[n],0]+f[n,a[n],1];
  writeln(ans);
  close(input);close(output);
end.