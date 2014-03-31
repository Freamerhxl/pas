const g:array[1..4,1..2]of -1..1=((0,1),(0,-1),(1,0),(-1,0));
var a:array[0..1001,0..1001]of char;
    i,j,n,m,k,ans,minx,miny,maxx,maxy:longint;
    z:array[0..1000001,1..2]of longint;
procedure WTF;
begin
  writeln('Bad placement.');
  close(output);close(input);
  halt;
end;
procedure bfs(x,y:longint);
var i,t,s,x1,y1:longint;
begin
  a[x,y]:='.';
  t:=0;s:=1;
  z[0,1]:=x;z[0,2]:=y;
  repeat
    x:=z[t,1];y:=z[t,2];
    for i:=1 to 4 do
      begin
        x1:=x+g[i,1];y1:=y+g[i,2];
        if a[x1,y1]='#' then
          begin
            a[x1,y1]:='.';inc(k);
            if x1>maxx then maxx:=x1;
            if x1<minx then minx:=x1;
            if y1>maxy then maxy:=y1;
            if y1<miny then miny:=y1;
            z[s,1]:=x1;z[s,2]:=y1;
            inc(s);
          end;
      end;
    inc(t);
  until t=s;
end;
begin
  assign(input,'BATTLE.in');reset(input);
  assign(output,'BATTLE.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do begin
  for j:=1 to m do read(a[i,j]);
  readln;
  end;
  for i:=1 to n do
  for j:=1 to m do
    if a[i,j]='#' then
      begin
        minx:=i;maxx:=i;
        miny:=j;maxy:=j;
        k:=1;
        bfs(i,j);
        if(maxx-minx+1)*(maxy-miny+1)=k then inc(ans)
        else WTF;
      end;
  writeln('There are ',ans,' ships.');
  close(input);close(output);
end.