var n,q,p,i,num,op,k,nw,kw,j,nn:longint;
    a:array[0..10]of integer;
    can:array[0..10]of boolean;
    flag:boolean;
procedure work(now,aa:longint);
var i:integer;
begin
  if aa>n then
    begin
      for i:=p to q do
        if now mod i<>0 then exit;
      writeln(now);
      flag:=true;
      exit;
    end;
  for i:=1 to n do
    if can[i]=false then
      begin
        can[i]:=true;
        work(now*10+a[i],aa+1);
        can[i]:=false;
      end;
end;
begin
  assign(input,'lcs.in');reset(input);
  assign(output,'lcs.out');rewrite(output);
  readln(n);nn:=n;
  readln(p,q);
  while n>0 do
    begin
      inc(nw);
      a[nw]:=n mod 10;n:=n div 10;
    end;
  n:=nw;
  for i:=1 to n-1 do
  for j:=1 to n-i do
    if a[j]>a[j+1]then
      begin
        a[j]:=a[j]xor a[j+1];
        a[j+1]:=a[j]xor a[j+1];
        a[j]:=a[j]xor a[j+1];
      end;
  work(0,1);
  if flag=false then
    writeln('No answer');
  close(input);close(output);
end.