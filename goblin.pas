var f,p:Array[0..4200001]of longint;
    id:array[0..4200001]of byte;
    a,b,c,tc1,tc2:array[0..101]of longint;
    i,j,n,m,max,ans,k:longint;
begin
  assign(input,'goblin.in');reset(input);
  assign(output,'goblin.out');rewrite(output);
  readln(n,m);
  fillchar(f,sizeof(f),$f7);
  f[0]:=0;
  for i:=1 to m do
    begin
      readln(a[i],b[i]);
      if a[i]<b[i] then
      for j:=0 to n-a[i]do
        if f[j]>=0 then
        if f[j]+b[i]-a[i]>f[j+a[i]]then
          begin
            f[j+a[i]]:=f[j]+b[i]-a[i];
            id[j+a[i]]:=i;
            p[j+a[i]]:=j;
          end;
    end;
  for j:=0 to n do
    if(f[j]>max)then
      begin
        max:=f[j];
      end;
  fillchar(tc1,sizeof(tc1),$f7);
  for j:=0 to n do
    if f[j]=max then
      begin
        i:=j;
        fillchar(tc2,sizeof(tc2),0);
        while i<>0 do
          begin
            inc(tc2[id[i]]);
            i:=p[i];
          end;
        for i:=1 to m do
          if tc2[i]>tc1[i]then
            begin
              tc1:=tc2;
              break;
            end;
      end;
  for i:=1 to m do
    inc(c[i],tc1[i]);
  fillchar(f,sizeof(f),$f7);
  fillchar(p,sizeof(p),0);
  fillchar(id,sizeof(id),0);
  f[0]:=0;
  for i:=1 to m do
    if b[i]<a[i]then
    for j:=0 to n+max-b[i]do
    if f[j]>=0 then
    if f[j]+a[i]-b[i]>f[j+b[i]]then
      begin
        f[j+b[i]]:=f[j]+a[i]-b[i];
        id[j+b[i]]:=i;
        p[j+b[i]]:=j;
      end;
  for j:=0 to n+max do
    if(f[j]>ans)then
      begin
        ans:=f[j];
      end;
  fillchar(tc1,sizeof(tc1),$f7);
  for j:=0 to n+max do
    if f[j]=ans then
      begin
        i:=j;
        fillchar(tc2,sizeof(tc2),0);
        while i<>0 do
          begin
            inc(tc2[id[i]]);
            i:=p[i];
          end;
        for i:=1 to m do
          if tc2[i]>tc1[i]then
            begin
              tc1:=tc2;
              break;
            end;
      end;
  for i:=1 to m do
    inc(c[i],tc1[i]);
  writeln(max+ans);
  for i:=1 to m do
    if c[i]>0 then
      begin
        if a[i]<b[i]then
          writeln('Buy ',c[i],' from Alliance')
        else
          writeln('Buy ',c[i],' from Horde');
      end
    else
      writeln('Buy 0');
  close(input);close(output);
end.