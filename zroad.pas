var map:array[0..21,0..201]of longint;
    now,a:array[0..21]of longint;
    ans,dis:array[0..201]of longint;
    ct:array[0..21,0..201]of longint;
    can:array[0..21]of boolean;
    maxl,i,j,n,m,k,t,x,y,z:longint;
    flag:boolean;
procedure dfs(x,op,nt:longint);
var i:longint;
    flag:boolean;
begin
  flag:=true;
  if op>maxl then
    maxl:=op;
  if odd(op)=false then
    begin
      if op>ans[0]then
        begin
          ans[0]:=op;
          for i:=1 to op do
            ans[i]:=now[i];
        end
      else
        if op=ans[0]then
          begin
            for i:=1 to op do
              if now[i]<ans[i]then
                begin
                  flag:=true;break;
                end
              else
              if ans[i]<now[i]then
                begin
                  flag:=false;break;
                end;
            if flag then
            for i:=1 to op do
            ans[i]:=now[i];
          end;
    end;
  for i:=1 to map[x,0]do
  if(can[map[x,i]])and(nt+ct[x,i]<=t)then
    begin
      flag:=false;
      can[map[x,i]]:=false;now[op+1]:=a[map[x,i]];
      dfs(map[x,i],op+1,nt+ct[x,i]);
      can[map[x,i]]:=true;
    end;
end;
begin
  assign(input,'zroad.in');reset(input);
  assign(output,'zroad.out');rewrite(output);
  readln(n,m,t);
  for i:=1 to n do
    read(a[i]);
  for i:=1 to m do
    begin
      readln(x,y,z);
      inc(map[x,0]);
      map[x,map[x,0]]:=y;
      ct[x,map[x,0]]:=z;
    end;
  fillchar(can,sizeof(can),true);
  now[1]:=a[1];can[1]:=false;
  fillchar(dis,sizeof(dis),43);
  dis[1]:=0;
  dfs(1,1,0);
  can[1]:=true;
  writeln(maxl);
  for i:=1 to ans[0] do
    write(ans[i],' ');
  writeln;
  x:=1;
  for i:=2 to ans[0]do
    if ans[i]>ans[x]then
      x:=i;
  flag:=true;
  z:=0;
  for i:=1 to ans[0]do
   if odd(i)then
     z:=z-(ans[x]-ans[i])
   else z:=z+(ans[x]-ans[i]);
  if z=0 then writeln('YES')
  else writeln('NO');
  close(input);close(output);
end.