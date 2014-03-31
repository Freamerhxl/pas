program count_prb;
  var t,ans,an25,an24,an23:int64;
      s,s1,s2,s0,s3,s23,s24,s25,s26:ansistring;
      i,j,n,m,p,an1,an2,an3:longint;
      d,num:array[0..11000] of longint;
      mt1,mt2,mt3:array[1..4,1..4] of int64;
procedure kmp1;
  var i,j,len:longint;
begin
  len:=length(s);
  j:=0;d[1]:=0;d[0]:=0;
  for i:=2 to len do
  begin
    while(j>0)and(s[j+1]<>s[i])do j:=d[j];
    if s[i]=s[j+1] then inc(j);
    d[i]:=j;
  end;
end;

Function kmp2(sk:ansistring):longint;
   var i,j,len,l:longint;
begin
 l:=length(sk);len:=length(s);
 kmp2:=0;j:=0;
 for i:=1 to l do
 begin
   while(j>0)and(sk[i]<>s[j+1])do j:=d[j];
   if sk[i]=s[j+1] then inc(j);
   if j=len then
   begin
     inc(kmp2);
     while(kmp2>=p)do dec(kmp2,p);
     j:=d[j];
   end;
 end;
end;

procedure go;
  var i,j,len,l,ans:longint;
begin
 if n=0 then begin writeln((ord(s='0')) mod p);halt;end;
 if n=1 then begin writeln((ord(s='1')) mod p);halt;end;

 s0:='0';s1:='1';
 for i:=2 to n do
 begin
   s2:=s1;
   s1:=s0+s1;
   s0:=s2;
 end;
 kmp1;
 ans:=kmp2(s1);
writeln(ans mod p);
halt;
end;

procedure ready;
  var i,j,n,m:longint;
begin
 s0:='0';s1:='1';
 for i:=2 to 27 do
 begin
   s2:=s1;
   s1:=s0+s1;
   s0:=s2;
 end;
 kmp1;
 s23:=s1;      an23:=kmp2(s23);
 s24:=s0+s23;  an24:=kmp2(s24);
 s25:=s23+s24; an25:=kmp2(s25);
 t:=(kmp2(s24+s25)-2*an24-an23) mod p;
 t:=(t+p)mod p;
end;

procedure do1;
  var i,j,k:longint;
begin
  fillchar(mt3,sizeof(mt3),0);
  for i:=1 to 4 do
  for j:=1 to 4 do
  for k:=1 to 4 do
  mt3[i,j]:=(mt3[i,j]+(mt1[i,k]*mt1[k,j])mod p)mod p;
 mt1:=mt3;
end;
procedure do2;
  var i,j,k:longint;
begin
  fillchar(mt3,sizeof(mt3),0);
  for i:=1 to 4 do
  for j:=1 to 4 do
  for k:=1 to 4 do
  mt3[i,j]:=(mt3[i,j]+(mt1[i,k]*mt2[k,j])mod p)mod p;
 mt1:=mt3;
end;
begin
 assign(input,'data.txt');reset(input);
 readln(n,m,p);
 readln(s);
 if n<=29 then go;
 ready;
 n:=n-29;
 mt1[1,1]:=0;mt1[1,2]:=2;mt1[1,3]:=1;mt1[1,4]:=1;
 mt1[2,1]:=1;mt1[2,2]:=0;mt1[2,3]:=0;mt1[2,4]:=0;
 mt1[3,1]:=0;mt1[3,2]:=1;mt1[3,3]:=0;mt1[3,4]:=0;
 mt1[4,1]:=0;mt1[4,2]:=0;mt1[4,3]:=0;mt1[4,4]:=1;
 mt2:=mt1;
 num[0]:=0;
 while(n>0)do
  begin
    inc(num[0]);
    num[num[0]]:=n mod  2;
    n:=n div 2;
  end;
 for i:=num[0]-1 downto 1 do
 begin
   do1;
   if num[i]=1 then do2;
 end;
 ans:=(an25*mt1[1,1])mod p+(an24*mt1[1,2])mod p+
      (an23*mt1[1,3])mod p+(t*mt1[1,4])mod p;
 writeln(ans mod p);
end.
