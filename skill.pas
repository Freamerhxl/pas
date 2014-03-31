var f:array[0..61,-1..61,0..501]of longint;
    a:array[0..61,0..61]of longint;
    i,j,n,m,k,p,mc,ans,op,rr:longint;
begin
  assign(input,'skill.in');reset(input);
  assign(output,'skill.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
  for j:=n downto i do
    read(a[j,i]);
  for i:=1 to n do
  for j:=2 to i do
   a[i,j]:=a[i,j-1]+a[i,j];
  fillchar(f,sizeof(f),$f7);
  for i:=0 to n do
    f[i,0,0]:=0;
  for i:=1 to n do
  for j:=0 to i do
  begin
  if j=0 then op:=0
    else op:=j-1;
  rr:=i*(i-1)>>1;if rr>m then rr:=m;
  for p:=op to i-1 do
  for k:=p*(p+1)>>1 to rr do
    if(k+j<=m)then
      begin
        if(f[i-1,p,k]+a[i,j]>f[i,j,k+j])then
          f[i,j,k+j]:=f[i-1,p,k]+a[i,j];
      end
    else
      break;
  end;
  ans:=0;
  for i:=1 to n do
  for j:=0 to i do
  for k:=j*(j+1)>>1 to m do
    if f[i,j,k]>ans then ans:=f[i,j,k];
  writeln(ans);
  close(input);close(output);
end.