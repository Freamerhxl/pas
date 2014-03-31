var n:longint;
    ans:qword;
begin
  assign(input,'tictac.in');reset(input);
  assign(output,'tictac.out');rewrite(output);
  readln(n);
  if n=1 then
    ans:=1
  else
  ans:=n*n*3+2*n*3+4;
  writeln(ans);
  close(input);close(output);
end.