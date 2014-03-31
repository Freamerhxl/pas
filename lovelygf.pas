var map:array[0..251,0..251]of longint;
    dis,p:array[0..251]of longint;
    done:array[0..251]of boolean;
    i,j,n,m,k,ans,x,y,z,ta:longint;
begin
  assign(input,'lovelygf.in');reset(input);
  assign(output,'lovelygf.out');rewrite(output);
  read(n);
  for i:=1 to n do
    read(p[i]);
  fillchar(map,sizeof(map),63);
  readln(m);
  for i:=1 to m do
    begin
      readln(x,y,z);
      if z<map[x,y]then
        begin
          map[x,y]:=z;
          map[y,x]:=z;
        end;
    end;
  ans:=maxlongint;
  for k:=1 to n do
  begin
    fillchar(done,sizeof(done),true);
    done[k]:=false;
    dis:=p;
    dis[k]:=maxlongint;
    ta:=0;
    for i:=1 to n-1 do
      begin
        y:=maxlongint;
        for j:=1 to n do
          if done[j] and(dis[j]<y)then
            begin
              x:=j;y:=dis[j];
            end;
        done[x]:=false;
        if y<maxlongint then ta:=ta+y;
        for j:=1 to n do
          if done[j] and(map[x,j]<dis[j])then
            dis[j]:=map[x,j];
      end;
    if ta<ans then ans:=ta;
  end;
  writeln(ans);
  close(input);close(output);
end.