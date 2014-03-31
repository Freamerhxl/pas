var f:array[0..1<<16,0..17]of longint;
    map:array[0..17,0..17]of longint;
    i,j,n,m,k,p,ans:longint;
begin
  assign(input,'minsum.in');reset(input);
  assign(output,'minsum.out');rewrite(output);
  readln(n);
  for i:=1 to n do
  for j:=1 to n do
    read(map[i,j]);
  fillchar(f,sizeof(f),43);
  for i:=1 to n do
    f[1<<(i-1),i]:=0;
  for i:=1 to 1<<n-1 do
  for j:=1 to n do
  if i and(1<<(j-1))>0then
  for p:=1 to n do
  if i and(1<<(p-1))=0 then
  if f[i,j]+map[j,p]<f[i or(1<<(p-1)),p]then
   f[i or(1<<(p-1)),p]:=f[i,j]+map[j,p];
  ans:=maxlongint;
  for i:=1 to n do
   if f[1<<n-1,i]<ans then
     ans:=f[1<<n-1,i];
  writeln(ans);
  close(input);close(output);
end.