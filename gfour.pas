var now,ans,n:longint;
procedure work(n,tot:longint);
begin
  if n=0 then
    begin
      if tot<now then now:=tot;
      exit;
    end;
  if n mod 4=0 then
    begin
     if n div 4 mod 4=0 then
       work(n div 4,tot+1);
     if n div 4 mod 4=1 then
       work(n-4,tot+1);
     if n div 4 mod 4=2 then
       begin
       work(n+8,tot+2);
       work(n-8,tot+2);
       end;
     if n div 4 mod 4=3 then
       work(n+4,tot+1);
    end;
  if n mod 4 =1 then
     work(n-1,tot+2);
  if n mod 4 =2 then
    begin
     work(n+2,tot+3);
     work(n-2,tot+3);
    end;
  if n mod 4 =3 then
    begin
      work(n+1,tot+2);
      work(n-3,tot+3);
    end;
end;
begin
  assign(input,'gfour.in');reset(input);
  assign(output,'gfour.out');rewrite(output);
  read(n);
  while n<>0 do
    begin
      now:=maxlongint;
      work(n,0);
      ans:=ans+now;
      read(n);
    end;
  writeln(ans);
  close(input);close(output);
end.