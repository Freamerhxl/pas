var a:array[0..100001]of char;
    next,id:array[0..100001]of longint;
    i,j,n,m,k:longint;
    ch:char;
function compare(i,j,k:longint):longint;
begin
  if a[i]<a[j]then exit(1);
  if a[i]>a[j]then exit(-1);
  if k>100 then exit(0);
  exit(compare(next[i],next[j],k+1));
end;
procedure sort(t,w:longint);
var i,j,k,tt:longint;
begin
  i:=t;j:=w;k:=id[(t+w)>>1];
  repeat
    tt:=compare(id[i],k,1);
    while(tt>0)or((tt=0)and(id[i]<K))do
      begin
        inc(i);tt:=compare(id[i],k,1);
      end;
    tt:=compare(id[j],k,1);
    while(tt<0)or((tt=0)and(id[j]>k))do
      begin
        dec(j);tt:=compare(id[j],k,1);
      end;
    if i<=j then
      begin
        id[0]:=id[i];id[i]:=id[j];id[j]:=id[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  readln(n);
  for i:=1 to n do
    begin
      read(a[i]);id[i]:=i;
      if i<>n then
        read(ch);
    end;
  readln;
  for i:=1 to n do
    read(next[i]);
  sort(1,n);
  for i:=1 to n do
    writeln(id[i]);
end.