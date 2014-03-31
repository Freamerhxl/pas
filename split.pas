var a,b,c:array[-100..101]of longint;
    n,m,i,j,t1,t2,ans:longint;
begin
  read(n);
  for i:=1 to n do
    read(a[i]);
  for i:=1 to n-1 do
  for j:=1 to n-i do
    if a[j]>a[j+1]then
      begin
        a[j]:=a[j]xor a[j+1];
        a[j+1]:=a[j]xor a[j+1];
        a[j]:=a[j]xor a[j+1];
      end;
  read(m);
  for i:=1 to m do
    read(b[i]);
  for i:=1 to m-1 do
  for j:=1 to m-i do
    if b[j]>b[j+1]then
      begin
        b[j]:=b[j]xor b[j+1];
        b[j+1]:=b[j]xor b[j+1];
        b[j]:=b[j]xor b[j+1];
      end;
  if m>n then
    begin
      m:=m xor n;n:=m xor n;m:=m xor n;
      c:=a;a:=b;b:=c;
    end;
  t1:=1;
  t2:=1;
  while t2<=m do
    begin
      while(a[t1]=b[t2])and(t2<=m)do  begin inc(t1);inc(t2);end;
      if t2>m then break;
      if a[t1]<b[t2]then
        begin
          a[t1+1]:=a[t1+1]+a[t1];inc(t1);inc(ans);
        end
      else
        begin
          a[t1-1]:=b[t2];
          a[t1]:=a[t1]-b[t2];inc(ans);
          dec(t1);
        end;
    end;
  writeln(ans);
end.