var l,r,i,ans:int64;
    k,m:longint;
begin
  readln(l,r,m); k:=0;
  while l<=r do
    begin
      i:=l;
      while i>0 do
        begin
          k:=k+i mod 10;
          i:=i div 10;
        end;
      inc(l);
      if k>=m then
        begin
          inc(ans);k:=0;
        end;
    end;
  writeln(ans);
end.
