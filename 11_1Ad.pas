var f:array[0..1001]of longint;
    a:array[0..1001,1..3]of longint;
    i,j,n,m,r,ans:longint;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;k:=a[(t+w)>>1,1];
  repeat
    while a[i,1]<k do inc(i);
    while a[j,1]>k do dec(j);
    if i<=j then
      begin
        a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  readln(n,m,r);
  for i:=1 to m do
    readln(a[i,1],a[i,2],a[i,3]);
  sort(1,m);
  f[1]:=a[1,3];
  for i:=2 to m do
    begin
      f[i]:=a[i,3];
      for j:=1 to i-1 do
        if(a[i,1]-a[j,2]>r)and(f[j]+a[i,3]>f[i])then
        f[i]:=f[j]+a[i,3];
    end;
  for i:=1 to m do
    if f[i]>ans then ans:=f[i];
  writeln(ans);
end.