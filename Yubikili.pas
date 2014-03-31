var n,i,ans:longint;
    st:ansistring;
begin
  assign(input,'Yubikili.in');reset(input);
  assign(output,'Yubikili.out');rewrite(output);
  readln(n);
  readln(st);
  ans:=0;
  for i:=1 to length(st)do
    begin
      ans:=ans*10+ord(st[i])-48;
      ans:=ans mod n;
    end;
  if ans=0 then ans:=n;
  writeln(ans);
  close(input);reset(output);
end.