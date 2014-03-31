var data:array[0..21]of string[30];
    map:array[0..31,0..31]of longint;
    can:array[0..31*31,0..31*31]of boolean;
    dis:array[0..31*31]of longint;
    done:array[0..31*31]of boolean;
    i,j,n,m,k,num,min,ans:longint;
procedure dfs(x,y:integer;ch:char);
begin
  data[x][y]:='!';map[x,y]:=num;
  if(x+1in[1..n])then
  if data[x+1][y]=ch then
  dfs(x+1,y,ch);
  if(x-1in[1..n])then
  if data[x-1][y]=ch then
  dfs(x-1,y,ch);
  if(y+1in[1..m])then
  if data[x][y+1]=ch then
  dfs(x,y+1,ch);
  if(y-1in[1..m])then
  if data[x][y-1]=ch then
  dfs(x,y-1,ch);
end;
begin
  assign(input,'meet.in');reset(input);
  assign(output,'meet.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    readln(data[i]);
  for i:=1 to n do
  for j:=1 to m do
    if data[i][j]<>'!' then
      begin
        inc(num);
        dfs(i,j,data[i][j]);
      end;
  for i:=1 to n do
  for j:=1 to m do
    begin
      can[map[i,j],map[i-1,j]]:=true;
      can[map[i,j],map[i+1,j]]:=true;
      can[map[i,j],map[i,j-1]]:=true;
      can[map[i,j],map[i,j+1]]:=true;
    end;
  for i:=1to num do
    can[i,i]:=false;
  fillchar(dis,sizeof(dis),43);
  for i:=1 to m do
    begin
      dis[map[1,i]]:=1;
    end;
  for i:=1 to num do
    begin
      min:=maxlongint;
      for j:=1 to num do
        if(dis[j]<min)and(done[j]=false)then
          begin
            min:=dis[j];
            k:=j;
          end;
      done[k]:=true;
      for j:=1 to num do
        if can[k,j] then
        if(dis[k]+1<dis[j])and(done[j]=false)then
          dis[j]:=dis[k]+1;
    end;
  ans:=maxlongint;
  for i:=1 to m do
    if dis[map[n,i]]<ans then
      ans:=dis[map[n,i]];
  writeln(ans);
  close(input);close(output);
end.