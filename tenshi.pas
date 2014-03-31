program Iambj11;
var a:array[0..500001]of longint;
    i,j,n,m,k,t,w,mid,ans:longint;
    ch:char;
function can(x:longint):boolean;
var i,count,en:longint;
begin
  en:=0;count:=0;
  for i:=1 to n do
    if a[i]>en then
      begin
        inc(count);en:=a[i]+x-1;
        if count>k then exit(false);
      end;
  exit(true);
end;
begin
  assign(input,'tenshi.in');reset(input);
  assign(output,'tenshi.out');rewrite(output);
  readln(m,k);
  for i:=1 to m do
    begin
      read(ch);
      if ch='1' then
        begin
          inc(n);a[n]:=i;
        end;
    end;
  if n=0 then
    begin
     writeln(0)
    end
  else
    begin
      t:=1;w:=m;
      mid:=(t+w)>>1;
      repeat
        if can(mid)then
          begin
            ans:=mid;w:=mid-1;
          end
        else t:=mid+1;
        mid:=(t+w)>>1;
      until t>w;
      writeln(ans);
    end;
  close(input);close(output);
end.
