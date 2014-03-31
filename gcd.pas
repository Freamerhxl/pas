var i,j:longint;
function gcd(a,b:longint):longint;
begin
  if b=0 then exit(a)
  else exit(gcd(b,a mod b));
end;
begin
  j:=6;
  for i:=4 to 24 do
    if i in[1,13,17,19,23]=false then
      j:=(j*i)div gcd(j,i);
  writeln(j);
end.