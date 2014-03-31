var f:array[0..36768,0..50]of longint;
    a,p,t:array[0..51]of longint;
    i,j,n,m,k,c,op,pp,t1,t2,ans:longint;
begin
  readln(n,c);
  t[1]:=1;
  for i:=2 to 16 do
    t[i]:=t[i-1]*2;
  for i:=1 to n do
    read(a[i]);
  for i:=0 to c do
    read(p[i]);
  fillchar(f,sizeof(f),$f7);
  for i:=1 to n do
    f[t[i],a[i]]:=p[a[i]];
  k:=3;
  for i:=3 to 1<<n-1 do
    begin
    if i=t[k]then
      begin
        inc(k);continue;
      end;
    for j:=1 to n do
      if i and t[j]>0 then
         begin
           op:=i xor t[j];
           for pp:=0 to  c do
           if f[op,pp]>=0 then
             begin
               if f[op,pp]+p[a[j]]>f[i,a[j]]then
                  f[i,a[j]]:=f[op,pp]+p[a[j]];
               if f[op,pp]+p[a[j]]>f[i,pp]then
                  f[i,pp]:=f[op,pp]+p[a[j]];
               t1:=pp+a[j];if t1>c then t1:=c;t2:=pp+a[j]-t1;
               if f[op,pp]-p[pp]+p[t1]+p[t2]>f[i,t1]then
                 f[i,t1]:=f[op,pp]-p[pp]+p[t1]+p[t2];
               if f[op,pp]-p[pp]+p[t1]+p[t2]>f[i,t2]then
                 f[i,t2]:=f[op,pp]-p[pp]+p[t1]+p[t2];
             end;
         end;
    end;
  for i:=0 to  c do
    if f[1<<n-1,i]>ans then
      ans:=f[1<<n-1,i];
  writeln(ans);
end.