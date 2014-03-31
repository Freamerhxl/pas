var  f:array[0..24,0..24]of int64;
     ff:array[0..60000]of int64;
     i,j,n,m,k,p,t:longint;
     ans,op,tt:int64;
begin
  assign(input,'Network.in');reset(input);
  assign(output,'Network.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      read(t,k);
      for j:= t-k to t-k+t-1 do
        begin
          read(m);
          f[t,(j-1) mod t+1]:=f[t,(j-1) mod t+1]+int64(m);
        end;
    end;
  for i:=1 to 24 do
   if i in[1,13,17,19,23]then
     begin
       tt:=0;
       for j:=1 to i do
        if f[i,j]>tt then tt:=f[i,j];
       op:=op+tt;
     end
   else
   for j:=1 to 55440 do
     ff[j]:=ff[j]+f[i,(j-1)mod i+1];
  for i:=1 to 55440 do
    if ff[i]>ans then ans:=ff[i];
  writeln(ans+op);
  close(input);close(output);
end.