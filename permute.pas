var n,i,x,j,y:longint;
    a:array[0..18]of longint;
    op:array[0..1024]of integer;
    ans,tot:int64;
    l1,l2,l:array[0..10]of longint;
procedure dfs(x,y,opt1,opt2:longint);
var k1,k2,i,j,p1,p2:longint;
begin
  if y>n then
    begin
      if x=n-1 then
        begin
          inc(ans);
          exit;
        end;
      x:=x+1;y:=1;
      opt1:=1<<n-1;opt2:=1<<n-1;
    end;
  k1:=opt1 and l1[y];
  i:=k1;
  while i>0 do
    begin
      p1:=(not i+1)and i;i:=i-p1;k2:=op[p1];
      j:=opt2 and l2[y]and l[k2];
      l1[y]:=l1[y]xor p1;
      while j>0 do
        begin
          p2:=(not j+1)and j;j:=j-p2;
          l2[y]:=l2[y]xor p2;
          l[k2]:=l[k2]xor p2;
          dfs(x,y+1,opt1 xor p1,opt2 xor p2);
          l2[y]:=l2[y]or p2;
          l[k2]:=l[k2]or p2;
        end;
      l1[y]:=l1[y]xor p1;
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
    begin
      l[i]:=(1<<n-1)xor(1<<(i-1));
      l1[i]:=(1<<n-1)xor(1<<(i-1));
      l2[i]:=(1<<n-1)xor(1<<(i-1));
    end;
  for i:=1 to n do
    op[1<<(i-1)]:=i;
  dfs(2,1,1<<n-1,1<<n-1);
  for i:=1 to n do
    ans:=ans*i*i;
  writeln(ans);
  close(input);close(output);
end.