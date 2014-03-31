var s:ansistring;
    r,m,t,l,i,j:longint;
    ans:array[0..2000]of int64;
    flag:boolean;
    k:int64;
procedure print;
var i:longint;
begin
  if l=0 then writeln(0)
  else
  begin
  for i:=l downto 1 do
    write(ans[i]);
  writeln('??');
  end;
end;
procedure jin;
var i:longint;
begin
  flag:=false;
  for i:=1 to l do
     if ans[i]>9 then
       begin
         ans[i+1]:=ans[i+1]+ans[i]div 10;
         ans[i]:=ans[i]mod 10;
         flag:=true;
       end;
  while ans[l+1]>0 do inc(l);
end;
begin
  assign(input,'T1029_p3.in');reset(input);
  assign(output,'T1029_p3.out');rewrite(output);
  readln(s);readln(m);readln(t);
  if(t=0)then
   writeln(0)
  else
  begin
  for i:=1 to length(s) do
  for j:=1 to length(s) do
    ans[i+j-1]:=ans[i+j-1]+(ord(s[length(s)-i+1])-48)*(ord(s[length(s)-j+1])-48);
  l:=length(s)*2+3;
  while(ans[l]=0)and(l>0)do dec(l);
  flag:=true;
  while flag do
    jin;
  if(m=1)or(t>=m)then
    print
  else
    begin
      j:=0;
      for i:=l downto 1 do
        begin
          j:=j*10+ans[i];
          ans[i]:=j div m;
          j:=j mod m;
        end;
      while(ans[l]=0)and(l>0)do dec(l);
      flag:=true;
      while flag do
        jin;
      for i:=1 to l do
        ans[i]:=ans[i]*t;
      flag:=true;
      while flag do
        jin;
     print;
    end;
  end;
  close(output);
end.