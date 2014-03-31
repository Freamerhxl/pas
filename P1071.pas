var f,a,b:array[0..3001]of longint;
    i,j,n,ans:longint;
begin
  readln(n);
  for i:=1 to n do read(a[i]);
  for i:=1 to n do read(b[i]);
  for i:=1 to n do
    begin
      ans:=0;
      for j:=1 to n do
        begin
          if(a[i]>b[j])and(f[j]>ans)then ans:=f[j]
            else if(a[i]=b[j])and(ans+1>f[j])then f[j]:=ans+1;
        end;
    end;
  ans:=0;
  for i:=1 to n do
    if f[i]>ans then ans:=f[i];
  writeln(ans);
end.