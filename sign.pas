var map:array[0..11,0..11]of boolean;
    color:array[0..11]of integer;
    i,j,n,m,k,ans,x,y:longint;
procedure work(x,now:longint);
var i,j:longint;
begin
  if x>n then
    begin
      if now<=ans then exit;
      for i:=1 to n do
        if color[i]=1 then
        for j:=1 to n do
        if(map[i,j])and(color[j]=1)then exit;
        ans:=now;exit;
    end;
  color[x]:=1;
  work(x+1,now+1);
  color[x]:=2;
  work(x+1,now);
end;
begin
  assign(input,'sign.in');reset(input);
  assign(output,'sign.out');rewrite(output);
  readln(m,n);
  for i:=1 to m do
    begin
      readln(x,y);
      map[x,y]:=true;
      map[y,x]:=true;
    end;
  for i:=1 to n do map[i,i]:=false;
  work(1,0);
  writeln(ans);
  close(input);close(output);
end.