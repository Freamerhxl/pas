program marisa;
uses math;
const p=3.1415926;
var dp,b:array[0..2001]of double;
    va,ct,mul,x,y:array[0..2001]of longint;
    i,j,n,m,k:longint;
    kk,k1,k2:double;
function get(x,y:longint):double;
begin
  exit(y-x*kk);
end;
procedure swap(i,j:longint);
var t:longint;
    tt:double;
begin
  t:=va[i];va[i]:=va[j];va[j]:=t;
  t:=mul[i];mul[i]:=mul[j];mul[j]:=t;
  t:=x[i];x[i]:=x[j];x[j]:=t;
  t:=y[i];y[i]:=y[j];y[j]:=t;
  t:=ct[i];ct[i]:=ct[j];ct[j]:=t;
  tt:=b[i];b[i]:=b[j];b[j]:=tt;
end;
procedure sort(t,w:longint);
var i,j:longint;
    k:double;
begin
  i:=t;j:=w;
  k:=b[(t+w)div 2];
  repeat
    while b[i]<k do inc(i);
    while b[j]>k do dec(j);
    if i<=j then
      begin
        swap(i,j);
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'marisa.in');reset(input);
  assign(output,'marisa.out');rewrite(output);
  readln(n);
  m:=0;
  for i:=1 to n do
    begin
      readln(x[i],y[i],va[i],mul[i]);
      ct[i]:=1;
    end;
  readln(k);
  if k<>90 then
  begin
  kk:=tan((p/180)*k);
  for i:=1 to n do
    b[i]:=get(x[i],y[i]);
  end
  else
    begin
      for i:=1 to n do
        b[i]:=x[i];
    end;
  for i:=1 to n-1 do
    if b[i]<>20000 then
      begin
        for j:=i+1 to n do
          begin
            if(abs(b[i]-b[j])<10e-6)then
              begin
                inc(ct[i]);inc(va[i],va[j]);inc(mul[i],mul[j]);
                b[j]:=20000;
              end;
          end;
      end;
  sort(1,n);
  while b[n]=20000 do dec(n);
  ct[0]:=0;va[0]:=0;mul[0]:=0;
  dp[0]:=0;
  for i:=1 to n do
    begin
      ct[i]:=ct[i-1]+ct[i];va[i]:=va[i-1]+va[i];mul[i]:=mul[i-1]+mul[i];
      for j:=i-1 downto 0 do
        if dp[j]+((va[i]-va[j])*((mul[i]-mul[j])/(ct[i]-ct[j])))>dp[i] then
          dp[i]:=dp[j]+((va[i]-va[j])*((mul[i]-mul[j])/(ct[i]-ct[j])));
    end;
  writeln(dp[n]:0:3);
  close(input);close(output);
end.
