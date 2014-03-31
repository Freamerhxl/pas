type node=record
      x,y:longint;
//      z:real;
end;
var f:Array[0..101,0..101]of longint;
     a,b:array[-1..101]of node;
    can:array[0..101]of boolean;
    out,temp:array[0..31]of node;
    i,j,n,m,k,ans,p,x,y,now:longint;
function pm(a,b,c:node):longint;
begin
  exit((a.x-c.x)*(b.y-c.y)-(b.x-c.x)*(a.y-c.y));
end;
procedure sort(t,w:longint);
var i,j,k:longint;
    mid:node;
begin
  mid:=a[(t+w)>>1];
  i:=t;j:=w;
  repeat
    k:=pm(a[i],mid,a[0]);
    while k>0 do begin inc(i);k:=pm(a[i],mid,a[0]);end;
    k:=pm(a[j],mid,a[0]);
    while k<0 do begin dec(j);k:=pm(a[j],mid,a[0]);end;
    if i<=j then
      begin
        a[-1]:=a[i];a[i]:=a[j];a[j]:=a[-1];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'POLYGON.in');reset(input);
  assign(output,'POLYGON.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(a[i].x,a[i].y);
    end;
  ans:=0;
  a[-1].x:=0;a[-1].y:=0;
  sort(1,n);
  a[0].x:=0;a[0].y:=0;
  for i:=1 to n do
   f[0,i]:=2;
  for i:=2 to n do
  for j:=1 to i-1 do
  for p:=0 to j-1 do
  if f[p,j]>0 then
   if(pm(a[i],a[j],a[p])<0)and(f[p,j]+1>f[j,i])then
     begin
       f[j,i]:=f[p,j]+1;
       if f[j,i]>ans then ans:=f[j,i];
     end;
  writeln(ans);
  close(input);close(output);
end.