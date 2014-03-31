var f,map:array[0..251,0..251]of dword;
    i,j,n,m,x,y,flag,ans,z:dword;
begin
  assign(input,'heart.in');reset(input);
  assign(output,'heart.out');rewrite(output);
  readln(n,m);
  fillchar(f,sizeof(f),43);
  flag:=f[0,0];
  for i:=1 to m do
    begin
      read(x,y,z);
      if z<f[x,y]then
        begin
          f[x,y]:=z;
          f[y,x]:=z;
        end;
    end;
  map:=f;
  ans:=flag;
  for x:=1 to n do
  begin
  for i:=1 to x-1 do
  for j:=i+1 to x-1 do
    if f[i,j]+map[i,x]+map[x,j]<ans then
      ans:=f[i,j]+map[i,x]+map[x,j];
  for i:=1 to n do
  for j:=1 to n do
    if(f[i,x]+f[x,j]<f[i,j])then
      f[i,j]:=f[i,x]+f[x,j];
  end;
  if ans<flag then
    writeln(ans)
  else writeln('He will never come back.');
  close(input);close(output);
end.