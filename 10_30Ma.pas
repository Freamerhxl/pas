var a,q:array[0..300001]of longint;
    i,j,n,m,ans,t,temp,w:longint;
begin
  readln(n,m);
  for i:=1 to n do
    begin
      read(a[i]);a[i]:=a[i-1]+a[i];
    end;
  q[1]:=0;t:=1;ans:=-maxlongint;w:=1;
  for i:=1 to n do
    begin
      while(i-q[t]>m)do inc(t);
      temp:=a[i]-a[q[t]];
      if temp>ans then ans:=temp;
      while(a[i]<a[q[w]])and(w>=t)do dec(w);
      inc(w);q[w]:=i;
    end;
  writeln(ans);
end.