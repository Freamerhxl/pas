type point=^node;
     node=record
       x,id:longint;
     next:point;
end;
var son:array[0..40001]of point;
    a,ans:array[0..40001]of longint;
    done:array[0..40001]of boolean;
    i,j,n,x,y,count,min:longint;
    p:point;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;k:=ans[(t+w)>>1];
  repeat
    while ans[i]<k do inc(i);
    while ans[j]>k do dec(j);
    if i<=j then
      begin
        ans[0]:=ans[i];ans[i]:=ans[j];ans[j]:=ans[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
procedure dfs(x:longint);
var p:point;
    temp:longint;
begin
  done[x]:=true;
  p:=son[x];
  while p<>nil do
    begin
      if done[p^.x]=false then
        begin
          dfs(p^.x);
          inc(a[x],a[p^.x]);
          temp:=abs(n-a[p^.x]-a[p^.x]);
          if temp<min then
            begin
              min:=temp;
              count:=1;ans[1]:=p^.id;
            end
          else
          if temp=min then
            begin
              inc(count);ans[count]:=p^.id;
            end;
        end;
      p:=p^.next;
    end;
  inc(a[x]);
end;
begin
  readln(n);
  for i:=1 to n-1 do
    begin
      readln(x,y);
      new(p);p^.x:=y;p^.id:=i;p^.next:=son[x];son[x]:=p;
      new(p);p^.x:=x;p^.id:=i;p^.next:=son[y];son[y]:=p;
    end;
  min:=maxlongint;
  dfs(1);
  sort(1,count);
  ans[0]:=-1;
  for i:=1 to count do
  if ans[i]<>ans[i-1]then
    writeln(ans[i]);
end.