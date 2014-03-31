const p=10007;
var c:array[0..1001,0..1001]of longint;
    f:array[0..1001]of longint;
    l,r,count:array[0..1001]of longint;
    i,j,n,m,t:longint;
procedure main;
var i,j,k,t,op:longint;
procedure treedp(x:longint);
begin
  if(l[x]=0)and(r[x]=0)then
    begin
      f[x]:=1;count[x]:=1;exit;
    end;
  if l[x]<>0 then treedp(l[x]);
  if r[x]<>0 then treedp(r[x]);
  count[x]:=1+count[l[x]]+count[r[x]];
  if l[x]=0 then
    f[x]:=f[r[x]]
  else
  if r[x]=0 then
    f[x]:=f[l[x]]
  else
  f[x]:=(((f[l[x]]*f[r[x]])mod p)*c[count[r[x]]+count[l[x]],count[l[x]]])mod p;
end;
begin
  readln(n);
  fillchar(l,sizeof(l),0);
  fillchar(r,sizeof(r),0);
  for i:=1 to n do
    begin
      read(k);
      for j:=1 to k do
        begin
          read(t);
          if l[i]=0 then l[i]:=t
          else r[op]:=t;
          op:=t;
        end;
    end;
  fillchar(count,sizeof(count),0);
  fillchar(f,sizeof(f),0);
  treedp(1);
  writeln(f[1]);
end;
begin
  assign(input,'input.txt');reset(input);
  c[0,0]:=1;
  for i:=1to 1001 do
    begin
      c[i,0]:=1;
      for j:=1 to i do
        c[i,j]:=(c[i-1,j-1]+c[i-1,j])mod p;
    end;
  readln(t);
  for i:=1 to t do
    main;
end.