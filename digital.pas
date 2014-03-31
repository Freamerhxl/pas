const p=10000;
type arr=array[0..52]of longint;
var f:array[0..1,-1..600]of arr;
    i,j,k,r,m,n,now,last,kk:longint;
    ans:arr;
function add(a,b:arr):arr;
var l,i,j:longint;
begin
  fillchar(add,sizeof(add),0);
  if a[0]>b[0]then add[0]:=a[0]
    else add[0]:=b[0];
  for i:=1 to add[0]do
    begin
      add[i+1]:=add[i+1]+(add[i]+a[i]+b[i])div p;
      add[i]:=(add[i]+a[i]+b[i])mod p;
    end;
  while add[add[0]+1]>0 do
    inc(add[0]);
end;
begin
  assign(input,'digital.in');reset(input);
 assign(output,'digital.out');rewrite(output);
  readln(k,r);
  m:=1 shl k-1;
  n:=r div k;
  kk:=r mod k;
  if kk<>0 then
   begin
   inc(n);
   kk:=1 shl kk-1;
   end
    else kk:=m;
  if n>1 then
    begin
      for i:=m downto 0 do
        begin
          f[0,i,0]:=1;
          f[0,i,1]:=f[0,i+1,1]+1;
        end;
      for i:=2 to n-1 do
        begin
    //      if i-1>m then break;
          now:=1-now;last:=1-now;
     //     fillchar(f[now],sizeof(f[now]),0);
          for j:=m downto 1 do
            f[now,j]:=add(f[now,j+1],f[last,j+1]);
          ans:=add(f[now,1],ans);
        end;
   {   if n-1<=m then
      begin    }
      now:=1-now;last:=1-now;
      fillchar(f[now],sizeof(f[now]),0);
      for i:=kk downto 1 do
        f[now,i]:=add(f[now,i+1],f[last,i+1]);
      ans:=add(f[now,1],ans);
   {   end;    }
      write(ans[ans[0]]);
      for i:=ans[0]-1 downto 1 do
        begin
          if ans[i]<1000 then write(0);
          if ans[i]<100  then write(0);
          if ans[i]<10   then write(0);
          write(ans[i]);
        end;
      writeln;
    end
  else
    writeln(0);
  close(input);close(output);
end.