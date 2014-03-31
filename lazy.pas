var a,ans:array[0..70000]of longint;
    i,n:longint;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w; k:=a[(t+w)>>1];
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
procedure dfs(x,l,r:longint);
var m:longint;
begin
  ans[x]:=a[l];
  if l=r then exit;
  m:=(r-l)>>1;
  dfs(2*x,r-m+1,r);
  dfs(2*x+1,l+1,r-m);
end;
begin
  assign(input,'lazy.in');reset(input);
  assign(output,'lazy.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  sort(1,n);
  dfs(1,1,n);
  for i:=1 to n-1 do
    write(ans[i],' ');
  writeln(ans[n]);
  close(input);close(output);
end.