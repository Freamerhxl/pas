var dp:array[0..32001]of longint;
    data:array[0..100,0..4,1..2]of longint;
    ct:array[0..101]of longint;
    i,j,n,m,k,x,y,z:longint;
begin
  assign(input,'budget.in');reset(input);
  assign(output,'budget.out');rewrite(output);
  readln(n,m);
  for i:=1 to m do
    begin
      readln(x,y,z);
      if z>0 then
        begin
          inc(ct[z]);
          data[z,ct[z],1]:=x;
          data[z,ct[z],2]:=x*y;
          data[i,0,2]:=-1;
        end
      else
        begin
          data[i,0,1]:=x;
          data[i,0,2]:=x*y;
        end;
    end;
  for i:=1 to m do
    begin
      if ct[i]=2 then
        begin
          data[i,3,1]:=data[i,1,1]+data[i,2,1];
          data[i,3,2]:=data[i,1,2]+data[i,2,2];
          inc(ct[i]);
        end;
      for j:=1 to ct[i]do
        begin
          inc(data[i,j,1],data[i,0,1]);
          inc(data[i,j,2],data[i,0,2]);
        end;
    end;
  fillchar(dp,sizeof(dp),$f7);
  dp[0]:=0;
  for i:=1 to m do
  if data[i,0,2]>=0 then
  for j:=n downto 0 do
  if(dp[j]>=0)then
  for k:=0 to ct[i]do
    if(j+data[i,k,1]<=n)then
      if dp[j]+data[i,k,2]>dp[j+data[i,k,1]]then
        dp[j+data[i,k,1]]:=dp[j]+data[i,k,2];
  z:=0;
  for i:=0 to n do
    if dp[i]>z then z:=dp[i];
  writeln(z);
  close(input);close(output);
end.