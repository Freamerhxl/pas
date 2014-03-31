var f:array[0..11,0..101,0..101]of longint;
    data:array[0..101,0..3]of longint;
    g:array[0..11,0..101]of longint;
    i,j,n,m,a,b,x,ans,y:longint;
begin
  assign(input,'soultap.in');reset(input);
  assign(output,'soultap.out');rewrite(output);
  readln(n,m,a,b);
  for i:=1 to n do
    begin
      readln(data[i,1],data[i,2],x,data[i,3]);
      inc(g[x,0]);g[x,g[x,0]]:=i;
    end;
  fillchar(f,sizeof(f),$f7);
  for i:=0 to m do
    f[i,0,0]:=0;
  for i:=1 to m do
  begin
  f[i]:=f[i-1];
  for j:=1 to g[i,0]do
  for x:=a downto data[g[i,j],1]do
  for y:=b downto data[g[i,j],2]do
  if(f[i-1,x-data[g[i,j],1],y-data[g[i,j],2]]>=0)then
  if(f[i-1,x-data[g[i,j],1],y-data[g[i,j],2]]+data[g[i,j],3]>f[i,x,y])then
    begin
      f[i,x,y]:=f[i-1,x-data[g[i,j],1],y-data[g[i,j],2]]+data[g[i,j],3];
      if f[i,x,y]>ans then ans:=f[i,x,y];
    end;
  end;
  writeln(ans);
  close(input);close(output);
end.