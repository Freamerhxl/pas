var f:array[0..1001,0..1001,1..2]of int64;
    d,v:array[0..1001]of longint;
    i,j,n,m,k:longint;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;
  k:=d[(t+w)>>1];
  repeat
    while d[i]<k do inc(i);
    while d[j]>k do dec(j);
    if i<=j then
      begin
        d[0]:=d[i];d[i]:=d[j];d[j]:=d[0];
        v[0]:=v[i];v[i]:=v[j];v[j]:=v[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  readln(n);
  readln(m);
  for i:=1 to n do
    readln(d[i],v[i]);
  m:=d[m];
 sort(1,n);
 for i:=1 to n do
   if d[i]=m then break;
 m:=i;
 v[0]:=0;v[n+1]:=0;
 for i:=1 to m do
   v[i]:=v[i-1]+v[i];
 for i:=n downto m do
   v[i]:=v[i+1]+v[i];
 fillchar(f,sizeof(f),63);
 f[m,m,1]:=0;
 f[m,m,2]:=0;
 for i:=m downto 1 do
 for j:=m to n do
   begin
     if i<>m then
       begin
         if f[i+1,j,1]+(v[i]+v[j+1])*(d[i+1]-d[i])<f[i+1,j,2]+(v[i]+v[j+1])*(d[j]-d[i])then
           k:=f[i+1,j,1]+(v[i]+v[j+1])*(d[i+1]-d[i])
         else k:=f[i+1,j,2]+(v[i]+v[j+1])*(d[j]-d[i]);
         if k<f[i,j,1]then f[i,j,1]:=k;
       end;
     if j<>m then
       begin
         if f[i,j-1,1]+(v[i-1]+v[j])*(d[j]-d[i])<f[i,j-1,2]+(v[i-1]+v[j])*(d[j]-d[j-1])then
           k:=f[i,j-1,1]+(v[i-1]+v[j])*(d[j]-d[i])
         else k:=f[i,j-1,2]+(v[i-1]+v[j])*(d[j]-d[j-1]);
         if k<f[i,j,2]then f[i,j,2]:=k;
       end;
   end;
  if f[1,n,1]<f[1,n,2]then
    writeln(f[1,n,1])
  else writeln(f[1,n,2]);
end.