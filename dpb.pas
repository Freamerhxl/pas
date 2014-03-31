var dis,f:array[0..1001,0..1001]of extended;
        a:array[0..1001,1..2]of extended;
    i,j,n:longint;
    ans:extended;
procedure sort(t,w:longint);
var i,j:longint;
    k1,k2:extended;
begin
  k1:=a[(t+w)>>1,1];k2:=a[(t+w)>>1,2];
  i:=t;j:=w;
  repeat
    while(a[i,1]<k1)or((a[i,1]=k1)and(a[i,2]<k2))do inc(i);
    while(a[j,1]>k1)or((a[j,1]=k1)and(a[j,2]>k2))do dec(j);
    if i<=j then
      begin
        a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
function fmin(a,b:extended):extended;
begin
  if a>b then exit(b)else exit(a);
end;
begin
  assign(input,'b.in');reset(input);
  assign(output,'b.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    readln(a[i,1],a[i,2]);
  sort(1,n);
  for i:=1 to n do
  for j:=1 to n do
    dis[i,j]:=sqrt(sqr(a[i,1]-a[j,1])+sqr(a[i,2]-a[j,2]));
  if n<=1 then
    writeln(0)
  else
  if n=2 then
    writeln(dis[1,2]*2)
  else
    begin
      for i:=1 to n do
      for j:=1 to n do
        f[i,j]:=1e20;
      f[1,1]:=0;
      f[2,1]:=dis[1,2];
      f[1,2]:=dis[1,2];
      ans:=1e20;
      for i:=3 to n-1 do
        begin
          for j:=1 to i-2 do
            begin
              f[i,i-1]:=fmin(f[j,i-1]+dis[i,j],f[i,i-1]);
              f[i,j]:=fmin(f[i-1,j]+dis[i,i-1],f[i,j]);
              f[j,i]:=fmin(f[j,i-1]+dis[i,i-1],f[j,i]);
              f[i-1,i]:=fmin(f[i-1,j]+dis[i,j],f[i-1,i]);
            end;
        end;
      for i:=1 to n-2 do
        begin
          ans:=fmin(ans,f[n-1,i]+dis[n,n-1]+dis[n,i]);
          ans:=fmin(ans,f[i,n-1]+dis[n,n-1]+dis[n,i]);
        end;
      writeln(ans:0:2);
    end;
  close(input);close(output);
end.