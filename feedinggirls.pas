type node=record
      x,y:extended;
end;
var a:array[0..10001]of node;
    stack:array[0..10001]of node;
    i,j,n,top:longint;
    ans:extended;
function pm(a,b,c:node):extended;
begin
  exit((a.x-c.x)*(b.y-c.y)-(a.y-c.y)*(b.x-c.x));
end;
function dis(a,b:node):extended;
begin
  exit(sqrt(sqr(a.x-b.x)+sqr(a.y-b.y)));
end;
procedure sort(t,w:longint);
  var i,j:longint;
      mid:node;
      temp:extended;
begin
  i:=t;j:=w;mid:=a[(t+w)>>1];
  repeat
    temp:=pm(a[i],mid,a[1]);
    while(temp>0)or((temp=0)and(dis(a[i],a[1])<dis(mid,a[1])))do begin inc(i);temp:=pm(a[i],mid,a[1]);end;
    temp:=pm(a[j],mid,a[1]);
    while(temp<0)or((temp=0)and(dis(a[j],a[1])>dis(mid,a[1])))do begin dec(j);temp:=pm(a[j],mid,a[1]);end;
     if i<=j then
       begin
         a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
         inc(i);dec(j);
       end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'input.txt');reset(input);
  readln(n);
  for i:=1 to n do
    begin
      read(a[i].x,a[i].y);
      if(a[i].y<a[1].y)or((a[i].y=a[1].y)and(a[i].x<a[1].x))then
        begin
          a[0]:=a[i];a[i]:=a[1];a[1]:=a[0];
        end;
    end;
  sort(2,n);
  stack[1]:=a[1];stack[2]:=a[2];top:=2;
  for i:=3 to n do
    begin
      while (top>1)and(pm(a[i],stack[top],stack[top-1])>=0)do dec(top);
      inc(top);
      stack[top]:=a[i];
    end;
  for i:=2 to top do
    ans:=ans+dis(stack[i],stack[i-1]);
  ans:=ans+dis(stack[top],stack[1]);
  writeln(ans:0:2);
end.