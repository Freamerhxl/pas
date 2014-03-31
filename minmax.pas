var f:array[0..1001,0..51]of integer;
    a:array[0..1001,0..1001]of longint;
    i,j,n,m,k,p,maxans,minans,maxk,mink,now,last,flag:longint;
    st:ansistring;
begin
  assign(input,'minmax.in');reset(input);
  assign(output,'minmax.out');rewrite(output);
  readln(st);n:=length(st);
  readln(m);
  for i:=1 to n do
    begin
      a[i,i]:=(ord(st[i])-48)mod m;
      for j:=i+1 to n do
        a[i,j]:=(a[i,j-1]*10+(ord(st[j])-48))mod m;
    end;
  maxans:=a[1,n];minans:=a[1,n];
  fillchar(f,sizeof(f),43);
  flag:=f[0,0];
  for i:=1 to n do
    f[i,a[1,i]]:=0;
  for i:=2 to n do
  for j:=1 to i-1 do
  for p:=0 to m-1 do
  if(f[j,p]<flag)then
    begin
      k:=(p*a[j+1,i])mod m;
      if f[j,p]+1<f[i,k]then
        f[i,k]:=f[j,p]+1;
    end;
  for i:=0 to m-1 do
    if f[n,i]<flag then
    begin
      if i>maxans then
        begin
          maxans:=i;maxk:=f[n,i];
        end;
      if i<minans then
        begin
          minans:=i;mink:=f[n,i];
        end;
    end;
  writeln(minans,' ',mink,' ',maxans,' ',maxk);
  close(input);close(output);
end.