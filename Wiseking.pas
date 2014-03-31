const p=10000000;
type arr=array[0..20]of longint;
var i,j,k,n,m,now,last,op:longint;
    f:array[0..101,0..500]of arr;
function add(a,b:arr):arr;
var i:longint;
begin
{  if f[i1,j1][0]=0 then exit(f[i2,j2]);
  if f[i1,j1][0]>f[i2,j2][0]then add[0]:=f[i1,j1][0]
    else add[0]:=f[i2,j2][0];
  fillchar(add,sizeof(add),0);
  for i:=1 to add[0]do
    add[i]:=f[i1,j1][i]+f[i2,j2][i]; }
  fillchar(add,sizeof(add),0);
  if a[0]>b[0]then add[0]:=a[0]else add[0]:=b[0];
  for i:=1 to add[0]do
    add[i]:=a[i]+b[i];
  for i:=1 to add[0]do
    begin
      add[i+1]:=add[i+1]+add[i]div p;
      add[i]:=add[i]mod p;
    end;
  if add[add[0]+1]>0 then inc(add[0]);
end;
begin
  assign(input,'Wiseking.in');reset(input);
  assign(output,'Wiseking.out');rewrite(output);
  readln(n,m);
  if m<2*n then
    writeln(0)
  else
    begin
      for i:=2 to m do
        begin
          f[1][i][0]:=1;
          f[1][i][1]:=1;
        end;
      for i:=2 to n do
        begin
          f[i,2*i][0]:=1;f[i,2*i][1]:=1;
          for j:=2*i+1 to m do
            f[i,j]:=add(f[i-1,j-2],f[i,j-1]);
        end;
      write(f[n][m][f[n,m][0]]);
      for i:=f[n,m][0]-1 downto 1 do
        begin
          if f[n,m,i]<1000000 then write(0);
          if f[n,m,i]<100000 then write(0);
          if f[n,m,i]<10000 then write(0);
          if f[n,m,i]<1000 then write(0);
          if f[n,m,i]<100 then write(0);
          if f[n,m,i]<10 then write(0);
          write(f[n,m,i]);
        end;
    end;
  close(input);close(output);
end.