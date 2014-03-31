type point=^node;
     node=record
       x:integer;
     next:point;
end;
var f:array[0..10003,0..501]of longint;
    id,c,a:array[0..10003]of longint;
    son:array[0..10003]of point;
    i,j,n,m,k,ans:longint;
    p:point;
procedure dfs(x:integer);
var p:point;
begin
  inc(k);id[k]:=x;
  p:=son[x];inc(c[x]);
  while p<>nil do
    begin
      dfs(p^.x);
      inc(c[x],c[p^.x]);
      p:=p^.next;
    end;
end;
begin
   readln(n,m);
   for i:=1 to n do
     begin
     read(k,a[i]);
     new(p);p^.x:=i;p^.next:=son[k];son[k]:=p;
     end;
   a[0]:=40000000;
   k:=0;
   dfs(0);
   fillchar(f,sizeof(f),$f7);
   f[k+1,0]:=0;
   for i:=k downto 1 do
   for j:=m downto 0 do
     begin
       if f[i+c[id[i]],j]>f[i,j]then
         f[i,j]:=f[i+c[id[i]],j];
       if f[i+1,j]+a[id[i]]>f[i,j+1]then
         f[i,j+1]:=f[i+1,j]+a[id[i]];
     end;
   ans:=0;
   for i:=0 to m do
     if f[1,i]>ans then ans:=f[1,i];
   writeln(ans);
end.