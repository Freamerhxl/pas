type point=^node;
     node=record
       x:integer;
       next:point;
end;
var map:array['a'..'z']of char;
    a,b,op:string;
    done,poi:array[0..10001]of boolean;
    son:array[0..10001]of point;
    i,j,n,m,k,x,y:longint;
    p:point;
procedure dfs(x:integer);
var p:point;
begin
  done[x]:=true;poi[x]:=true;
  p:=son[x];
  while p<>nil do
    begin
      if done[p^.x]=false then
        dfs(p^.x);
      p:=p^.next;
    end;
end;
begin
  readln(a);readln(b);
  for i:=1 to 26 do
    map[a[i]]:=b[i];
  op:='poison';
  readln(n,m);
  for i:=1 to m do
    begin
      read(k);readln(a);
      while pos(' ',a)>0 do delete(a,pos(' ',a),1);
      for j:=1 to length(a)do
        a[j]:=map[a[j]];
      if pos(op,a)>0 then
        poi[k]:=true;
    end;
  readln(m);
  for i:=1 to m do
    begin
      readln(x,y);
      new(p);p^.x:=y;p^.next:=son[x];son[x]:=p;
      new(p);p^.x:=x;p^.next:=son[y];son[y]:=p;
    end;
  m:=0;
  for i:=1 to n do
   if(done[i]=false)and(poi[i])then
     dfs(i);
  for i:=1 to n do
   if poi[i]then inc(m);
  writeln(n-m);
end.