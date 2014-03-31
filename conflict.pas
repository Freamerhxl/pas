var a:array[0..100000]of longint;
    n,k,t,i:longint;
    ans:int64;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;
  k:=a[(t+w)>>1];
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
begin
  assign(input,'conflict.in');reset(input);
  assign(output,'conflict.out');rewrite(output);
  readln(k,n);
  for i:=1 to n do
    read(a[i]);
  sort(1,n);
  for i:=1 to n do
    ans:=ans+i-a[i];
  writeln(ans);
  close(input);close(output);
end.