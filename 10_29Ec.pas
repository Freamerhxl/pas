var f:array[0..1024,0..1024]of int64;
    i,j,n,t,k:longint;
    ans,dam,r,g,b:int64;
begin
  assign(input,'c.in');reset(input);
  assign(output,'c.out');rewrite(output);
  readln(n,r,g,b,t);
  for i:=1 to n do
    begin
      for j:=0 to i do
        begin
          k:=i-j;
          if k>0 then
          begin
          dam:=(n-i)*b*j*g;
          if f[i-1,j]+dam>f[i,j]then f[i,j]:=f[i-1,j]+dam;
          end;
          if j>=1 then
          begin
          dam:=(n-i)*(t+b*k)*g;
          if f[i-1,j-1]+dam>f[i,j]then f[i,j]:=f[i-1,j-1]+dam;
          end;
          dam:=(n-i)*(t+b*k)*r;
          if f[i,j]+dam>ans then ans:=f[i,j]+dam;
        end;
    end;
  writeln(ans);
  close(input);close(output);
end.