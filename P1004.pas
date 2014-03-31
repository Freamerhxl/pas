var f,a:array[0..101,0..101]of longint;
    done:array[0..101,0..101]of boolean;
    i,j,n,m,ans:longint;
procedure doit(x,y:longint);
begin
  f[x,y]:=1;done[x,y]:=true;
  if a[x-1,y]>a[x,y]then
    begin
      if done[x-1,y]=false then
        doit(x-1,y);
      if f[x-1,y]+1>f[x,y]then f[x,y]:=f[x-1,y]+1;
    end;
  if a[x+1,y]>a[x,y]then
    begin
      if done[x+1,y]=false then
        doit(x+1,y);
      if f[x+1,y]+1>f[x,y]then f[x,y]:=f[x+1,y]+1;
    end;
  if a[x,y-1]>a[x,y]then
    begin
      if done[x,y-1]=false then
        doit(x,y-1);
      if f[x,y-1]+1>f[x,y]then f[x,y]:=f[x,y-1]+1;
    end;
  if a[x,y+1]>a[x,y]then
    begin
      if done[x,y+1]=false then
        doit(x,y+1);
      if f[x,y+1]+1>f[x,y]then f[x,y]:=f[x,y+1]+1;
    end;
  if f[x,y]>ans then ans:=f[x,y];
end;
begin
  readln(n,m);
  fillchar(a,sizeof(a),$f7);
  for i:=1 to n do
  for j:=1 to m do
    read(a[i,j]);
  ans:=1;
  for i:=1 to n do
  for j:=1 to m do
    if done[i,j]=false then
      doit(i,j);
  writeln(ans);
end.