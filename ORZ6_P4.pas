var a:array[0..5000001]of -1..1;
    out:array[0..100001]of longint;
    n,m,i,j,t,w,mid,ans,l:longint;
    ch:char;
function can(x:longint):boolean;
var op,i,k:longint;
begin
  op:=0;k:=1;
  for i:=1 to n do
    begin
      inc(op,a[i]);
      if abs(op)>x then
        begin
          inc(k);
          op:=a[i];
        end;
      if k>m then exit(false);
    end;
  exit(true);
end;
begin
  readln(n,m);
  for i:=1 to n do
    begin
      read(ch);
      if ch='0' then a[i]:=-1
      else a[i]:=1;
    end;
  t:=1;w:=n;
  mid:=(t+w)>>1;
  repeat
    if can(mid)then
      begin
         ans:=mid;
         w:=mid-1
      end
    else t:=mid+1;
    mid:=(t+w)>>1;
  until t>w;
  l:=0;
  t:=0;w:=0;
  for i:=n downto 1 do
    begin
      inc(t,a[i]);
      if abs(t)>ans then
        begin
          inc(l);out[l]:=w;
          w:=0;t:=a[i];
        end;
      inc(w);
    end;
  write(w);
  for i:=l downto 1 do
    write(' ',out[i]);writeln;
  t:=0;w:=0;
  l:=0;
  for i:=1 to n do
    begin
      inc(t,a[i]);
      if abs(t)>ans then
        begin
          inc(l);out[l]:=w;
          w:=0;t:=a[i];
        end;
      inc(w);
    end;
  for i:=1to l do
    write(out[i],' ');
  writeln(w);
end.