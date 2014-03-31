var data:array[0..1001,1..2]of ansistring;
    i,j,n,l,ml,x,y,z:longint;
    ans:ansistring;
function compare(a,b:ansistring):integer;
var i:integer;
begin
  if length(a)>length(b)then exit(1)
  else
  if length(a)<length(b)then exit(-1);
  for i:=1 to length(a)do
   if a[i]>b[i]then
     exit(1)
   else
   if a[i]<b[i]then
     exit(-1);
   exit(0);
end;
procedure sort(t,w:longint);
var s1,s2:ansistring;
    i,j,op:longint;
begin
  s1:=data[(t+w)>>1,1];s2:=data[(t+w)>>1,2];
  i:=t;j:=w;
  repeat
    op:=compare(data[i,2],s2);
    while(op=1)or((op=0)and(data[i,1]<s1))do begin inc(i);op:=compare(data[i,2],s2);end;
    op:=compare(data[j,2],s2);
    while(op=-1)or((op=0)and(data[j,1]>s1))do begin dec(j);op:=compare(data[j,2],s2);end;
    if i<=j then
      begin
        data[0]:=data[i];data[i]:=data[j];data[j]:=data[0];
        inc(i);dec(j);
      end;
  until i>j;
  if i<w then sort(i,w);
  if j>t then sort(t,j);
end;
begin
  assign(input,'boss.in');reset(input);
  assign(output,'boss.out');rewrite(output);
  readln(n);
  ans:='';
  for i:=1 to 490 do
    ans:=ans+'0';
  for i:=1to n do
    begin
      readln(data[i,1]);readln(data[i,2]);
      l:=length(data[i,2]);z:=0;
      for j:=490 downto 1 do
        begin
          if l>0 then x:=ord(data[i,2][l])-48
            else x:=0;
          y:=ord(ans[j])-48;
          ans[j]:=chr((x+y+z)mod 10+48);
          z:=(x+y+z)div 10;
          dec(l);
        end;
    end;
  sort(1,n);
  for i:=1 to n do
    writeln(data[i,1]);
  writeln(ans);
  close(input);close(output);
end.
