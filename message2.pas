var dp:array[0..51,0..51,0..51,0..51]of integer;
    a:array[0..51,0..51]of integer;
    i,j,n,m,k,ii,jj:longint;
function fmax(a,b:longint):longint;
begin
  if a>b then exit(a)else exit(b);
end;
begin
  assign(input,'message.in');reset(input);
  assign(output,'message.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
  for j:=1 to m do
   read(a[i,j]);
  fillchar(dp,sizeof(dp),$f7);
  dp[1,1,1,1]:=0;
  for i:=1 to n do
  for j:=1 to m do
  for ii:=1 to n do
  for jj:=1 to m do
  if(i+j=ii+jj)then
  if(i<>ii)or(j<>jj)then
    begin
      if dp[i-1,j,ii-1,jj]+a[i,j]+a[ii,jj]>dp[i,j,ii,jj]then
        dp[i,j,ii,jj]:=dp[i-1,j,ii-1,jj]+a[i,j]+a[ii,jj];

      if dp[i-1,j,ii,jj-1]+a[i,j]+a[ii,jj]>dp[i,j,ii,jj]then
        dp[i,j,ii,jj]:=dp[i-1,j,ii,jj-1]+a[i,j]+a[ii,jj];

      if dp[i,j-1,ii-1,jj]+a[i,j]+a[ii,jj]>dp[i,j,ii,jj]then
        dp[i,j,ii,jj]:=dp[i,j-1,ii-1,jj]+a[i,j]+a[ii,jj];

      if dp[i,j-1,ii,jj-1]+a[i,j]+a[ii,jj]>dp[i,j,ii,jj]then
        dp[i,j,ii,jj]:=dp[i,j-1,ii,jj-1]+a[i,j]+a[ii,jj];
    end;
  writeln(dp[n-1,m,n,m-1]);
  close(input);close(output);
end.