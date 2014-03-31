var a:array[0..10001]of longint;
    i,n,k,op:longint;
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
begin
  readln(n,k);
  for i:=1 to n do read(a[i]);
  sort(1,n);
  op:=a[n-k+1]-a[k];
  if op<2 then
    writeln('NO')
  else
    begin
      for i:=2 to round(sqrt(op))do
        if op mod i=0 then
          begin
            writeln('NO');
            writeln(op);
            halt;
          end;
      writeln('YES');
    end;
  writeln(op);
end.