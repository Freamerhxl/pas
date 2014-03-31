var n,count:longint;
    ch:char;
begin
  assign(input,'write.in');reset(input);
  assign(output,'write.out');rewrite(output);
  readln(n);
  while not eof do
    begin
      read(ch);
      if(count>=n)and(ch in[' ','.',',','!','?'])then
        begin
          writeln;
          count:=0;
        end;
      write(ch);
      inc(count);
    end;
  close(output);close(input);
end.