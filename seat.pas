const p=1000003;
var f:Array[0..1,0..1001]of int64;
    a,num:array[0..1001]of longint;
    done:array[0..1001]of boolean;
    x,y,ans:int64;
    i,j,n,m,t:longint;
    temp:boolean;
procedure exgcd(a,b:longint;var x,y:int64);
var t:int64;
begin
  if b=0 then
    begin
      x:=1;y:=0;
    end
  else
    begin
      exgcd(b,a mod b,x,y);
      t:=x;
      x:=y;
      y:=t-(a div b)*y;
    end;
end;
procedure work(i:longint);
var tt:longint;
begin
  done[i]:=not temp;inc(a[t]);
  tt:=num[i];
  while tt<>i do
    begin
      done[tt]:=not temp;
      tt:=num[tt];
      inc(a[t]);
    end;
end;
procedure dpit;
var i,j,k,now,last,aa:longint;
begin
  fillchar(f,sizeof(f),0);
  f[0,0]:=1;k:=0;now:=0;last:=1;
  for i:=1 to t do
  begin
  now:=1-now;last:=1-last;
  aa:=0;if k-m>aa then aa:=k-m;
  for j:=aa to m do
  if f[last,j]>0 then
  begin
    if k-j+a[i]<=m then
    f[now,j]:=(f[now,j]+f[last,j])mod p;
    if j+a[i]<=m then
    f[now,j+a[i]]:=(f[now,j+a[i]]+f[last,j])mod p;
    f[last,j]:=0;
  end;
  k:=k+a[i];
  end;
  aa:=0;if k-m>aa then aa:=k-m;
  for i:=m downto aa do
    ans:=(ans+f[now,i])mod p;
end;
begin
  assign(input,'seat.in');reset(input);
  assign(output,'seat.out');rewrite(output);
  readln(n,m);
  if m>n then m:=n;
  exgcd(p,n,x,y);
  while y<0 do y:=y+p;
  for i:=1 to n do
    num[i]:=i;
  temp:=true;
  for i:=1 to n do
    begin
      fillchar(a,sizeof(a),0);
      temp:=not temp;
      t:=0;
      for j:=1 to n do
       if done[j]=temp then
         begin
         inc(t);
         work(j);
         end;
      dpit;
      for j:=1 to n do
        num[j]:=num[j]mod n+1;
    end;
  writeln(int64(ans*y)mod p);
  close(input);close(output);
end.