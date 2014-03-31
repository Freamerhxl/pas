var f:array[0..1100000]of real;
    a:array[0..20,1..2]of longint;
    dis:array[0..21,0..21]of real;
    op,op1:array[0..1100000]of longint;
    i,j,k,n,m,mm,ii,jj:longint;
    temp:real;
    flag:boolean;
begin
  assign(input,'d.in');reset(input);
  assign(output,'d.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    readln(a[i,1],a[i,2]);
  for i:=1 to n do
  for j:=1 to n do
    dis[i,j]:=sqrt(sqr(a[i,1]-a[j,1])+sqr(a[i,2]-a[j,2]));
  for i:=3 to 1<<n-1 do
    begin
      k:=0;
      for j:=1 to n do
        if i and(1<<(j-1))>0 then inc(k);
      if not(odd(k))then
        begin
          inc(m);op[m]:=i;
        end;
    end;
  for i:=1 to 1<<n-1  do
    f[i]:=1e20;
  for k:=1 to m do
  for i:=1 to n do
  if(op[k] and(1<<i-1)=1<<i-1)then
  for j:=i+1 to n do
  if(op[k] and(1<<(j-1))>0)then
  if f[op[k] xor(1<<(i-1))xor(1<<(j-1))]+dis[i,j]<f[op[k]]then
    f[op[k]]:=f[op[k] xor(1<<(i-1))xor(1<<(j-1))]+dis[i,j];
  writeln(f[1<<n-1]:0:2);
  close(input);close(output);
end.