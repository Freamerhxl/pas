var f:array[0..1001]of longint;
    map:Array[0..1001,0..1001]of longint;
    done:array[0..1001]of boolean;
    can:array[0..1001]of boolean;
    out,d:array[0..1001]of longint;
    i,j,n,m,k,x,y,who:longint;
procedure dfs(x:longint);
var i:longint;
begin
  done[x]:=true;f[x]:=0;
  if d[x]=0 then
    exit;
  for i:=1 to d[x]do
    begin
      if done[map[x,i]]=false then
        begin
          dfs(map[x,i]);
          if f[map[x,i]]=0 then
            f[x]:=1;
        end
      else
      if f[map[x,i]]=0 then f[x]:=1;
    end;
end;
procedure find(x:longint);
var i:longint;
begin
  can[x]:=true;
  for i:=1 to d[x]do
    if(can[map[x,i]]=false)and(f[map[x,i]]<>f[x])then
      find(map[x,i]);
end;
begin
  readln(n,m,who);
  for i:=1 to m do
    begin
      readln(x,y);
      if x>y then
        begin
          x:=x xor y;y:=x xor y;x:=x xor y;
        end;
      inc(d[x]);map[x,d[x]]:=y;
    end;
  dfs(1);
  if f[1]=1 then
    writeln(who)
  else
    writeln(1-who);
  find(1);
  m:=0;
  write(1);
  for i:=2 to n do
    if can[i]then
      write(' ',i);
end.