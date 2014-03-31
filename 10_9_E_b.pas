var f:array[0..40001]of boolean;
    a,h:array[0..10001]of longint;
    c:Array[0..10001]of boolean;
    n,tc,i,j,th,ta,m,t:longint;
procedure sort(t,w:longint);
  var i,j,k:longint;
begin
  i:=t;j:=w;
  k:=a[(t+w)>>1];
  repeat
    while a[i]<k do inc(i);
    while a[j]>k do dec(j);
    if i<=j then
      begin
        a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
        h[0]:=h[i];h[i]:=h[j];h[j]:=h[0];
        c[0]:=c[i];c[i]:=c[j];c[j]:=c[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  readln(n);
  m:=0;
  for i:=1 to n do
    begin
      readln(th,ta,tc);
      if th*tc>=ta then
        begin
          inc(m);
          a[m]:=ta;h[m]:=th;
          c[m]:=true;
        end
      else
        begin
          t:=1;
          while tc-t>=0 do
            begin
              inc(m);a[m]:=ta;h[m]:=th*t;
              tc:=tc-t;t:=t*2;
            end;
          if tc>0 then
            begin
              inc(m);a[m]:=ta;h[m]:=th*tc;
            end;
        end;
    end;
  sort(1,m);
  f[0]:=true;
  for i:=1 to m do
    if c[i]then
      begin
        for j:=0 to a[i]-h[i]do
          f[j+h[i]]:=f[j]or f[j+h[i]];
      end
    else
      begin
        for j:=a[i]downto h[i]do
          f[j]:=f[j]or f[j-h[i]];
      end;
   for i:=40000 downto 0 do
     if f[i]then break;
   writeln(i);
end.