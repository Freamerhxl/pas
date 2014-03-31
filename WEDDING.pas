var a,b,id,out:array[0..10021]of longint;
    done:array[0..10021]of boolean;
    i,j,n,m,k,ans,max,min,l,r,cost:longint;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;k:=b[(t+w)>>1];
  repeat
    while b[i]<k do inc(i);
    while b[j]>k do dec(j);
    if i<=j then
      begin
        b[0]:=b[i];b[i]:=b[j];b[j]:=b[0];
        id[0]:=id[i];id[i]:=id[j];id[j]:=id[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'WEDDING.in');reset(input);
  assign(output,'WEDDING.out');rewrite(output);
  readln(n,m);
  max:=0;min:=maxlongint;
  for i:=1 to m do
    begin
      readln(a[i]);
      out[i]:=i;
    end;
  for i:=1 to n-m do
    begin
      readln(b[i]);
      id[i]:=m+i;
    end;
  n:=n-m;
  if n>1 then
  sort(1,n);
  l:=1;
//------------------------------------insert the min--------------------------
  if n>0 then
  begin
  l:=2;j:=1;
  cost:=abs(a[1]-b[1]);
  if abs(a[m]-b[1])<cost then
    begin
      cost:=abs(a[m]-b[1]);
      j:=m+1;
    end;
  for i:=2 to m do
  if(abs(a[i]-b[1])+abs(a[i-1]-b[1])-abs(a[i]-a[i-1])<cost)then
    begin
      cost:=abs(a[i]-b[1])+abs(a[i-1]-b[1])-abs(a[i]-a[i-1]);
      j:=i;
    end;
  inc(m);
  for i:=m downto j+1 do
    begin
      a[i]:=a[i-1];
      out[i]:=out[i-1];
    end;
  a[j]:=b[1];out[j]:=id[1];
  end;
//------------------------------------insert the max--------------------------
  if n>=l then
  begin
    j:=1;
    cost:=abs(a[1]-b[n]);
    if abs(a[m]-b[n])<cost then
    begin
      cost:=abs(a[m]-b[n]);
      j:=m+1;
    end;
    for i:=2 to m do
    if(abs(a[i]-b[n])+abs(a[i-1]-b[n])-abs(a[i]-a[i-1])<cost)then
      begin
        cost:=abs(a[i]-b[n])+abs(a[i-1]-b[n])-abs(a[i]-a[i-1]);
        j:=i;
      end;
    inc(m);
    for i:=m downto j+1 do
      begin
        a[i]:=a[i-1];
        out[i]:=out[i-1];
      end;
    a[j]:=b[n];out[j]:=id[n];
    dec(n);
  end;
  ans:=0;
  for i:=2 to m do
    ans:=ans+abs(a[i]-a[i-1]);
  writeln(ans);
  for i:=1 to m-1 do
    begin
      writeln(out[i]);
      if a[i]<a[i+1]then
      begin
      for j:=l to n do
        if(b[j]>=a[i])and(b[j]<=a[i+1])and(done[j]=false)then
          begin
            writeln(id[j]);
            done[j]:=true;
          end;
      end
      else
      for j:=n downto l do
        if(b[j]>=a[i+1])and(b[j]<=a[i])and(done[j]=false)then
          begin
            writeln(id[j]);
            done[j]:=true;
          end;
      while done[n]do dec(n);
      while done[l]do inc(l);
    end;
  writeln(out[m]);
  close(input);close(output);
end.