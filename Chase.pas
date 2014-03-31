var dis1,dis2,st,q,d:array[0..3002]of longint;
    inq:array[0..3002]of boolean;
    p:array[0..30001,1..2]of longint;
    i,j,n,m,k,a,b,x,y,z,t,s,ans:longint;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;k:=p[(t+w)>>1,1];
  repeat
    while p[i,1]<k do inc(i);
    while p[j,1]>k do dec(j);
    if i<=j then
      begin
        p[0]:=p[i];p[i]:=p[j];p[j]:=p[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
procedure cannotcatch;
begin
  writeln('NO');
  close(output);close(input);
  halt;
end;
begin
  assign(input,'Chase.in');reset(input);
  assign(output,'Chase.out');rewrite(output);
  readln(n,m,a,b);
  for i:=1 to m do
    begin
      readln(x,y);
      inc(d[x]);inc(d[y]);
      inc(k);
      p[k,1]:=x;p[k,2]:=y;
      inc(k);
      p[k,1]:=y;p[k,2]:=x;
    end;
  m:=k;
  sort(1,m);
  st[n+1]:=m+1;

  for i:=1 to m do
    if st[p[i,1]]=0 then
     st[p[i,1]]:=i;

  for i:=n downto 1 do
    if st[i]=0 then st[i]:=st[i+1];
//-------------------------------SPFA dis1-----------------------------------
  t:=0;s:=1;
  fillchar(dis1,sizeof(dis1),43);
  dis1[a]:=0;q[0]:=a; inq[a]:=true;
  repeat
    x:=q[t];
    for i:=st[x]to st[x+1]-1 do
      if dis1[x]+1<dis1[p[i,2]]then
        begin
          dis1[p[i,2]]:=dis1[x]+1;
          if inq[p[i,2]]=false then
            begin
              q[s]:=p[i,2];s:=(s+1)mod 3001;
              inq[p[i,2]]:=true;
            end;
        end;
    inq[x]:=false;
    t:=(t+1)mod 3001;
  until t=s;
//-------------------------------SPFA dis2-----------------------------------
  t:=0;s:=1;
  fillchar(dis2,sizeof(dis2),43);
  dis2[b]:=0;q[0]:=b; inq[b]:=true;
  fillchar(inq,sizeof(inq),false);
  repeat
    x:=q[t];
    for i:=st[x]to st[x+1]-1 do
      if dis2[x]+1<dis2[p[i,2]]then
        begin
          dis2[p[i,2]]:=dis2[x]+1;
          if inq[p[i,2]]=false then
            begin
              q[s]:=p[i,2];s:=(s+1)mod 3001;
              inq[p[i,2]]:=true;
            end;
        end;
    inq[x]:=false;
    t:=(t+1)mod 3001;
  until t=s;
//--------------------------------------------------------------------------
  fillchar(inq,sizeof(inq),true);
  for i:=1 to n do
    begin
      for j:=1 to n+1 do
        if(d[j]=1)and(inq[j])then
          break;
      if j=n+1 then break;
      x:=j;
      inq[j]:=false;
      for j:=st[x]to st[x+1]-1do
      if inq[p[j,2]]then
        dec(d[p[j,2]]);
    end;
  for i:=1 to n do
  if(inq[i])and(dis1[i]<dis2[i])then
    cannotcatch;
  for i:=1 to n do
    if(dis1[i]<dis2[i])and(dis2[i]>ans)then
      ans:=dis2[i];
  writeln(ans);
  close(input);close(output);
end.