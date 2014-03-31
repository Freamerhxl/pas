var a:array[0..1001]of longint;
    ans,i,j,n,m,k,mm,now:longint;
begin
  assign(input,'gem.in');reset(input);
  assign(output,'gem.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      read(m);k:=1;
      while m>0 do
        begin
          a[i]:=a[i]+(m mod 7)*k;
          k:=k*10;
          m:=m div 7;
        end;
    end;
  for i:=1 to n do
  for j:=i+1 to n do
    begin
      k:=1;m:=a[i];mm:=a[j];now:=0;
      while(m>0)or(mm>0)do
        begin
          if(m mod 10<>mm mod 10)then
            now:=now+k;
          k:=k*2;m:=m div 10;mm:=mm div 10;
        end;
      if(abs(now-123)<abs(ans-123))then
        ans:=now;
    end;
  writeln(ans);
  close(input);close(output);
end.