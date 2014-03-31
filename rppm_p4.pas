var a:array[0..201,1..2]of longint;
    dis:array[0..201]of longint;
    done:array[0..201]of boolean;
    n,i,j,ans,x:longint;
begin
  readln(n);
  for i:=1 to 2*n do
    read(a[i,1],a[i,2]);
  fillchar(dis,sizeof(dis),43);
  dis[1]:=0;
  for i:=1 to 2*n do
    begin
      x:=0;
      for j:=1 to 2*n do
      if(done[j]=false)and(dis[j]<dis[x])then
        x:=j;
      done[x]:=true;
      for j:=1 to 2*n do
      if(done[j]=false)and(abs(a[x,1]-a[j,1])+abs(a[x,2]-a[j,2])<dis[j])then
        dis[j]:=abs(a[x,1]-a[j,1])+abs(a[x,2]-a[j,2]);
    end;
  for i:=1 to 2*n do
    ans:=ans+dis[i];
  writeln(ans);
end.