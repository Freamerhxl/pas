var f:array[0..1011,0..1011]of longint;
    a:array[0..2011]of longint;
    i,j,n,k:longint;
function fmax(a,b:longint):longint;
begin
  if a>b then exit(a)else exit(b);
end;
begin
  assign(input,'coin.in');reset(input);
  readln(n);
  for i:=1 to n do
    begin
      read(a[i]);
    end;
  for i:=2 to n do
    a[i]:=a[i-1]+a[i];
  fillchar(f,sizeof(f),$f7);
  f[n,1]:=a[n]-a[n-1];
  for i:=n-1 downto 1 do
  begin
  for j:=1 to n-i do
  for k:=1 to 2*j do
  if f[i+j,k]>0 then
    f[i,j]:=fmax(f[i,j],a[n]-a[i-1]-f[i+j,k]);
  f[i,n-i+1]:=a[n]-a[i-1];
  end;
{  for i:=n downto 1 do
  for j:=1 to n do
    begin
      f[i,j]:=fmax(f[i,j],f[i,j-1]);
      f[i,j]:=fmax(f[i,j],a[n]-a[i-1]-f[i+j,j*2]);
    end;      }
  writeln(fmax(f[1,1],f[1,2]));
end.