var f:array[0..1001,0..1001,1..2]of int64;
    sum:array[0..1001]of longint;
    d:array[0..1001]of longint;
    i,j,n,m,k:longint;
    temp:int64;
begin
  readln(n);
  readln(m);
  for i:=1 to n do
    begin
      readln(d[i],k);
      sum[i]:=sum[i-1]+k;
    end;
  fillchar(f,sizeof(f),63);f[m,m,1]:=0;f[m,m,2]:=0;
  for i:=m downto 1 do
  for j:=m to n do
    begin
      if i<m then
        begin
          temp:=f[i+1,j,1]+int64((d[i+1]-d[i])*(sum[n]-sum[j]+sum[i]));
          if temp<f[i,j,1]then f[i,j,1]:=temp;
          temp:=f[i+1,j,2]+int64((d[j]-d[i])*(sum[n]-sum[j]+sum[i]));
          if temp<f[i,j,1]then f[i,j,1]:=temp;
        end;
      if j>m then
        begin
          temp:=f[i,j-1,1]+int64((d[j]-d[i])*(sum[n]-sum[j-1]+sum[i-1]));
          if temp<f[i,j,2]then f[i,j,2]:=temp;
          temp:=f[i,j-1,2]+int64((d[j]-d[j-1])*(sum[n]-sum[j-1]+sum[i-1]));
          if temp<f[i,j,2]then f[i,j,2]:=temp;
        end;
    end;
  if f[1,n,1]<f[1,n,2]then
    writeln(f[1,n,1])
  else
    writeln(f[1,n,2]);
end.
