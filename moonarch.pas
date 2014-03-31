const p=1e-7;
var x,y,v,a,vx,vy,ans1,ans2,ans3,t1,t2,ans,mid:real;
procedure getv(v,a:real;var vx,vy:real);
var j:real;
begin
  j:=(pi/180)*a;
  vx:=v*sin(j);
  vy:=v*cos(j);
end;
procedure gett(x,y,vx,vy:real;var t1,t2:real);
var a,b,c,detal:real;
begin
  a:=vx*vx+vy*vy;
  b:=2*(x*vx+y*vy);
  c:=x*x+y*y-2000*2000;
  detal:=b*b-4*a*c;
  detal:=sqrt(detal);
  t1:=(-b+detal)/(2*a);
  t2:=(-b-detal)/(2*a);
end;
function work(x,y,vx,vy:real):real;
var a,b,c,deta,detal,xx,s:real;
begin
  a:=x*x+y*y;b:=2*x*vx+2*y*vy;c:=vx*vx+vy*vy;
  xx:=-b/(2*a);
  if xx=0 then exit(1e38);
  if 1/xx<0 then exit(1e38);
  if 1/xx>t2 then exit(1e38);
  exit(a*xx*xx+b*xx+c);
end;
begin
  assign(input,'moonarch.in');reset(input);
  assign(output,'moonarch.out');rewrite(output);
  readln(x,y,v,a);
  getv(v,a,vx,vy);
  gett(x,y,vx,vy,t1,t2);
  if t1>0 then
    ans1:=2000/t1
  else
    ans1:=1e38;
  if t2>0 then
    ans2:=2000/t2
  else
    ans2:=1e38;
  if t1>t2 then t2:=t1;
  ans3:=sqrt(work(x,y,vx,vy));
  ans:=ans1;
  if ans2<ans then ans:=ans2;
  if ans3<ans then ans:=ans3;
  writeln(ans:0:0);
  close(input);close(output);
end.