const maxn=1000001;
var f:array[0..maxn]of longint;
    i,j,n,m,a,b:longint;
begin
  assign(input,'STEP.in');reset(input);
  assign(output,'STEP.out');rewrite(output);
  readln(n,m);
  readln(a,b);
  f[n]:=1;
  for i:=n downto m+1 do
    begin
      if i-a>=m then
        f[i-a]:=f[i-a]+f[i];
      if i-b>=m then
        f[i-b]:=f[i-b]+f[i];
    end;
  writeln(f[m]);
  close(input);close(output);
end.