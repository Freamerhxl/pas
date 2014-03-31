uses math;
var x1,y1,r1,x2,y2,r2,t,dis,s,ss,j1,j2:extended;
function disab(x1,y1,x2,y2:extended):extended;
begin
  exit(sqrt(sqr(x1-x2)+sqr(y1-y2)));
end;
function st(l1,l2,l3:extended):extended;
var p:extended;
begin
  p:=(l1+l2+l3)/2;
  exit(sqrt(p*(p-l1)*(p-l2)*(p-l3)));
end;
begin
  assign(input,'circle.in');reset(input);
  assign(output,'circle.out');rewrite(output);
  readln(x1,y1,r1,x2,y2,r2);
  if r2>r1 then
    begin
      t:=x1;x1:=x2;x2:=t;
      t:=y1;y1:=y2;y2:=t;
      t:=r1;r1:=r2;r2:=t;
    end;
  dis:=disab(x1,y1,x2,y2);
  if dis>(r1+r2-1e-6)then
    begin
     writeln(0.0:0:3);
    end
  else
  if(dis<r1-r2+1e-6)then
    begin
      writeln(pi*r2*r2:0:3);
    end
  else
    begin
      x2:=x1;y2:=y1+dis;
      s:=st(r1,r2,dis);
      t:=s*2/dis;
      ss:=s*2;
  //    t:=r2*r2-r1*r1-dis*dis+2*r1*dis;
      j1:=arccos((r2*r2-r1*r1-dis*dis)/(-2*r1*dis));
      j2:=arccos((r1*r1-r2*r2-dis*dis)/(-2*r2*dis));
      s:=pi*r1*r1*(j1/pi)+pi*r2*r2*(j2/(pi));
      writeln(s-ss:0:3);
    end;
  close(input);close(output);
end.