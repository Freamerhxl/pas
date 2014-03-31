type point=^node;
     node=record
       x:longint;
       next:point;
end;
var f:array[0..1501,1..3]of longint;
    son:array[0..1501]of point;
    i,j,n,k,x,y:longint;
    p:point;
function fmin(a,b:longint):longint;
begin
  if a<b then exit(a)else exit(b);
end;
procedure treedp(x:integer);
var p:point;
    temp:integer;
begin
  if son[x]=nil then
    begin
      f[x,1]:=1;f[x,2]:=n*2;f[x,3]:=0;
      exit;
    end;
  p:=son[x];
  temp:=maxint;
  while p<>nil do
    begin
      treedp(p^.x);
      inc(f[x,1],fmin(fmin(f[p^.x,1],f[p^.x,2]),f[p^.x,3]));
      inc(f[x,2],fmin(f[p^.x,1],f[p^.x,2]));
      inc(f[x,3],f[p^.x,2]);
      temp:=fmin(temp,f[p^.x,1]-fmin(f[p^.x,1],f[p^.x,2]));
      p:=p^.next;
    end;
  inc(f[x,1]);inc(f[x,2],temp);
end;
begin
  assign(input,'virus.in');reset(input);
  assign(output,'virus.out');rewrite(output);
  readln(n);
  while not eof do
  begin
      read(x,k);
      for j:=1 to k do
        begin
          read(y);new(p);p^.x:=y;
          p^.next:=son[x];son[x]:=p;
        end;
      readln;
  end;
  treedp(0);
  writeln(fmin(f[0,1],f[0,2]));
  close(input);close(output);
end.