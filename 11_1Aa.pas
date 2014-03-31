const maxn=3001;
var f:array[0..maxn,0..maxn]of integer;
    a:array[0..maxn]of integer;
    i,j,ans,n:integer;
begin
  readln(n);
  for i:=1 to n do
    read(a[i]);
  fillchar(f,sizeof(f),43);
  f[0,n+1]:=0;
  for i:=1 to n do
    begin
      f[i,n+1]:=i;
      f[0,i]:=n-i+1;
    end;
  for i:=1 to n do
  for j:=n downto i do
  begin
  if a[i]=a[j]then
    f[i,j]:=f[i-1,j+1];
  if f[i-1,j+1]+1<f[i,j]then f[i,j]:=f[i-1,j+1]+1;
  if f[i-1,j]+1<f[i,j]then f[i,j]:=f[i-1,j]+1;
  if f[i,j+1]+1<f[i,j]then f[i,j]:=f[i,j+1]+1;
  end;
  ans:=n;
  for i:=1 to n do
   begin
     if f[i,i]<ans then ans:=f[i,i];
     if f[i,i+1]<ans then ans:=f[i,i+1];
   end;
  writeln(ans);
end.