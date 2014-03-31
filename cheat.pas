var n,i,x,j,y:longint;
    a:array[0..18]of longint;
    c:array[0..18,0..18]of longint;
    ans,tot:int64;
    l1,l2:array[0..10]of longint;
procedure dfs(x,y,opt:longint);
var k1,k2,i,j,p1,p2:longint;
begin
  if y>n then
    begin
      if x=n then
        begin
          inc(ans);
          exit;
        end;
      x:=x+1;y:=1;
      opt:=1<<n-1;
    end;
  k1:=opt and l1[y];
  i:=k1;
  while i>0 do
    begin
      p1:=(not i+1)and i;i:=i-p1;
      l1[y]:=l1[y]xor p1;
      dfs(x,y+1,opt xor p1);
      l1[y]:=l1[y]or p1;
    end;
end;
begin
  assign(input,'input.txt');reset(input);
  assign(output,'output.txt');rewrite(output);
  readln(n);
  if n<=1 then
    begin
      writeln(n);
      close(output);halt;
    end;
  for i:=1 to n do
    l1[i]:=1<<n-1;
  x:=1<<n-1;
  for i:=1 to n do
  begin
    j:=(not x+1)and x;x:=x-j;
    l1[i]:=l1[i]xor j;
  end;
  dfs(2,1,1<<n-1);
  for i:=2 to n do
    ans:=ans*i;
  writeln(ans*ans);
  close(input);close(output);
end.