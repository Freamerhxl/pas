type arr=array[0..101]of longint;
const p=100000;
var f:array[0..101,0..50]of arr;
    t,ans:arr;
    a,pp:array[0..101,0..51]of longint;
    i,j,n,m,k:longint;
function mul(a:arr;b:longint):arr;
var i,j:longint;
begin
  fillchar(mul,sizeof(mul),0);
  for i:=1 to a[0]do
    begin
      mul[i]:=a[i]*b;
    end;
  mul[0]:=a[0];
  for i:=1 to mul[0]do
    begin
      mul[i+1]:=mul[i+1]+mul[i]div p;
      mul[i]:=mul[i]mod p;
    end;
  while mul[mul[0]+1]>0 do inc(mul[0]);
end;
function compare(a,b:arr):boolean;
var i:longint;
begin
  if b[0]>a[0]then exit(true)
  else if a[0]>b[0]then exit(false);
  for i:=a[0]downto 1 do
    if b[i]>a[i]then exit(true)
    else if a[i]>b[i]then exit(false);
  exit(false);
end;
procedure dfs(x,m:longint);
begin
  if x=1 then
    begin
      write(a[x,m],' ');
      exit;
    end;
  dfs(x-1,pp[x,m]);
  if x=n then
    writeln(A[x,m])
  else write(a[x,m],' ');
end;
begin
  readln(n);
  for i:=1 to n do
    begin
      read(a[i,0]);
      for j:=1 to a[i,0]do
        read(a[i,j]);
    end;
  for i:=1 to a[1,0]do
    begin
      f[1,i,0]:=1;
      f[1,i,1]:=1;
    end;
  for i:=2 to n do
  for j:=1 to a[i,0]do
  for k:=1 to a[i-1,0]do
    begin
      t:=mul(f[i-1,k],abs(a[i,j]-a[i-1,k]));
      if compare(f[i,j],t)then
        begin
          pp[i,j]:=k;
          f[i,j]:=t;
        end;
    end;
  for i:=1 to a[n,0]do
  if compare(ans,f[n,i])then
    begin
      ans:=f[n,i];
      k:=i;
    end;
  write(ans[ans[0]]);
  for i:=ans[0]-1 downto 1  do
    begin
      if ans[i]<10000 then write(0);
      if ans[i]<1000 then write(0);
      if ans[i]<100 then write(0);
      if ans[i]<10 then write(0);
      write(ans[i]);
    end;
  writeln;
  dfs(n,k);
end.