const
pi=3.1415926575;
zero=1e-6;
maxn=1000;
maxnum=100000000;
var
ans,temp :extended;
n,tot :longint;
x,y :array[0..maxn]of extended;
zz,num :array[0..maxn]of longint;
procedure swap(var ii,jj:extended);
var
t :extended;
begin
  t:=ii;ii:=jj;jj:=t;
end;
procedure init;
var
i,j :longint;
begin
readln(n,temp);
for i:=1 to n do readln(x[i],y[i]);
end;
function ok(x,midx,y,midy:extended):longint;
begin
if abs(x-midx)<=zero then
begin
if abs(midy-y)<=zero then exit(0);
if midy>y then exit(1)
else exit(2);
end
else
begin
if x<midx then exit(1)
else exit(2);
end;
end;
procedure qsort(head,tail:longint);
var
i,j :longint;
midx,midy :extended;
begin
i:=head;
j:=tail;
midx:=x[(head+tail) div 2];
midy:=y[(head+tail) div 2];
repeat
while ok(x[i],midx,y[i],midy)=1 do inc(i);
while ok(x[j],midx,y[j],midy)=2 do dec(j);
if i<=j then
begin
swap(x[i],x[j]);
swap(y[i],y[j]);
inc(i);
dec(j);
end;
until i>j;
if i<tail then qsort(i,tail);
if j>head then qsort(head,j);
end;
function Plot(x1,y1,x2,y2:extended):extended;
begin
Plot:=x1*y2-x2*y1;
end;
function check(first,last,now:longint):boolean;
var
ax,ay,bx,by :extended;
Pt :extended;
begin
ax:=x[last]-x[first];ay:=y[last]-y[first];
bx:=x[now]-x[first];by:=y[now]-y[first];
if Plot(ax,ay,bx,by)<-zero then exit(true)
else exit(false);
end;
procedure Tbao;
var
i,j,tail :longint;
begin
tot:=0;
zz[1]:=1;tail:=1;
for i:=2 to n do
begin
while (zz[tail]<>1)and check(zz[tail-1],zz[tail],i) do dec(tail);
inc(tail);
zz[tail]:=i;
end;
inc(tot,tail-1);
for i:=1 to tail-1 do
num[i]:=zz[i];
zz[1]:=n;tail:=1;
for i:=n-1 downto 1 do
begin
while (zz[tail]<>n)and check(zz[tail-1],zz[tail],i) do dec(tail);
inc(tail);
zz[tail]:=i;
end;
for i:=1 to tail-1 do
num[tot+i]:=zz[i];
inc(tot,tail-1);
end;
function dist(a,b:longint):extended;
begin
dist:=sqrt( (x[a]-x[b])*(x[a]-x[b])+(y[a]-y[b])*(y[a]-y[b]) );
end;
procedure main;
var
i,j :longint;
begin
qsort(1,n);
Tbao;
ans:=0;
for i:=1 to tot-1 do
ans:=ans+dist(num[i],num[i+1]);
ans:=ans+dist(num[tot],num[1]);
ans:=ans+temp*pi*2;
writeln(ans:0:0);
end;
begin
init;
main;
end.