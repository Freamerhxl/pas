var f:array[0..100001]of longint;
    a,b:array[0..100001]of longint;
    i,j,n,ans,k:longint;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
begin
  readln(n);
  for i:=1 to n do
    readln(a[i]);
  for j:=1 to n do
    b[j]:=maxlongint;
  b[0]:=-maxlongint-1;
  ans:=0;
  for i:=1 to n do
   begin
     for j:=ans downto 0 do
       if a[i]>=b[j]then break;
     if j+1>ans then ans:=j+1;
     if a[i]<b[j+1]then b[j+1]:=a[i];
   end;
  writeln(n-ans);
end.