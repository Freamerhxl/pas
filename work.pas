var d:array[0..13,0..8]of longint;
    a:array[0..13,1..2]of longint;
    c1,c2,fil,t,now:array[0..15]of longint;
    tot,i,n:longint;
function can(x:longint):boolean;
var i:longint;
begin
  if x>n then exit(true);
  for i:=1 to d[x,0] do
    if(c2[d[x,i]]and t[x]>0)and(now[d[x,i]]and c1[x]=0)then
      begin
        now[d[x,i]]:=now[d[x,i]]or t[x];
        if can(x+1)then exit(true);
        now[d[x,i]]:=now[d[x,i]]xor t[x];
      end;
  exit(false);
end;
procedure main;
var i,j:longint;
begin
  c1:=fil;c2:=fil;now:=fil;
  readln(n);
  for i:=1 to n do
    begin
      read(a[i,1],a[i,2]);
      read(d[i,0]);
      for j:=1 to d[i,0]do
        begin
          read(d[i,j]);
          c2[d[i,j]]:=c2[d[i,j]]or t[i];
        end;
    end;
  for i:=1 to n-1 do
  for j:=i+1 to n do
    if((a[i,1]<=a[j,2])and(a[i,2]>=a[j,1]))or((a[j,1]<=a[i,2])and(a[j,2]>=a[i,1]))then
      begin
        c1[i]:=c1[i]or t[j];
        c1[j]:=c1[j]or t[i];
      end;
  if can(1)then
    writeln('YES')
  else writeln('NO');
end;
begin
  assign(input,'work.in');reset(input);
  assign(output,'work.out');rewrite(output);
  readln(tot);
  t[1]:=1;
  for i:=2 to 15 do
    t[i]:=t[i-1]*2;
  for i:=1 to tot do
    main;
  close(input);close(output);
end.