const maxn=1000001;
var a,b,h:array[0..maxn]of longint;
    time:array[0..maxn]of real;
    i,j,n,m,k1,k2,k,op,c:longint;
procedure up(j:longint);
var i,t:longint;
begin
  i:=j>>1;t:=h[j];
  while i>0 do
    begin
      if time[t]<time[h[i]]then
        begin
         h[j]:=h[i];j:=i;i:=j>>1;
        end
      else break;
    end;
  h[j]:=t;
end;
procedure down(i:longint);
var j,t:longint;
begin
  j:=i<<1;t:=h[i];
  while j<=k do
    begin
      if(j+1<=k)and(time[h[j+1]]<time[h[j]])then
        j:=j+1;
      if time[t]>time[h[j]]then
        begin
          h[i]:=h[j];i:=j;j:=i<<1;
        end
      else break;
    end;
  h[i]:=t;
end;
begin
  assign(input,'car.in');reset(input);
  assign(output,'car.out');rewrite(output);
  readln(n,m,k1);
  k2:=k1;
  k:=0;
  for i:=1 to n do
    begin
      readln(a[i],b[i],c);
      if b[i]=1 then
        begin
          time[i]:=(m-c)/a[i];
          inc(k);h[k]:=i;up(k);
        end
      else
        begin
          time[i]:=c/a[i];
          inc(k);h[k]:=i;up(k);
        end;
    end;
  while k>0 do
    begin
      op:=h[1];
      if b[op]=1 then
        begin
          if k1>0 then
            begin
              time[op]:=time[op]+m/a[op];
              b[op]:=-1;
              down(1);
              dec(k1);
            end
          else
            begin
              h[1]:=h[k];dec(k);
              down(1);
            end;
        end
      else
        begin
          if k2>0 then
            begin
              time[op]:=time[op]+m/a[op];
              b[op]:=1;
              down(1);
              dec(k2);
            end
          else
            begin
              h[1]:=h[k];dec(k);
              down(1);
            end;
        end;
    end;
  writeln(time[op]:0:2);
  close(input);close(output);
end.