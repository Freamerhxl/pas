var s0,s1,s2,s:ansistring;
    t:array[0..20001]of integer;
    aa:array[0..50]of integer;
    m1,m2,m3:array[1..4,1..4]of int64;
    i,j,n,m,p,tt:longint;
    a1,a2,a3,ans:int64;
function kmp(ss:ansistring):longint;
var i,j:longint;
begin
  kmp:=0;j:=0;
  for i:=1 to length(ss)do
    begin
      while(j>0)and(s[j+1]<>ss[i])do j:=t[j];
      if s[j+1]=ss[i]then inc(j);
      if j=length(s)then
        begin
          inc(kmp);
          if kmp>p then dec(kmp,p);
          j:=t[j];
        end;
    end;
end;
procedure fuck;
var i,j:longint;
begin
  s0:='0';s1:='1';
  for i:=2 to n do
    begin
      s2:=s0+s1;
      s0:=s1;
      s1:=s2;
    end;
  writeln(kmp(s1)mod p);
  halt;
end;
procedure get_tt;
var i,j,k:longint;
begin
  s0:='0';s1:='1';
  for i:=2 to 27 do
    begin
      s2:=s0+s1;
      s0:=s1;
      s1:=s2;
    end;
  a1:=kmp(s1);a2:=kmp(s0+s1);a3:=kmp(s1+s0+s1);
  tt:=(kmp(s0+s1+s1+s0+s1)-2*a2-a1)mod p;
  tt:=(tt+p)mod p;

end;
procedure mul1;
var i,j,k:integer;
begin
  fillchar(m3,sizeof(m3),0);
  for i:=1 to 4 do
  for j:=1 to 4 do
  for k:=1 to 4 do
    m3[i,j]:=((m3[i,j]+(m1[i,k]*m1[k,j])mod p)+p)mod p;
  m1:=m3;
end;
procedure mul2;
var i,j,k:integer;
begin
  fillchar(m3,sizeof(m3),0);
  for i:=1 to 4 do
  for j:=1 to 4 do
  for k:=1 to 4 do
    m3[i,j]:=((m3[i,j]+(m1[i,k]*m2[k,j])mod p)+p)mod p;
  m1:=m3;
end;
begin
  assign(input,'data.txt');reset(input);
  readln(n,m,p);
  readln(s);
  t[1]:=0; j:=0;
  for i:=2 to m do
    begin
      while(j>0)and(s[j+1]<>s[i])do j:=t[j];
      if s[j+1]=s[i]then inc(j);
      t[i]:=j;
    end;
  if n<30 then
    fuck;
  get_tt;
  n:=n-29;
  m1[1,1]:=0;m1[1,2]:=2;m1[1,3]:=1;m1[1,4]:=1;
  m1[2,1]:=1;m1[2,2]:=0;m1[2,3]:=0;m1[2,4]:=0;
  m1[3,1]:=0;m1[3,2]:=1;m1[3,3]:=0;m1[3,4]:=0;
  m1[4,1]:=0;m1[4,2]:=0;m1[4,3]:=0;m1[4,4]:=1;
{  m1[1,1]:=0;m1[1,2]:=0;m1[1,3]:=0;m1[1,4]:=0;
  m1[2,1]:=1;m1[2,2]:=0;m1[2,3]:=0;m1[2,4]:=2;
  m1[3,1]:=0;m1[3,2]:=1;m1[3,3]:=0;m1[3,4]:=1;
  m1[4,1]:=0;m1[4,2]:=0;m1[4,3]:=1;m1[4,4]:=1; }
  m2:=m1;
  while n>0 do
    begin
      inc(aa[0]);aa[aa[0]]:=n mod 2;
      n:=n div 2;
    end;
  for i:=aa[0]-1 downto 1 do
    begin
      mul1;
      if aa[i]=1 then mul2;
    end;
  ans:=(a3*m1[1,1])mod p+(a2*m1[1,2])mod p+(a1*m1[1,3])mod p+(tt*m1[1,4])mod p;
  writeln(ans mod p);
end.