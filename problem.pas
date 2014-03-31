var z,cost:array[0..100001]of longint;
    done:array[0..100001]of boolean;
    path:array[0..400001,1..3]of longint;
    p:array[0..100001]of longint;
    a,b,c:array[0..10]of longint;
    i,j,n,m,l,r,ans,flag,tempcost,maxl,k,kk,tempnum,op,x,y:longint;
function get(x:longint):longint;
begin
  if p[x]=x then exit(x);
  p[x]:=get(p[x]);
  exit(p[x]);
end;
procedure sort(t,w:longint);
var i,j,k:longint;
begin
  k:=path[(t+w)>>1,3];
  i:=t;j:=w;
  repeat
    while(path[i,3]<k)do inc(i);
    while(path[j,3]>k)do dec(j);
    if i<=j then
      begin
        path[0]:=path[i];path[i]:=path[j];path[j]:=path[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'problem.in');reset(input);
  assign(output,'problem.out');rewrite(output);
  readln(n);
  fillchar(cost,sizeof(cost),43);
  flag:=cost[0];
  c[1]:=1;
  for i:=2 to 10 do
    c[i]:=c[i-1]*10;
  for i:=0 to n-1 do
    begin
      read(z[i]);
      done[z[i]]:=true;
      cost[z[i]]:=0;
      if i>0 then
      begin
      inc(op);path[op,1]:=z[i-1];path[op,2]:=z[i];path[op,3]:=0;
      end;
      m:=z[i];j:=0;
      while m>0 do
        begin
          inc(j);m:=m div 10;
        end;
      if j>maxl then maxl:=j;
    end;
  l:=0;r:=n;
  repeat
    m:=z[l];k:=0;
    while m>0 do
      begin
        inc(k);a[k]:=m mod 10;m:=m div 10;
      end;
    for i:=1 to k-1 do
    for j:=i+1 to k do
    if(a[i]<>a[j])then
      begin
        tempcost:=((a[i]and a[j])+(a[i]xor a[j]))*2;
        tempnum:=z[l]-a[i]*c[i]+a[i]*c[j]-a[j]*c[j]+a[j]*c[i];
        if tempcost<cost[tempnum]then
          cost[tempnum]:=tempcost;
        inc(op);path[op,1]:=z[l];path[op,2]:=tempnum;path[op,3]:=tempcost;
        if done[tempnum]=false then
          begin
            done[tempnum]:=true;
            z[r]:=tempnum;
            inc(r);if r>100000 then r:=0;
          end;
      end;
    if k>1 then
      begin
        for i:=1 to k do
          if(a[i]<=a[(i+k-2)mod k+1])and(a[i]>=a[(i mod k)+1])then
            begin
              tempcost:=a[i]+(a[(i+k-2)mod k+1]and a[(i mod k)+1])+(a[(i+k-2)mod k+1]xor a[(i mod k)+1]);
              tempnum:=(z[l]div c[i+1])*c[i]+(z[l]mod c[i]);
              if tempcost<cost[tempnum]then
                cost[tempnum]:=tempcost;
              inc(op);path[op,1]:=z[l];path[op,2]:=tempnum;path[op,3]:=tempcost;
              if done[tempnum]=false then
                begin
                  done[tempnum]:=true;
                  z[r]:=tempnum;
                  inc(r);if r>100000 then r:=0;
                end;
            end;
      end;
    if k<maxl then
      begin
        for i:=0 to k do
        for j:=a[(i mod k)+1] to a[(i+k-1)mod k+1] do
          begin
            tempcost:=j+(a[(i+k-1)mod k+1]and a[(i mod k)+1])+(a[(i+k-1)mod k+1]xor a[(i mod k)+1]);
            tempnum:=((z[l]div c[i+1])*c[i+2]+j*c[i+1])+(z[l]mod c[i+1]);
            if tempcost<cost[tempnum]then
              cost[tempnum]:=tempcost;
            inc(op);path[op,1]:=z[l];path[op,2]:=tempnum;path[op,3]:=tempcost;
            if done[tempnum]=false then
              begin
                done[tempnum]:=true;
                z[r]:=tempnum;
                inc(r);if r>100000 then r:=0;
              end;
          end;
      end;
    inc(l);if l>100000 then l:=0;
  until l=r;
  sort(1,op);
  for i:=1 to 100000 do
    p[i]:=i;
  for i:=1 to op do
    begin
      x:=get(path[i,1]);y:=get(path[i,2]);
      if x<>y then
        begin
          ans:=ans+path[i,3];
          p[y]:=x;
        end;
    end;
  writeln(ans);
  close(input);close(output);
end.