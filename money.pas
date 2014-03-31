type point=^node;
     node=record
       x:longint;
       z:extended;
       next:point;
end;
var dis:array[0..2001]of extended;
    done:array[0..2001]of boolean;
    son:array[0..2001]of point;
    a,b,i,j,n,m,x,y,z:longint;
    temp:extended;
    p:point;
begin
  assign(input,'money.in');reset(input);
  assign(output,'money.out');rewrite(output);
  readln(n,m);
  for i:=1 to m do
    begin
      readln(x,y,z);
      new(p);p^.x:=x;p^.z:=1-z/100;p^.next:=son[y];son[y]:=p;
      new(p);p^.x:=y;p^.z:=1-z/100;p^.next:=son[x];son[x]:=p;
    end;
  readln(a,b);
  for i:=0 to n do
    dis[i]:=1e20;
  dis[b]:=100;
  fillchar(done,sizeof(done),false);
  for i:=1 to n do
    begin
      temp:=1e20;
      for j:=1 to n  do
        if(dis[j]<temp)and(done[j]=false)then
          begin
            temp:=dis[j];z:=j;
          end;
      done[z]:=true;
      p:=son[z];
      while p<>nil do
        begin
          if(done[p^.x]=false)and(dis[z]/p^.z<dis[p^.x])then
            dis[p^.x]:=dis[z]/p^.z;
          p:=p^.next;
        end;
    end;
  writeln(dis[a]:0:8);
  close(input);close(output);
end.