var f:array[0..2001,0..501]of longint;
    a:array[0..2001]of longint;
    i,j,n,k,m:longint;
function fmax(a,b:longint):longint;
begin
  if a>b then exit(a)else exit(b);
end;
begin
  readln(n,m);
  for i:= 1 to n do
    readln(a[i]);
  fillchar(f,sizeof(f),$f7);
  f[0,0]:=0;
  for i:=0 to n-1 do
  for j:=0 to m do
    if f[i,j]>=0 then
      begin
        if j<m then
          begin
            f[i+1,j+1]:=fmax(f[i+1,j+1],f[i,j]+a[i+1]);
            if(i+j<=n)and(j>0)then
              f[i+j,0]:=fmax(f[i+j,0],f[i,j]);
            if j=0 then
              f[i+1,0]:=fmax(f[i,j],f[i+1,0]);
          end
        else
        if i+m<=n then
          f[i+m,0]:=fmax(f[i+m,0],f[i,j])
      end;
  writeln(f[n,0]);
end.