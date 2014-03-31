var f,a:array[0..100000]of longint;
    i,j,ans,n:longint;
begin
  assign(input,'c.in');reset(input);
  assign(output,'c.out');rewrite(output);
  readln(n);
  fillchar(f,sizeof(f),43);
  f[0]:=-maxlongint;
  for i:=1 to n do
    begin
      read(a[i]);
      for j:=ans downto 0 do
        if a[i]>=f[j]then
          break;
      if j+1>ans then ans:=j+1;
      if a[i]<f[j+1]then f[j+1]:=a[i];
    end;
  writeln(ans);
  close(input);close(output);
end.