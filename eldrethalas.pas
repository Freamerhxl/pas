var dis,cost:array[0..2501]of longint;
    can:array[0..2501,0..2501]of boolean;
    map:array[0..51,0..51]of longint;
    done:array[0..2501]of boolean;
    i,j,n,m,k,ans,p,h:longint;
begin
  assign(input,'eldrethalas.in');reset(input);
  assign(output,'eldrethalas.out');rewrite(output);
  readln(n,p,h);
  for i:=1 to p do
    read(cost[i]);
  for i:=1 to n do
  for j:=1 to n do
    read(map[i,j]);
  for i:=1 to n do
  for j:=1 to n do
    begin
      can[map[i,j],map[i-1,j]]:=true;
      can[map[i,j],map[i+1,j]]:=true;
      can[map[i,j],map[i,j-1]]:=true;
      can[map[i,j],map[i,j+1]]:=true;
    end;
  for i:=1 to p do
    can[i,i]:=false;
  fillchar(dis,sizeof(dis),43);
  for i:=1 to n do
    dis[map[1,i]]:=cost[map[1,i]];
  for i:=1 to p do
    begin
      k:=maxlongint;
      for j:=1 to p do
        if(done[j]=false)and(dis[j]<k)then
          begin
            m:=j;k:=dis[j];
          end;
      done[m]:=true;
      for j:=1 to p do
        if can[m,j]and(done[j]=false) and(dis[m]+cost[j]<dis[j])then
          dis[j]:=dis[m]+cost[j];
    end;
  ans:=maxlongint;
  for i:=1 to n do
    if dis[map[n,i]]<ans then
      ans:=dis[map[n,i]];
  if ans<h then
    writeln(h-ans)
  else writeln('NO');
  close(input);close(output);
end.