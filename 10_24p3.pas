var f:array[0..15,0..50,0..50]of longint;
    da:array[0..15]of longint;
    p:array[0..50]of longint;
    i,j,n,m,c,pp,a,b,ans,max,min:longint;
function fmax(a,b:longint):longint;
begin
  if a>b then exit(a)
  else exit(b);
end;
function fmin(a,b:longint):longint;
begin
  if a<b then exit(a)
  else exit(b);
end;
begin
  readln(n,c);
  for i:=1to n do
    read(da[i]);
  for i:=0 to c do read(p[i]);
  if n=1 then
  begin
    writeln(p[da[1]]);halt;
  end;
  fillchar(f,sizeof(f),$f7);
  f[2,fmin(da[1],da[2]),fmax(da[1],da[2])]:=p[da[1]]+p[da[2]];
  a:=da[1]+da[2];if a>c then a:=c;
  b:=da[1]+da[2]-a;
  f[2,fmin(a,b),fmax(a,b)]:=da[a]+da[b];
  for pp:=3 to n do
  for i:=0 to c do
  for j:=i to c do
    if f[pp-1,i,j]>=0 then
      begin
        a:=da[pp]+i;if a>c then a:=c;b:=da[pp]+i-a;
        max:=fmax(a,b);min:=a+b-max;
        if f[pp-1,i,j]-p[i]+p[a]+p[b]>f[pp,min,max]then
          f[pp,min,max]:=f[pp-1,i,j]-p[i]+p[a]+p[b];
        max:=fmax(a,j);min:=a+j-max;
        if f[pp-1,i,j]-p[i]+p[a]+p[b]>f[pp,min,max]then
          f[pp,min,max]:=f[pp-1,i,j]-p[i]+p[a]+p[b];
        max:=fmax(j,b);min:=j+b-max;
        if f[pp-1,i,j]-p[i]+p[a]+p[b]>f[pp,min,max]then
          f[pp,min,max]:=f[pp-1,i,j]-p[i]+p[a]+p[b];

        a:=da[pp]+j;if a>c then a:=c;b:=da[pp]+j-a;
        max:=fmax(a,b);min:=a+b-max;
        if f[pp-1,i,j]-p[i]+p[a]+p[b]>f[pp,min,max]then
          f[pp,min,max]:=f[pp-1,i,j]-p[j]+p[a]+p[b];
        max:=fmax(a,i);min:=a+i-max;
        if f[pp-1,i,j]-p[i]+p[a]+p[b]>f[pp,min,max]then
          f[pp,min,max]:=f[pp-1,i,j]-p[j]+p[a]+p[b];
        max:=fmax(i,b);min:=i+b-max;
        if f[pp-1,i,j]-p[i]+p[a]+p[b]>f[pp,min,max]then
          f[pp,min,max]:=f[pp-1,i,j]-p[j]+p[a]+p[b];

        if f[pp-1,i,j]+p[da[pp]]>f[pp,i,j]then
          f[pp,i,j]:=f[pp-1,i,j]+p[da[pp]];
        min:=fmin(da[pp],i);max:=da[pp]+i-min;
        if f[pp-1,i,j]+p[da[pp]]>f[pp,min,max]then
          f[pp,min,max]:=f[pp-1,i,j]+p[da[pp]];
        min:=fmin(da[pp],j);max:=da[pp]+j-min;
        if f[pp-1,i,j]+p[da[pp]]>f[pp,min,max]then
          f[pp,min,max]:=f[pp-1,i,j]+p[da[pp]];
      end;
  for i:=0 to c do
  for j:=i to c do
    if f[n,i,j]>ans then
      ans:=f[n,i,j];
  writeln(ans);
end.