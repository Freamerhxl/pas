var i,j,n,m,t,p:longint;
    ans,s:extended;
begin
  assign(input,'Dota.in');reset(input);
  assign(output,'Dota.out');rewrite(output);
  readln(t,n,m);
  ans:=0;
  for i:=1 to t do
    begin
      readln(s,p);
      ans:=ans+((((100-p)/100)*s)/m);
    end;
  writeln(ans:0:6);
  close(input);close(output);
end.