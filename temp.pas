var i,j,n,ans:longint;
    a:array[0..100]of longint;
    st:ansistring;
procedure dfs(x,k,opt:longint);
begin
  if x>n then
    begin
      if k=a[x-1]then inc(ans);
      exit;
    end;
  if k=a[x-1]then
    dfs(x+1,opt,0);
  if k=a[x-1]-1 then
    dfs(x+1,opt+1,1);
end;
begin
  assign(output,'tyvj.in');rewrite(output);
  writeln(50000,' ',20000,' ',10000);
  for i:=1 to 50000 do
    if odd(i)then write('a')
    else write('b');
  writeln;
  for i:=1 to 20000 do
     if odd(i)then write('a')
    else write('b');
  writeln;
  for i:=0 to 9999 do
    writeln(i);
  close(output);
end.
