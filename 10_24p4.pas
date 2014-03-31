type point=^node;
     node=Record
       x,cost:longint;
       next:point;
end;
var dis,cost:array[0..10001]of longint;
    son:array[0..10001]of point;
    i,j,n,m,k,mid,l,r,x,y,z:longint;
    p:point;
function can(x:longint):boolean;
var p:point;
    temp:longint;
begin
  if x=n then
    exit(true);
  p:=son[x];
  while p<>nil do
    begin
      temp:=dis[x]-p^.cost;if temp<0 then temp:=0;
      temp:=temp+cost[p^.x];
      if temp<dis[p^.x]then
        begin
          dis[p^.x]:=temp;
          if can(p^.x)then exit(true);
        end;
      p:=p^.next;
    end;
  exit(false);
end;
begin
  readln(n,m);
  for i:=1 to n do
    read(cost[i]);
  for i:=1 to m do
    begin
      readln(x,y,z);
      new(p);p^.x:=y;p^.cost:=z;
      p^.next:=son[x];son[x]:=p;
    end;
  l:=cost[1];r:=maxlongint>>1;
  mid:=(l+r)>>1;
  repeat
    for i:=1 to n do
      dis[i]:=mid+1;
    dis[1]:=cost[1];
    if can(1) then
      begin
        k:=mid;
        r:=mid-1;
      end
    else
      l:=mid+1;
    mid:=(l+r)>>1;
  until l>r;
  writeln(k);
end.