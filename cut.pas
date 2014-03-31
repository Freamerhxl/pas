var a,b:array[0..2001]of longint;
      f:array[0..2001,0..2001]of int64;
    i,j,n,m:longint;
    ans:int64;
begin
  assign(input,'cut.in');reset(input);
  assign(output,'cut.out');rewrite(output);
  readln(n,m);
  for i:=1 to n-1 do
    begin
      read(a[i]);
      for j:=i downto 2 do
        if a[j]>a[j-1]then
          begin
            a[j]:=a[j]xor a[j-1];
            a[j-1]:=a[j]xor a[j-1];
            a[j]:=a[j]xor a[j-1];
          end
        else break;
    end;
  for i:=1 to m-1 do
    begin
      read(b[i]);
      for j:=i downto 2 do
        if b[j]>b[j-1]then
          begin
            b[j]:=b[j]xor b[j-1];
            b[j-1]:=b[j]xor b[j-1];
            b[j]:=b[j]xor b[j-1];
          end
        else break;
    end;
  fillchar(f,sizeof(f),43);
  f[0,0]:=0;
  for i:=0 to n-1 do
  for j:=0 to m-1 do
    begin
      if i>0 then
      if f[i-1,j]+a[i]*(j+1)<f[i,j]then f[i,j]:=f[i-1,j]+a[i]*(j+1);
      if j>0 then
      if f[i,j-1]+b[j]*(i+1)<f[i,j]then f[i,j]:=f[i,j-1]+b[j]*(i+1);
    end;
  writeln(f[n-1,m-1]);
  close(input);close(output);
end.
