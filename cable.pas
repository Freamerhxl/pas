var f:array[0..1,0..1,0..1]of extended;
    y1,y2:array[0..600001]of longint;
    i,j,x1,x2,n,m,nowi,lastj,k,nowj,lasti:longint;
    ans,temp:extended;
function dis(y1,y2:longint):extended;
begin
  exit(sqrt(sqr(int64(x1-x2))+sqr(int64(y1-y2))));
end;
function fmin(a,b:extended):extended;
begin
  if a<b then exit(a)else exit(b);
end;
begin
  assign(input,'cable.in');reset(input);
  assign(output,'cable.out');rewrite(output);
  readln(n,m,x1,x2);
  read(y1[1]);
  for i:=2 to n do
    begin
      read(k);y1[i]:=y1[i-1]+k;
    end;
  read(y2[1]);
  for i:=2 to m do
    begin
      read(k);y2[i]:=y2[i-1]+k;
    end;
  j:=1;
  f[1,1,1]:=dis(y1[1],y2[1]);
  for i:=1 to n do
    begin
      nowi:=1 and i;lasti:=1-nowi;
      if i>1 then
        begin
          nowj:=j and 1;lastj:=1-nowj;
          temp:=dis(y1[i],y2[j]);
          f[nowi,nowj,1]:=fmin(f[lasti,nowj,1]+fmin(temp,y1[i]-y1[i-1]),f[lasti,nowj,0]+y1[i]-y1[i-1]+temp);
          f[nowi,nowj,0]:=fmin(f[lasti,nowj,0]+y1[i]-y1[i-1],f[lasti,nowj,1]);
        end;
      while((y1[i]>=y2[j])or(i=n))and(j<m)do
        begin
          inc(j);nowj:=j and 1;lastj:=1-nowj;
          temp:=dis(y1[i],y2[j]);
          f[nowi,nowj,1]:=fmin(f[nowi,lastj,1]+fmin(temp,y2[j]-y2[j-1]),f[nowi,lastj,0]+y2[j]-y2[j-1]+temp);
          f[nowi,nowj,0]:=fmin(f[nowi,lastj,0]+y2[j]-y2[j-1],f[nowi,lastj,1]);
        end;
    end;
  writeln(f[n and 1,m and 1,1]:0:2);
  close(input);close(output);
end.