var n,k,i,j:longint;
    a1,a2:array[0..33]of qword;
    ans:qword;
begin
  assign(input,'recuitment.in');reset(input);
  assign(output,'recuitment.out');rewrite(output);
  readln(n);
  a1[1]:=1;
  a2[1]:=1;
  for i:=2 to 33 do
    begin
      a1[i]:=a1[i-1]*2;
      a2[i]:=a2[i-1]*3;
    end;
  for i:=1 to n do
    begin
      ans:=0;
      read(k);
      for j:=33 downto 1 do
        if a1[j]<=k then
          begin
            ans:=ans+a2[j];
            k:=k-a1[j];
          end;
      writeln(ans);
    end;
  close(input);close(output);
end.
