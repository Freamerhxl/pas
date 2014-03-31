var a,q,f:array[0..1000001]of longint;
    i,t,n,m,w:longint;
    ans:longint;
begin
  readln(n,m);
  for i:=1 to n do
    read(a[i]);
    t:=1;w:=1;
    q[1]:=0;
  for i:=1 to n do
     begin
       while(i-q[t]>m)do inc(t);
       f[i]:=f[q[t]]+a[i];
       while(f[i]<f[q[w]])and(w>=t)do dec(w);
       inc(w);q[w]:=i;
     end;
  ans:=maxlongint;
  for i:=n downto n-m+1 do
    if f[i]<ans then ans:=f[i];
  writeln(ans);
end.