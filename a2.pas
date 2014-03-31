var map:array[0..501,0..501]of boolean;
    f,done:array[0..501,0..501,1..2]of boolean;
    can:array[0..501]of boolean;
    a:array[0..1001]of integer;
    i,j,n,m,ii,jj:longint;
function work(x,l,r,op:longint):boolean;
var i:longint;
    t1,t2:boolean;
begin
  done[l,r,op]:=true;
  if l>r then begin f[l,r,op]:=true;exit(true);end;
  if l=r then
    begin
    f[l,r,op]:=map[x,a[l]];
    exit(map[x,a[l]]);
    end;
  for i:=l to r do
  if map[x,a[l]]then
  begin
    if done[l,i-1,2]then t1:=f[l,i-1,2]
    else t1:=work(a[i],l,i-1,2);
    if done[i+1,r,1]then t2:=f[i+1,r,1]
    else t2:=work(a[i],i+1,r,1);
    if t1 and t2 then
    begin
    f[l,r,op]:=true;
    exit(true);
    end;
  end;
  f[l,r,op]:=false;
  exit(false);
end;
begin
  assign(input,'data.in');reset(input);
  assign(output,'a2.out');rewrite(output);
  readln(n);
  for i:=1 to n do
  for j:=1 to n do
    begin
      read(m);
      if m=1 then map[i,j]:=true;
    end;
//  for i:=1 to n do a[i]:=i;
//  for i:=1 to n do
    a[n+i]:=i;

  for i:=1 to n do
    begin
      m:=0;
      fillchar(done,sizeof(done),false);
      fillchar(f,sizeof(f),false);
      for j:=i+1 to n do
        begin
          inc(m);a[m]:=j;
        end;
      for j:=1 to i-1 do
        begin
          inc(m);a[m]:=j;
        end;
      can[i]:=work(i,1,m,1);
    end;
  m:=0;
  for i:=1 to n do
    if can[i]then inc(m);
  writeln(m);
  for i:=1 to n do
  if can[i]then
    writeln(i);
  close(output);
end.