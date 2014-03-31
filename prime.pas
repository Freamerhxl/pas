

const maxn=1000001;
var can:array[0..maxn]of boolean;
    p:array[0..50001]of longint;
    i,j,n,m,l,r,ll,ans:longint;
    flag:boolean;
    now:int64;
begin
  assign(input,'prime.in');reset(input);
  assign(output,'prime.out');rewrite(output);
  m:=3;
  readln(l,r);
  if l<2 then l:=2;
  p[1]:=2;p[2]:=3;p[3]:=5;
  for i:=7 to round(sqrt(r))do
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
       inc(m);p[m]:=i;
     end;
  end;
  for i:=1 to m do
    begin
      ll:=l div p[i];
      if ll<2 then ll:=2;
      for j:=ll to maxlongint do
        begin
          now:=int64(p[i])*int64(j);
          if now>r then break;
          if now>=l then
            can[now-l]:=true;
        end;
    end;
  for i:=0 to r-l do
    if can[i]=false then inc(ans);
  writeln(ans);
  close(input);close(output);
end.
