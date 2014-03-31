var f,a:array[0..5001]of longint;
    ff:array[0..5001]of qword;
    i,j,n,ans:longint;
    total:qword;
begin
  assign(input,'c.in');reset(input);
  assign(output,'c.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  f[0]:=0;
  ff[0]:=1;
  a[0]:=-maxlongint;
  for i:=1 to n do
  begin
    for j:=i-1 downto 0 do
      if(a[j]<a[i])and(f[j]+1>f[i])then
        f[i]:=f[j]+1;
    if f[i]>ans then ans:=f[i];

    for j:=i-1 downto 0 do
      begin
        if(a[j]<a[i])and(f[j]=f[i]-1)then
          ff[i]:=ff[i]+ff[j];

        if(a[i]=a[j])and(f[j]=f[i])then
          ff[j]:=0;
      end;
  end;
  for i:=1 to n do
    if f[i]=ans then
      total:=total+ff[i];
  writeln(ans);
  writeln(total);
  close(input);close(output);
end.