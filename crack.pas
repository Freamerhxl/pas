var a:array[0..2001]of longint;
    b:array[0..2001]of longint;
    i,j,ans1,ans2,n,k,op,p:longint;
    ch:char;
    flag:boolean;
begin
  assign(input,'crack.in');reset(input);
  assign(output,'crack.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      read(ch);
      if ch in['A','a']then a[i]:=0;
      if ch in['B','b']then a[i]:=1;
      if ch in['C','c']then a[i]:=2;
      if ch in['D','d']then a[i]:=3;
    end;
  ans1:=maxlongint;
  for i:=n downto 1 do
    begin
      fillchar(b,sizeof(b),0);
      k:=0;op:=0;
      flag:=true;
      for j:=1 to n-i+1 do
        begin
           p:=(a[j]+k)mod 4;
           if p>0 then
            begin
              op:=op+4-p;
              k:=k+4-p;
              inc(b[j+i-1],p-4);
            end;
          inc(k,b[j]);
        end;
      for j:=n-i+2 to n do
        begin
          p:=(a[j]+k)mod 4;
          if p>0 then
            begin
              flag:=false;
              break;
            end;
          inc(k,b[j]);
        end;
      if flag and(op<ans1)then
        begin
          ans1:=op;ans2:=i;
        end;
    end;
  writeln(ans1,' ',ans2);
  close(input);close(output);
end.