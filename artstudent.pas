var a,b:array[0..100001,1..2]of longint;
    f:array[0..100001,0..5]of longint;
    p:array[0..100001]of longint;
    i,t,n,m,x,y,k,l,r,ans:longint;
    st,ss:string;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;
  k:=a[(t+w)>>1,1];
  repeat
    while(a[i,1]<k)do inc(i);
    while(a[j,1]>k)do dec(j);
    if i<=j then
      begin
        a[0]:=a[i];a[i]:=a[j];a[j]:=a[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'artstudent.in');reset(input);
  assign(output,'artstudent.out');rewrite(output);
  readln(n,m);k:=0;
  for i:=1 to m do
    begin
      readln(st);
      delete(st,1,pos(':',st));
      ss:=copy(st,1,pos('-',st)-1);val(ss,x,x);
      delete(st,1,pos('-',st));val(st,y,y);
      if p[x]=0 then
        begin
          inc(k);a[k,1]:=x;a[k,2]:=y;p[x]:=k;
        end
        else
        if y>a[p[x],2]then a[p[x],2]:=y;
    end;
  sort(1,k);
  m:=0;
  l:=a[1,1];r:=a[1,2];
  for i:=2 to k do
    if a[i,1]<=r then
      begin
        if a[i,2]>r then r:=a[i,2];
      end
    else
      begin
        inc(m);b[m,1]:=l;b[m,2]:=r;
        l:=a[i,1];r:=a[i,2];
      end;
  inc(m);b[m,1]:=l;b[m,2]:=r;
  fillchar(p,sizeof(p),0);
  for i:=1 to m do
    begin
      inc(p[b[i,1]]);
      dec(p[b[i,2]]);
    end;
  x:=0;
  for i:=1 to n do
    begin
      f[i,1]:=f[i-1,0];
      f[i,2]:=f[i-1,1];
      f[i,3]:=f[i-1,2];
      f[i,4]:=f[i-1,3];
      f[i,5]:=f[i-1,4];
      f[i,0]:=f[i-1,5];
      if x=0 then
        begin
          if f[i-1,0]+1>f[i,1]then f[i,1]:=f[i-1,0]+1;
          if f[i-1,1]+1>f[i,1]then f[i,1]:=f[i-1,1]+1;
          if f[i-1,2]+1>f[i,1]then f[i,1]:=f[i-1,2]+1;
        end;
      inc(x,p[i]);
    end;
  if x<>0 then writeln(-1)
  else
  begin
    if f[n,1]>f[n,0]then f[n,0]:=f[n,1];
    if f[n,2]>f[n,0]then f[n,0]:=f[n,2];
    writeln(f[n,0]);
  end;
  close(input);close(output);
end.
