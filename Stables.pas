var map:array[0..2001,0..2001]of longint;
    dis:array[0..2001]of longint;
    a:array[0..50,0..50]of longint;
    done:array[0..2001]of boolean;
    i,j,n,m,k,x,y,s,t,ans:longint;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
begin
  assign(input,'Stables.in');reset(input);
  assign(output,'Stables.out');rewrite(output);
  readln(m,n);
  for i:=1 to n do
  for j:=1 to m do
    read(a[i,j]);
  fillchar(map,sizeof(map),43);
  for i:=1 to n do
  for j:=1 to m do
    begin
      s:=(i-1)*m+j;
      x:=i-1;y:=j;
      t:=(x-1)*m+y;
      if(x>0)and(x<=n)and(y>0)and(y<=m)then
        map[s,t]:=fmin(a[i,j],a[x,y]);
      x:=i+1;y:=j;
      t:=(x-1)*m+y;
      if(x>0)and(x<=n)and(y>0)and(y<=m)then
        map[s,t]:=fmin(a[i,j],a[x,y]);
      x:=i;y:=j-1;
      t:=(x-1)*m+y;
      if(x>0)and(x<=n)and(y>0)and(y<=m)then
        map[s,t]:=fmin(a[i,j],a[x,y]);
      x:=i;y:=j+1;
      t:=(x-1)*m+y;
      if(x>0)and(x<=n)and(y>0)and(y<=m)then
        map[s,t]:=fmin(a[i,j],a[x,y]);
    end;
  fillchar(dis,sizeof(dis),43);
  dis[1]:=0;
  for i:=1 to n*m do
    begin
      y:=maxlongint;
      for j:=1 to n*m do
       if(done[j]=false)and(dis[j]<y)then
         begin
           y:=dis[j];x:=j;
         end;
      if done[x]=false then
      ans:=ans+dis[x];
      done[x]:=true;
      for j:=1 to n*m do
       if(done[j]=false)and(map[x,j]<dis[j])then
         dis[j]:=map[x,j];
    end;
  writeln(ans);
  close(input);close(output);
end.