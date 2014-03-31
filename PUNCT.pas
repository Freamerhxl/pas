var can:array[0..256,0..101]of longint;
    ok,op:array[0..256,0..256]of boolean;
    p,f:array[0..256]of longint;
    a:array[0..101]of ansistring;
    st:ansistring;
    i,j,n,m,k:longint;
procedure kmp(a,b:ansistring;k:longint);
var i,j:longint;
begin
  for i:=1 to length(b)do p[i]:=0;
  j:=0;
  for i:=2 to length(b)do
    begin
      while(j>0)and(b[j+1]<>b[i])do j:=p[j];
      if b[j+1]=b[i]then inc(j);
      p[i]:=j;
    end;
  j:=0;
  for i:=1 to length(a)do
    begin
      while(j>0)and(b[j+1]<>a[i])do j:=p[j];
      if b[j+1]=a[i]then inc(j);
      if j=length(b)then
        begin
           inc(can[i-j+1,0]);
           can[i-j+1,can[i-j+1,0]]:=k;
           j:=p[j];
        end;
    end;
end;
procedure work(k:longint);
var i,j,p,r,rr:longint;
begin
  if can[k,0]=0 then exit;
  rr:=length(st);
  if rr-k+1>50 then rr:=k+50-1;

  for i:=0 to n do
  for j:=k to rr do
    op[i,j]:=false;

  for i:=1 to can[k,0]do
    op[1,k+length(a[can[k,i]])-1]:=true;
  r:=rr-k+1;
  for i:=1 to r-1 do
  for j:=k to rr do
  if op[i,j]then
  for p:=1 to can[j+1,0]do
  op[i+1,j+length(a[can[j+1,p]])]:=true;

  for i:=3 to r do
  for j:=k to rr do
   if op[i,j]then
   if((j-k+1)mod i=0)then
     ok[k,j]:=true;
end;
begin
  assign(input,'PUNCT.in');reset(input);
  assign(output,'PUNCT.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(a[i]);
      a[i]:=upcase(a[i]);
    end;
  readln(st);
  st:=upcase(st);
  for i:=1 to n do
    kmp(st,a[i],i);
  for i:=1 to length(st)do
    work(i);
  for i:=1 to length(st) do
  for j:=0 to i-1 do
    if(ok[j+1,i])and(f[j]+1>f[i])then
      f[i]:=f[j]+1;
  writeln(f[length(st)]);
  close(input);close(output);
end.