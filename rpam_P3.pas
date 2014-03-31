type point=^node;
node=record
  x:longint;
  next:point;
end;
var dis:array[0..250001]of longint;
    son:array[0..250001]of point;
    a:array[0..250001]of longint;
    map:array[0..501,0..501]of longint;
    q:array[0..250001]of longint;
    inq:array[0..250001]of boolean;
    i,j,n,m,k,l,hp,p,t,s,x,y:longint;
    ans:longint;
    pp:point;
begin
  assign(input,'data.in');reset(input);
  readln(n,p);
  for i:=1 to n do
  for j:=1 to n do
    read(map[i,j]);
  for i:=1 to p do read(a[i]);
  readln(hp);
  for i:=1 to n do
  for j:=1 to n do
    begin
      x:=i+1;y:=j;
      if(map[x,y]<>map[i,j])and(map[x,y]<>0)then
        begin
          new(pp);pp^.x:=map[x,y];
          pp^.next:=son[map[i,j]];son[map[i,j]]:=pp;
        end;
      x:=i-1;y:=j;
      if(map[x,y]<>map[i,j])and(map[x,y]<>0)then
        begin
          new(pp);pp^.x:=map[x,y];
          pp^.next:=son[map[i,j]];son[map[i,j]]:=pp;
        end;
      x:=i;y:=j+1;
     if(map[x,y]<>map[i,j])and(map[x,y]<>0)then
        begin
          new(pp);pp^.x:=map[x,y];
          pp^.next:=son[map[i,j]];son[map[i,j]]:=pp;
        end;
      x:=i;y:=j-1;
       if(map[x,y]<>map[i,j])and(map[x,y]<>0)then
        begin
          new(pp);pp^.x:=map[x,y];
          pp^.next:=son[map[i,j]];son[map[i,j]]:=pp;
        end;
    end;
  t:=0;s:=0;fillchar(dis,sizeof(dis),63);ans:=dis[0];
  for i:=1 to n do
    if inq[map[1,i]]=false  then
    begin
       q[s]:=map[1,i];inc(s);
       inq[map[1,i]]:=true;
       dis[map[1,i]]:=a[map[1,i]];
    end;
  repeat
    pp:=son[q[t]];
    while pp<>nil do
      begin
        if dis[q[t]]+a[pp^.x]<dis[pp^.x]then
          begin
            dis[pp^.x]:=dis[q[t]]+a[pp^.x];
            if inq[pp^.x]=false then
              begin
                q[s]:=pp^.x;
                inq[pp^.x]:=true;
                s:=(s+1)mod 250001;
              end;
          end;
        pp:=pp^.next;
      end;
    inq[q[t]]:=false;
    t:=(t+1)mod 250001;
  until t=s;
  for i:=1 to n do
   if dis[map[n,i]]<ans then ans:=dis[map[n,i]];
  if ans<hp then
    writeln(hp-ans)
  else writeln('Dangerous!');
end.