var map:array[0..1001,0..1001]of boolean;
    stack,belong,int,minl,ind:array[0..1001]of integer;
    ins,done:array[0..1001]of boolean;
    i,j,n,k,ans,top:longint;
function fmin(a,b:longint):longint;
begin
  if a>b then exit(b)else exit(a);
end;
procedure tarjan(x:integer);
var i:integer;
begin
  inc(top);stack[top]:=x;done[x]:=true;
  ins[x]:=true;int[x]:=top;minl[x]:=top;
  for i:=1 to n do
    if map[x,i]then
      begin
        if done[i]=false then
          begin
            tarjan(i);
            minl[x]:=fmin(minl[x],minl[i]);
          end
        else
          if ins[i]then
            minl[x]:=fmin(minl[x],int[i]);
      end;
  if int[x]=minl[x]then
    begin
      while top<>int[x]do
        begin
          belong[stack[top]]:=x;
          ins[stack[top]]:=false;
          dec(top);
        end;
      belong[x]:=x;ins[x]:=false;dec(top);
    end;
end;
begin
  assign(input,'news.in');reset(input);
  assign(output,'news.out');rewrite(output);
  readln(n);
  for i:=1 to n do
  for j:=1 to n do
    begin
      read(k);
      if k=1 then
       map[i,j]:=true;
    end;
  for i:=1 to n do
    map[i,i]:=false;
  for i:=1 to n do
    if done[i]=false then
      tarjan(i);
  for i:=1 to n do
  for j:=1 to n do
    if(map[i,j])and(belong[i]<>belong[j])then
      inc(ind[belong[j]]);
  for i:=1 to n do
    if(belong[i]=i)and(ind[i]=0)then
      inc(ans);
  writeln(ans);
  close(input);close(output);
end.