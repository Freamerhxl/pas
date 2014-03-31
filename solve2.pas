var t,c,na:array[0..65]of qword;
    a,co,next,pre:array[0..65]of integer;
    i,j,n,m,k,ans,kk:longint;
    be:qword;
procedure dfs(ii,nowa:longint;now:qword);
var i:longint;
    k:qword;
begin
  if nowa>=ans then exit;
  k:=now or na[ii];
  if k<t[m+1]-1 then exit;
  if now=t[m+1]-1 then
    begin
      ans:=nowa;
      exit;
    end;
  dfs(ii+1,nowa,now);
  if now or c[ii]<>now then
    dfs(ii+1,nowa+1,now or c[ii]);
end;
begin
  assign(input,'solve.in');reset(input);
//  assign(output,'solve.out');rewrite(output);
  t[1]:=1;
  for i:=2 to 62 do
    t[i]:=t[i-1]*2;
  readln(m,n);
  for i:=1 to n do
    begin
      read(a[i]);
      for j:=1 to a[i]do
        begin
          read(k);
          c[i]:=c[i]or t[k];
          inc(co[k]);
        end;
    end;
  for i:=1 to n-1 do
  for j:=1 to n-i do
    if a[j]<a[j+1]then
      begin
        a[j]:=a[j]xor a[j+1];
        a[j+1]:=a[j]xor a[j+1];
        a[j]:=a[j]xor a[j+1];
        c[j]:=c[j]xor c[j+1];
        c[j+1]:=c[j]xor c[j+1];
        c[j]:=c[j]xor c[j+1];
      end;
  k:=n;
  for i:=1 to n do
  for j:=i+1 to n do
    if c[i]and c[j]=c[i]then
      begin
        for kk:=j to n do
         c[kk]:=c[kk+1];
        dec(k);
      end;
  n:=k;
  k:=0;
  for i:=1 to m do
  if co[i]=1 then
  for j:=1 to n do
  if c[j]and t[i]>0 then
      begin
        c[0]:=c[j];
        for kk:=j downto 1 do
          c[kk]:=c[kk-1];
        inc(k);
        break;
      end;
  na[n]:=c[n];
  for i:=n-1 downto 1 do
    na[i]:=c[i]or na[i+1];
  ans:=n+1;
  be:=0;
  for i:=1 to k do
    be:=be or c[i];
  dfs(k+1,k,be);
  writeln(ans);
  close(input);close(output);
end.