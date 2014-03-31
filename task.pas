var f,son:array[0..1001,0..1001]of longint;
    a,id,count:array[0..1001]of longint;
    i,j,n,m,k,ans:longint;
procedure dfs(x:longint);
var i:longint;
begin
  inc(k);id[k]:=x;count[x]:=1;
  for i:=1 to son[x,0]do
    begin
      dfs(son[x,i]);
      inc(count[x],count[son[x,i]]);
    end;
end;
begin
  assign(input,'task.in');reset(input);
  assign(output,'task.out');rewrite(output);
  readln(n,m);if m>n then m:=n;
  for i:=1 to n do
    begin
      read(a[i],son[i,0]);
      for j:=1 to son[i,0]do
        read(son[i,j]);
    end;
  k:=0;
  dfs(1);
  fillchar(f,sizeof(f),$f7);
  f[k+1,0]:=0;
  for i:=k downto 1 do
  for j:=m downto 0 do
    begin
      if f[i+count[id[i]],j]>f[i,j]then
        f[i,j]:=f[i+count[id[i]],j];
      if f[i+1,j]+a[id[i]]>f[i,j+1]then
        f[i,j+1]:=f[i+1,j]+a[id[i]];
    end;
  ans:=-maxlongint;
  for i:=0 to m do
    if f[1,i]>ans then ans:=f[1,i];
  writeln(ans);
  close(input);close(output);
end.
