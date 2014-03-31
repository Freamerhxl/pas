var m,year,n,day,i:longint;
    xa,ya,xb,yb,xc,yc,xd,yd,p,t,x,y,tx,ty:extended;
    ans1,ans2,ansx,ansy,ansx1,ansy1,ansx2,ansy2,cost1,cost2:extended;
    a1,a2,b1,b2,c1,c2:extended;
function dis(x1,y1,x2,y2:extended):extended;
begin
  exit(sqrt(sqr(x1-x2)+sqr(y1-y2)));
end;
function pm(x1,y1,x2,y2:extended):extended;
begin
  exit(x1*y2-x2*y1);
end;
function displ(x,y,a,b,c:extended):extended;
begin
  exit(abs(a*x+b*y+c)/(sqrt(a*a+b*b)));
end;
procedure get(a1,b1,c1,a2,b2,c2:extended;var x,y:extended);
begin
  x:=(b1*c2-b2*c1)/(b2*a1-b1*a2);y:=(a1*c2-a2*c1)/(a2*b1-a1*b2);
end;
begin
  assign(input,'stops.in');reset(input);
  assign(output,'stops.out');rewrite(output);
  readln(xa,ya,xb,yb);
  readln(xc,yc,xd,yd);
  a1:=ya-yb;b1:=xb-xa;c1:=xa*yb-xb*ya;
  a2:=yc-yd;b2:=xd-xc;c2:=xc*yd-xd*yc;
  readln(m,n,t,p);
  readln(year);
  for i:=year to year+n-1 do
    begin
      inc(day,365);
      if(i mod 400=0)or((i mod 4=0)and(i mod 100<>0))then
        inc(day);
    end;
  if pm(xb-xa,yb-ya,xc-xa,yc-ya)*pm(xb-xa,yb-ya,xd-xa,yd-ya)<=1e-6 then
    begin
      cost1:=day*m*t*dis(xc,yc,xd,yd)+p*n;
      get(a1,b1,c1,a2,b2,c2,ansx,ansy);
    end
  else
    begin
      get(a1,b1,c1,-b1,a1,b1*xc-a1*yc,tx,ty);
      x:=2*tx-xc;y:=2*ty-yc;
      cost1:=day*m*t*dis(x,y,xd,yd)+p*n;
      get(a1,b1,c1,y-yd,xd-x,x*yd-y*xd,ansx,ansy)
    end;
  cost2:=day*m*t*(displ(xc,yc,a1,b1,c1)+displ(xd,yd,a1,b1,c1))+p*n*2;
  get(a1,b1,c1,-b1,a1,b1*xc-a1*yc,ansx1,ansy1);
  get(a1,b1,c1,-b1,a1,b1*xd-a1*yd,ansx2,ansy2);
  if cost1<cost2 then
  begin
  writeln(cost1:0:4);
  writeln(1);
  writeln(ansx:0:4,' ',ansy:0:4);
  end
  else
  begin
  writeln(cost2:0:4);
  writeln(2);
  writeln(ansx1:0:4,' ',ansy1:0:4);
  writeln(ansx2:0:4,' ',ansy2:0:4);
  end;
  close(input);close(output);
end.