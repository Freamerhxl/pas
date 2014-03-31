var f:array[0..1,0..201,0..201]of longint;
    a:array[0..201,0..201]of longint;
    b:array[0..1001]of longint;
    i,j,n,l,k,now,last,ans:longint;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
begin
  readln(l,n);
  for i:=1 to l do
  for j:=1 to l do
    read(a[i,j]);
  for i:=1 to l do a[i,i]:=0;
  for i:=1 to n do
    read(b[i]);
  fillchar(f,sizeof(f),63);
  f[0,1,2]:=a[3,b[1]];
  f[0,2,3]:=a[1,b[1]];
  f[0,1,3]:=a[2,b[1]];
  for k:=2 to n do
    begin
      now:=1-now;last:=1-now;
      fillchar(f[now],sizeof(f[now]),63);
      for i:=1 to l do
      if(i<>b[k-1])then
      for j:=1 to l do
      if(i<>j)and(j<>b[k-1])then
        begin
          f[now,i,j]:=fmin(f[now,i,j],f[last,i,j]+a[b[k-1],b[k]]);
          f[now,b[k-1],j]:=fmin(f[now,b[k-1],j],f[last,i,j]+a[i,b[k]]);
          f[now,i,b[k-1]]:=fmin(f[now,i,b[k-1]],f[last,i,j]+a[j,b[k]]);
        end;
    end;
  ans:=maxlongint;
  for i:=1 to l do
  for j:=1 to l do
    if(i<>j)then
      ans:=fmin(ans,f[now,i,j]);
  writeln(ans);
end.