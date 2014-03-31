var p1,p2,f1:array[0..8002]of integer;
    s1,s2:ansistring;
    i,n,m,k:longint;
function main:boolean;
var i,j:longint;
begin
  readln(s1);
  readln(s2);
  n:=length(s2);
  m:=length(s1);
  if m<n then exit(false);
  for i:=1 to length(s1)do
    begin
      f1[i]:=0;
    end;
  for i:=1 to length(s2)do
    begin
      p1[i]:=0;p2[i]:=n+1;
    end;
  j:=0;

  for i:=2 to n do
    begin
      while(j>0)and(s2[j+1]<>s2[i])do j:=p1[j];
      if s2[j+1]=s2[i] then inc(j);
      p1[i]:=j;
    end;
  j:=n+1;
  for i:=n-1 downto 1 do
    begin
      while(j<n+1)and(s2[j-1]<>s2[i])do j:=p2[j];
      if s2[j-1]=s2[i] then dec(j);
      p2[i]:=j;
    end;

  j:=0;
  for i:=1 to m do
    begin
      while(j>0)and(s2[j+1]<>s1[i])do j:=p1[j];
      if s2[j+1]=s1[i]then inc(j);
      f1[i]:=j;
      if j=n then exit(true);
    end;
  j:=n+1;
  for i:=m downto 1 do
    begin
      while(j<n+1)and(s2[j-1]<>s1[i])do j:=p2[j];
      if s2[j-1]=s1[i] then dec(j);
      if j=1 then exit(true);
      if i+n-1<=m then
      if f1[i+n-1]=j-1 then exit(true);
    end;

  exit(false);
end;
begin
  assign(input,'DNA.in');reset(input);
  assign(output,'DNA.out');rewrite(output);
  readln(k);
  for i:=1 to k do
    if main then writeln('YES')
    else writeln('NO');
  close(input);close(output);
end.