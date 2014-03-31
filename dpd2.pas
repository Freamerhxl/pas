var f:array[0..16,0..10,0..10,0..10,0..10]of extended;
    done:array[0..16,0..10,0..10,0..10,0..10]of boolean;
    sum:array[0..10,0..10,0..10,0..10]of longint;
    a:array[0..10,0..10]of longint;
    i,j,n,ii,jj,x,y:longint;
    avg:real;
function dp(n,x1,y1,x2,y2:longint):extended;
var i,j,k:longint;
    t1,t2,temp:extended;
begin
  done[n,x1,y1,x2,y2]:=true;
  temp:=1e20;
  if((x2-x1+1)*(y2-y1+1)<n)then
    begin
      f[n,x1,y1,x2,y2]:=1e20;
      exit(f[n,x1,y1,x2,y2])
    end;
  if n=1 then
    begin
      f[n,x1,y1,x2,y2]:=sqr(sum[x1,y1,x2,y2]-avg);
//      writeln(sum[x1,y1,x2,y2]);
      exit(f[n,x1,y1,x2,y2]);
    end;
  for k:=1 to n-1 do
    begin
      for i:=x1 to x2-1 do
        begin
          if done[k,x1,y1,i,y2]then t1:=f[k,x1,y1,i,y2]
          else t1:=dp(k,x1,y1,i,y2);
          if done[n-k,i+1,y1,x2,y2]then t2:=f[n-k,i+1,y1,x2,y2]
          else t2:=dp(n-k,i+1,y1,x2,y2);
          if t1+t2<temp then temp:=t1+t2;
        end;
      for i:=y1 to y2-1 do
        begin
          if done[k,x1,y1,x2,i]then t1:=f[k,x1,y1,x2,i]
          else t1:=dp(k,x1,y1,x2,i);

          if done[n-k,x1,i+1,x2,y2]then t2:=f[n-k,x1,i+1,x2,y2]
          else t2:=dp(n-k,x1,i+1,x2,y2);
          if t1+t2<temp then temp:=t1+t2;
        end;
    end;
  f[n,x1,y1,x2,y2]:=temp;
  exit(temp);
end;
begin
  readln(x,y,n);
  for i:=1to x do
  for j:=1to y do
    read(a[i,j]);
  for i:=1 to x do
  for j:=1 to y do
  for ii:=i to x do
  for jj:=j to y do
    sum[i,j,ii,jj]:=sum[i,j,ii-1,jj]+sum[i,j,ii,jj-1]-sum[i,j,ii-1,jj-1]+a[ii,jj];
  avg:=sum[1,1,x,y]/n;
  dp(n,1,1,x,y);
  writeln(sqrt(f[n,1,1,x,y]/n):0:2);
end.