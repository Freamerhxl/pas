var t,i,n:longint;
    a,b,c:array[0..101]of extended;
    can:array[0..101]of boolean;
    map:array[0..101,0..101]of boolean;
    p:array[0..101]of longint;
function link(a,b,c:extended):boolean;
var k:extended;
begin
  if c<1e-6 then exit(true);
  if(b<1e-6)or(a<1e-6)then exit(false);
  k:=c/sin((b/2)*(pi/180));
  if k+c<a+1e-6 then exit(true)
    else exit(false);
end;
function find(x:longint):boolean;
var i:longint;
begin
  for i:=1 to n do
   if(map[x,i])and(can[i])then
     begin
       can[i]:=false;
       if(p[i]=0)or(find(p[i]))then
         begin
           p[i]:=x;exit(true);
         end;
     end;
   exit(false);
end;
function main:boolean;
var i,j:longint;
    flag:boolean;
    max:longint;
begin
  readln(n);
  for i:=1 to n do
    readln(a[i],b[i]);
  for i:=1 to n do
    begin
      readln(c[i]);
    end;
  fillchar(map,sizeof(map),false);
  for i:=1 to n do
  for j:=1 to n do
    if link(a[i],b[i],c[j])then
      map[i,j]:=true;
  max:=0;
  for i:=1 to n do
    p[i]:=0;
  max:=0;
  for i:=1 to n do
    begin
      fillchar(can,sizeof(can),true);
      if find(i)then  inc(max);
    end;
  if max=n then exit(true)
  else exit(false);
end;
begin
  assign(input,'kd.in');reset(input);
  assign(output,'kd.out');rewrite(output);
  readln(t);
  for i:=1 to t do
    if main then
      writeln('Yes!')
    else writeln('No!');
  close(input);close(output);
end.