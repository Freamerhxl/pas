var f:array[0..21,0..201,-401..401]of longint;
    can:array[0..21,0..201,-401..401]of boolean;
    a:array[0..201,1..2]of longint;
    i,j,n,m,k,tma,tmb,tmc,tmd,ans1,ans2:longint;
    flag:boolean;
begin
  readln(n,m);
  for i:=1 to n do
    readln(a[i,1],a[i,2]);
  for i:=0 to n do
   can[0,i,0]:=true;
  for i:=1 to m do
  for j:=i to n do
  begin
    tma:=tmc;tmb:=tmd;
    for k:=tmb downto tma do
    if f[i,j-1,k]>f[i,j,k]then
      begin
        f[i,j,k]:=f[i,j-1,k];
        can[i,j-1,k]:=true;
      end;
    for k:=tmb downto tma do
    if can[i-1,j-1,k]then
      begin
        can[i,j,k+a[j,1]-a[j,2]]:=true;
        if k+a[j,1]-a[j,2]>tmd then tmd:=k+a[j,1]-a[j,2];
        if k+a[j,1]-a[j,2]<tmc then tmc:=k+a[j,1]-a[j,2];
        if f[i-1,j-1,k]+a[j,1]+a[j,2]>f[i,j,k+a[j,1]-a[j,2]]then
          f[i,j,k+a[j,1]-a[j,2]]:=f[i-1,j-1,k]+a[j,1]+a[j,2];
      end;
  end;
  ans1:=maxlongint;ans2:=-maxlongint;
  for i:=m to n do
  for j:=0 to 400 do
  if j<=ans1 then
  begin
    if can[m,i,j]then
    begin
    if j<ans1 then
      begin
        ans1:=j;ans2:=f[m,i,j];
      end
    else if(ans1=j)and(f[m,i,j]>ans2)then ans2:=f[m,i,j];
    end;
    if can[m,i,-j]then
    begin
      if j<ans1 then
      begin
        ans1:=j;ans2:=f[m,i,-j];
      end
    else if(ans1=j)and(f[m,i,-j]>ans2)then ans2:=f[m,i,-j];
    end;
  end
  else
    break;
  writeln(ans1,' ',ans2);
end.