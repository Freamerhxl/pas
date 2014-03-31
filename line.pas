var f:array[0..201,0..101]of longint;
    a:array[0..101,0..101,0..21]of longint;
    i,j,n,m,k,flag:longint;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
begin
  assign(input,'line.in');reset(input);
  assign(output,'line.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    begin
      for j:=1 to n do
        if(i<>j)then
          begin
            read(a[i,j,0]);
            for k:=1 to a[i,j,0]do
              read(a[i,j,k]);
          end;
    end;
  fillchar(f,sizeof(f),43);
  flag:=f[0,0];
  f[0,1]:=0;
  for i:=1 to m do
  for j:=1 to n do
  for k:=1 to n do
    if(j<>k)and(a[k,j,(i-1)mod a[k,j,0]+1]>0)then
      f[i,j]:=fmin(f[i,j],f[i-1,k]+a[k,j,(i-1)mod a[k,j,0]+1]);
  if f[m,n]<flag then
    writeln(f[m,n])
  else writeln('0!');
  close(input);close(output);
end.