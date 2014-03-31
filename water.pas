var a:array[0..1001,1..2]of ansistring;
    id:array[0..1001]of longint;
    i,j,n,m:integer;
function compare(i,k,st,na:ansistring):longint;
begin
 if length(i)>length(st)then exit(1);
 if length(i)<length(st)then exit(-1);
 if length(i)=length(st)then
   begin
     if i>st then exit(1);
     if i<st then exit(-1);
   end;
 if k<na then exit(1);
 if k>na then exit(-1);
 exit(0);
end;
procedure sort(t,w:integer);
var i,j,k:integer;
    st,na:ansistring;
begin
  i:=t;j:=w;
  k:=(t+w)>>1;
  st:=a[k,2];na:=a[k,1];
  repeat
    while(compare(a[i,2],a[i,1],st,na)>0)do inc(i);
    while(compare(a[j,2],a[j,1],st,na)<0)do dec(j);
    if i<=j then
      begin
     //   id[0]:=id[i];id[i]:=id[j];id[j]:=id[0];
        a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'water.in');reset(input);
  assign(output,'water.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(a[i,1]);
      readln(a[i,2]);
    end;
  sort(1,n);
  for i:=1 to n do
    writeln(a[i,1]);
  close(input);close(output);
end.