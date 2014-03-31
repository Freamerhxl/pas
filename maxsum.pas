var f,a:array[0..1001]of longint;
    i,j,n:longint;
    ans:longint;
function fmax(a,b:longint):longint;
begin
  if a>b then exit(a)else exit(b);
end;
begin
  assign(input,'maxsum.in');reset(input);
  assign(output,'maxsum.out');rewrite(output);
  readln(n);
  for i:=1 to 1000 do
  for j:=1 to i-1 do
  if i mod j=0 then
    inc(a[i],j);
  fillchar(f,sizeof(f),$f7);
  f[0]:=0;
  for i:=1 to n do
  if a[i]>0 then
  for j:=n downto i do
    if f[j-i]>=0 then
      f[j]:=fmax(f[j],f[j-i]+a[i]);
  for i:=0 to n do
    if f[i]>ans then ans:=f[i];
  writeln(ans);
  close(input);close(output);
end.