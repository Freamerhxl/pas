const maxn=1000001;
var a:array[0..31]of longint;
    f,h:array[0..maxn]of longint;
    n,m,i,j,k,ans:longint;
function hash(n:longint):longint;
var i:longint;
begin
  i:=n mod maxn;
  while(h[i]>=0)and(h[i]<>n)do i:=(i+1)mod maxn;
  exit(i);
end;
procedure dfs1(x,w,now:longint);
var j:longint;
begin
  if w>m then exit;
  if now>=ans then exit;
  if w=m then
    begin
      if now<ans then ans:=now;
      exit;
    end;
  j:=hash(w);
  h[j]:=w;
  if now<f[j]then f[j]:=now;
  if x>k then exit;
  dfs1(x+1,w+a[x],now+1);
  dfs1(x+1,w,now);
end;
procedure dfs2(x,w,now:longint);
var j:longint;
begin
  if w>m then exit;
  if now>=ans then exit;
  if w=m then
    begin
      if now<ans then ans:=now;
      exit;
    end;
  j:=hash(m-w);
  if(f[j]+now<ans)then ans:=f[j]+now;
  if x>n then exit;
  dfs2(x+1,w+a[x],now+1);
  dfs2(x+1,w,now);
end;

begin
  assign(input,'data.in');reset(input);
  assign(output,'data.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
    read(a[i]);
  for i:=1 to n-1 do
  for j:=1 to n-i do
    if a[j]<a[j+1]then
      begin
        a[j]:=a[j]xor a[j+1];
        a[j+1]:=a[j]xor a[j+1];
        a[j]:=a[j]xor a[j+1];
      end;
  k:=n>>1;
  fillchar(f,sizeof(f),43);
  fillchar(h,sizeof(h),$f7);
  ans:=maxlongint;
  dfs1(1,0,0);
  dfs2(k+1,0,0);
  writeln(ans);
  close(input);close(output);
end.