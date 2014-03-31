var ans:qword;
    a,w,k,b,q,p:longint;
procedure dfs(a,k,b,p,i:longint);
begin
  if a<1 then
    begin
      inc(ans);exit;
    end;
  if k>=100 then
    begin
    b:=b-15;k:=k-100;
    end
  else
    begin
      b:=b-w;
      k:=k+10;
    end;
  if b<1 then exit;
  if p>=100 then
    dfs(a-25,k,b,p-100,i+1)
  else
    if i>4 then
      dfs(a,k,b,p+20,0)
  else
    begin
      dfs(a-q,k,b,p,i+1);
      dfs(a,k,b,p+20,0);
    end;
end;
begin
  assign(input,'wisdom.in');reset(input);
  assign(output,'wisdom.out');rewrite(output);
  readln(a,w,k);readln(b,q,p);
  dfs(a,k,b,p,0);
  if ans>0 then
    writeln(ans)
  else
    writeln('No answer');
  close(input);close(output);
end.
