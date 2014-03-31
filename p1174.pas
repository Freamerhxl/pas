var p:array[0..50001]of longint;
    can:array[0..50001]of boolean;
    i,n,m,j:longint;
    ans:extended;
    now:int64;
begin
  readln(n);
  if n=1 then
    writeln(0)
  else
  begin
  p[1]:=2;p[2]:=3;m:=2;
  i:=1;
  while i<=m do
    begin
      for j:=p[i]to maxlongint do
        begin
          now:=int64(p[i])*int64(j);
          if now>50000 then break;
          can[now]:=true;
        end;
      for j:=p[m]+1 to 50000 do
        if can[j]=false then break;
      if can[j] then break;
      inc(m);p[m]:=j;
      inc(i);
    end;
  ans:=n;
  for i:=1 to m do
    if n mod p[i]=0 then
      begin
        ans:=ans*(1-1/p[i]);
        while n mod p[i]=0 do n:=n div p[i];
      end;
  writeln(ans:0:0);
  end;
end.