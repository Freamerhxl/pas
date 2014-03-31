var t,c,q:array[0..5001]of longint;
      f:array[0..5001]of longint;
    i,j,n,s,now,last,ans,flag,k:longint;
begin
  readln(n);readln(s);
  for i:=1 to n do
    begin
     readln(t[i],c[i]);
     t[i]:=t[i-1]+t[i];
     c[i]:=c[i-1]+c[i];
    end;
  fillchar(f,sizeof(f),63);
  f[n+1]:=0;
  for i:=n downto 1 do
  for j:=n+1 downto i+1  do
    if f[j]+(s+t[j-1]-t[i-1])*(c[n]-c[i-1])<f[i]then
      f[i]:=f[j]+(s+t[j-1]-t[i-1])*(c[n]-c[i-1]);
  writeln(f[1]);
end.