var f:Array[0..33,0..33,0..33,0..33]of longint;
    done:array[0..33,0..33,0..33,0..33]of boolean;
    a:array[0..33,0..33]of longint;
    h:array[0..50]of integer;
    i,j,n,m,k,ans:longint;
function work(x1,y1,x2,y2:integer):integer;
var i,t1,t2:integer;
begin
  done[x1,y1,x2,y2]:=true;
  if a[x2,y2]-a[x1-1,y2]-a[x2,y1-1]+a[x1-1,y1-1]=1 then
    begin
      f[x1,y1,x2,y2]:=0;
      exit(0)
    end
  else if a[x2,y2]-a[x1-1,y2]-a[x2,y1-1]+a[x1-1,y1-1]=0 then
    begin
      f[x1,y1,x2,y2]:=n*m;
      exit(n*m);
    end;
  for i:=x1+1 to x2 do
    begin
      if done[x1,y1,i-1,y2]then
        t1:=f[x1,y1,i-1,y2]
      else
        t1:=work(x1,y1,i-1,y2);

      if done[i,y1,x2,y2]then
        t2:=f[i,y1,x2,y2]
      else
        t2:=work(i,y1,x2,y2);

      if t1+t2+y2-y1+1<f[x1,y1,x2,y2]then
        f[x1,y1,x2,y2]:=t1+t2+y2-y1+1;
    end;

  for i:=y1+1 to y2 do
    begin
      if done[x1,y1,x2,i-1]then
        t1:=f[x1,y1,x2,i-1]
      else
        t1:=work(x1,y1,x2,i-1);

      if done[x1,i,x2,y2]then
        t2:=f[x1,i,x2,y2]
      else
        t2:=work(x1,i,x2,y2);
      if t1+t2+x2-x1+1<f[x1,y1,x2,y2]then
        f[x1,y1,x2,y2]:=t1+t2+x2-x1+1;
    end;
  exit(f[x1,y1,x2,y2]);
end;
function cost(x1,y1,x2,y2:longint):longint;
begin
  cost:=0;
  if x2<n then
    cost:=cost+y2-y1+1;
  if y2<m then
    cost:=cost+x2-x1+1;
end;
procedure dfs(now:longint);
var t,i,x,y,j:longint;
begin
  if now>=ans then exit;
  x:=maxlongint;
  for i:=1 to m do
    if(h[i]<x)then
      begin
        x:=h[i];
        y:=i;
      end;
  inc(x);
  if x>n then
    begin
      ans:=now;exit;
    end;
  for i:=x to n do
  begin
    for j:=y to m do
      begin
        t:=a[i,j]-a[x-1,j]-a[i,y-1]+a[x-1,y-1];
        if t>1 then break;
        h[j]:=i;
        if t=1 then
        dfs(now+cost(x,y,i,j));
        if h[j+1]<>x-1 then
          break;
      end;
    for t:=y to j do
      h[t]:=x-1;
  end;
end;
begin
  assign(input,'inquire.in');reset(input);
  assign(output,'inquire.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
  for j:=1 to m do
    begin
      read(a[i,j]);
      a[i,j]:=a[i,j]+a[i-1,j]+a[i,j-1]-a[i-1,j-1];
    end;
  fillchar(f,sizeof(f),43);
  ans:=work(1,1,n,m);
  dfs(0);
  writeln(ans);
  close(input);close(output);
end.