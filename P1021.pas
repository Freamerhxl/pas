var a:array[0..10001]of int64;
    i,n:longint;
    ans,dat,sum:int64;
procedure sort(t,w:longint);
var i,j:longint;
    k:int64;
begin
  i:=t;j:=w;
  k:=a[(t+w)>>1];
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
begin
  readln(n);
  for i:=1 to n do
    begin
      read(dat);sum:=sum+dat;
      a[i]:=dat;
    end;
  sort(1,n);
  for i:=1 to n do
    begin
      sum:=sum-a[i];
      ans:=ans+sum-(n-i)*a[i];
    end;
  writeln(ans*2);
end.