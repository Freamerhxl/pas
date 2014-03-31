var t,c,na:array[0..65]of qword;
    co,id:array[0..65]of longint;
    cc:array[0..65,0..65]of longint;
    a:array[0..65]of integer;
    i,j,n,m,k,ans:longint;
procedure dfs(ii,nowa:longint;now:qword);
var i:longint;
    k:qword;
begin
  if nowa>=ans then exit;
  if  ii>m then
    begin
      ans:=nowa;
      exit;
    end;
  if now and t[ii]>0 then
    dfs(ii+1,nowa,now)
  else
    begin
      for i:=1 to cc[ii,0]do
        begin
        k:=now or c[cc[ii,i]];
        dfs(ii+1,nowa+1,k);
        end;
    end;
end;
begin
  assign(input,'solve.in');reset(input);
  assign(output,'solve.out');rewrite(output);
  t[1]:=1;
  for i:=2 to 62 do
    t[i]:=t[i-1]*2;
  readln(m,n);
  for i:=1 to m do
    id[i]:=i;
  for i:=1 to n do
    begin
      read(a[i]);
      for j:=1 to a[i]do
        begin
          read(k);
          inc(co[k]);
          inc(cc[k,0]);cc[k,cc[k,0]]:=i;
        end;
    end;
  for i:=1 to m-1 do
  for j:=1 to m-i do
    if co[j]>co[j+1]then
      begin
        co[j]:=co[j]xor co[j+1];
        co[j+1]:=co[j]xor co[j+1];
        co[j]:=co[j]xor co[j+1];

        id[j]:=id[j]xor id[j+1];
        id[j+1]:=id[j]xor id[j+1];
        id[j]:=id[j]xor id[j+1];

        cc[0]:=cc[j];cc[j]:=cc[j+1];cc[j+1]:=cc[0];
      end;
  ans:=n+1;
  for i:=1 to m do
  for j:=1 to cc[i,0]do
    c[cc[i,j]]:=c[cc[i,j]]or t[i];
  dfs(1,0,0);
  writeln(ans);
  close(input);close(output);
end.