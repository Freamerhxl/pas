const p=19920726;
var a,sum:array[0..31]of longint;
    ans,i,n,j:longint;
procedure dfs(x,now,tot:longint);
begin
  if now+n-x+1<=ans then exit;
  if tot+sum[x]<p then exit;
//  if tot=p then
    begin
      if now>ans then
      ans:=now;
    end;
  if x>n then exit;
  if tot+a[x]<=p then
    dfs(x+1,now+1,tot+a[x]);
  dfs(x+1,now,tot);
end;
begin
  assign(input,'gift.in');reset(input);
  assign(output,'gift.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  for i:=1 to n-1 do
  for j:=1 to n-i do
    if a[j]<a[j+1]then
      begin
        a[j]:=a[j]xor a[j+1];
        a[j+1]:=a[j]xor a[j+1];
        a[j]:=a[j]xor a[j+1];
      end;
  sum[n]:=a[n];
  for i:=n-1 downto 1 do
    sum[i]:=sum[i+1]+a[i];
  i:=1;
//  while a[i]>p do inc(i);
  dfs(1,0,0);
  writeln(ans);
  close(input);close(output);
end.