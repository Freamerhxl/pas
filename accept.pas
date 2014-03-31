var ans,l,r,mid:qword;
    n,a,b,i,j,k,kk:longint;
    temp:extended;
begin
  assign(input,'accept.in');reset(input);
  assign(output,'accept.out');rewrite(output);
  readln(n,a,b);
  if b>=n then
    begin
      if a>=n then
         begin
          writeln(b-a+1);
          close(output);
          halt;
         end;
      ans:=b-n+1;
      b:=n-1;
    end;
  while b>=a do
    begin
      temp:=n/b;
      if n mod b=0 then
        begin
          k:=n div b;
        end
      else
        begin
          k:=trunc(temp)+1;
        end;
      l:=a;r:=b;mid:=(l+r)>>1;
      repeat
        if(n/mid>k) then
          begin
           l:=mid+1;
          end
        else
        begin
        r:=mid-1;kk:=mid;
        end;
        mid:=(l+r)>>1;
      until l>r;
      ans:=ans+qword(b-kk+1)*k;
      b:=kk-1;
    end;
  writeln(ans);
  close(input);close(output);
end.