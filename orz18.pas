const p=1000000007;
var f:array[0..1,-1..10001]of int64;
    i,j,n,m,k,now,last,kk:longint;
    done:array[0..1001]of boolean;
    ans:int64;
function mi(x:int64):int64;
var t:int64;
begin
  if x=1 then exit(2);
  if x=0 then exit(1);
  t:=mi(x>>1)mod(2*p);
  t:=(t*t)mod(2*p);
  if odd(x)then t:=(t*2)mod(2*p);
  exit(t);
end;
begin
  assign(input,'orz.in');reset(input);
  assign(output,'orz.out');rewrite(output);
  readln(n,m);
  if n=0 then write(0)
  else
  begin
  f[0,0]:=1;
  now:=0;last:=1;k:=1;
  for i:=1 to n do
    begin
      now:=1-now;last:=1-last;
      if k>m then k:=m;
      for j:=0 to k do
        begin
          kk:=j-i;
          if kk<0 then kk:=-1;
            f[now,j]:=f[now,j-1]+f[last,j]-f[last,kk];
          while f[now,j]>p do f[now,j]:=int64(f[now,j]-int64(p));
          while f[now,j]<0 do f[now,j]:=int64(f[now,j]+int64(p));
        end;
      k:=k+i;
    end;
  end;
  ans:=mi(f[now,m]);
  writeln(ans mod p);
  close(input);close(output);
end.