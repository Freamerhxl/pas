const maxn=1000001;
var count,q:array[0..maxn]of longint;
    i,j,t,w,m,now,ans1,ans2,n:longint;
begin
  readln(n,m);
  t:=1;ans1:=0;ans2:=0;
  for i:=1 to n do
    begin
      readln(q[i]);
      if count[q[i]]=0 then inc(now);
      inc(count[q[i]]);
      while(i-t+1>m)or(count[q[t]]>1)do
      begin
        if count[q[t]]=1 then dec(now);
        dec(count[q[t]]);
        inc(t);
      end;
      if now>ans1 then
        begin
          ans1:=now;ans2:=i-t+1;
        end
      else if(now=ans1)and(i-t+1<ans2)then
        ans2:=i-t+1;
    end;
  writeln(ans1,' ',ans2);
end.
