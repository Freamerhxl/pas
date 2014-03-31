const go:array[1..8,1..2]of -1..1=((-1,0),(-1,1),(0,1),(1,1),(1,0),(1,-1),(0,-1),(-1,-1));
var id:array[0..1001,0..1001]of longint;
    dis:array[-1..1000000]of integer;
    map:array[0..1001,0..1001]of byte;
    q:array[0..1000000,1..2]of integer;
    i,j,n,m,k,x,y,mm:longint;
    ch:char;
procedure bfs(xx,yy,nid:longint);
var t,s,i,x,y,x1,y1:longint;
begin
  t:=0;s:=1;
  id[xx,yy]:=nid;
  q[0,1]:=xx;q[0,2]:=yy;
  repeat
     x:=q[t,1];y:=q[t,2];
     for i:=1 to 8 do
       begin
         x1:=x+go[i,1];y1:=y+go[i,2];
         if map[x1,y1]=map[x,y]then
           begin
             if id[x1,y1]=0 then
               begin
                 id[x1,y1]:=m;
                 q[s,1]:=x1;q[s,2]:=y1;  inc(s);
               end;
           end
         else
         if dis[id[x1,y1]]+1<dis[m]then dis[m]:=dis[id[x1,y1]]+1;
       end;
     inc(t);
  until t=s;
end;
begin
  assign(input,'river.in');reset(input);
  assign(output,'river.out');rewrite(output);
  readln(n,mm);
  for i:=1 to n do
  begin
  for j:=1 to n do
    begin
      read(ch);if ch='1' then map[i,j]:=1 else map[i,j]:=0;
    end;
  readln;
  end;
  for i:=0 to n+1 do
    begin
      id[i,0]:=-1;id[0,i]:=-1;
      id[n+1,i]:=-1;id[i,n+1]:=-1;

      map[i,0]:=2;map[0,i]:=2;
      map[n+1,i]:=2;map[i,n+1]:=2;
   end;
  m:=0;fillchar(dis,sizeof(dis),43);
  dis[-1]:=0;
  for i:=1 to n do
  for j:=1 to n do
    if id[i,j]=0 then
      begin
        inc(m);
        bfs(i,j,m);
      end;
  for i:=1 to mm-1 do
    begin
      readln(x,y);
      write(dis[id[x,y]]>>1,' ');
    end;
  readln(x,y);
  writeln(dis[id[x,y]]>>1);
  close(input);close(output);
end.
