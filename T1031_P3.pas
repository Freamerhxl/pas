var p,color:array[0..80001,1..3]of longint;
    done:array[0..80001]of boolean;
    d:array[0..201]of longint;
    map:array[0..201,0..201]of longint;
    i,j,n,m,k,id,x,y:longint;
procedure error;
begin
  writeln('Your hero has fallen!');
  halt;
end;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;
  k:=p[(t+w)>>1,1];
  repeat
    while p[i,1]>k do inc(i);
    while p[j,1]<k do dec(j);
    if i<=j then
      begin
        p[0]:=p[i];p[i]:=p[j];p[j]:=p[0];
        color[0]:=color[i];color[i]:=color[j];color[j]:=color[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'T1031_P3.in');reset(input);
  assign(output,'T1031_P3.out');rewrite(output);
  readln(n);
  readln(id,x,y);
  while id<>0 do
    begin
      inc(m);p[m,1]:=id;pm[m,2]:=x;pm[m,2]:=y;
      readln(id,x,y);
    end;
  sort(1,m);
  for i:=1 to n do
    if odd(i)then error;
  close(input);close(output);
end.