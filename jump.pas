var sum,q,f:array[0..2000001]of longint;
    i,j,n,t,w,m:longint;
begin
  assign(input,'jump.in');reset(input);
  assign(output,'jump.out');rewrite(output);
  readln(n,m);
  f[0]:=m;
  t:=1;w:=1;
  q[1]:=0;
  for i:=1 to n do
    begin
      read(sum[i]);sum[i]:=sum[i-1]+sum[i];
      while(f[q[t]]<i*100)do inc(t);
      f[i]:=f[q[t]]+sum[i]-sum[q[t]]-i*100;
      while(f[i]-sum[i]>f[q[w]]-sum[q[w]])and(w>=t)do dec(w);
      inc(w);q[w]:=i;
    end;
  writeln(f[n]);
  close(input);close(output);
end.