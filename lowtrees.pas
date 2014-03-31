var f:array[0..201,0..201]of longint;
    sum:array[0..201]of longint;
    i,j,n,p:longint;
begin
  assign(input,'lowtrees.in');reset(input);
  assign(output,'lowtrees.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      read(sum[i]);
      sum[i]:=sum[i-1]+sum[i];
    end;
    fillchar(f,sizeof(f),63);
    for i:=1 to n do
      f[i,i]:=0;
    for i:=n-1 downto 1 do
    for j:=i+1 to n do
    for p:=i to j-1 do
      if f[i,p]+f[p+1,j]+sum[j]-sum[i-1]<f[i,j]then
        f[i,j]:=f[i,p]+f[p+1,j]+sum[j]-sum[i-1];
  writeln(f[1,n]);
  close(input);close(output);
end.