var v:array[0..30001]of longint;
    x:array[0..60001]of real;
    op,id:array[0..60001]of longint;
    i,j,xx,y,n,y0,m,r:longint;
    rr,yy:qword;
    ans,temp:int64;
procedure sort(t,w:longint);
var i,j,kk:longint;
    k:extended;
begin
  i:=t;j:=w;
  k:=x[(t+w)div 2];
  kk:=op[(t+w)div 2];
  repeat
    while(x[i]<k)or((x[i]=k)and(op[i]>kk))do inc(i);
    while(x[j]>k)or((x[j]=k)and(op[j]<kk))do dec(j);
    if i<=j then
      begin
        x[0]:=x[i];x[i]:=x[j];x[j]:=x[0];
        id[0]:=id[i];id[i]:=id[j];id[j]:=id[0];
        op[0]:=op[i];op[i]:=op[j];op[j]:=op[0];
        inc(i);dec(j);
      end;
  until i>j;
  if j>t then sort(t,j);
  if i<w then sort(i,w);
end;
begin
  assign(input,'input');reset(input);
  readln(n,r,y0);
  rr:=sqr(r);
  for i:=1 to n do
    begin
      readln(xx,y,v[i]);
      if abs(y-y0)<=r then
        begin
          inc(m);
          yy:=sqr(y-y0);
          x[m]:=xx-sqrt(rr-yy);
          id[m]:=i;
          op[m]:=1;
          inc(m);
          x[m]:=xx+sqrt(rr-yy);
          id[m]:=i;
          op[m]:=-1;
        end;
    end;
   sort(1,m);
   ans:=0;temp:=0;
   x[0]:=maxlongint;x[n+1]:=maxlongint;
   id[n+1]:=0;v[0]:=0;
   for i:=1 to n+1 do
     begin
       if op[i]=1 then
         temp:=temp+v[id[i]]
       else
         temp:=temp-v[id[i]];
       if x[i]<>x[i-1]then
         begin
           if temp>ans then ans:=temp;
         end;
     end;
   writeln(ans);
end.