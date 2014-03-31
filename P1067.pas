var f1,f2:array[0..101]of longint;
    a:array[0..101]of longint;
    i,j,n,ans:longint;
begin
  readln(n);
  for i:=1 to n do
    read(a[i]);
  a[0]:=-1;a[n+1]:=-1;
  for i:=1 to n do
  for j:=0 to i-1 do
    if(a[i]>a[j])and(f1[j]+1>f1[i])then
      f1[i]:=f1[j]+1;
  for i:=n downto 1 do
  for j:=n+1 downto i+1 do
    if(a[j]<a[i])and(f2[j]+1>f2[i])then
      f2[i]:=f2[j]+1;
  for i:=1 to n do
    if f1[i]+f2[i]>ans then ans:=f1[i]+f2[i];
  writeln(n-ans+1);
end.