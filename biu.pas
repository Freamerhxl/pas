var map:array[0..2000,0..2000]of longint;
    ans:array[0..2000]of longint;
    p:array[0..2000000,1..2]of longint;
    f,d:array[0..100000]of longint;
    link:array[0..100000]of boolean;
    i,j,n,m,x,y,fy,l,cc:longint;
    flag:boolean;
function get(x:longint):longint;
begin
  if f[x]=x then exit(x);
  f[x]:=get(f[x]);
  exit(f[x]);
end;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;k:=ans[(t+w)>>1];
  repeat
    while ans[i]>k do inc(i);
    while ans[j]<k do dec(j);
    if i<=j then
      begin
        ans[0]:=ans[i];ans[i]:=ans[j];ans[j]:=ans[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
procedure dfs(now,x:longint);
var i:longint;
begin
  for i:=1 to cc do
    if(ans[i]>0)and(map[now,i]=0)and(i<>x)then
      begin
        inc(ans[x],ans[i]);
        ans[i]:=0;
        dfs(i,x);
      end;
end;
begin
  assign(input,'biu.in');reset(input);
  assign(output,'biu.out');rewrite(output);
  readln(n,m);
  for i:=1 to m do
    begin
      readln(x,y);
      inc(d[x]);inc(d[y]);
      p[i,1]:=x;p[i,2]:=y;
    end;
  x:=1;y:=d[1];
  for i:=2 to n do
    if d[i]<y then
      begin
        x:=i;y:=d[i];
      end;
  fillchar(link,sizeof(link),true);
  for i:=1 to m do
    begin
      if(p[i,1]=x)or(p[i,2]=x)then
        begin
          link[p[i,2]]:=false;link[p[i,1]]:=false;
        end;
    end;
  link[x]:=true;
  cc:=1;
  for i:=1 to n do
    if link[i]then
      begin
      f[i]:=1;
      inc(ans[1]);
      end;
  for i:=1 to n do
    if f[i]=0 then
      begin
        inc(cc);
        f[i]:=cc;
        ans[cc]:=1;
      end;
  for i:=1 to m do
    begin
      if f[p[i,1]]<>f[p[i,2]]then
        begin
          inc(map[f[p[i,1]],f[p[i,2]]]);
          inc(map[f[p[i,2]],f[p[i,1]]]);
        end;
    end;
  for i:=2 to cc do
    begin
      if map[1,i]<ans[1]then map[1,i]:=0;
      if map[i,1]<ans[1]then map[i,1]:=0;
    end;
  for i:=1 to cc do
    map[i,i]:=1;

  for i:=1 to cc do
    if ans[i]>0 then
      dfs(i,i);
  sort(1,cc);
  while ans[cc]=0 do dec(cc);
  writeln(cc);
  for i:=cc downto 1 do
    write(ans[i],' ');
   close(input);close(output);
end.