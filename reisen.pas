program Iambj11;
var f:array[0..501,0..51,0..51]of double;
    map:array[0..51,0..51]of boolean;
    d:array[0..51]of longint;
    ans:array[0..51]of double;
    i,j,n,m,k,t,x,y:longint;
begin
  assign(input,'reisen.in');reset(input);
  assign(output,'reisen.out');rewrite(output);
  readln(n,m,t);
  for i:=1 to m do
    begin
      readln(x,y);
      if(map[x,y]=false)and(x<>y)then
        begin
          map[x,y]:=true;
          inc(d[x]);
        end;
    end;
  for i:=1to n do
    inc(d[i]);
  f[0,0,1]:=1;
  for i:=1 to t do
  for j:=1 to n do
  for x:=0 to n do
  for y:=1 to n do
  if(y=j)and(f[i-1,x,y]>0)then
    begin
      if map[y,x]then
        f[i,x,j]:=f[i,x,j]+f[i-1,x,y]/(d[y]-1)
      else
        f[i,x,j]:=f[i,x,j]+f[i-1,x,y]/(d[y]);
    end
  else
  if(map[y,j])and(x<>j)and(y<>j)and(f[i-1,x,y]>0)then
    begin
      if map[y,x]then
        f[i,y,j]:=f[i,y,j]+f[i-1,x,y]/(d[y]-1)
      else
        f[i,y,j]:=f[i,y,j]+f[i-1,x,y]/(d[y]);
    end;
  for i:=1 to n do
  for j:=0 to n do
    ans[i]:=ans[i]+f[t,j,i];
  for i:=1 to n do
    writeln(ans[i]*100:0:3);
  close(input);close(output);
end.