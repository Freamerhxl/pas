var a:array[0..1001,0..1001]of int64;
    c:array[0..1001,0..1001]of boolean;
    i,j,n,m,k,x,y,aa,bb,cc:longint;
    ans:qword;
begin
  assign(input,'training.in');reset(input);
  assign(output,'training.out');rewrite(output);
  readln(n,m,k);
  for i:=1 to k do
    begin
      readln(x,y);c[x,y]:=true;
      a[x,y]:=1;
    end;
  for i:=1 to n do
  for j:=m downto 1 do
     a[i,j]:=a[i,j]+a[i-1,j]+a[i,j+1]-a[i-1,j+1];
  for i:=1 to n do
  for j:=1 to m do
    if c[i,j]then
      ans:=ans+a[i-1,j+1];
  writeln(ans);
  close(input);
  close(output);
end.