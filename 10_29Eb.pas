var f:array[0..21,0..21,0..201]of longint;
    a:array[0..21]of longint;
    n,t,m,i,j,k,op,kk,ans:longint;
function fmax(a,b:longint):longint;
begin
  if a>b then exit(a)else exit(b);
end;
begin
  assign(input,'b.in');reset(input);
  assign(output,'b.out');rewrite(output);
  readln(n,t,m);
  for i:=1 to n do
    read(a[i]);
  fillchar(f,sizeof(f),$f7);
  f[0,1,0]:=0;
  for i:=1 to n do
  for j:=1 to m do
  for k:=0 to t do
  if f[i-1,j,k]>=0 then
    begin
      f[i,j,k]:=fmax(f[i,j,k],f[i-1,j,k]);
      if k+a[i]>t then
        begin
          op:=j+1;kk:=a[i];
        end
      else
        begin
          op:=j;kk:=k+a[i];
        end;
      f[i,op,kk]:=fmax(f[i,op,kk],f[i-1,j,k]+1);
    end;
  for i:=1 to n do
  for j:=1 to m do
  for k:=0 to t do
    if f[i,j,k]>ans then ans:=f[i,j,k];
  writeln(ans);
  close(input);close(output);
end.