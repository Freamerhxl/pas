var //x1,x2:array[-30..30]of boolean;
    map:array[0..20]of longint;
    a:array[0..20384]of longint;
    i,j,n,ans:longint;
    st:string;
procedure dfs(x,now,x1,x2:longint);
var i,k:longint;
begin
  if now=0 then
    begin
      inc(ans);exit;
    end;
  i:=now and map[x]and x1 and x2;
  while i>0do
    begin
      k:=(not i+1)and i; i:=i-k;
      dfs(x+1,now-k,(x1-k)>>1+1<<(n-1),(x2-k)<<1+1);
    end;
end;
begin
  assign(input,'queens.in');reset(input);
  assign(output,'queens.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(st);
      for j:=1 to n do
        if st[j]='*' then
         map[i]:=map[i]or(1<<(j-1));
    end;
  dfs(1,1<<n-1,1<<n-1,1<<n-1);
  writeln(ans);
  close(input);close(output);
end.