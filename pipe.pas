var a:array[0..21,1..2]of real;
    n,i,j,k,p:longint;
    ans:real;
    flag:boolean;
function pm(x1,y1,x2,y2:real):real;
begin
  exit(x1*y2-x2*y1);
end;
procedure check(x1,y1,x2,y2:real);
var i,j,kkk:longint;
    t,k,b,kk,bb,yy:real;
procedure get(var k,b:real;x1,y1,x2,y2:real);
begin
  k:=(y1-y2)/(x1-x2);
  b:=y1-k*x1;
end;
begin
  flag:=true;
  get(k,b,x1,y1,x2,y2);
  kkk:=0;
  for i:=1 to n do
   begin
     yy:=k*a[i,1]+b;
     if yy>a[i,2]+(1e-6) then
       begin
         flag:=false;
         if i=1 then
           begin
             t:=a[i,1];break;
           end;
         get(kk,bb,a[i,1],a[i,2],a[i-1,1],a[i-1,2]);
         t:=(bb-b)/(k-kk);
         break;
       end
     else
     if yy<a[i,2]-1-(1e-6) then
       begin
         flag:=false;
         if i=1 then
           begin
             t:=a[i,1];break;
           end;
          get(kk,bb,a[i,1],a[i,2]-1,a[i-1,1],a[i-1,2]-1);
         t:=(bb-b)/(k-kk);
         break;
       end;
     inc(kkk);
   end;
  if kkk=n then exit;
  if t>ans then ans:=t;
end;
begin
  assign(input,'pipe.in');reset(input);
  assign(output,'pipe.out');rewrite(output);
   while not eof do
     begin
       readln(n);
       if n=0 then break;
       ans:=-10000000000;
       for i:=1 to n do
         readln(a[i,1],a[i,2]);
       for i:=1 to n do
         begin
           for j:=i+1 to n do
           begin
           for k:=0 downto -1 do
           begin
           for p:=0 downto -1 do
             begin
               check(a[i,1],a[i,2]+k,a[j,1],a[j,2]+p);
               if flag then break;
             end;
           if flag then break;
           end;
          if flag then break;
         end;
         if flag then break;
         end;
       if flag then writeln('Through all the pipe.')
       else writeln(ans:0:2);
     end;
  close(input);close(output);
end.
