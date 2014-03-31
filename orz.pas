var f:array[0..2501]of longint;
    sum:array[0..2501,1..2]of longint;
    i,j,n,m,a,b:longint;
begin
  assign(input,'orz.in');reset(input);
  assign(output,'orz.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    begin
      readln(a);
      sum[i]:=sum[i-1];
      inc(sum[i,a]);
    end;
  fillchar(f,sizeof(f),43);
  f[0]:=0;
  for i:=1 to n do
   for j:=0 to i-1 do
   if f[j]+1<f[i]then
     begin
       a:=sum[i,1]-sum[j,1];
       b:=sum[i,2]-sum[j,2];
       if(a=0)or(b=0)or(abs(a-b)<=m)then
         f[i]:=f[j]+1;
     end;
  writeln(f[n]);
  close(input);close(output);
end.