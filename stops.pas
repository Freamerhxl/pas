var x1,y1,x2,y2,x3,y3,x4,y4,p,t,x,y:extended;
    cost1,cost2,ansx,ansy,ansx1,ansy1,ansx2,ansy2:extended;
    year,m,n,day,i:longint;
function cj(x1,y1,x2,y2:extended):extended;
begin
  exit(x1*y2-x2*y1);
end;
function pm(x1,y1,x2,y2:extended):extended;
begin
  exit(x1*x2+y1*y2);
end;
function dis(x1,y1,x2,y2:extended):extended;
begin
  exit(sqrt(sqr(x1-x2)+sqr(y1-y2)));
end;
procedure getcp(x1,y1,x2,y2,x3,y3,x4,y4:extended;var x,y:extended);
var t1,t2,t:extended;
begin
  t1:=abs(cj(x1-x3,y1-y3,x4-x3,y4-y3));
  t2:=abs(cj(x2-x3,y2-y3,x4-x3,y4-y3));
  t:=t1/(t1+t2);
  x:=(x2-x1)*t+x1;
  y:=(y2-y1)*t+y1;
end;
procedure getcz(x1,y1,x2,y2,x3,y3:extended;var x,y:extended);
var t:extended;
begin
  t:=(pm(x3-x1,y3-y1,x2-x1,y2-y1));
  t:=t/dis(x1,y1,x2,y2);t:=t/dis(x1,y1,x2,y2);
  x:=(x2-x1)*t+x1;y:=(y2-y1)*t+y1;
end;
begin
  assign(input,'stops.in');reset(input);
  assign(output,'stops.out');rewrite(output);
  readln(x1,y1,x2,y2);
  readln(x3,y3,x4,y4);
  readln(m,n,t,p);
  readln(year);
  for i:=year to year+n-1 do
    begin
      inc(day,365);
      if(i mod 400=0)or((i mod 4=0)and(i mod 100<>0))then
        inc(day);
    end;
  if(cj(x2-x1,y2-y1,x3-x1,y3-y1)*cj(x2-x1,y2-y1,x4-x1,y4-y1)<0)then
    begin
      cost1:=day*t*m*dis(x3,y3,x4,y4)+p*n;
      getcp(x1,y1,x2,y2,x3,y3,x4,y4,ansx,ansy);
    end
  else
    begin
      getcz(x1,y1,x2,y2,x3,y3,x,y);
      x:=2*x-x3;y:=2*y-y3;
      cost1:=day*t*m*dis(x,y,x4,y4)+p*n;
      getcp(x1,y1,x2,y2,x,y,x4,y4,ansx,ansy);
    end;
  getcz(x1,y1,x2,y2,x3,y3,ansx1,ansy1);
  getcz(x1,y1,x2,y2,x4,y4,ansx2,ansy2);
  cost2:=day*t*m*(dis(x3,y3,ansx1,ansy1)+dis(x4,y4,ansx2,ansy2))+p*n*2;
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