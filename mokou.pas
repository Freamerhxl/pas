program Iambj11;
type node=record
     x,y:longint;
     len:double;
end;
point=^node2;
node2=record
  x:longint;
  cost:double;
  next:point;
end;
var path:array[0..200001]of node;
    p,d:array[0..40001]of longint;
    done:array[0..40001]of boolean;
    suml:array[0..40001]of double;
    son:array[0..40001]of point;
    i,j,n,m,k,x,y,count,ans:longint;
    sum,avg,now,min:double;
    pp:point;
procedure sort(t,w:longint);
var i,j:longint;
    k:double;
begin
  i:=t;j:=w;
  k:=path[(t+w)>>1].len;
  repeat
    while path[i].len<k do inc(i);
    while path[j].len>k do dec(j);
    if i<=j then
      begin
        path[0]:=path[i];
        path[i]:=path[j];
        path[j]:=path[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
function get(x:longint):longint;
begin
  if p[x]=x then exit(x);
  p[x]:=get(p[x]);
  exit(p[x]);
end;
procedure dfs(x:longint);
var p:point;
    avg,op:double;
begin
  avg:=sum/d[x];
  p:=son[x];done[x]:=true;op:=0;
  while p<>nil do
    begin
      if done[p^.x]=false then
        begin
          dfs(p^.x);
          suml[p^.x]:=suml[p^.x]+p^.cost;
          suml[x]:=suml[x]+suml[p^.x];
          op:=op+suml[p^.x]*suml[p^.x];
        end;
      p:=p^.next;
    end;
  op:=op+sqr(sum-suml[x]);
  if d[x]>1 then
    begin
      op:=op-2*sum*avg+d[x]*avg*avg;
      if op<min then
        begin
          ans:=x;min:=op;
        end
      else if(abs(op-min)<1e-6)and(x<ans)then
        ans:=x;
    end;
end;
begin
  assign(input,'mokou.in');reset(input);
  assign(output,'mokou.out');rewrite(output);
  readln(n,m);
  for i:=1 to m do
    readln(path[i].x,path[i].y,path[i].len);
  sort(1,m);
  for i:=1 to n do
    p[i]:=i;
  count:=0;
  for i:=1 to m do
    begin
      x:=get(path[i].x);y:=get(path[i].y);
      if x<>y then
        begin
          sum:=sum+path[i].len;
          inc(d[path[i].x]);inc(d[path[i].y]);
          new(pp);pp^.x:=path[i].y;pp^.cost:=path[i].len;pp^.next:=son[path[i].x];son[path[i].x]:=pp;
          new(pp);pp^.x:=path[i].x;pp^.cost:=path[i].len;pp^.next:=son[path[i].y];son[path[i].y]:=pp;
          p[y]:=x;
          inc(count);
          if count=n-1 then break;
        end;
    end;
  min:=1e38;
  dfs(1);
  writeln(ans);
  close(input);close(output);
end.