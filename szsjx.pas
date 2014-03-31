var f1,f2,a:array[0..36,0..36]of longint;
    i,j,n,flag:longint;
function fmax(a,b:longint):longint;
begin
  if a>b then exit(a)else exit(b);
end;
begin
  readln(n);
  for i:=1 to n do
  for j:=1 to i do
   read(a[i,j]);
  for i:=1 to n do
    f1[n,i]:=a[n,i];
  for i:=n-1 downto 1 do
  for j:=1 to n do
    f1[i,j]:=fmax(f1[i+1,j],f1[i+1,j+1])+a[i,j];
  fillchar(f2,sizeof(f2),$f7);
  f2[n>>1, n>>1]:=f1[n>>1,n>>1];
  for i:=n>>1 downto 2 do
  for j:=1 to i do
    if f2[i,j]>0 then
      begin
        f2[i-1,j]:=fmax(f2[i-1,j],f2[i,j]+a[i-1,j]);
        f2[i-1,j-1]:=fmax(f2[-1,j-1],f2[i,j]+a[i-1,j-1]);
      end;
  writeln(f2[1,1]);
end.