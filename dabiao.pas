const need:array[0..9]of integer=(6,2,5,5,4,5,6,3,7,6);
var i:longint;
    a:array[0..22223]of longint;
function work(x:longint):longint;
begin
  work:=0;
  if x<10 then exit(need[x]);
  while x>0 do
    begin
      inc(work,need[x mod 10]);
      x:=x div 10;
    end;
end;
function go(x:longint):longint;
var i,j:longint;
begin
  go:=0;
  for i:=0 to 11111 do
    if a[i]<x then
    for j:=0 to 11111 do
      if a[j]<x-a[i] then
        if(a[i]+a[j]+a[i+j]=x)then
          inc(go);
end;
begin
  assign(output,'matches.pas');rewrite(output);
  for i:=0 to 22222 do
     a[i]:=work(i);
  for i:=5 to 24 do
    writeln('ans[',i,']:=',go(i-4));
  close(output);
end.