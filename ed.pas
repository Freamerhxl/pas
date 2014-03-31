var f:array[0..100,1..3]of int64;
    i,j,n:longint;
begin
  assign(input,'ed.in');reset(input);
  assign(output,'ed.out');rewrite(output);
  readln(n);
  if n<=22 then
  begin
  f[0,1]:=1;
  for i:=1 to n do
    begin
      f[i,1]:=f[i-1,1]*2;
      f[i,2]:=f[i-1,1]+f[i-1,2]*4;
    end;
  writeln(f[n,1]/(f[n,1]+f[n,2])*100:0:4,'%');
  end else writeln('0.0000%');
  close(input);close(output);
end.