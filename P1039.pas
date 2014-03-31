var a:array[0..500000]of longint;
    i,j,n,t,p,x,y,m:longint;
procedure make;
var i,j,k:longint;
begin
  i:=t;j:=t+n-1;
  while i>1 do
    begin
      k:=i;
      while k<j do
        begin
          if a[k]<a[k+1]then a[k>>1]:=a[k]
            else a[k>>1]:=a[k+1];
          k:=k+2;
        end;
      if j and 1=0 then a[j>>1]:=a[j];
      i:=i>>1;j:=j>>1;
    end;
end;
function find(x,y:longint):longint;
var i,j,r:longint;
begin
  i:=t+x-1;j:=t+y-1;r:=i;
  while i<=j do
    begin
      if a[i]<a[r]then r:=i;
      if a[j]<a[r]then r:=j;
      if i and 1=1 then inc(i);
      if j and 1=0 then dec(j);
      i:=i>>1;j:=j>>1;
    end;
  exit(a[r]);
end;
procedure change(x,y:longint);
var i:longint;
begin
  i:=x+t-1;a[i]:=y;
  while i>1 do
    begin
      if i and 1=0 then
        begin
          if(a[i]<a[i+1])then a[i>>1]:=a[i]
          else a[i>>1]:=a[i+1];
        end
      else
        begin
          if(a[i]<a[i-1])then a[i>>1]:=a[i]
          else a[i>>1]:=a[i-1];
        end;
      i:=i>>1;
    end;
end;
begin
  readln(n,m);
  t:=1;
  for i:=1 to maxlongint do
    begin
      if t>=n then break;
      t:=t*2;
    end;
  fillchar(a,sizeof(a),43);
  for i:=t to t+n-1 do
    read(a[i]);
  make;
  for i:=1 to m-1 do
    begin
      readln(p,x,y);
      if p=1 then
        write(find(x,y),' ')
      else
        change(x,y);
    end;
  readln(p,x,y);
  if p=1 then
    writeln(find(x,y));
end.