var f:array[0..501,0..2001]of int64;
    a:array[0..2001]of longint;
    i,j,n,m,k:longint;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;k:=a[(t+w)>>1];
  repeat
    while a[i]<k do inc(i);
    while a[j]>k do dec(j);
    if i<=j then
      begin
        a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
function fmin(a,b:int64):int64;
begin
  if a>b then exit(b)else exit(a);
end;
begin
  assign(input,'stick.in');reset(input);
  assign(output,'stick.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    read(a[i]);
  sort(1,n);
  fillchar(f,sizeof(f),63);
  for i:=0 to m do
    f[0,i]:=0;
  for i:=1 to m do
  for j:=2*(i-1)+2 to n do
    f[i,j]:=fmin(f[i-1,j-2]+int64(sqr(int64(a[j]-a[j-1]))),f[i,j-1]);
  writeln(f[m,n]);
  close(input);close(output);
end.