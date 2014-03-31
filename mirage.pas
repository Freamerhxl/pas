var a,b,c,p1,p2,p3,pp1,pp2,pp,mm,sum:extended;
    i,j,n,k1,k2:longint;
begin
  assign(input,'mirage.in');reset(input);
  assign(output,'mirage.out');rewrite(output);
  pp1:=1;pp2:=1;
  for i:=1 to 4 do
    begin
      read(pp);
      pp1:=pp1*(1-pp);
    end;
  for i:=1 to 4 do
    begin
      read(pp);
      pp2:=pp2*(1-pp);
    end;
  readln(k1,k2);
  p1:=(k1/(k1+k2))*pp1+(k2/(k1+k2))*pp1*(1-pp2);
  p2:=(k2/(k1+k2))*pp2+(k1/(k1+k2))*pp2*(1-pp1);
  p3:=1-p1-p2;
  readln(n);
  c:=1;
  for i:=1 to n do
    begin
      readln(mm,k1);
      c:=c*exp((1/n)*ln(mm));
      sum:=sum+mm;
      if k1=0 then a:=a+mm
        else b:=b+mm;
    end;
  a:=sum-2*a;
  b:=sum-2*b;
  c:=sum-c*n;
  writeln(p1:0:2,' ',p2:0:2,' ',p3:0:2);
  writeln(a*p1+b*p2+c*p3:0:2);
  close(input);close(output);
end.