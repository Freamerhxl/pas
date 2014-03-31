var a:array[0..101,1..2]of ansistring;
    i,j,n,m,ans:longint;
begin
  assign(input,'IGC_p1.in');reset(input);
  assign(output,'IGC_p1.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    begin
      readln(a[i,1]);
      a[i,1]:=upcase(a[i,1]);
    end;
  for i:=1 to m do
    begin
      readln(a[i,2]);
      a[i,2]:=upcase(a[i,2]);
    end;
  for i:=1 to n do
  for j:=1 to m do
    begin
      if(pos(a[i,1],a[j,2])>0)or(pos(a[j,2],a[i,1])>0)then
        begin
          inc(ans);break;
        end;
    end;
  writeln(ans);
  close(output);
end.
