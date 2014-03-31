type arr=array[1..2,1..2]of int64;
var g,gg,tt:arr;
    n,m,a,b,i:longint;
    ans:int64;
function mul(n:longint):arr;
var t:arr;
    i,j,k:integer;
begin
  if n=1 then exit(g);
  t:=mul(n>>1);
  mul:=tt;
  for i:=1 to 2 do
  for j:=1 to 2 do
  for k:=1 to 2 do
   mul[i,j]:=(mul[i,j]+(t[i,k]*t[k,j])mod m)mod m;
  if odd(n)then
    begin
      t:=tt;
      for i:=1 to 2 do
      for j:=1 to 2 do
      for k:=1 to 2 do
        t[i,j]:=(t[i,j]+(mul[i,k]*g[k,j])mod m)mod m;
      exit(t);
    end;
end;
begin
  readln(a,b);
  readln(n,m);
  if n=0 then
    begin
      writeln(0);
    end
  else
    begin
      g[1,1]:=a;g[1,2]:=1;
      g[2,1]:=0;g[2,2]:=1;
      tt[1,1]:=0;tt[1,2]:=0;
      tt[2,1]:=0;tt[2,2]:=0;
      gg:=mul(n);
      ans:=(gg[1,2]*b)mod m;
      writeln(ans mod m);
    end;
end.