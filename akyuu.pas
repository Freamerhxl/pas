program Iambj11;
var a:array[0..61,'A'..'Z']of integer;
    map:array[0..61]of int64;
    t:array[0..62]of int64;
    count:array[0..61]of longint;
    done:array[0..61]of boolean;
    i,j,n,m,k,ans:longint;
    st:ansistring;
    ch:char;
procedure dfs(now:longint;opt:int64);
var i,j:int64;
    k,tt,w:longint;
begin
  if now>ans then ans:=now;
  i:=opt;
  while i>0 do
    begin
      j:=(not i+1)and i;i:=i-j;k:=round(ln(j)/ln(2))+1;
   {   tt:=1;w:=m;
      k:=(tt+w)>>1;
      repeat
        if t[k]>j then
          w:=k-1
        else
          begin
            if t[k]=j then break;
            tt:=k+1;
          end;
        k:=(tt+w)>>1;
      until tt>w; }
      dfs(now+1,opt xor(opt and map[k]));
    end;
end;
begin
  assign(input,'akyuu.in');reset(input);
  assign(output,'akyuu.out');rewrite(output);
  readln(n,m);
  for i:=1 to m do
    begin
      readln(st);
      for j:=1 to length(st)do
        begin
          read(k);
          a[i,st[j]]:=k;
        end;
      readln;
    end;
  t[1]:=1;
  for i:=2 to m+1 do
    t[i]:=t[i-1]*2;
  for i:=1 to m-1 do
  for j:=i+1 to m do
    begin
      for ch:='A'to'Z' do
        if(a[i,ch]>0)and(a[j,ch]>0)and(a[i,ch]<>a[j,ch])then
          begin
            map[i]:=map[i]or t[j];
            map[j]:=map[j]or t[i];
            break;
          end;
    end;
  for i:=1 to m do
    map[i]:=map[i]or t[i];
  dfs(0,t[m+1]-1);
  writeln(ans);
  close(input);close(output);
end.
