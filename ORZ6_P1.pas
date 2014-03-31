  var a:array[0..100001]of longint;
    i,j,n,m,x1,y1,x2,y2,ans:longint;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;k:=a[(t+w)>>1];
  repeat
    while a[i]<k do inc(i);
    while a[j]>k do dec(j);
    if i<=j then
      begin
        a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
function get1(x:longint):longint;
var t,w,mid:longint;
begin
  t:=1;w:=n;
  mid:=(t+w)>>1;
  get1:=0;
  repeat
    if a[mid]>=x then
      begin
        get1:=mid;
        w:=mid-1;
      end
    else t:=mid+1;
    mid:=(t+w)>>1;
  until t>w;
end;
function get2(x:longint):longint;
var t,w,mid:longint;
begin
  t:=1;w:=n;
  mid:=(t+w)>>1;
  get2:=0;
  repeat
    if a[mid]<=x then
      begin
        get2:=mid;
        t:=mid+1;
      end
    else w:=mid-1;
    mid:=(t+w)>>1;
  until t>w;
end;
begin
  readln(n);
  for i:=1 to n do
    read(a[i]);
  sort(1,n);
  readln(m);
  for i:=1 to m do
    begin
      readln(x1,y1,x2,y2);
      if x1>x2 then
        begin
          x1:=x1 xor x2;x2:=x1 xor x2;x1:=x1 xor x2;
          y1:=y1 xor y2;y2:=y1 xor y2;y1:=y1 xor y2;
        end;
      if((y1>0)and(y2>0))or((y1<0)and(y2<0))then
      writeln(abs(x1-x2)+abs(y1-y2))
      else
      begin
        j:=get1(x1);ans:=maxlongint;
        if(j>0)then
          ans:=abs(x1-a[j])+abs(x2-a[j])+abs(y1)+abs(y2);
        j:=get2(x2);
        if(j>0)and(abs(x1-a[j])+abs(x2-a[j])+abs(y1)+abs(y2)<ans)then
          ans:=abs(x1-a[j])+abs(x2-a[j])+abs(y1)+abs(y2);
        writeln(ans);
      end;
    end;
end.
