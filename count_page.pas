var i,j,n,m,k,p:longint;
    a,op:array[0..10]of longint;
    ans:int64;
begin
  assign(input,'count.in');reset(input);
  assign(output,'count.out');rewrite(output);
  readln(n);
  a[1]:=1;
  for i:=2 to 10 do
    a[i]:=a[i-1]*10;
  k:=n;
  while k>0 do
    begin
      inc(m);
      op[m]:=k mod 10;
      k:=k div 10;
    end;
  k:=0;
  for i:=m downto 1 do
    begin
      p:=k+1;k:=k*10+op[i];
      for j:=1 to op[i]-1 do
        ans:=ans+j*a[i]*p;

      ans:=ans+op[i]*(p-1)*a[i]+op[i]*(n mod a[i]+1);

      for j:=op[i]+1 to 9 do
        ans:=ans+j*(p-1)*a[i];
    end;
  writeln(ans);
  close(input);close(output);
end.