var c:array[0..51,0..51]of int64;
    i,j,n,m,k:longint;
begin
  readln(m,n);
  c[0,0]:=1;
  for i:=1 to 50 do
    begin
      c[i,0]:=1;
      for j:=1 to i do
        c[i,j]:=c[i-1,j]+c[i-1,j-1];
    end;
  writeln(c[m,n-1]);
  writeln(c[m-1,n-1]);
end.
