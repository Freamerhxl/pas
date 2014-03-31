var next,count,ex:array[0..200002]of longint;
    a,b:array[0..200002]of char;
    i,j,n,m,k,l,p,t:longint;
begin
  assign(input,'tyvj.in');reset(input);
  readln(n,m,k);
  for i:=1 to n do
    read(a[i]);readln;
  for i:=1 to m do
    read(b[i]);readln;
//---------------------------------------------------
  j:=0;
  while(j<m)and(b[1+j]=b[2+j])do inc(j);
  next[2]:=j;t:=2;
  for i:=3 to m do
    if i+next[i-t+1]<t+next[t] then
      next[i]:=next[i-t+1]
    else
      begin
        if i<t+next[t]then
          j:=t+next[t]-i
        else j:=0;
        while(j<m)and(b[1+j]=b[i+j])do inc(j);
        next[i]:=j;t:=i;
      end;
//---------------------------------------------------
  j:=0;
  while(j<m)and(a[1+j]=b[1+j])do inc(j);
  ex[1]:=j;
  t:=1;
  for i:=2 to n do
    if i+next[i-t+1]<t+ex[t] then
      ex[i]:=next[i-t+1]
    else
      begin
        if i<t+ex[t]then
          j:=t+ex[t]-i
        else j:=0;
        while(j<m)and(b[1+j]=a[i+j])do
          inc(j);
        ex[i]:=j; t:=i;
      end;
  for i:=1 to n do
    inc(count[ex[i]]);
  for i:=1 to k do
    begin
      readln(t);
      writeln(count[t]);
    end;
end.