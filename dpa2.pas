const cost:array[0..4,0..4]of byte=((1,2,2,2,2),(2,1,3,4,3),(2,3,1,3,4),(2,4,3,1,3),(2,3,4,3,1));
var f:array[0..10001,0..5]of longint;
    a:array[0..10001]of integer;
    i,j,n,ans:longint;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
begin
  assign(input,'a.in');reset(input);
  assign(output,'a.out');rewrite(output);
  readln(n);
  if n=1 then
    writeln(2)
  else
    begin
      fillchar(f,sizeof(f),43);
      ans:=f[0,0];
      for i:=1 to n do
        read(a[i]);
      f[1,0]:=cost[0,a[1]];
      f[2,0]:=f[1,0]+cost[a[1],a[2]];
      f[2,a[1]]:=f[1,0]+cost[0,a[2]];
      for i:=3 to n do
      for j:=0 to 4 do
        begin
          f[i,j]:=fmin(f[i,j],f[i-1,j]+cost[a[i-1],a[i]]);
          f[i,a[i-1]]:=fmin(f[i,a[i-1]],f[i-1,j]+cost[j,a[i]]);
        end;
      for i:=0 to 4 do
        ans:=fmin(ans,f[n,i]);
      writeln(ans);
    end;
  close(input);close(output);
end.