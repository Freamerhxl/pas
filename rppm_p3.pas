var p:array[0..1001]of longint;
    f:array[0..1001,0..200]of int64;
    i,j,n,m,k:longint;
    ans,out:int64;
    flag:boolean;
function mi(n:int64):int64;
var t:int64;
begin
  if n=1 then exit(2);
  if n=0 then exit(1);
  t:=mi(n>>1);
  t:=(t*t)mod 2011;
  if odd(n)then t:=(t*2)mod 2011;
  exit(t);
end;
begin
  m:=2;readln(n);
  p[1]:=2;p[2]:=3;
  for i:=5 to n do
    begin
      flag:=true;
      for j:=1 to m do
       if i mod p[j]=0 then
         begin
           flag:=false;
           break;
         end;
      if flag then
        begin
          inc(m);p[m]:=i;
        end;
    end;
  for i:=1 to m do
   f[p[i],i]:=1;
  for i:=1 to n-2 do
  for j:=1 to m do
  if f[i,j]>0 then
  for k:=j to m do
   if i+p[k]<=n then
   f[i+p[k],k]:=f[i+p[k],k]+f[i,j];
  for i:=1 to m do
    ans:=ans+f[n,i];
  out:=mi(ans);
  writeln(out);
end.