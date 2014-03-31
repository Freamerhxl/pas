type point=^node;
node=record
  x:longint;
  next:point;
end;
var f:array[0..500001,0..1]of longint;
    son:array[0..500001]of point;
    done:array[0..500001]of boolean;
    i,j,n,m,k,x,y,ans:longint;
    p:point;
function fmin(a,b:longint):longint;
begin
  if a<b then exit(a)else exit(b);
end;
procedure treedp(x:longint);
var p:point;
begin
  done[x]:=true;
  f[x,1]:=1;
  p:=son[x];
  while p<>nil do
    begin
      if done[p^.x]=false then
       begin
         treedp(p^.x);
         f[x,1]:=f[x,1]+fmin(f[p^.x,1],f[p^.x,0]);
         f[x,0]:=f[x,0]+f[p^.x,1];
       end;
      p:=p^.next;
    end;
end;
begin
  readln(n);
  for i:=1 to n do
    begin
      read(k);
      while k<>0 do
       begin
         new(p);p^.x:=k;p^.next:=son[i];son[i]:=p;
         read(k);
       end;
    end;
  for i:=1 to n do
  if done[i]=false then
  begin
    treedp(i);
    ans:=ans+fmin(f[i,1],f[i,0]);
  end;
  writeln(ans-1);
end.
