var f:array[0..31,0..31]of qword;
    i,j,n,m,k:longint;
    ans:qword;
begin
  assign(input,'chessman.in');reset(input);
  assign(output,'chessman.out');rewrite(output);
  readln(n,m);
  for i:=0 to m do
   f[1,i]:=1;
  for i:=1 to n do
  for j:=0 to m do
  for k:=0 to j do
  f[i,j]:=f[i,j]+f[i-1,k];
  for i:=0 to m do
    ans:=ans+f[n,i];
  writeln(ans);
  close(input);close(output);
end.