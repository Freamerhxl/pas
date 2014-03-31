var a:array[0..30001]of longint;
    i,n,ans,j,w:longint;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  k:=a[(t+w)>>1];
  i:=t;j:=w;
  repeat
    while(a[i]<K)do inc(i);
    while(a[j]>k)do dec(j);
    if i<=j then
      begin
        a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'canoe.in');reset(input);
  assign(output,'canoe.out');rewrite(output);
  readln(w);readln(n);
  for i:=1 to n do
    read(a[i]);
  sort(1,n);
  i:=1;j:=n;
  while i<=j do
    begin
      inc(ans);
      if i=j then
        i:=i+1
      else
        begin
          if a[i]+a[j]<=w then
            begin
              inc(i);dec(j);
            end
          else dec(j);
        end;
    end;
  writeln(ans);
  close(input);close(output);
end.