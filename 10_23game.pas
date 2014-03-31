const p=100000000;
type arr=array[0..301]of longint;
var f:array[0..101,0..21,0..101]of longint;
    a:array[0..101]of longint;
    i,j,n,k,m,pp:longint;
    ans:arr;
begin
  assign(input,'game.in');reset(input);
  assign(output,'game.out');rewrite(output);
  readln(n,m);
  f[0][0][0]:=1;f[0][0][1]:=1;a[0]:=-maxlongint;
  for i:=1 to n do read(a[i]);
  for i:=1 to n do
    begin
      for j:=0 to i-1 do
      if a[i]>=a[j]then
      begin
      for k:=0 to m-1 do
      begin
        if f[j][k][0]>f[i][k+1][0]then
          f[i][k+1][0]:=f[j][k][0];
        for pp:=1 to f[i][k+1][0]do
         f[i][k+1][pp]:=f[i][k+1][pp]+f[j][k][pp];
        for pp:=1 to f[i][k+1][0] do
          begin
            f[i][k+1][pp+1]:=f[i][k+1][pp+1]+f[i][k+1][pp]div p;
            f[i][k+1][pp]:=f[i][k+1][pp]mod p;
          end;
        while f[i][k+1][f[i][k+1][0]+1]>0 do
          inc(f[i][k+1][0]);
      end;
      end;
      for j:=1 to i-1 do
      if a[i]=a[j]then
      for k:=1 to m do
      f[j][k][0]:=0;
    end;
  for i:=1 to n do
    begin
      if f[i][m][0]>ans[0]then ans[0]:=f[i][m][0];
      for j:=1 to ans[0]do
        ans[j]:=ans[j]+f[i][m][j];
      for j:=1 to  ans[0]do
        begin
          ans[j+1]:=ans[j+1]+ans[j]div p;
          ans[j]:=ans[j]mod p;
        end;
      while ans[ans[0]+1]>0 do inc(ans[0]);
    end;
  write(ans[ans[0]]);
  for i:=ans[0]-1 downto 1 do
    begin
      if ans[i]<10000000 then write(0);
      if ans[i]<1000000 then write(0);
      if ans[i]<100000 then write(0);
      if ans[i]<10000 then write(0);
      if ans[i]<1000 then write(0);
      if ans[i]<100 then write(0);
      if ans[i]<10 then write(0);
      write(ans[i]);
    end;
  close(input);close(output);
end.