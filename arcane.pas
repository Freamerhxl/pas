const path:array[1..4,1..2]of -1..1=((-1,0),(1,0),(0,-1),(0,1));
type point=^node;
     node=record
       id:longint;
       next:point;
end;
var stack,int,minl:array[0..10001]of longint;
    ins,done:array[0..10001]of boolean;
    id:array[0..101,0..101]of longint;
    son:array[0..10001]of point;
    i,j,n,m,q,k,ans,top:longint;
    p:point;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
procedure tarjan(x:longint);
var count:longint;
    p:point;
begin
  inc(top);stack[top]:=x;ins[x]:=true;
  int[x]:=top;minl[x]:=top;done[x]:=true;
  p:=son[x];
  while p<>nil do
    begin
      if done[p^.id]=false then
        begin
          tarjan(p^.id);
          minl[x]:=fmin(minl[x],minl[p^.id]);
        end
      else
      if ins[p^.id] then
           minl[x]:=fmin(minl[x],minl[p^.id]);
      p:=p^.next;
    end;
  if minl[x]=int[x]then
    begin
      count:=0;
      while top<>int[x]do
        begin
          inc(count);
          ins[stack[top]]:=false;
          dec(top);
        end;
      ins[x]:=false;dec(top);
      if count>0 then inc(ans);
    end;
end;
begin
  assign(input,'arcane.in');reset(input);
  assign(output,'arcane.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
  for j:=1 to m do
    id[i,j]:=(i-1)*m+j;
  for i:=1 to n do
  for j:=1 to m do
    begin
      read(k);
      for q:=4 downto 1 do
        begin
          if k mod 2=1 then
            begin
              new(p);
              p^.id:=id[i+path[q,1],j+path[q,2]];
              p^.next:=son[id[i,j]];
              son[id[i,j]]:=p;
            end;
          k:=k div 2;
        end;
    end;
  for i:=1 to  n*m do
    if done[i]=false then
      tarjan(i);
  writeln(ans);
  close(input);close(output);
end.