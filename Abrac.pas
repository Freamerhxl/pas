var a,b,f:array[0..1001]of longint;
    i,m,n,t,ans:longint;
function dp:longint;
var i,j,k:longint;
begin
  read(m);
  for i:=1 to m do read(a[i]);
  read(n);
  for i:=1 to n do read(b[i]);
  for i:=0 to n do f[i]:=0;
  for i:=1 to m do
    begin
      ans:=0;
      for j:=1 to n do
        begin
           if(f[j]>ans)and(a[i]>b[j])then ans:=f[j];
           if(a[i]=b[j])and(ans+1>f[j])then f[j]:=ans+1;
        end;
    end;
  ans:=0;
  for i:=1 to n do
    if f[i]>ans then ans:=f[i];
  exit(ans);
end;
begin
  assign(input,'Abrac.in');reset(input);
  assign(output,'Abrac.out');rewrite(output);
  readln(t);
  for i:=1 to t do
    writeln(dp);
  close(input);close(output);
end.