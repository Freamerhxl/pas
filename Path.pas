var f:array[0..51,0..51,0..51]of longint;
    ans:array[0..51,0..51]of extended;
    i,j,k,n,m,p,x,y,z:longint;
begin
  assign(input,'Path.in');reset(input);
  assign(output,'Path.out');rewrite(output);
  readln(n,m);
  fillchar(f,sizeof(f),63);
  for i:=1to m do
    begin
      readln(x,y,z);
      if z<f[x,y,1]then
        f[x,y,1]:=z;
    end;
  for p:=2 to n do
  for k:=1 to n do
  for i:=1 to n do
  for j:=1 to n do
  begin
  if(f[i,k,p-1]+f[k,j,1]<f[i,j,p])then
    f[i,j,p]:=f[i,k,p-1]+f[k,j,1];
  end;
  for i:=0 to n do
  for j:=0 to n do
    ans[i,j]:=10e10;

  for i:=1 to n do
  for j:=1 to n do
  if(i<>j)then
  for p:=1 to n do
  if(f[i,j,p]<f[0,0,0])and(f[i,j,p]/p<ans[i,j])then
    ans[i,j]:=f[i,j,p]/p;
  readln(m);
  for i:=1 to m do
    begin
      readln(x,y);
      if ans[x,y]=ans[0,0]then
        writeln('OMG!')
      else
        writeln(ans[x,y]:0:3);
    end;
  close(input);close(output);
end.
