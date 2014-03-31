var st:ansistring;
    n,i:longint;
begin
  readln(n);
  for i:=1 to n do
    begin
      readln(st);
      if odd(ord(st[length(st)])) then
        writeln('odd')
      else writeln('even');
    end;
end.