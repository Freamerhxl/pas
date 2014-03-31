var f:array[0..301,0..301]of longint;
    map:array[0..301,0..301]of longint;
    i,j,n,m,k,p,x,y,flag:longint;
begin
  readln(n,m);
  for i:=1 to m do
    begin
      readln(x,y);
      if x<y then
        begin
          x:=x xor y;y:=x xor y;x:=x xor y;
        end;
      inc(map[x,0]);map[x,map[x,0]]:=y;
    end;
  fillchar(f,sizeof(f),43);
  flag:=f[0,0];
  f[0,0]:=0;
  for i:=1to n do
    begin
      f[i]:=f[i-1];
      for j:=1 to map[i,0]do
      for p:=0 to n>>1 do
      if f[map[i,j]-1,p]<flag then
      if f[map[i,j]-1,p]+i-map[i,j]-1<f[i,p+1]then
        f[i,p+1]:=f[map[i,j]-1,p]+i-map[i,j]-1;
    end;
  for i:=n>>1 downto 1 do
    if f[n,i]<flag then
      break;
  writeln(i*2,' ',f[n,i]);
end.