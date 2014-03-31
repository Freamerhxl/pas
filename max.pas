var a:array[0..500000]of longint;
    i,j,n,m,t,x,y:longint;
procedure make;
var i,j,k:longint;
begin
  i:=t;j:=t+n-1;
  while i>1 do
    begin
      k:=i;
      while k<j do
        begin
          if a[k]>a[k+1]then a[k>>1]:=a[k]
            else a[k>>1]:=a[k+1];
          k:=k+2;
        end;
      if j and 1=0 then a[j>>1]:=j;
      i:=i>>1;j:=j>>1;
    end;
end;
function find(x,y:longint):longint;
var i,j,r:longint;
begin
  i:=x+t-1;j:=y+t-1;r:=i;
  while i<=j do
    begin
      if a[j]>a[r]then r:=j;
      if a[i]>a[r]then r:=i;
      if i and 1=1 then inc(i);
      if j and 1=0 then dec(j);
      i:=i>>1;j:=j>>1;
    end;
  exit(a[r]);
end;
begin
  assign(input,'max.in');reset(input);
  assign(output,'max.out');rewrite(output);
  readln(m,n);
  t:=1;
  for i:=1 to maxlongint do
    begin
      if t>=n then break;
      t:=t*2;
    end;
  for i:=t to t+n-1 do
    read(a[i]);
  make;
  for i:=1 to m do
    begin
      readln(x,y);
      writeln(find(x,y));
    end;
  close(input);close(output);
end.