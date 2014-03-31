const pp=801;
      maxn=403;
type point=^node;
     node=record
       x,y:longint;
       next:point;
end;
var son:array[0..maxn,0..4]of point;
    a:array[0..maxn,1..2]of longint;
    q:array[0..pp,1..2]of longint;
    dis:array[0..maxn,0..4]of longint;
    inq:array[0..maxn,0..4]of boolean;
    id:array[0..maxn]of longint;
    i,j,n,m,k,x,y,l,r,flag,ans:longint;
    p:point;
procedure sort(t,w,p1,p2:longint);
var i,j:longint;
    k:array[1..2]of longint;
begin
  k:=a[(t+w)>>1];i:=t;j:=w;
  repeat
    while(a[i,p1]<k[p1])or((a[i,p1]=k[p1])and(a[i,p2]<k[p2]))do inc(i);
    while(a[j,p1]>k[p1])or((a[j,p1]=k[p1])and(a[j,p2]>k[p2]))do dec(j);
    if i<=j then
      begin
        a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
        id[0]:=id[i];id[i]:=id[j];id[j]:=id[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j,p1,p2);
  if i<w then sort(i,w,p1,p2);
end;
begin
  assign(input,'escape.in');reset(input);
  assign(output,'escape.out');rewrite(output);
  read(n,m);readln(a[1,1],a[1,2]);
  id[1]:=1;
  for i:=2 to n+1 do
    begin
      readln(a[i,1],a[i,2]);
      id[i]:=i;
    end;
  for i:=n+2 to n+m+1 do
    begin
      readln(a[i,1],a[i,2]);
      id[i]:=i;
    end;
  sort(1,n+m+1,1,2);
  l:=0;
  for i:=2 to n+m+1 do
  if a[i,1]=a[i-1,1]then
    begin
      new(p);p^.x:=id[i-1];p^.y:=2;p^.next:=son[id[i],4];son[id[i],4]:=p;
      new(p);p^.x:=id[i];p^.y:=4;p^.next:=son[id[i-1],2];son[id[i-1],2]:=p;
      for j:=l downto 1 do
        if a[j,1]<>a[i,1]-1 then break
      else
        begin
          if a[j,2]>a[i,2]then
            begin
              new(p);p^.x:=id[j];p^.y:=4;p^.next:=son[id[i],1];son[id[i],1]:=p;
              new(p);p^.x:=id[i];p^.y:=1;p^.next:=son[id[j],4];son[id[j],4]:=p;
            end
          else
          if a[j,2]<a[i,2]then
            begin
              new(p);p^.x:=id[j];p^.y:=2;p^.next:=son[id[i],1];son[id[i],1]:=p;
              new(p);p^.x:=id[i];p^.y:=1;p^.next:=son[id[j],2];son[id[j],2]:=p;
            end;
        end;
    end
  else
    begin
      l:=i-1;
      for j:=l downto 1 do
        if a[j,1]<>a[i,1]-1 then break
      else
        begin
          if a[j,2]>a[i,2]then
            begin
              new(p);p^.x:=id[j];p^.y:=4;p^.next:=son[id[i],1];son[id[i],1]:=p;
              new(p);p^.x:=id[i];p^.y:=1;p^.next:=son[id[j],4];son[id[j],4]:=p;
            end
          else
          if a[j,2]<a[i,2]then
            begin
              new(p);p^.x:=id[j];p^.y:=2;p^.next:=son[id[i],1];son[id[i],1]:=p;
              new(p);p^.x:=id[i];p^.y:=1;p^.next:=son[id[j],2];son[id[j],2]:=p;
            end;
        end;
    end;
  sort(1,n+m+1,2,1);
  l:=0;
  for i:=2 to n+m+1 do
  if a[i,2]=a[i-1,2]then
    begin
      new(p);p^.x:=id[i-1];p^.y:=3;p^.next:=son[id[i],1];son[id[i],1]:=p;
      new(p);p^.x:=id[i];p^.y:=1;p^.next:=son[id[i-1],3];son[id[i-1],3]:=p;
     for j:=l downto 1 do
        if a[j,2]<>a[i,2]-1 then break
      else
        begin
          if a[j,1]<a[i,1]then
            begin
              new(p);p^.x:=id[j];p^.y:=3;p^.next:=son[id[i],4];son[id[i],4]:=p;
              new(p);p^.x:=id[i];p^.y:=4;p^.next:=son[id[j],3];son[id[j],3]:=p;
            end
          else
          if a[j,1]>a[i,1]then
            begin
              new(p);p^.x:=id[j];p^.y:=1;p^.next:=son[id[i],4];son[id[i],4]:=p;
              new(p);p^.x:=id[i];p^.y:=4;p^.next:=son[id[j],1];son[id[j],1]:=p;
            end;
        end;
    end
  else
    begin
      l:=i-1;
      for j:=l downto 1 do
        if a[j,2]<>a[i,2]-1 then break
      else
        begin
          if a[j,1]<a[i,1]then
            begin
              new(p);p^.x:=id[j];p^.y:=3;p^.next:=son[id[i],4];son[id[i],4]:=p;
              new(p);p^.x:=id[i];p^.y:=4;p^.next:=son[id[j],3];son[id[j],3]:=p;
            end
          else
          if a[j,1]>a[i,1]then
            begin
              new(p);p^.x:=id[j];p^.y:=1;p^.next:=son[id[i],4];son[id[i],4]:=p;
              new(p);p^.x:=id[i];p^.y:=4;p^.next:=son[id[j],1];son[id[j],1]:=p;
            end;
        end;
    end;
  fillchar(dis,sizeof(dis),43);
  flag:=dis[0,0];
  dis[1,1]:=0;dis[1,2]:=0;dis[1,3]:=0;dis[1,4]:=0;
  q[0,1]:=1;q[0,2]:=1;inq[1,1]:=true;
  q[1,1]:=1;q[1,2]:=2;inq[1,2]:=true;
  q[2,1]:=1;q[2,2]:=3;inq[1,3]:=true;
  q[3,1]:=1;q[3,2]:=4;inq[1,4]:=true;
  r:=4;l:=0;
  repeat
    p:=son[q[l,1],q[l,2]];
    while p<>nil do
      begin
        if dis[q[l,1],q[l,2]]+1<dis[p^.x,p^.y]then
          begin
            dis[p^.x,p^.y]:=dis[q[l,1],q[l,2]]+1;
            if inq[p^.x,p^.y]=false then
              begin
                inq[p^.x,p^.y]:=true;
                q[r,1]:=p^.x;q[r,2]:=p^.y;
                inc(r);if r>pp then r:=pp;
              end;
          end;
        p:=p^.next;
      end;
    inq[q[l,1],q[l,2]]:=false;
    inc(l);if l>pp then l:=0;
  until l>r;
  for i:=n+2 to n+m+1 do
    begin
      ans:=flag;
      for j:=1 to 4 do
        if dis[i,j]<ans then
          ans:=dis[i,j];
      if ans<flag then writeln(ans)
      else writeln(-1);
    end;
  close(input);close(output);
end.