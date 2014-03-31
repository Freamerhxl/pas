var f:array[0..2001,0..2001]of longint;
    i,j,n,p,k,ans:longint;
function fmin(a,b:longint):longint;
begin
  if a<b then exit(a)else exit(b);
end;
procedure  go(x,top:longint);
begin
  if(x>n)then
    begin
      inc(ans);
    end
  else
    begin
      if top<p then
        go(x+1,top+1);
      if top>0 then
        go(x,top-1);
    end;
end;
begin
  assign(input,'subway.in');reset(input);
  assign(output,'subway.out');rewrite(output);
  readln(n,p);
{  go(1,0);
  writeln(ans mod 4096);     }
  if p=1 then
    begin
      writeln(1);
      close(output);
      exit;
    end;
  f[1,0]:=1;f[1,1]:=1;
  for i:=2 to n do
    begin
      f[i,1]:=f[i-1,0];
      k:=fmin(i,p);
      for j:=k-1 to fmin(i-1,p)do
        f[i,k]:=(f[i,k]+f[i-1,j])mod 40960;
      for j:=k-1 downto 2 do
        f[i,j]:=(f[i,j+1]+f[i-1,j-1])mod 40960;
      for j:=1 to k do
        f[i,0]:=(f[i,0]+f[i,j])mod 40960;
    end;
  writeln(f[n,0]mod 4096);
  close(input);close(output);
end.