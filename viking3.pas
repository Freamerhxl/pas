type point=^node;
     node=record
      x,dis:longint;
      next:point;
end;
const pp=10001;
var son:array[0..10001]of point;
    dis:array[0..10001]of longint;
    inq:array[0..10001]of boolean;
    q:array[0..10001]of longint;
    i,j,n,m,t,s,x,y,z:longint;
    p:point;
begin
  readln(n);readln(m);
  for i:=1 to m do
    begin
      readln(x,y,z);
      new(p);p^.x:=y;p^.dis:=z;p^.next:=son[x];son[x]:=p;
    end;
  q[0]:=1;s:=1;t:=0;
  fillchar(dis,sizeof(dis),43);
  dis[1]:=0;inq[1]:=true;
  repeat
    p:=son[q[t]];
    while p<>nil do
      begin
        if dis[q[t]]+p^.dis<dis[p^.x]then
          begin
            dis[p^.x]:=dis[q[t]]+p^.dis;
            if inq[p^.x]=false then
              begin
                q[s]:=p^.x;inc(s);
                if s>pp then s:=0;
                inq[p^.x]:=true;
              end;
          end;
        p:=p^.next;
      end;
    inq[q[t]]:=false;
    inc(t);if t>pp then t:=0;
  until t=s;
  writeln(dis[n]);
end.