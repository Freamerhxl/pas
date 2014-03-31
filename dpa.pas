var f:array[0..1001,0..1001]of longint;
    i,j,k,ans,n,m:longint;
function fmin(a,b:longint):longint;
begin
  if a<b then exit(a)else exit(b);
end;
begin
  assign(input,'a.in');reset(input);
  assign(output,'a.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
  for j:=1 to m do
    begin
       read(k);
       if k=1 then
        f[i,j]:=fmin(f[i-1,j],fmin(f[i,j-1],f[i-1,j-1]))+1;
       if f[i,j]>ans then ans:=f[i,j];
    end;
  writeln(ans);
  close(input);close(output);
end.
