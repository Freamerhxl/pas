var f:array[0..16,0..8,0..8,0..8,0..8]of extended;
    done:array[0..16,0..8,0..8,0..8,0..8]of boolean;
    sum:array[0..9,0..9,0..9,0..9]of longint;
    a:array[0..9,0..9]of longint;
    i,j,n,ii,jj:longint;
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
{  for k:=1 to n-1 do
    begin   }
      for i:=x1 to x2-1 do
        begin
          if done[1,x1,y1,i,y2]then t1:=f[1,x1,y1,i,y2]
          else t1:=dp(1,x1,y1,i,y2);
          if done[n-1,i+1,y1,x2,y2]then t2:=f[n-1,i+1,y1,x2,y2]
          else t2:=dp(n-1,i+1,y1,x2,y2);
          if t1+t2<temp then temp:=t1+t2;
          if done[n-1,x1,y1,i,y2]then t1:=f[n-1,x1,y1,i,y2]
          else t1:=dp(n-1,x1,y1,i,y2);
          if done[1,i+1,y1,x2,y2]then t2:=f[1,i+1,y1,x2,y2]
          else t2:=dp(1,i+1,y1,x2,y2);
          if t1+t2<temp then temp:=t1+t2;
        end;
      for i:=y1 to y2-1 do
        begin
          if done[1,x1,y1,x2,i]then t1:=f[1,x1,y1,x2,i]
          else t1:=dp(1,x1,y1,x2,i);

          if done[n-1,x1,i+1,x2,y2]then t2:=f[n-1,x1,i+1,x2,y2]
          else t2:=dp(n-1,x1,i+1,x2,y2);
          if t1+t2<temp then temp:=t1+t2;
          if done[n-1,x1,y1,x2,i]then t1:=f[n-1,x1,y1,x2,i]
          else t1:=dp(n-1,x1,y1,x2,i);

          if done[1,x1,i+1,x2,y2]then t2:=f[1,x1,i+1,x2,y2]
          else t2:=dp(1,x1,i+1,x2,y2);
          if t1+t2<temp then temp:=t1+t2;
        end;
//    end;
{  if temp=0 then
    begin
      writeln(n,' ',x1,' ',y1,' ',x2,' ',y2);
    end;   }
  f[n,x1,y1,x2,y2]:=temp;
  exit(temp);
end;
begin
  assign(input,'d.in');reset(input);
  assign(output,'d.out');rewrite(output);
  readln(n);
  for i:=1to 8 do
  for j:=1to 8 do
    read(a[i,j]);
  for i:=1 to 8 do
  for j:=1 to 8 do
  for ii:=i to 8 do
  for jj:=j to 8 do
    sum[i,j,ii,jj]:=sum[i,j,ii-1,jj]+sum[i,j,ii,jj-1]-sum[i,j,ii-1,jj-1]+a[ii,jj];
  avg:=sum[1,1,8,8]/n;
  dp(n,1,1,8,8);
  writeln(sqrt(f[n,1,1,8,8]/n):0:3);
  close(input);close(output);
end.