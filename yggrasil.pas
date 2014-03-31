program yggrasil;
const maxn=100000;
      maxlen=maxlongint;
var x1,x2,h:array[1..maxn] of longint;
    f:array[1..maxn,1..2] of int64;
    c,ls,rs:array[1..maxn*50] of longint;
    len,i,n,mh,t:longint;
procedure qsort(x,y:longint);
var i,j,p,t:longint;
begin
i:=x;j:=y;p:=h[(x+y) div 2];
repeat
 while h[i]>p do inc(i);
 while h[j]<p do dec(j);
 if i<=j then
  begin
  t:=h[i];h[i]:=h[j];h[j]:=t;
  t:=x1[i];x1[i]:=x1[j];x1[j]:=t;
  t:=x2[i];x2[i]:=x2[j];x2[j]:=t;
  inc(i);dec(j);
  end;
 until i>j;
if x<j then qsort(x,j);
if i<y then qsort(i,y);
end;

function max(x,y:int64):int64;
begin
 if x>y then exit(x);exit(y);
end;
function min(x,y:int64):int64;
begin
 if x<y then exit(x);exit(y);
end;

procedure insert(x,y,s,l,r:int64);
var p:int64;
begin
if l>r then exit;

 if (x=l) and (y=r) and (c[s]>0) then
  begin
   if (x=x1[i]) and (h[i]-h[c[s]]<=mh) then
    begin
    if c[s]=n+1 then
     f[i,1]:=min(f[i,1],h[i])
     else
     begin
     f[i,1]:=min(f[c[s],2]+abs(x-x2[c[s]])+h[i]-h[c[s]],f[i,1]);
     f[i,1]:=min(f[c[s],1]+abs(x-x1[c[s]])+h[i]-h[c[s]],f[i,1]);
     end;
    end;
   if (y=x2[i]) and (h[i]-h[c[s]]<=mh) then
    begin
    if c[s]=n+1 then
     f[i,2]:=min(f[i,2],h[i])
     else
     begin
     f[i,2]:=min(f[c[s],1]+abs(y-x1[c[s]])+h[i]-h[c[s]],f[i,2]);
     f[i,2]:=min(f[c[s],2]+abs(y-x2[c[s]])+h[i]-h[c[s]],f[i,2]);
     end;
    end;
   c[s]:=i;
  exit;
 end;
p:=(l+r-1) div 2;
if c[s]>0 then
 begin
  if ls[s]=0 then
   begin
    inc(len);ls[s]:=len;
   end;
  if rs[s]=0 then
   begin
    inc(len);rs[s]:=len;
   end;
  c[ls[s]]:=c[s];
  c[rs[s]]:=c[s];
 end;
c[s]:=-1;
if (x<=p) then insert(x,min(p,y),ls[s],l,p);
if (y>p) then insert(max(x,p+1),y,rs[s],p+1,r);
end;


begin
assign(input,'yggrasil.in');reset(input);
assign(output,'yggrasil.out');rewrite(output);
readln(n);
for i:=1 to n do
 readln(x1[i],x2[i],h[i]);
fillchar(f,sizeof(f),127);
qsort(1,n);
readln(mh);
i:=n+1;
c[1]:=n+1;
for i:=n downto 1 do
  insert(x1[i],x2[i],1,-maxlen,maxlen);
if f[1,1] div 100000>maxlongint then writeln('TP')
else writeln(f[1,1]);
close(output);
end.
