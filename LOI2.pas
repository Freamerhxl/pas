var n,i:longint;
    y:qword;
begin
  readln(n);
  for i:=trunc(sqrt(n))downto 1 do
    if n mod(i*i)=0 then
      break;
  y:=n div(i*i);
  writeln(n+y+2*trunc(sqrt(qword(n*y))));
end.