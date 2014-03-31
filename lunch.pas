var f:array[0..100001]of longint;
    i,j,n,data,ans:longint;
begin
  assign(input,'lunch.in');reset(input);
  assign(output,'lunch.out');rewrite(output);
  readln(n);
  ans:=0;
  f[0]:=maxlongint;
  for i:=1 to n do
    begin
      read(data);
      for j:=ans downto 0 do
        if data<f[j]then
          break;
      if data>f[j+1]then f[j+1]:=data;
      if j+1>ans then ans:=j+1;
    end;
  writeln(ans);
  close(input);close(output);
end.
