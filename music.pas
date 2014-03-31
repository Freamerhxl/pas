var l,co:array[0..16]of longint;
    sum:array[0..21]of longint;
    a:array[0..16,1..2]of longint;
    can:array[0..17,0..17]of boolean;
    ok:array[0..1000]of boolean;
    n,m,i,j,p,d,td,ans,zs,fz,fm:longint;
    st,ss:ansistring;
    k:extended;
procedure dfs(x,now:longint);
var i:longint;
    st:string;
begin
  if now>ans then
    begin
      ans:=now;
    end;
  for i:=1 to n do
    if(can[x,i])and(co[i]<2)then
      begin
        inc(co[i]);
        str(i,st);
        dfs(i,now+l[i]);
        dec(co[i]);
      end;
end;
function gcd(a,b:longint):longint;
begin
  if b=0 then exit(a)
  else exit(gcd(b,a mod b));
end;
begin
  assign(input,'music.in');reset(input);
  assign(output,'music.out');rewrite(output);
  readln(n);
  sum[1]:=0;
  for i:=2 to 21 do
    begin
      if i in[4,8,11,15,18]then
        sum[i]:=sum[i-1]+5
      else sum[i]:=sum[i-1]+10;
    end;
  for i:=1 to n do
    begin
      readln(st);ss:='';
      st:=st+' ';p:=0;
      for j:=1 to length(st)do
        begin
          if st[j]<>' ' then
            ss:=ss+st[j]
          else
            begin
              if pos('e',ss)>0 then inc(l[i],1);
              if pos('f',ss)>0 then inc(l[i],2);
              if pos('t',ss)>0 then inc(l[i],4);
              if pos('o',ss)>0 then inc(l[i],8);
              delete(ss,pos('e',ss),1);
              delete(ss,pos('f',ss),1);
              delete(ss,pos('t',ss),1);
              delete(ss,pos('o',ss),1);
              if pos('0',ss)=0 then
                begin
                  inc(p);
                  d:=0;td:=0;
                  if pos('b',ss)>0 then td:=-5
                  else if pos('#',ss)>0 then td:=5;
                  delete(ss,pos('b',ss),1);
                  delete(ss,pos('#',ss),1);
                  if ss[1]='-' then
                    d:=sum[ord(ss[2])-ord('0')]
                  else
                  if ss[1]='+' then
                    d:=sum[14+ord(ss[2])-ord('0')]
                  else d:=sum[7+ord(ss[1])-ord('0')];
                  a[i,2]:=d+td;
                  if p=1 then a[i,1]:=d+td;
                end;
              ss:='';
            end;
        end;
    end;
  readln(m);
  for i:=1 to m do
    begin
      readln(k);
      ok[round(k*10)]:=true;
    end;
  for i:=1 to n do
  for j:=1 to n do
    can[i,j]:=ok[abs(a[j,1]-a[i,2])];
  for i:=1 to n do
    can[0,i]:=true;
  dfs(0,0);
  zs:=ans div 8;
  fm:=8;fz:=ans mod 8;
  p:=gcd(fm,fz);
  if zs>0 then write(zs,' ');
  fz:=fz div p;fm:=fm div p;
  if fz>0 then
  writeln(fz,'/',fm);
  close(input);close(output);
end.