var f:array[0..1001,0..1001]of longint;
    t1,t2:array[0..1001]of longint;
    i,j,n,ans,m,m1,m2,m3,m4,k,mint:longint;
begin
  assign(input,'b.in');reset(input);
  assign(output,'b.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    begin
      readln(t1[i],t2[i]);
    end;
  fillchar(f,sizeof(f),$f7);
  f[0,0]:=0;
  for k:=1 to n do
  if(t1[k]<=m)or(t2[k]<=m)then
  begin
  m1:=m3;m2:=m4;
  for i:=m1 downto 0 do
  for j:=m2 downto 0 do
    if f[i,j]>=0 then
      begin
        if i+t1[k]<=m then
          begin
            if i+t1[k]>m3 then m3:=i+t1[k];
            if f[i,j]+1>f[i+t1[k],j]then f[i+t1[k],j]:=f[i,j]+1;
          end;
        if j+t2[k]<=m then
          begin
            if j+t2[k]>m4 then m4:=j+t2[k];
            if f[i,j]+1>f[i,j+t2[k]]then f[i,j+t2[k]]:=f[i,j]+1;
          end;
      end;
  end;
  for i:=0 to m do
  for j:=0 to m do
  begin
    if i>j then k:=i else k:=j;
    if f[i,j]>ans then
      begin
       ans:=f[i,j];
       mint:=k;
      end
    else
    if (f[i,j]=ans)and(k<mint)then
      mint:=k;
  end;
  if ans=0 then writeln(-1)
  else
  begin
    writeln(ans);
    writeln(mint);
  end;
  close(input);close(output);
end.