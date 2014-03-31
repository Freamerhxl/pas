type arr=array[1..2,1..2]of longint;
const p=32768;
var gg,g:arr;
    n:longint;
function mul(n:longint):arr;
var i,j,k:longint;
    t:arr;
begin
  if n=1 then exit(g);
  fillchar(mul,sizeof(mul),0);
  t:=mul(n>>1);
  for i:=1 to 2 do
  for j:=1 to 2 do
  for k:=1 to 2 do
    mul[i,j]:=(mul[i,j]+(t[i,k]*t[k,j])mod p)mod p;
  if odd(n)then
    begin
      mul[1,1]:=mul[1,1]+mul[1,2];mul[1,2]:=mul[1,1]-mul[1,2];mul[1,1]:=mul[1,1]mod p;
      mul[2,1]:=mul[2,1]+mul[2,2];mul[2,2]:=mul[2,1]-mul[2,2];mul[2,1]:=mul[2,1]mod p;
    end;
end;
begin
  readln(n);
  if n<=2 then
    writeln(1)
  else
    begin
       g[1,1]:=1;g[1,2]:=1;
       g[2,1]:=1;g[2,2]:=0;
       gg:=mul(n-2);
       writeln((gg[1,1]+gg[1,2])mod p);
    end;
end.