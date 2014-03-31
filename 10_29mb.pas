type point=^node;
     node=record
       x:longint;
       next:point;
end;
var son:array[0..101]of point;
    a,f:array[0..101]of longint;
    i,j,n,m,k,ans:longint;
    p:point;
procedure treedp(x:longint);
var p:point;
    max:longint;
begin
  max:=0;
  if son[x]=nil then
    begin
      f[x]:=a[x];
      exit;
    end;
  p:=son[x];
  while p<>nil do
    begin
      treedp(p^.x);
      if f[p^.x]>max then max:=f[p^.x];
      p:=p^.next;
    end;
  f[x]:=max+a[x];
end;
begin
  assign(input,'b.in');reset(input);
  assign(output,'b.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      read(a[i]);
      while not eoln do
        begin
          read(k);
          new(p);
          p^.x:=k;p^.next:=son[i];son[i]:=p;
        end;
    end;
  for i:=n downto 1 do
    begin
      f[i]:=a[i];
      p:=son[i];
      while p<>nil do
        begin
          if f[p^.x]+a[i]>f[i]then f[i]:=f[p^.x]+a[i];
          p:=p^.next;
        end;
      if f[i]>ans then ans:=f[i];
    end;
  writeln(ans);
  close(input);close(output);
end.