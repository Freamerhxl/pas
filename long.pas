var a:array[0..201,0..201]of int64;
    b,c,d:array[0..201]of int64;
    i,j,n,m,k,p,ans,l,r:longint;
    flag:boolean;
    data:int64;
procedure sort(t,w:longint);
var i,j:longint;k:int64;
begin
  i:=t;j:=w;k:=c[(t+w)>>1];
  repeat
    while(c[i]>k)do inc(i);
    while(c[j]<k)do dec(j);
    if i<=j then
      begin
        c[0]:=c[i];c[i]:=c[j];c[j]:=c[0];
        d[0]:=d[i];d[i]:=d[j];d[j]:=d[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'long.in');reset(input);
  assign(output,'long.out');rewrite(output);
  readln(n,m);
  for i:=1 to n do
  for j:=1 to m do
    begin
      read(data);
      a[i,j]:=a[i-1,j]+data;
    end;
  for i:=1 to n do
  for j:=i to n do
    begin
      for k:=1 to m do
        begin
          b[k]:=b[k-1]+a[j,k]-a[i-1,k];
          c[k]:=b[k];d[k]:=k;
        end;
      sort(1,m);
      r:=1;
      for l:=0 to m-1 do
        begin
          while(c[r]-b[l]>0)and(r<=m)do
            begin
              if(d[r]>l)and((j-i+1)*(d[r]-l)>ans)then
                ans:=(j-i+1)*(d[r]-l);
              inc(r);
            end;
        end;
    end;
  writeln(ans);
  close(input);close(output);
end.