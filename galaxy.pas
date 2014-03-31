var pa:array[0..20001,1..3]of longint;
    b,e,c,d,q:array[0..1001]of longint;
    inq:array[0..1001]of boolean;
    i,j,n,m,x,y,c1,c2,k:longint;
procedure SPFA;
var t,s,i:longint;
begin
  fillchar(c,sizeof(c),0);
  fillchar(d,sizeof(d),43);
  fillchar(inq,sizeof(inq),false);
  d[1]:=0;q[0]:=1;inq[1]:=true;
  s:=1;c[1]:=1;t:=0;
  repeat
    for i:=b[q[t]]to e[q[t]]do
      begin
        if(d[q[t]]+pa[i,3]<d[pa[i,2]])and(c[pa[i,2]]<=2*n)then
          begin
            d[pa[i,2]]:=d[q[t]]+pa[i,3];inc(c[pa[i,2]]);
            if inq[pa[i,2]]=false then
              begin
                inq[pa[i,2]]:=true;
                q[s]:=pa[i,2];s:=(s+1)mod 1001;
              end;
          end;
      end;
    inq[q[t]]:=false;
    t:=(t+1)mod 1001;
  until t=s;
  if(d[n]<d[0])and(c[n]<=n)then
    writeln(d[n])
  else
  writeln('No such path');
end;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  i:=t;j:=w;k:=pa[(t+w)>>1,1];
  repeat
    while pa[i,1]<k do inc(i);
    while pa[j,1]>k do dec(j);
    if i<=j then
      begin
        pa[0]:=pa[i];pa[i]:=pa[j];pa[j]:=pa[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'galaxy.in');reset(input);
  assign(output,'galaxy.out');rewrite(output);
  readln(n,k);
  while n<>0 do
    begin
      m:=0;
      for i:=1 to k do
        begin
          readln(x,y,c1,c2);
          inc(m);pa[m,1]:=x;pa[m,2]:=y;pa[m,3]:=c1;
          inc(m);pa[m,1]:=y;pa[m,2]:=x;pa[m,3]:=c2;
        end;
      sort(1,m);
      fillchar(b,sizeof(b),0);
      fillchar(e,sizeof(e),0);
      for i:=1 to m do
        begin
          e[pa[i,1]]:=i;
          if b[pa[i,1]]=0 then b[pa[i,1]]:=i;
        end;
      SPFA;
      readln(n,k);
    end;
  close(input);close(output);
end.