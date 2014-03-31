var dp:array[0..301,0..301]of longint;
    data:array[0..301,1..2]of longint;
    i,j,n,m,k,ans,p:longint;
function fmax(a,b:longint):longint;
begin
  if a>b then exit(a)else exit(b);
end;
begin
  assign(input,'energy.in');reset(input);
  assign(output,'energy.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    read(data[i,1]);
  for i:=1 to n-1 do
    data[i,2]:=data[i+1,1];
  data[n,2]:=data[1,1];
  for i:=1 to n do
    data[i+n]:=data[i];
  for i:=2 to n do
    begin
      for j:=1 to n do
        begin
          k:=i+j-1;
          for p:=1 to i-1 do
            dp[i,j]:=fmax(dp[i,j],dp[p,j]+dp[i-p,(j+p-1)mod n+1]+data[j,1]*data[j+p-1,2]*data[k,2]);
        end;
    end;
  for i:=1 to n do
    if dp[n,i]>ans then ans:=dp[n,i];
  writeln(ans);
  close(input);close(output);
end.