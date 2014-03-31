var ans:array[0..32]of longint;
    n:longint;
    i,j,m:longint;
begin
  readln(n);
  if n=0 then
  writeln(0)
  else
  begin
  m:=0;
  while n<>0 do
    begin
      inc(m);
      ans[m]:=n mod(-2);
      if ans[m]=-1 then
        begin
          ans[m]:=1;
          n:=n-1;
        end;
      n:=n div(-2);
    end;
  for i:=m downto 1 do
    write(ans[i]);
  end;
end.