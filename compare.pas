var a,b:array[0..500]of longint;
    int:array[0..501,0..501]of boolean;
    i,j,n,m,pp,kk:longint;
procedure out(x:longint);
begin
  if x=1 then
    writeln('AC')
  else writeln('WA');
  halt;
end;
begin
  assign(input,'table.in');reset(input);
  readln(m,n);
  for i:=1 to m do
    read(a[i]);
  for i:=1 to n do
    read(b[i]);
  close(input);
  assign(input,'ans.out');reset(input);
  readln(pp);
  close(input);
  assign(input,'table.out');reset(input);
  readln(kk);
  if(pp=0)then
    begin
      if kk=0 then out(1)
      else out(0);
    end;
  for i:=1 to m do
    begin
      for j:=1 to a[i]do
        begin
          read(kk);
          if int[i,kk] then out(0);
          int[i,kk]:=true;
          dec(b[kk]);
        end;
      readln;
    end;
  for i:=1 to m do
    if b[i]<0 then out(0);
  out(1);
  close(input);
end.
