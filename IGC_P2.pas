var p:array[0..50000]of longint;
    flag:boolean;
    n,i,j,ans,m,pp,kk:longint;
    x:extended;
function gcd(a,b:longint):longint;
begin
  if b=0 then exit(a)
  else exit(gcd(b,a mod b));
end;
begin
 // assign(input,'IGC_P2.in');reset(input);
 // assign(output,'IGC_P2.out');rewrite(output);
  readln(n);
  p[1]:=2;m:=1;
  for i:=3 to 50000 do
    begin
      flag:=true;
      for j:=1 to m do
        if i mod p[j]=0 then
          begin
            flag:=false;
            break;
          end;
      if flag then
        begin
          inc(m);
          p[m]:=i;
        end;
    end;
  x:=n;kk:=n;
  ans:=1;
  for i:=1 to m do
    if n mod p[i]=0 then
      begin
        x:=x*(1-(1/p[i]));pp:=0;
        while n mod p[i]=0 do begin n:=n div p[i];inc(pp);end;
        ans:=ans*(pp+1);
      end;
  if n<>1 then
    begin
      x:=x*(1-(1/n));
      ans:=ans*2;
    end;
  writeln(kk-(round(x)+ans-1));
  close(output);
end.
