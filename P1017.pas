var p:array[0..1001]of longint;
    i,n,m,x,y,ans:longint;
function get(x:longint):longint;
begin
  if p[x]=x then exit(x);
  p[x]:=get(p[x]);
  exit(p[x]);
end;
begin
  readln(n,m);
  for i:=1 to m do
    p[i]:=i;
  for i:=1 to n do
    begin
      readln(x,y);
      x:=get(x);y:=get(y);
      if x=y then
        inc(ans)
      else
        p[y]:=x;
    end;
  writeln(ans);
end.