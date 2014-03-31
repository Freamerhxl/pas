const g:array[1..4,1..2]of -1..1=((0,-1),(0,1),(1,0),(-1,0));
var done:array[0..101,0..101]of boolean;
    map:array[0..101,0..101]of char;
    q:array[0..10001,1..2]of longint;
    maxx,maxy,minx,miny,i,j,k,n,m,ans1,ans2:longint;
procedure bfs(x,y:longint);
var t,s,i,x1,y1,x2,y2:longint;
begin
  q[0,1]:=x;q[0,2]:=y;k:=1;
  t:=0;s:=1;
  done[x,y]:=true;
  repeat
    x1:=q[t,1];y1:=q[t,2];
    for i:=1 to 4 do
      begin
        x2:=x1+g[i,1];
        y2:=y1+g[i,2];
        if(map[x2,y2]='#')and(done[x2,y2]=false)then
          begin
            inc(k);
            q[s,1]:=x2;q[s,2]:=y2;
            inc(s);
            if x2>maxx then maxx:=x2;
            if x2<minx then minx:=x2;
            if y2>maxy then maxy:=y2;
            if y2<miny then miny:=y2;
            done[x2,y2]:=true;
          end;
      end;
    inc(t);
  until t=s;
end;
begin
  assign(input,'satel.in');reset(input);
  assign(output,'satel.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do begin
  for j:=1 to m do read(map[i,j]);
  readln;
  end;
  for i:=1 to n do
  for j:=1 to m do
  if(done[i,j]=false)and(map[i,j]='#')then
    begin
      maxx:=i;minx:=i;
      maxy:=j;miny:=j;
      bfs(i,j);
      if k=(maxx-minx+1)*(maxy-miny+1)then inc(ans1)
      else inc(ans2);
    end;
  writeln(ans1);
  writeln(ans2);
  close(input);close(output);
end.
