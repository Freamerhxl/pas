var a:array[0..36,0..36]of longint;
    dp:array[0..36,0..36,0..100]of boolean;
    n,i,j,k:longint;
begin
  readln(n);
  for i:=1 to n do
  for j:=1 to i do
    read(a[i,j]);
  for i:=1 to n do
    dp[n,i,a[n,i]mod 100]:=true;
  for i:=n-1 downto 1 do
  for j:=1 to i do
  for k:=0 to 99 do
    dp[i,j,(k+a[i,j])mod 100]:=dp[i+1,j+1,k]or dp[i+1,j,k]or dp[i,j,(k+a[i,j])mod 100];
  for i:=99 downto 0 do
    if dp[1,1,i] then break;
  writeln(i);
end.