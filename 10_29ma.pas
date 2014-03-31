var a,s:array[0..21,0..21,0..21,0..21]of longint;
    i,j,ii,jj,k,temp,n,max,min,tt:longint;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
function get(x1,y1,x2,y2:longint):longint;
var i,j,ii,jj:longint;
begin
  get:=0;
  for i:=1 to x1 do
  for j:=1 to y1 do
  for ii:=1 to x2 do
  for jj:=1 to y2 do
    get:=get+a[i,j,ii,jj];
end;
function sum(x1,y1,x2,y2,k:longint):longint;
var i,j,ii,jj:longint;
begin
  sum:=0;
  for i:=x1-k+1 to x1 do
  for j:=y1-k+1 to y1 do
  for ii:=x2-k+1 to x2 do
  for jj:=y2-k+1 to y2 do
    sum:=sum+a[i,j,ii,jj];
end;
begin
  assign(input,'a.in');reset(input);
  assign(output,'a.out');rewrite(output);
  readln(n);
  for i:=1 to n do
  for j:=1 to n do
  for ii:=1 to n do
  for jj:=1 to n do
    begin
      read(a[i,j,ii,jj]);
      s[i,j,ii,jj]:=a[i,j,ii,jj]
                   +s[i-1,j,ii,jj]+s[i,j-1,ii,jj]+s[i,j,ii-1,jj]+s[i,j,ii,jj-1]
                   -s[i-1,j-1,ii,jj]-s[i-1,j,ii-1,jj]-s[i-1,j,ii,jj-1]-s[i,j-1,ii-1,jj]-s[i,j-1,ii,jj-1]-s[i,j,ii-1,jj-1]
                   +s[i-1,j-1,ii-1,jj]+s[i-1,j-1,ii,jj-1]+s[i-1,j,ii-1,jj-1]+s[i,j-1,ii-1,jj-1]
                   -s[i-1,j-1,ii-1,jj-1];
    end;
  for i:=1 to n do
  for j:=1 to n do
  for ii:=1 to n do
  for jj:=1 to n do
  for k:=fmin(i,fmin(j,fmin(ii,jj)))downto 1 do
    begin
      temp:=s[i,j,ii,jj]
           -s[i-k,j,ii,jj]-s[i,j-k,ii,jj]-s[i,j,ii-k,jj]-s[i,j,ii,jj-k]
           +s[i-k,j-k,ii,jj]+s[i-k,j,ii-k,jj]+s[i-k,j,ii,jj-k]+s[i,j-k,ii-k,jj]+s[i,j-k,ii,jj-k]+s[i,j,ii-k,jj-k]
           -s[i-k,j-k,ii-k,jj]-s[i-k,j-k,ii,jj-k]-s[i-k,j,ii-k,jj-k]-s[i,j-k,ii-k,jj-k]
           +s[i-k,j-k,ii-k,jj-k];
      if temp>max then max:=temp;
      if temp<min then min:=temp;
    end;
  writeln(max);
  writeln(abs(min));
  close(input);close(output);
end.