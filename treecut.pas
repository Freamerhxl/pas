type point=^node;
     node=record
      x:integer;
      next:point;
end;
var son:array[0..10001]of point;
    count,ans:array[0..10001]of integer;
    done:array[0..10001]of boolean;
    i,j,n,m,k,x,y:longint;
    p:point;
procedure dfs(x:integer);
var p:point;
    flag:boolean;
begin
  flag:=true;
  done[x]:=true;
  p:=son[x];
  while p<>nil do
    begin
      if done[p^.x]=false then
        begin
          dfs(p^.x);
          count[x]:=count[x]+count[p^.x];
          if count[p^.x]>n>>1 then flag:=false;
        end;
      p:=p^.next;
    end;
  inc(count[x]);
  if n-count[x]>n>>1 then flag:=false;
  if flag then
    begin
      inc(m);ans[m]:=x;
    end;
end;
procedure sort(t,w:integer);
var i,j,k:integer;
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
begin
  assign(input,'treecut.in');reset(input);
  assign(output,'treecut.out');rewrite(output);
  readln(n);
  for i:=1 to n-1 do
    begin
      readln(x,y);
      new(p);p^.x:=y;p^.next:=son[x];son[x]:=p;
      new(p);p^.x:=x;p^.next:=son[y];son[y]:=p;
    end;
  dfs(1);
  if m=0 then
   writeln('NONE')
  else
    begin
     sort(1,m);
     for i:=1 to m do
       writeln(ans[i]);
    end;
  close(input);close(output);
end.