var f,ff:array[0..21001,1..2,1..2]of int64;
    a,s1,s2:array[0..21001]of longint;
    done:array[0..10001]of boolean;
    i,j,n,m,k,p:longint;
    ans:int64;
begin
  assign(input,'data.in');reset(input);
  readln(n,m);

  for i:=1 to n do
    begin
      read(a[i]);
    end;
  for i:=1 to n do    a[i+n]:=a[i];
  fillchar(f,sizeof(f),43);
  ans:=f[0,1,1];
  f[0,1,1]:=0;f[0,2,2]:=0;
  a[0]:=a[n];
  for i:=1 to n do
  for j:=1 to 2 do
    if a[i]>a[i-1]then
      begin
        if f[i-1,j,1]+a[i]-a[i-1]<f[i,j,1]then
        f[i,j,1]:=f[i-1,j,1]+a[i]-a[i-1];

        if f[i-1,j,2]+m+a[i]-a[i-1]<f[i,j,1]then
        f[i,j,1]:=f[i-1,j,2]+m+a[i]-a[i-1];

        if f[i-1,j,2]+int64(sqr(int64(a[i]-a[i-1])))<f[i,j,2]then
        f[i,j,2]:=f[i-1,j,2]+int64(sqr(int64(a[i]-a[i-1])));

        if f[i-1,j,1]+m+int64(sqr(int64(a[i]-a[i-1])))<f[i,j,2]then
        f[i,j,2]:=f[i-1,j,1]+m+int64(sqr(int64(a[i]-a[i-1])));
      end
    else
      begin
        if f[i-1,j,2]+a[i-1]-a[i]<f[i,j,2]then
        f[i,j,2]:=f[i-1,j,2]+a[i-1]-a[i];

        if f[i-1,j,1]+a[i-1]-a[i]+m<f[i,j,2]then
        f[i,j,2]:=f[i-1,j,1]+a[i-1]-a[i]+m;

        if f[i-1,j,1]+sqr(int64(a[i-1]-a[i]))<f[i,j,1]then
        f[i,j,1]:=f[i-1,j,1]+sqr(int64(a[i-1]-a[i]));

        if f[i-1,j,2]+m+sqr(int64(a[i-1]-a[i]))<f[i,j,1]then
        f[i,j,1]:=f[i-1,j,2]+m+sqr(int64(a[i-1]-a[i]));
      end;
  fillchar(ff,sizeof(ff),43);
  ff[n,1,1]:=0;ff[n,2,2]:=0;
  for i:=n-1 downto 1 do
  for j:=1 to 2 do
  if a[i]<a[i+1]then
    begin
      if ff[i+1,j,1]+a[i+1]-a[i]<ff[i,j,1]then
        ff[i,j,1]:=ff[i+1,j,1]+a[i+1]-a[i];

      if ff[i+1,j,2]+sqr(int64(a[i+1]-a[i]))<ff[i,j,2]then
      ff[i,j,2]:=ff[i+1,j,2]+sqr(int64(a[i+1]-a[i]));

      if ff[i+1,j,1]+m+a[i+1]-a[i]<ff[i,j,2]then
      ff[i,j,2]:=ff[i+1,j,1]+m+a[i+1]-a[i];

      if ff[i+1,j,1]+m+sqr(int64(a[i+1]-a[i]))<ff[i,j,2]then
      ff[i,j,2]:=ff[i+1,j,1]+m+sqr(int64(a[i+1]-a[i]));
    end
  else
    begin
      if ff[i+1,j,2]+a[i]-a[i+1]<ff[i,j,2]then
        ff[i,j,2]:=ff[i+1,j,2]+a[i]-a[i+1];

      if ff[i+1,j,1]+sqr(int64(a[i]-a[i+1]))<ff[i,j,1]then
        ff[i,j,1]:=ff[i+1,j,1]+sqr(int64(a[i]-a[i+1]));

      if ff[i+1,j,2]+m+a[i]-a[i+1]<ff[i,j,1]then
        ff[i,j,1]:=ff[i+1,j,2]+m+a[i]-a[i+1];

      if ff[i+1,j,2]+m+sqr(int64(a[i]-a[i+1]))<ff[i,j,1]then
        ff[i,j,1]:=ff[i+1,j,2]+m+sqr(int64(a[i]-a[i+1]));

    end;
  for i:=1 to n do
  for j:=1 to 2 do
  for k:=1 to 2 do
  for p:=1 to 2 do
    if f[i,j,k]+ff[i,j,p]<ans then ans:=f[i,j,k]+ff[i,j,p];
  writeln(ans);
end.
