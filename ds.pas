var i:longint;
begin
  assign(output,'data.in');rewrite(output);
  writeln(10,' ',50);
  for i:=1 to 50 do
    write(1000,' ');
  close(output);
end.