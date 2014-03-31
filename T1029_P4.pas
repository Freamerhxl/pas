var p:array[0..12001,1..3]of longint;
    f,count:array[0..6001]of longint;
    i,t,n,ans,x,y:longint;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;k:=p[(t+w)>>1,3];
  repeat
     while p[i,3]<k do inc(i);
     while p[j,3]>k do dec(j);
     if i<=j then
       begin
         p[0]:=p[i];p[i]:=p[j];p[j]:=p[0];
         inc(i);dec(j);
       end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
function get(x:longint):longint;
begin
  if f[x]=x then exit(x);
  f[x]:=get(f[x]);
  exit(f[x]);
end;
procedure main;
var i,j,m,k,t:longint;
begin
  readln(n);
  for i:=1 to n-1 do
    readln(p[i,1],p[i,2],p[i,3]);
  for i:=1 to n do
    begin
      count[i]:=1;
      f[i]:=i;
    end;
  sort(1,n-1);
  ans:=0;
  for i:=1 to n-1 do
    begin
      x:=get(p[i,1]);y:=get(p[i,2]);
      ans:=ans+(p[i,3]+1)*(count[x]*count[y]-1);
      inc(count[x],count[y]);
      f[y]:=x;
    end;
  writeln(ans);
end;
begin
  assign(input,'T1029_p4.in');reset(input);
  assign(output,'T1029_p4.out');rewrite(output);
  readln(t);
  for i:=1 to t do
    main;
  close(input);close(output);
end.