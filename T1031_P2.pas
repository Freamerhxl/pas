var a,b:array[0..100001]of longint;
    i,j,n:longint;
    ans:int64;
procedure swap(var a,b:longint);
var t:longint;
begin
  t:=a;a:=b;b:=t;
end;
procedure qsort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;
  k:=b[(t+w)>>1];
  repeat
    while(b[i]<k)do inc(i);
    while(b[j]>k)do dec(j);
    if i<=j then
      begin
        swap(a[i],a[j]);swap(b[i],b[j]);
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then qsort(t,j);
  if i<w then qsort(i,w);
end;
procedure sort(t,w:longint);
var i,t1,t2,mid:longint;
begin
  if t>=w then exit;
  mid:=(t+w)>>1;
  sort(t,mid);sort(mid+1,w);
  for i:=t to w do
    b[i]:=a[i];
  t1:=t;t2:=mid+1;
  for i:=t to w do
    begin
      if((b[t2]<b[t1])or(t1>mid))and(t2<=w)then
        begin
          a[i]:=b[t2];inc(t2);inc(ans,mid-t1+1);
        end
      else
        begin
          a[i]:=b[t1];inc(t1);
        end;
    end;
end;
begin
  readln(n);
  for i:=1 to n do
    read(b[i]);
  for i:=1 to n do
    read(a[i]);
  qsort(1,n);
  sort(1,n);
  writeln(ans);
end.
