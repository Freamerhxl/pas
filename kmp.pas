var i,j:longint;
    p:array[0..1000]of longint;
    a,b:ansistring;
begin
readln(a);
readln(b);
j:=0;
for i:=2 to length(b) do
  begin
    while(j>0)and(b[j+1]<>b[i])do j:=p[j];
    if b[j+1]=b[i]then inc(j);
    p[i]:=j;
  end;
j:=0;
for i:=1 to length(a)do
  begin
    while(j>0)and(b[j+1]<>a[i])do j:=p[j];
    if b[j+1]=a[i]then inc(j);
    if j=length(b)then
      begin
        write(j-length(b)+1,' ');
        j:=p[j];
      end;
  end;
end.