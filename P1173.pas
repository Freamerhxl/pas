var can,c:array[0..50000]of longint;
    p:array[0..6000]of longint;
    i,j,n,m,k,ans,op,lp:longint;
procedure dfs(x,now,k,pp:longint);
var num:int64;
begin
  if now<>1 then begin inc(m);can[m]:=now;c[m]:=pp;end;
  if x>9 then exit;
  if pp>ans then
    begin
      ans:=pp;
      op:=now;
    end;
  num:=now*int64(p[x])
  ;
  if num<=n then
    begin
      dfs(x,now*p[x],k+1,pp);
    end;
  if k>0 then
    begin
      dfs(x+1,now,0,pp*(k+1))
    end;
end;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;
  k:=can[(t+w)>>1];
  repeat
    while can[i]<k do inc(i);
    while can[j]>k do dec(j);
    if i<=j then
      begin
        can[0]:=can[i];can[i]:=can[j];can[j]:=can[0];
        c[0]:=c[i];c[i]:=c[j];c[j]:=c[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then  sort(t,j);
  if i<w then  sort(i,w);
end;
begin
  readln(n);
  p[1]:=2;p[2]:=3;p[3]:=5;p[4]:=7;p[5]:=11;p[6]:=13;p[7]:=17;p[8]:=19;p[9]:=23;
  dfs(1,1,0,1);
  sort(1,m);
  op:=1;ans:=1;
  for i:=1 to m do
    begin
      if c[i]>ans then
        begin
          op:=can[i];
          ans:=c[i];
        end;
    end;
  writeln(op);
end.