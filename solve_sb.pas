program solve;
var
   p,a:Array[0..80]of qword;
   ej:array[0..80]of qword;
   can:Array[0..80]of boolean;
   tt,x,t,i,j,k,n,m,ans:longint;
   last:qword;
procedure go(id:integer;now:qword;use:integer);
begin
if now=last  then
 begin
 if use<ans then
 ans:=use;
// writeln(ans);
// halt;
 exit;
 end;
if (id>m)or(use>=ans) then exit;
if ((now or p[id])=(last)) then go(id+1,now,use);
if ((now or a[id])<>now) then go(id+1,now or a[id],use+1);
end;

begin
assign(input,'solve.in');reset(input);
assign(output,'solve.out');rewrite(output);
ej[0]:=1;
for i:=1 to 60 do  ej[i]:=ej[i-1]*2;
readln(n,m);
for i:=1 to m do
begin
read(t);
for j:=1 to t do
 begin
 read(x);
 a[i]:=a[i] or ej[x-1];
 end;
readln;
end;

fillchar(can,sizeof(can),true);

for i:=1 to m do
for j:=i+1 to m do
if  a[i]<a[j] then
begin
a[0]:=a[i];
a[i]:=a[j];
a[j]:=a[0];
end;

for i:=1 to m do
if can[i] then
for j:=1 to m do
if i<>j then
if (a[i] or a[j])=(a[i]) then
 can[j]:=false;

fillchar(p,sizeof(p),0);
tt:=0;
for i:=1 to m do
if can[i]  then
begin
tt:=tt+1;
a[tt]:=a[i];
end;
m:=tt; writeln(tt);
//writeln(m);
for i:=m-1 downto 1 do p[i]:=p[i+1] or a[i+1];
ans:=n;
last:=ej[n]-1;
go(1,0,0);
writeln(ans);
close(output);
end.
