program aya;
var sum:array[0..1001,0..1001]of longint;
    ans,i,j,n,m,r,c:longint;
begin
  assign(input,'aya.in');reset(input);
  assign(output,'aya.out');rewrite(output);
  readln(n,m,r,c);
  for i:=1 to n do
  for j:=1 to m do
    begin
      read(sum[i,j]);
      sum[i,j]:=sum[i,j]+sum[i,j-1]+sum[i-1,j]-sum[i-1,j-1];
    end;
  for i:=r to n do
  for j:=c to m do
    if(sum[i,j]-sum[i-r,j]-sum[i,j-c]+sum[i-r,j-c]>ans)then
      ans:=sum[i,j]-sum[i-r,j]-sum[i,j-c]+sum[i-r,j-c];
  writeln(ans);
  close(input);close(output);
end.
