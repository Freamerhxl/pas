var f:array[0..601,0..601]of longint;
    i,n,j:longint;
    p,t:int64;
begin
  readln(n);
  p:=maxlongint;
  inc(p,1);
  p:=p;
  for i:=1 to n do  f[1,i]:=1;
  for i:=2 to n do
  begin
  for j:=i-1 downto 1 do
    begin
      t:=f[i,i-j-1];
      t:=t+f[j,i-j];
      f[i,i-j]:=t mod p;
    end;
  t:=f[i,i-1];
  inc(t);
  f[i,i]:=t mod p;
  for j:=i+1 to n do
    f[i,j]:=f[i,j-1];
  end;
  writeln(f[n,n-1]mod p);
end.