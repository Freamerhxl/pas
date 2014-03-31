var f:array[0..101,0..1]of longint;
    a,b,c:array[0..101]of longint;
    i,j,k,n:longint;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
begin
  assign(input,'a.in');reset(input);
  assign(output,'a.out');rewrite(output);
  readln(n);
  for i:=1 to n do
    readln(a[i],b[i],c[i]);
  for i:=2 to n do
    begin
     a[i]:=a[i-1]+a[i];
     b[i]:=b[i-1]+b[i];
    end;
  fillchar(f,sizeof(f),43);
  f[0,1]:=0;
  for i:=1 to n do
  for j:=0 to i-1 do
    begin
      f[i,0]:=fmin(f[i,0],fmin(f[j,0],f[j,1]+c[j+1])+a[i]-a[j]);
      f[i,1]:=fmin(f[i,1],fmin(f[j,1],f[j,0]+c[j+1])+b[i]-b[j]);
    end;
  writeln(fmin(f[n,0],f[n,1]));
  close(input);close(output);
end.