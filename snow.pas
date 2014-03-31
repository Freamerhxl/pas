var path:array[0..301,0..1001,0..2]of longint;
    ct:array[0..301]of longint;
    done:array[0..301]of boolean;
    dis,id,dis1,dis2,od:array[0..301]of longint;
    i,j,n,a,b,c,m,ans,y,x,flag:longint;
function fmin(a,b:longint):longint;
begin
  if a<b then exit(a)else exit(b);
end;
function dij(x:longint):longint;
var dis,id,p:array[0..301]of longint;
    i,j,a,b,cannt:longint;
begin
  dij:=flag;
  fillchar(dis,sizeof(dis),43);
  fillchar(done,sizeof(done),false);
  dis[x]:=0;done[x]:=true;
  a:=x;
  for i:=1 to n do
    begin
      for j:=1 to ct[a] do
        if(od[path[a,j,1]]>1)then
        if(dis[a]+path[a,j,2]<dis[path[a,j,1]])and(done[path[a,j,1]]=false)then
          begin
            dis[path[a,j,1]]:=dis[a]+path[a,j,2];
            p[path[a,j,1]]:=a;
            id[path[a,j,1]]:=path[a,j,0];
          end;
        b:=maxlongint;
        for j:=0 to n-1 do
          if(dis[j]<b)and(done[j]=false)then
            begin
              b:=dis[j];
              a:=j;
            end;
        done[a]:=true;
        if a=1 then break;
    end;
  a:=1;
  if dis[1]=flag then exit(flag);
  while a<>x do
    begin
      cannt:=id[a];
      a:=p[a];
    end;
  fillchar(dis,sizeof(dis),43);
  fillchar(done,sizeof(done),false);
  dis[x]:=0;done[x]:=true;
  a:=x;
  for i:=1 to n do
    begin
      for j:=1 to ct[a] do
        if(path[a,j,0]<>cannt)then
        if(dis[a]+path[a,j,2]<dis[path[a,j,1]])and(done[path[a,j,1]]=false)then
          begin
            dis[path[a,j,1]]:=dis[a]+path[a,j,2];
            p[path[a,j,1]]:=a;
            id[path[a,j,1]]:=path[a,j,0];
          end;
        b:=maxlongint;
        for j:=0 to n-1 do
          if(dis[j]<b)and(done[j]=false)then
            begin
              b:=dis[j];
              a:=j;
            end;
        done[a]:=true;
        if a=1 then break;
    end;
  exit(dis[1]);
end;
begin
  assign(input,'snow.in');reset(input);
  assign(output,'snow.out');rewrite(output);
  readln(n,m);
  for i:=1 to m do
    begin
      readln(a,b,c);
      inc(od[a]);
      inc(ct[a]);
      path[a,ct[a],0]:=i;
      path[a,ct[a],1]:=b;
      path[a,ct[a],2]:=c;
    end;
  fillchar(dis,sizeof(dis),43);
  flag:=dis[0];
  od[1]:=3;
  dis[0]:=0;
  done[0]:=true;a:=0;
  for i:=1 to n do
    begin
      for j:=1 to ct[a] do
        if(od[path[a,j,1]]>1)then
        if(dis[a]+path[a,j,2]<dis[path[a,j,1]])and(done[path[a,j,1]]=false)then
          dis[path[a,j,1]]:=dis[a]+path[a,j,2];
      b:=maxlongint;
      for j:=1 to n-1 do
        if(dis[j]<b)and(done[j]=false)then
          begin
            a:=j;
            b:=dis[j];
          end;
      done[a]:=true;
    end;
  ans:=maxlongint;
  for x:=1 to n-1 do
   if(x<>1)and(dis[x]<flag)then
     ans:=fmin(ans,dij(x)+dis[x]);
  writeln(ans);
  close(input);close(output);
end.