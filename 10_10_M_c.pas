var a,c,d,e,f,f1,f2:array[0..1001,0..1001]of longint;
    n,m,i,j,k,x,y,ans:longint;
function fmin(a,b:longint):longint;
begin
  if a<b then exit(a)else exit(b);
end;
begin
  readln(n,m);
  fillchar(a,sizeof(a),43);
  for i:=1 to n do
  for j:=1 to m do
    read(a[i,j]);
  for i:=n downto 1 do
    begin
      for j:=1 to m do
        if(a[i,j]=0) then
          begin
           if a[i,j-1]=0then c[i,j]:=c[i,j-1]+1
             else c[i,j]:=1;
          end;
    end;
  for i:=1 to n do
  for j:=1 to m do
    if a[i,j]=0 then
      begin
        if a[i-1,j]=0 then d[i,j]:=d[i-1,j]+1
          else d[i,j]:=1;
        f1[i,j]:=fmin(f1[i,j-1],f1[i-1,j])+1;
      end;
  for i:=1 to n do
  for j:=m downto 1 do
    if a[i,j]=1 then
      begin
        if a[i,j+1]=1 then e[i,j]:=e[i,j+1]+1
          else e[i,j]:=1;
      end;
  for i:=n downto 1 do
  for j:=m downto 1 do
    if a[i,j]=1 then
      begin
        if a[i+1,j]=1 then f[i,j]:=f[i+1,j]+1
          else f[i,j]:=1;
        f2[i,j]:=fmin(f2[i,j+1],f2[i+1,j])+1;
      end;
  ans:=0;
  for i:=1 to n do
  for j:=1 to m do
    if(a[i,j]=1)and(f2[i,j]>ans)then
      begin
        x:=i+f2[i,j]-1;y:=j+f2[i,j];
        if(x>=1)and(x<=n)and(y>=1)and(y<=m)then
        if f2[i,j]=f1[x,y]then
          ans:=f2[i,j];
        x:=i+f2[i,j];y:=j+f2[i,j]-1;
        if(x>=1)and(x<=n)and(y>=1)and(y<=m)then
        if f2[i,j]=f1[x,y]then
          ans:=f2[i,j];
      end;
  writeln(ans);
end.