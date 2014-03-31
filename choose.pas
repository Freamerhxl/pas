type point=^node;
     node=record
      x:longint;
      next:point;
end;
var a,pp,count:array[0..1002]of longint;
    f:array[0..1002,0..1002]of longint;
    s:array[0..102,0..102]of set of 0..100;
    done:array[0..1002]of boolean;
    son:array[0..1002]of point;
    i,j,n,m,k:longint;
    p:point;
procedure dfs(x:longint);
var p:point;
begin
  inc(count[x]);inc(k);pp[k]:=x;
  done[x]:=true;
  p:=son[x];
  while p<>nil do
    begin
     if done[p^.x]=false then
     begin
      dfs(p^.x);inc(count[x],count[p^.x]);
     end;
      p:=p^.next;
    end;
end;
begin
  assign(input,'choose.in');reset(input);
  assign(output,'choose.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    begin
      readln(k,a[i]);
      new(p);p^.x:=i;p^.next:=son[k];son[k]:=p;
    end;
  k:=0;
  a[0]:=0;
  dfs(0);
  fillchar(f,sizeof(f),$f7);
  f[k+1,0]:=0;
  for i:=k downto 1 do
  for j:=m downto 0 do
    begin
      if f[i+count[pp[i]],j]>f[i,j]then
        begin
          f[i,j]:=f[i+count[pp[i]],j];
          if n<100 then
            s[i,j]:=s[i+count[pp[i]],j];
        end;
      if f[i+1,j]+a[pp[i]]>f[i,j+1]then
        begin
          f[i,j+1]:=f[i+1,j]+a[pp[i]];
          if n<100 then
            s[i,j+1]:=s[i+1,j]+[pp[i]];
        end;
    end;
  writeln(f[1,m+1]);
  if n<100 then
  for i:=1 to n do
    if i in s[1,m+1]then
    writeln(i);
  close(input);close(output);
end.