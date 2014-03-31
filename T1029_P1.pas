const maxn=100001;
var a,id:array[0..maxn]of longint;
    n,i,k:longint;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;k:=a[t+random(w-t)];
  repeat
    while a[i]<k do inc(i);
    while a[j]>k do dec(j);
    if i<=j then
      begin
        a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
        id[0]:=id[i];id[i]:=id[j];id[j]:=id[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'T1029_p1.in');reset(input);
  assign(output,'T1029_p1.out');rewrite(output);
  randomize;
  readln(n);
  for i:=1 to n do
    begin
      read(a[i]);
      id[i]:=i;
    end;
  readln(k);
  sort(1,n);
  writeln(id[k]);
  close(output);
end.
