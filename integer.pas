const p=100000000;
var ans:array[0..1000]of int64;
    i,j,n:longint;
begin
  assign(input,'input.txt');reset(input);
  assign(output,'output.txt');rewrite(output);
  readln(n);
  if n<=4 then
    writeln(n)
  else
    begin
      ans[0]:=1;
      if n mod 3=1 then
         begin
           ans[1]:=4;n:=n-4;
         end
      else
      if n mod 3=0 then
        ans[1]:=1
      else
      if n mod 3=2 then
        begin
          ans[1]:=2;n:=n-2;
        end;
      while n>0 do
        begin
          n:=n-3;
          for i:=1 to ans[0]do
            ans[i]:=ans[i]*3;
          for i:=1 to ans[0]do
            begin
              ans[i+1]:=ans[i+1]+ans[i] div p;
              ans[i]:=ans[i]mod p;
            end;
          while ans[ans[0]+1]>0 do inc(ans[0]);
        end;
      write(ans[ans[0]]);
      for i:=ans[0]-1 downto 1 do
        begin
          if ans[i]<10000000 then write(0);
          if ans[i]<1000000 then write(0);
          if ans[i]<100000 then write(0);
          if ans[i]<10000 then write(0);
          if ans[i]<1000 then write(0);
          if ans[i]<100 then write(0);
          if ans[i]<10 then write(0);
          WRITE(ANS[I]);
        end;
    end;
  close(input);close(output);
end.