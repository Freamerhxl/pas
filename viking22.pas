var data,a:array[0..200001]of longint;
    i,j,n,m,x,y:longint;
function lowbit(x:longint):longint;
begin
  exit(x and(x xor(x-1)));
end;
procedure change(x,num:longint);
begin
  while x<=n do
    begin
      dec(a[x],num);
      inc(x,lowbit(x));
    end;
end;
procedure sum(x,num:longint);
begin
  while x<=n do
    begin
      inc(a[x],num);
      inc(x,lowbit(x));
    end;
end;
function get(x:longint):longint;
begin
  get:=0;
  while x>0 do
    begin
      inc(get,a[x]);
      dec(x,lowbit(x));
    end;
end;
begin
  readln(n);
  for i:=1 to n do
    begin
      read(data[i]);
      sum(i,data[i]);
    end;
  readln(m);
  for i:=1 to m do
    begin
      readln(x,y);
      writeln((get(y)-get(x-1))*3.14:0:2);
      change((x+y)>>1,data[(x+y)>>1]);
      data[(x+y)>>1]:=0;
    end;
end.
