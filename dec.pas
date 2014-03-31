const p=1048573;
var h,c:array[0..p]of longint;
    n,m,i,k,kk,flag,data:longint;
    ans:int64;
function hash(x:longint):longint;
var i,k:longint;
begin
  if x<0 then k:=-x else k:=x;
  i:=k mod p;
  while(h[i]<>flag)and(h[i]<>k)do
    i:=(i+1)mod p;
  h[i]:=x;
  exit(i);
end;
function find(x:longint):longint;
var i,k:longint;
begin
  if x<0 then k:=-x else k:=x;
  i:=k mod p;
  while(h[i]<>flag)and(h[i]<>k)do
    i:=(i+1)mod p;
  if h[i]=x then exit(c[i])
  else exit(0);
end;
begin
  assign(input,'dec.in');reset(input);
  assign(output,'dec.out');rewrite(output);
  readln(n,m);
  fillchar(h,sizeof(h),$f7);
  flag:=h[0];
  for i:=1 to n do
    begin
      read(data);
      k:=hash(data);
      inc(c[k]);
      if k>kk then kk:=k;
    end;
  for i:=0 to kk do
    if c[i]>0 then
      begin
        k:=find(h[i]-m);
        ans:=ans+int64(c[i]*k);
      end;
  writeln(ans);
  close(input);close(output);
end.