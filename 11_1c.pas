var v:array[0..6]of longint;
    f:array[0..10000001]of longint;
    a:array[0..201,0..6]of longint;
    i,n,j,m,ans,i1,i2,i3,i4,i5,op1,op2:longint;
function get(a,b,c,d,e:longint):longint;
begin
  exit(e*(v[4]+1)*(v[3]+1)*(v[2]+1)*(v[1]+1)+
       d*(v[3]+1)*(v[2]+1)*(v[1]+1)+
       c*(v[2]+1)*(v[1]+1)+
       b*(v[1]+1)+a);
end;
begin
  readln(n,m);
  for i:=1 to m do
    read(v[i]);
  for i:=1 to n do
  for j:=0 to m do
    read(a[i,j]);
  for i:=1 to n do
  for i1:=v[1]downto a[i,1]do
  for i2:=v[2]downto a[i,2]do
  for i3:=v[3]downto a[i,3]do
  for i4:=v[4]downto a[i,4]do
  for i5:=v[5]downto a[i,5]do
    begin
      op1:=get(i1,i2,i3,i4,i5);
      op2:=get(i1-a[i,1],i2-a[i,2],i3-a[i,3],i4-a[i,4],i5-a[i,5]);
      if f[op2]+a[i,0]>f[op1]then
        f[op1]:=f[op2]+a[i,0];
      if f[op1]>ans then ans:=f[op1];
    end;
  writeln(ans);
end.