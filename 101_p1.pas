var a:array[0..100001]of ansistring;
    i,j,n,m,ans:longint;
    st:ansistring;
procedure sort(t,w:longint);
var i,j:longint;
    k:ansistring;
begin
  i:=t;j:=w;
  k:=a[(t+w)>>1];
  repeat
    while a[i]<k do inc(i);
    while a[j]>k do dec(j);
    if i<=j then
      begin
        a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
function find(s:ansistring):boolean;
var t,w,mid:longint;

begin
  t:=1;w:=n;
  mid:=(t+w)>>1;
  repeat
    if a[mid]>s then w:=mid-1
     else
       begin
         if a[mid]=s then exit(true);
         t:=mid+1;
       end;
     mid:=(t+w)>>1;
  until t>w;
  exit(false);
end;
begin
  readln(n);
  for i:=1 to n do
    readln(a[i]);
  sort(1,n);
  readln(m);
  for i:=1 to m do
    begin
      readln(st);
      if find(st)then inc(ans);
    end;
  writeln(ans);
end.
