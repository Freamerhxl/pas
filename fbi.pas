var n1,n2,i:longint;
    ans:qword;
    s:ansistring;
begin
  assign(input,'fbi.in');reset(input);
  assign(output,'fbi.out');rewrite(output);
  readln(s);
  for i:=1 to length(s)do
    if s[i]in['F','f']then
      inc(n1)
    else
    if s[i]in['B','b']then
      inc(n2,n1)
    else
    if s[i]in['I','i']then
      inc(ans,n2);
  writeln(ans);
  close(input);close(output);
end.
