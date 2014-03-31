var f:array[0..10,0..600,0..100]of int64;
    map:array[0..600,0..600]of longint;
    d,c:array[0..600]of longint;
    can:array[0..601]of boolean;
    i,j,n,m,k,p:longint;
    ans:int64;
begin
  assign(input,'King.in');reset(input);
  assign(output,'King.out');rewrite(output);
  readln(n,m);
  for i:=0 to 1<<n-1 do
  if(i and(i>>1)=0)and(i and(i>>1)=0)then
    can[i]:=true;
  for i:=0 to 1<<n-1 do
  if can[i]then
  for j:=0 to 1<<n-1 do
  if(can[j])and(i and j=0)and(i and(j<<1)=0)and(i and(j>>1)=0)then
    begin
      inc(d[i]);
      map[i,d[i]]:=j;
    end;
  for i:=1to 1<<n-1 do
    for j:=1 to n do
     if(i and(1<<(j-1))>0)then
       inc(c[i]);
  f[0,0,0]:=1;
  for i:=1 to n do
  for j:=0 to 1<<n-1 do
  if can[j]then
  for k:=0 to m do
  if f[i-1,j,k]>0 then
  for p:=1 to d[j]do
  if k+c[map[j,p]]<=m then
  f[i,map[j,p],k+c[map[j,p]]]:=f[i,map[j,p],k+c[map[j,p]]]+f[i-1,j,k];
  for i:=0 to 1<<n-1 do
   ans:=ans+f[n,i,m];
  writeln(ans);
  close(input);close(output);
end.