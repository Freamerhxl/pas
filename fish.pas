var f:array[0..30,0..303]of longint;
    a,b,c:array[0..31]of longint;
    i,j,n,m,k,p,ans:longint;
begin
  assign(input,'input.txt');reset(input);
  assign(output,'output.txt');rewrite(output);
  readln(n);
  readln(m);
  m:=m*12;
  for i:=1 to n do
   read(a[i]);
  for i:=1 to n do
   read(b[i]);
  for i:=2 to n do
   read(c[i]);
  fillchar(f,sizeof(f),$f7);
  f[0,0]:=0;
  k:=0;
  for i:=1 to n do
  begin
  for j:=0 to m do
  if f[i-1,j]>=0 then
    begin
      for p:=0 to m do
      if(j+c[i]+p<=m)then
      if f[i-1,j]+p*a[i]-(p*(p-1)div 2)*b[i]>f[i,j+c[i]+p]then
      f[i,j+c[i]+p]:=f[i-1,j]+p*a[i]-(p*(p-1)div 2)*b[i];
    end;
  end;
  for i:=1 to n do
  for j:=0 to m do
    if f[i,j]>ans then ans:=f[i,j];
  writeln(ans);
  close(input);close(output);
end.