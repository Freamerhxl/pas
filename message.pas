var dp:array[0..200,0..51,0..51]of longint;
     a:array[0..51,0..51]of longint;
    i,j,n,m,step,temp:longint;
begin
  assign(input,'message.in');reset(input);
//  assign(output,'message.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
  for j:=1 to m do
    read(a[i,j]);
  for step:=1 to n+m do
  for i:=1 to n do
  for j:=1 to m do
    begin
      temp:=dp[step-1,i,j];
      if dp[step-1,i-1,j-1]>temp then temp:=dp[step-1,i-1,j-1];
      if dp[step-1,i-1,j]>temp   then temp:=dp[step-1,i-1,j];
      if dp[step-1,i,j-1]>temp   then temp:=dp[step-1,i,j-1];
      dp[step,i,j]:=temp+a[i,j];
    end;
  writeln(dp[n+m,n,m]);
  close(input);close(output);
end.