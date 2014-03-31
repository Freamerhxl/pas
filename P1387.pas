var f:array[0..3,0..50001]of longint;
    sum:array[0..50001]of longint;
    i,j,n,m,ans:longint;
begin
  readln(n);
  for i:=1 to n do
    begin
      read(sum[i]);
      sum[i]:=sum[i-1]+sum[i];
    end;
  readln(m);
  for i:=1 to 3 do
    for j:=(i-1)*m+m to n do
      begin
        f[i,j]:=f[i,j-1];
        if f[i-1,j-m]+sum[j]-sum[j-m]>f[i,j]then
          f[i,j]:=f[i-1,j-m]+sum[j]-sum[j-m];
        if f[i,j]>ans then ans:=f[i,j];
      end;
  writeln(ans);
end.
