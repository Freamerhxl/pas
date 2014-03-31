var f,cost,dl,dr:array[0..501,0..501]of longint;
    x,w,c:array[0..501]of longint;
    i,j,n,m,k,p,ans:longint;
begin
  assign(input,'input.txt');reset(input);
  assign(output,'output.txt');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    readln(x[i],w[i],c[i]);
  for i:=1 to n do
    begin
      for j:=i-1 downto 1 do
       dl[i,j]:=dl[i,j+1]+abs(x[i]-x[j])*w[j];
      for j:=i+1 to n do
       dr[i,j]:=dr[i,j-1]+abs(x[i]-x[j])*w[j];
    end;
  for i:=1 to n do
  for j:=i to n do
  begin
    cost[i,j]:=maxlongint;
    for p:=i to j do
    if c[p]+dl[p,i]+dr[p,j]<cost[i,j]then
      cost[i,j]:=c[p]+dl[p,i]+dr[p,j];
  end;
  fillchar(f,sizeof(f),43);
  for i:=1 to n do
  f[1,i]:=cost[1,i];
  for i:=2 to m do
  for j:=i to n do
  for p:=i-1 to j-1 do
  if f[i-1,p]+cost[p+1,j]<f[i,j]then
  f[i,j]:=f[i-1,p]+cost[p+1,j];
  ans:=maxlongint;
  for i:=1 to m do
   if f[i,n]<ans then ans:=f[i,n];
  writeln(ans);
  close(input);close(output);
end.